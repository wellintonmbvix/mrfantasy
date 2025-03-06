unit controller.dto.ordem.interfaces;

interface

uses
  System.Generics.Collections,

  model.ordemCab,
  model.ordemItem,
  model.ordemPagto,
  model.service.interfaces;

type
  IOrdemCab = interface
    ['{E32CD803-0EFE-4C10-A943-3A7096EB3087}']

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

  IOrdemItem = interface
    ['{3BC3ABDF-2D19-4CB1-8450-860E4477FA99}']

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

  IOrdemPagto = interface
    ['{BD69A90F-9F1C-4316-BF74-0E949CDCEBAC}']

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

end.
