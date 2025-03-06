object fImprimeComprovante: TfImprimeComprovante
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Comprovante'
  ClientHeight = 66
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5395026
  Font.Height = -13
  Font.Name = 'Product Sans'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 315
    Height = 66
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitWidth = 403
    ExplicitHeight = 77
  end
  object rdbtn_bobina: TRadioButton
    Left = 24
    Top = 24
    Width = 137
    Height = 17
    Caption = 'Comprovante Bobina'
    TabOrder = 1
    StyleElements = []
    OnClick = Seleciona_TpImpressao
  end
  object rdbtn_a4: TRadioButton
    Left = 176
    Top = 24
    Width = 121
    Height = 17
    Caption = 'Comprovante A4'
    TabOrder = 2
    StyleElements = []
    OnClick = Seleciona_TpImpressao
  end
end
