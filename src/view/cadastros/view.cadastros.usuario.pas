unit view.cadastros.usuario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  classe.global,
  model.usuario,
  view.cadastros.padrao,
  uRotinas,

  DataSetUtils,

  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,

  Firedac.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,

  Data.DB;

type
  TfrmUsuarios = class(TfrmCadPadrao)
    ledt_idusuario: TLabeledEdit;
    ledt_usuario: TLabeledEdit;
    ledt_senha: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fdmtb_usuarios: TFDMemTable;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses
  view.cadastros.usuarioPesquisa,
  controller.dto.usuario.interfaces,
  controller.dto.usuario.interfaces.impl;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmUsuarios := Nil;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_usuarios := TFDMemTable.Create(nil);
end;

procedure TfrmUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_usuarios);
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmUsuarios.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

{$REGION 'Procedures de manipulação de "objetos"'}

procedure TfrmUsuarios.sbtnAnteriorClick(Sender: TObject);
var
  listaUsuarios: TObjectList<TUsuario>;
begin
  Try
    var
    IUsuario := TIUsuario.New;
    if operacao = 'incluir' then
      begin
        IUsuario.Build.GetRecordsNumber('tbusuarios','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      if recordAtual > 0 then
        recordAtual := recordAtual - 1;

    IUsuario.Build.ListPaginate('', listaUsuarios, 'idtbusuario',
      1, recordAtual);

    if listaUsuarios.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TUsuario>(listaUsuarios, fdmtb_usuarios);
      Self.Navegacao(fdmtb_usuarios, 2);

  //     Self.DataSetToFiels(fdmtb_usuarios);
  // *** Não aplicarei a função "DataSetToFields" pois são poucos campos
  // *** e ter a criptografia da senha.

      ledt_idusuario.Text := FormatFloat('000', fdmtb_usuarios.Fields[0].Value);
      ledt_usuario.Text := fdmtb_usuarios.Fields[1].AsString;
      ledt_senha.Text := Crypt('D', fdmtb_usuarios.Fields[2].AsString);
      ledt_usuario.Enabled := False;
      operacao := 'alterar';
    end;
    listaUsuarios.Clear;
    FreeAndNil(listaUsuarios);
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmUsuarios.sbtnProximoClick(Sender: TObject);
var
  listaUsuarios: TObjectList<TUsuario>;
begin
  Try
    var
    IUsuario := TIUsuario.New;
    if operacao = 'incluir' then
      begin
        IUsuario.Build.GetRecordsNumber('tbusuarios','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IUsuario.Build.ListPaginate('', listaUsuarios, 'idtbusuario',
      1, recordAtual);

    if listaUsuarios.Count > 0 then
    begin
      Self.Navegacao(fdmtb_usuarios, 3);

  //     Self.DataSetToFiels(fdmtb_usuarios);
  // *** Não aplicarei a função "DataSetToFields" pois são poucos campos
  // *** e por ter a criptografia da senha.

      ledt_idusuario.Text := FormatFloat('000', fdmtb_usuarios.Fields[0].Value);
      ledt_usuario.Text := fdmtb_usuarios.Fields[1].AsString;
      ledt_senha.Text := Crypt('D', fdmtb_usuarios.Fields[2].AsString);
      ledt_usuario.Enabled := False;
      operacao := 'alterar';
    end
    else
      recordAtual := recordAtual - 1;
    listaUsuarios.Clear;
    FreeAndNil(listaUsuarios);
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmUsuarios.sbtnDeletarClick(Sender: TObject);
begin
  inherited;
  if operacao <> 'alterar' then
    Exit;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Exit;

  Try
    var
    IUsuario := TIUsuario.New;
    IUsuario.idtbusuario(fdmtb_usuarios.Fields[0].Value)
      .Build.Delete;
    sbtnNovo.Click;
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
end;

procedure TfrmUsuarios.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  IUsuario := TIUsuario.New;
  IUsuario.Build.GetRecordsNumber('tbusuarios','',nextId);
  ledt_idusuario.Text := FormatFloat('000', (nextId + 1));
  ledt_usuario.Enabled := True;
  ledt_usuario.SetFocus;
  inherited;
end;

procedure TfrmUsuarios.sbtnPesquisarClick(Sender: TObject);
var
  listaUsuarios: TObjectList<TUsuario>;
begin
  inherited;
  OpenFormModal(TfrmPesquisaUsuarios, frmPesquisaUsuarios);
  if TGlobal.entityId > 0 then
  Begin
    var
    IUsuario := TIUsuario.New;
    IUsuario.Build.ListAll('idtbusuario = ' + TGlobal.entityId.ToString,
      listaUsuarios, '');
    TDataSetHelper.PreencheDataSet<TUsuario>(listaUsuarios,fdmtb_usuarios);
    Self.DataSetToFiels(fdmtb_usuarios);
    listaUsuarios.Clear;
    FreeAndNil(listaUsuarios);
    operacao := 'alterar';
    navegando := True;
  End;
end;

procedure TfrmUsuarios.sbtnSalvarClick(Sender: TObject);
begin
  inherited;
  Try
    if ledt_senha.Text = EmptyStr then
    begin
      MsgErro('Senha não pode ficar em branco');
      Exit;
    end;

    var
    IUsuario := TIUsuario.New;
    if operacao = 'incluir' then
    begin
      IUsuario.username(ledt_usuario.Text)
        .password(Crypt('C', ledt_senha.Text)).usercad(TGlobal.userId)
        .useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
      listaUsuarios: TObjectList<TUsuario>;

      var
      objUsuario := IUsuario.Build.ListById('idtbusuario',
        StrToInt(ledt_idusuario.Text), listaUsuarios).This;
      IUsuario.Build.Modify(objUsuario);

      With objUsuario Do
      Begin
        username := ledt_usuario.Text;
        password := Crypt('C', ledt_senha.Text);
        useralt := TGlobal.userId;
      End;
      IUsuario.Build.Update;
      listaUsuarios.Clear;
      FreeAndNil(listaUsuarios);
    end;
    MsgAviso('Informações salvas com sucesso!');
    sbtnNovo.Click;
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
end;

{$ENDREGION}

end.
