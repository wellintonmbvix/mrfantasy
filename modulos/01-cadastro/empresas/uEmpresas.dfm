inherited fEmpresas: TfEmpresas
  Caption = 'Mr Fantasy - Cadastro de Empresas'
  ClientHeight = 347
  ClientWidth = 734
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 746
  ExplicitHeight = 385
  TextHeight = 15
  inherited shp1: TShape
    Top = 280
    Width = 734
    ExplicitTop = 236
    ExplicitWidth = 737
  end
  inherited pnlBotoes: TPanel
    Top = 282
    Width = 734
    ExplicitTop = 281
    ExplicitWidth = 730
    inherited sbtnNovo: TSpeedButton
      OnClick = sbtnNovoClick
    end
    inherited sbtnDuplicar: TSpeedButton
      OnClick = sbtnDuplicarClick
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
    inherited sbtnAnterior: TSpeedButton
      OnClick = sbtnAnteriorClick
    end
    inherited sbtnProximo: TSpeedButton
      OnClick = sbtnProximoClick
    end
    inherited sbtnSair: TSpeedButton
      Left = 666
      ExplicitLeft = 669
    end
  end
  inherited pnlDados: TPanel
    Width = 734
    Height = 280
    ExplicitWidth = 730
    ExplicitHeight = 279
    object Label1: TLabel
      Left = 666
      Top = 115
      Width = 41
      Height = 16
      Alignment = taCenter
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 281
      Top = 174
      Width = 176
      Height = 16
      Caption = 'Regras de Contrato de Aluguel'
    end
    object ledt_idempresa: TLabeledEdit
      Left = 19
      Top = 24
      Width = 49
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clBtnFace
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object ledt_razao: TLabeledEdit
      Left = 74
      Top = 24
      Width = 303
      Height = 24
      EditLabel.Width = 77
      EditLabel.Height = 16
      EditLabel.Caption = 'Raz'#227'o Social'
      TabOrder = 1
      Text = ''
    end
    object ledt_fantasia: TLabeledEdit
      Left = 383
      Top = 24
      Width = 330
      Height = 24
      EditLabel.Width = 88
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome Fantasia'
      TabOrder = 2
      Text = ''
    end
    object ledt_endereco: TLabeledEdit
      Left = 92
      Top = 80
      Width = 333
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Endere'#231'o'
      TabOrder = 4
      Text = ''
    end
    object ledt_nro: TLabeledEdit
      Left = 431
      Top = 80
      Width = 55
      Height = 24
      Alignment = taCenter
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = 'N'#250'mero'
      TabOrder = 5
      Text = ''
    end
    object ledt_comp: TLabeledEdit
      Left = 492
      Top = 80
      Width = 221
      Height = 24
      EditLabel.Width = 80
      EditLabel.Height = 16
      EditLabel.Caption = 'Complemento'
      TabOrder = 6
      Text = ''
    end
    object ledt_bairro: TLabeledEdit
      Left = 19
      Top = 136
      Width = 332
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Bairro'
      TabOrder = 7
      Text = ''
    end
    object ledt_cidade: TLabeledEdit
      Left = 357
      Top = 136
      Width = 303
      Height = 24
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Cidade'
      TabOrder = 8
      Text = ''
    end
    object ledt_cep: TLabeledEdit
      Left = 19
      Top = 80
      Width = 67
      Height = 24
      EditLabel.Width = 23
      EditLabel.Height = 16
      EditLabel.Caption = 'Cep'
      NumbersOnly = True
      TabOrder = 3
      Text = ''
    end
    object cbox_uf: TComboBox
      Left = 666
      Top = 136
      Width = 47
      Height = 24
      Style = csDropDownList
      ItemIndex = 7
      TabOrder = 9
      Text = 'ES'
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
    object ledt_cnpj: TLabeledEdit
      Left = 19
      Top = 193
      Width = 129
      Height = 24
      EditLabel.Width = 26
      EditLabel.Height = 16
      EditLabel.Caption = 'Cnpj'
      MaxLength = 18
      NumbersOnly = True
      TabOrder = 10
      Text = ''
      OnEnter = ledt_cnpjEnter
      OnExit = ledt_cnpjExit
    end
    object ledt_inscest: TLabeledEdit
      Left = 19
      Top = 241
      Width = 129
      Height = 24
      EditLabel.Width = 107
      EditLabel.Height = 16
      EditLabel.Caption = 'Inscri'#231#227'o Estadual'
      MaxLength = 18
      NumbersOnly = True
      TabOrder = 11
      Text = ''
      OnEnter = ledt_inscestEnter
      OnExit = ledt_inscestExit
    end
    object mobsaluguel: TMemo
      Left = 281
      Top = 193
      Width = 432
      Height = 73
      TabOrder = 14
      OnEnter = mobsaluguelEnter
      OnExit = mobsaluguelExit
      OnKeyPress = mobsaluguelKeyPress
    end
    object ledt_fone1: TLabeledEdit
      Left = 154
      Top = 193
      Width = 121
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Telefone 1'
      MaxLength = 14
      TabOrder = 12
      Text = ''
      OnKeyPress = ledt_fone1KeyPress
    end
    object ledt_fone2: TLabeledEdit
      Left = 154
      Top = 241
      Width = 121
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Telefone 2'
      MaxLength = 14
      TabOrder = 13
      Text = ''
      OnKeyPress = ledt_fone1KeyPress
    end
  end
end
