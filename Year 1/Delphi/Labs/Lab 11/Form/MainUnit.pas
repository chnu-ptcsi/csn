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
// ��������� ��������� ����� � ����
//    Head - �������� ����
//    Element - ����, ���� ������� ������� � ����� �����
//
procedure Push(var Head: PNode; Element: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);             // ��������� ���'��� �� ����� �����
  NewNode^.Data := Element; // �������� ���� � ���� Data
  NewNode^.Next := Head;    // ������� �������� �� ������� ����� �����
  Head := NewNode;          // ��������� ������ �����
end;


//
// ��������� ��������� ������ �����
//
procedure UpdateStackOutput;
var
  CurrentNode: PNode;
  i: integer;
begin
  CurrentNode:= Head; // �������� ����� ������������ �� ������ �����
  i:= 0;              // ��������� ��� ����������� �� ������ ����
  repeat
    MainForm.StackOutput.RowCount:= i + 1;
    // �������� ���� ����������� ����� � ������
    MainForm.StackOutput.Cells[0,i]:= IntToStr(CurrentNode^.Data);
    // ������������ �������� ����� �� ��������� ������� �����
    CurrentNode:= CurrentNode^.Next;
    Inc(i);
  until CurrentNode = nil;
end;


//
// �������� ��� ��������� ����� � Input
//
procedure TMainForm.AddBtnClick(Sender: TObject);
var
  TmpData: Integer;
begin
  TmpData:= StrToInt(Input.Text); // �������� ���� � Input
  Push(Head, TmpData);            // ������ ��� ���� � ����
  UpdateStackOutput();            // ��������� ���� �����
  Input.Text:= '';                // ������� ���� ��������
end;


//
// �������� ��� ��������� � ����� ������� ���������� ����� ���� � ��
// ������� �� �� ������� ����� � ������� �� ���������
//
procedure TMainForm.ParseBtnClick(Sender: TObject);
var
  CurrentNode, NextNode: PNode;
  E: Integer;
begin
  // ������ �� �����, �� ����� �� ������� � Input
  if Input.Text = '' then Exit;

  E:= StrToInt(Input.Text); // ��������� ����� � � Input

  CurrentNode:= Head;       // ����� ����� ������������ �� ������ �����

  // �������� ������ �� ������ �����, ���� �� ��������� �����
  repeat
    if (CurrentNode^.Data = E) then begin // ���������� �� ���������� ����
      NextNode:= CurrentNode^.Next;  // �������� ��������� �� ��������� �����
      Push(Swap, NextNode^.Data);   // ������ ���� � ���������� ����� � Swap

      // ������������� �������� ������ ����� �� ��������� �� ���������
      // ����:
      //    1 -> 2 -> 3
      // �����:
      //    1 -> 3
      CurrentNode^.Next:= NextNode^.Next;

      Dispose(NextNode); // ���������� ���'���, ��� ������ �������� �����
    end;
    CurrentNode:= CurrentNode^.Next; // ���������� �� ���������� �����
  until (CurrentNode = nil) or (CurrentNode^.Next = nil);

  // �������� ������ �� ����� � �������, �� ������� ���������� �� �������
  while Swap <> nil do begin
    CurrentNode:= Swap;             // �������� ������ ����� � �����
    Push(Head, CurrentNode^.Data);  // ������ ����� � ������� ��������� �����
    Swap:= CurrentNode^.Next;       // ���������� �� ���������� ��������
    Dispose(CurrentNode);           // ��������� ���'���
  end;
  Swap:=nil; // ��������� ���������� ����

  UpdateStackOutput(); // ��������� ����
end;

end.
