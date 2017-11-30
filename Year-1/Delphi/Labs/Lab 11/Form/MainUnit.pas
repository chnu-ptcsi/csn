unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TMainForm = class(TForm)
    StackOutput: TStringGrid;
    AddBtn: TButton;
    Input: TEdit;
    ParseBtn: TButton;
    procedure AddBtnClick(Sender: TObject);
    procedure ParseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  PNode = ^Node;
  Node = record
    Data: Integer;
    Next: PNode;
  end;

var
  MainForm: TMainForm;
  Head, Swap: PNode;

implementation

{$R *.dfm}

//
// Процедура додавання вузла в стек
//    Head - існуючий стек
//    Element - данні, котрі потрібно занести в вузол стеку
//
procedure Push(var Head: PNode; Element: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);             // Вивіділяємо пам'ять під новий вузол
  NewNode^.Data := Element; // Заносимо данні в поле Data
  NewNode^.Next := Head;    // Ставимо вказівник на останній вузол стеку
  Head := NewNode;          // Оновлюємо голову стеку
end;


//
// Процедура оновлення виводу стеку
//
procedure UpdateStackOutput;
var
  CurrentNode: PNode;
  i: integer;
begin
  CurrentNode:= Head; // Теперішній вузол встановлюємо на голову стеку
  i:= 0;              // Інкримент для проходження по рядках сітки
  repeat
    MainForm.StackOutput.RowCount:= i + 1;
    // Виводимо данні теперішнього вузла в комірку
    MainForm.StackOutput.Cells[0,i]:= IntToStr(CurrentNode^.Data);
    // Встановлюємо теперішній вузол на наступний елемент стеку
    CurrentNode:= CurrentNode^.Next;
    Inc(i);
  until CurrentNode = nil;
end;


//
// Обробник для додавання вузла з Input
//
procedure TMainForm.AddBtnClick(Sender: TObject);
var
  TmpData: Integer;
begin
  TmpData:= StrToInt(Input.Text); // Заносимо данні з Input
  Push(Head, TmpData);            // Пушимо нові данні в стек
  UpdateStackOutput();            // Оновлюємо вивід стеку
  Input.Text:= '';                // Очищуємо поле введення
end;


//
// Обробник для вилучення зі стеку кожного наступного вузла після Е та
// переміщує їх на початок стеку в порядку їх розміщення
//
procedure TMainForm.ParseBtnClick(Sender: TObject);
var
  CurrentNode, NextNode: PNode;
  E: Integer;
begin
  // Захист від ідіотів, які нічого не введуть в Input
  if Input.Text = '' then Exit;

  E:= StrToInt(Input.Text); // Отримання числа Е з Input

  CurrentNode:= Head;       // Даний вузол встановлюємо на голову стеку

  // Виконуємо прохід по всьому стеку, доки не зустрінемо кінець
  repeat
    if (CurrentNode^.Data = E) then begin // Перевіряємо чи співпадають данні
      NextNode:= CurrentNode^.Next;  // Зберігаємо посилання на наступний вузол
      Push(Swap, NextNode^.Data);   // Пушимо данні з наступного вузла в Swap

      // Переставляємо вказівник даного вузла на наступний за наступним
      // Було:
      //    1 -> 2 -> 3
      // Стане:
      //    1 -> 3
      CurrentNode^.Next:= NextNode^.Next;

      Dispose(NextNode); // Вивільняємо пам'ять, яку займав настпний вузол
    end;
    CurrentNode:= CurrentNode^.Next; // Переходимо до наступного вузла
  until (CurrentNode = nil) or (CurrentNode^.Next = nil);

  // Виконуємо прохід по стеку з вузлами, які потрібно перемістити на вершину
  while Swap <> nil do begin
    CurrentNode:= Swap;             // Заносимо голову стеку в змінну
    Push(Head, CurrentNode^.Data);  // Пушимо вузол у вершину головного стеку
    Swap:= CurrentNode^.Next;       // Переходимо до наступного елементу
    Dispose(CurrentNode);           // Звільняємо пам'ять
  end;
  Swap:=nil; // Зануляємо тимчасовий стек

  UpdateStackOutput(); // Оновлюємо вивід
end;

end.
