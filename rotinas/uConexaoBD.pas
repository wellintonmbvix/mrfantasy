unit uConexaoBD;

interface

uses

  SqlExpr,
  inifiles,
  SysUtils,

  Vcl.Forms,
  Vcl.Dialogs,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Data.DB,
  uRotinas;

type

  TConexaoBD = class
  private
    FConexaoBanco: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;

    function GetConexao: TFDConnection;
    property ConexaoBanco: TFDConnection read GetConexao;

  end;

implementation

{ TConexaoBanco }

constructor TConexaoBD.Create;
var
  ArquivoINI,
  Servidor,
  Porta,
  DriverName,
  UserName,
  PassWord,
  Database: String;
  Configuracoes: TIniFile;
begin
{$IFDEF DEBUG}
  ArquivoINI := ExtractFilePath(Application.ExeName) + '..\..\config.ini';
{$ENDIF}
{$IFDEF RELEASE}
  ArquivoINI := ExtractFilePath(Application.ExeName) + '\config.ini';
{$ENDIF}
  if not FileExists(ArquivoINI) then
  begin
    MsgErro('Arquivo de Configuração não encontrado' + #13 +
      'Entre em contato com o suporte técnico');
    Exit;
  end;

  // Carregando as informações do arquivo de configurações
  Configuracoes := TIniFile.Create(ArquivoINI);
  Try
    Servidor := Configuracoes.ReadString('Dados', 'Servidor', Servidor);
    Porta := Configuracoes.ReadString('Dados', 'Porta', Porta);
    DriverName := Configuracoes.ReadString('Dados', 'DriverName', DriverName);
    UserName := Configuracoes.ReadString('Dados', 'UserName', UserName);
    PassWord := Configuracoes.ReadString('Dados', 'PassWord', PassWord);
    Database := Configuracoes.ReadString('Dados', 'Database', Database);
  Finally
    Configuracoes.Free;
  end;

  Servidor := Crypt('D', Servidor);
  UserName := Crypt('D', UserName);
  PassWord := Crypt('D', PassWord);
  Database := Crypt('D', Database);

  try
    FConexaoBanco := TFDConnection.Create(Application);
    FConexaoBanco.LoginPrompt := False;
    FConexaoBanco.Params.Clear;
    FConexaoBanco.Params.Add('Server=' + Servidor);
    FConexaoBanco.Params.Add('User_Name=' + UserName);
    FConexaoBanco.Params.Add('Password=' + PassWord);
    FConexaoBanco.Params.Add('Database=' + Database);
    FConexaoBanco.Params.Add('DriverID=' + DriverName);
    FConexaoBanco.Params.Add('Port=' + Porta);
    FConexaoBanco.Params.Add('CharacterSet=utf8');
    FConexaoBanco.Params.Add('Compress=True');
    FConexaoBanco.Connected := True;
  except
    On E: Exception Do
    Begin
      MsgErro('Erro ao conectar ao Banco de Dados.' + #13 + E.Message);
    End;
  end;

end;

destructor TConexaoBD.Destroy;
begin
  FConexaoBanco.Connected := False;
  inherited;
end;

function TConexaoBD.GetConexao: TFDConnection;
begin
  Result := FConexaoBanco;
end;

end.
