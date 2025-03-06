unit controller.dto.ordem.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.ordem.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.ordemCab,
  model.ordemItem,
  model.ordemPagto;

type
  TIOrdemCab = class(TInterfacedObject, IOrdemCab)
  private
    FEntity: TOrdemCab;
    FService: IService<TOrdemCab>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IOrdemCab;

    function idtbordens_cab(Value: String): IOrdemCab; overload;
    function idtbordens_cab: String; overload;

    function idtbempresa(Value: Integer): IOrdemCab; overload;
    function idtbempresa: Integer; overload;

    function idfuncionario(Value: Integer): IOrdemCab; overload;
    function idfuncionario: Integer; overload;

    function idtbcliente(Value: Integer): IOrdemCab; overload;
    function idtbcliente: Integer; overload;

    function cliente(Value: String): IOrdemCab; overload;
    function cliente: String; overload;

    function controle(Value: Integer): IOrdemCab; overload;
    function controle: Integer; overload;

    function dtdocumento(Value: TDateTime): IOrdemCab; overload;
    function dtdocumento: TDateTime; overload;

    function dtretirada(Value: TDateTime): IOrdemCab; overload;
    function dtretirada: TDateTime; overload;

    function dtdevolucao(Value: TDateTime): IOrdemCab; overload;
    function dtdevolucao: TDateTime; overload;

    function observacao(Value: String): IOrdemCab; overload;
    function obervacao: String; overload;

    function estado(Value: TEnumEstado): IOrdemCab; overload;
    function estado: TEnumEstado; overload;

    function retirada(Value: Boolean): IOrdemCab; overload;
    function retirada: Boolean; overload;

    function dtcadastro(Value: TDateTime): IOrdemCab; overload;
    function dtcadstro: TDateTime; overload;

    function usercad(Value: Integer): IOrdemCab; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IOrdemCab; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IOrdemCab; overload;
    function useralt: Integer; overload;

    function ordemItem(Value: TObjectList<TOrdemItem>): IOrdemCab; overload;
    function ordemItem: TObjectList<TOrdemItem>; overload;

    function ordemPagto(Value: TObjectList<TOrdemPagto>): IOrdemCab; overload;
    function ordemPagto: TObjectList<TOrdemPagto>; overload;

    function Build: IService<TOrdemCab>;
  end;

  TIOrdemItem = class(TInterfacedObject, IOrdemItem)
    private
      FEntity: TOrdemItem;
      FService: IService<TOrdemItem>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IOrdemItem;

      function idtbordem_item(Value: String): IOrdemItem; overload;
      function idtbordem_item: String; overload;

      function idtbordens_cab(Value: String): IOrdemItem; overload;
      function idtbordens_cab: String; overload;

      function idtbproduto(Value: Integer): IOrdemItem; overload;
      function idtbproduto: Integer; overload;

      function produto(Value: String): IOrdemItem; overload;
      function produto: String; overload;

      function item(Value: Integer): IOrdemItem; overload;
      function item: Integer; overload;

      function qtde(Value: Integer): IOrdemItem; overload;
      function qtde: Integer; overload;

      function precoTabela(Value: Currency): IOrdemItem; overload;
      function precoTabela: Currency; overload;

      function valorUnitario(Value: Currency): IOrdemItem; overload;
      function valorUnitario: Currency; overload;

      function percDesconto(Value: Currency): IOrdemItem; overload;
      function percDesconto: Currency; overload;

      function valorDesconto(Value: Currency): IOrdemItem; overload;
      function valorDesconto: Currency; overload;

      function percAcrescimo(Value: Currency): IOrdemItem; overload;
      function percAcrescimo: Currency; overload;

      function valorAcrescimo(Value: Currency): IOrdemItem; overload;
      function valorAcrescimo: Currency; overload;

      function totalBruto(Value: Currency): IOrdemItem; overload;
      function totalBruto: Currency; overload;

      function totalLiquido(Value: Currency): IOrdemItem; overload;
      function totalLiquido: Currency; overload;

      function venda(Value: String): IOrdemItem; overload;
      function venda: String; overload;

      function dtretirada(Value: TDate): IOrdemItem; overload;
      function dtretirada: TDate; overload;

      function retirado(Value: Boolean): IOrdemItem; overload;
      function retirado: Boolean; overload;

      function devolvido(Value: Boolean): IOrdemItem; overload;
      function devolvido: Boolean; overload;

      function cancelado(Value: Boolean): IOrdemItem; overload;
      function cancelado: Boolean; overload;

      function dtalterado(Value: TDate): IOrdemItem; overload;
      function dtalterado: TDate; overload;

      function userAlt(Value: Integer): IOrdemItem; overload;
      function userAlt: Integer; overload;

      function Build: IService<TOrdemItem>;
  end;

  TIOrdemPagto = class(TInterfacedObject, IOrdemPagto)
    private
      FEntity: TOrdemPagto;
      FService: IService<TOrdemPagto>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IOrdemPagto;

    function idtbordem_pagto(Value: String): IOrdemPagto; overload;
    function idtbordem_pagto: String; overload;

    function idtbordens_cab(Value: String): IOrdemPagto; overload;
    function idtbordens_cab: String; overload;

    function idtbforma_pagto(Value: String): IOrdemPagto; overload;
    function idtbforma_pagto: String; overload;

    function forma_pagto(Value: String): IOrdemPagto; overload;
    function forma_pagto: String; overload;

    function valor(Value: Currency): IOrdemPagto; overload;
    function valor: Currency; overload;

    function Build: IService<TOrdemPagto>;
  end;

implementation

{ TIOrdemCab }

{$REGION 'Get e Set OrdemCab'}

function TIOrdemCab.Build: IService<TOrdemCab>;
begin
  Result := FService;
end;

function TIOrdemCab.controle(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.controle := Value;
end;

function TIOrdemCab.cliente: String;
begin
  Result := FEntity.cliente;
end;

function TIOrdemCab.cliente(Value: String): IOrdemCab;
begin
  Result := Self;
  FEntity.cliente := Value;
end;

function TIOrdemCab.controle: Integer;
begin
  Result := FEntity.controle;
end;

constructor TIOrdemCab.Create;
begin
  FEntity := TOrdemCab.Create;
  FService := TServiceORMBr<TOrdemCab>.New(FEntity);
end;

destructor TIOrdemCab.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIOrdemCab.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIOrdemCab.dtalterado(Value: TDateTime): IOrdemCab;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIOrdemCab.dtcadastro(Value: TDateTime): IOrdemCab;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIOrdemCab.dtcadstro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIOrdemCab.dtdevolucao: TDateTime;
begin
  Result := FEntity.dtdevolucao;
end;

function TIOrdemCab.dtdevolucao(Value: TDateTime): IOrdemCab;
begin
  Result := Self;
  FEntity.dtdevolucao := Value;
end;

function TIOrdemCab.dtdocumento: TDateTime;
begin
  Result := FEntity.dtdocumento;
end;

function TIOrdemCab.dtdocumento(Value: TDateTime): IOrdemCab;
begin
  Result := Self;
  FEntity.dtdocumento := Value;
end;

function TIOrdemCab.dtretirada(Value: TDateTime): IOrdemCab;
begin
  Result := Self;
  FEntity.dtretirada := Value;
end;

function TIOrdemCab.dtretirada: TDateTime;
begin
  Result := FEntity.dtretirada;
end;

function TIOrdemCab.estado: TEnumEstado;
begin
  Result := FEntity.estado;
end;

function TIOrdemCab.estado(Value: TEnumEstado): IOrdemCab;
begin
  Result := Self;
  FEntity.estado := Value;
end;

function TIOrdemCab.idfuncionario(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.idfuncionario := Value;
end;

function TIOrdemCab.idfuncionario: Integer;
begin
  Result := FEntity.idfuncionario;
end;

function TIOrdemCab.idtbcliente: Integer;
begin
  Result := FEntity.idtbcliente;
end;

function TIOrdemCab.idtbcliente(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.idtbcliente := Value;
end;

function TIOrdemCab.idtbempresa(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TIOrdemCab.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TIOrdemCab.idtbordens_cab: String;
begin
  Result := FEntity.idtbordens_cab;
end;

function TIOrdemCab.idtbordens_cab(Value: String): IOrdemCab;
begin
  Result := Self;
  FEntity.idtbordens_cab := Value;
end;

class function TIOrdemCab.New: IOrdemCab;
begin
  Result := Self.Create;
end;

function TIOrdemCab.obervacao: String;
begin
  Result := FEntity.observacao;
end;

function TIOrdemCab.observacao(Value: String): IOrdemCab;
begin
  Result := Self;
  FEntity.observacao := Value;
end;

function TIOrdemCab.ordemItem: TObjectList<TOrdemItem>;
begin
  Result := FEntity.ordemItem;
end;

function TIOrdemCab.ordemItem(Value: TObjectList<TOrdemItem>): IOrdemCab;
begin
  Result := Self;
  FEntity.ordemItem := Value;
end;

function TIOrdemCab.ordemPagto(Value: TObjectList<TOrdemPagto>): IOrdemCab;
begin
  Result := Self;
  FEntity.ordemPagto := Value;
end;

function TIOrdemCab.ordemPagto: TObjectList<TOrdemPagto>;
begin
  Result := FEntity.ordemPagto;
end;

function TIOrdemCab.retirada(Value: Boolean): IOrdemCab;
begin
  Result := Self;
  FEntity.retirada := Value;
end;

function TIOrdemCab.retirada: Boolean;
begin
  Result := FEntity.retirada;
end;

function TIOrdemCab.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIOrdemCab.useralt(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIOrdemCab.usercad(Value: Integer): IOrdemCab;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIOrdemCab.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

{$ENDREGION}

{ TIOrdemItem }

{$REGION 'Get e Set OrdemItem'}

function TIOrdemItem.Build: IService<TOrdemItem>;
begin
  Result := FService;
end;

function TIOrdemItem.cancelado: Boolean;
begin
  Result := FEntity.cancelado;
end;

function TIOrdemItem.cancelado(Value: Boolean): IOrdemItem;
begin
  Result := Self;
  FEntity.cancelado := Value;
end;

constructor TIOrdemItem.Create;
begin
  FEntity := TOrdemItem.Create;
  FService := TServiceORMBr<TOrdemItem>.New(FEntity);
end;

destructor TIOrdemItem.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIOrdemItem.devolvido(Value: Boolean): IOrdemItem;
begin
  Result := Self;
  FEntity.devolvido := Value;
end;

function TIOrdemItem.devolvido: Boolean;
begin
  Result := FEntity.devolvido;
end;

function TIOrdemItem.dtalterado: TDate;
begin
  Result := FEntity.dtalterado;
end;

function TIOrdemItem.dtalterado(Value: TDate): IOrdemItem;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIOrdemItem.dtretirada: TDate;
begin
  Result := FEntity.dtretirada;
end;

function TIOrdemItem.dtretirada(Value: TDate): IOrdemItem;
begin
  Result := Self;
  FEntity.dtretirada := Value;
end;

function TIOrdemItem.idtbordem_item: String;
begin
  Result := FEntity.idtbordens_itens;
end;

function TIOrdemItem.idtbordem_item(Value: String): IOrdemItem;
begin
  Result := Self;
  FEntity.idtbordens_itens := Value;
end;

function TIOrdemItem.idtbordens_cab: String;
begin
  Result := FEntity.idtbordens_cab;
end;

function TIOrdemItem.idtbordens_cab(Value: String): IOrdemItem;
begin
  Result := Self;
  FEntity.idtbordens_cab := Value;
end;

function TIOrdemItem.idtbproduto(Value: Integer): IOrdemItem;
begin
  Result := Self;
  FEntity.idtbproduto := Value;
end;

function TIOrdemItem.idtbproduto: Integer;
begin
  Result := FEntity.idtbproduto;
end;

function TIOrdemItem.item: Integer;
begin
  Result := FEntity.item;
end;

function TIOrdemItem.item(Value: Integer): IOrdemItem;
begin
  Result := Self;
  FEntity.item := Value;
end;

class function TIOrdemItem.New: IOrdemItem;
begin
    Result := Self.Create;
end;

function TIOrdemItem.percAcrescimo: Currency;
begin
  Result := FEntity.percAcrescimo;
end;

function TIOrdemItem.percAcrescimo(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.percAcrescimo := Value;
end;

function TIOrdemItem.percDesconto(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.percDesconto := Value;
end;

function TIOrdemItem.percDesconto: Currency;
begin
  Result := FEntity.percDesconto;
end;

function TIOrdemItem.precoTabela(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.precoTabela := Value;
end;

function TIOrdemItem.precoTabela: Currency;
begin
  Result := FEntity.precoTabela;
end;

function TIOrdemItem.produto(Value: String): IOrdemItem;
begin
  Result := Self;
  FEntity.produto := Value;
end;

function TIOrdemItem.produto: String;
begin
  Result := FEntity.produto;
end;

function TIOrdemItem.qtde(Value: Integer): IOrdemItem;
begin
  Result := Self;
  FEntity.qtde := Value;
end;

function TIOrdemItem.qtde: Integer;
begin
  Result := FEntity.qtde;
end;

function TIOrdemItem.retirado(Value: Boolean): IOrdemItem;
begin
  Result := Self;
  FEntity.retirado := Value;
end;

function TIOrdemItem.retirado: Boolean;
begin
  Result := FEntity.retirado;
end;

function TIOrdemItem.totalBruto: Currency;
begin
  Result := FEntity.totalBruto;
end;

function TIOrdemItem.totalBruto(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.totalBruto := Value;
end;

function TIOrdemItem.totalLiquido: Currency;
begin
  Result := FEntity.totalLiquido;
end;

function TIOrdemItem.totalLiquido(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.totalLiquido := Value;
end;

function TIOrdemItem.userAlt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIOrdemItem.userAlt(Value: Integer): IOrdemItem;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIOrdemItem.valorAcrescimo(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.valorAcrescimo := Value;
end;

function TIOrdemItem.valorAcrescimo: Currency;
begin
  Result := FEntity.valorAcrescimo;
end;

function TIOrdemItem.valorDesconto: Currency;
begin
  Result := FEntity.valorDesconto;
end;

function TIOrdemItem.valorDesconto(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.valorDesconto := Value;
end;

function TIOrdemItem.valorUnitario: Currency;
begin
  Result := FEntity.valorUnitario;
end;

function TIOrdemItem.valorUnitario(Value: Currency): IOrdemItem;
begin
  Result := Self;
  FEntity.valorUnitario := Value;
end;

function TIOrdemItem.venda: String;
begin
  Result := FEntity.venda;
end;

function TIOrdemItem.venda(Value: String): IOrdemItem;
begin
  Result := Self;
  FEntity.venda := Value;
end;

{$ENDREGION}

{ TIOrdemPagto }

{$REGION 'Get e Set OrdemPagto'}

function TIOrdemPagto.Build: IService<TOrdemPagto>;
begin
  Result := FService;
end;

constructor TIOrdemPagto.Create;
begin
  FEntity := TOrdemPagto.Create;
  FService := TServiceORMBr<TOrdemPagto>.New(FEntity);
end;

destructor TIOrdemPagto.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIOrdemPagto.forma_pagto: String;
begin
  Result := FEntity.forma_pagto;
end;

function TIOrdemPagto.forma_pagto(Value: String): IOrdemPagto;
begin
  Result := Self;
  FEntity.forma_pagto := Value;
end;

function TIOrdemPagto.idtbforma_pagto: String;
begin
  Result := FEntity.idtbordens_pagto;
end;

function TIOrdemPagto.idtbforma_pagto(Value: String): IOrdemPagto;
begin
  Result := Self;
  FEntity.idtbordens_pagto := Value;
end;

function TIOrdemPagto.idtbordem_pagto: String;
begin
  Result := FEntity.idtbordens_pagto;
end;

function TIOrdemPagto.idtbordem_pagto(Value: String): IOrdemPagto;
begin
  Result := Self;
  FEntity.idtbordens_pagto := Value;
end;

function TIOrdemPagto.idtbordens_cab(Value: String): IOrdemPagto;
begin
  Result := Self;
  FEntity.idtbordens_cab := Value;
end;

function TIOrdemPagto.idtbordens_cab: String;
begin
  Result := FEntity.idtbordens_cab;
end;

class function TIOrdemPagto.New: IOrdemPagto;
begin
    Result := Self.Create;
end;

function TIOrdemPagto.valor(Value: Currency): IOrdemPagto;
begin
  Result := Self;
  FEntity.valor := Value;
end;

function TIOrdemPagto.valor: Currency;
begin
  Result := FEntity.valor;
end;

{$ENDREGION}

end.
