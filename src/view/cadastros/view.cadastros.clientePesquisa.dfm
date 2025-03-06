inherited frmPesquisaClientes: TfrmPesquisaClientes
  Caption = 'Mr Fantasy - Pesquisa de Clientes'
  ClientHeight = 524
  ClientWidth = 878
  OnClose = FormClose
  ExplicitWidth = 894
  ExplicitHeight = 563
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 872
    ExplicitWidth = 872
    inherited sbtn_search: TSpeedButton
      OnClick = sbtn_searchClick
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 1
      Text = 'Nome'
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Cpf'
        'Identidade')
    end
  end
  inherited pnl_bottom: TPanel
    Top = 491
    Width = 872
    ExplicitTop = 491
    ExplicitWidth = 872
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 768
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 768
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 872
    Height = 414
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbcliente'
        Title.Caption = 'Cliente'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fone1'
        Title.Caption = 'Telefone 1'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fone2'
        Title.Caption = 'Telefone 2'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf_cnpj'
        Title.Caption = 'Cpf'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rg_insc'
        Title.Caption = 'Identidade'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtnascimento'
        Title.Caption = 'Dt Nascimento'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'Email'
        Width = 339
        Visible = True
      end>
  end
  inherited fdmtb_dados: TFDMemTable
    AfterOpen = fdmtb_dadosAfterOpen
    StoreDefs = True
  end
  inherited ds_dados: TDataSource
    DataSet = fdmtb_dados
  end
end
