object FormTipoEquipos: TFormTipoEquipos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tipo de equipos'
  ClientHeight = 232
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxTiposdeEquipos: TGroupBox
    Left = 8
    Top = 8
    Width = 511
    Height = 177
    Caption = 'Equipo'
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
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label3: TLabel
      Left = 24
      Top = 88
      Width = 71
      Height = 13
      Caption = 'Observaciones'
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
    object MemoObservaciones: TMemo
      Left = 72
      Top = 104
      Width = 409
      Height = 68
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object BitBtnCerrar: TBitBtn
    Left = 322
    Top = 191
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
    Left = 139
    Top = 191
    Width = 75
    Height = 25
    Hint = 'Guardar no cierra ventana'
    Caption = '&Guardar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnGuardarClick
  end
end
