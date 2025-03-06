unit controller.dto.carteiraDigital.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.carteiraDigital.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.carteiraDigital;

type
  TICarteiraDigital = class(TInterfacedObject, ICarteiraDigital)
  private
    FEntity: TCarteiraDigital;
    FService: IService<TCarteiraDigital>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICarteiraDigital;

    function idtbwallet(Value: Integer): ICarteiraDigital; overload;
    function idtbwallet: Integer; overload;

    function descricao(Value: String): ICarteiraDigital; overload;
    function descricao: String; overload;

    function dias_dep(Value: Integer): ICarteiraDigital; overload;
    function dias_dep: Integer; overload;

    function imagem(Value: TBlob): ICarteiraDigital; overload;
    function imagem: TBlob; overload;

    function dtcadastro(Value: TDateTime): ICarteiraDigital; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICarteiraDigital; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICarteiraDigital; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICarteiraDigital; overload;
    function useralt: Integer; overload;

    function Build: IService<TCarteiraDigital>;
  end;

implementation

{ TICfgWalletDigital }

function TICarteiraDigital.Build: IService<TCarteiraDigital>;
begin
  Result := FService;
end;

constructor TICarteiraDigital.Create;
begin
  FEntity := TCarteiraDigital.Create;
  FService := TServiceORMBr<TCarteiraDigital>.New(FEntity);
end;

function TICarteiraDigital.descricao: String;
begin
  Result := FEntity.descricao;
end;

function TICarteiraDigital.descricao(Value: String): ICarteiraDigital;
begin
  Result := Self;
  FEntity.descricao := Value;
end;

destructor TICarteiraDigital.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TICarteiraDigital.dias_dep(Value: Integer): ICarteiraDigital;
begin
  Result := Self;
  FEntity.dias_dep := Value;
end;

function TICarteiraDigital.dias_dep: Integer;
begin
  Result := FEntity.dias_dep;
end;

function TICarteiraDigital.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TICarteiraDigital.dtalterado(Value: TDateTime): ICarteiraDigital;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TICarteiraDigital.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TICarteiraDigital.dtcadastro(Value: TDateTime): ICarteiraDigital;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TICarteiraDigital.idtbwallet(Value: Integer): ICarteiraDigital;
begin
  Result := Self;
  FEntity.idtbwallet := Value;
end;

function TICarteiraDigital.idtbwallet: Integer;
begin
  Result := FEntity.idtbwallet;
end;

function TICarteiraDigital.imagem: TBlob;
begin
  Result := FEntity.imagem;
end;

function TICarteiraDigital.imagem(Value: TBlob): ICarteiraDigital;
begin
  Result := Self;
  FEntity.imagem := Value;
end;

class function TICarteiraDigital.New: ICarteiraDigital;
begin
  Result := Self.Create;
end;

function TICarteiraDigital.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TICarteiraDigital.useralt(Value: Integer): ICarteiraDigital;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TICarteiraDigital.usercad(Value: Integer): ICarteiraDigital;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TICarteiraDigital.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
