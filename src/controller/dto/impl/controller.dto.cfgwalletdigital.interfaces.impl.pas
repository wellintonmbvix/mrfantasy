unit controller.dto.cfgwalletdigital.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.cfgwalletdigital.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.cfgwalletsdigital;

type
  TICfgWalletDigital = class(TInterfacedObject, ICfgWalletDigital)
  private
    FEntity: TCfgWalletDigital;
    FService: IService<TCfgWalletDigital>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICfgWalletDigital;

    function idtbwallet(Value: Integer): ICfgWalletDigital; overload;
    function idtbwallet: Integer; overload;

    function descricao(Value: String): ICfgWalletDigital; overload;
    function descricao: String; overload;

    function dias_dep(Value: Integer): ICfgWalletDigital; overload;
    function dias_dep: Integer; overload;

    function imagem(Value: TBlob): ICfgWalletDigital; overload;
    function imagem: TBlob; overload;

    function dtcadastro(Value: TDateTime): ICfgWalletDigital; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICfgWalletDigital; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICfgWalletDigital; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICfgWalletDigital; overload;
    function useralt: Integer; overload;

    function Build: IService<TCfgWalletDigital>;
  end;

implementation

{ TICfgWalletDigital }

function TICfgWalletDigital.Build: IService<TCfgWalletDigital>;
begin
  Result := FService;
end;

constructor TICfgWalletDigital.Create;
begin
  FEntity := TCfgWalletDigital.Create;
  FService := TServiceORMBr<TCfgWalletDigital>.New(FEntity);
end;

function TICfgWalletDigital.descricao: String;
begin
  Result := FEntity.descricao;
end;

function TICfgWalletDigital.descricao(Value: String): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.descricao := Value;
end;

destructor TICfgWalletDigital.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TICfgWalletDigital.dias_dep(Value: Integer): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.dias_dep := Value;
end;

function TICfgWalletDigital.dias_dep: Integer;
begin
  Result := FEntity.dias_dep;
end;

function TICfgWalletDigital.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TICfgWalletDigital.dtalterado(Value: TDateTime): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TICfgWalletDigital.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TICfgWalletDigital.dtcadastro(Value: TDateTime): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TICfgWalletDigital.idtbwallet(Value: Integer): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.idtbwallet := Value;
end;

function TICfgWalletDigital.idtbwallet: Integer;
begin
  Result := FEntity.idtbwallet;
end;

function TICfgWalletDigital.imagem: TBlob;
begin
  Result := FEntity.imagem;
end;

function TICfgWalletDigital.imagem(Value: TBlob): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.imagem := Value;
end;

class function TICfgWalletDigital.New: ICfgWalletDigital;
begin
  Result := Self.Create;
end;

function TICfgWalletDigital.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TICfgWalletDigital.useralt(Value: Integer): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TICfgWalletDigital.usercad(Value: Integer): ICfgWalletDigital;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TICfgWalletDigital.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
