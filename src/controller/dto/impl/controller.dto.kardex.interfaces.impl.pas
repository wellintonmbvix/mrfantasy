unit controller.dto.kardex.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.kardex.interfaces,

  uRotinas,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.rtti.helper,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.kardex;

type
  TIKardex = class(TInterfacedObject, IKardex)
  private
    FEntity: TKardex;
    FService: IService<TKardex>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IKardex;

    function idtbkardex(Value: Integer): IKardex; overload;
    function idtbkardex: Integer; overload;

    function idtbempresa(Value: Integer): IKardex; overload;
    function idtbempresa: Integer; overload;

    function dtmovimento(Value: TDateTime): IKardex; overload;
    function dtmovimento: TDateTime; overload;

    function documento(Value: String): IKardex; overload;
    function documento: String; overload;

    function idtbproduto(Value: Integer): IKardex; overload;
    function idtbproduto: Integer; overload;

    function tipo(Value: Integer): IKardex; overload;
    function tipo: Integer; overload;

    function qtde(Value: Integer): IKardex; overload;
    function qtde: Integer; overload;

    function usercad(Value: Integer): IKardex; overload;
    function usercad: Integer; overload;

    function Build: IService<TKardex>;
  end;

implementation

{ TIKardex }

function TIKardex.Build: IService<TKardex>;
begin
  Result := FService;
end;

constructor TIKardex.Create;
begin
  FEntity := TKardex.Create;
  FService := TServiceORMBr<TKardex>.New(FEntity);
end;

destructor TIKardex.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIKardex.documento: String;
begin
  Result := FEntity.documento;
end;

function TIKardex.documento(Value: String): IKardex;
begin
  Result := Self;
  FEntity.documento := Value;
end;

function TIKardex.dtmovimento(Value: TDateTime): IKardex;
begin
  Result := Self;
  FEntity.dtmovimento := Value;
end;

function TIKardex.dtmovimento: TDateTime;
begin
  Result := FEntity.dtmovimento;
end;

function TIKardex.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TIKardex.idtbempresa(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TIKardex.idtbkardex(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.idtbkardex := Value;
end;

function TIKardex.idtbkardex: Integer;
begin
  Result := FEntity.idtbkardex;
end;

function TIKardex.idtbproduto(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.idtbproduto := Value;
end;

function TIKardex.idtbproduto: Integer;
begin
  Result := FEntity.idtbproduto;
end;

class function TIKardex.New: IKardex;
begin
  Result := Self.Create;
end;

function TIKardex.qtde(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.qtde := Value;
end;

function TIKardex.qtde: Integer;
begin
  Result := FEntity.qtde;
end;

function TIKardex.tipo: Integer;
begin
  Result := FEntity.tipo;
end;

function TIKardex.tipo(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.tipo := Value;
end;

function TIKardex.usercad(Value: Integer): IKardex;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIKardex.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
