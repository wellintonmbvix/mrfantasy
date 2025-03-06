unit controller.dto.produto.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.produto.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.produto;

type
  TIProduto = class(TInterfacedObject, IProduto)
  private
    FEntity: TProduto;
    FService: IService<TProduto>;
    FServiceView: IServiceView;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IProduto;

    function idtbproduto(Value: Integer): IProduto; overload;
    function idtbproduto: Integer; overload;

    function nome(Value: String): IProduto; overload;
    function nome: String; overload;

    function descricao(Value: String): IProduto; overload;
    function descricao: String; overload;

    function foto(Value: TBlob): IProduto; overload;
    function foto: TBlob; overload;

    function vlrcusto(Value: Currency): IProduto; overload;
    function vlrcusto: Currency; overload;

    function vlrvenda(Value: Currency): IProduto; overload;
    function vlrvenda: Currency; overload;

    function vlraluguel(Value: Currency): IProduto; overload;
    function vlraluguel: Currency; overload;

    function Settipo(Value: TEnumTipoProduto): IProduto; overload;
    function Gettipo: TEnumTipoProduto; overload;

    function estoque(Value: Integer): IProduto; overload;
    function estoque: Integer; overload;

    function Setestoquemin(Value: Integer): IProduto; overload;
    function Getestoquemin: Integer; overload;

    function ativo(Value: Boolean): IProduto; overload;
    function ativo: Boolean; overload;

    function itemvenda(Value: String): IProduto; overload;
    function itemvenda: String; overload;

    function dtcadastro(Value: TDateTime): IProduto; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IProduto; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IProduto; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IProduto; overload;
    function useralt: Integer; overload;

    function Build: IService<TProduto>;

    function Manufacture: IServiceView;
  end;

implementation

{ TIProduto }

function TIProduto.ativo(Value: Boolean): IProduto;
begin
  Result := Self;
  FEntity.ativo := Value;
end;

function TIProduto.ativo: Boolean;
begin
  Result := FEntity.ativo;
end;

function TIProduto.Build: IService<TProduto>;
begin
  Result := FService;
end;

constructor TIProduto.Create;
begin
  FEntity := TProduto.Create;
  FService := TServiceORMBr<TProduto>.New(FEntity);
  FServiceView := TServiceView.New;
end;

function TIProduto.descricao: String;
begin
  Result := FEntity.descricao;
end;

function TIProduto.descricao(Value: String): IProduto;
begin
  Result := Self;
  FEntity.descricao := Value;
end;

destructor TIProduto.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIProduto.dtalterado(Value: TDateTime): IProduto;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIProduto.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIProduto.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIProduto.dtcadastro(Value: TDateTime): IProduto;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIProduto.estoque(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.estoque := Value;
end;

function TIProduto.estoque: Integer;
begin
  Result := FEntity.estoque;
end;

function TIProduto.Getestoquemin: Integer;
begin
  Result := FEntity.estoquemin;
end;

function TIProduto.Setestoquemin(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.estoquemin := Value;
end;

function TIProduto.foto(Value: TBlob): IProduto;
begin
  Result := Self;
  FEntity.foto := Value;
end;

function TIProduto.foto: TBlob;
begin
  Result := FEntity.foto;
end;

function TIProduto.idtbproduto(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.idtbproduto := Value;
end;

function TIProduto.idtbproduto: Integer;
begin
  Result := FEntity.idtbproduto;
end;

function TIProduto.itemvenda(Value: String): IProduto;
begin
  Result := Self;
  FEntity.itemvenda := Value;
end;

function TIProduto.itemvenda: String;
begin
  Result := FEntity.itemvenda;
end;

function TIProduto.Manufacture: IServiceView;
begin
  Result := FServiceView;
end;

class function TIProduto.New: IProduto;
begin
  Result := Self.Create;
end;

function TIProduto.nome: String;
begin
  Result := FEntity.nome;
end;

function TIProduto.nome(Value: String): IProduto;
begin
  Result := Self;
  FEntity.nome := Value;
end;

function TIProduto.Gettipo: TEnumTipoProduto;
begin
  Result := FEntity.tipo;
end;

function TIProduto.Settipo(Value: TEnumTipoProduto): IProduto;
begin
  Result := Self;
  FEntity.tipo := Value;
end;

function TIProduto.useralt(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIProduto.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIProduto.usercad(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIProduto.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

function TIProduto.vlraluguel: Currency;
begin
  Result := FEntity.vlraluguel;
end;

function TIProduto.vlraluguel(Value: Currency): IProduto;
begin
  Result := Self;
  FEntity.vlraluguel := Value;
end;

function TIProduto.vlrcusto: Currency;
begin
  Result := FEntity.vlrcusto;
end;

function TIProduto.vlrcusto(Value: Currency): IProduto;
begin
  Result := Self;
  FEntity.vlrcusto := Value;
end;

function TIProduto.vlrvenda(Value: Currency): IProduto;
begin
  Result := Self;
  FEntity.vlrvenda := Value;
end;

function TIProduto.vlrvenda: Currency;
begin
  Result := FEntity.vlrvenda;
end;

end.
