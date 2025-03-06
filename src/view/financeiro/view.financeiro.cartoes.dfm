inherited frmCartoes: TfrmCartoes
  Caption = 'Financeiro - Cart'#245'es'
  ClientHeight = 194
  ClientWidth = 754
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 766
  ExplicitHeight = 232
  TextHeight = 15
  inherited shp1: TShape
    Top = 127
    Width = 754
    ExplicitTop = 128
    ExplicitWidth = 662
  end
  inherited pnlBotoes: TPanel
    Top = 129
    Width = 754
    ExplicitTop = 128
    ExplicitWidth = 750
    inherited sbtnDuplicar: TSpeedButton
      Visible = False
    end
    inherited sbtnCancelar: TSpeedButton
      OnClick = sbtnCancelarClick
    end
    inherited sbtnSalvar: TSpeedButton
      OnClick = sbtnSalvarClick
    end
    inherited sbtnDeletar: TSpeedButton
      OnClick = sbtnDeletarClick
    end
    inherited sbtnPesquisar: TSpeedButton
      OnClick = sbtnPesquisarClick
    end
    inherited sbtnSair: TSpeedButton
      Left = 686
      ExplicitLeft = 594
    end
  end
  inherited pnlDados: TPanel
    Width = 754
    Height = 127
    ExplicitWidth = 750
    ExplicitHeight = 126
    object Label1: TLabel
      Left = 95
      Top = 5
      Width = 51
      Height = 16
      Caption = 'Emiss'#227'o'
    end
    object Label2: TLabel
      Left = 216
      Top = 5
      Width = 40
      Height = 16
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 19
      Top = 65
      Width = 44
      Height = 16
      Caption = 'Parcela'
    end
    object Label4: TLabel
      Left = 95
      Top = 65
      Width = 51
      Height = 16
      Caption = 'Parcelas'
    end
    object Label5: TLabel
      Left = 171
      Top = 66
      Width = 68
      Height = 16
      Caption = 'Vencimento'
    end
    object Label7: TLabel
      Left = 292
      Top = 65
      Width = 29
      Height = 16
      Caption = 'Valor'
    end
    object idtbcartao: TLabeledEdit
      Left = 19
      Top = 24
      Width = 70
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object dtemissao: TJvDatePickerEdit
      Left = 95
      Top = 24
      Width = 115
      Height = 25
      AllowNoDate = True
      Checked = True
      Flat = False
      ParentFlat = False
      TabOrder = 1
    end
    object idcliente: TJvComboEdit
      Left = 216
      Top = 24
      Width = 81
      Height = 24
      Alignment = taCenter
      Flat = False
      ParentFlat = False
      ButtonFlat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
        9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
        525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
        525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
        EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
        757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
        EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
        F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
        DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
        F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
        F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
        F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
        CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
        7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
        EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
        52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
        5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
        EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
        52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
        6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
        EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
        77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
        D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
        EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
        C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
        F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
        F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
        D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
        F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
        EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
        BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
        F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
        EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
        76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
        D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
        EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
        52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
        6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
        F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
        54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
        5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
        F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
        CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
        91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
      NumGlyphs = 2
      TabOrder = 2
      Text = ''
      OnButtonClick = idclienteButtonClick
      OnChange = idclienteChange
      NumbersOnly = True
    end
    object cliente: TJvStaticText
      Left = 303
      Top = 24
      Width = 338
      Height = 25
      AutoSize = False
      BorderStyle = sbsSingle
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
      Layout = tlCenter
      TabOrder = 3
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object parcela: TJvSpinEdit
      Left = 19
      Top = 85
      Width = 70
      Height = 24
      Alignment = taCenter
      Decimal = 0
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      TabOrder = 4
    end
    object parcelas: TJvSpinEdit
      Left = 95
      Top = 85
      Width = 70
      Height = 24
      Alignment = taCenter
      Decimal = 0
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      TabOrder = 5
    end
    object dtvencimento: TJvDatePickerEdit
      Left = 171
      Top = 85
      Width = 115
      Height = 25
      AllowNoDate = True
      Checked = True
      Flat = False
      ParentFlat = False
      TabOrder = 6
    end
    object valor: TJvValidateEdit
      Left = 292
      Top = 85
      Width = 77
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfCurrency
      DecimalPlaces = 2
      EditText = '0,00'
      TabOrder = 7
      OnChange = valorChange
      OnClick = valorClick
      OnEnter = valorEnter
    end
    object documento: TLabeledEdit
      Left = 375
      Top = 85
      Width = 266
      Height = 24
      EditLabel.Width = 129
      EditLabel.Height = 16
      EditLabel.Caption = 'Documento / Hist'#243'rico'
      TabOrder = 8
      Text = ''
    end
  end
end
