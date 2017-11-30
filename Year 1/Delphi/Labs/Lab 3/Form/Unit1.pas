unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EditX: TEdit;
    EditY: TEdit;
    EditZ: TEdit;
    EditP: TEdit;
    EditQ: TEdit;
    RunButton: TButton;
    EditResult: TEdit;
    procedure RunButtonClick(Sender: TObject);
  end;

var
  Form1: TForm1;
  x,y,z: integer;
  p,q: boolean;

implementation

{$R *.dfm}

function min(a,b,c:integer):integer;
begin
  if (a<=b) and (a<=c) then
    min:= a
  else begin
    if b<=c then
      min:= b
    else
      min:= c;
  end;
end;

procedure TForm1.RunButtonClick(Sender: TObject);
begin
  x:= strtoint(EditX.Text);
  y:= strtoint(EditY.Text);
  z:= strtoint(EditZ.Text);
  p:= strtobool(EditP.Text);
  q:= strtobool(EditQ.Text);

  if min(abs(x), abs(y), abs(z)) > (x+y+z)  then begin
    if p then
      EditResult.Text:= 'Result: TRUE'
    else
      EditResult.Text:= 'Result: FALSE';
  end
  else begin
    if q then
      EditResult.Text:= 'Result: TRUE'
    else
      EditResult.Text:= 'Result: FALSE';
  end;
end;

end.
