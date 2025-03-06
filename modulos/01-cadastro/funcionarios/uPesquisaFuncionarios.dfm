inherited fPesquisaFuncionarios: TfPesquisaFuncionarios
  Caption = 'Mr Fantasy - Pesquisa de Funcion'#225'rios'
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    inherited lbl_capregistros: TLabel
      Visible = False
    end
    inherited sbtn_search: TSpeedButton
      Visible = False
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
    Visible = False
  end
  inherited jvdb_dados: TJvDBGrid
    DataSource = dsFuncionarios
    OnDblClick = jvdb_dadosDblClick
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
  object dsFuncionarios: TDataSource
    Enabled = False
    Left = 288
    Top = 176
  end
end
