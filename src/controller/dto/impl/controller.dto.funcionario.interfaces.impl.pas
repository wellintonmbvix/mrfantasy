unit controller.dto.funcionario.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.funcionario.interfaces,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.funcionario;

type
  TIFuncionario = class(TInterfacedObject, IFuncionario)
  private
    FEntity: TFuncionario;
    FService: IService<TFuncionario>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IFuncionario;

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

{ TIFuncionario }

function TIFuncionario.abreviatura: String;
begin
  Result := FEntity.abreviatura;
end;

function TIFuncionario.abreviatura(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.abreviatura := Value;
end;

function TIFuncionario.bairro: String;
begin
  Result := FEntity.bairro;
end;

function TIFuncionario.bairro(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.bairro := Value;
end;

function TIFuncionario.Build: IService<TFuncionario>;
begin
  Result := FService;
end;

function TIFuncionario.cep: String;
begin
  Result := FEntity.cep;
end;

function TIFuncionario.cep(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.cep := Value;
end;

function TIFuncionario.cidade: String;
begin
  Result := FEntity.cidade;
end;

function TIFuncionario.cidade(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.cidade := Value;
end;

function TIFuncionario.codigo(Value: Integer): IFuncionario;
begin
  Result := Self;
  FEntity.codigo := Value;
end;

function TIFuncionario.codigo: Integer;
begin
  Result := FEntity.codigo;
end;

function TIFuncionario.comp(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.comp := Value;
end;

function TIFuncionario.comp: String;
begin
  Result := FEntity.comp;
end;

function TIFuncionario.cpf: String;
begin
  Result := FEntity.cpf;
end;

function TIFuncionario.cpf(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.cpf := Value;
end;

constructor TIFuncionario.Create;
begin
  FEntity := TFuncionario.Create;
  FService := TServiceORMBr<TFuncionario>.New(FEntity);
end;

destructor TIFuncionario.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIFuncionario.dtadmissao(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.dtadmissao := Value;
end;

function TIFuncionario.dtadmissao: String;
begin
  Result := FEntity.dtadmissao;
end;

function TIFuncionario.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIFuncionario.dtalterado(Value: TDateTime): IFuncionario;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIFuncionario.dtcadastro(Value: TDateTime): IFuncionario;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIFuncionario.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIFuncionario.dtdemissao: String;
begin
  Result := FEntity.dtdemissao;
end;

function TIFuncionario.dtdemissao(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.dtdemissao := Value;
end;

function TIFuncionario.endereco: String;
begin
  Result := FEntity.endereco;
end;

function TIFuncionario.endereco(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.endereco := Value;
end;

function TIFuncionario.fone1: String;
begin
  Result := FEntity.fone1;
end;

function TIFuncionario.fone1(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.fone1 := Value;
end;

function TIFuncionario.fone2(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.fone2 := Value;
end;

function TIFuncionario.fone2: String;
begin
  Result := FEntity.fone2;
end;

function TIFuncionario.funcao(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.funcao := Value;
end;

function TIFuncionario.funcao: String;
begin
  Result := FEntity.funcao;
end;

function TIFuncionario.idtbfuncionario(Value: Integer): IFuncionario;
begin
  Result := Self;
  FEntity.idtbfuncionario := Value;
end;

function TIFuncionario.idtbfuncionario: Integer;
begin
  Result := FEntity.idtbfuncionario;
end;

class function TIFuncionario.New: IFuncionario;
begin
  Result := Self.Create;
end;

function TIFuncionario.nome(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.nome := Value;
end;

function TIFuncionario.nome: String;
begin
  Result := FEntity.nome;
end;

function TIFuncionario.nro: String;
begin
  Result := FEntity.nro;
end;

function TIFuncionario.nro(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.nro := Value;
end;

function TIFuncionario.rg(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.rg := Value;
end;

function TIFuncionario.rg: String;
begin
  Result := FEntity.rg;
end;

function TIFuncionario.uf(Value: String): IFuncionario;
begin
  Result := Self;
  FEntity.uf := Value;
end;

function TIFuncionario.uf: String;
begin
  Result := FEntity.uf;
end;

function TIFuncionario.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIFuncionario.useralt(Value: Integer): IFuncionario;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIFuncionario.usercad(Value: Integer): IFuncionario;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIFuncionario.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
