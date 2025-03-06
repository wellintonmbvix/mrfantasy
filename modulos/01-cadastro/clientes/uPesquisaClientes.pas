unit uPesquisaClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,

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
  uClasseClientes,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Mask;

type
  TfPesquisaClientes = class(TfPesquisaPadrao)
    dsClientes: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure cbox_registrosChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaClientes: TfPesquisaClientes;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  vQry : TFDQuery;
  vControle : TControle;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaClientes.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsClientes.Enabled := False;
end;

procedure TfPesquisaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaClientes := Nil;
end;

procedure TfPesquisaClientes.FormCreate(Sender: TObject);
begin
  inherited;
  vControle          := TControle.Create;
  vQry               := TFDQuery.Create(Self);
  vQry.Connection    := vControle.Conexao.GetConexao;
  dsClientes.DataSet := vQry;
end;

procedure TfPesquisaClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaClientes.Close;
end;

procedure TfPesquisaClientes.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if vQry.RecordCount > 0 then
    nClientes := vQry.FieldByName
      ('idtbcliente').Value
  else
    nClientes := 0;
  Self.Close;
end;

procedure TfPesquisaClientes.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsClientes.Enabled := False;
end;

procedure TfPesquisaClientes.ledt_valorKeyPress(Sender: TObject; var Key: Char);
var
  campo, valor: String;
begin
  inherited;
  if key = #13 then
    begin
      Try
        case cbox_campo.ItemIndex of
          0:
            campo := 'idtbcliente';
          1:
            campo := 'nome';
          2:
            campo := 'cpf_cnpj';
          3:
            campo := 'rg_insc';
        end;
        if cbox_campo.ItemIndex = 2 then
          valor := MascaraCpfCnpj(ledt_valor.Text)
        else
          valor := ledt_valor.Text;
        With vQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS registros FROM tbclientes');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
          Open;
          totalrg := FieldByName('registros').Value;
          totalpg := Ceil(FieldByName('registros').Value /
            StrToInt(cbox_registros.Text));
          currentrg := 0;
          currentpg := 1;
          direcao := 'Proximo';

          dsClientes.Enabled := True;
          sbtn_anterior.Enabled := False;
          sbtn_proximo.Enabled := False;

          Close;
          SQL.Clear;
          SQL.Add('SELECT * from tbclientes');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
          SQL.Add('ORDER BY idtbcliente');
          SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
          Open;
          if IsEmpty then
          Begin
            MsgInformacao('Não existem dados para exibir');
            Exit;
          End;

          TNumericField(FieldByName('idtbcliente')).DisplayFormat := '0000000';
          TNumericField(FieldByName('idtbcliente')).Alignment := taCenter;

          if totalrg > StrToInt(cbox_registros.Text) then
          Begin
            sbtn_anterior.Enabled := False;
            sbtn_proximo.Enabled := True;
          End;
        End;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
        End;
      End;
    end;
end;

procedure TfPesquisaClientes.sbtn_anteriorClick(Sender: TObject);
var
  campo, valor: String;
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';

  case cbox_campo.ItemIndex of
    0:
      campo := 'idtbcliente';
    1:
      campo := 'nome';
    2:
      campo := 'cpf_cnpj';
    3:
      campo := 'rg_insc';
  end;

  if cbox_campo.ItemIndex = 2 then
    valor := MascaraCpfCnpj(ledt_valor.Text)
  else
    valor := ledt_valor.Text;

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from tbclientes');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
    SQL.Add('ORDER BY idtbcliente');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    Open;

    TNumericField(FieldByName('idtbcliente')).DisplayFormat := '0000000';
    TNumericField(FieldByName('idtbcliente')).Alignment := taCenter;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaClientes.sbtn_proximoClick(Sender: TObject);
var
  campo, valor: String;
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';

  case cbox_campo.ItemIndex of
    0:
      campo := 'idtbcliente';
    1:
      campo := 'nome';
    2:
      campo := 'cpf_cnpj';
    3:
      campo := 'rg_insc';
  end;
  if cbox_campo.ItemIndex = 2 then
    valor := MascaraCpfCnpj(ledt_valor.Text)
  else
    valor := ledt_valor.Text;
  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from tbclientes');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
    SQL.Add('ORDER BY idtbcliente');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    Open;

    TNumericField(FieldByName('idtbcliente')).DisplayFormat := '0000000';
    TNumericField(FieldByName('idtbcliente')).Alignment := taCenter;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

end.
