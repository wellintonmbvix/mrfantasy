unit controller.dto.ordemCab.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  FireDAC.Comp.Client,

  controller.dto.ordemCab.interfaces,

  ormbr.types.blob,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.scripts.service.interfaces.impl,
  model.scripts.service.interfaces,
  model.ordemCab,
  model.ordemItem,
  model.ordemPagto;

type
  TIOrdemMaster = class(TInterfacedObject, IOrdemMaster)
  private
    FEntity: TOrdemMaster;
    FService: IService<TOrdemMaster>;
    FServiceView: IServiceScripts;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IOrdemMaster;

    function idtbordens_cab(Value: String): IOrdemMaster; overload;
    function idtbordens_cab: String; overload;

    function idtbempresa(Value: Integer): IOrdemMaster; overload;
    function idtbempresa: Integer; overload;

    function idfuncionario(Value: Integer): IOrdemMaster; overload;
    function idfuncionario: Integer; overload;

    function idtbcliente(Value: Integer): IOrdemMaster; overload;
    function idtbcliente: Integer; overload;

    function cliente(Value: String): IOrdemMaster; overload;
    function cliente: String; overload;

    function controle(Value: Integer): IOrdemMaster; overload;
    function controle: Integer; overload;

    function dtdocumento(Value: TDateTime): IOrdemMaster; overload;
    function dtdocumento: TDateTime; overload;

    function dtretirada(Value: TDateTime): IOrdemMaster; overload;
    function dtretirada: TDateTime; overload;

    function dtdevolucao(Value: TDateTime): IOrdemMaster; overload;
    function dtdevolucao: TDateTime; overload;

    function observacao(Value: String): IOrdemMaster; overload;
    function obervacao: String; overload;

    function estado(Value: String): IOrdemMaster; overload;
    function estado: String; overload;

    function retirada(Value: String): IOrdemMaster; overload;
    function retirada: String; overload;

    function dtcadastro(Value: TDateTime): IOrdemMaster; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IOrdemMaster; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IOrdemMaster; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IOrdemMaster; overload;
    function useralt: Integer; overload;

    function ordemItem(Value: TFDMemTable): IOrdemMaster; overload;
    function ordemItem: TObjectList<TOrdemDetail>; overload;

    function ordemPagto(Value: TFDMemTable): IOrdemMaster; overload;
    function ordemPagto: TObjectList<TOrdemPayment>; overload;

    function Build: IService<TOrdemMaster>;

    function Manufacture: IServiceScripts;
  end;

implementation

{ TIOrdemCab }

function TIOrdemMaster.Build: IService<TOrdemMaster>;
begin
  Result := FService;
end;

function TIOrdemMaster.controle(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.controle := Value;
end;

function TIOrdemMaster.cliente: String;
begin
  Result := FEntity.cliente;
end;

function TIOrdemMaster.cliente(Value: String): IOrdemMaster;
begin
  Result := Self;
  FEntity.cliente := Value;
end;

function TIOrdemMaster.controle: Integer;
begin
  Result := FEntity.controle;
end;

constructor TIOrdemMaster.Create;
begin
  FEntity := TOrdemMaster.Create;
  FService := TServiceORMBr<TOrdemMaster>.New(FEntity);
  FServiceView := TServiceScripts.New;
end;

destructor TIOrdemMaster.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIOrdemMaster.dtalterado: TDateTime;
begin
  Result := FEntity.dtalterado;
end;

function TIOrdemMaster.dtalterado(Value: TDateTime): IOrdemMaster;
begin
  Result := Self;
  FEntity.dtalterado := Value;
end;

function TIOrdemMaster.dtcadastro(Value: TDateTime): IOrdemMaster;
begin
  Result := Self;
  FEntity.dtcadastro := Value;
end;

function TIOrdemMaster.dtcadastro: TDateTime;
begin
  Result := FEntity.dtcadastro;
end;

function TIOrdemMaster.dtdevolucao: TDateTime;
begin
  Result := FEntity.dtdevolucao;
end;

function TIOrdemMaster.dtdevolucao(Value: TDateTime): IOrdemMaster;
begin
  Result := Self;
  FEntity.dtdevolucao := Value;
end;

function TIOrdemMaster.dtdocumento: TDateTime;
begin
  Result := FEntity.dtdocumento;
end;

function TIOrdemMaster.dtdocumento(Value: TDateTime): IOrdemMaster;
begin
  Result := Self;
  FEntity.dtdocumento := Value;
end;

function TIOrdemMaster.dtretirada(Value: TDateTime): IOrdemMaster;
begin
  Result := Self;
  FEntity.dtretirada := Value;
end;

function TIOrdemMaster.dtretirada: TDateTime;
begin
  Result := FEntity.dtretirada;
end;

function TIOrdemMaster.estado: String;
begin
  Result := FEntity.estado;
end;

function TIOrdemMaster.estado(Value: String): IOrdemMaster;
begin
  Result := Self;
  FEntity.estado := Value;
end;

function TIOrdemMaster.idfuncionario(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.idfuncionario := Value;
end;

function TIOrdemMaster.idfuncionario: Integer;
begin
  Result := FEntity.idfuncionario;
end;

function TIOrdemMaster.idtbcliente: Integer;
begin
  Result := FEntity.idtbcliente;
end;

function TIOrdemMaster.idtbcliente(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.idtbcliente := Value;
end;

function TIOrdemMaster.idtbempresa(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.idtbempresa := Value;
end;

function TIOrdemMaster.idtbempresa: Integer;
begin
  Result := FEntity.idtbempresa;
end;

function TIOrdemMaster.idtbordens_cab: String;
begin
  Result := FEntity.idtbordens_cab;
end;

function TIOrdemMaster.Manufacture: IServiceScripts;
begin
  Result := FServiceView;
end;

function TIOrdemMaster.idtbordens_cab(Value: String): IOrdemMaster;
begin
  Result := Self;
  FEntity.idtbordens_cab := Value;
end;

class function TIOrdemMaster.New: IOrdemMaster;
begin
  Result := Self.Create;
end;

function TIOrdemMaster.obervacao: String;
begin
  Result := FEntity.observacao;
end;

function TIOrdemMaster.observacao(Value: String): IOrdemMaster;
begin
  Result := Self;
  FEntity.observacao := Value;
end;

function TIOrdemMaster.ordemItem: TObjectList<TOrdemDetail>;
begin
  Result := FEntity.ordemItem;
end;

function TIOrdemMaster.ordemItem(Value: TFDMemTable): IOrdemMaster;
begin
  Result := Self;
  With Value Do
    Begin
      First;
      if not Eof then
        repeat
          FEntity.ordemItem.Add(TOrdemDetail.Create);
          With FEntity.ordemItem.Last Do
            Begin
              // ** Deixando o ORMBr gerar o "guid" como configurado
              // ** no model.ordemItem
              // idtbordens_itens := FieldByName('idtbordens_itens').AsString;
              idtbordens_cab := FEntity.idtbordens_cab;
              idtbproduto := FieldByName('idtbproduto').AsInteger;
              item := FieldByName('Item').AsInteger;
              qtde := FieldByName('qtde').AsCurrency;
              precoTabela := FieldByName('precoTabela').AsCurrency;
              valorUnitario := FieldByName('valorUnitario').AsCurrency;
              percDesconto := FieldByName('percDesconto').AsCurrency;
              valorDesconto := FieldByName('valorDesconto').AsCurrency;
              percAcrescimo := FieldByName('percAcrescimo').AsCurrency;
              valorAcrescimo := FieldByName('valorAcrescimo').AsCurrency;
              totalBruto := FieldByName('totalBruto').AsCurrency;
              totalLiquido := FieldByName('totalLiquido').AsCurrency;
              dtretirada := FEntity.dtretirada; // Pegando do cabeçalho
              if not FieldByName('venda').AsString.Trim().IsEmpty then
                venda := FieldByName('venda').AsString
              else
                venda := EmptyStr;
              if dtretirada = Date then
                retirado := 'S'
              else
                retirado := EmptyStr;
              devolvido := FieldByName('devolvido').AsString;
              cancelado := FieldByName('cancelado').AsString;
              useralt := FEntity.usercad;
            End;
          Next;
        until Eof;
    End;

//  FEntity.ordemItem := Value;
end;

function TIOrdemMaster.ordemPagto(Value: TFDMemTable): IOrdemMaster;
begin
  Result := Self;
  With Value Do
    Begin
      First;
      if not Eof then
        repeat
          FEntity.ordemPagto.Add(TOrdemPayment.Create);
          With FEntity.ordemPagto.Last Do
            Begin
              // ** Deixando o ORMBr gerar o "guid" como configurado
              // ** no model.ordemPagto
              // idtbordens_pagto := FieldByName('idtbordens_pagto').AsString;
              idtbordens_cab := FEntity.idtbordens_cab;
              idtbformas_pagto := FieldByName('idtbformas_pagto').AsString;
              valor := FieldByName('valor').AsCurrency;
            End;
          Next;
        until Eof;
    End;

//  FEntity.ordemPagto := Value;
end;

function TIOrdemMaster.ordemPagto: TObjectList<TOrdemPayment>;
begin
  Result := FEntity.ordemPagto;
end;

function TIOrdemMaster.retirada(Value: String): IOrdemMaster;
begin
  Result := Self;
  FEntity.retirada := Value;
end;

function TIOrdemMaster.retirada: String;
begin
  Result := FEntity.retirada;
end;

function TIOrdemMaster.useralt: Integer;
begin
  Result := FEntity.useralt;
end;

function TIOrdemMaster.useralt(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.useralt := Value;
end;

function TIOrdemMaster.usercad(Value: Integer): IOrdemMaster;
begin
  Result := Self;
  FEntity.usercad := Value;
end;

function TIOrdemMaster.usercad: Integer;
begin
  Result := FEntity.usercad;
end;

end.
