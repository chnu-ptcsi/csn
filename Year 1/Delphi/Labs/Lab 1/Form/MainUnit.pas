unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMain = class(TForm)
    EditA: TEdit;
    EditB: TEdit;
    EditC: TEdit;
    EditD: TEdit;
    EditE: TEdit;
    EditF: TEdit;
    EditJ: TEdit;
    Result: TEdit;
    RunButton: TButton;
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.RunButtonClick(Sender: TObject);
var
  a,b,c,d,e,f,j: Integer;
  G: Real;
begin
  a:= 0; b:= 0; c:= 0; d:= 0;
  e:= 0; f:= 0; j:= 0; G:= 0;

  a:= StrToInt(EditA.Text);
  b:= StrToInt(EditB.Text);
  c:= StrToInt(EditC.Text);
  d:= StrToInt(EditD.Text);
  e:= StrToInt(EditE.Text);
  f:= StrToInt(EditF.Text);
  j:= StrToInt(EditJ.Text);

  G:= (c*d*f)/j + a/c - d*a/(c-b+a) + e;

  Result.Text:= 'Result: ' + FloatToStr(G);
end;

end.
