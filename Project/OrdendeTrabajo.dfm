object FormOT: TFormOT
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Captura de Orden de Trabajo'
  ClientHeight = 430
  ClientWidth = 801
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
    Width = 769
    Height = 73
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 43
      Width = 85
      Height = 13
      Caption = 'Orden de Servicio'
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 105
      Height = 13
      Caption = 'No. Orden de Trabajo'
    end
    object Label3: TLabel
      Left = 296
      Top = 43
      Width = 70
      Height = 13
      Caption = 'Fecha de inicio'
    end
    object Label4: TLabel
      Left = 431
      Top = 43
      Width = 85
      Height = 13
      Caption = 'Fecha de T'#233'rmino'
    end
    object Label7: TLabel
      Left = 576
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Estatus de la OT'
    end
    object EditOrdenServicio: TEdit
      Left = 152
      Top = 16
      Width = 121
      Height = 21
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditOT: TEdit
      Left = 25
      Top = 16
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DateTimePickerInicio: TDateTimePicker
      Left = 296
      Top = 16
      Width = 113
      Height = 21
      Date = 42334.617601261580000000
      Time = 42334.617601261580000000
      TabOrder = 2
    end
    object DateTimePickerFin: TDateTimePicker
      Left = 431
      Top = 16
      Width = 113
      Height = 21
      Date = 42334.617892916660000000
      Time = 42334.617892916660000000
      TabOrder = 3
    end
    object EditEstatus: TEdit
      Left = 672
      Top = 21
      Width = 81
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 87
    Width = 769
    Height = 296
    TabOrder = 1
    object Label5: TLabel
      Left = 16
      Top = 3
      Width = 110
      Height = 13
      Caption = 'Descripci'#243'n del servicio'
    end
    object Label6: TLabel
      Left = 24
      Top = 112
      Width = 86
      Height = 13
      Caption = 'Servicio Realizado'
    end
    object MemoDetalle: TMemo
      Left = 16
      Top = 128
      Width = 737
      Height = 153
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object MemoServicio: TMemo
      Left = 16
      Top = 22
      Width = 737
      Height = 75
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 389
    Width = 102
    Height = 33
    Caption = 'Guardar'
    TabOrder = 2
  end
  object BitBtnCerrar: TBitBtn
    Left = 464
    Top = 389
    Width = 102
    Height = 33
    Caption = 'Cerrar'
    TabOrder = 3
    OnClick = BitBtnCerrarClick
  end
end
