object fConfigImpressao: TfConfigImpressao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configurar Impress'#227'o'
  ClientHeight = 150
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object ledt_printreport: TLabeledEdit
    Left = 8
    Top = 112
    Width = 281
    Height = 28
    EditLabel.Width = 165
    EditLabel.Height = 20
    EditLabel.Caption = 'Impressora de Relat'#243'rios'
    TabOrder = 4
  end
  object ledt_printbobina: TLabeledEdit
    Left = 8
    Top = 24
    Width = 281
    Height = 28
    EditLabel.Width = 194
    EditLabel.Height = 20
    EditLabel.Caption = 'Impressora de Comprovantes'
    TabOrder = 0
  end
  object cbox_impressoras1: TComboBox
    Left = 8
    Top = 24
    Width = 281
    Height = 28
    Cursor = crHandPoint
    Style = csDropDownList
    TabOrder = 1
  end
  object cbox_impressoras2: TComboBox
    Left = 8
    Top = 112
    Width = 281
    Height = 28
    Cursor = crHandPoint
    Style = csDropDownList
    TabOrder = 3
  end
  object chk_compbobina: TCheckBox
    Left = 8
    Top = 58
    Width = 281
    Height = 17
    Caption = 'Comprovatne em formato Bobina'
    TabOrder = 2
  end
  object qry_comando: TFDQuery
    Left = 240
    Top = 64
  end
end
