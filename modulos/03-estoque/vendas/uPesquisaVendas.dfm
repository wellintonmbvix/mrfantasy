inherited fPesquisaVendas: TfPesquisaVendas
  Caption = 'Mister Fantasy - Pesquisa de Vendas'
  ClientHeight = 344
  ClientWidth = 833
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 839
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 827
    ExplicitWidth = 827
    inherited sbtn_search: TSpeedButton
      Left = 792
      OnClick = sbtn_searchClick
      ExplicitLeft = 792
    end
    object Label1: TLabel [3]
      Left = 223
      Top = 8
      Width = 96
      Height = 15
      Caption = 'Data de Emiss'#227'o'
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 0
      Text = 'Data de Emiss'#227'o'
      Items.Strings = (
        'Data de Emiss'#227'o'
        'Cliente')
    end
    inherited ledt_valor: TLabeledEdit
      Left = 335
      Width = 332
      EditLabel.Width = 93
      EditLabel.Caption = 'Nome do Cliente'
      EditLabel.ExplicitLeft = 335
      EditLabel.ExplicitWidth = 93
      ExplicitLeft = 335
      ExplicitWidth = 332
    end
    inherited cbox_registros: TComboBox
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
    end
    object jvdedt_emissao: TJvDatePickerEdit
      Left = 223
      Top = 26
      Width = 106
      Height = 24
      AllowNoDate = True
      Checked = True
      TabOrder = 3
      OnPopupShown = jvdedt_emissaoPopupShown
    end
    object check_canc: TCheckBox
      Left = 673
      Top = 30
      Width = 113
      Height = 17
      Caption = 'Exibir Canceladas'
      TabOrder = 4
    end
  end
  inherited pnl_bottom: TPanel
    Top = 311
    Width = 827
    ExplicitTop = 311
    ExplicitWidth = 827
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 719
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 719
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 827
    Height = 234
    DataSource = dsVendas
    OnDblClick = jvdb_dadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'idtbvendanota'
        Title.Caption = 'Controle'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtemissao'
        Title.Caption = 'Emiss'#227'o'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 303
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'qtde_total'
        Title.Caption = 'Qtde'
        Width = 54
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'forma_pagto'
        Title.Caption = 'Cond. Pagto'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usercad'
        Title.Caption = 'Usu'#225'rio'
        Width = 115
        Visible = True
      end>
  end
  object dsVendas: TDataSource
    Enabled = False
    Left = 408
    Top = 176
  end
end
