inherited fFuncionarios: TfFuncionarios
  Caption = 'Mr Fantasy - Cadastro de Funcion'#225'rios'
  ClientHeight = 331
  ClientWidth = 719
  OnClose = FormClose
  ExplicitWidth = 731
  ExplicitHeight = 369
  TextHeight = 15
  inherited shp1: TShape
    Top = 264
    Width = 719
    ExplicitTop = 264
    ExplicitWidth = 719
  end
  inherited pnlBotoes: TPanel
    Top = 266
    Width = 719
    ExplicitTop = 265
    ExplicitWidth = 715
    inherited sbtnNovo: TSpeedButton
      OnClick = sbtnNovoClick
    end
    inherited sbtnDuplicar: TSpeedButton
      Visible = False
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
      Left = 651
      ExplicitLeft = 651
    end
  end
  inherited pnlDados: TPanel
    Width = 719
    Height = 264
    ExplicitWidth = 715
    ExplicitHeight = 263
    object Label1: TLabel
      Left = 650
      Top = 157
      Width = 41
      Height = 16
      Alignment = taCenter
      Caption = 'Estado'
    end
    object ledt_idfuncionario: TLabeledEdit
      Left = 19
      Top = 24
      Width = 78
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 67
      EditLabel.Height = 16
      EditLabel.Caption = 'Funcion'#225'rio'
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object ledt_nome: TLabeledEdit
      Left = 103
      Top = 24
      Width = 420
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome'
      TabOrder = 1
      Text = ''
    end
    object ledt_funcao: TLabeledEdit
      Left = 327
      Top = 72
      Width = 278
      Height = 24
      EditLabel.Width = 43
      EditLabel.Height = 16
      EditLabel.Caption = 'Fun'#231#227'o'
      TabOrder = 6
      Text = ''
    end
    object ledt_cpf: TLabeledEdit
      Left = 19
      Top = 72
      Width = 102
      Height = 24
      EditLabel.Width = 26
      EditLabel.Height = 16
      EditLabel.Caption = 'CPF'
      NumbersOnly = True
      TabOrder = 3
      Text = ''
      OnEnter = ledt_cpfEnter
      OnExit = ledt_cpfExit
    end
    object ledt_rg: TLabeledEdit
      Left = 127
      Top = 72
      Width = 102
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Identidade'
      TabOrder = 4
      Text = ''
    end
    object ledt_admissao: TLabeledEdit
      Left = 235
      Top = 72
      Width = 86
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Admiss'#227'o'
      NumbersOnly = True
      TabOrder = 5
      Text = ''
      OnKeyPress = ledt_admissaoKeyPress
    end
    object ledt_demissao: TLabeledEdit
      Left = 611
      Top = 72
      Width = 86
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Demiss'#227'o'
      NumbersOnly = True
      TabOrder = 7
      Text = ''
      OnKeyPress = ledt_demissaoKeyPress
    end
    object ledt_cep: TLabeledEdit
      Left = 19
      Top = 128
      Width = 67
      Height = 24
      EditLabel.Width = 23
      EditLabel.Height = 16
      EditLabel.Caption = 'Cep'
      TabOrder = 8
      Text = ''
    end
    object ledt_endereco: TLabeledEdit
      Left = 92
      Top = 128
      Width = 333
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Endere'#231'o'
      TabOrder = 9
      Text = ''
    end
    object ledt_nro: TLabeledEdit
      Left = 431
      Top = 128
      Width = 55
      Height = 24
      Alignment = taCenter
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = 'N'#250'mero'
      TabOrder = 10
      Text = ''
    end
    object ledt_comp: TLabeledEdit
      Left = 492
      Top = 128
      Width = 205
      Height = 24
      EditLabel.Width = 80
      EditLabel.Height = 16
      EditLabel.Caption = 'Complemento'
      TabOrder = 11
      Text = ''
    end
    object ledt_bairro: TLabeledEdit
      Left = 19
      Top = 178
      Width = 332
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Bairro'
      TabOrder = 12
      Text = ''
    end
    object ledt_cidade: TLabeledEdit
      Left = 357
      Top = 178
      Width = 284
      Height = 24
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Cidade'
      TabOrder = 13
      Text = ''
    end
    object cbox_uf: TComboBox
      Left = 650
      Top = 178
      Width = 47
      Height = 24
      Style = csDropDownList
      ItemIndex = 7
      TabOrder = 14
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
    object ledt_fone1: TLabeledEdit
      Left = 19
      Top = 226
      Width = 102
      Height = 24
      EditLabel.Width = 53
      EditLabel.Height = 16
      EditLabel.Caption = 'Tel.: Fixo'
      NumbersOnly = True
      TabOrder = 15
      Text = ''
      TextHint = '(00)0000-0000'
      OnKeyPress = ledt_fone1KeyPress
    end
    object ledt_fone2: TLabeledEdit
      Left = 127
      Top = 226
      Width = 114
      Height = 24
      EditLabel.Width = 68
      EditLabel.Height = 16
      EditLabel.Caption = 'Tel.: Celular'
      NumbersOnly = True
      TabOrder = 16
      Text = ''
      TextHint = '(00)00000-0000'
      OnKeyPress = ledt_fone2KeyPress
    end
    object ledt_abreviatura: TLabeledEdit
      Left = 529
      Top = 24
      Width = 168
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = 'Abreviatura'
      TabOrder = 2
      Text = ''
    end
  end
end
