inherited fUsuarios: TfUsuarios
  Caption = 'Mr Fantasy - Cadastro de Usu'#225'rios'
  ClientHeight = 139
  ClientWidth = 683
  OnClose = FormClose
  ExplicitWidth = 695
  ExplicitHeight = 177
  TextHeight = 15
  inherited shp1: TShape
    Top = 72
    Width = 683
    ExplicitTop = 72
    ExplicitWidth = 683
  end
  inherited pnlBotoes: TPanel
    Top = 74
    Width = 683
    ExplicitTop = 73
    ExplicitWidth = 679
    inherited sbtnNovo: TSpeedButton
      OnClick = sbtnNovoClick
    end
    inherited sbtnDuplicar: TSpeedButton
      Visible = False
      OnClick = sbtnDuplicarClick
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
    inherited sbtnAnterior: TSpeedButton
      OnClick = sbtnAnteriorClick
    end
    inherited sbtnProximo: TSpeedButton
      OnClick = sbtnProximoClick
    end
    inherited sbtnSair: TSpeedButton
      Left = 615
      ExplicitLeft = 615
    end
  end
  inherited pnlDados: TPanel
    Width = 683
    Height = 72
    ExplicitWidth = 679
    ExplicitHeight = 71
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
