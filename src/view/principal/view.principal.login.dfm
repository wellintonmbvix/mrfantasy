object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mr Fantasy - Tela de Login'
  ClientHeight = 170
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  TextHeight = 21
  object btn_confirmar: TButton
    Left = 8
    Top = 130
    Width = 113
    Height = 34
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btn_confirmarClick
  end
  object btn_cancelar: TButton
    Left = 177
    Top = 129
    Width = 113
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object ledt_username: TLabeledEdit
    Left = 24
    Top = 29
    Width = 257
    Height = 29
    EditLabel.Width = 54
    EditLabel.Height = 21
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 0
    Text = ''
  end
  object ledt_password: TLabeledEdit
    Left = 24
    Top = 94
    Width = 257
    Height = 29
    EditLabel.Width = 43
    EditLabel.Height = 21
    EditLabel.Caption = 'Senha'
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
end
