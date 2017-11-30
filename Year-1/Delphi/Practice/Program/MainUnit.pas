unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileGroup: TMenuItem;
    FIleCreateItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    N5: TMenuItem;
    FileViewItem: TMenuItem;
    FileAddItem: TMenuItem;
    N8: TMenuItem;
    FIleExitItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    CycleProgram: TMenuItem;
    SymbolProgram: TMenuItem;
    ProceduresAndFunctionsProgram: TMenuItem;
    About: TMenuItem;
    N1: TMenuItem;
    N1421: TMenuItem;
    N91: TMenuItem;
    procedure FileGroupClick(Sender: TObject);
    procedure FIleCreateItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure FileViewItemClick(Sender: TObject);
    procedure FileAddItemClick(Sender: TObject);
    procedure FIleExitItemClick(Sender: TObject);
    procedure CycleProgramClick(Sender: TObject);
    procedure SymbolProgramClick(Sender: TObject);
    procedure ProceduresAndFunctionsProgramClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TBuilding = record
    Adress: String[40];
    Area: Real;
    Date: TDate;
    Value: Real;
    Description: ShortString;
  end;

var
  MainForm: TMainForm;
  F: File of TBuilding;
  FileOpened: Boolean = false;
  FileName: string = '';

implementation

// ϳ������� ������� �����
uses AddBuildingsUnit, ViewBuildingsUnit, CycleProgramUnit, SymbolProgramUnit,
  ProceduresAndFunctionsUnit;

{$R *.dfm}

// ������� ��� ������������ �������� ����, � ��������� �� ���������� �����
procedure TMainForm.FileGroupClick(Sender: TObject);
begin
  if FileOpened then
  begin
    FileCloseItem.Enabled := true;
    FileViewItem.Enabled := true;
    FileAddItem.Enabled := true;
  end
  else
  begin
    FileCloseItem.Enabled := false;
    FileViewItem.Enabled := false;
    FileAddItem.Enabled := false;
  end;
end;

// �������� ��������� �����
procedure TMainForm.FIleCreateItemClick(Sender: TObject);
begin
  if FileOpened then
    CloseFile(F);

  if SaveDialog.Execute then
  begin
    FileName := SaveDialog.FileName;
    AssignFile(F, FileName);
    Rewrite(F);
    FileOpened := true;
  end;
end;

// �������� �������� �����
procedure TMainForm.FileOpenItemClick(Sender: TObject);
begin
  if FileOpened then
    CloseFile(F);

  if OpenDialog.Execute then
  begin
    FileName := OpenDialog.FileName;
    AssignFile(F, FileName);
    Reset(F);
    FileOpened := true;
  end;
end;

// �������� �������� �����
procedure TMainForm.FileCloseItemClick(Sender: TObject);
begin
  if FileOpened then
  begin
    CloseFile(F);
    FileOpened := false;
  end;
end;

// ��������, �� ������� �����, ��� ��������� ���� �����
procedure TMainForm.FileViewItemClick(Sender: TObject);
begin
  if FileSize(F) <> 0 then
    ViewBuildingsForm.ShowModal
  else
    ShowMessage('File is empty!');
end;

// ��������, �� ������� ����� ��������� ������ ������ � ����
procedure TMainForm.FileAddItemClick(Sender: TObject);
begin
  AddBuildingsForm.ShowModal;
end;

// �������� ������ � ��������
procedure TMainForm.FIleExitItemClick(Sender: TObject);
begin
  Close;
end;

// ��������, �� ������� �������� �� �������� ��������
procedure TMainForm.CycleProgramClick(Sender: TObject);
begin
  CycleProgramForm.Show;
end;

// ��������, ���� ������� �������� �� �������� �����
procedure TMainForm.SymbolProgramClick(Sender: TObject);
begin
  SymbolProgramForm.Show;
end;

// ��������, ���� ������� �������� �� ��������� � �������
procedure TMainForm.ProceduresAndFunctionsProgramClick(Sender: TObject);
begin
  ProceduresAndFunctionsForm.Show;
end;

end.
