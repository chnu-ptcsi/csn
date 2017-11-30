unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TMainForm = class(TForm)
    InputTable: TStringGrid;
    CheckBtn: TBitBtn;
    IncreaseBtn: TBitBtn;
    DecreaseBtn: TBitBtn;
    procedure IncreaseBtnClick(Sender: TObject);
    procedure DecreaseBtnClick(Sender: TObject);
    procedure CheckBtnClick(Sender: TObject);
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
// ��������� ������� ���� �� ������ ��������
//
procedure TMainForm.CheckBtnClick(Sender: TObject);
var
  Row, i, j: Byte;
begin
  // �������� ������� ����� ������� � ����
  Row:= InputTable.RowCount-1;

  try // �������� ��� ����'������� ����������
    try // ������ �������� ��������
    
      // ���������� �� �������� � ������� �� 0 � �� ������� �������,
      // � ����� ���������� �� ������� ����� �� ���������� �������� ��
      // ����������� ����� (����) �������� ����� �� ������ ������� � �� 0
      for i := 0 to Row-1 do
        for j := Row-i-1 downto 0 do
          // ���� ������� �������� ������� �� �������, �������� ����������
          if InputTable.Cells[i,j] <> InputTable.Cells[Row-j,Row-i] then
            raise Exception.Create('Matrix isn`t symmenric!');

    except
      // ������� ���������� 
      on E : Exception do begin
        ShowMessage('Catch warning: ' + E.Message);
        Exit;
      end;
    end;

    // ���� �������� ������� ��� ���������, ������ ��������� �����������,
    // �� ������� � �����������
    ShowMessage('Matrix is symmetric!');
    
  finally
    // � ����-����� ������� �������� �����������, �� ������ ���������
    ShowMessage('Operation has been done.');
  end;

end;


//
//  ���������-�������� ���� �� �����, �� ������ �������
//
procedure TMainForm.DecreaseBtnClick(Sender: TObject);
begin
  try
    // ���� ������� ����� 2�2, ��� �������� ����������
    if (InputTable.ColCount <= 2) or (InputTable.RowCount <= 2) then
      raise Exception.Create('It is smallest allowable size of matrix!');
  except
    // ���������� ���������� 
    on E : Exception do begin
      ShowMessage('Catch error: ' + E.Message);
      Exit;
    end;
  end;

  // ���� �� �������� ���������, ��� �������� �������
  InputTable.ColCount:= InputTable.ColCount - 1;
  InputTable.RowCount:= InputTable.RowCount - 1;
end;


//
//  ���������-�������� ���� �� �����, �� ������ �������
//
procedure TMainForm.IncreaseBtnClick(Sender: TObject);
begin
  try
    // ������ ���������� ���� ����������� ������������ ��������� ����� Byte
    if (InputTable.ColCount >= 255) or (InputTable.RowCount >= 255) then
      raise Exception.Create('It is maximal allowable size of matrix!');
  except
    // ���������� ����������
    on E : Exception do begin
      ShowMessage('Catch error: ' + E.Message);
      Exit;
    end;
  end;

  // ���� �� �������� ���������, ��� �������� �������
  InputTable.ColCount:= InputTable.ColCount + 1;
  InputTable.RowCount:= InputTable.RowCount + 1;
end;

end.
