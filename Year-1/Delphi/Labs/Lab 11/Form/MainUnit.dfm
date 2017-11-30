object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Stack Parser'
  ClientHeight = 271
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StackOutput: TStringGrid
    Left = 8
    Top = 8
    Width = 200
    Height = 257
    ColCount = 1
    DefaultColWidth = 195
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object AddBtn: TButton
    Left = 214
    Top = 55
    Width = 366
    Height = 50
    Caption = 'Add new item'
    TabOrder = 1
    OnClick = AddBtnClick
  end
  object Input: TEdit
    Left = 214
    Top = 8
    Width = 366
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ParseBtn: TButton
    Left = 214
    Top = 111
    Width = 366
    Height = 50
    Caption = 'Parse'
    TabOrder = 3
    OnClick = ParseBtnClick
  end
end
