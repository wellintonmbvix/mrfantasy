unit uPesquisaEmpresas;

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

  uRotinas,
  uGlobal,
  uControle,
  uClasseEmpresas,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TfPesquisaEmpresas = class(TfPesquisaPadrao)
    dsEmpresas: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaEmpresas: TfPesquisaEmpresas;
  Controle         : TControle;
  VQry             : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaEmpresas := Nil;
end;

procedure TfPesquisaEmpresas.FormCreate(Sender: TObject);
begin
  inherited;
  vControle          := TControle.Create;
  vQry               := TFDQuery.Create(Self);
  vQry.Connection    := vControle.Conexao.GetConexao;
  dsEmpresas.DataSet := vQry;
end;

procedure TfPesquisaEmpresas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaEmpresas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaEmpresas.Close;
end;

procedure TfPesquisaEmpresas.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if vQry.RecordCount > 0 then
    nEmpresa := vQry.Fields[0].Value
  else
    nEmpresa := 0;
  Self.Close;
end;

procedure TfPesquisaEmpresas.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsEmpresas.Enabled := False;
end;

procedure TfPesquisaEmpresas.ledt_valorKeyPress(Sender: TObject; var Key: Char);
var
  campo         : String;
begin
  inherited;
  if key = #13 then
    begin
      Try
        case cbox_campo.ItemIndex of
          0:
            campo := 'razao';
          1:
            campo := 'fantasia';
          2:
            campo := 'cnpj';
          3:
            campo := 'inscest';
        end;

        With VQry Do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM tbempresas');
            SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(ledt_valor.Text + '%'));
            Open;
          end;
        dsEmpresas.Enabled := True;
      Except On e : Exception do
        Begin
          MsgErro('Erro de rotina' + #13 + e.Message);
        End;
      End;
    end;
end;

end.
