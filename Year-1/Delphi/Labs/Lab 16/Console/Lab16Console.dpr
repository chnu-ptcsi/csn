program Lab16Console;

// Варіант 9.
// 1. Клас “Точка на площині”: координати.
// 2. Похідні: “комплексне число” і “раціональний дріб”. В усіх класах визначити
// функцію print – для друку назви класу, до якого належить об’єкт.
// 3. В похідних класах перевантажити операції “<” і “+” бінарні і “-” унарний - у
// відповідності до їх семантики. Функцію print перетворити на віртуальну

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  //
  // Клас точок на площині
  //
  TXYPoint = class(TObject)
  protected
    X: Integer;
    Y: Integer;
  public
    constructor Create(X, Y: Integer);
    function Print(): String; virtual; // Повертає ім'я класу
  end;

  //
  // Клас комплексних чисел
  // Успадковує методи і властивості TXYPoint
  //
  TComplexNumber = class(TXYPoint)
    class function Add(A, B: TComplexNumber): TComplexNumber; virtual;
    class function LessThan(A, B: TComplexNumber): Boolean; virtual;
    class function Negative(A: TComplexNumber): TComplexNumber; virtual;
  private
    Module: Real; // Модуль комплексного числа
    Argument: Real; // Аргумент комплексного числа
  public
    constructor Create(X, Y: Integer);
  end;

  //
  // Клас раціональних дробів
  // Успадковує всі методи та властивості TComplexNumber
  //
  TRationalExpression = class(TComplexNumber)
    class function Add(A, B: TRationalExpression): TRationalExpression;
    class function LessThan(A, B: TRationalExpression): Boolean;
    class function Negative(A: TRationalExpression)
      : TRationalExpression; virtual;
  public
    constructor Create(X, Y: Integer);
  end;

  { -------------------- }
  { Імплементація TPoint }
  { -------------------- }

//
// Конструктор точки на площині
//
constructor TXYPoint.Create(X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;

  Writeln('Point(', Self.X, ',', Self.Y, ') has been created.');
end;

//
// Функція, що повертає ім'я класу
//
function TXYPoint.Print;
begin
  Result := Self.ClassName;
end;

  { ---------------------------- }
  { Імплементація TComplexNumber }
  { ---------------------------- }

//
// Конструктор комплексного числа
// Аргументи:
//    X - Re-частина
//    Y - Im-частина
//
constructor TComplexNumber.Create(X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;
  Self.Module := Sqrt(Sqr(X) + Sqr(Y));
  Self.Argument := ArcTan(Y / X);

  Writeln('Complex number (', X, ' + ', Y, 'i) has been created.');
  Writeln('   Argument: ', Argument:5:2);
  Writeln('   Module: ', Module:5:2);
end;

//
// Статичний метод бінарного оператора "+"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TComplexNumber.Add(A: TComplexNumber; B: TComplexNumber)
  : TComplexNumber;
begin
  Result := TComplexNumber.Create((A.X + B.X), (A.Y + B.Y));
end;

//
// Статичний метод бінарного оператора "<"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TComplexNumber.LessThan(A: TComplexNumber;
  B: TComplexNumber): Boolean;
begin
  if A.Module < B.Module then
    Result := True
  else
    Result := False;
end;

//
// Статичний метод унарного оператора "-"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TComplexNumber.Negative(A: TComplexNumber): TComplexNumber;
begin
  A.X := -A.X;
  A.Y := -A.Y;

  Writeln('Complex number (', A.X, ' + ', A.Y, 'i) has made negative.');
  Writeln('   Argument: ', A.Argument:5:2);
  Writeln('   Module: ', A.Module:5:2);
end;

  { --------------------------------- }
  { Імплементація TRationalExpression }
  { --------------------------------- }

//
// Конструктор раціонального дробу
// Аргументи:
//    X - Чисельник
//    Y - Знаменник
//
constructor TRationalExpression.Create(X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;

  Writeln('RationalExpression (', X, '/', Y, ') has been created.');
end;

//
// Статичний метод бінарного оператора "+"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TRationalExpression.Add(A: TRationalExpression;
  B: TRationalExpression): TRationalExpression;
begin
  Result := TRationalExpression.Create(A.X * B.Y + B.X * A.Y, A.Y * B.Y);
end;

//
// Статичний метод бінарного оператора "<"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TRationalExpression.LessThan(A: TRationalExpression;
  B: TRationalExpression): Boolean;
begin
  if A.X / A.Y < B.X / B.Y then
    Result := True
  else
    Result := False;
end;

//
// Статичний метод унарного оператора "-"
// Аргументи:
//    А - лівий операнд
//    В - правий операнд
//
class function TRationalExpression.Negative(A: TRationalExpression)
  : TRationalExpression;
begin
  if A.X / A.Y < 0 then
  begin
    A.X := Abs(A.X);
    A.Y := Abs(A.Y);
  end
  else
  begin
    A.X := -A.X;
  end;

  Writeln('RationalExpression (', A.X, '/', A.Y, ') has made negative.');
end;

  { ------------- }
  { Тіло програми }
  { ------------- }

var
  // Об'єкт деякої точки на площині
  SomePoint: TXYPoint;
  // Об'єкти комплексних чисел
  AComplex, BComplex, CComplex: TComplexNumber;
  // Об'єкти раціональних дробів
  ARational, BRational, CRational: TRationalExpression;

begin
  try
    Writeln('Lab16Console!');
    Writeln('--- --- ---');

    Writeln;
    Writeln(' -------- ');
    Writeln('| Points |');
    Writeln(' -------- ');

    SomePoint := TXYPoint.Create(11, 5);
    Writeln('Class of SomePoint: ', SomePoint.Print);

    Writeln;
    Writeln(' -----------------');
    Writeln('| Complex Numbers |');
    Writeln(' -----------------');

    AComplex := TComplexNumber.Create(6, 5);
    Writeln('Class of AComplex: ', AComplex.Print);
    Writeln('--- --- ---');

    BComplex := TComplexNumber.Create(1, 2);
    Writeln('Class of BComplex: ', BComplex.Print);
    Writeln('--- --- ---');

    Writeln('A + B = ...');
    CComplex := TComplexNumber.Add(AComplex, BComplex);
    Writeln('Class of CComplexNumber: ', CComplex.Print);
    Writeln('--- --- ---');

    Writeln('A < B: ', TComplexNumber.LessThan(AComplex, BComplex));
    Writeln('--- --- ---');

    Writeln(' -A = ...');
    AComplex := TComplexNumber.Negative(AComplex);

    Writeln;
    Writeln(' ----------------------');
    Writeln('| Rational Expressions |');
    Writeln(' ----------------------');

    ARational := TRationalExpression.Create(2, 3);
    Writeln('Class of ARational: ', ARational.Print);

    Writeln('--- --- ---');
    BRational := TRationalExpression.Create(1, 2);
    Writeln('Class of BRational: ', BRational.Print);

    Writeln('A + B = ...');
    CRational := TRationalExpression.Add(ARational, BRational);
    Writeln('Class of CRational: ', CRational.Print);
    Writeln('--- --- ---');

    Writeln('A < B: ', TRationalExpression.LessThan(ARational, BRational));
    Writeln('--- --- ---');

    Writeln(' -A = ...');
    ARational := TRationalExpression.Negative(ARational);

    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
