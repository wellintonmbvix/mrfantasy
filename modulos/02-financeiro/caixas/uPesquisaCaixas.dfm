inherited fPesquisaCaixas: TfPesquisaCaixas
  Caption = 'Mr Fantasy - Pesquisa de Caixas'
  ClientHeight = 344
  ClientWidth = 774
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 780
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 768
    ExplicitWidth = 768
    inherited lbl_campo: TLabel
      Top = 72
      Visible = False
      ExplicitTop = 72
    end
    inherited lbl_capregistros: TLabel
      Left = 135
      ExplicitLeft = 135
    end
    inherited sbtn_search: TSpeedButton
      Left = 407
      OnClick = sbtn_searchClick
      ExplicitLeft = 407
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 8
      Width = 26
      Height = 15
      Caption = 'Data'
    end
    inherited cbox_campo: TComboBox
      Top = 90
      Visible = False
      ExplicitTop = 90
    end
    inherited ledt_valor: TLabeledEdit
      Left = 648
      Width = 106
      Height = 23
      EditLabel.ExplicitLeft = 648
      EditLabel.ExplicitTop = 8
      EditLabel.ExplicitWidth = 97
      Visible = False
      ExplicitLeft = 648
      ExplicitWidth = 106
      ExplicitHeight = 23
    end
    inherited cbox_registros: TComboBox
      Left = 135
      Text = '10'
      OnChange = cbox_registrosChange
      Items.Strings = (
        '10'
        '20'
        '30'
        '40'
        '50'
        '100'
        '200'
        '300'
        '500'
        '1000')
      ExplicitLeft = 135
    end
    object jvdedt_emissao: TJvDatePickerEdit
      Left = 8
      Top = 26
      Width = 121
      Height = 24
      AllowNoDate = True
      Checked = True
      TabOrder = 3
      OnPopupShown = jvdedt_emissaoPopupShown
    end
    object check_ent_cash: TCheckBox
      Left = 199
      Top = 30
      Width = 106
      Height = 17
      Hint = 'Exibe recebimento em dinheiro de Alugueis e Vendas'
      Caption = 'Todas Entradas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object check_caixas: TCheckBox
      Left = 311
      Top = 30
      Width = 90
      Height = 17
      Hint = 'Exibe registros de todos usu'#225'rios ou somente atual'
      Caption = 'Todos Caixas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  inherited pnl_bottom: TPanel
    Top = 311
    Width = 768
    ExplicitTop = 311
    ExplicitWidth = 768
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 660
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 660
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 768
    Height = 234
    DataSource = dsCaixas
    OnDblClick = jvdb_dadosDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idcaixa'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'origem'
        Title.Caption = 'Origem'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'documento'
        Title.Caption = 'Comprovante / Hist'#243'rico'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tpmov'
        Title.Caption = 'Tipo'
        Width = 93
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 98
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'saldo'
        Title.Caption = 'Saldo'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usercad'
        Title.Caption = 'Operador'
        Width = 116
        Visible = True
      end>
  end
  object dsCaixas: TDataSource
    Enabled = False
    Left = 304
    Top = 176
  end
  object JvBalloonHint: TJvBalloonHint
    CustomAnimationStyle = atSlide
    DefaultIcon = ikNone
    UseBalloonAsApplicationHint = True
    Left = 408
    Top = 188
  end
end
