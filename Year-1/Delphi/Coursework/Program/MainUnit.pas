unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  // Бібліотека для роботи з JSON
  DBXJSON,
  // Бібліотека для роботи з Shell
  ShellAPI;

type
  TMainForm = class(TForm)
    NewLecturerGroup: TGroupBox;
    NameEdit: TEdit;
    GradeEdit: TEdit;
    OfficeEdit: TEdit;
    AddNewLecturerBtn: TButton;
    NewCourseGroup: TGroupBox;
    AddLecturerIDEdit: TEdit;
    CourseTitleEdit: TEdit;
    AddNewCourseBtn: TButton;
    RemoveLecturerGroup: TGroupBox;
    RemoveLecturerIDEdit: TEdit;
    RemoveLecturerBtn: TButton;
    SaveJsonDialog: TSaveDialog;
    WorkWithJSONGroup: TGroupBox;
    ExportAsJSONBtn: TButton;
    ImportFromJSONBtn: TButton;
    OpenJsonDialog: TOpenDialog;
    LecturersListView: TListView;
    SalaryEdt: TEdit;
    PrintBtn: TButton;
    procedure AddNewLecturerBtnClick(Sender: TObject);
    procedure AddNewCourseBtnClick(Sender: TObject);
    procedure RemoveLecturerBtnClick(Sender: TObject);
    procedure ExportAsJSONBtnClick(Sender: TObject);
    procedure ImportFromJSONBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // Викладачі
  TLecturer = class(TObject)
  public
    Name: string[40];
    Grade: string[40];
    Office: string[40];
    Сourses: array of string;
    constructor Create(const Name, Grade, Office: string);
    constructor CreateFromJson(const JSONObject: TJSONObject); virtual;
    destructor Destroy;
    function ToJSON(): TJSONObject; virtual;
  end;

  // Заробітня платня викладача
  TWage = class(TLecturer)
  public
    Salary: Real;
    Sum: Real;
    constructor Create(const Name, Grade, Office: string; const Salary: Real);
    constructor CreateFromJson(const JSONObject: TJSONObject); override;
    function ToJSON(): TJSONObject; override;
  end;

var
  MainForm: TMainForm;
  Lecturers: array of TWage;

implementation

{ ======================================
  TLecturer
  ====================================== }

//
// Конструктор Викладача зі змінних
//
constructor TLecturer.Create(const Name, Grade, Office: string);
begin
  Self.Name := Name;
  Self.Grade := Grade;
  Self.Office := Office;
end;

//
// Конструктор Викладача з json-об'єкту
//
constructor TLecturer.CreateFromJson(const JSONObject: TJSONObject);
var
  JSONСourses: TJSONArray;
  Name, Grade, Office: string;
  i: Integer;
begin
  try
    // Отримуємо дані для звичайного конструктора
    Name := JSONObject.Get('name').JsonValue.Value;
    Grade := JSONObject.Get('grade').JsonValue.Value;
    Office := JSONObject.Get('office').JsonValue.Value;

    // Викликаємо звичайний конструктор
    Self.Create(Name, Grade, Office);

    // Отримуємо з json-об'єкту масив курсів
    JSONСourses := JSONObject.Get('courses').JsonValue as TJSONArray;

    // Встановлюємо довжину масиву та заповнюємо його
    SetLength(Self.Сourses, JSONСourses.Size);
    for i := 0 to JSONСourses.Size - 1 do
      Self.Сourses[i] := JSONСourses.Get(i).Value;
  except
    raise Exception.Create('Помилка парсингу JSON!');
  end;
end;

//
// Конвертація об'єкту в JSON
//
function TLecturer.ToJSON(): TJSONObject;
var
  JSONObject: TJSONObject;
  JSONArray: TJSONArray;
  i: Integer;
begin
  // Ініціалізуємо об'єкт
  JSONObject := TJSONObject.Create;

  // Додаємо основні пари "поле-значення"
  JSONObject.AddPair(TJSONPair.Create('name', Self.Name));
  JSONObject.AddPair(TJSONPair.Create('grade', Self.Grade));
  JSONObject.AddPair(TJSONPair.Create('office', Self.Office));

  // Створюємо та заповнюємо масив курсів
  JSONArray := TJSONArray.Create;
  for i := 0 to Length(Self.Сourses) - 1 do
  begin
    JSONArray.Add(Self.Сourses[i]);
  end;

  // Додаємо пару для курсів в json-об'єкт
  JSONObject.AddPair(TJSONPair.Create('courses', JSONArray));

  // Повертаємо згенерований об'єкт
  Result := JSONObject;
end;

//
// Деструктор Викладача
//
destructor TLecturer.Destroy;
begin
  // Nothing to do
  inherited;
end;

{ ======================================
  TWage
  ====================================== }

//
// Конструктор Зарплати зі змінних
//
constructor TWage.Create(const Name: string; const Grade: string;
  const Office: string; const Salary: Real);
begin
  // Викликаємо батьківський конструктор
  inherited Create(Name, Grade, Office);

  // Додаємо оклад та суму
  Self.Salary := Salary;
  Self.Sum := 0;
end;

//
// Конструктор Викладача з json-об'єкту
//
constructor TWage.CreateFromJson(const JSONObject: TJSONObject);
begin
  // Викликаємо батьківський конструктор
  inherited CreateFromJson(JSONObject);

  try
    // Додаємо оклад та суму з JSON
    Self.Salary := StrToFloat(JSONObject.Get('salary').JsonValue.Value);
    Self.Sum := StrToFloat(JSONObject.Get('sum').JsonValue.Value);
  except
    raise Exception.Create('Помилка парсингу JSON.');
  end;
end;

//
// Конвертація об'єкту в JSON
//
function TWage.ToJSON: TJSONObject;
var
  JSONObject: TJSONObject;
begin
  JSONObject := inherited ToJSON();

  // Додаємо основні пари "поле-значення"
  JSONObject.AddPair(TJSONPair.Create('salary', FloatToStr(Self.Salary)));
  JSONObject.AddPair(TJSONPair.Create('sum', FloatToStr(Self.Sum)));

  Result := JSONObject;
end;

{$R *.dfm}

//
// Процедура для оновлення виведення списку викладачів в читабельному форматі
//
procedure RefreshLecturersListBox;
var
  i, j: Integer;
  NewRow: TListItem;
  Courses: string;
begin
  // Чистимо ліст-бокс
  MainForm.LecturersListView.Items.Clear;

  // Проходимо масивом викладачів і виводимо його в ліст-бокс
  for i := 0 to Length(Lecturers) - 1 do
  begin
    Courses := '';
    for j := 0 to Length(Lecturers[i].Сourses) - 2 do
      Courses := Courses + Lecturers[i].Сourses[j] + ', ';
    if (Length(Lecturers[i].Сourses) >= 1) then
      Courses := Courses + Lecturers[i].Сourses
        [Length(Lecturers[i].Сourses) - 1];

    NewRow := MainForm.LecturersListView.Items.Add;
    NewRow.Caption := Lecturers[i].Name;
    NewRow.SubItems.Add(Lecturers[i].Grade);
    NewRow.SubItems.Add(Lecturers[i].Office);
    NewRow.SubItems.Add(Courses);
    NewRow.SubItems.Add(FloatToStr(Lecturers[i].Salary));
    NewRow.SubItems.Add(FloatToStr(Lecturers[i].Sum));
  end;
end;

//
// Обробник додавання нового курсу до викладача
//
procedure TMainForm.AddNewCourseBtnClick(Sender: TObject);
var
  LecturerID, Len: Integer;
begin
  // Отримуємо введений ідентифікатор викладача
  LecturerID := StrToInt(AddLecturerIDEdit.Text);

  // Встановлюємо нову кількість курсів, які веде цей викладач
  Len := Length(Lecturers[LecturerID].Сourses);
  SetLength(Lecturers[LecturerID].Сourses, Len + 1);

  // Встановлюємо значення
  Lecturers[LecturerID].Сourses[Len] := CourseTitleEdit.Text;
  Lecturers[LecturerID].Sum := Length(Lecturers[LecturerID].Сourses) *
    Lecturers[LecturerID].Salary;

  // Оновлюємо ліст-бокс
  RefreshLecturersListBox;
end;

//
// Обробник додавання нового викладача
//
procedure TMainForm.AddNewLecturerBtnClick(Sender: TObject);
var
  NewLecturer: TWage;
  Name, Grade, Office, Salary: string;
  Len: Integer;
begin
  // Дістаємо значення з полів введення
  Name := NameEdit.Text;
  Grade := GradeEdit.Text;
  Office := OfficeEdit.Text;
  Salary := SalaryEdt.Text;

  // Встановлюємо нову довжину масиву викладачів
  Len := Length(Lecturers);
  SetLength(Lecturers, Len + 1);

  // Викликаємо конструктор нового викладача
  Lecturers[Len] := TWage.Create(Name, Grade, Office, StrToFloat(Salary));

  // Оновлюємо список викладачів
  RefreshLecturersListBox;
end;

//
// Обробник експорту списку викладачів як JSON
//
procedure TMainForm.ExportAsJSONBtnClick(Sender: TObject);
var
  JSONObject: TJSONObject;
  JSONArray: TJSONArray;
  str: TStringList;
  i: Integer;
begin
  // Перевіряємо чи виконалось вікно збереження
  if SaveJsonDialog.Execute then
  begin
    try
      // Ініціалізуємо об'єкти
      str := TStringList.Create;
      JSONObject := TJSONObject.Create;
      JSONArray := TJSONArray.Create;

      // Експортуємо викладачів як елементи масиву lecturers
      for i := 0 to Length(Lecturers) - 1 do
      begin
        JSONArray.AddElement(Lecturers[i].ToJSON);
      end;
      JSONObject.AddPair(TJSONPair.Create('lecturers', JSONArray));

      // Приводимо json в рядок і пишемо в файл
      str.Add(JSONObject.ToString);
      str.SaveToFile(SaveJsonDialog.FileName);
    finally
      // Чистимо об'єкти
      str.Free;
      JSONObject.Destroy;
    end;
  end;
end;

//
// Обробник імпорту з JSON
//
procedure TMainForm.ImportFromJSONBtnClick(Sender: TObject);
var
  JSONObject: TJSONObject;
  JSONLecturers: TJSONArray;
  str: TStringList;
  i: Integer;
begin
  // Перевіряємо чи виконалось вікно відкриття
  if OpenJsonDialog.Execute then
  begin
    try
      // Ініціалізуємо рядок і читаємо в нього з файлу
      str := TStringList.Create;
      str.LoadFromFile(OpenJsonDialog.FileName);

      // Парсимо рядок як TJSONObject
      JSONObject := TJSONObject.ParseJSONValue(str.Text) as TJSONObject;

      // Отримуємо масив викладачів
      JSONLecturers := JSONObject.Get('lecturers').JsonValue as TJSONArray;

      // Встановлюємо довжину масиву викладачів
      SetLength(Lecturers, JSONLecturers.Size);

      // Заповнюємо масив викладачів
      for i := 0 to JSONLecturers.Size - 1 do
        Lecturers[i] := TWage.CreateFromJson(JSONLecturers.Get(i)
          as TJSONObject);

      // Оновлюємо лістбокс
      RefreshLecturersListBox;
    finally
      // Чистимо рядок
      str.Free;
    end;
  end;
end;

//
// Обробник друку звітів
//
procedure TMainForm.PrintBtnClick(Sender: TObject);
var
  i, j: Integer;
  Name, Grade, Office, Courses, Salary, Sum, str: String;
  OutFile: TextFile;
begin
  try
    AssignFile(OutFile, 'print.txt');
    Rewrite(OutFile);

    for i := 0 to LecturersListView.Items.Count - 1 do
    begin
      Name := LecturersListView.Items[i].Caption;
      Grade := LecturersListView.Items[i].SubItems.Strings[0];
      Office := LecturersListView.Items[i].SubItems.Strings[1];
      Courses := LecturersListView.Items[i].SubItems.Strings[2];
      Salary := LecturersListView.Items[i].SubItems.Strings[3];
      Sum := LecturersListView.Items[i].SubItems.Strings[4];

      str := Format('%-30s', [Name]) + Format('%-10s', [Grade]) +
        Format('%-20s', [Office]) + Format('%-40s', [Courses]) +
        Format('%-10s', [Salary]) + Format('%10s', [Sum]);
      Writeln(OutFile, str);
    end;
  finally
    CloseFile(OutFile);
  end;

  ShellExecute(Handle, 'print', 'print.txt', nil, nil, SW_Hide);
end;

//
// Обробник для видалення викладача
//
procedure TMainForm.RemoveLecturerBtnClick(Sender: TObject);
var
  LecturerID, i: Integer;
begin
  // Отримуємо ідентифікатор викладача
  LecturerID := StrToInt(RemoveLecturerIDEdit.Text);

  // Видаляємо виклидача і зсуваємо всіх, хто після нього
  Lecturers[LecturerID].Destroy;
  for i := LecturerID to Length(Lecturers) - 1 do
  begin
    Lecturers[i] := Lecturers[i + 1];
  end;

  // Задаємо нову довжину масиву викладачів
  SetLength(Lecturers, Length(Lecturers) - 1);

  // Оновлюємо масив викладачів
  RefreshLecturersListBox;
end;

end.
