inherited frmClientes: TfrmClientes
  Caption = 'Mr Fantasy - Cadastro de Clientes'
  ClientWidth = 756
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 768
  ExplicitHeight = 480
  TextHeight = 15
  inherited shp1: TShape
    Width = 756
    ExplicitTop = 379
    ExplicitWidth = 719
  end
  inherited pnlBotoes: TPanel
    Width = 756
    ExplicitWidth = 752
    inherited sbtnDuplicar: TSpeedButton
      OnClick = sbtnDuplicarClick
    end
    inherited sbtnCancelar: TSpeedButton
      OnClick = sbtnCancelarClick
      ExplicitLeft = 145
      ExplicitTop = 4
      ExplicitHeight = 59
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
      Left = 688
      ExplicitLeft = 651
    end
  end
  inherited pnlDados: TPanel
    Width = 756
    ExplicitWidth = 752
    object Label1: TLabel
      Left = 685
      Top = 116
      Width = 41
      Height = 16
      Alignment = taCenter
      Caption = 'Estado'
    end
    object idtbcliente: TLabeledEdit
      Left = 19
      Top = 24
      Width = 78
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Cliente'
      NumbersOnly = True
      TabOrder = 0
      Text = ''
      OnChange = idtbclienteChange
    end
    object nome: TLabeledEdit
      Left = 103
      Top = 24
      Width = 408
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome'
      TabOrder = 1
      Text = ''
    end
    object cpf_cnpj: TLabeledEdit
      Left = 519
      Top = 24
      Width = 102
      Height = 24
      EditLabel.Width = 26
      EditLabel.Height = 16
      EditLabel.Caption = 'CPF'
      NumbersOnly = True
      TabOrder = 2
      Text = ''
      OnEnter = cpf_cnpjEnter
      OnExit = cpf_cnpjExit
    end
    object rg_insc: TLabeledEdit
      Left = 627
      Top = 24
      Width = 102
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Identidade'
      TabOrder = 3
      Text = ''
    end
    object cep: TLabeledEdit
      Left = 19
      Top = 88
      Width = 67
      Height = 24
      EditLabel.Width = 23
      EditLabel.Height = 16
      EditLabel.Caption = 'Cep'
      TabOrder = 4
      Text = ''
      OnExit = cepExit
    end
    object endereco: TLabeledEdit
      Left = 92
      Top = 88
      Width = 333
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Endere'#231'o'
      TabOrder = 5
      Text = ''
    end
    object nro: TLabeledEdit
      Left = 431
      Top = 88
      Width = 55
      Height = 24
      Alignment = taCenter
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = 'N'#250'mero'
      TabOrder = 6
      Text = ''
    end
    object comp: TLabeledEdit
      Left = 492
      Top = 88
      Width = 237
      Height = 24
      EditLabel.Width = 80
      EditLabel.Height = 16
      EditLabel.Caption = 'Complemento'
      TabOrder = 7
      Text = ''
    end
    object bairro: TLabeledEdit
      Left = 19
      Top = 138
      Width = 332
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Bairro'
      TabOrder = 8
      Text = ''
    end
    object cidade: TLabeledEdit
      Left = 357
      Top = 138
      Width = 320
      Height = 24
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Cidade'
      TabOrder = 9
      Text = ''
    end
    object uf: TComboBox
      Left = 682
      Top = 138
      Width = 47
      Height = 24
      Style = csDropDownList
      ItemIndex = 7
      TabOrder = 10
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
    object nascimento: TLabeledEdit
      Left = 19
      Top = 190
      Width = 89
      Height = 24
      EditLabel.Width = 69
      EditLabel.Height = 16
      EditLabel.Caption = 'Nascimento'
      NumbersOnly = True
      TabOrder = 11
      Text = ''
      OnKeyPress = nascimentoKeyPress
    end
    object fone1: TLabeledEdit
      Left = 114
      Top = 190
      Width = 103
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Telefone 1'
      NumbersOnly = True
      TabOrder = 12
      Text = ''
      TextHint = '(00)0000-0000'
      OnKeyPress = fone1KeyPress
    end
    object fone2: TLabeledEdit
      Left = 223
      Top = 190
      Width = 103
      Height = 24
      EditLabel.Width = 58
      EditLabel.Height = 16
      EditLabel.Caption = 'Telefone 2'
      NumbersOnly = True
      TabOrder = 13
      Text = ''
      TextHint = '(00)0000-0000'
      OnKeyPress = fone2KeyPress
    end
    object email: TLabeledEdit
      Left = 332
      Top = 190
      Width = 397
      Height = 24
      CharCase = ecLowerCase
      EditLabel.Width = 37
      EditLabel.Height = 16
      EditLabel.Caption = 'E-mail'
      TabOrder = 14
      Text = ''
      OnExit = emailExit
    end
    object pgc_obshist: TPageControl
      Left = 19
      Top = 220
      Width = 710
      Height = 153
      ActivePage = tbs_observacao
      TabOrder = 15
      object tbs_observacao: TTabSheet
        Caption = 'Oberva'#231#245'es'
        object obs: TMemo
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 686
          Height = 106
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
          OnEnter = obsEnter
          OnExit = obsExit
        end
      end
      object tbs_historico: TTabSheet
        Caption = 'Hist'#243'rico / Alugados'
        ImageIndex = 1
        object dbgHistorico: TDBGrid
          Left = 0
          Top = 0
          Width = 702
          Height = 122
          Align = alClient
          BorderStyle = bsNone
          DataSource = dshistorico
          Options = [dgTitles, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = 5395026
          TitleFont.Height = -13
          TitleFont.Name = 'Product Sans'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dtretirada'
              Title.Alignment = taCenter
              Title.Caption = 'Retirado'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dtdevolucao'
              Title.Alignment = taCenter
              Title.Caption = 'Devolvido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 376
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'qtde'
              Title.Alignment = taCenter
              Title.Caption = 'Qtde'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'totalLiquido'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 77
              Visible = True
            end>
        end
      end
    end
  end
  object dshistorico: TDataSource
    DataSet = fdmtb_historico
    Left = 207
    Top = 311
  end
  object fdmtb_historico: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 343
    Top = 311
    object fdmtb_historicodtretirada: TDateField
      FieldName = 'dtretirada'
    end
    object fdmtb_historicodtdevolucao: TDateField
      FieldName = 'dtdevolucao'
    end
    object fdmtb_historicoproduto: TWideStringField
      FieldName = 'produto'
      Size = 60
    end
    object fdmtb_historicoqtde: TFMTBCDField
      FieldName = 'qtde'
    end
    object fdmtb_historicototalLiquido: TFMTBCDField
      FieldName = 'totalLiquido'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
end
