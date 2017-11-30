unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  // Імпортуємо сторонню бібліотеку для роботи з Shell, щоб відкривати Help.
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
// Процедура для відкриття фалів через Shell
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
// Процедура-обробник кліку по кнопці
// Відкриває документацію
//
procedure TMainForm.GetHelpButtonClick(Sender: TObject);
begin
  // В директорії з бінарником лежить посилання на документацію, бо через
  // relative path викидається помилка, що файл не знайдений.
  OpenFile('Lab19Help.lnk');
end;

end.
