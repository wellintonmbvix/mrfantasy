unit controller.dto.empresa.interfaces;

interface

uses
  System.Generics.Collections,

  model.empresa,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces;

type
  IEmpresa = interface
    ['{CEF1961C-A31D-4D34-A06C-9FF9E7624E5C}']

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

end.
