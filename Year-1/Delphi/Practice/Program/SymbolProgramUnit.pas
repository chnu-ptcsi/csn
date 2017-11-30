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

// ќбробник, €кий виконуЇ завданн€:
//
// «адано текст, слова в €кому розд≥лен≥ проб≥лами ≥ розд≥ловими знаками.
// –озробити програму, €ка в словах непарноњ довжини цього тексту
// вилучаЇ середню л≥теру.
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
      // якщо стоп-символ, то переходимо до ман≥пулюванн€ словом
      if Length(word) mod 2 = 0 then
      begin
        // якщо слово парне, то продовжуЇмо
        word := '';
        Inc(i);
        continue;
      end
      else
      begin
        // якщо слово непарне, то видал€Їмо символ по середин≥ слова
        Delete(Line, i - 1 - (Length(word) - 1) div 2, 1);
        word := '';
        // ≥ не зб≥льшуЇмо, бо р€док став на 1 символ коротшим
      end;
    end
    else
    begin
      // якщо не стоп-символ, то накопичуЇмо символ в слово
      word := word + Line[i];
      Inc(i);
    end;

  until i > Length(Line);

  OutputEdit.Text := Line;
end;

end.
