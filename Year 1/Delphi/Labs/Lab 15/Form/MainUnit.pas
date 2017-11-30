unit MainUnit;

interface

uses
  // Підключаємо Math для функції DegToRad()
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, TeeProcs, Chart, Math;

type
  // Тип функцій, які будуть аналізуватись
  // Описуємо тип для того, щоб можна було передавати функції як параметри
  TFunc = function(x: real): real;

  // Тип, що містить повний необхідний аналіз функції
  // Написаний для того, що не аналізувати функції по кілька разів
  TFuncData = record
    f: TFunc;
    Min: real;
    Max: real;
    Len: real;
  end;

  // Клас форми
  TMainForm = class(TForm)
    GraphImage: TImage;
    LeftLimEdt: TEdit;
    RightLimEdt: TEdit;
    RunBtn: TButton;
    CircleDiagramImage: TImage;
    ColumnDiagramImage: TImage;
    ClearBtn: TButton;
    procedure RunBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
// Функції, що які розглядаються в програмі
// Робимо функції-обгортки, щоб їх можна було передавати як аргументи

// Тригонометрична функція
function fsin(x: real): real;
begin
  Result := sin(5*x);
end;

// Експоненціальна функція
function fexp(x: real): real;
begin
  Result := exp(x);
end;

// Лінійна функція
function flin(x: real): real;
begin
  Result := 2 * x + 1;
end;

//
// Функція повертає найбільше з трьох чисел
//
function maxOf(a, b, c: real): real;
begin
  if (a > b) and (a > c) then
    Result := a
  else if (b > a) and (b > c) then
    Result := b
  else
    Result := c;
end;

//
// Функція повертає найменше з трьох чисел
//
function minOf(a, b, c: real): real;
begin
  if (a < b) and (a < c) then
    Result := a
  else if (b < a) and (b < c) then
    Result := b
  else
    Result := c;
end;

//
// Функція для аналізу математичних функцій
// Визначає точку ординату максимуму, ординату мінімуму та довжину графіку
// Аргументи:
//    f         - функція типу TFunc
//    a та b    - проміжок на якому потрібно розглядати функцію
//    Step      - крок значень (Дельта між двома сузідніми x)
// Повертає:
//    TFuncData - запис з отриманими данними
//
function ParseFunc(f: TFunc; a, b, Step: real): TFuncData;
var
  Func: TFuncData;
  x, y, x1, y1: real;
begin
  Func.f := f;            // Заносимо функцію у відповідне поле
  Func.Len := 0;          // Зануляємо довжину графіку

  x := a;                 // Починаємо з лівої межі
  Func.Max := f(x);       // Нехай найбільше значення - значення в лівій межі
  Func.Min := Func.Max;   // Нехай найменше і найбільше значення однакові

  while x <= b do         // Проходимо до правої межі
  begin
    y := f(x);
    if y < Func.Min then
      Func.Min := y;      // Якщо менше за min, оновляємо min
    if y > Func.Max then
      Func.Max := y;      // Якщо більше за max, оновлюємо max

    x1 := x + Step;       // Отримуємо наступну абсцису
    y1 := f(x1);          // Отримуємо наступну ординату

    // Знаходимо відстань між двома точками і накопичуємо її
    Func.Len := Func.Len + Sqrt(Sqr(x - x1) + Sqr(y - y1));

    x := x1;              // Переходимо до наступної точки
  end;

  Result := Func;
end;

//
// Функція для отримання значень з правої та лівої границь
// Аргумент:
//    LimEdt  - текстове поле типу TEdit з якого треба добути значення
// Повертає:
//    Integer - ціле значення границі
//
function GetLim(const LimEdt: TEdit): Integer;
begin
  try
    // Пробуємо отримати значення і відразу повертаємо його
    GetLim := StrToInt(LimEdt.Text);
  except
    // У випадку помилки оброблюємо виключення і виводимо повідомлення
    on E: Exception do
    begin
      ShowMessage('Invalid right limite: ' + E.Message);
      GetLim := 0;
    end
    else
    begin
      ShowMessage('Unknown error!');
      GetLim := 0;
    end;
  end;
end;

// 
// Процедура, що відмальовує координатні вісі
// 
procedure DrawAxis();
var
  XMiddle, YMiddle: Integer;
  Canvas: TCanvas;
begin
  Canvas := MainForm.GraphImage.Canvas;

  // Середина абсцис та ординат
  XMiddle := Canvas.ClipRect.Right div 2;
  YMiddle := Canvas.ClipRect.Bottom div 2;

  Canvas.Pen.Color := clLtGray;                   // Клір пера - сірий

  Canvas.MoveTo(XMiddle, 0);                      // Переходимо в середину по x
  Canvas.LineTo(XMiddle, Canvas.ClipRect.Bottom); // Малюємо вісь Ox
  Canvas.MoveTo(0, YMiddle);                      // Переходимо в середину по y
  Canvas.LineTo(Canvas.ClipRect.Right, YMiddle);  // Малюємо вісь Oy
end;

//
// Процедура, що відмальовує графік функції
// Аргументи:
//    f         - функція типу TFunc
//    a та b    - проміжок на якому потрібно розглядати функцію
//    Step      - крок значень (Дельта між двома сузідніми x)
//    XSize     - масштаб графіку по X
//    YSize     - масштаб графіку по Y
//
procedure DrawGraph(
  const f: TFunc;
  const a, b: Integer;
  const Step, XSize, YSize: real;
  const Color: TColor);
var
  x, y: real;
  XMiddle, YMiddle: Integer;
  Canvas: TCanvas;
begin
  Canvas := MainForm.GraphImage.Canvas;

  // Знаходимо середини абсцис та ординат
  XMiddle := Canvas.ClipRect.Right div 2;
  YMiddle := Canvas.ClipRect.Bottom div 2;

  // Переносимо курсор в потрібну точку на межі a
  x := a;
  y := f(x);
  Canvas.Pen.Color := Color;
  Canvas.MoveTo(XMiddle + Round(XSize * x), YMiddle - Round(YSize * y));
  
  // Проходимо по усіх точках графіку і з'єднуємо їх лініями для плавності
  while x <= b do
  begin
    y := f(x);
    Canvas.LineTo(XMiddle + Round(XSize * x), YMiddle - Round(YSize * y));
    x := x + Step;
  end;
end;

//
// Процедура для відмальовування сектору кругової діаграми за градусами
// Джерело:
//    http://delphidabbler.com/tips/148   
// Аргументи:
//    Canvas   - канва, на якій потрібно намалювати сектор
//    Center   - центр крутової діаграми
//    Radius   - радіус кругової діаграми
//    StartDeg - початок сетору у градусах (починаючи від 3 год)
//    StopDeg  - кінець сектору у градусах (починаючи від 3 год)
//
procedure DrawPieSlice(
  const Canvas: TCanvas;
  const Center: TPoint;
  const Radius: Integer;
  const StartDeg, StopDeg: Double);
var
  x1, X2, X3, X4: Integer;
  y1, Y2, Y3, Y4: Integer;
begin
  // Визначаємо координати що опишуть квадрат, в який має поміститись коло,
  // сектор якого ми маємо намалювати 
  x1 := Center.x - Radius; // Лівий верхній кут
  y1 := Center.y - Radius; // 
  X2 := Center.x + Radius; // Правий нижній кут
  Y2 := Center.y + Radius; // 

  // Переводимо значення кутів в координати перетину ліній, що описують
  // цей сектор та квадрату в який вписане коло, сектор якого ми малюємо
  X3 := Center.x + Round(Radius * Cos(DegToRad(StartDeg)));
  Y3 := Center.y - Round(Radius * sin(DegToRad(StartDeg)));
  X4 := Center.x + Round(Radius * Cos(DegToRad(StopDeg)));
  Y4 := Center.y - Round(Radius * sin(DegToRad(StopDeg)));

  // Малюємо потрібний сектор
  Canvas.Pie(x1, y1, X2, Y2, X3, Y3, X4, Y4);
end;

//
// Процедура для відмальовування кругової діаграми 
// Аргументи:
//    Sect1..3 - розміри секторів діаграми у відсотках
//
procedure DrawCircleDiagram(Sect1, Sect2, Sect3: real);
var
  CircleDiagram: TCanvas;
  Center: TPoint;
  Bitmap: TBitmap;
  Radius: Integer;
  Offset: Real;
begin
  // Створюємо деяку бітову матрицю
  Bitmap := TBitmap.Create;
  try
    // Задаємо матриці розміри канви для кругової діаграми
    Bitmap.Width := MainForm.CircleDiagramImage.Width;
    Bitmap.Height := MainForm.CircleDiagramImage.Height;
    
    // Встановлюємо колір сірий колір меж секторів
    Bitmap.Canvas.Pen.Color := clDkGray;

    // Визначаємо координати середини матриці, радіус
    Center := Point(Bitmap.Width div 2, Bitmap.Height div 2);
    Radius := Bitmap.Width div 2 - 15;

    // Переводимо розміри секторів у градуси
    Sect1 := Round(Sect1 * 3.6);
    Sect2 := Round(Sect2 * 3.6);
    Sect3 := Round(Sect3 * 3.6);

    // Задаємо віступ, колір та малюємо червоний перший сектор
    Offset := 0;    
    Bitmap.Canvas.Brush.Color := clRed;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect1);

    // Оновлюємо віступ, колір та малюємо зелений другий сектор
    Offset := Offset + Sect1;
    Bitmap.Canvas.Brush.Color := clLime;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect2);

    // Оновлюємо відступ, колі та малюємо синій третій сектор
    Offset := Offset + Sect2;
    Bitmap.Canvas.Brush.Color := clBlue;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect3);

    // Виводимо згенероване на матриці зображення у канву
    MainForm.CircleDiagramImage.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;
end;

//
// Процедура для відмальовування стовпчикової діаграми
// Аргументи:
//    Val1..3  - розміри стовчиків у відсотках
//
procedure DrawColumnDiagram(Val1, Val2, Val3: real);
var
  Bitmap: TBitmap;
  Offset, Percent: Integer;
const
  ColumnWidth = 50;
begin
  // Створюємо деяку бітову матрицю
  Bitmap := TBitmap.Create;
  try
    // Задаємо матриці розміри канви для кругової діаграми
    Bitmap.Width := MainForm.ColumnDiagramImage.Width;
    Bitmap.Height := MainForm.ColumnDiagramImage.Height;

    // Встановлюємо колір сірий колі меж секторів 
    Bitmap.Canvas.Pen.Color := clDkGray;

    // Розраховуємо скільки пікселлів припадає на один відсоток
    Percent := (Bitmap.Height div 100);

    // Розраховуємо відступ зправа
    Offset := (Bitmap.Width - (ColumnWidth * 3)) div 2;

    // Відмальовуємо червоний перший стовбець
    Bitmap.Canvas.Brush.Color := clRed;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val1),
      Offset + ColumnWidth, Bitmap.Height);

    // Відмальовуємо зелений другий стовбець
    Offset := Offset + ColumnWidth;
    Bitmap.Canvas.Brush.Color := clLime;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val2),
      Offset + ColumnWidth, Bitmap.Height);

    // Відмальовуємо синій третій стовбець
    Offset := Offset + ColumnWidth;
    Bitmap.Canvas.Brush.Color := clBlue;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val3),
      Offset + ColumnWidth, Bitmap.Height);

    // Виводимо намальовану матрицю в канву
    MainForm.ColumnDiagramImage.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;
end;

//
// Процедура, що очищує Canvas та малює координатні вісі
//
procedure ClearCanvas();
var
  Graph, CircleDiagram, ColumnDiagram: TCanvas;
begin
  Graph := MainForm.GraphImage.Canvas;
  CircleDiagram := MainForm.CircleDiagramImage.Canvas;
  ColumnDiagram := MainForm.ColumnDiagramImage.Canvas;

  // Чистимо канву для графіку
  Graph.Brush.Color := clWhite;
  Graph.FillRect(Rect(
      0,                    // зліва  (x1)
      0,                    // зверху (y1)
      Graph.ClipRect.Right, // зправа (x2)
      Graph.ClipRect.Bottom // знизу  (y2)
    ));

  // Чистиму канву кругової діаграми
  CircleDiagram.Brush.Color := clWhite;
  CircleDiagram.FillRect(Rect(
      0,                            // зліва  (x1)
      0,                            // зверху (y1)
      CircleDiagram.ClipRect.Right, // зправа (x2)
      CircleDiagram.ClipRect.Bottom // знизу  (y2)
    ));

  // Чистимо канву стовпчикової діаграми
  ColumnDiagram.Brush.Color := clWhite;
  ColumnDiagram.FillRect(Rect(
      0,                            // зліва  (x1)
      0,                            // зверху (y1)
      ColumnDiagram.ClipRect.Right, // зправа (x2)
      ColumnDiagram.ClipRect.Bottom // знизу  (y2)
    ));

  // Малюємо координатні вісі
  DrawAxis();
end;

//
// Процедура, що очищує канваси при завантаженні форми
//
procedure TMainForm.FormShow(Sender: TObject);
begin
  ClearCanvas();
end;

//
// Процедура, що очищує канваси при кліку по кнопці Clear
//
procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
  ClearCanvas();
end;

//
// Обробник кліку по кнопці Build Graph
//
procedure TMainForm.RunBtnClick(Sender: TObject);
var
  LeftLim, RightLim: Integer;
  CosFunc, ExpFunc, LinFunc: TFuncData;
  XSize, YSize, Step, SumLen: real;
begin
  // Чистимо канву від попередніх зображень
  ClearCanvas();

  // Отримуємо значення лівої та правої межі графіку
  LeftLim := GetLim(MainForm.LeftLimEdt);
  RightLim := GetLim(MainForm.RightLimEdt);

  // Вираховуємо скільки пікселів припадає на одну одиницю абсциси
  XSize := (Canvas.ClipRect.Right) / (RightLim - LeftLim);
  
  // Крок функції на один піксель - необхідний, щоб проходити лише по тих
  // значень функції, які будуть відображатись на графіку
  Step := 1 / XSize;

  // Отримуємо данні про функції: мінімуми та максимуми, дожини графіків
  CosFunc := ParseFunc(fsin, LeftLim, RightLim, Step);
  ExpFunc := ParseFunc(fexp, LeftLim, RightLim, Step);
  LinFunc := ParseFunc(flin, LeftLim, RightLim, Step);

  // Вираховуємо скільки пікселів припадає на одну одиницю ординати
  YSize := Canvas.ClipRect.Bottom / (
      maxOf(CosFunc.Max, ExpFunc.Max, LinFunc.Max) -
      minOf(CosFunc.Min, ExpFunc.Min, LinFunc.Min)
    );

  // Відмальовуємо графіки кожної з функцій
  DrawGraph(fsin, LeftLim, RightLim, Step, XSize, YSize, clRed);
  DrawGraph(fexp, LeftLim, RightLim, Step, XSize, YSize, clGreen);
  DrawGraph(flin, LeftLim, RightLim, Step, XSize, YSize, clBlue);

  // Знаходимо загальну довжину всіх графіків
  SumLen := CosFunc.Len + ExpFunc.Len + LinFunc.Len;

  // Малюємо кругову діаграму
  DrawCircleDiagram(
      Round(CosFunc.Len / SumLen * 100),
      Round(ExpFunc.Len / SumLen * 100),
      Round(LinFunc.Len / SumLen * 100)
    );

  // Малюємо стовпчасту діаграму
  DrawColumnDiagram(
      CosFunc.Len / SumLen * 100,
      ExpFunc.Len / SumLen * 100,
      LinFunc.Len / SumLen * 100
    );
end;

end.
