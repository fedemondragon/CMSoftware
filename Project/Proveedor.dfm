object FormProveedor: TFormProveedor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#225'talogo del proveedor'
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
    Left = 0
    Top = 0
    Width = 516
    Height = 417
    Align = alTop
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
      Caption = 'Datos generales'
      object GroupBox1: TGroupBox
        Left = 7
        Top = 0
        Width = 482
        Height = 89
        TabOrder = 0
        object Label1: TLabel
          Left = 40
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Clave'
        end
        object Label2: TLabel
          Left = 40
          Top = 54
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object EditClave: TEdit
          Left = 96
          Top = 16
          Width = 121
          Height = 21
          Color = clYellow
          ReadOnly = True
          TabOrder = 0
        end
        object EditNombre: TEdit
          Left = 96
          Top = 51
          Width = 383
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 7
        Top = 95
        Width = 482
        Height = 282
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Calle'
        end
        object Label4: TLabel
          Left = 16
          Top = 48
          Width = 48
          Height = 13
          Caption = 'N'#250'm. ext.'
        end
        object Label5: TLabel
          Left = 135
          Top = 48
          Width = 42
          Height = 13
          Caption = 'N'#250'm Int.'
        end
        object Label6: TLabel
          Left = 16
          Top = 80
          Width = 45
          Height = 13
          Caption = 'Poblaci'#243'n'
        end
        object Label7: TLabel
          Left = 300
          Top = 80
          Width = 35
          Height = 13
          Caption = 'Colonia'
        end
        object Label8: TLabel
          Left = 265
          Top = 48
          Width = 65
          Height = 13
          Caption = 'C'#243'digo Postal'
        end
        object Label9: TLabel
          Left = 275
          Top = 112
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label10: TLabel
          Left = 16
          Top = 112
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label11: TLabel
          Left = 16
          Top = 144
          Width = 43
          Height = 13
          Caption = 'Municipio'
        end
        object Label12: TLabel
          Left = 275
          Top = 144
          Width = 58
          Height = 13
          Caption = 'Clasificaci'#243'n'
        end
        object Label13: TLabel
          Left = 16
          Top = 176
          Width = 32
          Height = 13
          Caption = 'R.F.C.'
        end
        object Label14: TLabel
          Left = 16
          Top = 208
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
        end
        object Label15: TLabel
          Left = 256
          Top = 56
          Width = 3
          Height = 13
        end
        object Label16: TLabel
          Left = 16
          Top = 240
          Width = 55
          Height = 13
          Caption = 'P'#225'gina web'
        end
        object EditCalle: TEdit
          Left = 72
          Top = 18
          Width = 407
          Height = 21
          TabOrder = 0
        end
        object EditNumext: TEdit
          Left = 72
          Top = 45
          Width = 57
          Height = 21
          TabOrder = 1
        end
        object EditNumint: TEdit
          Left = 183
          Top = 45
          Width = 58
          Height = 21
          TabOrder = 2
        end
        object EditPoblacion: TEdit
          Left = 72
          Top = 77
          Width = 222
          Height = 21
          TabOrder = 3
        end
        object EditColonia: TEdit
          Left = 344
          Top = 77
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object EditCP: TEdit
          Left = 344
          Top = 45
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object EditEstado: TEdit
          Left = 72
          Top = 110
          Width = 197
          Height = 21
          TabOrder = 6
        end
        object EditPais: TEdit
          Left = 300
          Top = 109
          Width = 165
          Height = 21
          TabOrder = 7
        end
        object EditMunicipio: TEdit
          Left = 72
          Top = 144
          Width = 197
          Height = 21
          TabOrder = 8
        end
        object EditClasificacion: TEdit
          Left = 344
          Top = 144
          Width = 121
          Height = 21
          TabOrder = 9
        end
        object EditRFC: TEdit
          Left = 72
          Top = 176
          Width = 222
          Height = 21
          TabOrder = 10
        end
        object EditTel: TEdit
          Left = 72
          Top = 203
          Width = 393
          Height = 21
          TabOrder = 11
        end
        object Editweb: TEdit
          Left = 72
          Top = 235
          Width = 393
          Height = 21
          TabOrder = 12
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Datos de compras'
      object GroupBox3: TGroupBox
        Left = 7
        Top = 2
        Width = 482
        Height = 55
        Caption = 'Centro de costos'
        TabOrder = 0
        object EditCentroCostos: TEdit
          Left = 16
          Top = 25
          Width = 449
          Height = 21
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 7
        Top = 64
        Width = 482
        Height = 105
        Caption = 'Acumulados'
        TabOrder = 1
        object Label17: TLabel
          Left = 16
          Top = 28
          Width = 80
          Height = 13
          Caption = 'Monto comprado'
        end
        object Label18: TLabel
          Left = 16
          Top = 57
          Width = 98
          Height = 13
          Caption = 'Fecha '#250'ltima compra'
        end
        object EditMonto: TEdit
          Left = 135
          Top = 22
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object EditFechaUltimaCompra: TEdit
          Left = 135
          Top = 52
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Datos adicionales'
      object GroupBox5: TGroupBox
        Left = 7
        Top = 2
        Width = 482
        Height = 143
        Caption = 'Observaciones'
        TabOrder = 0
        object MemoObservaciones: TMemo
          Left = 16
          Top = 16
          Width = 449
          Height = 119
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 7
        Top = 151
        Width = 482
        Height = 146
        Caption = 'Campos Adicionales'
        TabOrder = 1
        object Label19: TLabel
          Left = 17
          Top = 18
          Width = 59
          Height = 13
          Caption = 'Campo Libre'
        end
        object Label20: TLabel
          Left = 174
          Top = 18
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object EditLibre1: TEdit
          Left = 16
          Top = 37
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object EditLibre2: TEdit
          Left = 17
          Top = 77
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object EditLibre3: TEdit
          Left = 16
          Top = 115
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object EditCampo1: TEdit
          Left = 162
          Top = 37
          Width = 312
          Height = 21
          TabOrder = 3
        end
        object EditCampo2: TEdit
          Left = 160
          Top = 77
          Width = 313
          Height = 21
          TabOrder = 4
        end
        object EditCampo3: TEdit
          Left = 160
          Top = 115
          Width = 313
          Height = 21
          TabOrder = 5
        end
      end
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 423
    Width = 506
    Height = 41
    TabOrder = 1
    object BitBtnGuardar: TBitBtn
      Left = 126
      Top = 7
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
      Left = 286
      Top = 7
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
end
