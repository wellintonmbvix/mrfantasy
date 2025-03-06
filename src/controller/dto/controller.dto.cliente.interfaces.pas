unit controller.dto.cliente.interfaces;

interface

uses
  System.Generics.Collections,

  model.cliente,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  ICliente = interface
    ['{69E98165-A242-471D-9DC2-825F8FB8690F}']

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

end.
