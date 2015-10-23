object FormAlmacenes: TFormAlmacenes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cat'#225'logo de Almacenes'
  ClientHeight = 269
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 50
    Width = 40
    Height = 13
    Caption = 'Almac'#233'n'
  end
  object Label2: TLabel
    Left = 160
    Top = 48
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Label3: TLabel
    Left = 271
    Top = 50
    Width = 82
    Height = 13
    Caption = 'Centro de costos'
  end
  object Label4: TLabel
    Left = 398
    Top = 50
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object DBEditIdAlmacen: TDBEdit
    Left = 8
    Top = 23
    Width = 121
    Height = 21
    DataField = 'id_almacen'
    DataSource = DataSourceAlmacenes
    TabOrder = 0
  end
  object DBEditDescripcion: TDBEdit
    Left = 135
    Top = 22
    Width = 121
    Height = 21
    DataField = 'descripcion'
    DataSource = DataSourceAlmacenes
    TabOrder = 1
  end
  object DBEditCentroCostos: TDBEdit
    Left = 271
    Top = 23
    Width = 121
    Height = 21
    DataField = 'centro_costos'
    DataSource = DataSourceAlmacenes
    TabOrder = 2
  end
  object DBEditObservaciones: TDBEdit
    Left = 398
    Top = 23
    Width = 380
    Height = 21
    DataField = 'observaciones'
    DataSource = DataSourceAlmacenes
    TabOrder = 3
  end
  object DBGridDetalle: TDBGrid
    Left = 8
    Top = 69
    Width = 769
    Height = 134
    DataSource = DataSourceAlmacenes
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_almacen'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'centro_costos'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observaciones'
        Width = 400
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 216
    Top = 209
    Width = 320
    Height = 35
    DataSource = DataSourceAlmacenes
    TabOrder = 5
  end
  object FDTableAlmacenes: TFDTable
    Active = True
    Connection = FormMainMenu.TFDConectionMainMenu
    UpdateOptions.UpdateTableName = '"CMSoftware"."Almacenes"'
    TableName = '"CMSoftware"."Almacenes"'
    Left = 560
    Top = 136
  end
  object DataSourceAlmacenes: TDataSource
    DataSet = FDTableAlmacenes
    Left = 472
    Top = 144
  end
end
