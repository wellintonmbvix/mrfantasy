unit controller.dto.ordemCab.interfaces;

interface

uses
  System.Generics.Collections,

  FireDAC.Comp.Client,

  model.ordemCab,
  model.ordemItem,
  model.ordemPagto,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  IOrdemMaster = interface
    ['{E32CD803-0EFE-4C10-A943-3A7096EB3087}']

    function idtbordens_cab(Value: String): IOrdemMaster; overload;
    function idtbordens_cab: String; overload;

    function idtbempresa(Value: Integer): IOrdemMaster; overload;
    function idtbempresa: Integer; overload;

    function idfuncionario(Value: Integer): IOrdemMaster; overload;
    function idfuncionario: Integer; overload;

    function idtbcliente(Value: Integer): IOrdemMaster; overload;
    function idtbcliente: Integer; overload;

    function cliente(Value: String): IOrdemMaster; overload;
    function cliente: String; overload;

    function controle(Value: Integer): IOrdemMaster; overload;
    function controle: Integer; overload;

    function dtdocumento(Value: TDateTime): IOrdemMaster; overload;
    function dtdocumento: TDateTime; overload;

    function dtretirada(Value: TDateTime): IOrdemMaster; overload;
    function dtretirada: TDateTime; overload;

    function dtdevolucao(Value: TDateTime): IOrdemMaster; overload;
    function dtdevolucao: TDateTime; overload;

    function observacao(Value: String): IOrdemMaster; overload;
    function obervacao: String; overload;

    function estado(Value: String): IOrdemMaster; overload;
    function estado: String; overload;

    function retirada(Value: String): IOrdemMaster; overload;
    function retirada: String; overload;

    function dtcadastro(Value: TDateTime): IOrdemMaster; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IOrdemMaster; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IOrdemMaster; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IOrdemMaster; overload;
    function useralt: Integer; overload;

    function ordemItem(Value: TFDMemTable): IOrdemMaster; overload;
    function ordemItem: TObjectList<TOrdemDetail>; overload;

    function ordemPagto(Value: TFDMemTable): IOrdemMaster; overload;
    function ordemPagto: TObjectList<TOrdemPayment>; overload;

    function Build: IService<TOrdemMaster>;

    function Manufacture: IServiceScripts;
  end;

implementation

end.
