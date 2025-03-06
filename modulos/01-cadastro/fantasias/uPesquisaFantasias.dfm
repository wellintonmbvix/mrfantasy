inherited fPesquisaFantasias: TfPesquisaFantasias
  Caption = 'Mister Fantasy - Pesquisa de Produtos'
  ClientHeight = 546
  ClientWidth = 747
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 753
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 741
    ExplicitWidth = 741
    inherited sbtn_search: TSpeedButton
      Left = 704
      Visible = False
      ExplicitLeft = 704
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 1
      Text = 'Nome'
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Descri'#231#227'o')
    end
    inherited ledt_valor: TLabeledEdit
      Width = 475
      Height = 23
      EditLabel.Width = 98
      EditLabel.Caption = 'Nome da fantasia'
      EditLabel.ExplicitLeft = 223
      EditLabel.ExplicitTop = 8
      EditLabel.ExplicitWidth = 98
      OnEnter = ledt_valorEnter
      OnKeyPress = ledt_valorKeyPress
      ExplicitWidth = 475
      ExplicitHeight = 23
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
    Top = 513
    Width = 741
    ExplicitTop = 513
    ExplicitWidth = 741
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 633
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 633
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 741
    Height = 436
    DataSource = dsFantasias
    OnDblClick = jvdb_dadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'idtbproduto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 315
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Width = 154
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock'
        Title.Alignment = taCenter
        Title.Caption = 'Estoque'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estoquemin'
        Title.Alignment = taCenter
        Title.Caption = 'Estoque Min.'
        Width = 76
        Visible = True
      end>
  end
  object dsFantasias: TDataSource
    Enabled = False
    Left = 312
    Top = 216
  end
end
