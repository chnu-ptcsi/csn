object CycleProgramForm: TCycleProgramForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1062#1080#1082#1083#1110#1095#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072
  ClientHeight = 184
  ClientWidth = 154
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object XLabel: TLabel
    Left = 8
    Top = 5
    Width = 10
    Height = 13
    Caption = 'x:'
  end
  object ALabel: TLabel
    Left = 55
    Top = 5
    Width = 10
    Height = 13
    Caption = 'a:'
  end
  object ELabel: TLabel
    Left = 103
    Top = 5
    Width = 10
    Height = 13
    Caption = 'E:'
  end
  object SumLabel: TLabel
    Left = 8
    Top = 51
    Width = 29
    Height = 13
    Caption = #1057#1091#1084#1072':'
  end
  object CountLabel: TLabel
    Left = 8
    Top = 99
    Width = 103
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1077#1083#1077#1084#1077#1085#1090#1110#1074':'
  end
  object XEdit: TEdit
    Left = 8
    Top = 24
    Width = 41
    Height = 21
    TabOrder = 0
  end
  object AEdit: TEdit
    Left = 55
    Top = 24
    Width = 42
    Height = 21
    TabOrder = 1
  end
  object EEdit: TEdit
    Left = 103
    Top = 24
    Width = 42
    Height = 21
    TabOrder = 2
  end
  object SumEdit: TEdit
    Left = 8
    Top = 72
    Width = 138
    Height = 21
    TabOrder = 3
  end
  object CountEdit: TEdit
    Left = 8
    Top = 120
    Width = 138
    Height = 21
    TabOrder = 4
  end
  object RunButton: TButton
    Left = 8
    Top = 147
    Width = 138
    Height = 30
    Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080
    TabOrder = 5
    OnClick = RunButtonClick
  end
end
