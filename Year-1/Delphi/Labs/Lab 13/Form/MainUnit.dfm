object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Recursion Lab'
  ClientHeight = 133
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object InputEdt: TEdit
    Left = 0
    Top = 0
    Width = 381
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object OutputEdt: TEdit
    Left = 0
    Top = 43
    Width = 381
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object RunBtn: TButton
    Left = 0
    Top = 86
    Width = 381
    Height = 43
    Caption = #1054#1073#1095#1080#1089#1083#1080#1090#1080
    TabOrder = 2
    OnClick = RunBtnClick
  end
end
