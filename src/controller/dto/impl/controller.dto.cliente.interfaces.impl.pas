unit controller.dto.cliente.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.cliente.interfaces,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.cliente;

type
  TICliente = class(TInterfacedObject, ICliente)
  private
    FEntity: TCliente;
    FService: IService<TCliente>;
    FServiceView: IServiceView;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICliente;

    function idtbcliente(const Value: Integer):ICliente; overload;
    function idtbcliente: Integer; overload;

    function idtbempresa(const Value: Integer):ICliente; overload;
    function idtbempresa: Integer; overload;

    function cpf_cnpj(const Value: String):ICliente; overload;
    function cpf_cnpj: String; overload;

    function nome(const Value: String):ICliente; overload;
    function nome: String; overload;

    function rg_insc(const Value: String):ICliente; overload;
    function rg_insc: String; overload;

    function endereco(const Value: String):ICliente; overload;
    function endereco: String; overload;

    function nro(const Value: String):ICliente; overload;
    function nro: String; overload;

    function comp(const Value: String):ICliente; overload;
    function comp: String; overload;

    function bairro(const Value: String):ICliente; overload;
    function bairro: String; overload;

    function cidade(const Value: String):ICliente; overload;
    function cidade: String; overload;

    function cep(const Value: String):ICliente; overload;
    function cep: String; overload;

    function uf(const Value: String):ICliente; overload;
    function uf: String; overload;

    function dtnascimento(const Value: String):ICliente; overload;
    function dtnascimento: String; overload;

    function fone1(const Value: String):ICliente; overload;
    function fone1: String; overload;

    function fone2(const Value: String):ICliente; overload;
    function fone2: String; overload;

    function email(const Value: String):ICliente; overload;
    function email: String; overload;

    function obs(const Value: String):ICliente; overload;
    function obs: String; overload;

    function dtcadastro(const Value: TDateTime): ICliente; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(const Value: Integer): ICliente; overload;
    function usercad: Integer; overload;

    function dtalterado(const Value: TDateTime): ICliente; overload;
    function dtalterado: TDateTime; overload;

    function useralt(const Value: Integer): ICliente; overload;
    function useralt: Integer; overload;

    function Build: IService<TCliente>;

    function Manufacture: IServiceView;
  end;

implementation

{ TICliente }

function TICliente.bairro(const Value: String): ICliente;
begin
  FEntity.bairro := Value;
  Result := Self;
end;

function TICliente.bairro: String;
begin
  Result := FEntity.bairro;
end;

function TICliente.Build: IService<TCliente>;
begin
  Result := FService;
end;

function TICliente.cep(const Value: String): ICliente;
begin
  FEntity.cep := Value;
  Result := Self;
end;

function TICliente.cep: String;
begin
  Result := FEntity.cep;
end;

function TICliente.cidade(const Value: String): ICliente;
begin
  FEntity.cidade := Value;
  Result := Self;
end;

function TICliente.cidade: String;
begin
  Result := FEntity.cidade;
end;

function TICliente.comp(const Value: String): ICliente;
begin
  FEntity.comp := Value;
  Result := Self;
end;

function TICliente.comp: String;
begin
  Result := FEntity.comp;
end;

function TICliente.cpf_cnpj(const Value: String): ICliente;
begin
  FEntity.cpf_cnpj := Value;
  Result := Self;
end;

function TICliente.cpf_cnpj: String;
begin
  Result := FEntity.cpf_cnpj;
end;

constructor TICliente.Create;
begin
  FEntity := TCliente.Create;
  FService := TServiceORMBr<TCliente>.New(FEntity);
  FServiceView := TServiceView.New;
end;

destructor TICliente.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TICliente.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TICliente.dtalterado(const Value: TDateTime): ICliente;
begin
  FEntity.dtalterado := Value;
  Result := Self;
end;

function TICliente.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TICliente.dtcadastro(const Value: TDateTime): ICliente;
begin
  FEntity.dtcadastro := Value;
  Result := Self;
end;

function TICliente.dtnascimento: String;
begin
  Result := FEntity.dtnascimento;
end;

function TICliente.dtnascimento(const Value: String): ICliente;
begin
  FEntity.dtnascimento := Value;
  Result := Self;
end;

function TICliente.email(const Value: String): ICliente;
begin
  FEntity.email := Value;
  Result := Self;
end;

function TICliente.email: String;
begin
  Result := FEntity.email;
end;

function TICliente.endereco: String;
begin
  Result := FEntity.endereco;
end;

function TICliente.endereco(const Value: String): ICliente;
begin
  FEntity.endereco := Value;
  Result := Self;
end;

function TICliente.fone1: String;
begin
  Result := FEntity.fone1;
end;

function TICliente.fone1(const Value: String): ICliente;
begin
  FEntity.fone1 := Value;
  Result := Self;
end;

function TICliente.fone2(const Value: String): ICliente;
begin
  FEntity.fone2 := Value;
  Result := Self;
end;

function TICliente.fone2: String;
begin
  Result := FEntity.fone2;
end;

function TICliente.idtbcliente: Integer;
begin
  Result := FEntity.idtbcliente;
end;

function TICliente.idtbcliente(const Value: Integer): ICliente;
begin
  FEntity.idtbcliente := Value;
  Result := Self;
end;

function TICliente.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TICliente.Manufacture: IServiceView;
begin
  Result := FServiceView;
end;

function TICliente.idtbempresa(const Value: Integer): ICliente;
begin
  FEntity.idtbempresa := Value;
  Result := Self;
end;

class function TICliente.New: ICliente;
begin
  Result := Self.Create;
end;

function TICliente.nome(const Value: String): ICliente;
begin
  FEntity.nome := Value;
  Result := Self;
end;

function TICliente.nome: String;
begin
  Result := FEntity.nome;
end;

function TICliente.nro(const Value: String): ICliente;
begin
  FEntity.nro := Value;
  Result := Self;
end;

function TICliente.nro: String;
begin
  Result := FEntity.nro;
end;

function TICliente.obs(const Value: String): ICliente;
begin
  FEntity.obs := Value;
  Result := Self;
end;

function TICliente.obs: String;
begin
  Result := FEntity.obs;
end;

function TICliente.rg_insc(const Value: String): ICliente;
begin
  FEntity.rg_insc := Value;
  Result := Self;
end;

function TICliente.rg_insc: String;
begin
  Result := FEntity.rg_insc;
end;

function TICliente.uf: String;
begin
  Result := FEntity.uf;
end;

function TICliente.uf(const Value: String): ICliente;
begin
  FEntity.uf := Value;
  Result := Self;
end;

function TICliente.useralt(const Value: Integer): ICliente;
begin
  FEntity.useralt := Value;
  Result := Self;
end;

function TICliente.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TICliente.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

function TICliente.usercad(const Value: Integer): ICliente;
begin
  FEntity.usercad := Value;
  Result := Self;
end;

end.
