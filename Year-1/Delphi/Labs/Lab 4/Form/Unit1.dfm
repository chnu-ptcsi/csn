object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Lab4Form'
  ClientHeight = 312
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditN: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'N'
  end
  object Output: TMemo
    Left = 8
    Top = 37
    Width = 505
    Height = 268
    Lines.Strings = (
      'Hello!')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object RunButton: TButton
    Left = 135
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 2
    OnClick = RunButtonClick
  end
end
