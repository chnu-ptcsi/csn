object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Practice Project'
  ClientHeight = 48
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 376
    object FileGroup: TMenuItem
      Caption = #1060#1072#1081#1083
      OnClick = FileGroupClick
      object FIleCreateItem: TMenuItem
        Caption = #1057#1090#1074#1086#1088#1080#1090#1080
        OnClick = FIleCreateItemClick
      end
      object FileOpenItem: TMenuItem
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080
        OnClick = FileOpenItemClick
      end
      object FileCloseItem: TMenuItem
        Caption = #1047#1072#1082#1088#1080#1090#1080
        OnClick = FileCloseItemClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object FileViewItem: TMenuItem
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076
        OnClick = FileViewItemClick
      end
      object FileAddItem: TMenuItem
        Caption = #1044#1086#1076#1072#1090#1080
        OnClick = FileAddItemClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object FIleExitItem: TMenuItem
        Caption = #1042#1080#1093#1110#1076
        OnClick = FIleExitItemClick
      end
    end
    object CycleProgram: TMenuItem
      Caption = #1062#1080#1082#1083#1110#1095#1085#1110' '#1087#1088#1086#1075#1088#1072#1084#1080
      OnClick = CycleProgramClick
    end
    object SymbolProgram: TMenuItem
      Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1110' '#1088#1103#1076#1082#1080
      OnClick = SymbolProgramClick
    end
    object ProceduresAndFunctionsProgram: TMenuItem
      Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1080' '#1090#1072' '#1092#1091#1085#1082#1094#1110#1111
      OnClick = ProceduresAndFunctionsProgramClick
    end
    object About: TMenuItem
      Caption = #1055#1088#1086' '#1072#1074#1090#1086#1088#1072
      object N1: TMenuItem
        Caption = #1044#1086#1074#1075#1072#1085#1100' '#1044#1077#1085#1080#1089
      end
      object N1421: TMenuItem
        Caption = '142'#1072' '#1075#1088#1091#1087#1072
      end
      object N91: TMenuItem
        Caption = #1042#1072#1088#1110#1072#1085#1090' 9'
      end
    end
  end
  object OpenDialog: TOpenDialog
    InitialDir = 'GetCurrentDir'
    Title = #1042#1110#1076#1082#1088#1080#1090#1080' '#1092#1072#1081#1083
    Left = 312
  end
  object SaveDialog: TSaveDialog
    InitialDir = 'GetCurrentDir'
    Title = #1047#1073#1077#1088#1077#1075#1090#1080' '#1092#1072#1081#1083
    Left = 344
  end
end
