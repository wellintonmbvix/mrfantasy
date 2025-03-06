unit controller.dto.funcionario.interfaces;

interface

uses
  System.Generics.Collections,

  model.funcionario,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces;

type
  IFuncionario = interface
    ['{96A7199C-5CC6-45D0-9A9B-2EB633E442AA}']

    function idtbfuncionario(Value: Integer): IFuncionario; overload;
    function idtbfuncionario: Integer; overload;

    function codigo(Value: Integer): IFuncionario; overload;
    function codigo: Integer; overload;

    function nome(Value: String): IFuncionario; overload;
    function nome: String; overload;

    function abreviatura(Value: String): IFuncionario; overload;
    function abreviatura: String; overload;

    function endereco(Value: String): IFuncionario; overload;
    function endereco: String; overload;

    function nro(Value: String): IFuncionario; overload;
    function nro: String; overload;

    function comp(Value: String): IFuncionario; overload;
    function comp: String; overload;

    function bairro(Value: String): IFuncionario; overload;
    function bairro: String; overload;

    function cidade(Value: String): IFuncionario; overload;
    function cidade: String; overload;

    function cep(Value: String): IFuncionario; overload;
    function cep: String; overload;

    function uf(Value: String): IFuncionario; overload;
    function uf: String; overload;

    function cpf(Value: String): IFuncionario; overload;
    function cpf: String; overload;

    function rg(Value: String): IFuncionario; overload;
    function rg: String; overload;

    function fone1(Value: String): IFuncionario; overload;
    function fone1: String; overload;

    function fone2(Value: String): IFuncionario; overload;
    function fone2: String; overload;

    function dtadmissao(Value: String): IFuncionario; overload;
    function dtadmissao: String; overload;

    function funcao(Value: String): IFuncionario; overload;
    function funcao: String; overload;

    function dtdemissao(Value: String): IFuncionario; overload;
    function dtdemissao: String; overload;

    function dtcadastro(Value: TDateTime): IFuncionario; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IFuncionario; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IFuncionario; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IFuncionario; overload;
    function useralt: Integer; overload;

    function Build: IService<TFuncionario>;

  end;

implementation

end.
