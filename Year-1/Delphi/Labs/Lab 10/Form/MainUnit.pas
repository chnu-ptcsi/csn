unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TMainForm = class(TForm)
    StringGrid1: TStringGrid;
    EditA: TEdit;
    EditB: TEdit;
    EditC: TEdit;
    EditD: TEdit;
    EditE: TEdit;
    EditF: TEdit;
    EditJ: TEdit;
    EditT: TEdit;
    AddButton: TButton;
    AddTwoLastButton: TButton;
    SwapButton: TButton;
    MultipleButton: TButton;
    ClearStackButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure AddTwoLastButtonClick(Sender: TObject);
    procedure SwapButtonClick(Sender: TObject);
    procedure ClearStackButtonClick(Sender: TObject);
    procedure MultipleButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

type PNode = ^Node;
      Node = record
        Data: Real;
        Next: PNode;
      end;

var
  Stack: PNode;

// Занесення елементу в стек
procedure Push(var S:PNode; element: Real);
var
  q: PNode;
begin
  New(q);
  q^.Data:= element;
  q^.Next:= S;
  S:= q;
end;

// Видалення стеку
procedure Pop(var S:PNode);
var
  PDel:PNode;
  P:PNode;
begin
  P:= S;
  While P<>nil Do
    begin
      PDel:= P;
      P:= P.Next;
      Dispose(PDel);
    end;
  S:=nil;
end;

// Оновлення сітки в яку виводиться стек
procedure UpdateStack;
var
  S: PNode;
  i:integer;
begin
  for i:= 1 to 10 do
    MainForm.StringGrid1.cells[0,i-1] := '';

  S:= Stack;

  i:=0;
  while s <> nil do begin
    MainForm.StringGrid1.cells[0,i] := FloatToStr(s^.data);
    s:=s^.Next;
    Inc(i);
  end;
end;

// Занесення данних до стеку з попереднім опрацюванням
procedure TMainForm.AddButtonClick(Sender: TObject);
var
  a,b,c,d,e,f,j,t: integer;
  G: Real;
begin
  a := StrToInt(EditA.Text);
  b := StrToInt(EditB.Text);
  c := StrToInt(EditC.Text);
  d := StrToInt(EditD.Text);
  e := StrToInt(EditE.Text);
  f := StrToInt(EditF.Text);
  j := StrToInt(EditJ.Text);
  t := StrToInt(EditT.Text);

  G:= c*((d*f)/j) + a/c - (e*t)/(c-b+a);

  Push(Stack, G);
  UpdateStack;
end;

// Додати два останніх елементи стеку і вивисти повідомленням
procedure TMainForm.AddTwoLastButtonClick(Sender: TObject);
var
  S: PNode;
  sum: Real;
begin
  S:= Stack;
  sum:= S^.data;
  S:= S^.Next;
  sum:= sum + S^.data;
  showmessage(floattostr(sum));
end;

// Очищення стеку і очистка сітки
procedure TMainForm.ClearStackButtonClick(Sender: TObject);
begin
  Pop(Stack);
  UpdateStack;
end;

// Множення двох останніх елементів і занесення результату у вершину стеку
procedure TMainForm.MultipleButtonClick(Sender: TObject);
var
  S:PNode;
  d: Real;
begin
  S:= Stack;
  d:= S^.Data;
  S:= S^.Next;
  d:= d * S^.Data;
  Stack:= Stack^.Next;
  Stack^.Data:= d;
  UpdateStack;
end;

// Створення стеку при ініціалізації форми
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Stack:= nil;
end;

// Змінити два останніх елементи місцями
procedure TMainForm.SwapButtonClick(Sender: TObject);
var
  S: PNode;
  d: Real;
begin
  S:= Stack;
  d:= S^.Data;
  S:= S^.Next;
  Stack^.Data:= S^.Data;
  S^.Data:= d;
  UpdateStack;
end;

end.
