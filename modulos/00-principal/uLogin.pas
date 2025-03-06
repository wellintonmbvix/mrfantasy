unit uLogin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Mask,

  System.SysUtils,
  System.Variants,
  System.Classes,

  uRotinas,
  uGlobal,
  uControle,

  Data.Db,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,

  uFrameAnime;

type
  TfLogin = class(TForm)
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
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfLogin.btn_cancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfLogin.btn_confirmarClick(Sender: TObject);
var
  vControle : TControle;
  vQry : TFDQuery;
begin

  // Validando se os campso estão vazios
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

  Try
    vControle       := TControle.Create;
    vQry            := TFDQuery.Create(Self);
    vQry.Connection := vControle.Conexao.GetConexao;
    Try
      With vQry Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM tbusuarios');
        SQL.Add('WHERE username = :usuario');
        ParamByName('usuario').Value := ledt_username.Text;
        Open;
        if IsEmpty then
        Begin
          MsgErro('Usuário não encontrado');
          Abort;
        End
        Else
        Begin
          if Crypt('D', FieldByName('password').AsString) <> ledt_password.Text
          then
          Begin
            MsgErro('Senha inválida');
            Abort;
          End;
        End;

        UserLog := FieldByName('idtbusuario').Value;
        NameUser := FieldByName('username').AsString;
        Logado := True;

        // Setando Nome da Empresa
        Close;
        SQL.Clear;
        SQL.Add('SELECT fantasia FROM tbempresas');
        SQL.Add('WHERE idtbempresa = :empresa');
        ParamByName('empresa').Value := EmpLog;
        Open;

        fPrincipal.stbarr_info.Panels[1].Text := 'Empresa: ' +
          FieldByName('fantasia').AsString;

        Self.Close;
      End;
    Except
      On E: Exception Do
      Begin
        MsgErro('Falha de autenticação' + #13 + E.Message);
      End;
    End;
  Finally
    FreeAndNil(vQry);
    FreeAndNil(vControle);
  End;
end;

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fLogin := Nil;
end;

procedure TfLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
