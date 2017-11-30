unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    MyEdit: TEdit;
    MyPanel: TPanel;
    MyButton: TButton;
    procedure MyEditMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyPanelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MyPanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure MyButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
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
// ��������� ��䳿 OnMouseDown.
//

// ��� ������������ �� ��������� ��� ������ ����, �� ����������� �����
// BeginDrag � ���������� False. �� ������, �� ������ ����������� �� ���������
// ���� ���� �� ������������ �� ����� �������

procedure TMainForm.MyButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then MyButton.BeginDrag(False);
end;

procedure TMainForm.MyEditMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then MyEdit.BeginDrag(False);
end;

//
// ��������� ���� OnDragOver.
//

// ��� ������������ �� ����� �ᒺ�� �� ������������ � ����� �������� Edit.
// ��������� �������� ���������� � �������� Accept.
procedure TMainForm.MyPanelDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = MyEdit;
end;

procedure TMainForm.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:= Source is TButton;
end;

//
// ��������� ���� OnDragDrop.
// �� ���� ���������� �� ��� ������� �ᒺ���.
//

// ��� ���������� ����� ������ � ���������� ���� Edit � ��������� ����� Panel
procedure TMainForm.MyPanelDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  MyPanel.Caption:= MyEdit.Text;
end;

// ϳ� ��� ������� ��� ������� ������(�������� Source, ���� ���������� �� ����
// TButton �� ��������� �������� as) ��������� ��� ���������� �� ��������� ��
// ����.
procedure TMainForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (Source as TButton).Left:= X;
  (Source as TButton).Top:= Y;
end;

end.
