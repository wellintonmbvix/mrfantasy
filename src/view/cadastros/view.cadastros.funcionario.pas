unit view.cadastros.funcionario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.StrUtils,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.JSON,
  System.Net.HttpClient,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,

  dbebr.factory.interfaces,
  dbebr.factory.firedac,
  ormbr.container.objectset,
  ormbr.container.objectset.interfaces,
  ormbr.dml.generator.mysql,
  model.funcionario,

  classe.global,
  view.cadastros.padrao,
  uRotinas,

  Data.DB,

  DataSetUtils,

  REST.Types,
  REST.Client,  

  Firedac.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TfrmFuncionarios = class(TfrmCadPadrao)
    idtbfuncionario: TLabeledEdit;
    nome: TLabeledEdit;
    funcao: TLabeledEdit;
    cpf: TLabeledEdit;
    rg: TLabeledEdit;
    dtadmissao: TLabeledEdit;
    dtdemissao: TLabeledEdit;
    cep: TLabeledEdit;
    endereco: TLabeledEdit;
    nro: TLabeledEdit;
    comp: TLabeledEdit;
    bairro: TLabeledEdit;
    cidade: TLabeledEdit;
    uf: TComboBox;
    Label1: TLabel;
    fone1: TLabeledEdit;
    fone2: TLabeledEdit;
    abreviatura: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dtadmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure dtdemissaoKeyPress(Sender: TObject; var Key: Char);
    procedure fone1KeyPress(Sender: TObject; var Key: Char);
    procedure fone2KeyPress(Sender: TObject; var Key: Char);
    procedure cpfExit(Sender: TObject);
    procedure cpfEnter(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cepExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fdmtb_funcionarios: TFDMemTable;
  public
    { Public declarations }
  end;

const
  _URL_CONSULTA_CEP = 'https://brasilapi.com.br/api/cep/v2/%s';  

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

uses
  view.cadastros.funcionarioPesquisa,
  controller.dto.funcionario.interfaces,
  controller.dto.funcionario.interfaces.impl;

procedure TfrmFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmFuncionarios := Nil;
end;

procedure TfrmFuncionarios.FormCreate(Sender: TObject);
begin
  fdmtb_funcionarios := TFDMemTable.Create(nil);
  inherited;
end;

procedure TfrmFuncionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_funcionarios);
end;

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmFuncionarios.dtadmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  MascaraData(dtadmissao, Key);
end;

procedure TfrmFuncionarios.cepExit(Sender: TObject);
var
  RESTRequest: TRESTRequest;
  RESTClient: TRESTClient;
  RESTResponse: TRESTResponse;
  LJSONObject: TJSONObject;
begin
  RESTResponse := TRESTResponse.Create(nil);
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  Try
    if cep.Text = EmptyStr then
      Exit;

    Self.Cursor := crSQLWait;
    RESTClient.BaseURL := Format(_URL_CONSULTA_CEP, [cep.Text]);
    RESTClient.SecureProtocols := [THTTPSecureProtocol.TLS12];
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.Method := rmGet;
    RESTRequest.Execute;

    if RESTResponse.StatusCode = 200 then
    begin
      LJSONObject := RESTRequest.Response.JSONValue AS TJSONObject;
      endereco.Text := LJSONObject.Values['street'].Value;
      bairro.Text := LJSONObject.Values['neighborhood'].Value;
      cidade.Text := LJSONObject.Values['city'].Value;
      uf.ItemIndex := uf.Items.IndexOf
        (LJSONObject.Values['state'].Value);
    end
    else
      MsgInformacao('Não foi encotrado endereço para o CEP informado.');

  Finally
    Self.Cursor := crDefault;
    RESTRequest.DisposeOf;
    RESTClient.DisposeOf;
    RESTResponse.DisposeOf;
  End;
  inherited;
end;

procedure TfrmFuncionarios.cpfEnter(Sender: TObject);
begin
  inherited;
  cpf.Text := SomenteNumero(' ./-', cpf.Text);
end;

procedure TfrmFuncionarios.cpfExit(Sender: TObject);
begin
  inherited;
  if cpf.Text <> EmptyStr then
  Begin
    if Not ValidaCpfCnpj(cpf.Text) then
    Begin
      MsgErro('CPF inv lido');
      cpf.SetFocus;
    End
    else
    Begin
      cpf.Text := MascaraCpfCnpj(cpf.Text);
    End;
  End;
end;

procedure TfrmFuncionarios.dtdemissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  MascaraData(dtdemissao, Key);
end;

procedure TfrmFuncionarios.fone1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(fone1, Key);
end;

procedure TfrmFuncionarios.fone2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(fone2, Key);
end;

procedure TfrmFuncionarios.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as altera  es?') then
    sbtnNovo.Click;
end;

{$REGION 'Procedures de manipulação de "objetos"'}

procedure TfrmFuncionarios.sbtnAnteriorClick(Sender: TObject);
var
  listaFuncionarios: TObjectList<TFuncionario>;
begin
  Try
    var
    IFuncionario := TIFuncionario.New;
    if operacao = 'incluir' then
      begin
        IFuncionario.Build.GetRecordsNumber('tbfuncionarios','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IFuncionario.Build.ListPaginate('', listaFuncionarios, 'idtbfuncionario',
      1, recordAtual);

    if listaFuncionarios.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios,
        fdmtb_funcionarios);
      Self.Navegacao(fdmtb_funcionarios, 2);
      Self.DataSetToFiels(fdmtb_funcionarios);
      idtbfuncionario.Text := FormatFloat('0000',
        fdmtb_funcionarios.Fields[0].Value);
      operacao := 'alterar';
    end;
    listaFuncionarios.Clear;
    FreeAndNil(listaFuncionarios);
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmFuncionarios.sbtnProximoClick(Sender: TObject);
var
  listaFuncionarios: TObjectList<TFuncionario>;
begin
  Try
    var
    IFuncionario := TIFuncionario.New;
    if operacao = 'incluir' then
      begin
        IFuncionario.Build.GetRecordsNumber('tbfuncionarios','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IFuncionario.Build.ListPaginate('', listaFuncionarios, 'idtbfuncionario',
      1, recordAtual);

    if listaFuncionarios.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios,
        fdmtb_funcionarios);
      Self.Navegacao(fdmtb_funcionarios, 3);
      Self.DataSetToFiels(fdmtb_funcionarios);
      idtbfuncionario.Text := FormatFloat('0000',
        fdmtb_funcionarios.Fields[0].Value);
      operacao := 'alterar';
    end
    else
      recordAtual := recordAtual - 1;
    listaFuncionarios.Clear;
    FreeAndNil(listaFuncionarios);
  Except
    on E: Exception do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmFuncionarios.sbtnDeletarClick(Sender: TObject);
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    var
    IFuncionario := TIFuncionario.New;
    IFuncionario.idtbfuncionario(fdmtb_funcionarios.Fields[0].Value).Build.Delete;
    sbtnNovo.Click;
  Except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  End;
end;

procedure TfrmFuncionarios.sbtnDuplicarClick(Sender: TObject);
var
  nextId: Integer;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  var
  IFuncionario := TIFuncionario.New;
  IFuncionario.Build.GetRecordsNumber('idtbfuncionario', '', nextId);
  idtbfuncionario.Text := FormatFloat('0000', (nextId + 1));
  uf.ItemIndex := 7; // 7-Define ES como estado escolhido
  operacao := 'incluir';
  cpf.Clear;
  rg.Clear;
  nome.SetFocus;
end;

procedure TfrmFuncionarios.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  IFuncionario := TIFuncionario.New;
  IFuncionario.Build.GetRecordsNumber('idtbfuncionarios','',nextId);
  idtbfuncionario.Text := FormatFloat('0000', (nextId + 1));
  uf.ItemIndex := 7; // 7-Define ES como estado escolhido
  nome.SetFocus;
  inherited;
end;

procedure TfrmFuncionarios.sbtnPesquisarClick(Sender: TObject);
var
  listaFuncionarios: TObjectList<TFuncionario>;
begin
  OpenFormModal(TfrmPesquisaFuncionarios, frmPesquisaFuncionarios);
  if TGlobal.entityId > 0 then
  begin
    var
    IFuncionario := TIFuncionario.New;
    IFuncionario.Build.ListAll('idtbfuncionario = ' + TGlobal.entityId.ToString,
      listaFuncionarios, '');
    TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios,
      fdmtb_funcionarios);
    Self.DataSetToFiels(fdmtb_funcionarios);
    listaFuncionarios.Clear;
    FreeAndNil(listaFuncionarios);
    operacao := 'alterar';
    navegando := True;
  end;
  inherited;
end;

procedure TfrmFuncionarios.sbtnSalvarClick(Sender: TObject);
begin
  Try
    var
    IFuncionario := TIFuncionario.New;
    if operacao = 'incluir' then
    begin

      IFuncionario.idtbfuncionario(StrToInt(idtbfuncionario.Text))
        .codigo(StrToInt(idtbfuncionario.Text)).nome(nome.Text)
        .abreviatura(abreviatura.Text).endereco(endereco.Text)
        .nro(nro.Text).Comp(comp.Text).bairro(bairro.Text)
        .cidade(cidade.Text).cep(cep.Text).uf(uf.Text)
        .cpf(cpf.Text).rg(rg.Text).fone1(fone1.Text)
        .fone2(fone2.Text).dtadmissao(dtadmissao.Text)
        .funcao(funcao.Text).dtdemissao(dtdemissao.Text)
        .usercad(TGlobal.userId).useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
      listaFuncionarios: TObjectList<TFuncionario>;

      var
      objFuncionario := IFuncionario.Build.ListById('idtbfuncionario',
        StrToInt(idtbfuncionario.Text), listaFuncionarios).This;
      IFuncionario.Build.Modify(objFuncionario);

      With objFuncionario Do
      Begin
        codigo := StrToInt(Self.idtbfuncionario.Text);
        nome := Self.nome.Text;
        abreviatura := Self.abreviatura.Text;
        endereco := Self.endereco.Text;
        nro := Self.nro.Text;
        comp := Self.comp.Text;
        bairro := Self.bairro.Text;
        cidade := Self.cidade.Text;
        cep := Self.cep.Text;
        uf := Self.uf.Text;
        cpf := Self.cpf.Text;
        rg := Self.rg.Text;
        fone1 := Self.fone1.Text;
        fone2 := Self.fone2.Text;
        dtadmissao := Self.dtadmissao.Text;
        funcao := Self.funcao.Text;
        dtdemissao := Self.dtdemissao.Text;
        useralt := TGlobal.userId;
      End;
      IFuncionario.Build.Update;
      listaFuncionarios.Clear;
      FreeAndNil(listaFuncionarios);
    end;
    sbtnNovo.Click;
  Except
    on E: Exception Do
      MsgErro(E.Message);
  End;
  inherited;
end;

{$ENDREGION}

end.
