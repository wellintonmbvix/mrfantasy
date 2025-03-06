unit uPesquisaVendas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  System.StrUtils,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Mask,

  uControle,
  uRotinas,
  uGlobal,
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
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TfPesquisaVendas = class(TfPesquisaPadrao)
    jvdedt_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    dsVendas: TDataSource;
    check_canc: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbox_registrosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure jvdedt_emissaoPopupShown(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaVendas: TfPesquisaVendas;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  vQry : TFDQuery;
  vControle : TControle;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaVendas.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsVendas.Enabled := False;
end;

procedure TfPesquisaVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaVendas := Nil;
end;

procedure TfPesquisaVendas.FormCreate(Sender: TObject);
begin
  inherited;
  vControle        := TControle.Create;
  vQry             := TFDQuery.Create(Self);
  vQry.Connection  := vControle.Conexao.GetConexao;
  dsVendas.DataSet := vQry;
end;

procedure TfPesquisaVendas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaVendas.Close;
end;

procedure TfPesquisaVendas.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if (vQry.RecordCount = 0) OR
    (vQry.FieldByName('estado')
    .AsString = 'Cancelada') then
    Abort;

  nVenda := vQry.FieldByName('idtbvendanota').Value;

  Self.Close;
end;

procedure TfPesquisaVendas.jvdedt_emissaoPopupShown(Sender: TObject);
begin
  inherited;
  dsVendas.Enabled := False;
end;

procedure TfPesquisaVendas.sbtn_anteriorClick(Sender: TObject);
var
 condicao: String;
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';

  case cbox_campo.ItemIndex of
    0:
      Begin
        condicao := 'WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
      End;
    1:
      Begin
        condicao := 'WHERE cliente LIKE ' + QuotedStr(ledt_valor.Text + '%') +
          ' AND date(dtemissao) >= ' +
          QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
      End;
  end;

  if check_canc.Checked = True then
    condicao := condicao + ' AND estado Like ' + QuotedStr('%')
  else
    condicao := condicao + ' AND estado <> ' + QuotedStr('Cancelada');

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_vendasnota');
    SQL.Add(condicao);
    SQL.Add('AND idtbempresa = :empresa AND qtde_total > 0');
    SQL.Add('ORDER BY idtbvendanota');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbvendanota')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbvendanota')).Alignment := taCenter;
    TNumericField(FieldByName('valor_total')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor_total')).Alignment := taRightJustify;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaVendas.sbtn_proximoClick(Sender: TObject);
var
  condicao: String;
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';

  case cbox_campo.ItemIndex of
    0:
      Begin
        condicao := 'WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
      End;
    1:
      Begin
        condicao := 'WHERE cliente LIKE ' + QuotedStr(ledt_valor.Text + '%') +
          ' AND date(dtemissao) >= ' +
          QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
      End;
  end;

  if check_canc.Checked = True then
    condicao := condicao + ' AND estado Like ' + QuotedStr('%')
  else
    condicao := condicao + ' AND estado <> ' + QuotedStr('Cancelada');

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_vendasnota');
    SQL.Add(condicao);
    SQL.Add('AND idtbempresa = :empresa AND qtde_total > 0');
    SQL.Add('ORDER BY idtbvendanota');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbvendanota')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbvendanota')).Alignment := taCenter;
    TNumericField(FieldByName('valor_total')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor_total')).Alignment := taRightJustify;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

procedure TfPesquisaVendas.sbtn_searchClick(Sender: TObject);
var
  condicao: String;
begin
  inherited;
  Try
    case cbox_campo.ItemIndex of
      0:
        Begin
          condicao := 'WHERE date(dtemissao) = ' +
            QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
        End;
      1:
        Begin
          condicao := 'WHERE cliente LIKE ' + QuotedStr(ledt_valor.Text + '%') +
            ' AND date(dtemissao) >= ' +
            QuotedStr(FormatDateTime('YYY-mm-dd', jvdedt_emissao.Date));
        End;
    end;

    if check_canc.Checked = True then
      condicao := condicao + ' AND estado Like ' + QuotedStr('%')
    else
      condicao := condicao + ' AND estado <> ' + QuotedStr('Cancelada');

    With vQry Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS registros FROM vw_vendasnota');
      SQL.Add(condicao);
      SQL.Add('AND idtbempresa = :empresa AND qtde_total > 0');
      ParamByName('empresa').Value := EmpLog;
      Open;
      totalrg := FieldByName('registros').Value;
      totalpg := Ceil(FieldByName('registros').Value /
        StrToInt(cbox_registros.Text));
      currentrg := 0;
      currentpg := 1;
      direcao := 'Proximo';

      dsVendas.Enabled := True;
      sbtn_anterior.Enabled := False;
      sbtn_proximo.Enabled := False;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * from vw_vendasnota');
      SQL.Add(condicao);
      SQL.Add('AND idtbempresa = :empresa AND qtde_total > 0');
      SQL.Add('ORDER BY idtbvendanota');
      SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
      ParamByName('empresa').Value := EmpLog;
      Open;
      if IsEmpty then
      Begin
        MsgInformacao('Não existem dados para exibir');
        Exit;
      End;

      TNumericField(FieldByName('idtbvendanota')).DisplayFormat := '00000';
      TNumericField(FieldByName('idtbvendanota')).Alignment := taCenter;
      TNumericField(FieldByName('valor_total')).DisplayFormat :=
        'R$ ###,##0.00';
      TNumericField(FieldByName('valor_total')).Alignment := taRightJustify;

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
