program Lab16Console;

// ������ 9.
// 1. ���� ������ �� ������: ����������.
// 2. ������: ����������� ����� � ������������� ���. � ��� ������ ���������
// ������� print � ��� ����� ����� �����, �� ����� �������� �ᒺ��.
// 3. � �������� ������ ������������� �������� �<� � �+� ����� � �-� ������� - �
// ���������� �� �� ���������. ������� print ����������� �� ���������

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  //
  // ���� ����� �� ������
  //
  TXYPoint = class(TObject)
  protected
    X: Integer;
    Y: Integer;
  public
    constructor Create(X, Y: Integer);
    function Print(): String; virtual; // ������� ��'� �����
  end;

  //
  // ���� ����������� �����
  // ��������� ������ � ���������� TXYPoint
  //
  TComplexNumber = class(TXYPoint)
    class function Add(A, B: TComplexNumber): TComplexNumber; virtual;
    class function LessThan(A, B: TComplexNumber): Boolean; virtual;
    class function Negative(A: TComplexNumber): TComplexNumber; virtual;
  private
    Module: Real; // ������ ������������ �����
    Argument: Real; // �������� ������������ �����
  public
    constructor Create(X, Y: Integer);
  end;

  //
  // ���� ������������ �����
  // ��������� �� ������ �� ���������� TComplexNumber
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
  { ������������� TPoint }
  { -------------------- }

//
// ����������� ����� �� ������
//
constructor TXYPoint.Create(X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;

  Writeln('Point(', Self.X, ',', Self.Y, ') has been created.');
end;

//
// �������, �� ������� ��'� �����
//
function TXYPoint.Print;
begin
  Result := Self.ClassName;
end;

  { ---------------------------- }
  { ������������� TComplexNumber }
  { ---------------------------- }

//
// ����������� ������������ �����
// ���������:
//    X - Re-�������
//    Y - Im-�������
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
// ��������� ����� �������� ��������� "+"
// ���������:
//    � - ���� �������
//    � - ������ �������
//
class function TComplexNumber.Add(A: TComplexNumber; B: TComplexNumber)
  : TComplexNumber;
begin
  Result := TComplexNumber.Create((A.X + B.X), (A.Y + B.Y));
end;

//
// ��������� ����� �������� ��������� "<"
// ���������:
//    � - ���� �������
//    � - ������ �������
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
// ��������� ����� �������� ��������� "-"
// ���������:
//    � - ���� �������
//    � - ������ �������
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
  { ������������� TRationalExpression }
  { --------------------------------- }

//
// ����������� ������������� �����
// ���������:
//    X - ���������
//    Y - ���������
//
constructor TRationalExpression.Create(X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;

  Writeln('RationalExpression (', X, '/', Y, ') has been created.');
end;

//
// ��������� ����� �������� ��������� "+"
// ���������:
//    � - ���� �������
//    � - ������ �������
//
class function TRationalExpression.Add(A: TRationalExpression;
  B: TRationalExpression): TRationalExpression;
begin
  Result := TRationalExpression.Create(A.X * B.Y + B.X * A.Y, A.Y * B.Y);
end;

//
// ��������� ����� �������� ��������� "<"
// ���������:
//    � - ���� �������
//    � - ������ �������
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
// ��������� ����� �������� ��������� "-"
// ���������:
//    � - ���� �������
//    � - ������ �������
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
  { ҳ�� �������� }
  { ------------- }

var
  // ��'��� ����� ����� �� ������
  SomePoint: TXYPoint;
  // ��'���� ����������� �����
  AComplex, BComplex, CComplex: TComplexNumber;
  // ��'���� ������������ �����
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
