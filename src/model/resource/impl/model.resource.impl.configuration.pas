unit model.resource.impl.configuration;

interface

uses
  System.SysUtils,
  System.IniFiles,

  uRotinas,

  Vcl.Forms,

  model.resource.interfaces;

type
  TConfiguration = class(TInterfacedObject, IConfiguration)
  private
    FServidor: String;
    FPorta: Integer;
    FDriverName: String;
    FUserName: String;
    FPassword: String;
    FDataBase: String;
  public
    constructor Create;
    destructor Destroy;
    class function New: IConfiguration;

    function DriverID(Value: String): IConfiguration; overload;
    function DriverID: String; overload;

    function Database(Value: String): IConfiguration; overload;
    function Database: String; overload;

    function Username(Value: String): IConfiguration; overload;
    function Username: String; overload;

    function Password(Value: String): IConfiguration; overload;
    function Password: String; overload;

    function Port(Value: String): IConfiguration; overload;
    function Port: String; overload;

    function Server(Value: String): IConfiguration; overload;
    function Server: String; overload;

    function Schema(Value: String): IConfiguration; overload;
    function Schema: String; overload;
  end;

implementation

{ TConfiguration }

constructor TConfiguration.Create;
var
  fileIni: String;
begin

{$IFDEF DEBUG}
  fileIni := ExtractFilePath(Application.ExeName) + '..\..\config.ini';
{$ELSE}
  fileIni := ExtractFilePath(Application.ExeName) + '\config.ini';
{$ENDIF}
  if not FileExists(fileIni) then
  begin
    raise Exception.Create('Arquivo de Configuração não encontrado' + #13 +
      'Entre em contato com o suporte técnico');
    Exit;
  end;

  // Carregando as informações do arquivo de configurações
  var
  configuracoes := TIniFile.Create(fileIni);
  Try
    FServidor := configuracoes.ReadString('Dados', 'Servidor', FServidor);
    FPorta := configuracoes.ReadInteger('Dados', 'Porta', FPorta);
    FDriverName := configuracoes.ReadString('Dados', 'DriverName', FDriverName);
    FUserName := configuracoes.ReadString('Dados', 'UserName', FUserName);
    FPassword := configuracoes.ReadString('Dados', 'PassWord', FPassword);
    FDataBase := configuracoes.ReadString('Dados', 'Database', FDataBase);
  Finally
    configuracoes.Free;
  end;

  FServidor := Crypt('D', FServidor);
  FUserName := Crypt('D', FUserName);
  FPassword := Crypt('D', FPassword);
  FDataBase := Crypt('D', FDataBase);
end;

function TConfiguration.Database(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

function TConfiguration.Database: String;
begin
  Result := FDataBase; // Puxar do INI
end;

destructor TConfiguration.Destroy;
begin
  inherited;
end;

function TConfiguration.DriverID: String;
begin
  Result := FDriverName; // Puxar do INI
end;

function TConfiguration.DriverID(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

class function TConfiguration.New: IConfiguration;
begin
  Result := Self.Create;
end;

function TConfiguration.Password(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

function TConfiguration.Password: String;
begin
  Result := FPassword; // Puxar do INI
end;

function TConfiguration.Port(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

function TConfiguration.Port: String;
begin
  Result := FPorta.ToString; // Puxar do INI
end;

function TConfiguration.Schema: String;
begin
  Result := ''; // Puxar do INI
end;

function TConfiguration.Schema(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

function TConfiguration.Server(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

function TConfiguration.Server: String;
begin
  Result := FServidor; // Puxar do INI
end;

function TConfiguration.Username: String;
begin
  Result := FUserName; // Puxar do INI
end;

function TConfiguration.Username(Value: String): IConfiguration;
begin
  Result := Self;
  // Gravar no INI
end;

end.
