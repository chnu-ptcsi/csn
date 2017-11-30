object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Symmetry Checker'
  ClientHeight = 356
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object InputTable: TStringGrid
    Left = 0
    Top = 0
    Width = 544
    Height = 280
    Align = alTop
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 38
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -3
    ExplicitTop = -3
  end
  object CheckBtn: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 285
    Width = 440
    Height = 66
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    Caption = 'Check Symmetry'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = CheckBtnClick
  end
  object IncreaseBtn: TBitBtn
    Left = 451
    Top = 285
    Width = 90
    Height = 30
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Increase'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = IncreaseBtnClick
  end
  object DecreaseBtn: TBitBtn
    Left = 451
    Top = 320
    Width = 90
    Height = 30
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Decrease'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = DecreaseBtnClick
  end
end
