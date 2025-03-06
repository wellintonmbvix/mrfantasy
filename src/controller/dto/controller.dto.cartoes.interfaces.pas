unit controller.dto.cartoes.interfaces;

interface

uses
  model.cartoes,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  ICartoes = interface
    ['{B2A0F379-EDF6-4C69-9739-234F5C4615C5}']

    function idtbcartao(Value: Integer): ICartoes; overload;
    function idtbcartao: Integer; overload;

    function idtbempresa(Value: Integer): ICartoes; overload;
    function idtbempresa: Integer; overload;

    function dtemissao(Value: TDateTime): ICartoes; overload;
    function dtemissao: TDateTime; overload;

    function idcliente(Value:Integer): ICartoes; overload;
    function idcliente: Integer; overload;

    function parcela(Value:Integer): ICartoes; overload;
    function parcela: Integer; overload;

    function cliente(Value: String): ICartoes; overload;
    function cliente: String; overload;

    function parcelas(Value:Integer): ICartoes; overload;
    function parcelas: Integer; overload;

    function dtvencimento(Value: TDateTime): ICartoes; overload;
    function dtvencimento: TDateTime; overload;

    function valor(Value: Currency): ICartoes; overload;
    function valor: Currency; overload;

    function origem(Value: String): ICartoes; overload;
    function origem: String; overload;

    function documento(Value:String): ICartoes; overload;
    function documento: String; overload;

    function dtconciliado(Value:TDateTime): ICartoes; overload;
    function dtconciliado: TDateTime; overload;

    function dtcadastro(Value: TDateTime): ICartoes; overload;
    function dtcadstro: TDateTime; overload;

    function usercad(Value:Integer): ICartoes; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICartoes; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICartoes; overload;
    function useralt: Integer; overload;

    function Build: IService<TCartoes>;

    function Manufacture: IServiceView;
  end;

implementation

end.
