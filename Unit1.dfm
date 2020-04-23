object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1084#1077#1090#1072#1083#1083#1072
  ClientHeight = 507
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    876
    507)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 488
    Width = 876
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 8
    Top = -1
    Width = 857
    Height = 483
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1080#1077#1084
      DesignSize = (
        849
        455)
      object Button2: TButton
        Left = 445
        Top = 420
        Width = 385
        Height = 32
        Anchors = [akRight, akBottom]
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1077#1075#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button2Click
      end
      object DBNavigator1: TDBNavigator
        Left = 5
        Top = 420
        Width = 246
        Height = 32
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100#1074' '#1087#1086#1089#1090#1072#1074#1082#1091'\'#1091#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1087#1086#1089#1090#1072#1074#1082#1080
        DataSource = DataSource1
        VisibleButtons = [nbInsert, nbDelete]
        Anchors = [akLeft, akBottom]
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
        BeforeAction = DBNavigator1BeforeAction
        OnClick = DBNavigator1Click
      end
      object StringGrid1: TStringGrid
        Left = 445
        Top = 55
        Width = 385
        Height = 362
        Anchors = [akTop, akRight, akBottom]
        ColCount = 2
        DefaultColWidth = 125
        DefaultRowHeight = 35
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ColWidths = (
          102
          102)
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 55
        Width = 247
        Height = 361
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -19
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnEnter = DBGrid1Enter
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        OnMouseLeave = DBGrid1MouseLeave
        Columns = <
          item
            Expanded = False
            FieldName = 'primprim'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
            Width = 194
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 444
        Top = 17
        Width = 385
        Height = 32
        Anchors = [akTop, akRight]
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1079#1072' '#1076#1077#1085#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button4: TButton
        Left = 256
        Top = 17
        Width = 182
        Height = 32
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button4Click
      end
      object Button3: TButton
        Left = 125
        Top = 17
        Width = 125
        Height = 32
        Caption = #1052#1077#1090#1072#1083#1083#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Button3Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 18
        Width = 111
        Height = 31
        Date = 43541.000000000000000000
        Time = 0.828011631936533400
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = DateTimePicker1Change
      end
      object DBGrid2: TDBGrid
        Left = 256
        Top = 55
        Width = 183
        Height = 362
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -19
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
        OnExit = DBGrid2Exit
        OnKeyDown = DBGrid2KeyDown
        OnMouseLeave = DBGrid2MouseLeave
        Columns = <
          item
            Expanded = False
            FieldName = 'metall'
            Title.Caption = #1052#1077#1090#1072#1083#1083
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ves'
            Title.Caption = #1042#1077#1089
            Width = 100
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 254
        Top = 419
        Width = 184
        Height = 33
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100#1074' '#1087#1086#1089#1090#1072#1074#1082#1091'\'#1091#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1087#1086#1089#1090#1072#1074#1082#1080
        ParentCustomHint = False
        DataSource = DataSource3
        VisibleButtons = [nbInsert, nbDelete]
        Anchors = [akLeft, akBottom]
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
        TabOrder = 9
        BeforeAction = DBNavigator2BeforeAction
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      DesignSize = (
        849
        455)
      object DateTimePicker2: TDateTimePicker
        Left = 3
        Top = 19
        Width = 111
        Height = 31
        Date = 43541.000000000000000000
        Time = 0.828011631936533400
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DateTimePicker2Change
      end
      object StringGrid2: TStringGrid
        Left = 160
        Top = 56
        Width = 673
        Height = 395
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ParentFont = False
        TabOrder = 1
      end
      object Button5: TButton
        Left = 120
        Top = 19
        Width = 129
        Height = 31
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button5Click
      end
      object StringGrid3: TStringGrid
        Left = 3
        Top = 56
        Width = 158
        Height = 395
        Anchors = [akLeft, akTop, akBottom]
        ColCount = 2
        DefaultColWidth = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object FDT_naimenovanie: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'naimenovanie'
    TableName = 'naimenovanie'
    Left = 448
    Top = 392
    object FDT_naimenovanieid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDT_naimenovanienaimen: TWideStringField
      FieldName = 'naimen'
      Origin = 'naimen'
      Size = 150
    end
    object FDT_naimenovanievess: TFloatField
      FieldKind = fkCalculated
      FieldName = 'vess'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = FDT_naimenovanie
    Left = 448
    Top = 344
  end
  object MainMenu1: TMainMenu
    Left = 512
    Top = 320
    object N1: TMenuItem
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
      object N4: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1084#1077#1090#1072#1083#1083#1086#1074
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      end
      object N6: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N6Click
      end
    end
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from main_table')
    Left = 448
    Top = 288
    object FDQuery2id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery2id_naimen: TIntegerField
      FieldName = 'id_naimen'
      Origin = 'id_naimen'
    end
    object FDQuery2ves: TSingleField
      FieldName = 'ves'
      Origin = 'ves'
    end
    object FDQuery2data: TWideStringField
      FieldName = 'data'
      Origin = 'data'
      Size = 50
    end
    object FDQuery2naim: TStringField
      DisplayWidth = 200
      FieldKind = fkLookup
      FieldName = 'naim'
      LookupDataSet = FDT_naimenovanie
      LookupKeyFields = 'id'
      LookupResultField = 'naimen'
      KeyFields = 'id_naimen'
      Size = 200
      Lookup = True
    end
    object FDQuery2prim: TIntegerField
      FieldName = 'prim'
      Origin = 'prim'
    end
    object FDQuery2primprim: TIntegerField
      FieldKind = fkLookup
      FieldName = 'primprim'
      LookupDataSet = FDTprim
      LookupKeyFields = 'id'
      LookupResultField = 'prim'
      KeyFields = 'prim'
      Lookup = True
    end
  end
  object FDTprim: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'Prim'
    TableName = 'Prim'
    Left = 448
    Top = 232
    object FDTprimid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTprimprim: TWideStringField
      FieldName = 'prim'
      Origin = 'prim'
      Size = 50
    end
  end
  object FDQuery1: TFDQuery
    BeforeInsert = FDQuery1BeforeInsert
    AfterInsert = FDQuery1AfterInsert
    AfterPost = FDQuery1AfterPost
    AfterDelete = FDQuery1AfterDelete
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete]
    SQL.Strings = (
      'select * '
      'from main_table')
    Left = 432
    Top = 184
    object FDQuery1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery1id_naimen: TIntegerField
      DisplayWidth = 50
      FieldName = 'id_naimen'
      Origin = 'id_naimen'
    end
    object FDQuery1ves: TSingleField
      FieldName = 'ves'
      Origin = 'ves'
    end
    object FDQuery1data: TWideStringField
      FieldName = 'data'
      Origin = 'data'
      Size = 50
    end
    object FDQuery1naimen: TStringField
      DisplayWidth = 200
      FieldKind = fkLookup
      FieldName = 'naimen'
      LookupDataSet = FDT_naimenovanie
      LookupKeyFields = 'id'
      LookupResultField = 'naimen'
      KeyFields = 'id_naimen'
      Size = 200
      Lookup = True
    end
    object FDQuery1prim: TIntegerField
      FieldName = 'prim'
      Origin = 'prim'
    end
    object FDQuery1primprim: TStringField
      FieldKind = fkLookup
      FieldName = 'primprim'
      LookupDataSet = FDTprim
      LookupKeyFields = 'id'
      LookupResultField = 'prim'
      KeyFields = 'prim'
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 496
    Top = 136
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\delphi_pr\metall3_0\Win32\Release\um.mdb'
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 448
    Top = 120
  end
  object FDQuery3: TFDQuery
    BeforeInsert = FDQuery3BeforeInsert
    AfterInsert = FDQuery3AfterInsert
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from vesa')
    Left = 540
    Top = 391
    object FDQuery3id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery3id_posetitel: TIntegerField
      FieldName = 'id_posetitel'
      Origin = 'id_posetitel'
    end
    object FDQuery3id_metall: TIntegerField
      FieldName = 'id_metall'
      Origin = 'id_metall'
    end
    object FDQuery3ves: TSingleField
      FieldName = 'ves'
      Origin = 'ves'
    end
    object FDQuery3posetitel: TStringField
      FieldKind = fkLookup
      FieldName = 'posetitel'
      LookupDataSet = FDQuery1
      LookupKeyFields = 'id'
      LookupResultField = 'prim'
      KeyFields = 'id_posetitel'
      Lookup = True
    end
    object FDQuery3metall: TStringField
      FieldKind = fkLookup
      FieldName = 'metall'
      LookupDataSet = FDT_naimenovanie
      LookupKeyFields = 'id'
      LookupResultField = 'naimen'
      KeyFields = 'id_metall'
      Size = 50
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = FDQuery3
    Left = 604
    Top = 391
  end
end
