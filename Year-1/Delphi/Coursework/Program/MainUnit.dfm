object MainForm: TMainForm
  Left = 6
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Coursework'
  ClientHeight = 341
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object NewLecturerGroup: TGroupBox
    Left = 3
    Top = 176
    Width = 197
    Height = 161
    Caption = #1044#1086#1076#1072#1090#1080' '#1074#1080#1082#1083#1072#1076#1072#1095#1072
    TabOrder = 0
    object NameEdit: TEdit
      Left = 7
      Top = 20
      Width = 185
      Height = 21
      MaxLength = 40
      TabOrder = 0
      Text = #1030#1074#1072#1085' '#1030#1074#1072#1085#1086#1074#1080#1095' '#1030#1074#1072#1085#1086#1074
    end
    object GradeEdit: TEdit
      Left = 7
      Top = 47
      Width = 185
      Height = 21
      MaxLength = 40
      TabOrder = 1
      Text = #1044#1086#1082#1090#1086#1088
    end
    object OfficeEdit: TEdit
      Left = 7
      Top = 74
      Width = 185
      Height = 21
      MaxLength = 40
      TabOrder = 2
      Text = #1047#1072#1084#1110#1089#1085#1080#1082' '#1076#1077#1082#1072#1085#1072
    end
    object AddNewLecturerBtn: TButton
      Left = 7
      Top = 128
      Width = 185
      Height = 28
      Caption = #1044#1086#1076#1072#1090#1080
      TabOrder = 3
      OnClick = AddNewLecturerBtnClick
    end
    object SalaryEdt: TEdit
      Left = 7
      Top = 101
      Width = 185
      Height = 21
      TabOrder = 4
      Text = '325,50'
    end
  end
  object NewCourseGroup: TGroupBox
    Left = 399
    Top = 176
    Width = 194
    Height = 105
    Caption = #1044#1086#1076#1072#1090#1080' '#1082#1091#1088#1089
    TabOrder = 1
    object AddLecturerIDEdit: TEdit
      Left = 5
      Top = 16
      Width = 180
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object CourseTitleEdit: TEdit
      Left = 5
      Top = 43
      Width = 182
      Height = 21
      TabOrder = 1
      Text = #1055#1088#1086#1075#1088#1072#1084#1091#1074#1072#1085#1085#1103
    end
    object AddNewCourseBtn: TButton
      Left = 5
      Top = 70
      Width = 182
      Height = 27
      Caption = #1044#1086#1076#1072#1090#1080
      TabOrder = 2
      OnClick = AddNewCourseBtnClick
    end
  end
  object RemoveLecturerGroup: TGroupBox
    Left = 201
    Top = 176
    Width = 197
    Height = 49
    Caption = #1042#1080#1076#1072#1083#1077#1085#1085#1103' '#1074#1080#1082#1083#1072#1076#1072#1095#1072
    TabOrder = 2
    object RemoveLecturerIDEdit: TEdit
      Left = 7
      Top = 20
      Width = 34
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object RemoveLecturerBtn: TButton
      Left = 47
      Top = 17
      Width = 145
      Height = 28
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 1
      OnClick = RemoveLecturerBtnClick
    end
  end
  object WorkWithJSONGroup: TGroupBox
    Left = 201
    Top = 227
    Width = 197
    Height = 110
    Caption = #1056#1086#1073#1086#1090#1072' '#1079' JSON'
    TabOrder = 4
  end
  object ExportAsJSONBtn: TButton
    Left = 206
    Top = 246
    Width = 182
    Height = 40
    Caption = #1045#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1074' JSON'
    TabOrder = 5
    OnClick = ExportAsJSONBtnClick
  end
  object ImportFromJSONBtn: TButton
    Left = 206
    Top = 292
    Width = 182
    Height = 40
    Caption = #1030#1084#1087#1086#1088#1091#1074#1072#1090#1080' '#1079' JSON'
    TabOrder = 6
    OnClick = ImportFromJSONBtnClick
  end
  object LecturersListView: TListView
    Left = 0
    Top = 0
    Width = 745
    Height = 170
    Align = alTop
    Columns = <
      item
        Caption = #1030#1084#39#1103
        MaxWidth = 250
        MinWidth = 150
        Width = 170
      end
      item
        Caption = #1047#1074#1072#1085#1085#1103
        MaxWidth = 200
        MinWidth = 100
        Width = 120
      end
      item
        Caption = #1055#1086#1089#1072#1076#1072
        MaxWidth = 300
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1050#1091#1088#1089#1080
        MaxWidth = 500
        MinWidth = 100
        Width = 150
      end
      item
        Caption = #1054#1082#1083#1072#1076
      end
      item
        Alignment = taRightJustify
        Caption = #1047#1072#1088#1087#1083#1072#1090#1085#1103
        Width = 100
      end>
    ReadOnly = True
    TabOrder = 3
    ViewStyle = vsReport
    ExplicitLeft = 3
    ExplicitWidth = 599
  end
  object PrintBtn: TButton
    Left = 599
    Top = 176
    Width = 138
    Height = 161
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
    TabOrder = 7
    OnClick = PrintBtnClick
  end
  object SaveJsonDialog: TSaveDialog
    DefaultExt = 'json'
    FileName = 'lecturers.json'
    Filter = '*.json'
    InitialDir = 'GetCurrentDir'
    Title = #1047#1073#1077#1088#1077#1075#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074' '#1091' '#1092#1086#1088#1084#1072#1090#1110' JSON'
    Left = 520
    Top = 288
  end
  object OpenJsonDialog: TOpenDialog
    DefaultExt = 'json'
    Filter = '*.json'
    InitialDir = 'GetCurrentDir'
    Title = #1042#1110#1076#1082#1088#1080#1090#1080' JSON '#1092#1072#1081#1083' '#1076#1083#1103' '#1110#1084#1087#1086#1088#1090#1091
    Left = 432
    Top = 288
  end
end
