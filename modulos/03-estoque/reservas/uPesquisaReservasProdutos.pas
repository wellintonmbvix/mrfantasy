unit uPesquisaReservasProdutos;

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

  uRotinas,
  uGlobal,
  uClasseFantasias,
  uControle,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvExControls,
  JvStaticText,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  frxClass,
  frxDBSet, JvComponentBase, JvBalloonHint;

type
  TfPesquisaReservasProdutos = class(TForm)
    pnl_top: TPanel;
    lbl_campo: TLabel;
    sbtn_search: TSpeedButton;
    cbox_campo: TComboBox;
    ledt_valor: TLabeledEdit;
    jvdedt_dtini: TJvDatePickerEdit;
    jvdb_dados: TJvDBGrid;
    pnl_bottom: TPanel;
    dsReservas: TDataSource;
    jvdedt_dtfim: TJvDatePickerEdit;
    Label1: TLabel;
    sbtn_imprimir: TSpeedButton;
    frxReport: TfrxReport;
    frxDBReservas: TfrxDBDataset;
    JvBalloonHint1: TJvBalloonHint;
    rgrp_Retiradas: TRadioGroup;
    rgrp_Devolvidas: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_searchClick(Sender: TObject);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure cbox_campoChange(Sender: TObject);
    procedure check_retiradosClick(Sender: TObject);
    procedure sbtn_imprimirClick(Sender: TObject);
    procedure jvdb_dadosTitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  procedure Pesquisar(orderby : String);
  public
    { Public declarations }
  end;

var
  fPesquisaReservasProdutos : TfPesquisaReservasProdutos;
  selecao                   : TStringBuilder;
  condicao,
  direcao                   : String;
  vControle                 : TControle;
  VQry                      : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal, uReservas;

procedure TfPesquisaReservasProdutos.cbox_campoChange(Sender: TObject);
begin
  VQry.Close;
end;

procedure TfPesquisaReservasProdutos.check_retiradosClick(Sender: TObject);
begin
  VQry.Close;
end;

procedure TfPesquisaReservasProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                    := caFree;
  fPesquisaReservasProdutos := Nil;
end;

procedure TfPesquisaReservasProdutos.FormCreate(Sender: TObject);
begin
  vControle          := TControle.Create;
  VQry               := TFDQuery.Create(Self);
  VQry.Connection    := vControle.Conexao.GetConexao;
  dsReservas.DataSet := VQry;
  selecao            := TStringBuilder.Create;
end;

procedure TfPesquisaReservasProdutos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(VQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaReservasProdutos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
    fPesquisaReservasProdutos.Close;
end;

procedure TfPesquisaReservasProdutos.jvdb_dadosDblClick(Sender: TObject);
begin
  if (VQry.RecordCount = 0) OR
    (VQry.FieldByName('estado')
    .AsString = 'Cancelada') then
    Abort;

  With VQry Do
  Begin
    fReservas.ledt_idreserva.Text :=
      FormatFloat('00000', FieldByName('idtbreserva').Value);
    fReservas.ledt_emissao.Text := FormatDateTime('dd/mm/YYYY',
      FieldByName('dtemissao').Value);
    fReservas.dtp_devolucao.Date := FieldByName('dtdevolucao').Value;
    fReservas.jvcedt_idclie.Text := FieldByName('idtbcliente').AsString;
    fReservas.ledt_cliente.Text := FieldByName('cliente').AsString;
    nUsuario := FieldByName('idusercad').Value;
    nReserva := FieldByName('idtbreserva').Value;
    sReserva := FieldByName('idresvcab').AsString;
    dtEmissao := FieldByName('dtemissao').Value;
  End;

  Self.Close;
end;

procedure TfPesquisaReservasProdutos.jvdb_dadosTitleClick(Column: TColumn);
begin
  if VQry.RecordCount = 0 then
    Abort;
  if direcao = 'ASC' then
    begin
      Pesquisar(Column.FieldName + ' DESC');
      direcao := 'DESC';
    end
  else
    begin
      Pesquisar(Column.FieldName + ' ASC');
      direcao := 'ASC';
    end;
end;

procedure TfPesquisaReservasProdutos.Pesquisar(orderby : String);
begin
  Try
    selecao.Clear;
    selecao.Append('SELECT ');
    selecao.Append('idtbreserva,');
    selecao.Append('idtbempresa,');
    selecao.Append('date(dtemissao) dtemissao,');
    selecao.Append('dtretirada,');
    selecao.Append('dtdevolucao,');
    selecao.Append('funcionario,');
    selecao.Append('idtbcliente,');
    selecao.Append('cliente,');
    selecao.Append('idtbproduto,');
    selecao.Append('produto,');
    selecao.Append('tipo,');
    selecao.Append('devolvido,');
    selecao.Append('retirado,');
    selecao.Append('idusercad');
    selecao.Append(' from vw_reservascab_item');

    case cbox_campo.ItemIndex of
      0:
        Begin
          condicao := ' WHERE date(dtemissao) BETWEEN ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_dtini.Date)) + ' AND '
            + QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_dtfim.Date));
        End;
      1:
        Begin
          condicao := ' WHERE date(dtretirada) BETWEEN ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_dtini.Date)) +
            ' AND  ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdedt_dtfim.Date));
        End;
      2:
        Begin
          condicao := ' WHERE date(dtdevolucao) BETWEEN ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_dtini.Date)) +
            ' AND  ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdedt_dtfim.Date));
        End;
    end;

//    if Not check_retirados.Checked then
//      condicao := condicao + ' AND retirada = "Não"';

//    if rgrp_Devolvidas.ItemIndex = 0 then
//      condicao := condicao + ' AND devolvido = 0'
//    else if rgrp_Devolvidas.ItemIndex = 1 then
//         condicao := condicao + ' AND devolvido = 1';
//
//    if rgrp_Retiradas.ItemIndex = 0 then
//      condicao := condicao + ' AND retirado = "Não"'
//    else if rgrp_Retiradas.ItemIndex = 1 then
//         condicao := condicao + ' AND retirado = "Sim"';

    condicao := condicao + ' AND devolvido = 0';
    condicao := condicao + ' AND retirado = "Não"';


    if ledt_valor.Text <> EmptyStr then
      condicao := condicao + ' AND produto LIKE ' + QuotedStr(ledt_valor.Text + '%');

    selecao.Append(condicao);
    selecao.Append(' AND estado <> "Cancelado" AND idtbempresa = :empresa AND venda = "Não" AND cancelado = "Não" AND dtdevolucao is not null');
    selecao.Append(' group by ');
    selecao.Append('idtbreserva,');
    selecao.Append('idtbempresa,');
    selecao.Append('date(dtemissao),');
    selecao.Append('dtretirada,');
    selecao.Append('dtdevolucao,');
    selecao.Append('funcionario,');
    selecao.Append('idtbcliente,');
    selecao.Append('cliente,');
    selecao.Append('estado,');
    selecao.Append('idtbproduto,');
    selecao.Append('produto,');
    selecao.Append('idusercad ');
    selecao.Append('ORDER BY ' + orderby);

    With VQry Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add(selecao.ToString);
      ParamByName('empresa').Value := EmpLog;
      Open;

      if IsEmpty then
      Begin
        MsgInformacao('Não existem dados para exibir');
        Exit;
      End;

      TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
      TNumericField(FieldByName('idtbreserva')).Alignment     := taCenter;
    End;
  Except
    On e: Exception Do
    Begin
      MsgErro('Erro de rotina' + #13 + e.Message);
    End;
  End;
end;

procedure TfPesquisaReservasProdutos.sbtn_imprimirClick(Sender: TObject);
var
  sqlTmp : TFDQuery;
begin
  dsReservas.Enabled                := False;
  sbtn_search.Click;
  frxDBReservas.DataSet             := VQry;
  VQry.IndexFieldNames              := 'produto';
  frxReport.LoadFromFile(LoadReportStream('rptfantasiasreservadas','rptFantasiasReservadas.fr3'));
  frxReport.PrintOptions.ShowDialog := True;

  sqlTmp            := TFDQuery.Create(nil);
  sqlTmp.Connection := vControle.Conexao.GetConexao;
  sqlTmp.Open('select * from tbparametros');
  frxReport.PrintOptions.Printer := sqlTmp.FieldByName('imp_relatorio').AsString;
  FreeAndNil(sqlTmp);

  With VQry Do
  Begin
    Close;
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbreserva')).Alignment     := taCenter;
  End;

  frxReport.PrepareReport(True);
  frxReport.ShowReport;

  // Refazendo a seleção para quantidade de registros anterior
  VQry.IndexFieldNames := '';
  dsReservas.Enabled := True;
  With VQry Do
  Begin
    Close;
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbreserva')).Alignment := taCenter;
  End;
end;

procedure TfPesquisaReservasProdutos.sbtn_searchClick(Sender: TObject);
begin
  inherited;
  direcao := 'ASC';
    if cbox_campo.ItemIndex = 0 then
      Pesquisar('dtemissao')
    else
      if cbox_campo.ItemIndex = 1 then
        Pesquisar('dtretirada')
      else
        Pesquisar('dtdevolucao');
end;

end.
