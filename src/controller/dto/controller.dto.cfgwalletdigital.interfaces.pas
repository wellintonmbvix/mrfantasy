unit controller.dto.cfgwalletdigital.interfaces;

interface

uses
  model.cfgwalletsdigital,

  ormbr.types.blob,
  model.service.interfaces;

type
  ICfgWalletDigital = interface
    ['{9BEA79BC-83AC-4224-91F4-305895AAF9F8}']

    function idtbwallet(Value: Integer): ICfgWalletDigital; overload;
    function idtbwallet: Integer; overload;

    function descricao(Value: String): ICfgWalletDigital; overload;
    function descricao: String; overload;

    function dias_dep(Value: Integer): ICfgWalletDigital; overload;
    function dias_dep: Integer; overload;

    function imagem(Value: TBlob): ICfgWalletDigital; overload;
    function imagem: TBlob; overload;

    function dtcadastro(Value: TDateTime): ICfgWalletDigital; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICfgWalletDigital; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICfgWalletDigital; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICfgWalletDigital; overload;
    function useralt: Integer; overload;

    function Build: IService<TCfgWalletDigital>;

  end;

implementation

end.
