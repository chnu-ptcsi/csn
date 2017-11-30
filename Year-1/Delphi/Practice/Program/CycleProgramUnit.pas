unit CycleProgramUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TCycleProgramForm = class(TForm)
    XEdit: TEdit;
    XLabel: TLabel;
    AEdit: TEdit;
    ALabel: TLabel;
    EEdit: TEdit;
    ELabel: TLabel;
    SumEdit: TEdit;
    SumLabel: TLabel;
    CountEdit: TEdit;
    CountLabel: TLabel;
    RunButton: TButton;
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CycleProgramForm: TCycleProgramForm;

implementation

{$R *.dfm}

function Fact(aNumber: Integer): Integer;
var
  i: Integer;
begin
  if aNumber < 0 then
    Fact := 1;

  Result := 1;
  for i := 1 to aNumber do
    Result := Result * i;
end;

procedure TCycleProgramForm.RunButtonClick(Sender: TObject);
var
  a, x, k: Integer;
  Sum, Expr, e: Extended;
begin
  k := 0;
  Sum := 0;
  Expr := 0;
  a := StrToInt(AEdit.Text);
  x := StrToInt(XEdit.Text);
  e := StrToFloat(EEdit.Text);

  try
    // Обчислюємо нескінченну суму з заданою точністю
    repeat
      Expr := Power((a - x), -k) / (Power(a, 2 * k) + Fact(k));
      Sum := Sum + Expr;
      Inc(k);
    until (Abs(Expr) < e) or (k >= 100);
  except
    on e: Exception do
      ShowMessage('Error! ' + e.Message);
  end;

  SumEdit.Text := FloatToStr(Sum);
  CountEdit.Text := IntToStr(k);
end;

end.
