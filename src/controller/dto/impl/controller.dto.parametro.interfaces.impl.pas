unit controller.dto.parametro.interfaces.impl;

interface

uses
  System.SysUtils,

  controller.dto.parametro.interfaces,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.parametro;

type
  TIParametro = class(TInterfacedObject, IParametro)
    private
      FEntity: TParametro;
      FService: IService<TParametro>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IParametro;

    function versaobd(Value: Integer): IParametro; overload;
    function versaobd: Integer; overload;

    function pastabkp(Value: String): IParametro; overload;
    function pastabkp: String; overload;

    function dtbackup(Value: TDateTime): IParametro; overload;
    function dtbackup: TDateTime; overload;

    function imp_bobina(Value: String): IParametro; overload;
    function imp_bobina: String; overload;

    function imp_relatorio(Value: String): IParametro; overload;
    function imp_relatorio: String; overload;

    function comp_bobina(Value: Boolean): IParametro; overload;
    function comp_bobina: Boolean; overload;

    function inibe_acre(Value: Boolean): IParametro; overload;
    function inibe_acre: Boolean; overload;

    function Build: IService<TParametro>;
  end;

implementation

{ TIParametro }

function TIParametro.Build: IService<TParametro>;
begin
  Result := FService;
end;

function TIParametro.comp_bobina(Value: Boolean): IParametro;
begin
  Result := Self;
  FEntity.comp_bobina := Value;
end;

function TIParametro.comp_bobina: Boolean;
begin
  Result := FEntity.comp_bobina;
end;

constructor TIParametro.Create;
begin
  FEntity := TParametro.Create;
  FService := TServiceORMBr<TParametro>.New(FEntity);
end;

destructor TIParametro.Destroy;
begin
  if Assigned(FEntity) then
    FreeAndNil(FEntity);
  inherited;
end;

function TIParametro.dtbackup: TDateTime;
begin
  Result := FEntity.dtbackup;
end;

function TIParametro.dtbackup(Value: TDateTime): IParametro;
begin
  Result := Self;
  FEntity.dtbackup := Value;
end;

function TIParametro.imp_bobina: String;
begin
  Result := FEntity.imp_bobina;
end;

function TIParametro.imp_bobina(Value: String): IParametro;
begin
  Result := Self;
  FEntity.imp_bobina := Value;
end;

function TIParametro.imp_relatorio(Value: String): IParametro;
begin
  Result := Self;
  FEntity.imp_relatorio := Value;
end;

function TIParametro.imp_relatorio: String;
begin
  Result := FEntity.imp_relatorio;
end;

function TIParametro.inibe_acre: Boolean;
begin
  Result := FEntity.inibe_acre;
end;

function TIParametro.inibe_acre(Value: Boolean): IParametro;
begin
  Result := Self;
  FEntity.inibe_acre := Value;
end;

class function TIParametro.New: IParametro;
begin
  Result := Self.Create;
end;

function TIParametro.pastabkp: String;
begin
  Result := FEntity.pastabkp;
end;

function TIParametro.pastabkp(Value: String): IParametro;
begin
  Result := Self;
  FEntity.pastabkp := Value;
end;

function TIParametro.versaobd(Value: Integer): IParametro;
begin
  Result := Self;
  FEntity.versaobd := Value;
end;

function TIParametro.versaobd: Integer;
begin
  Result := FEntity.versaobd;
end;

end.
