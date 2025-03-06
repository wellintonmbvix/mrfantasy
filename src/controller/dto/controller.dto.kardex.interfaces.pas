unit controller.dto.kardex.interfaces;

interface

uses
  model.kardex,
  model.service.interfaces;

type
  IKardex = interface
    ['{E752B6F3-E7ED-49FF-8477-4F3DB13FBAE4}']

    function idtbkardex(Value: Integer): IKardex; overload;
    function idtbkardex: Integer; overload;

    function idtbempresa(Value: Integer): IKardex; overload;
    function idtbempresa: Integer; overload;

    function dtmovimento(Value: TDateTime): IKardex; overload;
    function dtmovimento: TDateTime; overload;

    function documento(Value: String): IKardex; overload;
    function documento: String; overload;

    function idtbproduto(Value: Integer): IKardex; overload;
    function idtbproduto: Integer; overload;

    function tipo(Value: Integer): IKardex; overload;
    function tipo: Integer; overload;

    function qtde(Value: Integer): IKardex; overload;
    function qtde: Integer; overload;

    function usercad(Value: Integer): IKardex; overload;
    function usercad: Integer; overload;

    function Build: IService<TKardex>;
  end;

implementation

end.
