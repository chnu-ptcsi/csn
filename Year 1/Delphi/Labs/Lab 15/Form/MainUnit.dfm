object MainForm: TMainForm
  Left = 1
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Graph Builder'
  ClientHeight = 500
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GraphImage: TImage
    Left = 0
    Top = 50
    Width = 500
    Height = 450
    Align = alCustom
  end
  object CircleDiagramImage: TImage
    Left = 505
    Top = 50
    Width = 210
    Height = 225
    Margins.Left = 5
  end
  object ColumnDiagramImage: TImage
    Left = 505
    Top = 280
    Width = 210
    Height = 220
    Margins.Left = 5
  end
  object LeftLimEdt: TEdit
    Left = 0
    Top = 15
    Width = 41
    Height = 20
    TabOrder = 0
    Text = '-2'
  end
  object RightLimEdt: TEdit
    Left = 459
    Top = 15
    Width = 41
    Height = 20
    TabOrder = 1
    Text = '2'
  end
  object RunBtn: TButton
    Left = 210
    Top = 10
    Width = 80
    Height = 30
    Caption = 'Build Graph'
    TabOrder = 2
    OnClick = RunBtnClick
  end
  object ClearBtn: TButton
    Left = 530
    Top = 10
    Width = 150
    Height = 30
    Caption = 'Clear'
    TabOrder = 3
    OnClick = ClearBtnClick
  end
end
