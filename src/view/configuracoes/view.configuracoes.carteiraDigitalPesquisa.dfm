inherited frmPesquisaCarteiraDigital: TfrmPesquisaCarteiraDigital
  Caption = 'Mister Fantasy - Pesquisa Carteiras Digitais'
  ClientHeight = 396
  ClientWidth = 592
  OnClose = FormClose
  ExplicitWidth = 604
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 586
    ExplicitWidth = 582
    inherited sbtn_search: TSpeedButton
      Left = 440
      Visible = False
      OnClick = sbtn_searchClick
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
      OnKeyPress = ledt_valorKeyPress
      ExplicitWidth = 211
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
    Top = 363
    Width = 586
    ExplicitWidth = 582
    inherited sbtn_anterior: TSpeedButton
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 478
      OnClick = sbtn_proximoClick
      ExplicitLeft = 365
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 586
    Height = 286
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
        Width = 449
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
  inherited fdmtb_dados: TFDMemTable
    AfterOpen = fdmtb_dadosAfterOpen
    StoreDefs = True
  end
end
