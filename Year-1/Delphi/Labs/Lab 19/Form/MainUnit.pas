unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  // ��������� �������� �������� ��� ������ � Shell, ��� ��������� Help.
  ShellAPI;

type
  TMainForm = class(TForm)
    GetHelpButton: TButton;
    procedure GetHelpButtonClick(Sender: TObject);
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
// ��������� ��� �������� ���� ����� Shell
//
procedure OpenFile(const Path: string);
var
  SEInfo: TShellExecuteInfo;
begin
  if FileExists(Path) then
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.Wnd := 0;
    SEInfo.lpFile := PChar(Path);
    SEInfo.lpParameters := nil;
    SEInfo.nShow := SW_SHOWDEFAULT;
    SEInfo.lpVerb := 'open';
    SEInfo.lpDirectory := PChar(ExtractFileDir(Path));
    ShellExecuteEx(@SEInfo);
  end
  else
    ShowMessage('Help doesn`t exists!');
end;

//
// ���������-�������� ���� �� ������
// ³������ ������������
//
procedure TMainForm.GetHelpButtonClick(Sender: TObject);
begin
  // � �������� � ��������� ������ ��������� �� ������������, �� �����
  // relative path ���������� �������, �� ���� �� ���������.
  OpenFile('Lab19Help.lnk');
end;

end.
