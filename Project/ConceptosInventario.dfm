object FormConceptos: TFormConceptos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conceptos de Movimientos al Inventario'
  ClientHeight = 287
  ClientWidth = 632
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
    Top = 51
    Width = 59
    Height = 13
    Caption = 'Consecutivo'
  end
  object Label2: TLabel
    Left = 73
    Top = 51
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Label3: TLabel
    Left = 262
    Top = 51
    Width = 92
    Height = 13
    Caption = 'Tipo de movimiento'
  end
  object Label4: TLabel
    Left = 389
    Top = 51
    Width = 82
    Height = 13
    Caption = 'Centro de costos'
  end
  object DBNavigator1: TDBNavigator
    Left = 168
    Top = 232
    Width = 300
    Height = 25
    DataSource = DataSourceConceptos
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 606
    Height = 129
    DataSource = DataSourceConceptos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_concepto'
        Title.Caption = 'Clave'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_movimiento'
        Title.Caption = 'Tipo Movimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'centro_costos'
        Title.Caption = 'Centro de costos'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 59
    Height = 21
    DataField = 'id_concepto'
    DataSource = DataSourceConceptos
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 73
    Top = 24
    Width = 183
    Height = 21
    DataField = 'descripcion'
    DataSource = DataSourceConceptos
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 262
    Top = 24
    Width = 121
    Height = 21
    DataField = 'tipo_movimiento'
    DataSource = DataSourceConceptos
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 389
    Top = 24
    Width = 225
    Height = 21
    DataField = 'centro_costos'
    DataSource = DataSourceConceptos
    TabOrder = 5
  end
  object FDTableConceptos: TFDTable
    Active = True
    Connection = FormMainMenu.TFDConectionMainMenu
    UpdateOptions.UpdateTableName = '"CMSoftware"."ConceptosMovInv"'
    TableName = '"CMSoftware"."ConceptosMovInv"'
    Left = 544
    Top = 24
  end
  object DataSourceConceptos: TDataSource
    DataSet = FDTableConceptos
    Left = 488
    Top = 32
  end
end
