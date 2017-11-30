object AddBuildingsForm: TAddBuildingsForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1077' '#1087#1088#1080#1084#1110#1097#1077#1085#1085#1103
  ClientHeight = 229
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AdressLabel: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 13
    Caption = #1040#1076#1088#1077#1089#1072' '#1087#1088#1080#1084#1110#1097#1077#1085#1085#1103':'
  end
  object AreaLabel: TLabel
    Left = 8
    Top = 54
    Width = 38
    Height = 13
    Caption = #1055#1083#1086#1097#1072':'
  end
  object DateLabel: TLabel
    Left = 8
    Top = 101
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1073#1091#1076#1086#1074#1080':'
  end
  object ValueLabel: TLabel
    Left = 128
    Top = 54
    Width = 69
    Height = 13
    Caption = #1056#1080#1085#1082#1086#1074#1072' '#1094#1110#1085#1072':'
  end
  object DescriptionLabel: TLabel
    Left = 8
    Top = 147
    Width = 141
    Height = 13
    Caption = #1050#1086#1088#1086#1090#1082#1080#1081' '#1086#1087#1080#1089' '#1087#1088#1080#1084#1110#1097#1077#1085#1085#1103':'
  end
  object DatePicker: TDateTimePicker
    Left = 8
    Top = 120
    Width = 241
    Height = 21
    Date = 42180.502677361110000000
    Time = 42180.502677361110000000
    TabOrder = 0
  end
  object AddBuildingButton: TButton
    Left = 8
    Top = 195
    Width = 241
    Height = 30
    Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1080#1084#1110#1097#1077#1085#1085#1103
    TabOrder = 1
    OnClick = AddBuildingButtonClick
  end
  object AdressEdit: TEdit
    Left = 8
    Top = 27
    Width = 241
    Height = 21
    MaxLength = 40
    TabOrder = 2
  end
  object AreaEdit: TEdit
    Left = 8
    Top = 73
    Width = 114
    Height = 21
    TabOrder = 3
  end
  object ValueEdit: TEdit
    Left = 128
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object DescriptioEdit: TEdit
    Left = 8
    Top = 168
    Width = 241
    Height = 21
    TabOrder = 5
  end
end
