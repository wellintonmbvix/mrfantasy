unit uClasseFuncionarios;

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

  TClasseFuncionarios = class

  protected
    FFuncionario: Integer;
    FNome: String;
    FAbreviatura: String;
    FEndereco: String;
    FNro: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FCep: String;
    FUf: String;
    FCpf: String;
    FRg: String;
    FFone1: String;
    FFone2: String;
    FAdmissao: String;
    FFuncao: String;
    FDemissao: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereFuncionarios: Boolean;
    function AlteraFuncionarios: Boolean;
    function ExcluiFuncionarios: Boolean;
    function Localiza(Campo, Valor: String): TClasseFuncionarios;
    function CarregaDados(Codigo: Integer): TClasseFuncionarios;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;

    //
    property Funcionario: Integer read FFuncionario write FFuncionario;
    property Nome: String read FNome write FNome;
    property Abreviatura: String read FAbreviatura write FAbreviatura;
    property Endereco: String read FEndereco write FEndereco;
    property Nro: String read FNro write FNro;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property Cep: String read FCep write FCep;
    property Uf: String read FUf write FUf;
    property Cpf: String read FCpf write FCpf;
    property Rg: String read FRg write FRg;
    property Fone1: String read FFone1 write FFone1;
    property Fone2: String read FFone2 write FFone2;
    property Admissao: String read FAdmissao write FAdmissao;
    property Funcao: String read FFuncao write FFuncao;
    property Demissao: String read FDemissao write FDemissao;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ TClasseFuncionarios }

function TClasseFuncionarios.AlteraFuncionarios: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbfuncionarios SET');
    SQL.Add('nome = :nome,');
    SQL.Add('abreviatura = :abreviatura,');
    SQL.Add('endereco = :endereco,');
    SQL.Add('nro = :nro,');
    SQL.Add('comp = :comp,');
    SQL.Add('bairro = :bairro,');
    SQL.Add('cidade = :cidade,');
    SQL.Add('cep = :cep,');
    SQL.Add('uf = :uf,');
    SQL.Add('cpf = :cpf,');
    SQL.Add('rg = :rg,');
    SQL.Add('fone1 = :fone1,');
    SQL.Add('fone2 = :fone2,');
    SQL.Add('dtadmissao = :admissao,');
    SQL.Add('funcao = :funcao,');
    SQL.Add('dtdemissao = :demissao,');
    SQL.Add('useralt = :useralt');
    SQL.Add('WHERE idtbfuncionario = :funcionario;');
    SQL.Add(' Select ordena_funcionarios();');
    ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
    ParamByName('abreviatura').Value := AnsiUpperCase(Self.FAbreviatura);
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('comp').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('cpf').Value := Self.FCpf;
    ParamByName('rg').Value := Self.FRg;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.FFone2;
    ParamByName('admissao').Value := Self.FAdmissao;
    ParamByName('funcao').Value := AnsiUpperCase(Self.FFuncao);
    ParamByName('demissao').Value := Self.FDemissao;
    ParamByName('useralt').Value := Self.FUserAlt;
    ParamByName('funcionario').Value := Self.FFuncionario;

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

constructor TClasseFuncionarios.Campos;
begin
  FFuncionario := 0;
  FNome := '';
  FEndereco := '';
  FNro := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FCep := '';
  FUf := '';
  FCpf := '';
  FRg := '';
  FFone1 := '';
  FFone2 := '';
  FAdmissao := '';
  FFuncao := '';
  FDemissao := '';
  FUserCad := UserLog;
  FUserAlt := UserLog;
end;

function TClasseFuncionarios.CarregaDados(Codigo: Integer): TClasseFuncionarios;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbfuncionarios');
    SQL.Add('WHERE codigo = :usuario ORDER BY idtbfuncionario');
    ParamByName('usuario').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Self.FFuncionario := 0;
    End
    Else
    Begin
      Self.FFuncionario := FieldByName('idtbfuncionario').Value;
      Self.FNome := FieldByName('nome').AsString;
      Self.FAbreviatura := FieldByName('abreviatura').AsString;
      Self.FEndereco := FieldByName('endereco').AsString;
      Self.FNro := FieldByName('nro').AsString;
      Self.FComplemento := FieldByName('comp').AsString;
      Self.FBairro := FieldByName('bairro').AsString;
      Self.FCidade := FieldByName('cidade').AsString;
      Self.FCep := FieldByName('cep').AsString;
      Self.FUf := FieldByName('uf').AsString;
      Self.FCpf := FieldByName('cpf').AsString;
      Self.FRg := FieldByName('rg').AsString;
      Self.FFone1 := FieldByName('fone1').AsString;
      Self.FFone2 := FieldByName('fone2').AsString;
      Self.FAdmissao := FieldByName('dtadmissao').AsString;
      Self.FFuncao := FieldByName('funcao').AsString;
      Self.FDemissao := FieldByName('dtdemissao').AsString;
      Self.FUserCad := FieldByName('usercad').Value;
      Self.FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseFuncionarios.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseFuncionarios.Destroy;
begin
  FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseFuncionarios.ExcluiFuncionarios: Boolean;
begin
  Result := False;
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbfuncionarios');
    SQL.Add('WHERE idtbfuncionario = :funcionario;');
    SQL.Add(' Select ordena_funcionarios();');
    ParamByName('funcionario').Value := Self.FFuncionario;

    try
      if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
        Exit;

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

function TClasseFuncionarios.InsereFuncionarios: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbfuncionarios(');
    SQL.Add('nome,');
    SQL.Add('abreviatura,');
    SQL.Add('endereco,');
    SQL.Add('nro,');
    SQL.Add('comp,');
    SQL.Add('bairro,');
    SQL.Add('cidade,');
    SQL.Add('cep,');
    SQL.Add('uf,');
    SQL.Add('cpf,');
    SQL.Add('rg,');
    SQL.Add('fone1,');
    SQL.Add('fone2,');
    SQL.Add('dtadmissao,');
    SQL.Add('funcao,');
    SQL.Add('dtdemissao,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':nome,');
    SQL.Add(':abreviatura,');
    SQL.Add(':endereco,');
    SQL.Add(':nro,');
    SQL.Add(':comp,');
    SQL.Add(':bairro,');
    SQL.Add(':cidade,');
    SQL.Add(':cep,');
    SQL.Add(':uf,');
    SQL.Add(':cpf,');
    SQL.Add(':rg,');
    SQL.Add(':fone1,');
    SQL.Add(':fone2,');
    SQL.Add(':admissao,');
    SQL.Add(':funcao,');
    SQL.Add(':demissao,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt);');
    SQL.Add(' Select ordena_funcionarios();');
    ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
    ParamByName('abreviatura').Value := AnsiUpperCase(Self.FAbreviatura);
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('comp').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('cpf').Value := Self.FCpf;
    ParamByName('rg').Value := Self.FRg;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.FFone2;
    ParamByName('admissao').Value := Self.FAdmissao;
    ParamByName('funcao').Value := AnsiUpperCase(Self.FFuncao);
    ParamByName('demissao').Value := Self.FDemissao;
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

function TClasseFuncionarios.Localiza(Campo, Valor: String)
  : TClasseFuncionarios;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbfuncionarios');
    SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(Valor + '%'));
    SQL.Add(' AND LENGTH(dtdemissao) = 0');
    Open;
    TNumericField(FieldByName('idtbfuncionario')).DisplayFormat := '000';
    TNumericField(FieldByName('idtbfuncionario')).Alignment     := taCenter;
  End;
end;

function TClasseFuncionarios.PegarRegistro: Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbfuncionario),0) AS registro FROM tbfuncionarios');
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseFuncionarios.ValidaCampos: Boolean;
begin
  if Trim(Self.FNome) = EmptyStr then
  Begin
    MsgAviso('Nome não foi preenchido');
    Abort;
  End;

  if Trim(Self.FAbreviatura) = EmptyStr then
  Begin
    MsgAviso('Abreviatura não foi preenchida');
    Abort;
  End;

  if Trim(Self.FCpf) = EmptyStr then
  Begin
    MsgAviso('CPF não foi preenchido');
    Abort;
  End;

  if Trim(Self.FRg) = EmptyStr then
  Begin
    MsgAviso('Identidade não foi preenchida');
    Abort;
  End;

  if Trim(Self.FFuncao) = EmptyStr then
  Begin
    MsgAviso('Função não foi preenchida');
    Abort;
  End;

  Result := True;
end;

end.
