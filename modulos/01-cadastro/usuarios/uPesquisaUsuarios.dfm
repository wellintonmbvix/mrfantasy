inherited fPesquisaUsuarios: TfPesquisaUsuarios
  Caption = 'Mr Fantasy - Pesquisa de Usu'#225'rios'
  ClientWidth = 481
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 487
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 475
    ExplicitWidth = 475
    inherited lbl_capregistros: TLabel
      Left = 135
      Visible = False
      ExplicitLeft = 135
    end
    inherited sbtn_search: TSpeedButton
      Left = 439
      Visible = False
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
      Height = 23
      EditLabel.ExplicitLeft = 135
      EditLabel.ExplicitTop = 7
      EditLabel.ExplicitWidth = 90
      OnEnter = ledt_valorEnter
      OnKeyPress = ledt_valorKeyPress
      ExplicitLeft = 135
      ExplicitWidth = 298
      ExplicitHeight = 23
    end
    inherited cbox_registros: TComboBox
      Left = 135
      Visible = False
      ExplicitLeft = 135
    end
  end
  inherited pnl_bottom: TPanel
    Width = 475
    Visible = False
    ExplicitWidth = 475
    inherited sbtn_proximo: TSpeedButton
      Left = 367
      ExplicitLeft = 367
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 475
    DataSource = dsUsuarios
    OnDblClick = jvdb_dadosDblClick
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
  object dsUsuarios: TDataSource
    Enabled = False
    Left = 192
    Top = 168
  end
end
