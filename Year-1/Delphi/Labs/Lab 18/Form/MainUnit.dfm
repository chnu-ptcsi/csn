object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Lab18Form - DragAndDrop'
  ClientHeight = 296
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDragDrop = FormDragDrop
  OnDragOver = FormDragOver
  PixelsPerInch = 96
  TextHeight = 13
  object MyEdit: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnMouseDown = MyEditMouseDown
  end
  object MyPanel: TPanel
    Left = 10
    Top = 80
    Width = 300
    Height = 150
    Caption = 'Panel'
    TabOrder = 1
    OnDragDrop = MyPanelDragDrop
    OnDragOver = MyPanelDragOver
  end
  object MyButton: TButton
    Left = 509
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button'
    TabOrder = 2
    OnMouseDown = MyButtonMouseDown
  end
end
