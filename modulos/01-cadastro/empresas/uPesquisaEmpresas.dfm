inherited fPesquisaEmpresas: TfPesquisaEmpresas
  Caption = 'Mr Fantasy - Pesquisa de Empresas'
  ClientWidth = 839
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 845
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 833
    ExplicitWidth = 833
    inherited lbl_capregistros: TLabel
      Visible = False
    end
    inherited sbtn_search: TSpeedButton
      Visible = False
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
      Left = 159
      Width = 467
      Height = 23
      EditLabel.ExplicitLeft = 159
      EditLabel.ExplicitTop = 7
      EditLabel.ExplicitWidth = 90
      OnEnter = ledt_valorEnter
      OnKeyPress = ledt_valorKeyPress
      ExplicitLeft = 159
      ExplicitWidth = 467
      ExplicitHeight = 23
    end
    inherited cbox_registros: TComboBox
      Visible = False
    end
  end
  inherited pnl_bottom: TPanel
    Width = 833
    Visible = False
    ExplicitWidth = 833
    inherited sbtn_proximo: TSpeedButton
      Left = 725
      ExplicitLeft = 725
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 833
    Hint = 'Clique duas vezes para escolher'
    DataSource = dsEmpresas
    ParentShowHint = False
    ShowHint = True
    OnDblClick = jvdb_dadosDblClick
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
  object dsEmpresas: TDataSource
    Left = 200
    Top = 200
  end
end
