unit controller.dto.estoque.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.estoque.interfaces,

  uRotinas,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.rtti.helper,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.estoque;

type
  TIEstoque = class(TInterfacedObject, IEstoque)
  private
    FEntity: TEstoque;
    FService: IService<TEstoque>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEstoque;

    function idtbempresa(Value: Integer): IEstoque; overload;
    function idtbempresa: Integer; overload;

    function idtbproduto(Value: Integer): IEstoque; overload;
    function idtbproduto: Integer; overload;

    function qtde(Value: Integer): IEstoque; overload;
    function qtde: Integer; overload;

    function Build: IService<TEstoque>;
  end;

implementation

{ TIEstoque }

function TIEstoque.Build: IService<TEstoque>;
begin
  Result := FService;
end;

constructor TIEstoque.Create;
begin
  FEntity := TEstoque.Create;
  FService := TServiceORMBr<TEstoque>.New(FEntity);
end;

destructor TIEstoque.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIEstoque.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TIEstoque.idtbempresa(Value: Integer): IEstoque;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TIEstoque.idtbproduto: Integer;
begin
  Result := FEntity.idtbproduto;
end;

function TIEstoque.idtbproduto(Value: Integer): IEstoque;
begin
  Result := Self;
  FEntity.idtbproduto := Value;
end;

class function TIEstoque.New: IEstoque;
begin
  Result := Self.Create;
end;

function TIEstoque.qtde(Value: Integer): IEstoque;
begin
  Result := Self;
  FEntity.qtde := Value;
end;

function TIEstoque.qtde: Integer;
begin
  Result := FEntity.qtde;
end;

end.
