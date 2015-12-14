object FormBuscaProducto: TFormBuscaProducto
  Left = 0
  Top = 0
  Caption = 'B'#250'squeda de Productos'
  ClientHeight = 306
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 46
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object Label2: TLabel
    Left = 179
    Top = 46
    Width = 117
    Height = 13
    Caption = 'Descripci'#243'n del producto'
  end
  object EditDescripcion: TEdit
    Left = 179
    Top = 19
    Width = 254
    Height = 21
    TabOrder = 0
  end
  object BitBtnBusca: TBitBtn
    Left = 470
    Top = 17
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnBuscaClick
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 88
    Width = 785
    Height = 161
    DataSource = DataSourceBuscaProducto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_clave'
        Title.Caption = 'Clave'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 650
        Visible = True
      end>
  end
  object EditId_producto: TEdit
    Left = 32
    Top = 19
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BitBtnTodos: TBitBtn
    Left = 568
    Top = 17
    Width = 75
    Height = 25
    Caption = 'Todos'
    TabOrder = 4
    OnClick = BitBtnTodosClick
  end
  object DataSourceBuscaProducto: TDataSource
    DataSet = FDQueryBuscaProducto
    Left = 392
    Top = 160
  end
  object FDQueryBuscaProducto: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    SQL.Strings = (
      'select id_clave,descripcion from "CMSoftware"."Producto"')
    Left = 456
    Top = 168
    object FDQueryBuscaProductoid_clave: TWideStringField
      FieldName = 'id_clave'
      Origin = 'id_clave'
      FixedChar = True
      Size = 200
    end
    object FDQueryBuscaProductodescripcion: TWideStringField
      FieldName = 'descripcion'
      Origin = 'descripcion'
      FixedChar = True
      Size = 1000
    end
  end
end
