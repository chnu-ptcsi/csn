unit SymbolProgramUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSymbolProgramForm = class(TForm)
    InputEdit: TEdit;
    RunButton: TButton;
    OutputEdit: TEdit;
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SymbolProgramForm: TSymbolProgramForm;

implementation

{$R *.dfm}

// ��������, ���� ������ ��������:
//
// ������ �����, ����� � ����� ������� �������� � ���������� �������.
// ��������� ��������, ��� � ������ ������� ������� ����� ������
// ������ ������� �����.
//
procedure TSymbolProgramForm.RunButtonClick(Sender: TObject);
const
  StopChars = [' ', ',', ';', '.', '!', '?', ':'];
var
  Line, word: String;
  i: Integer;
begin
  Line := InputEdit.Text;

  i := 1;
  word := '';
  repeat

    if Line[i] in StopChars then
    begin
      // ���� ����-������, �� ���������� �� ������������ ������
      if Length(word) mod 2 = 0 then
      begin
        // ���� ����� �����, �� ����������
        word := '';
        Inc(i);
        continue;
      end
      else
      begin
        // ���� ����� �������, �� ��������� ������ �� ������� �����
        Delete(Line, i - 1 - (Length(word) - 1) div 2, 1);
        word := '';
        // � �� ��������, �� ����� ���� �� 1 ������ ��������
      end;
    end
    else
    begin
      // ���� �� ����-������, �� ���������� ������ � �����
      word := word + Line[i];
      Inc(i);
    end;

  until i > Length(Line);

  OutputEdit.Text := Line;
end;

end.
