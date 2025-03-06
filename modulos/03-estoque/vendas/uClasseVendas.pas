unit uClasseVendas;

interface

uses

  System.SysUtils,
  System.Classes,

  Data.DB,

  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  uControle,
  uRotinas,
  uGlobal;

type
  TClasseVendas = class

  protected
    FIdVenda: Integer; { * }
    FEmpresa: Integer; { * }
    FFuncionario: Integer;
    FCliente: Integer;
    FQtdeTotal: Integer;
    FTotalNota: Currency;
    FFormaPagto: String;
    FParcelas: Integer;
    FEstado: String;
    FUserCad: Integer; { * }
    FUserAlt: Integer; { * }

    // Campos dos Itens
    FItem: Integer;
    FProduto: Integer;
    FQtdeUnit: Integer;
    FValorUnit: Currency;
    FPercDesc: Currency;
    FValorDesc: Currency;
    FPercAcre: Currency;
    FValorAcre: Currency;
    FTotalItem: Currency;
    FCancelado: Boolean;
    FPrecoTab: Currency;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereAlteraNotas: Boolean;
    function InsereAlteraItens: Boolean;
    function PegarRegistro(Pdv: Integer): Integer;
    function VendaCab(Empresa, Venda, Pdv : Integer) : TFDQuery;
    function VendaItem(Empresa, Venda, Pdv : Integer) : TFDQuery;

    property IdVenda: Integer read FIdVenda write FIdVenda;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property Funcionario: Integer read FFuncionario write FFuncionario;
    property Cliente: Integer read FCliente write FCliente;
    property QtdeTotal: Integer read FQtdeTotal write FQtdeTotal;
    property TotalNota: Currency read FTotalNota write FTotalNota;
    property FormaPagto: String read FFormaPagto write FFormaPagto;
    property Parcelas: Integer read FParcelas write FParcelas;
    property Estado: String read FEstado write FEstado;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;
    property Item: Integer read FItem write FItem;
    property Produto: Integer read FProduto write FProduto;
    property QtdeUnit: Integer read FQtdeUnit write FQtdeUnit;
    property PrecoTab: Currency read FPrecoTab write FPrecoTab;
    property ValorUnit: Currency read FValorUnit write FValorUnit;
    property PercDesc: Currency read FPercDesc write FPercDesc;
    property ValorDesc: Currency read FValorDesc write FValorDesc;
    property PercAcre: Currency read FPercAcre write FPercAcre;
    property ValorAcre: Currency read FValorAcre write FValorAcre;
    property TotalItem: Currency read FTotalItem write FTotalItem;
    property Cancelado: Boolean read FCancelado write FCancelado;

  end;

implementation

{ TClasseVendas }

constructor TClasseVendas.Campos;
begin
  FIdVenda := 0;
  FEmpresa := EmpLog;
  FCliente := 0;
  FQtdeTotal := 0;
  FTotalNota := 0;
  FFormaPagto := '';
  FParcelas := 0;
  FEstado := 'A';
  FUserCad := UserLog;
  FUserAlt := UserLog;
  FItem := 1;
  FProduto := 0;
  FQtdeUnit := 0;
  FValorUnit := 0;
  FPercDesc := 0;
  FValorDesc := 0;
  FPercAcre := 0;
  FValorAcre := 0;
  FTotalItem := 0;
  FCancelado := False;
end;

constructor TClasseVendas.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseVendas.Destroy;
begin
  { Comentando código para testar velocidade se manter conectado }
  // FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseVendas.InsereAlteraItens: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('REPLACE INTO tbvendasitem(');
    SQL.Add('idtbempresa,');
    SQL.Add('idtbvendanota,');
    SQL.Add('pdv,');
    SQL.Add('item,');
    SQL.Add('idtbproduto,');
    SQL.Add('qtde,');
    SQL.Add('preco_tabela,');
    SQL.Add('valor_unit,');
    SQL.Add('perc_desc,');
    SQL.Add('valor_desc,');
    SQL.Add('perc_acre,');
    SQL.Add('valor_acre,');
    SQL.Add('valor_total,');
    SQL.Add('canc,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':idtbempresa,');
    SQL.Add(':idtbvendanota,');
    SQL.Add(':pdv,');
    SQL.Add(':item,');
    SQL.Add(':idtbproduto,');
    SQL.Add(':qtde,');
    SQL.Add(':preco_tabela,');
    SQL.Add(':valor_unit,');
    SQL.Add(':perc_desc,');
    SQL.Add(':valor_desc,');
    SQL.Add(':perc_acre,');
    SQL.Add(':valor_acre,');
    SQL.Add(':valor_total,');
    SQL.Add(':canc,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('idtbempresa').Value := Self.FEmpresa;
    ParamByName('idtbvendanota').Value := Self.FIdVenda;
    ParamByName('pdv').Value := Terminal; // Variável Global
    ParamByName('item').Value := Self.FItem;
    ParamByName('idtbproduto').Value := Self.FProduto;
    ParamByName('qtde').Value := Self.FQtdeUnit;
    ParamByName('preco_tabela').Value := Self.FPrecoTab;
    ParamByName('valor_unit').Value := Self.FValorUnit;
    ParamByName('perc_desc').Value := Self.FPercDesc;
    ParamByName('valor_desc').Value := Self.FValorDesc;
    ParamByName('perc_acre').Value := Self.FPercAcre;
    ParamByName('valor_acre').Value := Self.FValorAcre;
    ParamByName('valor_total').Value := Self.FTotalItem;
    ParamByName('canc').Value := Self.FCancelado;
    ParamByName('usercad').Value := Self.FUserCad;
    ParamByName('useralt').Value := Self.FUserAlt;

    Try
      ExecSQL;
      Result := True;
    Except
      On E: Exception Do
      Begin
        MsgErro('Erro de rotina' + #13 + E.Message);
        Result := False;
      End;
    End;
  End;
end;

function TClasseVendas.InsereAlteraNotas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('REPLACE INTO tbvendasnota(');
    SQL.Add('idtbvendanota,');
    SQL.Add('idtbempresa,');
    SQL.Add('dtemissao,');
    SQL.Add('pdv,');
    SQL.Add('idfuncionario,');

    // Se houver cliente inclui
    if Self.FCliente > 0 then
      SQL.Add('idtbcliente,');
    SQL.Add('qtde_total,');
    SQL.Add('valor_total,');
    SQL.Add('forma_pagto,');
    SQL.Add('parcelas,');
    SQL.Add('estado,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':idtbvendanota,');
    SQL.Add(':idtbempresa,');
    SQL.Add('CURDATE(),');
    SQL.Add(':pdv,');
    SQL.Add(':idfuncionario,');

    // Se houver cliente inclui
    if Self.FCliente > 0 then
      SQL.Add(':idtbcliente,');
    SQL.Add(':qtde_total,');
    SQL.Add(':valor_total,');
    SQL.Add(':forma_pagto,');
    SQL.Add(':parcelas,');
    SQL.Add(':estado,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('idtbvendanota').Value := Self.FIdVenda;
    ParamByName('idtbempresa').Value := Self.FEmpresa;
    ParamByName('pdv').Value := Terminal;
    ParamByName('idfuncionario').Value := Self.FFuncionario;

    // Se houver cliente inclui
    if Self.FCliente > 0 then
      ParamByName('idtbcliente').Value := Self.FCliente;
    ParamByName('qtde_total').Value := Self.FQtdeTotal;
    ParamByName('valor_total').Value := Self.FTotalNota;
    ParamByName('forma_pagto').Value := Self.FFormaPagto;
    ParamByName('parcelas').Value := Self.FParcelas;
    ParamByName('estado').Value := Self.FEstado;
    ParamByName('usercad').Value := Self.FUserCad;
    ParamByName('useralt').Value := Self.FUserAlt;

    Try
      ExecSQL;
      Result := True;
    Except
      On E: Exception Do
      Begin
        MsgErro('Erro de rotina' + #13 + E.Message);
        Result := False;
      End;
    End;
  End;
end;

function TClasseVendas.PegarRegistro(Pdv: Integer): Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbvendanota),0) AS registro FROM tbvendasnota');
    SQL.Add('WHERE pdv = :terminal AND idtbempresa = :empresa');
    ParamByName('terminal').Value := Pdv;
    ParamByName('empresa').Value := Self.Empresa;
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseVendas.VendaCab(Empresa, Venda, Pdv: Integer): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_vendasnota');
    SQL.Add('WHERE idtbvendanota = :venda AND idtbempresa = :empresa AND pdv = :pdv');
    ParamByName('empresa').Value := Empresa;
    ParamByName('venda').Value   := Venda;
    ParamByName('pdv').Value     := Pdv;
    Open;
    End;
  Result := FControle.SqlGeral;
end;

function TClasseVendas.VendaItem(Empresa, Venda, Pdv: Integer): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_vendasitem');
    SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
    SQL.Add('ORDER BY idtbempresa,idtbvendanota,item');
    ParamByName('empresa').Value := Empresa;
    ParamByName('venda').Value   := Venda;
    ParamByName('pdv').Value     := Pdv;
    Open;
    End;
  Result := FControle.SqlGeral;
end;

end.
