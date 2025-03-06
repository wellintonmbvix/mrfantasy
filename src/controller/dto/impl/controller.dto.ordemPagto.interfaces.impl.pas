unit controller.dto.ordemPagto.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.ordemPagto.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.ordemPagto;

type
  TIOrdemPagto = class(TInterfacedObject, IOrdemPagto)
  private
    FEntity: TOrdemPayment;
    FService: IService<TOrdemPayment>;
    FServiceView: IServiceScripts;
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

    function Build: IService<TOrdemPayment>;

    function Manufacture: IServiceScripts;
  end;

implementation

{ TIOrdemPagto }

function TIOrdemPagto.Build: IService<TOrdemPayment>;
begin
  Result := FService;
end;

constructor TIOrdemPagto.Create;
begin
  FEntity := TOrdemPayment.Create;
  FService := TServiceORMBr<TOrdemPayment>.New(FEntity);
  FServiceView := TServiceScripts.New;
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

function TIOrdemPagto.Manufacture: IServiceScripts;
begin
  Result := FServiceView;
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

end.
