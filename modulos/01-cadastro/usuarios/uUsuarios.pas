unit uUsuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Mask,

  uControle,
  uCadPadrao,

  uGlobal,
  uClasseUsuarios,
  uRotinas,

  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param;

type
  TfUsuarios = class(TfCadPadrao)
    ledt_idusuario: TLabeledEdit;
    ledt_usuario: TLabeledEdit;
    ledt_senha: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsuarios: TfUsuarios;
  fdqUsuarios: TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaUsuarios;

procedure TfUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fUsuarios := Nil;
end;

procedure TfUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfUsuarios.sbtnAnteriorClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  Try
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);
    With ClasseUsuarios Do
    Begin
      CarregaDados(StrToInt(ledt_idusuario.Text) - 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idusuario.Text := FormatFloat('000', Usuario);
      ledt_usuario.Text := UserName;
      ledt_usuario.Enabled := False;
      ledt_senha.Text := Crypt('D', PassWord);
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfUsuarios.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  sbtnNovo.Click;
end;

procedure TfUsuarios.sbtnDeletarClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  Try
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);
    With ClasseUsuarios Do
    Begin
      Usuario := StrToInt(ledt_idusuario.Text);
      if Not ExcluiUsuarios then
        Exit;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfUsuarios.sbtnDuplicarClick(Sender: TObject);
begin
  inherited;
  // N o habilitarei essa op  o para usu rios
end;

procedure TfUsuarios.sbtnNovoClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  Try
    LimpaCampos;
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);
    ledt_idusuario.Text := FormatFloat('000', ClasseUsuarios.PegarRegistro);
    operacao := 'incluir';
    ledt_usuario.Enabled := True;

    ledt_usuario.SetFocus;
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfUsuarios.sbtnPesquisarClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  sbtnNovo.Click;
  Try
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);
    With ClasseUsuarios Do
    Begin
      nUsuario := 0;
      OpenFormModal(TfPesquisaUsuarios, fPesquisaUsuarios);
      if nUsuario > 0 then
      Begin
        CarregaDados(nUsuario);
        ledt_idusuario.Text := FormatFloat('000', Usuario);
        ledt_usuario.Text := UserName;
        ledt_usuario.Enabled := False;
        ledt_senha.Text := Crypt('D', PassWord);
        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);    
  End;
end;

procedure TfUsuarios.sbtnProximoClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  Try
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);
    With ClasseUsuarios Do
    Begin
      CarregaDados(StrToInt(ledt_idusuario.Text) + 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idusuario.Text := FormatFloat('000', Usuario);
      ledt_usuario.Text := UserName;
      ledt_usuario.Enabled := False;
      ledt_senha.Text := Crypt('D', PassWord);
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfUsuarios.sbtnSalvarClick(Sender: TObject);
var
  Controle      : TControle;
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  Try
    Controle       := TControle.Create;
    ClasseUsuarios := TClasseUsuarios.Create(Controle);

    With ClasseUsuarios Do
    Begin
      Usuario := StrToInt(ledt_idusuario.Text);
      UserName := ledt_usuario.Text;
      PassWord := Crypt('C', ledt_senha.Text);
      UserCad := UserLog;
      UserAlt := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        if ledt_usuario.Text <> EmptyStr then
        Begin
          With Controle.SqlGeral Do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM tbusuarios');
            SQL.Add('WHERE username = :usuario');
            ParamByName('usuario').Value := ledt_usuario.Text;
            Open;
            if Not IsEmpty then
            Begin
              MsgAviso('Nome de Usu rio j  cadastrado');
              Abort;
            End;
          End;
        End;


        if Not InsereUsuarios then
          Exit;
      end
      else
      begin
        if Not AlteraUsuarios then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseUsuarios);
    FreeAndNil(Controle);
  End;
end;

end.
