unit uClasseCaixas;

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

  TClasseCaixas = class

  protected
    FIdCaixa: Integer;
    FEmpresa: Integer;
    FDtEmissao: TDateTime;
    FOperacao: String;
    FOrigem: String;
    FValor: Currency;
    FSaldo: Currency;
    FDocumento: String;
    FCondicao: String;
    FTipo: String;
    FCancelado: Boolean;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereCaixas: Boolean;
    function AlteraCaixas: Boolean;
    function ExcluiCaixas: Boolean;
    function Localiza(Emissao: TDate): TClasseCaixas;
    function CarregaDados(Codigo: Integer): TClasseCaixas;
    function PegarRegistro(Usuario, Empresa: Integer): Integer;
    function ValidaCampos: Boolean;

    //
    property IdCaixa: Integer read FIdCaixa write FIdCaixa;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property DtEmissao: TDateTime read FDtEmissao write FDtEmissao;
    property Operacao: String read FOperacao write FOperacao;
    property Origem: String read FOrigem write FOrigem;
    property Valor: Currency read FValor write FValor;
    property Saldo: Currency read FSaldo write FSaldo;
    property Documento: String read FDocumento write FDocumento;
    property Condicao: String read FCondicao write FCondicao;
    property Tipo: String read FTipo write FTipo;
    property Cancelado: Boolean read FCancelado write FCancelado;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ TClasseCaixas }

function TClasseCaixas.AlteraCaixas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbcaixa SET');
    SQL.Add('operacao = :operacao,');
    SQL.Add('valor = :valor,');
    // SQL.Add('saldo = :saldo,'); {Calculo está sendo feito no banco}
    SQL.Add('documento = :documento,');
    SQL.Add('tpmov = :tpmov,');
    SQL.Add('useralt = :useralt');
    SQL.Add('WHERE idcaixa = :idcaixa');
    ParamByName('operacao').Value := Self.FOperacao;
    ParamByName('valor').Value := Self.FValor;
    // ParamByName('saldo').Value     := Self.FSaldo;
    ParamByName('documento').Value := Self.FDocumento;
    ParamByName('tpmov').Value := Self.FTipo;
    ParamByName('useralt').Value := Self.FUserAlt;
    ParamByName('idcaixa').Value := Self.FIdCaixa;

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

constructor TClasseCaixas.Campos;
begin
  Self.FIdCaixa := 0;
  Self.FEmpresa := 0;
  Self.FDtEmissao := Now();
  Self.FOperacao := '';
  Self.FOrigem := '';
  Self.FValor := 0;
  Self.FSaldo := 0;
  Self.FDocumento := '';
  Self.FCondicao := '';
  Self.FTipo := '';
  Self.FCancelado := False;
  Self.FUserCad := UserLog;
  Self.FUserAlt := UserLog;
end;

function TClasseCaixas.CarregaDados(Codigo: Integer): TClasseCaixas;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbcaixa');
    SQL.Add('WHERE idcaixa = :idcaixa ORDER BY idcaixa');
    ParamByName('idcaixa').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Self.FIdCaixa := 0;
    End
    Else
    Begin
      Self.FIdCaixa := FieldByName('idcaixa').Value;
      Self.FEmpresa := FieldByName('idtbempresa').Value;
      Self.FDtEmissao := FieldByName('dtemissao').Value;
      Self.FOperacao := FieldByName('operacao').AsString;
      Self.FOrigem := FieldByName('origem').AsString;
      Self.FValor := FieldByName('valor').Value;
      Self.FSaldo := FieldByName('saldo').Value;
      Self.FDocumento := FieldByName('documento').AsString;
      Self.FCondicao := FieldByName('condicao').AsString;
      Self.FTipo := FieldByName('tpmov').AsString;
      Self.FCancelado := FieldByName('cancelado').AsBoolean;
      Self.FUserCad := FieldByName('usercad').Value;
      Self.FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseCaixas.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseCaixas.Destroy;
begin
  { Comentando código para testar velocidade se manter conectado }
  // FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseCaixas.ExcluiCaixas: Boolean;
begin
  // Carregando dados para testar origem
  CarregaDados(Self.FIdCaixa);
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
    SQL.Add('DELETE FROM tbcaixa');
    SQL.Add('WHERE idcaixa = :idcaixa');
    ParamByName('idcaixa').Value := Self.FIdCaixa;

    try
      ExecSQL;
      Result := True;
    except
      On E: Exception Do
      Begin
        Result := False;
        MsgErro('Erro na gravação: ' + E.Message);
      End;
    end;
  End;
end;

function TClasseCaixas.InsereCaixas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbcaixa(');
    SQL.Add('idtbempresa,');
    SQL.Add('operacao,');
    SQL.Add('origem,');
    SQL.Add('valor,');
    // SQL.Add('saldo,'); {Calculo está sendo feito no banco}
    SQL.Add('documento,');
    SQL.Add('condicao,');
    SQL.Add('tpmov,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':idtbempresa,');
    SQL.Add(':operacao,');
    SQL.Add(':origem,');
    SQL.Add(':valor,');
    // SQL.Add(':saldo,');
    SQL.Add(':documento,');
    SQL.Add(':condicao,');
    SQL.Add(':tpmov,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('idtbempresa').Value := Self.FEmpresa;
    ParamByName('operacao').Value := Self.FOperacao;
    ParamByName('origem').Value := Self.FOrigem;
    ParamByName('valor').Value := Self.FValor;
    // ParamByName('saldo').Value       := Self.FSaldo;
    ParamByName('documento').Value := Self.FDocumento;
    ParamByName('condicao').Value := Self.FCondicao;
    ParamByName('tpmov').Value := Self.FTipo;
    ParamByName('usercad').Value := Self.FUserCad;
    ParamByName('useralt').Value := Self.FUserAlt;

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

function TClasseCaixas.Localiza(Emissao: TDate): TClasseCaixas;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbcaixa');
    SQL.Add('WHERE date(dtemissao) = :emissao');
    ParamByName('emissao').Value := Emissao;
    Open;
    TNumericField(FieldByName('idcaixa')).DisplayFormat := '00';
    TNumericField(FieldByName('idcaixa')).Alignment := taCenter;
  End;
end;

function TClasseCaixas.PegarRegistro(Usuario, Empresa: Integer): Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idcaixa),0) AS registro FROM tbcaixa WHERE idtbempresa = :empresa');
    ParamByName('empresa').Value := Empresa;
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseCaixas.ValidaCampos: Boolean;
begin
  if Self.FDocumento = EmptyStr then
  Begin
    MsgAviso('Documento não foi preenchido');
    Abort;
  End;

  if Self.FValor = 0 then
  Begin
    MsgAviso('Valor não foi preenchido');
    Abort;
  End;

  Result := True;
end;

end.
