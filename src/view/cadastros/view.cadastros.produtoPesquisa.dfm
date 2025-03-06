inherited frmPesquisaProdutos: TfrmPesquisaProdutos
  Caption = 'Mister Fantasy - Pesquisa de Produtos'
  ClientHeight = 519
  ClientWidth = 882
  OnClose = FormClose
  ExplicitWidth = 894
  ExplicitHeight = 557
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 876
    ExplicitWidth = 872
    inherited sbtn_search: TSpeedButton
      Left = 704
      OnClick = sbtn_searchClick
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
      EditLabel.Width = 98
      EditLabel.Caption = 'Nome da fantasia'
      EditLabel.ExplicitLeft = 223
      EditLabel.ExplicitTop = 8
      EditLabel.ExplicitWidth = 98
      ExplicitWidth = 475
    end
    inherited cbox_registros: TComboBox
      ItemIndex = 4
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
    Top = 486
    Width = 876
    ExplicitTop = 485
    ExplicitWidth = 872
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 768
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 633
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 876
    Height = 409
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
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estoque'
        Title.Alignment = taCenter
        Title.Caption = 'Estoque'
        Width = 76
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'vlrvenda'
        Title.Caption = 'Vlr. Venda'
        Width = 77
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'vlraluguel'
        Title.Caption = 'Vlr. Aluguel'
        Width = 79
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
