object ProceduresAndFunctionsForm: TProceduresAndFunctionsForm
  Left = 0
  Top = 0
  Caption = 'ProceduresAndFunctionsForm'
  ClientHeight = 234
  ClientWidth = 411
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
    Left = 156
    Top = 5
    Width = 10
    Height = 13
    Caption = 'x:'
  end
  object YLabel: TLabel
    Left = 283
    Top = 5
    Width = 10
    Height = 13
    Caption = 'y:'
  end
  object dXLabel: TLabel
    Left = 156
    Top = 101
    Width = 24
    Height = 13
    Caption = 'd(x):'
  end
  object dYLabel: TLabel
    Left = 283
    Top = 101
    Width = 24
    Height = 13
    Caption = 'd(y):'
  end
  object CanMakeSquareLabel: TLabel
    Left = 156
    Top = 187
    Width = 135
    Height = 13
    Caption = #1052#1086#1078#1085#1072' '#1091#1090#1074#1086#1088#1080#1090#1080' '#1082#1074#1072#1076#1088#1072#1090':'
  end
  object PointsListBox: TListBox
    Left = 0
    Top = 0
    Width = 150
    Height = 234
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
  end
  object XEdit: TEdit
    Left = 156
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object YEdit: TEdit
    Left = 283
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object AddPointButton: TButton
    Left = 156
    Top = 51
    Width = 247
    Height = 30
    Caption = #1044#1086#1076#1072#1090#1080' '#1090#1086#1095#1082#1091
    TabOrder = 3
    OnClick = AddPointButtonClick
  end
  object RunButton: TButton
    Left = 156
    Top = 147
    Width = 247
    Height = 34
    Caption = #1064#1091#1082#1072#1090#1080' '#1082#1074#1072#1076#1088#1072#1090#1080
    TabOrder = 4
    OnClick = RunButtonClick
  end
  object dXEdit: TEdit
    Left = 155
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object dYEdit: TEdit
    Left = 282
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object CanMakeSquareEdit: TEdit
    Left = 156
    Top = 208
    Width = 247
    Height = 21
    TabOrder = 7
  end
end
