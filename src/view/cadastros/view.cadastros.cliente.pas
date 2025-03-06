unit view.cadastros.cliente;

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
  model.cliente,

  uRotinas,
  classe.global,

  REST.Types,
  REST.Client,

  DataSetUtils,

  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.DB,

  firedac.Stan.Intf,
  firedac.Stan.Option,
  firedac.Stan.Param,
  firedac.Stan.Error,
  firedac.DatS,
  firedac.Phys.Intf,
  firedac.DApt.Intf,
  firedac.Comp.DataSet,
  firedac.Comp.Client,

  view.cadastros.padrao;

type
  TfrmClientes = class(TfrmCadPadrao)
    idtbcliente: TLabeledEdit;
    nome: TLabeledEdit;
    cpf_cnpj: TLabeledEdit;
    rg_insc: TLabeledEdit;
    cep: TLabeledEdit;
    endereco: TLabeledEdit;
    nro: TLabeledEdit;
    comp: TLabeledEdit;
    bairro: TLabeledEdit;
    cidade: TLabeledEdit;
    uf: TComboBox;
    Label1: TLabel;
    nascimento: TLabeledEdit;
    fone1: TLabeledEdit;
    fone2: TLabeledEdit;
    email: TLabeledEdit;
    pgc_obshist: TPageControl;
    tbs_observacao: TTabSheet;
    tbs_historico: TTabSheet;
    obs: TMemo;
    dshistorico: TDataSource;
    fdmtb_historico: TFDMemTable;
    fdmtb_historicodtretirada: TDateField;
    fdmtb_historicodtdevolucao: TDateField;
    fdmtb_historicoproduto: TWideStringField;
    fdmtb_historicoqtde: TFMTBCDField;
    fdmtb_historicototalLiquido: TFMTBCDField;
    dbgHistorico: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure cpf_cnpjEnter(Sender: TObject);
    procedure cpf_cnpjExit(Sender: TObject);
    procedure nascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure cepExit(Sender: TObject);
    procedure emailExit(Sender: TObject);
    procedure obsEnter(Sender: TObject);
    procedure obsExit(Sender: TObject);
    procedure fone1KeyPress(Sender: TObject; var Key: Char);
    procedure fone2KeyPress(Sender: TObject; var Key: Char);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure idtbclienteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fdmtb_clientes: TFDMemTable;
    procedure LerHistorico(iCodigo: Integer; FDMemTable: TFDMemTable);
  public
    { Public declarations }
  end;

const
  _URL_CONSULTA_CEP = 'https://brasilapi.com.br/api/cep/v2/%s';

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses
  view.cadastros.clientePesquisa,
  controller.dto.cliente.interfaces,
  controller.dto.cliente.interfaces.impl;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClientes := Nil;
  inherited;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_clientes := TFDMemTable.Create(nil);
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_clientes);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  sbtnNovo.Click;
  inherited;
end;

procedure TfrmClientes.cepExit(Sender: TObject);
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
    FreeAndNil(RESTRequest);
    FreeAndNil(RESTClient);
    FreeAndNil(RESTResponse);
  End;
  inherited;
end;

procedure TfrmClientes.cpf_cnpjEnter(Sender: TObject);
begin
  cpf_cnpj.Text := SomenteNumero(' ./-', cpf_cnpj.Text);
  inherited;
end;

procedure TfrmClientes.emailExit(Sender: TObject);
begin
  if email.Text <> EmptyStr then
  begin
    if not ValidateEmail(email.Text) then
    begin
      MsgErro('Email inválido');
      email.SetFocus;
      Abort;
    end;
  end;
  inherited;
end;

procedure TfrmClientes.fone1KeyPress(Sender: TObject; var Key: Char);
begin
  MascaraFone(fone1, Key);
  inherited;
end;

procedure TfrmClientes.fone2KeyPress(Sender: TObject; var Key: Char);
begin
  MascaraFone(fone2, Key);
  inherited;
end;

procedure TfrmClientes.idtbclienteChange(Sender: TObject);
begin
  if idtbcliente.Text <> EmptyStr then
    LerHistorico(StrToInt(idtbcliente.Text), fdmtb_historico);
  inherited;
end;

procedure TfrmClientes.nascimentoKeyPress(Sender: TObject; var Key: Char);
begin
  MascaraData(nascimento, Key);
  inherited;
end;

procedure TfrmClientes.LerHistorico(iCodigo: Integer; FDMemTable: TFDMemTable);
begin
  //
end;

procedure TfrmClientes.obsEnter(Sender: TObject);
begin
  Self.KeyPreview := False;
  inherited;
end;

procedure TfrmClientes.obsExit(Sender: TObject);
begin
  Self.KeyPreview := True;
  inherited;
end;

procedure TfrmClientes.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

{$REGION 'Procedures de manipulação com "objetos"'}

procedure TfrmClientes.sbtnAnteriorClick(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  Try
    var
    ICliente := TICliente.New;
    if operacao = 'incluir' then
      begin
        ICliente.Build.GetRecordsNumber('tbclientes', '', recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      if recordAtual > 0 then
        recordAtual := recordAtual - 1;

    ICliente.Build.ListPaginate('', listaClientes, 'idtbcliente',
      1, recordAtual);
    if listaClientes.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TCliente>(listaClientes, fdmtb_clientes);
      Self.Navegacao(fdmtb_clientes, 2);
      Self.DataSetToFiels(fdmtb_clientes);
      cpf_cnpj.Enabled := False;
      operacao := 'alterar';
    end;
    listaClientes.Clear;
    FreeAndNil(listaClientes);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmClientes.sbtnProximoClick(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  Try
    var
    ICliente := TICliente.New;
    if operacao = 'incluir' then
      begin
        ICliente.Build.GetRecordsNumber('tbclientes', '', recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    ICliente.Build.ListPaginate('', listaClientes, 'idtbcliente',
      1, recordAtual);
    if listaClientes.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TCliente>(listaClientes, fdmtb_clientes);
      Self.Navegacao(fdmtb_clientes, 3);
      Self.DataSetToFiels(fdmtb_clientes);
      cpf_cnpj.Enabled := False;
      operacao := 'alterar';
    end
    else
      recordAtual := recordAtual - 1;
    listaClientes.Clear;
    FreeAndNil(listaClientes);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmClientes.cpf_cnpjExit(Sender: TObject);
var
  listCliente: TObjectList<TCliente>;
begin
  if cpf_cnpj.Text <> EmptyStr then
  begin
    if Not ValidaCpfCnpj(cpf_cnpj.Text) then
    begin
      MsgErro('CPF inválido');
      cpf_cnpj.SetFocus;
    end
    else
    begin
      cpf_cnpj.Text := MascaraCpfCnpj(cpf_cnpj.Text);
      var
      ICliente := TICliente.New;
      ICliente.Build.ListAll('cpf_cnpj = ' + QuotedStr(cpf_cnpj.Text),
        listCliente, '');
      if listCliente.Count > 0 then
      begin
        MsgAviso('CPF já informado no cliente:' + #13 + FormatFloat('0000000',
          listCliente.Items[0].idtbcliente) + ' ' + listCliente.Items[0].nome);
          listCliente.Clear;
          FreeAndNil(listCliente);
        cpf_cnpj.SetFocus;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmClientes.sbtnDuplicarClick(Sender: TObject);
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
  ICliente := TICliente.New;
  ICliente.Build.GetLastId('tbclientes', '', 'idtbcliente', nextId);
  idtbcliente.Text := FormatFloat('000000', (nextId + 1));
  uf.ItemIndex := 7; // 7-Define ES como estado escolhido
  operacao := 'incluir';
  cpf_cnpj.Clear;
  rg_insc.Clear;
  nome.SetFocus;
end;

procedure TfrmClientes.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  ICliente := TICliente.New;
  ICliente.Build.GetRecordsNumber('tbclientes','', nextId);
  idtbcliente.Text := FormatFloat('000000', (nextId + 1));
  uf.ItemIndex := 7; // 7-Define ES como estado escolhido
  cpf_cnpj.Enabled := True;
  pgc_obshist.TabIndex := 0;
  nome.SetFocus;
  inherited;
end;

procedure TfrmClientes.sbtnSalvarClick(Sender: TObject);
begin
  Try
    var
    ICliente := TICliente.New;
    if operacao = 'incluir' then
    begin
      ICliente.idtbempresa(TGlobal.empresa).cpf_cnpj(cpf_cnpj.Text)
        .nome(nome.Text).rg_insc(rg_insc.Text).endereco(endereco.Text)
        .nro(nro.Text).Comp(comp.Text).bairro(bairro.Text)
        .cidade(cidade.Text).uf(uf.Text).cep(cep.Text)
        .dtnascimento(nascimento.Text).fone1(fone1.Text)
        .fone2(fone2.Text).email(email.Text).obs(obs.Text)
        .usercad(TGlobal.userId).useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
      listCustomer: TObjectList<TCliente>;

      var
      objCliente := ICliente.Build.ListById('idtbcliente',
        StrToInt(idtbcliente.Text), listCustomer).This;
      ICliente.Build.Modify(objCliente);

      With objCliente Do
      Begin
        idtbempresa := TGlobal.empresa;
        cpf_cnpj := Self.cpf_cnpj.Text;
        nome := Self.nome.Text;
        rg_insc := Self.rg_insc.Text;
        endereco := Self.endereco.Text;
        nro := Self.nro.Text;
        comp := Self.comp.Text;
        bairro := Self.bairro.Text;
        cidade := Self.cidade.Text;
        uf := Self.uf.Text;
        cep := Self.cep.Text;
        dtnascimento := Self.nascimento.Text;
        fone1 := Self.  fone1.Text;
        fone2 := Self.fone2.Text;
        email := Self.email.Text;
        obs := Self.obs.Text;
        useralt := TGlobal.userId;
      End;
      ICliente.Build.Update;
      listCustomer.Clear;
      FreeAndNil(listCustomer);
    end;
    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmClientes.sbtnPesquisarClick(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
    Begin
      var
      ICliente := TICliente.New;
      ICliente.Build.ListAll('idtbcliente = ' + TGlobal.entityId.ToString,
       listaClientes,'');
      TDataSetHelper.PreencheDataSet<TCliente>(listaClientes, fdmtb_clientes);
      Self.DataSetToFiels(fdmtb_clientes);
      listaClientes.Clear;
      FreeAndNil(listaClientes);
      cpf_cnpj.Enabled := False;
      operacao := 'alterar';
      navegando := True;
    End;
  inherited;
end;

procedure TfrmClientes.sbtnDeletarClick(Sender: TObject);
var
  lCliente: ICliente;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    lCliente := TICliente.New;
    lCliente.idtbcliente(fdmtb_clientes.Fields[0].Value)
      .Build.Delete;
    sbtnNovo.Click;
  Except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  End;
end;

{$ENDREGION}

end.
