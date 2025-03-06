unit uClasseCartoes;

interface

uses

  System.SysUtils,
  System.Classes,

  Data.DB,

  FireDAC.Stan.Param,

  uControle,
  uRotinas,
  uGlobal;

type

  TClasseCartoes = class

  protected
    FIdCartao: Integer;
    FEmpresa: Integer;
    FDtEmissao: TDateTime;
    FIdCliente: Integer;
    FParcela: Integer;
    FParcelas: Integer;
    FDtVencto: TDateTime;
    FDtConciliado: TDateTime;
    FValor: Currency;
    FOrigem: String;
    FDocumento: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereCartoes: Boolean;
    function AlteraCartoes: Boolean;
    function ExcluiCartoes: Boolean;
    function Localiza(Emissao, Vencto: TDate; Empresa, RegDe, RegAte: Integer)
      : TClasseCartoes;
    function CarregaDados(Codigo: Integer): TClasseCartoes;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;

    //
    property IdCartao: Integer read FIdCartao write FIdCartao;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property DtEmissao: TDateTime read FDtEmissao write FDtEmissao;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property Parcela: Integer read FParcela write FParcela;
    property Parcelas: Integer read FParcelas write FParcelas;
    property DtVencto: TDateTime read FDtVencto write FDtVencto;
    property DtConciliado: TDateTime read FDtConciliado write FDtConciliado;
    property Valor: Currency read FValor write FValor;
    property Origem: String read FOrigem write FOrigem;
    property Documento: String read FDocumento write FDocumento;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ TClasseCartoes }

function TClasseCartoes.AlteraCartoes: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbcartoes SET');
    SQL.Add('dtemissao=:dtemissao,');
    SQL.Add('idcliente=:idcliente,');
    SQL.Add('parcela=:parcela,');
    SQL.Add('parcelas=:parcelas,');
    SQL.Add('dtvencimento=:dtvencimento,');
    SQL.Add('valor=:valor,');
    SQL.Add('origem=:origem,');
    SQL.Add('documento=:documento,');
    SQL.Add('useralt=:useralt');
    SQL.Add('WHERE idtbcartao=:codigo AND idtbempresa=:empresa');
    ParamByName('dtemissao').Value := Self.FDtEmissao;
    ParamByName('idcliente').Value := Self.FIdCliente;
    ParamByName('parcela').Value := Self.FParcela;
    ParamByName('parcelas').Value := Self.FParcelas;
    ParamByName('dtvencimento').Value := Self.FDtVencto;
    ParamByName('valor').Value := Self.FValor;
    ParamByName('origem').Value := Self.FOrigem;
    ParamByName('documento').Value := Self.FDocumento;
    ParamByName('useralt').Value := Self.FUserAlt;
    ParamByName('codigo').Value := Self.FIdCartao;
    ParamByName('empresa').Value := Self.FEmpresa;

    try
      ExecSQL;
      Result := True;
      MsgInformacao('Gravação realizada com sucesso');
    except
      On E: Exception Do
      Begin
        Result := False;
        MsgErro('Erro na gravação: ' + E.Message);
      End;
    end;
  End;
end;

constructor TClasseCartoes.Campos;
begin
  FIdCartao := 0;
  FEmpresa := EmpLog;
  FDtEmissao := Date;
  FIdCliente := 0;
  FParcela := 1;
  FParcelas := 1;
  FDtVencto := Date;
  FDtConciliado := 1264432305 / 100000;
  FValor := 0;
  FOrigem := '';
  FDocumento := '';
  FUserCad := UserLog;
  FUserAlt := UserLog;
end;

function TClasseCartoes.CarregaDados(Codigo: Integer): TClasseCartoes;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbcartoes');
    SQL.Add('WHERE idtbcartao = :idtbcartao ORDER BY idtbcartao');
    ParamByName('idtbcartao').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Self.FIdCartao := 0;
    End
    Else
    Begin
      Self.FIdCartao := FieldByName('idtbcartao').Value;
      Self.FEmpresa := FieldByName('idtbempresa').Value;
      Self.FDtEmissao := FieldByName('dtemissao').Value;
      if Not FieldByName('idcliente').IsNull then
        Self.FIdCliente := FieldByName('idcliente').Value
      else
        Self.FIdCliente := 0;
      Self.FParcela := FieldByName('parcela').Value;
      Self.FParcelas := FieldByName('parcelas').Value;
      Self.FDtVencto := FieldByName('dtvencimento').Value;
      if Not FieldByName('dtconciliado').IsNull then
        Self.FDtConciliado := FieldByName('dtconciliado').Value;
      Self.FValor := FieldByName('valor').Value;
      Self.FOrigem := FieldByName('origem').Value;
      Self.FDocumento := FieldByName('documento').Value;
      Self.FUserCad := FieldByName('usercad').Value;
      Self.FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseCartoes.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseCartoes.Destroy;
begin
  { Comentando código para testar velocidade se manter conectado }
  // FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseCartoes.ExcluiCartoes: Boolean;
begin
  // Carregando dados para testar origem
  CarregaDados(Self.FIdCartao);
  if Self.FOrigem <> 'D' then
  Begin
    MsgErro('Registro de origem Reserva ou Venda.' + #13 +
      'Exclusão não permitida');
    Abort;
  End;

  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbcartoes');
    SQL.Add('WHERE idtbcartao = :idtbcartao');
    ParamByName('idtbcartao').Value := Self.FIdCartao;

    try
      ExecSQL;
      Result := True;
    except
      On E: Exception Do
      Begin
        Result := False;
        MsgErro('Erro de exclusão: ' + E.Message);
      End;
    end;
  End;
end;

function TClasseCartoes.InsereCartoes: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbcartoes(');
    SQL.Add('idtbempresa,');
    SQL.Add('dtemissao,');
    SQL.Add('idcliente,');
    SQL.Add('parcela,');
    SQL.Add('parcelas,');
    SQL.Add('dtvencimento,');
    SQL.Add('valor,');
    SQL.Add('origem,');
    SQL.Add('documento,');
    SQL.Add('usercad');
    SQL.Add(')VALUES(');
    SQL.Add(':idtbempresa,');
    SQL.Add(':dtemissao,');
    SQL.Add(':idcliente,');
    SQL.Add(':parcela,');
    SQL.Add(':parcelas,');
    SQL.Add(':dtvencimento,');
    SQL.Add(':valor,');
    SQL.Add(':origem,');
    SQL.Add(':documento,');
    SQL.Add(':usercad)');
    ParamByName('idtbempresa').Value := Self.FEmpresa;
    ParamByName('dtemissao').Value := Self.FDtEmissao;
    ParamByName('idcliente').Value := Self.FIdCliente;
    ParamByName('parcela').Value := Self.FParcela;
    ParamByName('parcelas').Value := Self.FParcelas;
    ParamByName('dtvencimento').Value := Self.FDtVencto;
    ParamByName('valor').Value := Self.FValor;
    ParamByName('origem').Value := Self.FOrigem;
    ParamByName('documento').Value := Self.FDocumento;
    ParamByName('usercad').Value := Self.FUserCad;

    try
      ExecSQL;
      Result := True;
      MsgInformacao('Gravação realizada com sucesso');
    except
      On E: Exception Do
      Begin
        Result := False;
        MsgErro('Erro na gravação: ' + E.Message);
      End;
    end;
  End;
end;

function TClasseCartoes.Localiza(Emissao, Vencto: TDate;
  Empresa, RegDe, RegAte: Integer): TClasseCartoes;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_cartoes');
    SQL.Add('WHERE date(dtemissao) >= :dtemissao');
    SQL.Add('AND date(dtvencimento) <= :dtvencimento');
    SQL.Add('AND idtbempresa = :empresa');
    SQL.Add('ORDER BY idtbcartao');
    SQL.Add('LIMIT :regde,:regate');
    ParamByName('dtemissao').AsDate    := Emissao;
    ParamByName('dtvencimento').AsDate := Vencto;
    ParamByName('regde').Value         := RegDe;
    ParamByName('regate').Value        := RegAte;
    ParamByName('empresa').Value       := Empresa;
    Open;
    TNumericField(FieldByName('idtbcartao')).DisplayFormat := '000000';
    TNumericField(FieldByName('idtbcartao')).Alignment := taCenter;
    TNumericField(FieldByName('idtbempresa')).DisplayFormat := '00';
    TNumericField(FieldByName('idtbempresa')).Alignment := taCenter;
    TNumericField(FieldByName('valor')).DisplayFormat := '###,##0.00';
  End;
end;

function TClasseCartoes.PegarRegistro: Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbcartao),0) AS registro FROM tbcartoes WHERE idtbempresa = :empresa');
    ParamByName('empresa').Value := Empresa;
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseCartoes.ValidaCampos: Boolean;
begin
  Result := False;
  if FValor = 0 then
  Begin
    MsgAviso('Favor informar o Valor da parcela do cartão');
    Exit;
  End;
  Result := True;
end;

end.
