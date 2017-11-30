object SymbolProgramForm: TSymbolProgramForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1110' '#1088#1103#1076#1082#1080
  ClientHeight = 98
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object InputEdit: TEdit
    Left = 8
    Top = 8
    Width = 444
    Height = 21
    TabOrder = 0
    Text = 'About two weeks ago, Apple released the first beta of Xcode.'
  end
  object RunButton: TButton
    Left = 8
    Top = 62
    Width = 444
    Height = 30
    Caption = #1054#1087#1088#1072#1094#1102#1074#1072#1090#1080' '#1088#1103#1076#1086#1082
    TabOrder = 1
    OnClick = RunButtonClick
  end
  object OutputEdit: TEdit
    Left = 6
    Top = 35
    Width = 444
    Height = 21
    TabOrder = 2
  end
end
