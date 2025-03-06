unit uPesquisaUsuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  uControle,
  uRotinas,
  uGlobal,
  uClasseUsuarios,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid;

type
  TfPesquisaUsuarios = class(TfPesquisaPadrao)
    dsUsuarios: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaUsuarios: TfPesquisaUsuarios;
  registro: Integer = 0;
  Controle: TControle;
  ClasseUsuarios: TClasseUsuarios;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaUsuarios := Nil;
end;

procedure TfPesquisaUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  Controle           := TControle.Create;
  ClasseUsuarios     := TClasseUsuarios.Create(Controle);
  dsUsuarios.DataSet := Controle.SqlGeral;
end;

procedure TfPesquisaUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ClasseUsuarios);
  FreeAndNil(Controle);
end;

procedure TfPesquisaUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaUsuarios.Close;
end;

procedure TfPesquisaUsuarios.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if Controle.SqlGeral.RecordCount > 0 then
    nUsuario := Controle.SqlGeral.FieldByName
      ('idtbusuario').Value
  else
    nUsuario := 0;
  Self.Close;
end;

procedure TfPesquisaUsuarios.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsUsuarios.Enabled := False;
end;

procedure TfPesquisaUsuarios.ledt_valorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    begin
      ClasseUsuarios.Localiza('', ledt_valor.Text);
      dsUsuarios.Enabled := True;
    end;
end;

end.
