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
// Обробники події OnMouseDown.
//

// Тут перевіряється чи натиснута ліва клавіша миші, та викликається метод
// BeginDrag з параметром False. Це означає, що процес перетягання не почнеться
// поки миша не пересунеться на деяку відстань

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
// Обробники подій OnDragOver.
//

// Тут перевіряється чи дійсно об’єкт що перетягається є полем введення Edit.
// Результат перевірки заноситься у параметр Accept.
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
// Обробники подій OnDragDrop.
// Ця подія генерується під час кидання об’єкту.
//

// Тут відбувається запис тексту з текстового поля Edit у заголовок панелі Panel
procedure TMainForm.MyPanelDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  MyPanel.Caption:= MyEdit.Text;
end;

// Під час обробки для вихідної кнопки(параметр Source, який приведений до типу
// TButton за допомогою операції as) задаються нові координати її положення на
// формі.
procedure TMainForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (Source as TButton).Left:= X;
  (Source as TButton).Top:= Y;
end;

end.
