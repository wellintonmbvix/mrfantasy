unit uPesquisaCaixas;

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
  Vcl.Mask,

  uControle,
  uRotinas,
  uGlobal,
  uClasseCaixas,
  uPesquisaPadrao,
  Data.DB,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.StorageXML,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet, JvComponentBase, JvBalloonHint;

type
  TfPesquisaCaixas = class(TfPesquisaPadrao)
    jvdedt_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    dsCaixas: TDataSource;
    check_ent_cash: TCheckBox;
    check_caixas: TCheckBox;
    JvBalloonHint: TJvBalloonHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure jvdedt_emissaoPopupShown(Sender: TObject);
    procedure cbox_registrosChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaCaixas: TfPesquisaCaixas;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  Controle : TControle;
  vQry     : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaCaixas.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsCaixas.Enabled := False;
end;

procedure TfPesquisaCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaCaixas := Nil;
end;

procedure TfPesquisaCaixas.FormCreate(Sender: TObject);
begin
  inherited;
  Controle         := TControle.Create;
  vQry             := TFDQuery.Create(Self);
  vQry.Connection  := Controle.Conexao.GetConexao;
  dsCaixas.DataSet := vQry;
end;

procedure TfPesquisaCaixas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(Controle);
end;

procedure TfPesquisaCaixas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaCaixas.Close;
end;

procedure TfPesquisaCaixas.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if (vQry.RecordCount > 0) then
  Begin
    if (vQry.FieldByName('origem')
      .AsString = 'Digitação') AND
      (vQry.FieldByName('idusercad')
      .Value = UserLog) then
    Begin
      nCaixa := vQry.FieldByName('idcaixa').Value;
      Self.Close;
    End
    else
      MsgAviso('Permitido apenas para movimentação de caixa do próprio usuário');
  End
  else
    nCaixa := 0;
end;

procedure TfPesquisaCaixas.jvdedt_emissaoPopupShown(Sender: TObject);
begin
  inherited;
  dsCaixas.Enabled := False;
end;

procedure TfPesquisaCaixas.sbtn_anteriorClick(Sender: TObject);
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_caixas');
    SQL.Add('WHERE date(dtemissao) = :emissao AND cancelado = "Não" AND condicao="Dinheiro"');
    if check_ent_cash.Checked then
      SQL.Add(' AND origem IS NOT NULL')
    else
      SQL.Add(' AND origem = "Digitação"');
    if check_caixas.Checked then
      SQL.Add(' AND idusercad > 0')
    else
      SQL.Add(' AND idusercad = ' + UserLog.ToString);
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('emissao').Value := jvdedt_emissao.Date;
    Open;

    TNumericField(FieldByName('idcaixa')).DisplayFormat := '00';
    TNumericField(FieldByName('idcaixa')).Alignment := taCenter;
    TNumericField(FieldByName('valor')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor')).Alignment := taRightJustify;
    TNumericField(FieldByName('saldo')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('saldo')).Alignment := taRightJustify;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaCaixas.sbtn_proximoClick(Sender: TObject);
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_caixas');
    SQL.Add('WHERE date(dtemissao) = :emissao AND cancelado = "Não" AND condicao="Dinheiro"');
    if check_ent_cash.Checked then
      SQL.Add(' AND origem IS NOT NULL')
    else
      SQL.Add(' AND origem = "Digitação"');
    if check_caixas.Checked then
      SQL.Add(' AND idusercad > 0')
    else
      SQL.Add(' AND idusercad = ' + UserLog.ToString);
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('emissao').Value := jvdedt_emissao.Date;
    Open;

    TNumericField(FieldByName('idcaixa')).DisplayFormat := '00';
    TNumericField(FieldByName('idcaixa')).Alignment := taCenter;
    TNumericField(FieldByName('valor')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor')).Alignment := taRightJustify;
    TNumericField(FieldByName('saldo')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('saldo')).Alignment := taRightJustify;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

procedure TfPesquisaCaixas.sbtn_searchClick(Sender: TObject);
var
  valor : String;
begin
  inherited;
  Try
    With vQry Do
    Begin
      valor := IntToStr(UserLog);
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS registros FROM vw_caixas');
      SQL.Add('WHERE date(dtemissao) = :emissao AND cancelado = "Não" AND condicao="Dinheiro"');
      if check_ent_cash.Checked then
        SQL.Add(' AND origem IS NOT NULL')
      else
        SQL.Add(' AND origem = "Digitação"');
      if check_caixas.Checked then
        SQL.Add(' AND idusercad > 0')
      else
        SQL.Add(' AND idusercad = ' + UserLog.ToString);
      ParamByName('emissao').Value := jvdedt_emissao.Date;
      Open;
      totalrg := FieldByName('registros').Value;
      totalpg := Ceil(FieldByName('registros').Value /
        StrToInt(cbox_registros.Text));
      currentrg := 0;
      currentpg := 1;
      direcao := 'Proximo';

      dsCaixas.Enabled := True;
      sbtn_anterior.Enabled := False;
      sbtn_proximo.Enabled := False;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * from vw_caixas');
      SQL.Add('WHERE date(dtemissao) = :emissao AND cancelado = "Não" AND condicao="Dinheiro"');
      if check_ent_cash.Checked then
        SQL.Add(' AND origem IS NOT NULL')
      else
        SQL.Add(' AND origem = "Digitação"');

      if check_caixas.Checked then
        SQL.Add(' AND idusercad > 0')
      else
        SQL.Add(' AND idusercad = ' + UserLog.ToString);

      SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
      ParamByName('emissao').Value := jvdedt_emissao.Date;
      Open;
      if IsEmpty then
      Begin
        MsgInformacao('Não existem dados para exibir');
        Exit;
      End;

      TNumericField(FieldByName('idcaixa')).DisplayFormat := '00';
      TNumericField(FieldByName('idcaixa')).Alignment := taCenter;
      TNumericField(FieldByName('valor')).DisplayFormat := 'R$ ###,##0.00';
      TNumericField(FieldByName('valor')).Alignment := taRightJustify;
      TNumericField(FieldByName('saldo')).DisplayFormat := 'R$ ###,##0.00';
      TNumericField(FieldByName('saldo')).Alignment := taRightJustify;

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

end.
