inherited frmPesquisaFuncionarios: TfrmPesquisaFuncionarios
  Caption = 'Mr Fantasy - Pesquisa de Funcion'#225'rios'
  ClientHeight = 525
  ClientWidth = 882
  OnClose = FormClose
  ExplicitWidth = 894
  ExplicitHeight = 563
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 876
    ExplicitWidth = 872
    inherited lbl_capregistros: TLabel
      Visible = False
    end
    inherited sbtn_search: TSpeedButton
      OnClick = sbtn_searchClick
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 0
      TabStop = False
      Text = 'Nome'
      Items.Strings = (
        'Nome'
        'Cpf'
        'Identidade')
    end
    inherited ledt_valor: TLabeledEdit
      EditLabel.ExplicitLeft = 223
      EditLabel.ExplicitTop = 8
      EditLabel.ExplicitWidth = 97
    end
    inherited cbox_registros: TComboBox
      Visible = False
    end
  end
  inherited pnl_bottom: TPanel
    Top = 492
    Width = 876
    Visible = False
    ExplicitTop = 491
    ExplicitWidth = 872
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 392
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'Cpf'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rg'
        Title.Caption = 'Identidade'
        Width = 102
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
