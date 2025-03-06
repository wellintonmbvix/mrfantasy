unit controller.dto.empresa.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.empresa.interfaces,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.empresa;

type
  TIEmpresa = class(TInterfacedObject, IEmpresa)
  private
    FEntity: Tempresa;
    FService: IService<Tempresa>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEmpresa;

    function idtbempresa(Value: Integer): IEmpresa; overload;
    function idtbempresa: Integer; overload;

    function razao(Value: String): IEmpresa; overload;
    function razao: String; overload;

    function fantasia(Value: String): IEmpresa; overload;
    function fantasia: String; overload;

    function endereco(Value: String): IEmpresa; overload;
    function endereco: String; overload;

    function nro(Value: String): IEmpresa; overload;
    function nro: String; overload;

    function comp(Value: String): IEmpresa; overload;
    function comp: String; overload;

    function bairro(Value: String): IEmpresa; overload;
    function bairro: String; overload;

    function cidade(Value: String): IEmpresa; overload;
    function cidade: String; overload;

    function cep(Value: String): IEmpresa; overload;
    function cep: String; overload;

    function uf(Value: String): IEmpresa; overload;
    function uf: String; overload;

    function cnpj(Value: String): IEmpresa; overload;
    function cnpj: String; overload;

    function insc(Value: String): IEmpresa; overload;
    function insc: String; overload;

    function fone1(Value: String): IEmpresa; overload;
    function fone1: String; overload;

    function fone2(Value: String): IEmpresa; overload;
    function fone2: String; overload;

    function obsaluguel(Value: String): IEmpresa; overload;
    function obsaluguel: String; overload;

    function dtcadastro(Value: TDateTime): IEmpresa; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IEmpresa; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IEmpresa; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IEmpresa; overload;
    function useralt: Integer; overload;

    function Build: IService<Tempresa>;
  end;

implementation

{ TIEmpresa }

function TIEmpresa.bairro(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.bairro := Value;
end;

function TIEmpresa.bairro: String;
begin
  Result := FEntity.bairro;
end;

function TIEmpresa.Build: IService<Tempresa>;
begin
  Result := FService;
end;

function TIEmpresa.cep: String;
begin
  Result := FEntity.cep;
end;

function TIEmpresa.cep(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.cep := Value;
end;

function TIEmpresa.cidade: String;
begin
  Result := FEntity.cidade;
end;

function TIEmpresa.cidade(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.cidade := Value;
end;

function TIEmpresa.cnpj: String;
begin
  Result := FEntity.cnpj;
end;

function TIEmpresa.cnpj(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.cnpj := Value;
end;

function TIEmpresa.comp: String;
begin
  Result := FEntity.comp;
end;

function TIEmpresa.comp(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.comp := Value;
end;

constructor TIEmpresa.Create;
begin
  FEntity := Tempresa.Create;
  FService := TServiceORMBr<Tempresa>.New(FEntity);
end;

destructor TIEmpresa.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIEmpresa.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIEmpresa.dtalterado(Value: TDateTime): IEmpresa;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIEmpresa.dtcadastro(Value: TDateTime): IEmpresa;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIEmpresa.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIEmpresa.endereco: String;
begin
  Result := FEntity.endereco;
end;

function TIEmpresa.endereco(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.endereco := Value;
end;

function TIEmpresa.fantasia: String;
begin
  Result := FEntity.fantasia;
end;

function TIEmpresa.fantasia(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.fantasia := Value;
end;

function TIEmpresa.fone1(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.fone1 := Value;
end;

function TIEmpresa.fone1: String;
begin
  Result := FEntity.fone1;
end;

function TIEmpresa.fone2: String;
begin
  Result := FEntity.fone2;
end;

function TIEmpresa.fone2(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.fone2 := Value;
end;

function TIEmpresa.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TIEmpresa.idtbempresa(Value: Integer): IEmpresa;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TIEmpresa.insc(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.insc := Value;
end;

function TIEmpresa.insc: String;
begin
  Result := FEntity.insc;
end;

class function TIEmpresa.New: IEmpresa;
begin
  Result := Self.Create;
end;

function TIEmpresa.nro: String;
begin
  Result := FEntity.nro;
end;

function TIEmpresa.nro(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.nro := Value;
end;

function TIEmpresa.obsaluguel: String;
begin
  Result := FEntity.obsaluguel;
end;

function TIEmpresa.obsaluguel(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.obsaluguel := Value;
end;

function TIEmpresa.razao(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.razao := Value;
end;

function TIEmpresa.razao: String;
begin
  Result := FEntity.razao;
end;

function TIEmpresa.uf: String;
begin
  Result := FEntity.uf;
end;

function TIEmpresa.uf(Value: String): IEmpresa;
begin
  Result := Self;
  FEntity.uf := Value;
end;

function TIEmpresa.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIEmpresa.useralt(Value: Integer): IEmpresa;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIEmpresa.usercad(Value: Integer): IEmpresa;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIEmpresa.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
