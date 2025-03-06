inherited fPesquisaWalletsDigital: TfPesquisaWalletsDigital
  Caption = 'Mister Fantasy - Pesquisa Carteiras Digitais'
  ClientWidth = 479
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 485
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 473
    ExplicitWidth = 473
    inherited sbtn_search: TSpeedButton
      Left = 440
      Visible = False
      ExplicitLeft = 440
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 0
      Text = 'Nome'
      Items.Strings = (
        'Nome')
    end
    inherited ledt_valor: TLabeledEdit
      Width = 211
      Height = 23
      OnEnter = ledt_valorEnter
      OnKeyPress = ledt_valorKeyPress
      ExplicitWidth = 211
      ExplicitHeight = 23
    end
    inherited cbox_registros: TComboBox
      Text = '10'
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
    Width = 473
    ExplicitWidth = 473
    inherited sbtn_anterior: TSpeedButton
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 365
      OnClick = sbtn_proximoClick
      ExplicitLeft = 365
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 473
    DataSource = dsWallets
    OnDblClick = jvdb_dadosDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbwallet'
        Title.Alignment = taCenter
        Title.Caption = 'Carteira'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Nome'
        Width = 325
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dias_dep'
        Title.Alignment = taCenter
        Title.Caption = 'Dias'
        Width = 52
        Visible = True
      end>
  end
  object dsWallets: TDataSource
    Enabled = False
    Left = 232
    Top = 192
  end
end
