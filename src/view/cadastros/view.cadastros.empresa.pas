unit view.cadastros.empresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.Net.HttpClient,
  System.Generics.Collections,

  model.empresa,
  view.cadastros.padrao,
  classe.global,

  DataSetUtils,
  uRotinas,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,

  Data.DB,

  REST.Types,
  REST.Client,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEmpresas = class(TfrmCadPadrao)
    idtbempresa: TLabeledEdit;
    razao: TLabeledEdit;
    fantasia: TLabeledEdit;
    endereco: TLabeledEdit;
    nro: TLabeledEdit;
    comp: TLabeledEdit;
    bairro: TLabeledEdit;
    cidade: TLabeledEdit;
    cep: TLabeledEdit;
    uf: TComboBox;
    Label1: TLabel;
    cnpj: TLabeledEdit;
    insc: TLabeledEdit;
    obsaluguel: TMemo;
    Label2: TLabel;
    fone1: TLabeledEdit;
    fone2: TLabeledEdit;
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cnpjEnter(Sender: TObject);
    procedure cnpjExit(Sender: TObject);
    procedure inscEnter(Sender: TObject);
    procedure inscExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure obsaluguelEnter(Sender: TObject);
    procedure obsaluguelExit(Sender: TObject);
    procedure obsaluguelKeyPress(Sender: TObject; var Key: Char);
    procedure fone1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cepExit(Sender: TObject);
  private
    { Private declarations }
    fdmtb_empresas: TFDMemTable;
  public
    { Public declarations }
  end;

const
  _URL_CONSULTA_CEP = 'https://brasilapi.com.br/api/cep/v2/%s';

var
  frmEmpresas: TfrmEmpresas;

implementation

{$R *.dfm}

uses
  view.cadastros.empresaPesquisa,
  controller.dto.empresa.interfaces,
  controller.dto.empresa.interfaces.impl;

procedure TfrmEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEmpresas := Nil;
end;

procedure TfrmEmpresas.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_empresas := TFDMemTable.Create(nil);
end;

procedure TfrmEmpresas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_empresas);
end;

procedure TfrmEmpresas.FormShow(Sender: TObject);
begin
  sbtnNovo.Click;
  inherited;
end;

procedure TfrmEmpresas.cepExit(Sender: TObject);
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

procedure TfrmEmpresas.cnpjEnter(Sender: TObject);
begin
  cnpj.Text := SomenteNumero('./-', cnpj.Text);
  inherited;
end;

procedure TfrmEmpresas.cnpjExit(Sender: TObject);
begin
  // Se campo estiver vazio não faz nada
  if cnpj.Text = EmptyStr then
    Exit;
  if Not ValidaCpfCnpj(cnpj.Text) then
  Begin
    MsgErro('Cnpj inválido');
    cnpj.SetFocus;
    Abort;
  End;
  cnpj.Text := MascaraCpfCnpj(cnpj.Text);
  inherited;
end;

procedure TfrmEmpresas.fone1KeyPress(Sender: TObject; var Key: Char);
begin
  MascaraFone(TLabeledEdit(Sender), Key);
  inherited;
end;

procedure TfrmEmpresas.inscEnter(Sender: TObject);
begin
  insc.Text := SomenteNumero(' .-/', insc.Text);
  inherited;
end;

procedure TfrmEmpresas.inscExit(Sender: TObject);
begin
  if insc.Text = EmptyStr then
    Exit;
  insc.Text := MascaraInscricao(insc.Text, uf.Text);
  inherited;
end;

procedure TfrmEmpresas.obsaluguelEnter(Sender: TObject);
begin
  Self.KeyPreview := False;
  inherited;
end;

procedure TfrmEmpresas.obsaluguelExit(Sender: TObject);
begin
  Self.KeyPreview := True;
  inherited;
end;

procedure TfrmEmpresas.obsaluguelKeyPress(Sender: TObject; var Key: Char);
begin
  if obsaluguel.Lines.Count > 2 then
    obsaluguel.ScrollBars := ssVertical
  else
    obsaluguel.ScrollBars := ssNone;
  inherited;
end;

procedure TfrmEmpresas.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

procedure TfrmEmpresas.sbtnDeletarClick(Sender: TObject);
begin
  //
  inherited;
end;

procedure TfrmEmpresas.sbtnDuplicarClick(Sender: TObject);
begin
  //
  inherited;
end;

{$REGION 'Procedure de manipulação de "objetos"'}

procedure TfrmEmpresas.sbtnAnteriorClick(Sender: TObject);
var
  listaEmpresas: TObjectList<TEmpresa>;
begin
  Try
    var
    IEmpresa := TIEmpresa.New;
    if operacao = 'incluir' then
      begin
        IEmpresa.Build.GetRecordsNumber('tbempresas','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IEmpresa.Build.ListPaginate('', listaEmpresas, 'idtbempresa',
      1, recordAtual);
    if listaEmpresas.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_empresas);
      Self.Navegacao(fdmtb_empresas, 2);
      Self.DataSetToFiels(fdmtb_empresas);
      idtbempresa.Text := FormatFloat('00', fdmtb_empresas.Fields[0].Value);
      operacao := 'alterar';
    end;
    listaEmpresas.Clear;
    FreeAndNil(listaEmpresas);
  Except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  End;
  inherited;
end;

procedure TfrmEmpresas.sbtnProximoClick(Sender: TObject);
var
  listaEmpresas: TObjectList<TEmpresa>;
begin
  Try
    var
    IEmpresa := TIEmpresa.New;
    if operacao = 'incluir' then
      begin
        IEmpresa.Build.GetRecordsNumber('tbempresas','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IEmpresa.Build.ListPaginate('', listaEmpresas, 'idtbempresa',
      1, recordAtual);
    if listaEmpresas.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_empresas);
      Self.Navegacao(fdmtb_empresas, 3);
      Self.DataSetToFiels(fdmtb_empresas);
      idtbempresa.Text := FormatFloat('00', fdmtb_empresas.Fields[0].Value);
      operacao := 'alterar';
    end
    else
      recordAtual := recordAtual - 1;
    listaEmpresas.Clear;
    FreeAndNil(listaEmpresas);
  Except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  End;
  inherited;
end;

procedure TfrmEmpresas.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  IEmpresa := TIEmpresa.New;
  IEmpresa.Build.GetRecordsNumber('tbempresas','',nextId);
  idtbempresa.Text := FormatFloat('00', (nextId + 1));
  uf.ItemIndex := 7; // 7-Define ES como estado escolhido
  razao.SetFocus;
  inherited;
end;

procedure TfrmEmpresas.sbtnPesquisarClick(Sender: TObject);
var
  listaEmpresas: TObjectList<TEmpresa>;
begin
  OpenFormModal(TfrmPesquisaEmpresas, frmPesquisaEmpresas);
  if TGlobal.entityId > 0 then
    begin
      var
      IEmpresa := TIEmpresa.New;
      IEmpresa.Build.ListAll('idtbempresa = ' + TGlobal.entityId.ToString,
        listaEmpresas,'');
      TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_empresas);
      Self.DataSetToFiels(fdmtb_empresas);
      listaEmpresas.Clear;
      FreeAndNil(listaEmpresas);
      operacao := 'alterar';
      navegando := True;
    end;
  inherited;
end;

procedure TfrmEmpresas.sbtnSalvarClick(Sender: TObject);
begin
  Try
    var
      IEmpresa := TIEmpresa.New;
    if operacao = 'incluir' then
    begin
      IEmpresa.razao(razao.Text).fantasia(fantasia.Text)
        .endereco(endereco.Text).nro(nro.Text).comp(comp.Text)
        .bairro(bairro.Text).cidade(cidade.Text).cep(cep.Text)
        .uf(uf.Text).cnpj(cnpj.Text).insc(insc.Text)
        .fone1(fone1.Text).fone2(fone2.Text)
        .obsaluguel(obsaluguel.Text).usercad(TGlobal.userId)
        .useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
      listaEmpresas: TObjectList<TEmpresa>;

      var
      objEmpresa := IEmpresa.Build.ListById('idtbempresa',
        StrToInt(idtbempresa.Text), listaEmpresas).This;
      IEmpresa.Build.Modify(objEmpresa);

      With objEmpresa Do
      Begin
        razao := Self.razao.Text;
        fantasia := Self.fantasia.Text;
        endereco := Self.endereco.Text;
        nro := Self.nro.Text;
        comp := Self.comp.Text;
        bairro := Self.bairro.Text;
        cidade := Self.cidade.Text;
        uf := Self.uf.Text;
        cep := Self.cep.Text;
        cnpj := Self.cnpj.Text;
        insc := Self.insc.Text;
        fone1 := Self.fone1.Text;
        fone2 := Self.fone2.Text;
        obsaluguel := Self.obsaluguel.Text;
        useralt := TGlobal.userId;
      End;
      IEmpresa.Build.Update;
      listaEmpresas.Clear;
      FreeAndNil(listaEmpresas);
    end;

    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

{$ENDREGION}

end.
