object FormBuscaProveedor: TFormBuscaProveedor
  Left = 0
  Top = 0
  Caption = 'Busqueda de Proveedores'
  ClientHeight = 293
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
    object BitBtn1: TBitBtn
      Left = 440
      Top = 33
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 88
    Width = 785
    Height = 161
    DataSource = DataSourceBuscaProveedor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_proveedor'
        Title.Caption = 'Clave'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre'
        Title.Caption = 'Nombre'
        Width = 677
        Visible = True
      end>
  end
  object DataSourceBuscaProveedor: TDataSource
    DataSet = FDQueryBuscaProveedor
    Left = 392
    Top = 160
  end
  object FDQueryBuscaProveedor: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    SQL.Strings = (
      'select id_proveedor,nombre from "CMSoftware"."Proveedor"')
    Left = 456
    Top = 168
    object FDQueryBuscaProveedorid_proveedor: TFMTBCDField
      FieldName = 'id_proveedor'
      Origin = 'id_proveedor'
      Precision = 64
      Size = 0
    end
    object FDQueryBuscaProveedornombre: TWideStringField
      FieldName = 'nombre'
      Origin = 'nombre'
      FixedChar = True
      Size = 200
    end
  end
end
