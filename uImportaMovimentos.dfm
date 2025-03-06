object fImportaMovimentos: TfImportaMovimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Importa Movimentos'
  ClientHeight = 197
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5658198
  Font.Height = -15
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object lblInicio: TLabel
    Left = 24
    Top = 16
    Width = 99
    Height = 18
    Caption = 'Movimento de'
  end
  object lblAte: TLabel
    Left = 143
    Top = 45
    Width = 22
    Height = 18
    Caption = 'At'#233
  end
  object progresso: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 177
    Width = 297
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object dtp_dtInicio: TDateTimePicker
    Left = 24
    Top = 40
    Width = 113
    Height = 26
    Date = 44800.000000000000000000
    Time = 0.883051331016758900
    TabOrder = 1
  end
  object dtp_dttermino: TDateTimePicker
    Left = 171
    Top = 40
    Width = 113
    Height = 26
    Date = 44800.000000000000000000
    Time = 0.883051331016758900
    TabOrder = 2
  end
  object btn_Executar: TButton
    AlignWithMargins = True
    Left = 3
    Top = 126
    Width = 297
    Height = 45
    Align = alBottom
    Caption = 'Executar'
    TabOrder = 3
    OnClick = btn_ExecutarClick
  end
  object rgrp_opcoes: TRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 73
    Width = 297
    Height = 47
    Align = alBottom
    Columns = 2
    TabOrder = 4
  end
  object rbtn_reservas: TRadioButton
    Left = 24
    Top = 88
    Width = 113
    Height = 17
    Caption = 'Reservas'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object rbtn_vednas: TRadioButton
    Left = 171
    Top = 86
    Width = 81
    Height = 23
    Caption = 'Vendas'
    TabOrder = 6
  end
  object FDQuery1: TFDQuery
    Left = 152
    Top = 80
  end
end
