unit MainUnit;

interface

uses
  // ϳ�������� Math ��� ������� DegToRad()
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, TeeProcs, Chart, Math;

type
  // ��� �������, �� ������ ������������
  // ������� ��� ��� ����, ��� ����� ���� ���������� ������� �� ���������
  TFunc = function(x: real): real;

  // ���, �� ������ ������ ���������� ����� �������
  // ��������� ��� ����, �� �� ���������� ������� �� ����� ����
  TFuncData = record
    f: TFunc;
    Min: real;
    Max: real;
    Len: real;
  end;

  // ���� �����
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
// �������, �� �� ������������� � �������
// ������ �������-��������, ��� �� ����� ���� ���������� �� ���������

// ��������������� �������
function fsin(x: real): real;
begin
  Result := sin(5*x);
end;

// ��������������� �������
function fexp(x: real): real;
begin
  Result := exp(x);
end;

// ˳���� �������
function flin(x: real): real;
begin
  Result := 2 * x + 1;
end;

//
// ������� ������� �������� � ����� �����
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
// ������� ������� �������� � ����� �����
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
// ������� ��� ������ ������������ �������
// ������� ����� �������� ���������, �������� ������ �� ������� �������
// ���������:
//    f         - ������� ���� TFunc
//    a �� b    - ������� �� ����� ������� ���������� �������
//    Step      - ���� ������� (������ �� ����� ������� x)
// �������:
//    TFuncData - ����� � ���������� �������
//
function ParseFunc(f: TFunc; a, b, Step: real): TFuncData;
var
  Func: TFuncData;
  x, y, x1, y1: real;
begin
  Func.f := f;            // �������� ������� � �������� ����
  Func.Len := 0;          // ��������� ������� �������

  x := a;                 // �������� � ��� ���
  Func.Max := f(x);       // ����� �������� �������� - �������� � ��� ���
  Func.Min := Func.Max;   // ����� �������� � �������� �������� �������

  while x <= b do         // ��������� �� ����� ���
  begin
    y := f(x);
    if y < Func.Min then
      Func.Min := y;      // ���� ����� �� min, ��������� min
    if y > Func.Max then
      Func.Max := y;      // ���� ����� �� max, ��������� max

    x1 := x + Step;       // �������� �������� �������
    y1 := f(x1);          // �������� �������� ��������

    // ��������� ������� �� ����� ������� � ���������� ��
    Func.Len := Func.Len + Sqrt(Sqr(x - x1) + Sqr(y - y1));

    x := x1;              // ���������� �� �������� �����
  end;

  Result := Func;
end;

//
// ������� ��� ��������� ������� � ����� �� ��� �������
// ��������:
//    LimEdt  - �������� ���� ���� TEdit � ����� ����� ������ ��������
// �������:
//    Integer - ���� �������� �������
//
function GetLim(const LimEdt: TEdit): Integer;
begin
  try
    // ������� �������� �������� � ������ ��������� ����
    GetLim := StrToInt(LimEdt.Text);
  except
    // � ������� ������� ���������� ���������� � �������� �����������
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
// ���������, �� ��������� ���������� ��
// 
procedure DrawAxis();
var
  XMiddle, YMiddle: Integer;
  Canvas: TCanvas;
begin
  Canvas := MainForm.GraphImage.Canvas;

  // �������� ������ �� �������
  XMiddle := Canvas.ClipRect.Right div 2;
  YMiddle := Canvas.ClipRect.Bottom div 2;

  Canvas.Pen.Color := clLtGray;                   // ��� ���� - ����

  Canvas.MoveTo(XMiddle, 0);                      // ���������� � �������� �� x
  Canvas.LineTo(XMiddle, Canvas.ClipRect.Bottom); // ������� ��� Ox
  Canvas.MoveTo(0, YMiddle);                      // ���������� � �������� �� y
  Canvas.LineTo(Canvas.ClipRect.Right, YMiddle);  // ������� ��� Oy
end;

//
// ���������, �� ��������� ������ �������
// ���������:
//    f         - ������� ���� TFunc
//    a �� b    - ������� �� ����� ������� ���������� �������
//    Step      - ���� ������� (������ �� ����� ������� x)
//    XSize     - ������� ������� �� X
//    YSize     - ������� ������� �� Y
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

  // ��������� �������� ������ �� �������
  XMiddle := Canvas.ClipRect.Right div 2;
  YMiddle := Canvas.ClipRect.Bottom div 2;

  // ���������� ������ � ������� ����� �� ��� a
  x := a;
  y := f(x);
  Canvas.Pen.Color := Color;
  Canvas.MoveTo(XMiddle + Round(XSize * x), YMiddle - Round(YSize * y));
  
  // ��������� �� ��� ������ ������� � �'������ �� ����� ��� ��������
  while x <= b do
  begin
    y := f(x);
    Canvas.LineTo(XMiddle + Round(XSize * x), YMiddle - Round(YSize * y));
    x := x + Step;
  end;
end;

//
// ��������� ��� �������������� ������� ������� ������� �� ���������
// �������:
//    http://delphidabbler.com/tips/148   
// ���������:
//    Canvas   - �����, �� ��� ������� ���������� ������
//    Center   - ����� ������� �������
//    Radius   - ����� ������� �������
//    StartDeg - ������� ������ � �������� (��������� �� 3 ���)
//    StopDeg  - ����� ������� � �������� (��������� �� 3 ���)
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
  // ��������� ���������� �� ������� �������, � ���� �� ���������� ����,
  // ������ ����� �� ���� ���������� 
  x1 := Center.x - Radius; // ˳��� ������ ���
  y1 := Center.y - Radius; // 
  X2 := Center.x + Radius; // ������ ����� ���
  Y2 := Center.y + Radius; // 

  // ���������� �������� ���� � ���������� �������� ���, �� ��������
  // ��� ������ �� �������� � ���� ������� ����, ������ ����� �� �������
  X3 := Center.x + Round(Radius * Cos(DegToRad(StartDeg)));
  Y3 := Center.y - Round(Radius * sin(DegToRad(StartDeg)));
  X4 := Center.x + Round(Radius * Cos(DegToRad(StopDeg)));
  Y4 := Center.y - Round(Radius * sin(DegToRad(StopDeg)));

  // ������� �������� ������
  Canvas.Pie(x1, y1, X2, Y2, X3, Y3, X4, Y4);
end;

//
// ��������� ��� �������������� ������� ������� 
// ���������:
//    Sect1..3 - ������ ������� ������� � ��������
//
procedure DrawCircleDiagram(Sect1, Sect2, Sect3: real);
var
  CircleDiagram: TCanvas;
  Center: TPoint;
  Bitmap: TBitmap;
  Radius: Integer;
  Offset: Real;
begin
  // ��������� ����� ����� �������
  Bitmap := TBitmap.Create;
  try
    // ������ ������� ������ ����� ��� ������� �������
    Bitmap.Width := MainForm.CircleDiagramImage.Width;
    Bitmap.Height := MainForm.CircleDiagramImage.Height;
    
    // ������������ ���� ���� ���� ��� �������
    Bitmap.Canvas.Pen.Color := clDkGray;

    // ��������� ���������� �������� �������, �����
    Center := Point(Bitmap.Width div 2, Bitmap.Height div 2);
    Radius := Bitmap.Width div 2 - 15;

    // ���������� ������ ������� � �������
    Sect1 := Round(Sect1 * 3.6);
    Sect2 := Round(Sect2 * 3.6);
    Sect3 := Round(Sect3 * 3.6);

    // ������ �����, ���� �� ������� �������� ������ ������
    Offset := 0;    
    Bitmap.Canvas.Brush.Color := clRed;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect1);

    // ��������� �����, ���� �� ������� ������� ������ ������
    Offset := Offset + Sect1;
    Bitmap.Canvas.Brush.Color := clLime;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect2);

    // ��������� ������, ��� �� ������� ���� ����� ������
    Offset := Offset + Sect2;
    Bitmap.Canvas.Brush.Color := clBlue;
    DrawPieSlice(Bitmap.Canvas, Center, Radius, Offset, Offset + Sect3);

    // �������� ����������� �� ������� ���������� � �����
    MainForm.CircleDiagramImage.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;
end;

//
// ��������� ��� �������������� ����������� �������
// ���������:
//    Val1..3  - ������ �������� � ��������
//
procedure DrawColumnDiagram(Val1, Val2, Val3: real);
var
  Bitmap: TBitmap;
  Offset, Percent: Integer;
const
  ColumnWidth = 50;
begin
  // ��������� ����� ����� �������
  Bitmap := TBitmap.Create;
  try
    // ������ ������� ������ ����� ��� ������� �������
    Bitmap.Width := MainForm.ColumnDiagramImage.Width;
    Bitmap.Height := MainForm.ColumnDiagramImage.Height;

    // ������������ ���� ���� ��� ��� ������� 
    Bitmap.Canvas.Pen.Color := clDkGray;

    // ����������� ������ ������� ������� �� ���� �������
    Percent := (Bitmap.Height div 100);

    // ����������� ������ ������
    Offset := (Bitmap.Width - (ColumnWidth * 3)) div 2;

    // ³���������� �������� ������ ��������
    Bitmap.Canvas.Brush.Color := clRed;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val1),
      Offset + ColumnWidth, Bitmap.Height);

    // ³���������� ������� ������ ��������
    Offset := Offset + ColumnWidth;
    Bitmap.Canvas.Brush.Color := clLime;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val2),
      Offset + ColumnWidth, Bitmap.Height);

    // ³���������� ���� ����� ��������
    Offset := Offset + ColumnWidth;
    Bitmap.Canvas.Brush.Color := clBlue;
    Bitmap.Canvas.Rectangle(Offset, Bitmap.Height - Round(Percent * Val3),
      Offset + ColumnWidth, Bitmap.Height);

    // �������� ����������� ������� � �����
    MainForm.ColumnDiagramImage.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;
end;

//
// ���������, �� ����� Canvas �� ����� ���������� ��
//
procedure ClearCanvas();
var
  Graph, CircleDiagram, ColumnDiagram: TCanvas;
begin
  Graph := MainForm.GraphImage.Canvas;
  CircleDiagram := MainForm.CircleDiagramImage.Canvas;
  ColumnDiagram := MainForm.ColumnDiagramImage.Canvas;

  // ������� ����� ��� �������
  Graph.Brush.Color := clWhite;
  Graph.FillRect(Rect(
      0,                    // ����  (x1)
      0,                    // ������ (y1)
      Graph.ClipRect.Right, // ������ (x2)
      Graph.ClipRect.Bottom // �����  (y2)
    ));

  // ������� ����� ������� �������
  CircleDiagram.Brush.Color := clWhite;
  CircleDiagram.FillRect(Rect(
      0,                            // ����  (x1)
      0,                            // ������ (y1)
      CircleDiagram.ClipRect.Right, // ������ (x2)
      CircleDiagram.ClipRect.Bottom // �����  (y2)
    ));

  // ������� ����� ����������� �������
  ColumnDiagram.Brush.Color := clWhite;
  ColumnDiagram.FillRect(Rect(
      0,                            // ����  (x1)
      0,                            // ������ (y1)
      ColumnDiagram.ClipRect.Right, // ������ (x2)
      ColumnDiagram.ClipRect.Bottom // �����  (y2)
    ));

  // ������� ���������� ��
  DrawAxis();
end;

//
// ���������, �� ����� ������� ��� ����������� �����
//
procedure TMainForm.FormShow(Sender: TObject);
begin
  ClearCanvas();
end;

//
// ���������, �� ����� ������� ��� ���� �� ������ Clear
//
procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
  ClearCanvas();
end;

//
// �������� ���� �� ������ Build Graph
//
procedure TMainForm.RunBtnClick(Sender: TObject);
var
  LeftLim, RightLim: Integer;
  CosFunc, ExpFunc, LinFunc: TFuncData;
  XSize, YSize, Step, SumLen: real;
begin
  // ������� ����� �� ��������� ���������
  ClearCanvas();

  // �������� �������� ��� �� ����� ��� �������
  LeftLim := GetLim(MainForm.LeftLimEdt);
  RightLim := GetLim(MainForm.RightLimEdt);

  // ���������� ������ ������ ������� �� ���� ������� �������
  XSize := (Canvas.ClipRect.Right) / (RightLim - LeftLim);
  
  // ���� ������� �� ���� ������ - ����������, ��� ��������� ���� �� ���
  // ������� �������, �� ������ ������������ �� �������
  Step := 1 / XSize;

  // �������� ���� ��� �������: ������ �� ���������, ������ �������
  CosFunc := ParseFunc(fsin, LeftLim, RightLim, Step);
  ExpFunc := ParseFunc(fexp, LeftLim, RightLim, Step);
  LinFunc := ParseFunc(flin, LeftLim, RightLim, Step);

  // ���������� ������ ������ ������� �� ���� ������� ��������
  YSize := Canvas.ClipRect.Bottom / (
      maxOf(CosFunc.Max, ExpFunc.Max, LinFunc.Max) -
      minOf(CosFunc.Min, ExpFunc.Min, LinFunc.Min)
    );

  // ³���������� ������� ����� � �������
  DrawGraph(fsin, LeftLim, RightLim, Step, XSize, YSize, clRed);
  DrawGraph(fexp, LeftLim, RightLim, Step, XSize, YSize, clGreen);
  DrawGraph(flin, LeftLim, RightLim, Step, XSize, YSize, clBlue);

  // ��������� �������� ������� ��� �������
  SumLen := CosFunc.Len + ExpFunc.Len + LinFunc.Len;

  // ������� ������� �������
  DrawCircleDiagram(
      Round(CosFunc.Len / SumLen * 100),
      Round(ExpFunc.Len / SumLen * 100),
      Round(LinFunc.Len / SumLen * 100)
    );

  // ������� ���������� �������
  DrawColumnDiagram(
      CosFunc.Len / SumLen * 100,
      ExpFunc.Len / SumLen * 100,
      LinFunc.Len / SumLen * 100
    );
end;

end.
