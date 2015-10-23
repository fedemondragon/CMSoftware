object FormFolios: TFormFolios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Control de Folios'
  ClientHeight = 252
  ClientWidth = 537
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
    Left = 32
    Top = 50
    Width = 59
    Height = 13
    Caption = 'Consecutivo'
  end
  object Label2: TLabel
    Left = 160
    Top = 48
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Label3: TLabel
    Left = 319
    Top = 48
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object Label4: TLabel
    Left = 448
    Top = 50
    Width = 22
    Height = 13
    Caption = 'Folio'
  end
  object DBNavigator1: TDBNavigator
    Left = 104
    Top = 209
    Width = 320
    Height = 35
    DataSource = DataSourceFolios
    TabOrder = 0
  end
  object DBGridDetalle: TDBGrid
    Left = 8
    Top = 69
    Width = 511
    Height = 134
    DataSource = DataSourceFolios
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_folio'
        Title.Caption = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Title.Caption = 'Descripcion'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serie'
        Title.Caption = 'Serie'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_folio'
        Title.Caption = 'N'#250'mero de folio'
        Width = 90
        Visible = True
      end>
  end
  object DBEditDescripcion: TDBEdit
    Left = 135
    Top = 22
    Width = 121
    Height = 21
    DataField = 'descripcion'
    DataSource = DataSourceFolios
    TabOrder = 2
    OnKeyPress = DBEditDescripcionKeyPress
  end
  object DBEditSerie: TDBEdit
    Left = 271
    Top = 23
    Width = 121
    Height = 21
    DataField = 'serie'
    DataSource = DataSourceFolios
    TabOrder = 3
    OnKeyPress = DBEditSerieKeyPress
  end
  object DBEditFolio: TDBEdit
    Left = 398
    Top = 23
    Width = 121
    Height = 21
    DataField = 'num_folio'
    DataSource = DataSourceFolios
    TabOrder = 4
    OnKeyPress = DBEditFolioKeyPress
  end
  object DBEditID: TDBEdit
    Left = 8
    Top = 23
    Width = 121
    Height = 21
    DataField = 'id_folio'
    DataSource = DataSourceFolios
    TabOrder = 5
    OnKeyPress = DBEditIDKeyPress
  end
  object FDTableFolios: TFDTable
    Active = True
    Connection = FormMainMenu.TFDConectionMainMenu
    UpdateOptions.UpdateTableName = '"CMSoftware"."Folios"'
    TableName = '"CMSoftware"."Folios"'
    Left = 480
    Top = 200
  end
  object DataSourceFolios: TDataSource
    DataSet = FDTableFolios
    Left = 472
    Top = 144
  end
end
