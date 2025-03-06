unit uClasseUsuarios;

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

  TClasseUsuarios = class

  protected
    FUsuario: Integer;
    FUserName: String;
    FPassWord: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereUsuarios: Boolean;
    function AlteraUsuarios: Boolean;
    function ExcluiUsuarios: Boolean;
    function Localiza(Campo, Valor: String): TClasseUsuarios;
    function CarregaDados(Codigo: Integer): TClasseUsuarios;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;

    // Campos publicos
    property Usuario: Integer read FUsuario write FUsuario;
    property UserName: String read FUserName write FUserName;
    property PassWord: String read FPassWord write FPassWord;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ TClasseUsuarios }

function TClasseUsuarios.AlteraUsuarios: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbusuarios SET');
    SQL.Add('password = :senha');
    SQL.Add('WHERE idtbusuario = :usuario');
    ParamByName('usuario').Value := Self.FUsuario;
    ParamByName('senha').Value   := Self.FPassWord;

    try
      if Not MsgConfirmacao('Deseja salvar as alterações?') then
        Abort;

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

constructor TClasseUsuarios.Campos;
begin
  FUsuario  := 0;
  FUserName := '';
  FPassWord := '';
  FUserCad  := UserLog;
  FUserAlt  := UserLog;
end;

function TClasseUsuarios.CarregaDados(Codigo: Integer): TClasseUsuarios;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbusuarios');
    SQL.Add('WHERE idtbusuario = :usuario');
    ParamByName('usuario').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Usuario := 0;
    End
    Else
    Begin
      FUsuario := FieldByName('idtbusuario').Value;
      FUserName := FieldByName('username').AsString;
      FPassWord := FieldByName('password').AsString;
      FUserCad := FieldByName('usercad').Value;
      FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseUsuarios.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseUsuarios.Destroy;
begin
  FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseUsuarios.ExcluiUsuarios: Boolean;
begin
  Result := False;
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbusuarios');
    SQL.Add('WHERE idtbusuario = :usuario');
    ParamByName('usuario').Value := Self.FUsuario;

    try
      if Not MsgConfirmacao('Deseja realmente excluir este usuário?') then
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

function TClasseUsuarios.InsereUsuarios: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbusuarios(');
    SQL.Add('username,');
    SQL.Add('password,');
    SQL.Add('usercad,');
    SQL.Add('useralt');
    SQL.Add(')VALUES(');
    SQL.Add(':usuario,');
    SQL.Add(':senha,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('usuario').Value := Self.FUserName;
    ParamByName('senha').Value := Self.FPassWord;
    ParamByName('usercad').Value := Self.UserCad;
    ParamByName('useralt').Value := Self.UserAlt;

    try
      if Not MsgConfirmacao('Deseja salvar as alterações?') then
        Abort;

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

function TClasseUsuarios.Localiza(Campo, Valor: String): TClasseUsuarios;
begin
  Campo := 'username'; // Definindo campo padrão
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbusuarios ');
    SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(Valor + '%'));
    Open;
    TNumericField(FieldByName('idtbusuario')).DisplayFormat := '000';
    TNumericField(FieldByName('idtbusuario')).Alignment := taCenter;
  End;
end;

function TClasseUsuarios.PegarRegistro: Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbusuario),0) AS registro FROM tbusuarios');
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseUsuarios.ValidaCampos: Boolean;
begin
  if Self.FUserName = EmptyStr then
  Begin
    MsgAviso('Usuário não foi preenchido');
    Abort;
  End;

  if Self.FPassWord = EmptyStr then
  Begin
    MsgAviso('Senha não foi preenchida');
    Abort;
  End;

  Result := True;
end;

end.
