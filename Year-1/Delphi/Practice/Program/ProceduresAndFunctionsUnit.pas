unit ProceduresAndFunctionsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TProceduresAndFunctionsForm = class(TForm)
    PointsListBox: TListBox;
    XEdit: TEdit;
    YEdit: TEdit;
    AddPointButton: TButton;
    XLabel: TLabel;
    YLabel: TLabel;
    RunButton: TButton;
    dXEdit: TEdit;
    dYEdit: TEdit;
    dXLabel: TLabel;
    dYLabel: TLabel;
    CanMakeSquareEdit: TEdit;
    CanMakeSquareLabel: TLabel;
    procedure AddPointButtonClick(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TXYPoint = record
    X: Integer;
    Y: Integer;
  end;

  TYield = record
      isSquare: Boolean;
      A,B,C,D: TXYPoint;
   end;

var
  ProceduresAndFunctionsForm: TProceduresAndFunctionsForm;
  Points: array of TXYPoint;
  D: TXYPoint;
  
implementation

{$R *.dfm}

// Процедура оновлення ListBox
procedure RefreshListBox();
var
  i: Integer;
begin
  ProceduresAndFunctionsForm.PointsListBox.Clear;

  for i := Low(Points) to High(Points) do
    ProceduresAndFunctionsForm.PointsListBox.Items.Add
      (IntToStr(i) + ':(' + IntToStr(Points[i].X) + ',' +
      IntToStr(Points[i].Y) + ')');
end;

// Відстань між двома точками
function LengthBetweenTwoPoints(A,B: TXYPoint):Real;
begin
  Result:= sqr(A.X - B.X) + sqr(A.Y - B.Y);   
end;

// Логічна функція перевірки, чи чотири точки утворюють квадрат
function IsSquare(A,B,C,D: TXYPoint): Boolean;
var
  s1,s2,s3,s4,s5,s6:Real;
begin
  // Відстані між всіма точками
  s1:= LengthBetweenTwoPoints(A,B);
  s2:= LengthBetweenTwoPoints(A,C);
  s3:= LengthBetweenTwoPoints(A,D);
  s4:= LengthBetweenTwoPoints(B,C);
  s5:= LengthBetweenTwoPoints(B,D);
  s6:= LengthBetweenTwoPoints(C,D);

  // Квадрат ABCD
  if (s1 = s3) and (s1 = s4) and (s1 = s6) then
    IsSquare:= True

  // Квадрат ABDC
  else if (s1 = s2) and (s1 = s5) and (s1 = s6) then
    IsSquare:= True

  // Квадрат ACBD
  else if (s2 = s3) and (s2 = s4) and (s2 = s5) then
    IsSquare:= True

  // Немає квадратів
  else
    IsSquare:= False;
end;

// Процедура додавання нових точок
procedure TProceduresAndFunctionsForm.AddPointButtonClick(Sender: TObject);
var
  NewPoint: TXYPoint;
begin
  NewPoint.X := StrToInt(XEdit.Text);
  NewPoint.Y := StrToInt(YEdit.Text);

  SetLength(Points, Length(Points) + 1);
  Points[Length(Points) - 1] := NewPoint;

  // Оновлюємо вивід
  RefreshListBox;
end;

// Логічна функція, що перевіряє чи можемо ми скласти з множини точок квадрат
function CanWeMakeSquare(D: TXYPoint; Points: array of TXYPoint):TYield;
var
  i,j,k: Integer;
  Yield: TYield;
begin
  Yield.isSquare:= False;

  for i := Low(Points) to High(Points) do
    for j := Low(Points) to High(Points) do
      for k := Low(Points) to High(Points) do
      begin
        if ((Points[i].X = Points[j].X) and (Points[i].Y = Points[j].Y)) or
           ((Points[i].X = Points[k].X) and (Points[i].Y = Points[k].Y)) or
           ((Points[j].X = Points[k].X) and (Points[j].Y = Points[k].Y)) then continue;

        if IsSquare(D, Points[i], Points[j], Points[k]) then
        begin
          Yield.isSquare:= True;
          Yield.A:= Points[i];
          Yield.B:= Points[j];
          Yield.C:= Points[k];

          CanWeMakeSquare:= Yield;
          Exit;
        end;  
      end;

  CanWeMakeSquare:= Yield;
end;

// Обробник пошуку квадратів
procedure TProceduresAndFunctionsForm.RunButtonClick(Sender: TObject);
var
  i,j,k,h: Integer;
  Res: TYield;
begin
  D.X:= StrToInt(dXEdit.Text);
  D.Y:= StrToInt(dYEdit.Text);

  Res:= CanWeMakeSquare(D, Points);
  
  if Res.isSquare then
    CanMakeSquareEdit.Text:= 'Так'
  else
    CanMakeSquareEdit.Text:= 'Ні';  
end;

end.
