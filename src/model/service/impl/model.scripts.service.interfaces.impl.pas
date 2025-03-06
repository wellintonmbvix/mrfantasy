unit model.scripts.service.interfaces.impl;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections,

  dbebr.factory.interfaces,
  dbebr.factory.firedac,
  cqlbr.select.mysql,
  cqlbr.serialize.mysql,
  ormbr.criteria.resultset,

  firedac.Comp.Client,
  firedac.Comp.DataSet,
  firedac.UI.Intf,
  firedac.VCLUI.Wait,
  firedac.Comp.UI,

  model.caixa,
  model.scripts.service.interfaces,
  model.resource.interfaces;

type
  TServiceView = class(TInterfacedObject, IServiceView)
  private
    FConnection: IConnection;
    FConnectionORM: IDBConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IServiceView;

    function ViewCaixa(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewProduto(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewCartao(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewCliente(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewFormasPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceView;
  end;

  TServiceScripts = class(TInterfacedObject, IServiceScripts)
  private
    FConnection: IConnection;
    FConnectionORM: IDBConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IServiceScripts;

    function ViewOrdemMaster(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdemDetail(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdemPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdensAlugadas(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewItensAlugados(var aList: TFDMemTable; aFilter: String;
      aOrdemBy: String = ''; Asc: Boolean = True)
      : IServiceScripts;
    function ViewCompCab(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewCompItem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewCompPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdemWithDetail(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewPagtoByOrdem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewDetailByOrdem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
  end;

implementation

{ TIServiceView }

uses
  cqlbr.interfaces,
  criteria.query.language,
  model.resource.impl.factory;

constructor TServiceView.Create;
begin
  FConnection := TResource.New.Connection;
  FConnectionORM := TFactoryFiredac.Create
    (TFDConnection(FConnection.Connect), dnMySQL);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TServiceView.Destroy;
begin
  FreeAndNil(FDGUIxWaitCursor);
  inherited;
end;

function TServiceView.ViewCaixa(aFilter: String; var aList: TFDMemTable;
  aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('lpad(idcaixa,2,''0'')')
        .Column('idtbempresa')
        .Column('dtemissao')
        .Column('operacao')
        .&Case.When('"D"').&Then('"Débito"')
                          .&Else('"Crédito"')
        .&End.&As('operacao')
        .Column('origem')
        .&Case.When('"R"').&Then('"Reserva"')
              .When('"V"').&Then('"Venda"')
                          .&Else('"Digitação"')
        .&End.&As('origem')
        .Column('format(valor,2,''pt_BR'')').&As('Valor')
        .Column('format(saldo,2,''pt_BR'')').&As('saldo')
        .Column('pdv')
        .Column('documento')
        .Column('condicao')
        .Column('tpmov')
        .Column('cancelado')
        .&Case.When('0').&Then('"Não"')
                        .&Else('"Sim"')
        .&End.&As('cancelado')
        .Column('a.usercad')
        .Column('a.dtalterado')
        .Column('username').&As('userAlteracao')
      .From('tbcaixa').&As('a')
      .LeftJoin('tbusuarios').On('a.useralt = idtbusuario')
      .Where(aFilter)
      .OrderBy('idcaixa')
      .Limit(aPageSize)
      .Offset(aPageNext)
    .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceView.ViewCartao(aFilter: String; var aList: TFDMemTable;
  aPageSize, aPageNext: Integer): IServiceView;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL).select.Column('idtbcartao').Column('a.idtbempresa')
    .Column('dtemissao').Column('idcliente').&As('idcliente')
    .Column('idcliente').&Case.When('idcliente > 0').&Then('b.nome')
    .&Else('"CONSUMIDOR FINAL"').&End.&As('cliente').Column('parcela')
    .Column('parcelas').Column('dtvencimento').Column('format(valor,2,"pt_BR")')
    .&As('valor').Column('origem').&Case('origem').When('"A"')
    .&Then('"Aluguel"').When('"V"').&Then('"Venda"').When('"D"')
    .&Then('"Digitação"').&Else('"Desconhecida"').&End.&As('origem')
    .Column('documento').From('tbcartoes').&As('a').LeftJoin('tbclientes')
    .&As('b').On('a.idcliente = b.idtbcliente').Where(aFilter)
    .OrderBy('idtbcartao').Limit(aPageSize).Offset(aPageNext).AsString;

  // Fiz essa gambiarra pois é informado o "idcliente" logo após o CASE
  // antes do 1º WHEN e como é um campo proveniente de um JOIN
  // o resultado não estava sendo adequado por conta desse campo
  LSQL := StringReplace(LSQL, '(CASE idcliente ', '(CASE ',
    [rfReplaceAll, rfIgnoreCase]);

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceView.ViewCliente(aFilter: String; var aList: TFDMemTable;
  aPageSize, aPageNext: Integer): IServiceView;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('idtbempresa')
        .Column('cpf_cnpj')
        .Column('nome')
        .Column('rg_insc')
        .Column('endereco')
        .Column('nro')
        .Column('comp')
        .Column('bairro')
        .Column('cidade')
        .Column('cep')
        .Column('uf')
        .Column('dtnascimento')
        .Column('fone1')
        .Column('fone2')
        .Column('email')
        .Column('obs')
        .Column('a.dtcadastro')
        .Column('b.username').&As('userCadastro')
        .Column('a.dtalterado')
        .Column('c.username').&As('userAlteracao')
      .From('tbclientes').&As('a')
      .LeftJoin('tbusuarios').&As('b').On('a.usercad = b.idtbusuario')
      .LeftJoin('tbusuarios').&As('c').On('a.useralt = c.idtbusuario')
      .Where(aFilter)
      .OrderBy('idtbcliente')
      .Limit(aPageSize)
      .Offset(aPageNext)
    .AsString;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceView.ViewFormasPagto(aFilter: String;
  var aList: TFDMemTable): IServiceView;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('convert(idtbformas_pagto USING UTF8mb3)')
        .&As('idtbformas_pagto')
      .Column('descricao')
      .Column('ativo')
      .&Case.When('1').&Then('"Sim"').&Else('"Não"')
      .&End.&As('ativo')
      .Column('a.dtcadastro')
      .Column('b.username').&As('usercad')
      .Column('a.dtalterado')
      .Column('c.username').&As('useralt')
    .From('tbformas_pagto').&As('a')
    .LeftJoin('tbusuarios').&As('b')
      .On('a.usercad = b.idtbusuario')
    .LeftJoin('tbusuarios').&As('c')
      .On('a.useralt = c.idtbusuario')
    .Where(aFilter)
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceView.ViewProduto(aFilter: String; var aList: TFDMemTable;
  aPageSize, aPageNext: Integer): IServiceView;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('idtbproduto')
      .Column('nome')
      .Column('descricao')
      .Column('format(ifnull(vlrcusto,0),2,"pt_BR")').&As('vlrcusto')
      .Column('format(ifnull(vlrvenda,0),2,"pt_BR")').&As('vlrvenda')
      .Column('format(ifnull(vlraluguel,0),2,"pt_BR")').&As('vlraluguel')
      .Column('tipo').&As('idtipo')
      .Column('tipo')
      .&Case.When('0').&Then('"Fantasia Masculina"').When('1')
                      .&Then('"Fantasia Feminina"').When('2')
                      .&Then('"Fantasia Infantil"').When('3')
                      .&Then('"Mascaras"').When('4')
                      .&Then('"Perucas"').When('5')
                      .&Then('"Acessórios"').&Else('"Mágica e Outros"')
      .&End.&As('tipo')
      .Column('itemvenda').&As('itemvenda')
      .Column('itemvenda')
      .&Case.When('"VE"').&Then('"Venda"').When('"AL"')
                         .&Then('"Aluguel"').&Else('"Ambos"')
      .&End.&As('itemPara')
      .Column('foto')
      .Column('estoque')
      .Column('estoquemin')
      .Column('ativo')
      .&Case.When('1').&Then('"Sim"').&Else('"Não"')
      .&End.&As('ativo')
      .Column('a.dtcadastro')
      .Column('b.username').&As('userCadastro')
      .Column('a.dtalterado')
      .Column('c.username').&As('userAlteracao')
    .From('tbprodutos').&As('a')
    .LeftJoin('tbusuarios').&As('b')
      .On('a.usercad = b.idtbusuario')
    .LeftJoin('tbusuarios').&As('c')
      .On('a.useralt = c.idtbusuario')
    .Where(aFilter)
    .OrderBy('idtbproduto')
    .Limit(aPageSize)
    .Offset(aPageNext)
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

class function TServiceView.New: IServiceView;
begin
  Result := Self.Create;
end;




{ TServiceViesOrdem }

constructor TServiceScripts.Create;
begin
  FConnection := TResource.New.Connection;
  FConnectionORM := TFactoryFiredac.Create
    (TFDConnection(FConnection.Connect), dnMySQL);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TServiceScripts.Destroy;
begin
  FreeAndNil(FDGUIxWaitCursor);
  inherited;
end;

class function TServiceScripts.New: IServiceScripts;
begin
  Result := Self.Create;
end;

function TServiceScripts.ViewCompCab(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('b.nome')
      .&Case.When('char_length(b.nome) > 0')
            .&Then('b.nome').&Else('"CONSUMIDOR FINAL"')
      .&End.&As('cliente')
      .Column('a.dtdocumento')
      .Column('LPAD(a.controle, 5, "0")').&As('controle')
      .Column('a.dtretirada')
      .Column('a.dtdevolucao')
      .Column('c.abreviatura').&As('atendente')
      .Column('b.endereco')
      .Column('b.nro')
      .Column('b.bairro')
      .Column('b.cidade')
      .Column('b.uf')
      .Column('b.fone1')
      .Column('b.fone2')
      .Column('b.cpf_cnpj').&As('cpf')
      .Column('b.rg_insc').&As('rg')
      .Column('b.obs').&As('obs')
      .Column('(select sum(qtde) FROM tbordens_itens d WHERE ' +
        'd.idtbordens_cab = a.idtbordens_cab AND d.cancelado = "N")')
          .&As('pecas')
      .Column('(select sum(totalLiquido) FROM tbordens_itens d WHERE ' +
        'd.idtbordens_cab = a.idtbordens_cab AND d.cancelado = "N")')
          .&As('totalLiquido')
     .Column('a.observacao')
    .From('tbordens_cab').&As('a')
    .LeftJoin('tbclientes').&As('b').On('a.idtbcliente = b.idtbcliente')
    .LeftJoin('tbfuncionarios').&As('c').On('a.idfuncionario = c.idtbfuncionario')
    .Where(aFilter)
  .AsString;

  // Fiz essa gambiarra pois é informado o "b.nome" logo após o CASE
  // antes do 1º WHEN e como é um campo proveniente de um JOIN
  // o resultado não estava sendo adequado por conta desse campo
  LSQL := StringReplace(LSQL, '(CASE b.nome ', '(CASE ',
    [rfReplaceAll, rfIgnoreCase]);

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewCompItem(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('a.item')
      .Column('b.nome').&As('produto')
      .Column('b.tipo')
      .&Case.When('0').&Then('"Fantasia Masculina"')
            .When('1').&Then('"Fantasia Feminina"')
            .When('2').&Then('"Fantasia Infantil"')
            .When('3').&Then('"Mascaras"')
            .When('4').&Then('"Perucas"')
            .When('5').&Then('"Acessórios"')
            .&Else('"Mágica e Outros"')
      .&End.&As('tipo')
      .Column('a.qtde')
      .Column('a.precoTabela')
      .Column('a.percDesconto')
      .Column('a.valorDesconto')
      .Column('a.totalLiquido')
      .Column('a.cancelado')
      .&Case.When('"S"').&Then('"Sim"').&Else('""')
      .&End.&As('cancelado')
      .Column('a.venda')
      .&Case.When('"S"').&Then('"Sim"').&Else('""')
      .&End.&As('venda')
    .From('tbordens_itens').&As('a')
    .LeftJoin('tbprodutos').&As('b').On('a.idtbproduto = b.idtbproduto')
    .Where(aFilter)
    .OrderBy('a.item')
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewCompPagto(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('b.descricao').&As('forma_pagto')
      .Column('a.valor')
    .From('tbordens_pagto').&As('a')
    .InnerJoin('tbformas_pagto').&As('b')
      .On('a.idtbformas_pagto = b.idtbformas_pagto')
    .Where(aFilter)
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewDetailByOrdem(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('convert(a.idtbordens_cab USING utf8mb3)').&As('idtbordens_cab')
      .Column('b.idtbproduto')
      .Column('b.nome').&As('produto')
      .Column('b.tipo')
      .&Case.When('0').&Then('"Fantasia Masculina"')
            .When('1').&Then('"Fantasia Feminina"')
            .When('2').&Then('"Fantasia Infantil"')
            .When('3').&Then('"Mascaras"')
            .When('4').&Then('"Perucas"')
            .When('5').&Then('"Acessórios"')
                      .&Else('"Mágica e Outros"')
      .&End.&As('tipo')
      .Column('date_format(c.dtdocumento,"%d/%m/%Y")').&As('dtdocumento')
      .Column('date_format(c.dtretirada,"%d/%m/%Y")').&As('dtretirada')
      .Column('date_format(c.dtdevolucao,"%d/%m/%Y")').&As('dtdevolucao')
      .Column('lpad(c.controle,5,"0")').&As('controle')
      .Column(',tbclientes.nome cliente')
    .From('tbordens_itens').&As('a')
    .InnerJoin('tbprodutos').&As('b').On('a.idtbproduto = b.idtbproduto')
    .InnerJoin('tbordens_cab').&As('c').On('a.idtbordens_cab = c.idtbordens_cab')
    .InnerJoin('tbclientes').&As('d').On('c.idtbcliente = d.idtbcliente')
    .Where(aFilter)
    .GroupBy('idtbordens_cab').GroupBy('idtbproduto').GroupBy('produto')
    .GroupBy('tipo').GroupBy('dtdocumento').GroupBy('dtretirada')
    .GroupBy('dtdevolucao').GroupBy('controle').GroupBy('cliente')
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewOrdemDetail(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('convert(a.idtbordens_itens USING UTF8mb3)').&As('idtbordens_itens')
      .Column('convert(a.idtbordens_cab USING UTF8mb3)').&As('idtbordens_cab')
      .Column('a.idtbproduto')
      .Column('tbprodutos.nome').&As('produto')
      .Column('a.item')
      .Column('a.qtde')
      .Column('format(a.precoTabela,2, "de_DE")').&As('precoTabela')
      .Column('format(a.valorUnitario,2, "de_DE")').&As('valorUnitario')
      .Column('format(a.percDesconto,2, "de_DE")').&As('percDesconto')
      .Column('format(a.valorDesconto,2, "de_DE")').&As('valorDesconto')
      .Column('format(a.percAcrescimo,2, "de_DE")').&As('percAcrescimo')
      .Column('format(a.valorAcrescimo,2, "de_DE")').&As('valorAcrescimo')
      .Column('format(a.totalBruto, 2, "de_DE")').&As('totalBruto')
      .Column('format(a.totalLiquido, 2, "de_DE")').&As('totalLiquido')
      .Column('venda')
      .&Case.When('"S"').&Then('"Sim"').&Else('""')
      .&End.&As('venda')
      .Column('cancelado')
      .&Case.When('"S"').&Then('"Sim"')
      .&Else('""').&End.&As('cancelado')
      .Column('retirado')
      .&Case.When('"S"').&Then('"Sim"').&Else('""')
      .&End.&As('retirado')
      .Column('devolvido')
      .&Case.When('"S"').&Then('"Sim"').&Else('""')
      .&End.&As('devolvido')
    .From('tbordens_itens').&As('a')
    .LeftJoin('tbordens_cab')
      .On('tbordens_cab.idtbordens_cab = a.idtbordens_cab')
    .LeftJoin('tbprodutos')
      .On('tbprodutos.idtbproduto = a.idtbproduto')
    .Where(aFilter)
    .OrderBy('a.item')
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewOrdemMaster(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('CONVERT(a.idtbordens_cab USING UTF8mb3) ' +
            'idtbordens_cab')
        .Column('a.idtbempresa')
        .Column('a.idfuncionario')
        .Column('a.controle')
        .Column('c.nome').&As('atendente')
        .Column('a.idtbcliente')
        .Column('d.nome cliente')
        .Column('d.cep')
        .Column('d.endereco')
        .Column('d.nro')
        .Column('d.comp')
        .Column('d.bairro')
        .Column('d.cidade')
        .Column('d.uf')
        .Column('d.fone1')
        .Column('d.fone2')
        .Column('a.dtdocumento')
        .Column('a.dtretirada')
        .Column('a.dtdevolucao')
        .Column('a.observacao')
        .Column('b.obsaluguel')
        .Column('a.estado')
        .&Case.When('"A"').&Then('"Aberta"')
              .When('"F"').&Then('"Fechada"')
              .When('"C"').&Then('"Cancelada"')
              .When('"P"').&Then('"Pendente"')
              .When('"D"').&Then('"Devolvida"')
        .&End.&As('estado')
        .Column('a.retirada')
        .&Case.When('"S"').&Then('"Sim"').&Else('""')
        .&End.&As('retirada')
        .Column('a.dtcadastro')
        .Column('a.usercad')
        .Column('e.username usercadNome')
        .Column('a.dtalterado')
        .Column('a.useralt')
        .Column('f.username useraltNome')
      .From('tbordens_cab').&As('a')
      .InnerJoin('tbempresas').&As('b').On('b.idtbempresa = a.idtbempresa')
      .LeftJoin('tbfuncionarios').On('c.idtbfuncionario = a.idfuncionario')
        .&As('c')
      .LeftJoin('tbclientes').&As('d').On('d.idtbcliente = a.idtbcliente')
      .LeftJoin('tbusuarios').&As('e').On('a.usercad = ' +
          'e.idtbusuario')
      .LeftJoin('tbusuarios').&As('f').On('a.useralt = ' +
          'f.idtbusuario')
      .Where(aFilter)
    .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewOrdemPagto(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('convert(a.idtbordens_pagto USING utf8mb3)').&As('idtbordens_pagto')
      .Column('convert(a.idtbordens_cab USING utf8mb3)').&As('idtbordens_cab')
      .Column('convert(a.idtbformas_pagto USING utf8mb3)').&As('idtbformas_pagto')
      .Column('b.descricao').&As('forma_pagto')
      .Column('format(a.valor, 2, "de_DE")').&As('valor')
    .From('tbordens_pagto').&As('a')
    .InnerJoin('tbformas_pagto').&As('b')
      .On('b.idtbformas_pagto = a.idtbformas_pagto')
    .Where(aFilter)
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if LResultSet.RecordCount > 0 then
    begin
      if aList.Active then
        aList.EmptyDataSet;

      aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
    end;
end;

function TServiceScripts.ViewOrdemWithDetail(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('CONVERT(tboc.idtbordens_cab USING utf8mb3)')
          .&As('idtbordens_cab')
        .Column('LPAD(tboc.controle, 5, "0")').&As('controle')
        .Column('tboc.dtdocumento')
        .Column('tboc.dtretirada')
        .Column('tboc.dtdevolucao')
        .Column('tbfu.nome').&As('atendente')
        .Column('ifnull(tbcli.nome,"CONSUMIDOR FINAL")').&As('cliente')
        .Column('tboc.estado')
        .&Case.When('tboc.estado = "A"').&Then('"Aberta"')
              .When('tboc.estado = "D"').&Then('"Devolvida"')
              .When('tboc.estado = "F"').&Then('"Finalizada"')
              .When('tboc.estado = "C"').&Then('"Cancelada"')
        .&End.&As('estado')
        .Column('(SELECT SUM(tboi.qtde) FROM tbordens_itens tboi WHERE ' +
          'tboc.idtbordens_cab = tboi.idtbordens_cab AND ' +
            'tboi.cancelado IS NULL)').&As('qtdeTotal')
        .Column('(SELECT SUM(tboi.totalLiquido) FROM tbordens_itens tboi ' +
          'WHERE tboc.idtbordens_cab = tboi.idtbordens_cab AND ' +
            'tboi.cancelado IS NULL)').&As('totalOrdem')
        .Column('select_formapagto(tboc.idtbordens_cab)').&As('forma_pagto')
        .Column('tboi.item')
        .Column('tbpr.nome').&As('produto')
        .Column('tbpr.tipo')
        .&Case.When('0').&Then('"Fantasia Masculina"')
              .When('1').&Then('"Fantasia Feminina"')
              .When('2').&Then('"Fantasia Infantil"')
              .When('3').&Then('"Mascaras"')
              .When('4').&Then('"Perucas"')
              .When('5').&Then('"Acessórios"').&Else('"Mágica e Outros"')
        .&End.&As('tipo')
        .Column('tboi.qtde')
        .Column('tboi.valorUnitario')
        .Column('tboi.percDesconto')
        .Column('tboi.valorDesconto')
        .Column('tboi.totalLiquido')
        .Column('tboi.cancelado')
        .&Case.When('tboi.cancelado = "S"').&Then('"S"').&Else('""')
        .&End.&As('cancelado')
        .Column('tboi.cancelado')
        .&Case.When('tboi.venda = "S"').&Then('"S"').&Else('""')
        .&End.&As('venda')
      .From('tbordens_cab').&As('tboc')
      .InnerJoin('tbfuncionarios').&As('tbfu')
        .On('tboc.idfuncionario = tbfu.idtbfuncionario')
      .InnerJoin('tbordens_itens').&As('tboi')
        .On('tboc.idtbordens_cab = tboi.idtbordens_cab')
      .InnerJoin('tbprodutos').&As('tbpr')
        .On('tboi.idtbproduto = tbpr.idtbproduto')
      .LeftJoin('tbclientes').&As('tbcli')
        .On('tboc.idtbcliente = tbcli.idtbcliente')
      .Where(aFilter)
      .GroupBy('tboc.idtbordens_cab').GroupBy('tboc.controle')
      .GroupBy('tboc.dtdocumento').GroupBy('tboc.dtretirada')
      .GroupBy('tboc.dtdevolucao').GroupBy('atendente')
      .GroupBy('cliente').GroupBy('tboc.estado').GroupBy('qtdeTotal')
      .GroupBy('totalOrdem').GroupBy('forma_pagto').GroupBy('item')
      .GroupBy('produto').GroupBy('tbpr.tipo').GroupBy('qtde')
      .GroupBy('valorUnitario').GroupBy('percDesconto').GroupBy('valorDesconto')
      .GroupBy('totalLiquido').GroupBy('tboi.venda').GroupBy('tboi.cancelado')
      .OrderBy('tboc.dtdocumento').OrderBy('tboc.controle')//.OrderBy('controle')
    .AsString;

  LSQL := StringReplace(LSQL, '(CASE tboc.estado ', '(CASE ',
    [rfReplaceAll, rfIgnoreCase]);

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewOrdensAlugadas(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('convert(a.idtbordens_cab USING utf8mb3)').&As('idtbordens_cab')
        .Column('a.idtbempresa')
        .Column('a.idfuncionario')
        .Column('LPAD(a.controle, 6, "0") controle')
        .Column('c.nome').&As('atendente')
        .Column('a.idtbcliente').&As('idtbcliente')
        .Column('a.idtbcliente')
        .&Case.When('a.idtbcliente <> 999999').&Then('d.nome')
                                              .&Else('"CONSUMIDOR FINAL"')
        .&End.&As('cliente')
        .Column('a.dtdocumento')
        .Column('a.dtretirada')
        .Column('a.dtdevolucao')
        .Column('a.estado')
        .&Case.When('"A"').&Then('"Aberta"')
              .When('"F"').&Then('"Fechada"')
              .When('"C"').&Then('"Cancelada"')
              .When('"D"').&Then('"Devolvida"')
        .&End.&As('estado')
        .Column('a.retirada')
        .&Case.When('"S"').&Then('"Sim"')
                          .&Else('""')
        .&End.&As('retirada')
        .Column('(SELECT IFNULL(SUM(tbi.qtde),0) FROM tbordens_itens tbi ' +
          'WHERE tbi.idtbordens_cab = a.idtbordens_cab AND ' +
            'tbi.cancelado IS NULL)').&As('pecas')
        .Column('(SELECT FORMAT(IFNULL(SUM(tbi.totalLiquido),0),2,"pt_BR") ' +
          'FROM tbordens_itens tbi WHERE tbi.idtbordens_cab = ' +
            'a.idtbordens_cab AND tbi.cancelado IS NULL)').&As('totalLiquido')
        .Column('a.observacao')
        .Column('a.dtcadastro')
        .Column('a.usercad')
        .Column('e.username usercadNome')
        .Column('a.dtalterado')
        .Column('a.useralt')
        .Column('e.username useraltNome')
      .From('tbordens_cab').&As('a')
      .InnerJoin('tbempresas').On('b.idtbempresa = a.idtbempresa').&As('b')
      .InnerJoin('tbfuncionarios').On('c.idtbfuncionario = a.idfuncionario').&As('c')
      .InnerJoin('tbclientes').On('d.idtbcliente = a.idtbcliente').&As('d')
      .InnerJoin('tbusuarios').On('e.idtbusuario = a.usercad').&As('e')
      .Where(aFilter)
      .OrderBy('a.dtdocumento,a.controle,a.dtretirada')
   .AsString;

  LSQL := StringReplace(LSQL, '(CASE a.idtbcliente ', '(CASE ',
    [rfReplaceAll, rfIgnoreCase]);

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewPagtoByOrdem(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  LSQL := TCQL.New(dbnMySQL)
      .Select
        .Column('b.dtdocumento')
        .Column('lpad(b.controle,5,"0")').&As('controle')
        .Column('c.descricao').&As('condicao')
        .Column('sum(a.valor)').&As('valor')
        .Column('b.estado')
      .From('tbordens_pagto').&As('a')
      .LeftJoin('tbordens_cab').&As('b')
        .On('b.idtbordens_cab = a.idtbordens_cab')
      .LeftJoin('tbformas_pagto').&As('c')
        .On('c.idtbordens_cab = a.idtbordens_cab')
      .Where(aFilter)
      .GroupBy('dtdocumento').GroupBy('controle').GroupBy('condicao')
        .GroupBy('estado')
      .OrderBy('dtdocumento').OrderBy('controle')
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.ViewItensAlugados(var aList: TFDMemTable; aFilter:
String; aOrdemBy: String = ''; Asc: Boolean = True): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;

  if not aOrdemBy.Trim().IsEmpty then
    aOrdemBy := IfThen(Asc, aOrdemBy, aOrdemBy + ' DESC ');

  LSQL := TCQL.New(dbnMySQL)
    .Select
      .Column('convert(a.idtbordens_itens USING utf8mb3)').&As('idtbordens_itens')
      .Column('convert(a.idtbordens_cab USING utf8mb3)').&As('idtbordens_cab')
      .Column('tbprodutos.nome produto')
      .Column('b.dtdocumento')
      .Column('b.dtretirada')
      .Column('b.dtdevolucao')
      .Column('lpad(b.controle, 6, "0")').&As('controle')
      .Column('d.nome').&As('cliente')
      .Column('a.retiradao')
      .&Case.When('"S"').&Then('"Sim"')
                        .&Else('"Não"')
      .&End.&As('retirado')
    .From('tbordens_itens').&As('a')
    .InnerJoin('tbordens_cab').On('a.idtbordens_cab = b.idtbordens_cab').&As('b')
    .InnerJoin('tbprodutos').On('a.idtbproduto = c.idtbproduto').&As('c')
    .InnerJoin('tbclientes').On('b.idtbcliente = d.idtbcliente').&As('d')
    .Where(aFilter)
    .OrderBy(aOrdemBy)
  .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

end.
