object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Lab 2 Form'
  ClientHeight = 90
  ClientWidth = 198
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditX: TEdit
    Left = 8
    Top = 8
    Width = 57
    Height = 21
    TabOrder = 0
    Text = 'X:'
  end
  object EditY: TEdit
    Left = 71
    Top = 8
    Width = 58
    Height = 21
    TabOrder = 1
    Text = 'Y:'
  end
  object EditZ: TEdit
    Left = 135
    Top = 8
    Width = 58
    Height = 21
    TabOrder = 2
    Text = 'Z:'
  end
  object EditP: TEdit
    Left = 8
    Top = 35
    Width = 57
    Height = 21
    TabOrder = 3
    Text = 'P:'
  end
  object EditQ: TEdit
    Left = 71
    Top = 35
    Width = 58
    Height = 21
    TabOrder = 4
    Text = 'Q:'
  end
  object RunButton: TButton
    Left = 135
    Top = 35
    Width = 58
    Height = 25
    Caption = 'Run'
    TabOrder = 5
    OnClick = RunButtonClick
  end
  object EditResult: TEdit
    Left = 8
    Top = 62
    Width = 185
    Height = 21
    TabOrder = 6
    Text = 'Result:'
  end
end
