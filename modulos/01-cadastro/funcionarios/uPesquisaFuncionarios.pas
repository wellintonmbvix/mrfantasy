unit uPesquisaFuncionarios;

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
  uClasseFuncionarios,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid;

type
  TfPesquisaFuncionarios = class(TfPesquisaPadrao)
    dsFuncionarios: TDataSource;
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
  fPesquisaFuncionarios: TfPesquisaFuncionarios;
  ClasseFuncionarios: TClasseFuncionarios;
  Controle          : TControle;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaFuncionarios := Nil;
end;

procedure TfPesquisaFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  Controle               := TControle.Create;
  ClasseFuncionarios     := TClasseFuncionarios.Create(Controle);
  dsFuncionarios.DataSet := Controle.SqlGeral;;
end;

procedure TfPesquisaFuncionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ClasseFuncionarios);
  FreeAndNil(Controle);
end;

procedure TfPesquisaFuncionarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaFuncionarios.Close;
end;

procedure TfPesquisaFuncionarios.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if Controle.SqlGeral.RecordCount > 0 then
    nFuncionario := Controle.SqlGeral.FieldByName
      ('codigo').Value
  else
    nFuncionario := 0;
  Self.Close;
end;

procedure TfPesquisaFuncionarios.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsFuncionarios.Enabled := False;
end;

procedure TfPesquisaFuncionarios.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
var
  campo: String;
begin
  inherited;
    if key = #13 then
      begin
          case cbox_campo.ItemIndex of
            0:
              campo := 'nome';
            1:
              campo := 'cpf';
            2:
              campo := 'rg';
       end;
        ClasseFuncionarios.Localiza(campo, ledt_valor.Text);
        dsFuncionarios.Enabled := True;
    end;
end;

end.
