object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Stack'
  ClientHeight = 279
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 180
    Height = 265
    ColCount = 1
    DefaultColWidth = 175
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object EditA: TEdit
    Left = 193
    Top = 8
    Width = 42
    Height = 21
    TabOrder = 1
    Text = 'A'
  end
  object EditB: TEdit
    Left = 241
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 2
    Text = 'B'
  end
  object EditC: TEdit
    Left = 297
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 3
    Text = 'C'
  end
  object EditD: TEdit
    Left = 353
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 4
    Text = 'D'
  end
  object EditE: TEdit
    Left = 409
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 5
    Text = 'E'
  end
  object EditF: TEdit
    Left = 465
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 6
    Text = 'F'
  end
  object EditJ: TEdit
    Left = 521
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 7
    Text = 'J'
  end
  object EditT: TEdit
    Left = 577
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 8
    Text = 'T'
  end
  object AddButton: TButton
    Left = 193
    Top = 35
    Width = 434
    Height = 35
    Caption = #1044#1086#1076#1072#1090#1080' '#1074' '#1089#1090#1077#1082
    TabOrder = 9
    OnClick = AddButtonClick
  end
  object AddTwoLastButton: TButton
    Left = 194
    Top = 158
    Width = 433
    Height = 35
    Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1076#1074#1086#1093' '#1086#1089#1090#1072#1085#1085#1110#1093' '#1077#1083#1077#1084#1077#1085#1090#1110#1074
    TabOrder = 10
    OnClick = AddTwoLastButtonClick
  end
  object SwapButton: TButton
    Left = 194
    Top = 117
    Width = 433
    Height = 35
    Caption = #1047#1084#1110#1085#1080#1090#1080' '#1086#1089#1090#1072#1085#1085#1110' '#1076#1074#1072' '#1077#1083#1077#1084#1077#1085#1090#1080' '#1084#1110#1089#1094#1103#1084#1080
    TabOrder = 11
    OnClick = SwapButtonClick
  end
  object MultipleButton: TButton
    Left = 194
    Top = 199
    Width = 433
    Height = 35
    Caption = #1052#1085#1086#1078#1077#1085#1085#1103' '#1076#1074#1086#1093' '#1077#1083#1077#1084#1077#1085#1090#1110#1074' '#1079' '#1079#1072#1085#1077#1089#1077#1085#1085#1103#1084' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1091' '#1091' '#1074#1077#1088#1096#1080#1085#1091
    TabOrder = 12
    OnClick = MultipleButtonClick
  end
  object ClearStackButton: TButton
    Left = 194
    Top = 76
    Width = 433
    Height = 35
    Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1089#1090#1077#1082
    TabOrder = 13
    OnClick = ClearStackButtonClick
  end
end
