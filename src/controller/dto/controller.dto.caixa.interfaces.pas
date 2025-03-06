unit controller.dto.caixa.interfaces;

interface

uses
  model.caixa,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  ICaixa = interface
    ['{E67A255A-61BD-4268-B37C-3D3CC5F59D1A}']

    function idcaixa(Value: Integer): ICaixa; overload;
    function idcaixa: Integer; overload;

    function idtbempresa(Value: Integer): ICaixa; overload;
    function idtbempresa: Integer; overload;

    function dtemissao(Value: TDateTime): ICaixa; overload;
    function dtemissao: TDateTime; overload;

    function Setoperacao(Value: TEnumOperacao): ICaixa; overload;
    function Getoperacao: TEnumOperacao; overload;

    function origem(Value: String): ICaixa; overload;
    function origem: String; overload;

    function valor(Value: Currency): ICaixa; overload;
    function valor: Currency; overload;

    function saldo(Value: Currency): ICaixa; overload;
    function saldo: Currency; overload;

    function pdv(Value: Integer): ICaixa; overload;
    function pdv: Integer; overload;

    function documento(Value: String): ICaixa; overload;
    function documento: String; overload;

    function Setcondicao(Value: TEnumTipoMoeda): ICaixa; overload;
    function Getcondicao: TEnumTipoMoeda; overload;

    function Settpmov(Value: TEnumTipoMovimento): ICaixa; overload;
    function Gettpmov: TEnumTipoMovimento; overload;

    function cancelado(Value: Boolean): ICaixa; overload;
    function cancelado: Boolean; overload;

    function dtcadastro(Value: TDateTime): ICaixa; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICaixa; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICaixa; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICaixa; overload;
    function useralt: Integer; overload;

    function Build: IService<TCaixa>;

    function Manufacture: IServiceView;
  end;

implementation

end.
