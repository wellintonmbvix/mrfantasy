inherited frmEmpresas: TfrmEmpresas
  Caption = 'Mr Fantasy - Cadastro de Empresas'
  ClientHeight = 346
  ClientWidth = 730
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 742
  ExplicitHeight = 384
  TextHeight = 15
  inherited shp1: TShape
    Top = 279
    Width = 730
    ExplicitTop = 236
    ExplicitWidth = 737
  end
  inherited pnlBotoes: TPanel
    Top = 281
    Width = 730
    ExplicitTop = 280
    ExplicitWidth = 726
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
    inherited sbtnSair: TSpeedButton
      Left = 662
      ExplicitLeft = 669
    end
  end
  inherited pnlDados: TPanel
    Width = 730
    Height = 279
    ExplicitWidth = 726
    ExplicitHeight = 278
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
    object idtbempresa: TLabeledEdit
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
    object razao: TLabeledEdit
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
    object fantasia: TLabeledEdit
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
    object endereco: TLabeledEdit
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
    object nro: TLabeledEdit
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
    object comp: TLabeledEdit
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
    object bairro: TLabeledEdit
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
    object cidade: TLabeledEdit
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
    object cep: TLabeledEdit
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
    object uf: TComboBox
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
    object cnpj: TLabeledEdit
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
      OnEnter = cnpjEnter
      OnExit = cnpjExit
    end
    object insc: TLabeledEdit
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
      OnEnter = inscEnter
      OnExit = inscExit
    end
    object obsaluguel: TMemo
      Left = 281
      Top = 193
      Width = 432
      Height = 73
      TabOrder = 14
      OnEnter = obsaluguelEnter
      OnExit = obsaluguelExit
      OnKeyPress = obsaluguelKeyPress
    end
    object fone1: TLabeledEdit
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
      OnKeyPress = fone1KeyPress
    end
    object fone2: TLabeledEdit
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
      OnKeyPress = fone1KeyPress
    end
  end
end
