unit controller.dto.ordemItem.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.ordemItem.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.ordemItem;

type
  TIOrdemDetail = class(TInterfacedObject, IOrdemDetail)
  private
    FEntity: TOrdemDetail;
    FService: IService<TOrdemDetail>;
    FServiceView: IServiceScripts;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IOrdemDetail;

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

{ TIOrdemItem }

function TIOrdemDetail.Build: IService<TOrdemDetail>;
begin
  Result := FService;
end;

function TIOrdemDetail.cancelado: String;
begin
  Result := FEntity.cancelado;
end;

function TIOrdemDetail.cancelado(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.cancelado := Value;
end;

constructor TIOrdemDetail.Create;
begin
  FEntity := TOrdemDetail.Create;
  FService := TServiceORMBr<TOrdemDetail>.New(FEntity);
  FServiceView := TServiceScripts.New;
end;

destructor TIOrdemDetail.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIOrdemDetail.devolvido(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.devolvido := Value;
end;

function TIOrdemDetail.devolvido: String;
begin
  Result := FEntity.devolvido;
end;

function TIOrdemDetail.dtalterado: TDate;
begin
  Result := FEntity.dtalterado;
end;

function TIOrdemDetail.dtalterado(Value: TDate): IOrdemDetail;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIOrdemDetail.dtretirada: TDate;
begin
  Result := FEntity.dtretirada;
end;

function TIOrdemDetail.dtretirada(Value: TDate): IOrdemDetail;
begin
  Result := Self;
  FEntity.dtretirada := Value;
end;

function TIOrdemDetail.idtbordem_item: String;
begin
  Result := FEntity.idtbordens_itens;
end;

function TIOrdemDetail.idtbordem_item(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.idtbordens_itens := Value;
end;

function TIOrdemDetail.idtbordens_cab: String;
begin
  Result := FEntity.idtbordens_cab;
end;

function TIOrdemDetail.idtbordens_cab(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.idtbordens_cab := Value;
end;

function TIOrdemDetail.idtbproduto(Value: Integer): IOrdemDetail;
begin
  Result := Self;
  FEntity.idtbproduto := Value;
end;

function TIOrdemDetail.idtbproduto: Integer;
begin
  Result := FEntity.idtbproduto;
end;

function TIOrdemDetail.item: Integer;
begin
  Result := FEntity.item;
end;

function TIOrdemDetail.Manufacture: IServiceScripts;
begin
  Result := FServiceView;
end;

function TIOrdemDetail.item(Value: Integer): IOrdemDetail;
begin
  Result := Self;
  FEntity.item := Value;
end;

class function TIOrdemDetail.New: IOrdemDetail;
begin
  Result := Self.Create;
end;

function TIOrdemDetail.percAcrescimo: Currency;
begin
  Result := FEntity.percAcrescimo;
end;

function TIOrdemDetail.percAcrescimo(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.percAcrescimo := Value;
end;

function TIOrdemDetail.percDesconto(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.percDesconto := Value;
end;

function TIOrdemDetail.percDesconto: Currency;
begin
  Result := FEntity.percDesconto;
end;

function TIOrdemDetail.precoTabela(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.precoTabela := Value;
end;

function TIOrdemDetail.precoTabela: Currency;
begin
  Result := FEntity.precoTabela;
end;

function TIOrdemDetail.produto(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.produto := Value;
end;

function TIOrdemDetail.produto: String;
begin
  Result := FEntity.produto;
end;

function TIOrdemDetail.qtde(Value: Integer): IOrdemDetail;
begin
  Result := Self;
  FEntity.qtde := Value;
end;

function TIOrdemDetail.qtde: Integer;
begin
  Result := FEntity.qtde;
end;

function TIOrdemDetail.retirado(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.retirado := Value;
end;

function TIOrdemDetail.retirado: String;
begin
  Result := FEntity.retirado;
end;

function TIOrdemDetail.totalBruto: Currency;
begin
  Result := FEntity.totalBruto;
end;

function TIOrdemDetail.totalBruto(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.totalBruto := Value;
end;

function TIOrdemDetail.totalLiquido: Currency;
begin
  Result := FEntity.totalLiquido;
end;

function TIOrdemDetail.totalLiquido(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.totalLiquido := Value;
end;

function TIOrdemDetail.userAlt: Integer;
begin
  Result := FEntity.userAlt;
end;

function TIOrdemDetail.userAlt(Value: Integer): IOrdemDetail;
begin
  Result := Self;
  FEntity.userAlt := Value;
end;

function TIOrdemDetail.valorAcrescimo(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.valorAcrescimo := Value;
end;

function TIOrdemDetail.valorAcrescimo: Currency;
begin
  Result := FEntity.valorAcrescimo;
end;

function TIOrdemDetail.valorDesconto: Currency;
begin
  Result := FEntity.valorDesconto;
end;

function TIOrdemDetail.valorDesconto(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.valorDesconto := Value;
end;

function TIOrdemDetail.valorUnitario: Currency;
begin
  Result := FEntity.valorUnitario;
end;

function TIOrdemDetail.valorUnitario(Value: Currency): IOrdemDetail;
begin
  Result := Self;
  FEntity.valorUnitario := Value;
end;

function TIOrdemDetail.venda: String;
begin
  Result := FEntity.venda;
end;

function TIOrdemDetail.venda(Value: String): IOrdemDetail;
begin
  Result := Self;
  FEntity.venda := Value;
end;

end.
