unit controller.dto.usuario.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.usuario.interfaces,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.acesso,
  model.usuario;

type
  TIUsuario = class(TInterfacedObject, IUsuario)
  private
    FEntity: Tusuario;
    FService: IService<Tusuario>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IUsuario;

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

{ TIUsuario }

function TIUsuario.acesso(Value: TObjectList<TAcesso>): IUsuario;
begin
  Result := Self;
  FEntity.acesso := Value;
end;

function TIUsuario.acesso: TObjectList<TAcesso>;
begin
  Result := FEntity.acesso;
end;

function TIUsuario.Build: IService<Tusuario>;
begin
  Result := FService;
end;

constructor TIUsuario.Create;
begin
  FEntity := Tusuario.Create;
  FService := TServiceORMBr<Tusuario>.New(FEntity);
end;

destructor TIUsuario.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIUsuario.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIUsuario.dtalterado(Value: TDateTime): IUsuario;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIUsuario.dtcadastro(Value: TDateTime): IUsuario;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIUsuario.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIUsuario.idtbusuario: Integer;
begin
  Result := FEntity.idtbusuario;
end;

function TIUsuario.idtbusuario(Value: Integer): IUsuario;
begin
  Result := Self;
  FEntity.idtbusuario := Value;
end;

class function TIUsuario.New: IUsuario;
begin
  Result := Self.Create;
end;

function TIUsuario.password(Value: String): IUsuario;
begin
  Result := Self;
  FEntity.password := Value;
end;

function TIUsuario.password: String;
begin
  Result := FEntity.password;
end;

function TIUsuario.useralt(Value: Integer): IUsuario;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIUsuario.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIUsuario.usercad(Value: Integer): IUsuario;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIUsuario.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

function TIUsuario.username(Value: String): IUsuario;
begin
  Result := Self;
  FEntity.username := Value;
end;

function TIUsuario.username: String;
begin
  Result := FEntity.username;
end;

end.
