unit uClasseClientes;

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

  TClasseClientes = class

  protected
    FCliente: Integer;
    FEmpresa: Integer;
    FCnpjCpf: String;
    FNome: String;
    FRgInsc: String;
    FEndereco: String;
    FNro: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FCep: String;
    FUf: String;
    FDtNascimento: String;
    FFone1: String;
    FFone2: String;
    FEmail: String;
    FObs: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereClientes: Boolean;
    function AlteraClientes: Boolean;
    function ExcluiClientes: Boolean;
    function CarregaDados(Codigo: Integer): TClasseClientes;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;
    function HouveMovimento: Boolean;

    //
    property Cliente: Integer read FCliente write FCliente;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property CnpjCpf: String read FCnpjCpf write FCnpjCpf;
    property Nome: String read FNome write FNome;
    property RgInsc: String read FRgInsc write FRgInsc;
    property Endereco: String read FEndereco write FEndereco;
    property Nro: String read FNro write FNro;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property Cep: String read FCep write FCep;
    property Uf: String read FUf write FUf;
    property DtNascimento: String read FDtNascimento write FDtNascimento;
    property Fone1: String read FFone1 write FFone1;
    property Fone2: String read FFone2 write FFone2;
    property Email: String read FEmail write FEmail;
    property Obs: String read FObs write FObs;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ TClasseClientes }

function TClasseClientes.AlteraClientes: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbclientes SET');
    SQL.Add('cpf_cnpj = :cpf_cnpj,');
    SQL.Add('nome = :nome,');
    SQL.Add('rg_insc = :rg_insc,');
    SQL.Add('endereco = :endereco,');
    SQL.Add('nro = :nro,');
    SQL.Add('comp = :comp,');
    SQL.Add('bairro = :bairro,');
    SQL.Add('cidade = :cidade,');
    SQL.Add('cep = :cep,');
    SQL.Add('uf = :uf,');
    SQL.Add('dtnascimento = :dtnascimento,');
    SQL.Add('fone1 = :fone1,');
    SQL.Add('fone2 = :fone2,');
    SQL.Add('email = :email,');
    SQL.Add('obs = :obs,');
    SQL.Add('useralt = :useralt');
    SQL.Add('WHERE idtbcliente = :cliente');
    ParamByName('cpf_cnpj').Value := Self.FCnpjCpf;
    ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
    ParamByName('rg_insc').Value := Self.FRgInsc;
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('comp').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('dtnascimento').Value := Self.FDtNascimento;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.FFone2;
    ParamByName('email').Value := Self.FEmail;
    ParamByName('obs').Value := Self.FObs;
    ParamByName('useralt').Value := Self.FUserAlt;
    ParamByName('cliente').Value := Self.FCliente;

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

constructor TClasseClientes.Campos;
begin
  FCliente := 0;
  FEmpresa := 0;
  FCnpjCpf := '';
  FNome := '';
  FRgInsc := '';
  FEndereco := '';
  FNro := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FCep := '';
  FUf := '';
  FDtNascimento := '';
  FFone1 := '';
  FFone2 := '';
  FEmail := '';
  FObs := '';
  FUserCad := UserLog;
  FUserAlt := UserLog;
end;

function TClasseClientes.CarregaDados(Codigo: Integer): TClasseClientes;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbclientes');
    SQL.Add('WHERE idtbcliente = :cliente ORDER BY idtbcliente');
    ParamByName('cliente').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Self.FCliente := 0;
    End
    Else
    Begin
      FCliente := FieldByName('idtbcliente').Value;
      FEmpresa := FieldByName('idtbempresa').Value;
      FCnpjCpf := FieldByName('cpf_cnpj').AsString;
      FNome := FieldByName('nome').AsString;
      FRgInsc := FieldByName('rg_insc').AsString;
      FEndereco := FieldByName('endereco').AsString;
      FNro := FieldByName('nro').AsString;
      FComplemento := FieldByName('comp').AsString;
      FBairro := FieldByName('bairro').AsString;
      FCidade := FieldByName('cidade').AsString;
      FCep := FieldByName('cep').AsString;
      FUf := FieldByName('uf').AsString;
      FDtNascimento := FieldByName('dtnascimento').AsString;
      FFone1 := FieldByName('fone1').AsString;
      FFone2 := FieldByName('fone2').AsString;
      FEmail := FieldByName('email').AsString;
      FObs := FieldByName('obs').AsString;
      FUserCad := FieldByName('usercad').Value;
      FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseClientes.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseClientes.Destroy;
begin
  { Comentando código para testar velocidade se manter conectado }
  // FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseClientes.ExcluiClientes: Boolean;
begin
  // Carregando dados para testar movimento
  CarregaDados(Self.FCliente);
  if HouveMovimento then
  Begin
    MsgAviso('Exclusão não permitida pelo fato do cliente já ter histórico');
    Abort;
  End;
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbclientes');
    SQL.Add('WHERE idtbcliente = :cliente');
    ParamByName('cliente').Value := Self.FCliente;

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

function TClasseClientes.HouveMovimento: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS registros FROM tbvendasnota');
    SQL.Add('WHERE idtbcliente = :cliente');
    ParamByName('cliente').Value := Self.FCliente;
    Open;
    if FieldByName('registros').Value = 0 then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS registros FROM tbreservasnota');
      SQL.Add('WHERE idtbcliente = :cliente');
      ParamByName('cliente').Value := Self.FCliente;
      Open;
      if FieldByName('registros').Value = 0 then
        Result := False
      Else
        Result := True;
    End
    Else
    Begin
      Result := True;
    End;
  End;
end;

function TClasseClientes.InsereClientes: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbclientes(');
    SQL.Add('idtbempresa,');
    SQL.Add('cpf_cnpj,');
    SQL.Add('nome,');
    SQL.Add('rg_insc,');
    SQL.Add('endereco,');
    SQL.Add('nro,');
    SQL.Add('comp,');
    SQL.Add('bairro,');
    SQL.Add('cidade,');
    SQL.Add('cep,');
    SQL.Add('uf,');
    SQL.Add('dtnascimento,');
    SQL.Add('fone1,');
    SQL.Add('fone2,');
    SQL.Add('email,');
    SQL.Add('obs,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':idtbempresa,');
    SQL.Add(':cpf_cnpj,');
    SQL.Add(':nome,');
    SQL.Add(':rg_insc,');
    SQL.Add(':endereco,');
    SQL.Add(':nro,');
    SQL.Add(':comp,');
    SQL.Add(':bairro,');
    SQL.Add(':cidade,');
    SQL.Add(':cep,');
    SQL.Add(':uf,');
    SQL.Add(':dtnascimento,');
    SQL.Add(':fone1,');
    SQL.Add(':fone2,');
    SQL.Add(':email,');
    SQL.Add(':obs,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('idtbempresa').Value := Self.FEmpresa;
    ParamByName('cpf_cnpj').Value := Self.FCnpjCpf;
    ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
    ParamByName('rg_insc').Value := Self.FRgInsc;
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('comp').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('dtnascimento').Value := Self.FDtNascimento;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.FFone2;
    ParamByName('email').Value := Self.FEmail;
    ParamByName('obs').Value := Self.FObs;
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

function TClasseClientes.PegarRegistro: Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbcliente),0) AS registro FROM tbclientes');
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseClientes.ValidaCampos: Boolean;
begin
  if Trim(Self.FCnpjCpf) = EmptyStr then
  Begin
    MsgAviso('Cpf não foi preenchido');
    Abort;
  End;

  if Trim(Self.FNome) = EmptyStr then
  Begin
    MsgAviso('Nome do cliente não foi preenchido');
    Abort;
  End;

  if Trim(Self.FRgInsc) = EmptyStr then
  Begin
    MsgAviso('Identidade do cliente não foi preenchida');
    Abort;
  End;

  if Trim(Self.FFone1) = EmptyStr then
  Begin
    MsgAviso('Telefone do cliente não foi preenchido');
    Abort;
  End;

  Result := True;
end;

end.
