unit AddBuildingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TAddBuildingsForm = class(TForm)
    DatePicker: TDateTimePicker;
    AddBuildingButton: TButton;
    AdressEdit: TEdit;
    AreaEdit: TEdit;
    AdressLabel: TLabel;
    AreaLabel: TLabel;
    DateLabel: TLabel;
    ValueEdit: TEdit;
    ValueLabel: TLabel;
    DescriptioEdit: TEdit;
    DescriptionLabel: TLabel;
    procedure AddBuildingButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddBuildingsForm: TAddBuildingsForm;

implementation

uses MainUnit;

{$R *.dfm}

procedure TAddBuildingsForm.AddBuildingButtonClick(Sender: TObject);
var
  Building: TBuilding;
begin
  Building.Adress := AdressEdit.Text;
  Building.Area := StrToFloat(AreaEdit.Text);
  Building.Value := StrToFloat(ValueEdit.Text);
  Building.Date := DatePicker.Date;
  Building.Description := DescriptioEdit.Text;

  try
    Write(F, Building);
    ShowMessage('Приміщення додано!');
    AdressEdit.Text := '';
    AreaEdit.Text := '';
    ValueEdit.Text := '';
    DescriptioEdit.Text := '';
  except
    on E: Exception do
      ShowMessage('Error! ' + E.Message);
  end;
end;

end.
