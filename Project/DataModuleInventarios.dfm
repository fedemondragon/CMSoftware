object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 398
  Width = 651
  object DataSourceProducto: TDataSource
    DataSet = FDQueryProducto
    Left = 72
    Top = 40
  end
  object FDTable1: TFDTable
    Active = True
    Connection = FormMainMenu.TFDConectionMainMenu
    UpdateOptions.UpdateTableName = '"Producto"'
    SchemaName = 'CMSoftware'
    TableName = '"Producto"'
    Left = 368
    Top = 40
  end
  object FDQueryProducto: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 152
    Top = 40
  end
  object FDQueryProveedor: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 152
    Top = 104
  end
  object FDQueryCentroCostos: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 552
    Top = 56
  end
  object FDQueryLinea: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 448
    Top = 112
  end
  object FDQueryEquipos: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 360
    Top = 104
  end
  object FDQueryTipo_equipo: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 256
    Top = 40
  end
  object FDQueryEntidades: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 264
    Top = 104
  end
  object FDQueryfolios: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 440
    Top = 48
  end
  object FDQueryAlmacenes: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 64
    Top = 96
  end
  object FDQueryUsuario: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 552
    Top = 128
  end
  object FDQueryMovimientosInv: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 56
    Top = 184
  end
  object FDQueryOrdenServicio: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 224
    Top = 216
  end
  object FDQueryEntidad: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 368
    Top = 208
  end
  object FDQueryOT: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 496
    Top = 208
  end
  object FDQueryAgenda: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 384
    Top = 264
  end
end
