inherited frmPesquisaCartoes: TfrmPesquisaCartoes
  Caption = 'Pesquisa de Cart'#245'es'
  ClientHeight = 345
  ClientWidth = 864
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 880
  ExplicitHeight = 384
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 858
    ExplicitWidth = 858
    inherited lbl_campo: TLabel
      Left = 458
      Visible = False
      ExplicitLeft = 458
    end
    inherited lbl_capregistros: TLabel
      Left = 246
      ExplicitLeft = 246
    end
    inherited sbtn_search: TSpeedButton
      Left = 310
      OnClick = sbtn_searchClick
      ExplicitLeft = 310
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 8
      Width = 91
      Height = 15
      Caption = 'Emiss'#227'o a partir'
    end
    object Label2: TLabel [4]
      Left = 127
      Top = 8
      Width = 84
      Height = 15
      Caption = 'Vencimento at'#233
    end
    inherited cbox_campo: TComboBox
      Left = 458
      Width = 71
      Visible = False
      ExplicitLeft = 458
      ExplicitWidth = 71
    end
    inherited ledt_valor: TLabeledEdit
      Left = 535
      Width = 66
      EditLabel.ExplicitLeft = 535
      EditLabel.ExplicitTop = 7
      EditLabel.ExplicitWidth = 90
      Visible = False
      ExplicitLeft = 535
      ExplicitWidth = 66
    end
    inherited cbox_registros: TComboBox
      Left = 246
      Text = '10'
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
      ExplicitLeft = 246
    end
    object jvdpe_emissao: TJvDatePickerEdit
      Left = 8
      Top = 26
      Width = 113
      Height = 24
      AllowNoDate = True
      Checked = True
      TabOrder = 3
    end
    object jvdpe_vencimento: TJvDatePickerEdit
      Left = 127
      Top = 26
      Width = 113
      Height = 24
      AllowNoDate = True
      Checked = True
      TabOrder = 4
    end
  end
  inherited pnl_bottom: TPanel
    Top = 312
    Width = 858
    ExplicitTop = 312
    ExplicitWidth = 858
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 754
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 754
    end
  end
  inherited dbg_dados: TDBGrid
    Width = 858
    Height = 235
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idtbcartao'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtemissao'
        Title.Caption = 'Emiss'#227'o'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'parcela'
        Title.Alignment = taCenter
        Title.Caption = 'Parcela'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'parcelas'
        Title.Alignment = taCenter
        Title.Caption = 'Parcelas'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtvencimento'
        Title.Caption = 'Vencimento'
        Width = 77
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'origem'
        Title.Caption = 'Origem'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'documento'
        Width = 114
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
