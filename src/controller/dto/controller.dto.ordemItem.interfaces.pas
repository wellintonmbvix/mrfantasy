unit controller.dto.ordemItem.interfaces;

interface

uses
  System.Generics.Collections,

  model.ordemItem,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  IOrdemDetail = interface
    ['{3BC3ABDF-2D19-4CB1-8450-860E4477FA99}']

    function idtbordem_item(Value: String): IOrdemDetail; overload;
    function idtbordem_item: String; overload;

    function idtbordens_cab(Value: String): IOrdemDetail; overload;
    function idtbordens_cab: String; overload;

    function idtbproduto(Value: Integer): IOrdemDetail; overload;
    function idtbproduto: Integer; overload;

    function produto(Value: String): IOrdemDetail; overload;
    function produto: String; overload;

    function item(Value: Integer): IOrdemDetail; overload;
    function item: Integer; overload;

    function qtde(Value: Integer): IOrdemDetail; overload;
    function qtde: Integer; overload;

    function precoTabela(Value: Currency): IOrdemDetail; overload;
    function precoTabela: Currency; overload;

    function valorUnitario(Value: Currency): IOrdemDetail; overload;
    function valorUnitario: Currency; overload;

    function percDesconto(Value: Currency): IOrdemDetail; overload;
    function percDesconto: Currency; overload;

    function valorDesconto(Value: Currency): IOrdemDetail; overload;
    function valorDesconto: Currency; overload;

    function percAcrescimo(Value: Currency): IOrdemDetail; overload;
    function percAcrescimo: Currency; overload;

    function valorAcrescimo(Value: Currency): IOrdemDetail; overload;
    function valorAcrescimo: Currency; overload;

    function totalBruto(Value: Currency): IOrdemDetail; overload;
    function totalBruto: Currency; overload;

    function totalLiquido(Value: Currency): IOrdemDetail; overload;
    function totalLiquido: Currency; overload;

    function venda(Value: String): IOrdemDetail; overload;
    function venda: String; overload;

    function dtretirada(Value: TDate): IOrdemDetail; overload;
    function dtretirada: TDate; overload;

    function retirado(Value: String): IOrdemDetail; overload;
    function retirado: String; overload;

    function devolvido(Value: String): IOrdemDetail; overload;
    function devolvido: String; overload;

    function cancelado(Value: String): IOrdemDetail; overload;
    function cancelado: String; overload;

    function dtalterado(Value: TDate): IOrdemDetail; overload;
    function dtalterado: TDate; overload;

    function userAlt(Value: Integer): IOrdemDetail; overload;
    function userAlt: Integer; overload;

    function Build: IService<TOrdemDetail>;

    function Manufacture: IServiceScripts;
  end;

implementation

end.
