object FormEntidades: TFormEntidades
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entidades'
  ClientHeight = 252
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxTiposdeEquipos: TGroupBox
    Left = 8
    Top = 8
    Width = 511
    Height = 201
    Caption = 'Entidad y Localizaci'#243'n'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Clave'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label3: TLabel
      Left = 24
      Top = 88
      Width = 45
      Height = 13
      Caption = 'Ubicaci'#243'n'
    end
    object Label4: TLabel
      Left = 24
      Top = 160
      Width = 61
      Height = 13
      Caption = 'Responsable'
    end
    object EditClave: TEdit
      Left = 72
      Top = 21
      Width = 409
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object EditTipoEquipo: TEdit
      Left = 72
      Top = 56
      Width = 409
      Height = 21
      TabOrder = 1
    end
    object MemoUbicacion: TMemo
      Left = 72
      Top = 83
      Width = 409
      Height = 68
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object EditResponsable: TEdit
      Left = 104
      Top = 160
      Width = 377
      Height = 21
      TabOrder = 3
    end
  end
  object BitBtnGuardar: TBitBtn
    Left = 139
    Top = 215
    Width = 75
    Height = 25
    Hint = 'Guardar no cierra ventana'
    Caption = '&Guardar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtnGuardarClick
  end
  object BitBtnCerrar: TBitBtn
    Left = 322
    Top = 215
    Width = 75
    Height = 25
    Hint = 'Cancela los cambios y cierra la ventana'
    Caption = '&Cerrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnCerrarClick
  end
end
