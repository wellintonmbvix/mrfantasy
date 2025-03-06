unit uControle;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Classes,
  System.Variants,
  System.Contnrs,
  System.StrUtils,
  System.IniFiles,

  Vcl.Controls,
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
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB,

  uConexaoBd;

type

  TControle = class

  private
    FConexao: TConexaoBd;
    FDQGeral: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    property SqlGeral: TFDQuery read FDQGeral write FDQGeral;
    property Conexao: TConexaoBd read FConexao write FConexao;

  end;

implementation

{ TControle }

constructor TControle.Create;
begin
  FConexao := TConexaoBd.Create;

  FDQGeral := TFDQuery.Create(Application);
  FDQGeral.Connection := FConexao.ConexaoBanco;
end;

destructor TControle.Destroy;
begin
  FConexao.ConexaoBanco.Connected := False;
  FreeAndNil(FDQGeral);
  FreeAndNil(FConexao);
  inherited;
end;

end.
