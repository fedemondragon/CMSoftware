object FormCentroCostos: TFormCentroCostos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cat'#225'logo de centro de costos'
  ClientHeight = 179
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 511
    Height = 121
    Caption = 'Cuentas'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Cuenta'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object EditCuenta: TEdit
      Left = 88
      Top = 29
      Width = 401
      Height = 21
      TabOrder = 0
    end
    object EditDescripcion: TEdit
      Left = 88
      Top = 56
      Width = 401
      Height = 21
      TabOrder = 1
    end
    object ComboBoxTipo: TComboBox
      Left = 88
      Top = 83
      Width = 145
      Height = 21
      TabOrder = 2
      Items.Strings = (
        'Cargo'
        'Abono')
    end
  end
  object BitBtnCerrar: TBitBtn
    Left = 290
    Top = 135
    Width = 75
    Height = 25
    Hint = 'Cancela los cambios y cierra la ventana'
    Caption = '&Cerrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtnCerrarClick
  end
  object BitBtnGuardar: TBitBtn
    Left = 155
    Top = 135
    Width = 75
    Height = 25
    Hint = 'Guardar no cierra ventana'
    Caption = '&Guardar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnGuardarClick
  end
  object FDQueryCentroCostos: TFDQuery
    Connection = FormMainMenu.TFDConectionMainMenu
    Left = 408
    Top = 136
  end
end
