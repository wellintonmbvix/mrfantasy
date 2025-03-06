unit controller.dto.usuario.interfaces;

interface

uses
  System.Generics.Collections,

  model.usuario,
  model.acesso,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces;

type
  IUsuario = interface
    ['{E25CB5F8-E2C4-41FA-8CF2-8803DB2FBE2B}']

    function idtbusuario(Value: Integer): IUsuario; overload;
    function idtbusuario: Integer; overload;

    function username(Value: String): IUsuario; overload;
    function username: String; overload;

    function password(Value: String): IUsuario; overload;
    function password: String; overload;

    function dtcadastro(Value: TDateTime): IUsuario; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IUsuario; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IUsuario; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IUsuario; overload;
    function useralt: Integer; overload;

    function acesso(Value: TObjectList<TAcesso>): IUsuario; overload;
    function acesso: TObjectList<TAcesso>; overload;

    function Build: IService<Tusuario>;
  end;

implementation

end.
