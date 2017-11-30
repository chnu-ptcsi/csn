unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    EditN: TEdit;
    Output: TMemo;
    RunButton: TButton;
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RunButtonClick(Sender: TObject);
var
   A: array[1..400] of integer;
   N,i,j,max: integer;
   outstr: string;
   f: boolean;
begin
  N:= strtoint(EditN.Text);
  Output.Lines.Add('-------------');
  Output.Lines.Add('Generated array...');
  Sleep(1000);
  for i := 1 to N do begin
      A[i]:= random(100);
      outstr:= outstr + '    ' + inttostr(A[i]);
      if i mod 10 = 0 then begin
        Output.Lines.Add(outstr);
        outstr:= '';
        Sleep(300);
      end;
  end;
  Output.Lines.Add('Done!');


  Output.Lines.Add('Search max number...');
  max:= A[1];
  for i := 1 to n do begin
    f:= true;
    for j := 1 to n do
      if (i<>j) and (A[i] = A[j]) then begin
        f:=false;
        break;
      end;

    if f and (A[i] > max) then max:= A[i];
  end;
  Sleep(2000);
  Output.Lines.Add('Done! Max number is ' + inttostr(max));
end;

end.
