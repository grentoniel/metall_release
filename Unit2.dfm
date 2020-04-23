object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
  ClientHeight = 657
  ClientWidth = 564
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 537
    Height = 585
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnMouseLeave = DBGrid1MouseLeave
    Columns = <
      item
        Expanded = False
        Width = 500
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 594
    Width = 536
    Height = 38
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100#1074' \'#1091#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    DataSource = DataSource1
    VisibleButtons = [nbInsert, nbDelete]
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      'Edit record'
      'Post edit'
      'Cancel edit'
      'Refresh data'
      'Apply updates'
      'Cancel updates')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 638
    Width = 564
    Height = 19
    Panels = <>
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 120
    Top = 192
  end
  object FDTable1: TFDTable
    AfterInsert = FDTable1AfterInsert
    AfterPost = FDTable1AfterPost
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'naimenovanie'
    TableName = 'naimenovanie'
    Left = 120
    Top = 280
    object FDTable1id: TFDAutoIncField
      DisplayWidth = 3
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTable1naimen: TWideStringField
      DisplayWidth = 200
      FieldName = 'naimen'
      Origin = 'naimen'
      Size = 200
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\delphi_pr\metall\Win32\Release\um.mdb'
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 192
    Top = 264
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    Left = 328
    Top = 592
  end
  object FDTable2: TFDTable
    AfterInsert = FDTable2AfterInsert
    AfterPost = FDTable2AfterPost
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Prim'
    TableName = 'Prim'
    Left = 304
    Top = 272
    object FDTable2id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTable2prim: TWideStringField
      FieldName = 'prim'
      Origin = 'prim'
      Size = 150
    end
  end
end
