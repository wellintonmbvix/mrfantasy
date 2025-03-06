inherited frmUsuarios: TfrmUsuarios
  Caption = 'Mr Fantasy - Cadastro de Usu'#225'rios'
  ClientHeight = 138
  ClientWidth = 747
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 759
  ExplicitHeight = 176
  TextHeight = 15
  inherited shp1: TShape
    Top = 71
    Width = 747
    ExplicitTop = 72
    ExplicitWidth = 683
  end
  inherited pnlBotoes: TPanel
    Top = 73
    Width = 747
    ExplicitTop = 72
    ExplicitWidth = 743
    inherited sbtnDuplicar: TSpeedButton
      Enabled = False
      Visible = False
    end
    inherited sbtnCancelar: TSpeedButton
      OnClick = sbtnCancelarClick
    end
    inherited sbtnSalvar: TSpeedButton
      OnClick = sbtnSalvarClick
    end
    inherited sbtnDeletar: TSpeedButton
      OnClick = sbtnDeletarClick
    end
    inherited sbtnPesquisar: TSpeedButton
      OnClick = sbtnPesquisarClick
    end
    inherited sbtnSair: TSpeedButton
      Left = 679
      ExplicitLeft = 615
    end
  end
  inherited pnlDados: TPanel
    Width = 747
    Height = 71
    ExplicitWidth = 743
    ExplicitHeight = 70
    object ledt_idusuario: TLabeledEdit
      Left = 19
      Top = 29
      Width = 49
      Height = 24
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object ledt_usuario: TLabeledEdit
      Left = 74
      Top = 29
      Width = 311
      Height = 24
      EditLabel.Width = 100
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome de Usu'#225'rio'
      TabOrder = 1
      Text = ''
    end
    object ledt_senha: TLabeledEdit
      Left = 391
      Top = 29
      Width = 274
      Height = 24
      EditLabel.Width = 102
      EditLabel.Height = 16
      EditLabel.Caption = 'Senha de Acesso'
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
    end
  end
end
