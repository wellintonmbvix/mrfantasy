unit view.principal.login;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Mask,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  uRotinas,
  model.usuario,
  classe.global,
  uFrameAnime;
type
  TfrmLogin = class(TForm)
    btn_confirmar: TButton;
    btn_cancelar: TButton;
    ledt_username: TLabeledEdit;
    ledt_password: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  controller.dto.usuario.interfaces.impl;

procedure TfrmLogin.btn_cancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLogin.btn_confirmarClick(Sender: TObject);
var
  listUsuario: TObjectList<Tusuario>;
begin
  // Validando se os campos estão vazios
  if ledt_username.Text = EmptyStr then
  Begin
    MsgErro('Nome de Usuário não preechido');
    ledt_username.SetFocus;
    Abort;
  End;

  if ledt_password.Text = EmptyStr then
  Begin
    MsgErro('Senha de Usuário não preenchido');
    ledt_password.SetFocus;
    Abort;
  End;

  try
    Try
      TIUsuario
        .New
          .Build
            .ListAll('username = '+QuotedStr(ledt_username.Text),listUsuario,'');


      if (listUsuario.Count = 0) Or
        (Crypt('D', listUsuario.Items[0].password) <> ledt_password.Text) then
          begin
            MsgErro('Usuário ou Senha inválidos.');
            Exit;
          end;

      TGlobal.userId := listUsuario.Items[0].idtbusuario;
      TGlobal.userName := listUsuario.Items[0].username;
      TGlobal.userLogado := True;
    Except
      on E: Exception do
        MsgErro(E.Message);
    End;
  finally
    FreeAndNil(listUsuario);
  end;
  Self.Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmLogin := Nil;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
