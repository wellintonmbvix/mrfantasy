object fMisterConexao: TfMisterConexao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configurador'
  ClientHeight = 352
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 158
    Height = 18
    Caption = 'Arquivo de Configura'#231#227'o'
  end
  object SpeedButton1: TSpeedButton
    Left = 56
    Top = 303
    Width = 146
    Height = 41
    Caption = 'Testar Conex'#227'o'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 255
    Top = 303
    Width = 146
    Height = 41
    Caption = 'Salvar Configura'#231#227'o'
    OnClick = SpeedButton2Click
  end
  object JvComboEdit1: TJvComboEdit
    Left = 8
    Top = 34
    Width = 441
    Height = 26
    ButtonFlat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000EFEFEFF0F0F0
      9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
      525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
      F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
      DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
      F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
      7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
      EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
      52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
      6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
      EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
      77525252808080F0F0F0F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
      F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
      F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
      D4525252575757D7D7D7F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
      F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
      EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
      76525252828282F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
      6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
      F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
      54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
      91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
    ParentFont = False
    TabOrder = 0
    Text = ''
    OnButtonClick = JvComboEdit1ButtonClick
  end
  object JvRadioGroup1: TJvRadioGroup
    Left = 8
    Top = 66
    Width = 441
    Height = 143
    Caption = 'Dados de Conex'#227'o'
    TabOrder = 1
    CaptionVisible = False
  end
  object ledtServidor: TLabeledEdit
    Left = 16
    Top = 108
    Width = 423
    Height = 26
    EditLabel.Width = 119
    EditLabel.Height = 18
    EditLabel.Caption = 'Servidor de Dados'
    TabOrder = 2
  end
  object ledtBD: TLabeledEdit
    Left = 16
    Top = 156
    Width = 137
    Height = 26
    EditLabel.Width = 99
    EditLabel.Height = 18
    EditLabel.Caption = 'Base de Dados'
    TabOrder = 3
  end
  object ledtUserName: TLabeledEdit
    Left = 159
    Top = 156
    Width = 137
    Height = 26
    EditLabel.Width = 48
    EditLabel.Height = 18
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 4
  end
  object ledtPassword: TLabeledEdit
    Left = 302
    Top = 156
    Width = 137
    Height = 26
    EditLabel.Width = 40
    EditLabel.Height = 18
    EditLabel.Caption = 'Senha'
    PasswordChar = '*'
    TabOrder = 5
  end
  object JvRadioGroup2: TJvRadioGroup
    Left = 8
    Top = 215
    Width = 443
    Height = 82
    Caption = 'Par'#226'metros'
    TabOrder = 6
    CaptionVisible = False
  end
  object ledtEmpPadrao: TLabeledEdit
    Left = 88
    Top = 248
    Width = 65
    Height = 26
    Alignment = taCenter
    EditLabel.Width = 67
    EditLabel.Height = 18
    EditLabel.Caption = 'Empresa: '
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 7
  end
  object ledtPdv: TLabeledEdit
    Left = 319
    Top = 248
    Width = 65
    Height = 26
    Alignment = taCenter
    EditLabel.Width = 83
    EditLabel.Height = 18
    EditLabel.Caption = 'N'#186' Terminal:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 8
  end
  object OpenDialog: TOpenDialog
    Left = 216
    Top = 73
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 240
    Top = 144
  end
end
