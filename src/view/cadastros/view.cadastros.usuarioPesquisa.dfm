inherited frmPesquisaUsuarios: TfrmPesquisaUsuarios
  Caption = 'Mr Fantasy - Pesquisa de Usu'#225'rios'
  ClientHeight = 525
  ClientWidth = 882
  ExplicitWidth = 894
  ExplicitHeight = 563
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 876
    ExplicitWidth = 872
    inherited lbl_capregistros: TLabel
      Left = 135
      Visible = False
      ExplicitLeft = 135
    end
    inherited sbtn_search: TSpeedButton
      Left = 439
      OnClick = sbtn_searchClick
      ExplicitLeft = 439
    end
    inherited cbox_campo: TComboBox
      Width = 121
      ItemIndex = 0
      Text = 'Nome de Usu'#225'rio'
      Items.Strings = (
        'Nome de Usu'#225'rio')
      ExplicitWidth = 121
    end
    inherited ledt_valor: TLabeledEdit
      Left = 135
      Width = 298
      EditLabel.ExplicitLeft = 135
      EditLabel.ExplicitTop = 7
      EditLabel.ExplicitWidth = 90
      ExplicitLeft = 135
      ExplicitWidth = 298
    end
    inherited cbox_registros: TComboBox
      Left = 135
      Visible = False
      ExplicitLeft = 135
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
      ExplicitLeft = 367
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 876
    Height = 415
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbusuario'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'username'
        Title.Caption = 'Nome de Usu'#225'rio'
        Width = 386
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
