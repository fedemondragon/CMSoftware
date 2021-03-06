object FormBuscaLinea: TFormBuscaLinea
  Left = 0
  Top = 0
  Caption = 'B'#250'squeda de Lineas de productos'
  ClientHeight = 235
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -6
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
      Left = 480
      Top = 34
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtnBuscaClick
    end
    object BitBtnTodos: TBitBtn
      Left = 584
      Top = 34
      Width = 75
      Height = 25
      Caption = 'Todos'
      TabOrder = 2
      OnClick = BitBtnTodosClick
    end
  end
  object DBGridCuenta: TDBGrid
    Left = -1
    Top = 65
    Width = 785
    Height = 161
    DataSource = DataSourceBuscaLinea
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridCuentaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_linea'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'centro_costos'
        Width = 300
        Visible = True
      end>
  end
  object DataSourceBuscaLinea: TDataSource
    DataSet = FDQueryBuscaLinea
    Left = 320
    Top = 120
  end
  object FDQueryBuscaLinea: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    SQL.Strings = (
      'Select * from "CMSoftware"."Linea" ')
    Left = 400
    Top = 136
    object FDQueryBuscaLineaid_linea: TWideStringField
      FieldName = 'id_linea'
      Origin = 'id_linea'
      FixedChar = True
      Size = 50
    end
    object FDQueryBuscaLineadescripcion: TWideStringField
      FieldName = 'descripcion'
      Origin = 'descripcion'
      FixedChar = True
      Size = 200
    end
    object FDQueryBuscaLineacentro_costos: TWideStringField
      FieldName = 'centro_costos'
      Origin = 'centro_costos'
      FixedChar = True
      Size = 200
    end
  end
end
