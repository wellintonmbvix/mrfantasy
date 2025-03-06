unit view.cadastros.cliente.pesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Math,
  System.Rtti,

  model.cliente,
  view.cadastros.pesquisaPadrao,

  uRotinas,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Buttons,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, 
  Datasnap.DBClient;

type
  TfrmPesquisaClientes = class(TfrmPesquisaPadrao)
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    listCliente: TObjectList<TCliente>;
    procedure PreencheDataSet;
  public
    { Public declarations }
  end;

var
  frmPesquisaClientes: TfrmPesquisaClientes;

implementation

{$R *.dfm}

uses
  controller.dto.cliente.interfaces.impl;

procedure TfrmPesquisaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaClientes := Nil;
  inherited;
end;

procedure TfrmPesquisaClientes.FormCreate(Sender: TObject);
begin
  inherited;
  listCliente := TObjectList<TCliente>.Create;
end;

procedure TfrmPesquisaClientes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(listCliente);
  inherited;
end;

procedure TfrmPesquisaClientes.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    sbtn_search.Click;
  inherited;
end;

procedure TfrmPesquisaClientes.PreencheDataSet;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Proprieadeidtbcliente,
  propertyNome,
  propertyFone1,
  propertyFone2,
  propertyCpf,
  propertyRg,
  propertyNasc,
  propertyEmail : TRttiProperty;
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  // Cria o contexto do RTTI
  Contexto := TRttiContext.Create;
  Try
    // Obt m as informa  es de RTTI da classe TFuncionario
    Tipo := Contexto.GetType(TCliente.ClassInfo);

    // Obt m um objeto referente   propriedade "Nome" da classe TCliente
    Proprieadeidtbcliente := Tipo.GetProperty('idtbcliente');
    propertyNome := Tipo.GetProperty('nome');
    propertyFone1 := Tipo.GetProperty('fone1');
    propertyFone2 := Tipo.GetProperty('fone2');
    propertyCpf := Tipo.GetProperty('cpf_cnpj');
    propertyRg := Tipo.GetProperty('rg_insc');
    propertyNasc := Tipo.GetProperty('dtnascimento');
    propertyEmail := Tipo.GetProperty('email');

    // Percorre a lista de objetos, inserindo o valor da propriedade "Nome" do ClientDataSet
    for Cliente in listCliente do
      begin
        cds_dados.AppendRecord([Proprieadeidtbcliente.GetValue(Cliente).AsInteger]);
        cds_dados.AppendRecord([propertyNome.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyFone1.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyFone2.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyCpf.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyRg.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyNasc.GetValue(Cliente).AsString]);
        cds_dados.AppendRecord([propertyEmail.GetValue(Cliente).AsString]);
      end;

    cds_dados.First;
  Finally
    Cliente.DisposeOf;
    Contexto.Free;
  End;
end;

procedure TfrmPesquisaClientes.sbtn_anteriorClick(Sender: TObject);
var
  filtro, valor: String;
begin
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';

  if cbox_campo.ItemIndex = 2 then
    valor := MascaraCpfCnpj(ledt_valor.Text)
  else
    valor := ledt_valor.Text;

  case cbox_campo.ItemIndex of
    0:
      filtro := 'idtbcliente LIKE ' + QuotedStr(valor + '%');
    1:
      filtro := 'nome LIKE ' + QuotedStr(valor + '%');
    2:
      filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
    3:
      filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
  end;

  Try
    listCliente.Clear;
    TICliente
      .New
        .Build
      .ListPaginate(filtro, listCliente, 'idtbcliente',
        Integer(cbox_registros.Text), currentrg);

    PreencheDataSet;
  Except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  End;

  if currentpg = 1 then
    sbtn_anterior.Enabled := False;
  if Not sbtn_proximo.Enabled then
    sbtn_proximo.Enabled := True;
  inherited;
end;

procedure TfrmPesquisaClientes.sbtn_proximoClick(Sender: TObject);
var
  filtro, valor: String;
begin
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';

  if cbox_campo.ItemIndex = 2 then
    valor := MascaraCpfCnpj(ledt_valor.Text)
  else
    valor := ledt_valor.Text;

  case cbox_campo.ItemIndex of
    0:
      filtro := 'idtbcliente LIKE ' + QuotedStr(valor + '%');
    1:
      filtro := 'nome LIKE ' + QuotedStr(valor + '%');
    2:
      filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
    3:
      filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
  end;

  Try
    listCliente.Clear;
    TICliente
      .New
        .Build
      .ListPaginate(filtro, listCliente, 'idtbcliente',
        Integer(cbox_registros.Text), currentrg);

    PreencheDataSet;

  Except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  End;

  if currentpg >= totalpg then
    sbtn_proximo.Enabled := False;
  if Not sbtn_anterior.Enabled then
    sbtn_anterior.Enabled := True;
  inherited;
end;

procedure TfrmPesquisaClientes.sbtn_searchClick(Sender: TObject);
var
  filtro, valor: String;
begin
  if cbox_campo.ItemIndex = 2 then
    valor := MascaraCpfCnpj(ledt_valor.Text)
  else
    valor := ledt_valor.Text;

  case cbox_campo.ItemIndex of
    0:
      filtro := 'idtbcliente LIKE ' + QuotedStr(valor + '%');
    1:
      filtro := 'nome LIKE ' + QuotedStr(valor + '%');
    2:
      filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
    3:
      filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
  end;

  Try
    listCliente.Clear;
    TICliente
      .New
        .Build
      .ListAll(filtro, listCliente,'');

    totalrg := listCliente.Count;
    totalpg := Ceil(listCliente.Count / StrToInt(cbox_registros.Text));
    currentrg := 0;
    currentpg := 1;
    direcao := 'Proximo';

    ds_dados.Enabled := True;
    sbtn_anterior.Enabled := False;
    sbtn_proximo.Enabled := False;

    listCliente.Clear;
    TICliente
      .New
        .Build
      .ListPaginate(filtro, listCliente, 'idtbcliente',
        Integer(cbox_registros.Text), currentrg);

    if listCliente.Count <= 0 then
      Begin
        MsgInformacao('N o existem dados para exibir');
        Exit;
      End;

    PreencheDataSet;

    if totalrg > StrToInt(cbox_registros.Text) then
      Begin
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := True;
      End;
  Except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  End;
  inherited;
end;

end.
