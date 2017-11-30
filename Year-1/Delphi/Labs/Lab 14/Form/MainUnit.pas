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
// ѕроцедура обробки кл≥ку по кнопц≥ перев≥рки
//
procedure TMainForm.CheckBtnClick(Sender: TObject);
var
  Row, i, j: Byte;
begin
  // ќтримуЇмо реальне число колонок в с≥тц≥
  Row:= InputTable.RowCount-1;

  try // ќбгортка дл€ обов'€зковго завершенн€
    try // —проба операц≥њ перев≥рки
    
      // ѕеребираЇмо вс≥ елементи в стовпц≥ в≥д 0 ≥ до довжини стовпц€,
      // а р€дки перебираЇмо в≥д довжини р€дка не враховуючи елемент≥в що
      // знаход€тьс€ нижче (вище) заданого р€дка та поб≥чноњ д≥агонал≥ ≥ до 0
      for i := 0 to Row-1 do
        for j := Row-i-1 downto 0 do
          // якщо в≥дпов≥дн≥ елементи матриц≥ не однаков≥, викидаЇмо виключенн€
          if InputTable.Cells[i,j] <> InputTable.Cells[Row-j,Row-i] then
            raise Exception.Create('Matrix isn`t symmenric!');

    except
      // ќбробка виключенн€ 
      on E : Exception do begin
        ShowMessage('Catch warning: ' + E.Message);
        Exit;
      end;
    end;

    // якщо операц≥€ пройшла без виключень, можемо пов≥домити користувача,
    // що матриц€ Ї симетричною
    ShowMessage('Matrix is symmetric!');
    
  finally
    // ¬ будь-€кому випадку виводимо пов≥домленн€, що робота завершена
    ShowMessage('Operation has been done.');
  end;

end;


//
//  ѕроцедура-обробник кл≥ку по кноц≥, що зменшуЇ матрицю
//
procedure TMainForm.DecreaseBtnClick(Sender: TObject);
begin
  try
    // якщо матриц€ менше 2х2, тод≥ викидаЇмо виключенн€
    if (InputTable.ColCount <= 2) or (InputTable.RowCount <= 2) then
      raise Exception.Create('It is smallest allowable size of matrix!');
  except
    // ќброблюЇмо виключенн€ 
    on E : Exception do begin
      ShowMessage('Catch error: ' + E.Message);
      Exit;
    end;
  end;

  // якщо не отримали виключень, тод≥ зменшуЇмо матрицю
  InputTable.ColCount:= InputTable.ColCount - 1;
  InputTable.RowCount:= InputTable.RowCount - 1;
end;


//
//  ѕроцедура-обробник кл≥ку по кноц≥, що зб≥льшуЇ матрицю
//
procedure TMainForm.IncreaseBtnClick(Sender: TObject);
begin
  try
    //  идаЇмо виключенн€ якщо перевищений максимальний допустим≥й розм≥р Byte
    if (InputTable.ColCount >= 255) or (InputTable.RowCount >= 255) then
      raise Exception.Create('It is maximal allowable size of matrix!');
  except
    // ќброблюЇмо виключенн€
    on E : Exception do begin
      ShowMessage('Catch error: ' + E.Message);
      Exit;
    end;
  end;

  // якщо не отримали виключень, тод≥ зб≥льшуЇмо матрицю
  InputTable.ColCount:= InputTable.ColCount + 1;
  InputTable.RowCount:= InputTable.RowCount + 1;
end;

end.
