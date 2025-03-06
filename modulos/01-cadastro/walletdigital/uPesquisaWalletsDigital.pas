unit uPesquisaWalletsDigital;

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
  uClasseCfgWalletsDigital,
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
  FireDAC.Comp.DataSet;

type
  TfPesquisaWalletsDigital = class(TfPesquisaPadrao)
    dsWallets: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaWalletsDigital: TfPesquisaWalletsDigital;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  Controle : TControle;
  vQry     : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaWalletsDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaWalletsDigital := Nil;
end;

procedure TfPesquisaWalletsDigital.FormCreate(Sender: TObject);
begin
  inherited;
  Controle          := TControle.Create;
  vQry              := TFDQuery.Create(Self);
  vQry.Connection   := Controle.Conexao.GetConexao;
  dsWallets.DataSet := vQry;
end;

procedure TfPesquisaWalletsDigital.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(Controle);
end;

procedure TfPesquisaWalletsDigital.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaWalletsDigital.Close;
end;

procedure TfPesquisaWalletsDigital.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if vQry.RecordCount > 0 then
    nWallet := vQry.FieldByName
      ('idtbwallet').Value
  else
    nWallet := 0;
  Self.Close;
end;

procedure TfPesquisaWalletsDigital.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsWallets.Enabled := True;
end;

procedure TfPesquisaWalletsDigital.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
var
  campo, valor: String;
begin
  inherited;
  if key = #13 then
    begin
      campo := 'descricao';
      Try
        With vQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS registros FROM tbcfgwalletsdigital');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
          Open;
          totalrg := FieldByName('registros').Value;
          totalpg := Ceil(FieldByName('registros').Value /
            StrToInt(cbox_registros.Text));
          currentrg := 0;
          currentpg := 1;
          direcao := 'Proximo';

          dsWallets.Enabled := True;
          sbtn_anterior.Enabled := False;
          sbtn_proximo.Enabled := False;

          Close;
          SQL.Clear;
          SQL.Add('SELECT * from tbcfgwalletsdigital');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
          SQL.Add('ORDER BY idtbwallet');
          SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
          Open;
          if IsEmpty then
          Begin
            MsgInformacao('Não existem dados para exibir');
            Exit;
          End;

          TNumericField(FieldByName('idtbwallet')).DisplayFormat := '000';
          TNumericField(FieldByName('idtbwallet')).Alignment := taCenter;

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

procedure TfPesquisaWalletsDigital.sbtn_anteriorClick(Sender: TObject);
var
  campo, valor: String;
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';
  campo := 'descricao';
  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from tbcfgwalletsdigital');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
    SQL.Add('ORDER BY idtbwallet');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    Open;

    TNumericField(FieldByName('idtbwallet')).DisplayFormat := '000';
    TNumericField(FieldByName('idtbwallet')).Alignment := taCenter;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaWalletsDigital.sbtn_proximoClick(Sender: TObject);
var
  campo, valor: String;
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';
  campo := 'descricao';
  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from tbcfgwalletsdigital');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(valor + '%'));
    SQL.Add('ORDER BY idtbwallet');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    Open;

    TNumericField(FieldByName('idtbwallet')).DisplayFormat := '000';
    TNumericField(FieldByName('idtbwallet')).Alignment := taCenter;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

end.
