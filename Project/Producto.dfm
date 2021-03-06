﻿object FormProductos: TFormProductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#225'talogo de Productos y Servicios'
  ClientHeight = 472
  ClientWidth = 516
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
  object TabbedNotebook1: TTabbedNotebook
    Left = 8
    Top = 149
    Width = 516
    Height = 268
    Align = alCustom
    PageIndex = 1
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Datos Generales'
      object GroupBox2: TGroupBox
        Left = 10
        Top = 5
        Width = 481
        Height = 227
        TabOrder = 0
        object Label9: TLabel
          Left = 15
          Top = 80
          Width = 25
          Height = 13
          Caption = 'L'#237'nea'
        end
        object Label14: TLabel
          Left = 16
          Top = 128
          Width = 94
          Height = 13
          Caption = 'Control del almacen'
        end
        object GroupBox3: TGroupBox
          Left = 15
          Top = 16
          Width = 454
          Height = 33
          TabOrder = 0
          object RadioButtonProducto: TRadioButton
            Left = 27
            Top = 8
            Width = 113
            Height = 17
            Caption = 'Producto'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RadioButtonServicio: TRadioButton
            Left = 174
            Top = 8
            Width = 113
            Height = 17
            Caption = 'Servicio'
            TabOrder = 1
          end
          object RadioButtonKit: TRadioButton
            Left = 324
            Top = 8
            Width = 113
            Height = 17
            Caption = 'Kit'
            TabOrder = 2
          end
        end
        object EditLinea: TEdit
          Left = 46
          Top = 76
          Width = 91
          Height = 21
          TabOrder = 1
        end
        object BitBtnBuscar: TBitBtn
          Left = 143
          Top = 76
          Width = 75
          Height = 25
          Caption = 'Buscar'
          TabOrder = 2
          OnClick = BitBtnBuscarClick
        end
        object GroupBoxControl: TGroupBox
          Left = 224
          Top = 55
          Width = 245
          Height = 162
          TabOrder = 3
          object Label10: TLabel
            Left = 16
            Top = 24
            Width = 89
            Height = 13
            Caption = 'Unidad de entrada'
          end
          object Label11: TLabel
            Left = 16
            Top = 56
            Width = 78
            Height = 13
            Caption = 'Unidad de salida'
          end
          object Label12: TLabel
            Left = 16
            Top = 92
            Width = 106
            Height = 13
            Caption = 'Factor entre unidades'
          end
          object Label13: TLabel
            Left = 16
            Top = 128
            Width = 95
            Height = 13
            Caption = 'Unidad de empaque'
          end
          object EditUnidad_entrada: TEdit
            Left = 127
            Top = 16
            Width = 101
            Height = 21
            TabOrder = 0
            Text = 'pz'
          end
          object EditUnidad_salida: TEdit
            Left = 128
            Top = 51
            Width = 100
            Height = 21
            TabOrder = 1
            Text = 'pz'
          end
          object EditFactor_unidades: TEdit
            Left = 128
            Top = 86
            Width = 98
            Height = 21
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 2
            Text = '1.000000'
          end
          object EditUnidad_empaque: TEdit
            Left = 128
            Top = 120
            Width = 98
            Height = 21
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 3
            Text = '1.000000'
          end
        end
        object ComboBoxAlmacenes: TComboBox
          Left = 14
          Top = 155
          Width = 145
          Height = 21
          TabOrder = 4
          OnDropDown = ComboBoxAlmacenesDropDown
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Precios y Control'
      object GroupBox8: TGroupBox
        Left = 7
        Top = 5
        Width = 237
        Height = 122
        Caption = 'Precios'
        TabOrder = 0
        object Label15: TLabel
          Left = 8
          Top = 24
          Width = 66
          Height = 13
          Caption = 'Precio de lista'
        end
        object Label16: TLabel
          Left = 36
          Top = 55
          Width = 38
          Height = 13
          Caption = 'Moneda'
        end
        object Label22: TLabel
          Left = 176
          Top = 56
          Width = 28
          Height = 13
          Caption = 'Pesos'
        end
        object EditPrecioLista: TEdit
          Left = 80
          Top = 16
          Width = 85
          Height = 21
          TabOrder = 0
          Text = '0'
          TextHint = ' '
        end
        object BitBtnPrecios: TBitBtn
          Left = 171
          Top = 16
          Width = 62
          Height = 25
          Caption = 'Precios'
          TabOrder = 1
        end
        object EditMoneda: TEdit
          Left = 80
          Top = 48
          Width = 85
          Height = 21
          TabOrder = 2
          Text = 'MX'
        end
      end
      object GroupBox9: TGroupBox
        Left = 261
        Top = 5
        Width = 241
        Height = 124
        Caption = 'Cantidades'
        TabOrder = 1
        object Label17: TLabel
          Left = 16
          Top = 24
          Width = 48
          Height = 13
          Caption = 'Existencia'
        end
        object Label18: TLabel
          Left = 16
          Top = 56
          Width = 49
          Height = 13
          Caption = 'Stock m'#237'n.'
        end
        object Label19: TLabel
          Left = 16
          Top = 88
          Width = 53
          Height = 13
          Caption = 'Stock m'#225'x.'
        end
        object EditExistencia: TEdit
          Left = 88
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object EditStockMin: TEdit
          Left = 88
          Top = 52
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0'
        end
        object EditStockMax: TEdit
          Left = 87
          Top = 79
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '0'
        end
      end
      object GroupBox10: TGroupBox
        Left = 9
        Top = 131
        Width = 235
        Height = 51
        Caption = 'Centro de costos'
        TabOrder = 2
        object EditCentroCostos: TEdit
          Left = 3
          Top = 21
          Width = 184
          Height = 21
          TabOrder = 0
        end
        object BitBtnBuscaCuenta: TBitBtn
          Left = 193
          Top = 19
          Width = 31
          Height = 25
          Caption = '?'
          TabOrder = 1
          OnClick = BitBtnBuscaCuentaClick
        end
      end
      object GroupBox11: TGroupBox
        Left = 9
        Top = 188
        Width = 235
        Height = 48
        Caption = 'Impuestos'
        TabOrder = 3
        object Label20: TLabel
          Left = 14
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Esquema'
        end
        object Label21: TLabel
          Left = 63
          Top = 24
          Width = 31
          Height = 13
          Caption = 'IVA %'
        end
        object EditIVA: TEdit
          Left = 130
          Top = 16
          Width = 71
          Height = 21
          TabOrder = 0
          Text = '16'
        end
      end
      object GroupBox12: TGroupBox
        Left = 250
        Top = 133
        Width = 241
        Height = 105
        Caption = 'Proveedores'
        TabOrder = 4
        object Label23: TLabel
          Left = 16
          Top = 36
          Width = 50
          Height = 13
          Caption = 'Proveedor'
        end
        object Editproveedor: TEdit
          Left = 88
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object BitBtn7: TBitBtn
          Left = 112
          Top = 64
          Width = 75
          Height = 25
          Caption = 'Proveedores'
          TabOrder = 1
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Hist'#243'ricos'
      object GroupBox13: TGroupBox
        Left = 7
        Top = 7
        Width = 481
        Height = 48
        Caption = 'Costos'
        TabOrder = 0
        object Label24: TLabel
          Left = 15
          Top = 21
          Width = 44
          Height = 13
          Caption = 'Promedio'
        end
        object Label25: TLabel
          Left = 269
          Top = 21
          Width = 29
          Height = 13
          Caption = #218'ltimo'
        end
        object EditPromedio: TEdit
          Left = 88
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object EditUltimo: TEdit
          Left = 311
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
      object GroupBox14: TGroupBox
        Left = 9
        Top = 69
        Width = 479
        Height = 105
        Caption = 'Acumulado en compras'
        TabOrder = 1
        object Label26: TLabel
          Left = 24
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Cantidad'
        end
        object Label27: TLabel
          Left = 24
          Top = 52
          Width = 30
          Height = 13
          Caption = 'Monto'
        end
        object Label28: TLabel
          Left = 22
          Top = 81
          Width = 113
          Height = 13
          Caption = 'Fecha de '#250'ltima compra'
        end
        object EditFechaUltimaCompra: TEdit
          Left = 166
          Top = 73
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object EditCantidadAcumulada: TEdit
          Left = 166
          Top = 14
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object EditmontoAcumulado: TEdit
          Left = 166
          Top = 43
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Datos Adicionales'
      object Label3: TLabel
        Left = 17
        Top = 114
        Width = 59
        Height = 13
        Caption = 'Campo Libre'
      end
      object Label4: TLabel
        Left = 174
        Top = 114
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object GroupBox15: TGroupBox
        Left = 12
        Top = 5
        Width = 479
        Height = 105
        Caption = 'Observaciones'
        TabOrder = 0
        object MemoObserva: TMemo
          Left = 12
          Top = 25
          Width = 453
          Height = 73
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object EditCampoLibre1: TEdit
        Left = 15
        Top = 133
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EditCampoLibre2: TEdit
        Left = 15
        Top = 166
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object EditCampoLibre3: TEdit
        Left = 15
        Top = 201
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object EditDescripcionLibre1: TEdit
        Left = 168
        Top = 133
        Width = 312
        Height = 21
        TabOrder = 4
      end
      object EditDescripcionLibre2: TEdit
        Left = 167
        Top = 166
        Width = 313
        Height = 21
        TabOrder = 5
      end
      object EditDescripcionLibre3: TEdit
        Left = 167
        Top = 204
        Width = 313
        Height = 21
        TabOrder = 6
      end
    end
  end
  object GroupBox7: TGroupBox
    Left = 2
    Top = 423
    Width = 506
    Height = 41
    TabOrder = 1
    object BitBtnGuardar: TBitBtn
      Left = 131
      Top = 3
      Width = 75
      Height = 25
      Hint = 'Guardar no cierra ventana'
      Caption = '&Guardar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtnGuardarClick
    end
    object BitBtnCerrar: TBitBtn
      Left = 298
      Top = 3
      Width = 75
      Height = 25
      Hint = 'Cancela los cambios y cierra la ventana'
      Caption = '&Cerrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtnCerrarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 500
    Height = 137
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Clave'
    end
    object Label2: TLabel
      Left = 16
      Top = 83
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Editid_producto: TEdit
      Left = 76
      Top = 16
      Width = 270
      Height = 21
      Color = clYellow
      TabOrder = 0
    end
    object MemoDescripción: TMemo
      Left = 76
      Top = 43
      Width = 270
      Height = 78
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object cxImage1: TcxImage
      Left = 352
      Top = 3
      TabOrder = 2
      Height = 118
      Width = 140
    end
  end
end
