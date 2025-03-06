unit uClasseEmpresas;

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

  tClasseEmpresas = class

  protected
    FEmpresa: Integer;
    FRazao: String;
    FFantasia: String;
    FEndereco: String;
    FNro: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FCep: String;
    FUf: String;
    FCnpj: String;
    FInscEst: String;
    FObsAluguel: String;
    FFone2: String;
    FFone1: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TControle;

  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereEmpresas: Boolean;
    function AlteraEmpreas: Boolean;
    function ExcluiEmpresas: Boolean;
    function Localiza(Campo, Valor: String): tClasseEmpresas;
    function ListaEmpresa(Campo, Valor: String) : TFDQuery;
    function CarregaDados(Codigo: Integer): tClasseEmpresas;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;

    // Campos Publicos
    property Empresa: Integer read FEmpresa write FEmpresa;
    property Razao: String read FRazao write FRazao;
    property Fantasia: String read FFantasia write FFantasia;
    property Endereco: String read FEndereco write FEndereco;
    property Nro: String read FNro write FNro;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property Cep: String read FCep write FCep;
    property Uf: String read FUf write FUf;
    property Cnpj: String read FCnpj write FCnpj;
    property InscEst: String read FInscEst write FInscEst;
    property ObsAluguel: String read FObsAluguel write FObsAluguel;
    property Fone1: String read FFone1 write FFone1;
    property Fone2: String read FFone2 write FFone2;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

  end;

implementation

{ tClasseEmpresas }

function tClasseEmpresas.AlteraEmpreas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tbempresas SET');
    SQL.Add('razao = :razao,');
    SQL.Add('fantasia = :fantasia,');
    SQL.Add('endereco = :endereco,');
    SQL.Add('nro = :nro,');
    SQL.Add('comp = :complemento,');
    SQL.Add('bairro = :bairro,');
    SQL.Add('cidade = :cidade,');
    SQL.Add('cep = :cep,');
    SQL.Add('uf = :uf,');
    SQL.Add('cnpj = :cnpj,');
    SQL.Add('insc = :insc,');
    SQL.Add('obsaluguel = :obsaluguel,');
    SQL.Add('fone1 = :fone1,');
    SQL.Add('fone2 = :fone2,');
    SQL.Add('useralt = :useralt');
    SQL.Add('WHERE idtbempresa = :empresa');
    ParamByName('razao').Value := AnsiUpperCase(Self.FRazao);
    ParamByName('fantasia').Value := AnsiUpperCase(Self.FFantasia);
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('complemento').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('cnpj').Value := Self.FCnpj;
    ParamByName('insc').Value := Self.FInscEst;
    ParamByName('obsaluguel').Value := Self.FObsAluguel;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.Fone2;
    ParamByName('useralt').Value := Self.FUserAlt;
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

constructor tClasseEmpresas.Campos;
begin
  FEmpresa := 0;
  FRazao := '';
  FFantasia := '';
  FEndereco := '';
  FNro := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FCep := '';
  FUf := '';
  FCnpj := '';
  FInscEst := '';
  FObsAluguel := '';
  FFone1 := '';
  FFone2 := '';
  FUserCad := UserLog;
  FUserAlt := UserLog;
end;

function tClasseEmpresas.CarregaDados(Codigo: Integer): tClasseEmpresas;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbempresas');
    SQL.Add('WHERE idtbempresa = :empresa ORDER BY idtbempresa');
    ParamByName('empresa').Value := Codigo;
    Open;
    if IsEmpty then
    Begin
      Self.FEmpresa := 0;
    End
    Else
    Begin
      Self.FEmpresa := FieldByName('idtbempresa').Value;
      Self.FRazao := FieldByName('razao').AsString;
      Self.FFantasia := FieldByName('fantasia').AsString;
      Self.FEndereco := FieldByName('endereco').AsString;
      Self.FNro := FieldByName('nro').AsString;
      Self.FComplemento := FieldByName('comp').AsString;
      Self.FBairro := FieldByName('bairro').AsString;
      Self.FCidade := FieldByName('cidade').AsString;
      Self.FCep := FieldByName('cep').AsString;
      Self.FUf := FieldByName('uf').AsString;
      Self.FCnpj := FieldByName('cnpj').AsString;
      Self.FInscEst := FieldByName('insc').AsString;
      Self.FObsAluguel := FieldByName('obsaluguel').AsString;
      Self.FFone1 := FieldByName('fone1').AsString;
      Self.FFone2 := FieldByName('fone2').AsString;
      Self.FUserCad := FieldByName('usercad').Value;
      Self.FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor tClasseEmpresas.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor tClasseEmpresas.Destroy;
begin
  FControle.Conexao.ConexaoBanco.Close;
end;

function tClasseEmpresas.ExcluiEmpresas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbempresas');
    SQL.Add('WHERE idtbempresa = :empresa');
    ParamByName('empresa').Value := Self.FEmpresa;

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

function tClasseEmpresas.InsereEmpresas: Boolean;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO tbempresas(');
    SQL.Add('razao,');
    SQL.Add('fantasia,');
    SQL.Add('endereco,');
    SQL.Add('nro,');
    SQL.Add('comp,');
    SQL.Add('bairro,');
    SQL.Add('cidade,');
    SQL.Add('cep,');
    SQL.Add('uf,');
    SQL.Add('cnpj,');
    SQL.Add('insc,');
    SQL.Add('obsaluguel,');
    SQL.Add('fone1,');
    SQL.Add('fone2,');
    SQL.Add('usercad,');
    SQL.Add('useralt)');
    SQL.Add('VALUES(');
    SQL.Add(':razao,');
    SQL.Add(':fantasia,');
    SQL.Add(':endereco,');
    SQL.Add(':nro,');
    SQL.Add(':complemento,');
    SQL.Add(':bairro,');
    SQL.Add(':cidade,');
    SQL.Add(':cep,');
    SQL.Add(':uf,');
    SQL.Add(':cnpj,');
    SQL.Add(':insc,');
    SQL.Add(':obsaluguel,');
    SQL.Add(':fone1,');
    SQL.Add(':fone2,');
    SQL.Add(':usercad,');
    SQL.Add(':useralt)');
    ParamByName('razao').Value := AnsiUpperCase(Self.FRazao);
    ParamByName('fantasia').Value := AnsiUpperCase(Self.FFantasia);
    ParamByName('endereco').Value := AnsiUpperCase(Self.FEndereco);
    ParamByName('nro').Value := Self.FNro;
    ParamByName('complemento').Value := AnsiUpperCase(Self.FComplemento);
    ParamByName('bairro').Value := AnsiUpperCase(Self.FBairro);
    ParamByName('cidade').Value := AnsiUpperCase(Self.FCidade);
    ParamByName('cep').Value := Self.FCep;
    ParamByName('uf').Value := Self.FUf;
    ParamByName('cnpj').Value := Self.FCnpj;
    ParamByName('insc').Value := Self.FInscEst;
    ParamByName('obsaluguel').Value := Self.FObsAluguel;
    ParamByName('fone1').Value := Self.FFone1;
    ParamByName('fone2').Value := Self.FFone2;
    ParamByName('obsaluguel').Value := Self.FObsAluguel;
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

function tClasseEmpresas.ListaEmpresa(Campo, Valor: String): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbempresas');
    SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(Valor + '%'));
    Open;
    End;
  Result := FControle.SqlGeral;
end;

function tClasseEmpresas.Localiza(Campo, Valor: String): tClasseEmpresas;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbempresas');
    SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(Valor + '%'));
    Open;
    TNumericField(FieldByName('idtbempresa')).DisplayFormat := '00';
    TNumericField(FieldByName('idtbempresa')).Alignment := taCenter;
  End;
end;

function tClasseEmpresas.PegarRegistro: Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbempresa),0) AS registro FROM tbempresas');
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function tClasseEmpresas.ValidaCampos: Boolean;
begin
  if Trim(Self.FRazao) = EmptyStr then
  Begin
    MsgAviso('Razão Social não foi preenchida');
    Abort;
  End;

  if Trim(Self.FFantasia) = EmptyStr then
  Begin
    MsgAviso('Nome Fantasia não foi preenchida');
    Abort;
  End;

  if Trim(Self.FCnpj) = EmptyStr then
  Begin
    MsgAviso('CNPJ não foi preenchido');
    Abort;
  End;

  if Trim(Self.FInscEst) = EmptyStr then
  Begin
    MsgAviso('Inscrição Estadual não foi preenchida');
    Abort;
  End;

  Result := True;
end;

end.
