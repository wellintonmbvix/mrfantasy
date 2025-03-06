unit uPesquisaReservas;

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
  uControle,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,

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
  frxDBSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  frxExportBaseDialog, frxExportPDF;

type
  TfPesquisaReservas = class(TfPesquisaPadrao)
    Label1: TLabel;
    dsReservas: TDataSource;
    check_canc: TCheckBox;
    jvdedt_inicial: TJvDatePickerEdit;
    Label2: TLabel;
    sbtn_imprimir: TSpeedButton;
    pnl_dtdevolucao: TPanel;
    Label3: TLabel;
    jvedt_dtdevolucao: TJvDatePickerEdit;
    sbt_confirma: TSpeedButton;
    frxReport: TfrxReport;
    frxDBReservas: TfrxDBDataset;
    jvedt_dtretirada: TJvDatePickerEdit;
    Label4: TLabel;
    jvdedt_final: TJvDatePickerEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    rbtn_retsim: TRadioButton;
    rbtn_retnao: TRadioButton;
    rbtn_rettodas: TRadioButton;
    fdqReservas: TFDQuery;
    frxPDFExport: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbox_registrosChange(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure jvdedt_inicialPopupShown(Sender: TObject);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure jvdb_dadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbox_campoChange(Sender: TObject);
    procedure AlterarDtDevolucao(Sender: TObject);
    procedure ImpDataXReservas(Sender: TObject);
    procedure rbtn_retsimClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaReservas   : TfPesquisaReservas;
  currentrg, totalrg  : Integer;
  currentpg, totalpg  : Currency;
  condicao_main,
  impressorareport    : String;
  retiradas           : Integer = 2;
  vControle           : TControle;
  vQry                : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal, uReservas;

procedure TfPesquisaReservas.AlterarDtDevolucao(Sender: TObject);
var
  fdqComando: TFDQuery;
  Controle  : TControle;
begin
  inherited;

  if vQry.FieldByName('dtemissao').Value >
    jvedt_dtdevolucao.Date then
  Begin
    MsgErro('Data informada é inferior a data de emissão');
    Abort;
  End;

  Try
    Controle              := TControle.Create;
    fdqComando            := TFDQuery.Create(Self);
    fdqComando.Connection := Controle.Conexao.GetConexao;
    With fdqComando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasnota SET dtdevolucao = :dtdevolucao, dtretirada = :dtretirada ');
      SQL.Add('WHERE idtbreserva = ' + QuotedStr(vQry.FieldByName('idtbreserva').AsString));
      SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',vQry.FieldByName('dtemissao').Value)));
      ParamByName('dtdevolucao').Value := jvedt_dtdevolucao.Date;
      ParamByName('dtretirada').Value  := jvedt_dtretirada.Date;

      try
        ExecSQL;
        vQry.Refresh;
      except
        On e: Exception Do
        Begin
          MsgErro(e.Message)
        End;
      end;
    End;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(Controle);
    pnl_top.Enabled         := True;
    pnl_bottom.Enabled      := True;
    jvdb_dados.Enabled      := True;
    pnl_dtdevolucao.Visible := False;
  End;
end;

procedure TfPesquisaReservas.cbox_campoChange(Sender: TObject);
begin
  inherited;
  if TComboBox(Sender).Text = 'Data de Devolução' then
    Label1.Caption := TComboBox(Sender).Text
  else
    Label1.Caption := 'Data de Emissão';

  case cbox_campo.ItemIndex of
    0:
      Begin
        jvdb_dados.Columns[1].FieldName     := 'dtemissao';
        jvdb_dados.Columns[1].Title.Caption := 'Emissão';
        jvdedt_inicial.Enabled              := True;
        jvdedt_final.Enabled                := True;
      End;
    1:
      Begin
        jvdb_dados.Columns[1].FieldName     := 'dtdevolucao';
        jvdb_dados.Columns[1].Title.Caption := 'Devolução';
        jvdedt_inicial.Enabled              := True;
        jvdedt_final.Enabled                := True;
      End;
    2:
      Begin
        jvdb_dados.Columns[1].FieldName     := 'dtemissao';
        jvdb_dados.Columns[1].Title.Caption := 'Emissão';
        jvdedt_inicial.Enabled              := False;
        jvdedt_final.Enabled                := False;
      End;
  end;
end;

procedure TfPesquisaReservas.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsReservas.Enabled := False;
end;

procedure TfPesquisaReservas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaReservas := Nil;
end;

procedure TfPesquisaReservas.FormCreate(Sender: TObject);
begin
  inherited;
  vControle          := TControle.Create;
  vQry               := TFDQuery.Create(Self);
  vQry.Connection    := vControle.Conexao.GetConexao;
  dsReservas.DataSet := vQry;
end;

procedure TfPesquisaReservas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaReservas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaReservas.Close;
end;

procedure TfPesquisaReservas.ImpDataXReservas(Sender: TObject);
var
  Controle: TControle;
  sqlTmp  : TFDQuery;
begin
  inherited;
  sbtn_search.Click;

  if vQry.RecordCount = 0 then
    Abort;

  Try
    Controle                    := TControle.Create;
    sqlTmp                      := TFDQuery.Create(Self);
    sqlTmp.Connection           := Controle.Conexao.GetConexao;

    sqlTmp.Open('select * from tbparametros');

    frxReport.LoadFromFile(LoadReportStream('rptdataalugueis','rptDataAlugueis.fr3'));
    frxReport.PrintOptions.ShowDialog := True;
    frxReport.PrintOptions.Printer    := sqlTmp.FieldByName('imp_relatorio').AsString;

    Try
      With sqlTmp Do
      Begin

      {$REGION 'Somatório das condições'}
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as fundo FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND tpmov = "Fundo"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['fundoscx'] :=
          StringReplace(FieldByName('fundo').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as suprimento FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND tpmov = "Suprimento"');
        SQL.Add('AND origem = "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['suprimentos'] :=
          StringReplace(FieldByName('suprimento').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as sangria FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND tpmov = "Sangria"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['sangrias'] :=
          StringReplace(FieldByName('sangria').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totalcash FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND condicao = "Dinheiro"');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totalcash'] :=
          StringReplace(FieldByName('totalcash').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totalcard_debi FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND condicao = "Cartão Débito"');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totalcard_deb'] :=
          StringReplace(FieldByName('totalcard_debi').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totalcard_cred FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND condicao = "Cartão Crédito"');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totalcard_cre'] :=
          StringReplace(FieldByName('totalcard_cred').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totalwallet FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND condicao <> "Cartão Crédito"');
        SQL.Add('AND condicao <> "Cartão Débito"');
        SQL.Add('AND condicao <> "Dinheiro"');
        SQL.Add('AND condicao <> "Transf./Dep."');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totalwallet'] :=
          StringReplace(FieldByName('totalwallet').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totaltransfdep FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND condicao = "Transf./Dep."');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totaltransfdep'] :=
          StringReplace(FieldByName('totaltransfdep').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(qtde),0) AS total_alugadas FROM tbreservasitem a');
        SQL.Add('WHERE date(a.dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        case retiradas of
         0: SQL.Add(' AND a.retirado = 1');
         1: SQL.Add(' AND a.retirado = 0');
        end;
        SQL.Add(' AND a.canc = 0 and a.venda = 0 AND a.idtbreservanota in (select idtbreserva from tbreservasnota where dtdevolucao is not null AND date(dtemissao) BETWEEN '+
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)) + ')');
        Open;
        frxReport.Variables['qtde_alugadas'] :=
          StringReplace(FieldByName('total_alugadas').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT (SELECT IFNULL(SUM(qtde_total),0) FROM tbvendasnota ');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        SQL.Add('AND estado <> "C") + ');

        SQL.Add('(SELECT IFNULL(SUM(qtde),0) FROM tbreservasitem ');
        SQL.Add('WHERE date(dtemissao) BETWEEN ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_final.Date)));
        case retiradas of
         0: SQL.Add(' AND retirado = 1');
         1: SQL.Add(' AND retirado = 0');
        end;
        SQL.Add(' AND canc = 0 AND venda = 1) as total_vendidas from tbreservasnota GROUP BY total_vendidas');
        Open;
        frxReport.Variables['qtde_vendidas'] :=
          StringReplace(FieldByName('total_vendidas').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        {$ENDREGION}

        // Inibindo exibição de produtos cancelados
        condicao_main := condicao_main + ' AND cancelado = ' + QuotedStr('Não');

        Close;
        SQL.Clear;
        SQL.Add('select * from vw_reservascab_item');
        SQL.Add(condicao_main);
        SQL.Add('ORDER BY date(dtemissao), idtbreserva, item');
        ParamByName('empresa').Value := EmpLog;
        Open;
      End;

      if sqlTmp.RecordCount = 0 then
        Begin
          MsgInformacao('Não existem dados para imprimir');
          Exit;
        End;

      frxDBReservas.DataSet := sqlTmp;
      frxReport.PrepareReport;
      frxReport.ShowReport;
    Except
      On E : Exception Do
        MsgErro(E.Message);
    End;
  Finally
    FreeAndNil(sqlTmp);
    FreeAndNil(Controle);
  End;
end;

procedure TfPesquisaReservas.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if (vQry.RecordCount = 0) OR
    (vQry.FieldByName('estado')
    .AsString = 'Cancelada') then
    Abort;

  With vQry Do
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
    sReserva := FieldByName('idtbreserva').AsString;
    nTerminal := FieldByName('pdv').Value;
    dtEmissao := FieldByName('dtemissao').Value;
  End;

  Self.Close;
end;

procedure TfPesquisaReservas.jvdb_dadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Controle  : TControle;
  fdqComando: TFDQuery;
begin
  inherited;
  if vQry.FieldByName('retirada').AsString = 'Não'
  then
  Begin
{$REGION 'Key F2 Pressionada'}
    if Key = vk_F2 then
    Begin
      if Not MsgConfirmacao('Confirmar retirada da(s) mercadoria(s)?') then
        Abort;

      Try
        Controle              := TControle.Create;
        fdqComando            := TFDQuery.Create(Self);
        fdqComando.Connection := Controle.Conexao.GetConexao;
        With fdqComando Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbreservasnota SET retirada = 1');
          SQL.Add('WHERE idtbreserva = ' + QuotedStr(vQry.FieldByName('idtbreserva').AsString));
          SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',vQry.FieldByName('dtemissao').Value)));

          Try
            ExecSQL;
          Except
            On e: Exception Do
            Begin
              MsgErro('Erro de rotina' + #13 + e.Message);
            End;
          End;
        End;
        vQry.Refresh;
      Finally
        FreeAndNil(fdqComando);
        FreeAndNil(Controle);
      End;
    End;

{$ENDREGION}
{$REGION 'Key F3 Pressionada'}
    if Key = vk_F3 then
    Begin
      if vQry.FieldByName('retirada').AsString = 'Sim'
      then
      begin
        MsgAviso('Alterar Data de Devolução somente para reserva(s) não retirada(s)');
        Abort;
      end;
      AlinharPanel(Self, pnl_dtdevolucao, True);
      pnl_dtdevolucao.Visible := True;
      jvedt_dtdevolucao.Date := vQry.FieldByName
        ('dtdevolucao').Value;
      jvedt_dtretirada.Date := vQry.FieldByName
        ('dtretirada').Value;
      pnl_top.Enabled := False;
      pnl_bottom.Enabled := False;
      jvdb_dados.Enabled := False;
      pnl_dtdevolucao.Enabled := True;
    End;
{$ENDREGION}
  End;
end;

procedure TfPesquisaReservas.jvdedt_inicialPopupShown(Sender: TObject);
begin
  inherited;
  dsReservas.Enabled := False;
end;

procedure TfPesquisaReservas.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsReservas.Enabled := False;
end;

procedure TfPesquisaReservas.rbtn_retsimClick(Sender: TObject);
begin
  inherited;
  retiradas := TRadioButton(Sender).Tag;
end;

procedure TfPesquisaReservas.sbtn_anteriorClick(Sender: TObject);
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_reservasnota');
    SQL.Add(condicao_main);
    SQL.Add('ORDER BY idtbreserva');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbreserva')).Alignment     := taCenter;
    TNumericField(FieldByName('valor_total')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor_total')).Alignment     := taRightJustify;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaReservas.sbtn_proximoClick(Sender: TObject);
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;

  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from vw_reservasnota');
    SQL.Add(condicao_main);
    SQL.Add('ORDER BY idtbreserva');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbreserva')).Alignment     := taCenter;
    TNumericField(FieldByName('valor_total')).DisplayFormat := 'R$ ###,##0.00';
    TNumericField(FieldByName('valor_total')).Alignment     := taRightJustify;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

procedure TfPesquisaReservas.sbtn_searchClick(Sender: TObject);
begin
  inherited;
  Try
    case cbox_campo.ItemIndex of
      0:
        Begin
          condicao_main := 'WHERE date(dtemissao) BETWEEN ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) +
            ' AND ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdedt_final.Date));
        End;
      1:
        Begin
          condicao_main := 'WHERE date(dtdevolucao) BETWEEN ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdedt_inicial.Date)) +
            ' AND ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdedt_final.Date));
        End;
      2:
        Begin
          condicao_main := 'WHERE cliente LIKE ' +
            QuotedStr(ledt_valor.Text + '%'); // Removido condição período de emissão
        End;
    end;

    case retiradas of
      0 :
        condicao_main := condicao_main + ' AND retirada = "Sim"';
      1 :
        condicao_main := condicao_main + ' AND retirada = "Não"';
      2 :
        condicao_main := condicao_main + ' AND retirada IS NOT NULL';
    end;

    if check_canc.Checked = True then
      condicao_main := condicao_main + ' AND estado Like ' + QuotedStr('%')
    else
      if cbox_campo.ItemIndex = 1 then
        condicao_main := condicao_main + ' AND estado <> ' + QuotedStr('Cancelado')
      else
        condicao_main := condicao_main + ' AND estado = ' + QuotedStr('Fechado');

    condicao_main := condicao_main +
      ' AND idtbempresa = :empresa AND qtde_total > 0';

    With vQry Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS registros FROM vw_reservasnota');
      SQL.Add(condicao_main);
      ParamByName('empresa').Value := EmpLog;
      Open;
      totalrg := FieldByName('registros').Value;
      totalpg := Ceil(FieldByName('registros').Value /
        StrToInt(cbox_registros.Text));
      currentrg := 0;
      currentpg := 1;

      dsReservas.Enabled    := True;
      sbtn_anterior.Enabled := False;
      sbtn_proximo.Enabled  := False;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * from vw_reservasnota');
      SQL.Add(condicao_main);
      SQL.Add('ORDER BY date(dtcadastro), idtbreserva');
      SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
      ParamByName('empresa').Value := EmpLog;
      Open;
      if IsEmpty then
      Begin
        MsgInformacao('Não existem dados para exibir');
        Exit;
      End;

      TNumericField(FieldByName('idtbreserva')).DisplayFormat := '00000';
      TNumericField(FieldByName('idtbreserva')).Alignment     := taCenter;
      TNumericField(FieldByName('valor_total')).DisplayFormat :=
        'R$ ###,##0.00';
      TNumericField(FieldByName('valor_total')).Alignment     := taRightJustify;

      if totalrg > StrToInt(cbox_registros.Text) then
      Begin
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := True;
      End;
    End;
  Except
    On e: Exception Do
    Begin
      MsgErro('Erro de rotina' + #13 + e.Message);
    End;
  End;
end;

end.
