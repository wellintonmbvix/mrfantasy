unit controller.dto.cartao.interfaces;

interface
uses
  model.cartoes,
  model.service.interfaces;

type
  ICartao = interface
    ['{B2A0F379-EDF6-4C69-9739-234F5C4615C5}']

    function idtbcartao(Value: Integer): ICartao; overload;
    function idtbcartao: Integer; overload;

    function idtbempresa(Value: Integer): ICartao; overload;
    function idtbempresa: Integer; overload;

    function dtemissao(Value: TDateTime): ICartao; overload;
    function dtemissao: TDateTime; overload;

    function idcliente(Value: Integer): ICartao; overload;
    function idcliente: Integer; overload;

    function parcela(Value: Integer): ICartao; overload;
    function parcela: Integer; overload;

    function parcelas(Value: Integer): ICartao; overload;
    function parcelas: Integer; overload;

    function dtvencimento(Value:  TDateTime): ICartao; overload;
    function dtvencimeto: TDateTime; overload;

    function valor(Value:  Currency): ICartao; overload;
    function valor: Currency; overload;

    function origem(Value:  String): ICartao; overload;
    function origem: String; overload;

    function documento(Value: String): ICartao; overload;
    function documento: String; overload;

    function dtconciliado(Value: TDateTime): ICartao; overload;
    function dtconciliado: TDateTime; overload;

    function dtcadastro(Value: TDateTime): ICartao; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICartao; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICartao; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICartao; overload;
    function useralt: Integer; overload;

    function Build: IService<TCartao>;
  end;

implementation

end.
