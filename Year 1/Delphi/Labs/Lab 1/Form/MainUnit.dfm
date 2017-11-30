object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Lab1Console'
  ClientHeight = 93
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditA: TEdit
    Left = 8
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 0
    Text = 'A'
  end
  object EditB: TEdit
    Left = 63
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 1
    Text = 'B'
  end
  object EditC: TEdit
    Left = 119
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 2
    Text = 'C'
  end
  object EditD: TEdit
    Left = 175
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 3
    Text = 'D'
  end
  object EditE: TEdit
    Left = 8
    Top = 35
    Width = 49
    Height = 21
    TabOrder = 4
    Text = 'E'
  end
  object EditF: TEdit
    Left = 63
    Top = 35
    Width = 50
    Height = 21
    TabOrder = 5
    Text = 'F'
  end
  object EditJ: TEdit
    Left = 119
    Top = 35
    Width = 50
    Height = 21
    TabOrder = 6
    Text = 'J'
  end
  object Result: TEdit
    Left = 8
    Top = 62
    Width = 217
    Height = 21
    TabOrder = 7
    Text = 'Rusult: '
  end
  object RunButton: TButton
    Left = 175
    Top = 31
    Width = 50
    Height = 25
    Caption = 'Run'
    TabOrder = 8
    OnClick = RunButtonClick
  end
end
