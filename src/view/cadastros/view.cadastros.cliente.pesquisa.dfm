inherited frmPesquisaClientes: TfrmPesquisaClientes
  Caption = 'Mr Fantasy - Pesquisa de Clientes'
  ClientHeight = 525
  ClientWidth = 882
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 888
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 876
    ExplicitWidth = 876
    inherited sbtn_search: TSpeedButton
      OnClick = sbtn_searchClick
    end
    inherited cbox_campo: TComboBox
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Cpf'
        'Identidade')
    end
    inherited ledt_valor: TLabeledEdit
      OnKeyPress = ledt_valorKeyPress
    end
  end
  inherited pnl_bottom: TPanel
    Top = 492
    Width = 876
    ExplicitTop = 492
    ExplicitWidth = 876
    inherited sbtn_anterior: TSpeedButton
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 768
      OnClick = sbtn_proximoClick
      ExplicitLeft = 768
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 876
    Height = 415
    Columns = <
      item
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
    StoreDefs = True
  end
end
