inherited fPesquisaClientes: TfPesquisaClientes
  Caption = 'Mr Fantasy - Pesquisa de Clientes'
  ClientHeight = 525
  ClientWidth = 882
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 894
  ExplicitHeight = 563
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 876
    ExplicitWidth = 872
    inherited cbox_campo: TComboBox
      ItemIndex = 1
      Text = 'Nome'
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Cpf'
        'Identidade')
    end
    inherited ledt_valor: TLabeledEdit
      EditLabel.ExplicitTop = 7
      EditLabel.ExplicitWidth = 90
      OnEnter = ledt_valorEnter
      OnKeyPress = ledt_valorKeyPress
    end
    inherited cbox_registros: TComboBox
      ItemIndex = 9
      Text = '1000'
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
    end
  end
  inherited pnl_bottom: TPanel
    Top = 492
    Width = 876
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
  inherited jvdb_dados: TJvDBGrid
    Width = 876
    Height = 415
    DataSource = dsClientes
    OnDblClick = jvdb_dadosDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbcliente'
        Title.Alignment = taCenter
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
  object dsClientes: TDataSource
    Enabled = False
    Left = 256
    Top = 128
  end
end
