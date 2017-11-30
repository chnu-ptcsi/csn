unit ViewBuildingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TViewBuildingsForm = class(TForm)
    OutputGrid: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewBuildingsForm: TViewBuildingsForm;

implementation

uses MainUnit;

{$R *.dfm}

procedure TViewBuildingsForm.FormShow(Sender: TObject);
var
  i: Integer;
  Building: TBuilding;
begin
  OutputGrid.Cells[0, 0] := '������';
  OutputGrid.Cells[1, 0] := '�����';
  OutputGrid.Cells[2, 0] := '���� ��������';
  OutputGrid.Cells[3, 0] := '������� ����';
  OutputGrid.Cells[4, 0] := '����';

  try
    i := 1;
    repeat
      Read(F, Building);
      OutputGrid.RowCount := i + 1;
      OutputGrid.Cells[0, i] := Building.Adress;
      OutputGrid.Cells[1, i] := FloatToStr(Building.Area);
      OutputGrid.Cells[2, i] := DateToStr(Building.Date);
      OutputGrid.Cells[3, i] := FloatToStr(Building.Value);
      OutputGrid.Cells[4, i] := Building.Description;
      Inc(i);
    until Eof(F);
  except
    on E: Exception do
      ShowMessage('Error!' + E.Message);
  end;
end;

end.
