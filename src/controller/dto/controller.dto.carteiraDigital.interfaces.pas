unit controller.dto.carteiraDigital.interfaces;

interface

uses
  model.carteiraDigital,

  ormbr.types.blob,
  model.service.interfaces;

type
  ICarteiraDigital = interface
    ['{9BEA79BC-83AC-4224-91F4-305895AAF9F8}']

    function idtbwallet(Value: Integer): ICarteiraDigital; overload;
    function idtbwallet: Integer; overload;

    function descricao(Value: String): ICarteiraDigital; overload;
    function descricao: String; overload;

    function dias_dep(Value: Integer): ICarteiraDigital; overload;
    function dias_dep: Integer; overload;

    function imagem(Value: TBlob): ICarteiraDigital; overload;
    function imagem: TBlob; overload;

    function dtcadastro(Value: TDateTime): ICarteiraDigital; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): ICarteiraDigital; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): ICarteiraDigital; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): ICarteiraDigital; overload;
    function useralt: Integer; overload;

    function Build: IService<TCarteiraDigital>;

  end;

implementation

end.
