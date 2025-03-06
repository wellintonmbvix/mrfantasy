inherited frmPesquisaEmpresas: TfrmPesquisaEmpresas
  Caption = 'Mr Fantasy - Pesquisa de Empresas'
  ClientHeight = 525
  ClientWidth = 882
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
      Text = 'Raz'#227'o Social'
      Items.Strings = (
        'Raz'#227'o Social'
        'Nome Fantasia'
        'Cnpj'
        'Insc. Estadual')
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
    inherited sbtn_proximo: TSpeedButton
      Left = 768
      ExplicitLeft = 725
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 876
    Height = 415
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbempresa'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razao'
        Title.Caption = 'Raz'#227'o Social'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fantasia'
        Title.Caption = 'Nome Fantasia'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cnpj'
        Title.Caption = 'Cnpj'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'insc'
        Title.Caption = 'Insc. Estadual'
        Width = 115
        Visible = True
      end>
  end
  inherited fdmtb_dados: TFDMemTable
    StoreDefs = True
  end
  inherited ds_dados: TDataSource
    DataSet = fdmtb_dados
  end
end
