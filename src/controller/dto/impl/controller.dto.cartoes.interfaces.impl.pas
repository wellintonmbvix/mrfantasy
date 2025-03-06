unit controller.dto.cartoes.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.cartoes.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.cartoes;

type
  TICartoes = class(TInterfacedObject, ICartoes)
  private
    FEntity: TCartoes;
    FService: IService<TCartoes>;
    FServiceView: IServiceView;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICartoes;

    function idtbcartao(Value: Integer): ICartoes; overload;
    function idtbcartao: Integer; overload;

    function idtbempresa(Value: Integer): ICartoes; overload;
    function idtbempresa: Integer; overload;

    function dtemissao(Value: TDateTime): ICartoes; overload;
    function dtemissao: TDateTime; overload;

    function idcliente(Value: Integer): ICartoes; overload;
    function idcliente: Integer; overload;

    function cliente(Value: String): ICartoes; overload;
    function cliente: String; overload;

    function parcela(Value: Integer): ICartoes; overload;
    function parcela: Integer; overload;

    function parcelas(Value: Integer): ICartoes; overload;
    function parcelas: Integer; overload;

    function dtvencimento(Value: TDateTime): ICartoes; overload;
    function dtvencimento: TDateTime; overload;

    function valor(Value: Currency): ICartoes; overload;
    function valor: Currency; overload;

    function origem(Value: String): ICartoes; overload;
    function origem: String; overload;

    function documento(Value: String): ICartoes; overload;
    function documento: String; overload;

    function dtconciliado(Value: TDateTime): ICartoes; overload;
    function dtconciliado: TDateTime; overload;

    function dtcadastro(Value: TDateTime): ICartoes; overload;
    function dtcadstro: TDateTime; overload;

    function usercad(Value: Integer): ICartoes; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICartoes; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICartoes; overload;
    function useralt: Integer; overload;

    function Build: IService<TCartoes>;

    function Manufacture: IServiceView;
  end;

implementation

{ TICartoes }

function TICartoes.Build: IService<TCartoes>;
begin
  Result := FService;
end;

function TICartoes.cliente: String;
begin
  Result := FEntity.cliente;
end;

function TICartoes.cliente(Value: String): ICartoes;
begin
  Result := Self;
  FEntity.cliente := Value;
end;

constructor TICartoes.Create;
begin
  FEntity := TCartoes.Create;
  FService := TServiceORMBr<TCartoes>.New(FEntity);
  FServiceView := TServiceView.New;
end;

destructor TICartoes.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TICartoes.documento: String;
begin
  Result := FEntity.documento;
end;

function TICartoes.documento(Value: String): ICartoes;
begin
  Result := Self;
  FEntity.documento := Value;
end;

function TICartoes.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TICartoes.dtalterado(Value: TDateTime): ICartoes;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TICartoes.dtcadastro(Value: TDateTime): ICartoes;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TICartoes.dtcadstro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TICartoes.dtconciliado: TDateTime;
begin
  Result := FEntity.dtconciliado;
end;

function TICartoes.dtconciliado(Value: TDateTime): ICartoes;
begin
  Result := Self;
  FEntity.dtconciliado := Value;
end;

function TICartoes.dtemissao(Value: TDateTime): ICartoes;
begin
  Result := Self;
  FEntity.dtemissao := Value;
end;

function TICartoes.dtemissao: TDateTime;
begin
  Result := FEntity.dtemissao;
end;

function TICartoes.dtvencimento: TDateTime;
begin
  Result := FEntity.dtvencimento;
end;

function TICartoes.dtvencimento(Value: TDateTime): ICartoes;
begin
  Result := Self;
  FEntity.dtvencimento := Value;
end;

function TICartoes.idcliente: Integer;
begin
  Result := FEntity.idcliente;
end;

function TICartoes.idcliente(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.idcliente := Value;
end;

function TICartoes.idtbcartao(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.idtbcartao := Value;
end;

function TICartoes.idtbcartao: Integer;
begin
  Result := FEntity.idtbcartao;
end;

function TICartoes.idtbempresa(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TICartoes.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TICartoes.Manufacture: IServiceView;
begin
  Result := FServiceView;
end;

class function TICartoes.New: ICartoes;
begin
  Result := Self.Create;
end;

function TICartoes.origem(Value: String): ICartoes;
begin
  Result := Self;
  FEntity.origem := Value;
end;

function TICartoes.origem: String;
begin
  Result := FEntity.origem;
end;

function TICartoes.parcela(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.parcela := Value;
end;

function TICartoes.parcela: Integer;
begin
  Result := FEntity.parcela;
end;

function TICartoes.parcelas: Integer;
begin
  Result := FEntity.parcelas;
end;

function TICartoes.parcelas(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.parcelas := Value;
end;

function TICartoes.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TICartoes.useralt(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TICartoes.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

function TICartoes.usercad(Value: Integer): ICartoes;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TICartoes.valor: Currency;
begin
  Result := FEntity.valor;
end;

function TICartoes.valor(Value: Currency): ICartoes;
begin
  Result := Self;
  FEntity.valor := Value;
end;

end.
