object FormBuscaEquipos: TFormBuscaEquipos
  Left = 0
  Top = 0
  Caption = 'B'#250'squeda de Equipos'
  ClientHeight = 246
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object EditNombre: TEdit
      Left = 67
      Top = 35
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object BitBtnBusca: TBitBtn
      Left = 440
      Top = 34
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtnBuscaClick
    end
    object BitBtnTodos: TBitBtn
      Left = 544
      Top = 34
      Width = 75
      Height = 25
      Caption = 'Todos'
      TabOrder = 2
      OnClick = BitBtnTodosClick
    end
  end
  object DBGridEquipos: TDBGrid
    Left = 0
    Top = 65
    Width = 785
    Height = 161
    DataSource = DataSourceBuscaEquipos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridEquiposDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_equipo'
        Title.Caption = 'Clave'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_equipo'
        Title.Caption = 'Nombre'
        Width = 497
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capacidad'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'identificador'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clasificacion1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ruta'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'economico'
        Width = 155
        Visible = True
      end>
  end
  object DataSourceBuscaEquipos: TDataSource
    DataSet = FDQueryBuscaEquipos
    Left = 392
    Top = 152
  end
  object FDQueryBuscaEquipos: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    SQL.Strings = (
      
        'Select id_equipo,tipo_equipo,capacidad,identificador,codigo,clas' +
        'ificacion1,ruta,economico from "CMSoftware"."Equipo" ')
    Left = 472
    Top = 144
    object FDQueryBuscaEquiposid_equipo: TFMTBCDField
      FieldName = 'id_equipo'
      Origin = 'id_equipo'
      Precision = 64
      Size = 0
    end
    object FDQueryBuscaEquipostipo_equipo: TWideStringField
      FieldName = 'tipo_equipo'
      Origin = 'tipo_equipo'
      FixedChar = True
      Size = 100
    end
    object FDQueryBuscaEquiposcapacidad: TWideStringField
      FieldName = 'capacidad'
      Origin = 'capacidad'
      FixedChar = True
      Size = 100
    end
    object FDQueryBuscaEquiposidentificador: TWideStringField
      FieldName = 'identificador'
      Origin = 'identificador'
      FixedChar = True
      Size = 100
    end
    object FDQueryBuscaEquiposcodigo: TWideStringField
      FieldName = 'codigo'
      Origin = 'codigo'
      FixedChar = True
      Size = 100
    end
    object FDQueryBuscaEquiposclasificacion1: TWideStringField
      FieldName = 'clasificacion1'
      Origin = 'clasificacion1'
      FixedChar = True
      Size = 40
    end
    object FDQueryBuscaEquiposruta: TWideStringField
      FieldName = 'ruta'
      Origin = 'ruta'
      FixedChar = True
      Size = 50
    end
    object FDQueryBuscaEquiposeconomico: TWideStringField
      FieldName = 'economico'
      Origin = 'economico'
      FixedChar = True
      Size = 50
    end
  end
end
