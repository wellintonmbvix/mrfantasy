unit controller.dto.caixa.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.caixa.interfaces,

  uRotinas,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.caixa;

type
  TICaixa = class(TInterfacedObject, ICaixa)
  private
    FEntity: TCaixa;
    FService: IService<TCaixa>;
    FServiceView: IServiceView;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICaixa;

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

{ TICaixa }

function TICaixa.Build: IService<TCaixa>;
begin
  Result := FService;
end;

function TICaixa.cancelado(Value: Boolean): ICaixa;
begin
  Result := Self;
  FEntity.cancelado := Value;
end;

function TICaixa.cancelado: Boolean;
begin
  Result := FEntity.cancelado;
end;

function TICaixa.Getcondicao: TEnumTipoMoeda;
begin
  Result := FEntity.condicao;
end;

function TICaixa.Setcondicao(Value: TEnumTipoMoeda): ICaixa;
begin
  Result := Self;
  FEntity.condicao := Value;
end;

constructor TICaixa.Create;
begin
  FEntity := TCaixa.Create;
  FService := TServiceORMBr<TCaixa>.New(FEntity);
  FServiceView := TServiceView.New;
end;

destructor TICaixa.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TICaixa.documento: String;
begin
  Result := FEntity.documento;
end;

function TICaixa.documento(Value: String): ICaixa;
begin
  Result := Self;
  FEntity.documento := Value;
end;

function TICaixa.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TICaixa.dtalterado(Value: TDateTime): ICaixa;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TICaixa.dtcadastro(Value: TDateTime): ICaixa;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TICaixa.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TICaixa.dtemissao(Value: TDateTime): ICaixa;
begin
  Result := Self;
  FEntity.dtemissao := Value;
end;

function TICaixa.dtemissao: TDateTime;
begin
  Result := FEntity.dtemissao;
end;

function TICaixa.Manufacture: IServiceView;
begin
  Result := FServiceView;
end;

function TICaixa.idcaixa: Integer;
begin
  Result := FEntity.idcaixa;
end;

function TICaixa.idcaixa(Value: Integer): ICaixa;
begin
  Result := Self;
  FEntity.idcaixa := Value;
end;

function TICaixa.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TICaixa.idtbempresa(Value: Integer): ICaixa;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

class function TICaixa.New: ICaixa;
begin
  Result := Self.Create;
end;

function TICaixa.Setoperacao(Value: TEnumOperacao): ICaixa;
begin
  Result := Self;
  FEntity.operacao := Value;
end;

function TICaixa.Getoperacao: TEnumOperacao;
begin
  Result := FEntity.operacao;
end;

function TICaixa.origem: String;
begin
  Result := FEntity.origem;
end;

function TICaixa.origem(Value: String): ICaixa;
begin
  Result := Self;
  FEntity.origem := Value;
end;

function TICaixa.pdv: Integer;
begin
  Result := FEntity.pdv;
end;

function TICaixa.pdv(Value: Integer): ICaixa;
begin
  Result := Self;
  FEntity.pdv := Value;
end;

function TICaixa.saldo: Currency;
begin
  Result := FEntity.saldo;
end;

function TICaixa.saldo(Value: Currency): ICaixa;
begin
  Result := Self;
  FEntity.saldo := Value;
end;

function TICaixa.Settpmov(Value: TEnumTipoMovimento): ICaixa;
begin
  Result := Self;
  FEntity.tpmov := Value;
end;

function TICaixa.Gettpmov: TEnumTipoMovimento;
begin
  Result := FEntity.tpmov;
end;

function TICaixa.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TICaixa.useralt(Value: Integer): ICaixa;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TICaixa.usercad(Value: Integer): ICaixa;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TICaixa.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

function TICaixa.valor(Value: Currency): ICaixa;
begin
  Result := Self;
  FEntity.valor := Value;
  if FEntity.valor <= 0 then
    begin
      MsgAviso('Campo valor não pode ser igual ou menor a zero!');
      Abort;
    end;
end;

function TICaixa.valor: Currency;
begin
  Result := FEntity.valor;
end;

end.
