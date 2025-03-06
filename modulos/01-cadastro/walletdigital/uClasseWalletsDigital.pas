unit uClasseWalletsDigital;

interface

uses

    System.SysUtils,
    System.Classes,

    Data.DB,

    uControle,
    uRotinas,
    uGlobal;

type

TClasseWalletsDigital = class


    protected
    FIdWallet  : Integer;
    FDescricao : String;
    FDiasDep   : Integer;
    FUserCad   : Integer;
    FUserAlt   : Integer;

    private
    FControle : TControle;

    public
    constructor Create(pConexaoControle : TControle);
    constructor Campos;
    destructor  Destroy;

    // Funções rotineiras
    function InsereWallets          : Boolean;
    function AlteraWallets          : Boolean;
    function ExcluiWallets          : Boolean;
    function Localiza(Campo, Valor  : String)   : TClasseWalletsDigital;
    function CarregaDados(Codigo    : Integer)  : TClasseWalletsDigital;
    function PegarRegistro          : Integer;
    function ValidaCampos           : Boolean;

    //
    property IdWallet  : Integer read FIdWallet write FIdWallet;
    property Descricao : String read FDescricao write FDescricao;
    property DiasDep   : Integer read FDiasDep write FDiasDep;
    property UserCad   : Integer read FUserCad write FUserCad;
    property UserAlt   : Integer read FUserAlt write FUserAlt;

end;

implementation

{ TClasseWalletsDigital }

function TClasseWalletsDigital.AlteraWallets: Boolean;
begin
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbcfgwalletsdigital SET');
        SQL.Add('descricao = :descricao,');
        SQL.Add('dias_dep = :dias_dep,');
        SQL.Add('useralt = :useralt');
        SQL.Add('WHERE idtbwallet = :idtbwallet');
        ParamByName('descricao').Value  := Self.FDescricao;
        ParamByName('dias_dep').Value   := Self.FDiasDep;
        ParamByName('useralt').Value    := Self.FUserAlt;
        ParamByName('idtbwallet').Value := Self.FIdWallet;

        try
          ExecSQL;
          Result  := True;
          MsgInformacao('Gravação realizada com sucesso');
        except
          On E : Exception Do
            Begin
              Result := False;
              MsgErro('Erro na gravação: '+E.Message);
            End;
        end;
      End;
end;

constructor TClasseWalletsDigital.Campos;
begin
    FIdWallet  := 0;
    FDescricao := '';
    FDiasDep   := 0;
    FUserCad   := UserLog;
    FUserAlt   := UserLog;
end;

function TClasseWalletsDigital.CarregaDados(Codigo: Integer): TClasseWalletsDigital;
begin
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM tbcfgwalletsdigital');
        SQL.Add('WHERE idtbwallet = :idtbwallet ORDER BY idtbwallet');
        ParamByName('idtbwallet').Value := Codigo;
        Open;
        if IsEmpty then
          Begin
            Self.FIdWallet := 0;
          End
          Else
          Begin
            FIdWallet  := FieldByName('idtbwallet').Value;
            FDescricao := FieldByName('descricao').AsString;
            FDiasDep   := FieldByName('dias_dep').Value;
            FUserCad   := FieldByName('usercad').Value;
            FUserAlt   := FieldByName('useralt').Value;
          End;
      End;
end;

constructor TClasseWalletsDigital.Create(pConexaoControle: TControle);
begin
    Campos; // Seta valores iniciais para os campos
    FControle := pConexaoControle;
end;

destructor TClasseWalletsDigital.Destroy;
begin
    FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseWalletsDigital.ExcluiWallets: Boolean;
begin
    Result := False;
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM tbcfgwalletsdigital');
        SQL.Add('WHERE idtbwallet = :idtbwallet');
        ParamByName('idtbwallet').Value := Self.FIdWallet;

        try
          if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
            Exit;

          ExecSQL;
          Result  := True;
        except
          On E : Exception Do
            Begin
              Result := False;
              MsgErro('Erro na gravação: '+E.Message);
            End;
        end;
      End;
end;

function TClasseWalletsDigital.InsereWallets: Boolean;
begin
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcfgwalletsdigital(');
        SQL.Add('descricao,');
        SQL.Add('dias_dep,');
        SQL.Add('usercad');
        SQL.Add(')VALUES(');
        SQL.Add(':descricao,');
        SQL.Add(':dias_dep,');
        SQL.Add(':usercad)');
        ParamByName('descricao').Value  := Self.FDescricao;
        ParamByName('dias_dep').Value   := Self.FDiasDep;
        ParamByName('usercad').Value    := Self.FUserCad;

        try
          ExecSQL;
          Result  := True;
          MsgInformacao('Gravação realizada com sucesso');
        except
          On E : Exception Do
            Begin
              Result := False;
              MsgErro('Erro na gravação: '+E.Message);
            End;
        end;
      End;
end;

function TClasseWalletsDigital.Localiza(Campo,
  Valor: String): TClasseWalletsDigital;
begin
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM tbcfgwalletsdigital');
        SQL.Add('WHERE '+Campo+' LIKE '+QuotedStr(Valor+'%'));
        Open;
        TNumericField(FieldByName('idtbwallet')).DisplayFormat := '00';
        TNumericField(FieldByName('idtbwallet')).Alignment     := taCenter;
      End;
end;

function TClasseWalletsDigital.PegarRegistro: Integer;
begin
    With FControle.SqlGeral Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(MAX(idtbwallet),0) AS registro FROM tbcfgwalletsdigital');
        Open;
        Result := FieldByName('registro').Value + 1;
      End;
end;

function TClasseWalletsDigital.ValidaCampos: Boolean;
begin
  Result := False;

    if Self.FDescricao = EmptyStr then
        Begin
          MsgAviso('Nome da Carteira não foi preenchido');
          Abort;
        End;

    if Self.FDiasDep = 0 then
        Begin
          MsgAviso('Dias para depósito não foi preenchido');
          Abort;
        End;

  Result := True;
end;

end.
