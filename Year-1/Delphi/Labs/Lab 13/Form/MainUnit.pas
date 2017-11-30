unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    InputEdt: TEdit;
    OutputEdt: TEdit;
    RunBtn: TButton;
    procedure RunBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

//
// ���������� �������, �� �������� �������� ����� �
//
function a(k:Integer):Extended;
begin
  if k = 0 then
    a:= 2
  else
    a:= Sqr( Sin( a(k-1) ) ) / Sqr(k);
end;

//
// ���������� ������� ��� ���������� ���������
//
function Fact(n:Extended):Extended;
begin
  if n = 1 then
    Fact:= 1
  else
    Fact:= n * Fact(n-1);
end;

//
// ������� ��������� � ������
// �������� � ������������� �����, �� ������� exp(ln(x)*y) �� �����������
// � ��'������ �������
//
function Pow(const x,y:Integer):Extended;
var Number: Extended;
         i: Integer;
begin
  Number:= 1;
  for i := 1 to y do Number:= Number * x;
  Pow:= Number;
end;

//
// �������� ���� �� ������
//
procedure TMainForm.RunBtnClick(Sender: TObject);
var
  n,k: Integer;
  Sum: Extended;
begin
  n:= StrToInt(InputEdt.Text);

  // �������� ����� n.
  // ���� n > 6, �� �������� �� ��������� � 6 - ���� ����� �������.
  // �������� �������, �� ����� �� ��� ���� Extended.
  if n > 6 then begin
    ShowMessage('�������� ����� ������� �������. �������� ��������!');
    Exit;
  end;

  Sum:= 0;
  for k := 1 to n do begin
     Sum:= Pow(-1, k+1) * a(k) / Fact(Fact(k));
  end;

  OutputEdt.Text:= FloatToStr(Sum);
end;

end.
