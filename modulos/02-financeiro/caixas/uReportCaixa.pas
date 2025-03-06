unit uReportCaixa;

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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Mask,

  JvExMask,
  JvToolEdit,
  JvExControls,
  JvStaticText,
  JvSpeedButton,
  JvExStdCtrls,
  JvRadioButton,
  JvGroupBox,

  Data.DB,

  frxClass,
  frxDBSet,
  frxExportBaseDialog,
  frxExportPDF,

  uClasseUsuarios,
  uGlobal,
  uRotinas,
  uPrincipal,
  uControle,
  FireDAC.Comp.DataSet,
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
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait;
type
  TfReportCaixa = class(TForm)
    Label1: TLabel;
    cboxReport: TComboBox;
    Label2: TLabel;
    dtpData: TDateTimePicker;
    jvceCaixa: TJvComboEdit;
    jvstCaixa: TJvStaticText;
    Label3: TLabel;
    jvsbtnImprimir: TJvSpeedButton;
    JvGroupBox1: TJvGroupBox;
    jvrbNao: TJvRadioButton;
    jvrbSim: TJvRadioButton;
    jvrbTodos: TJvRadioButton;
    frxReport: TfrxReport;
    frxDBMaster: TfrxDBDataset;
    fdMaster: TFDQuery;
    frxDBReservas: TfrxDBDataset;
    frxDBVendas: TfrxDBDataset;
    fdReservas: TFDQuery;
    fdVEndas: TFDQuery;
    frxPDFExport: TfrxPDFExport;
    JvGroupBox2: TJvGroupBox;
    jvrbItensCancNao: TJvRadioButton;
    jvrbItensCancSim: TJvRadioButton;
    jvrbItensCancTodos: TJvRadioButton;
    FDConnection: TFDConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure jvceCaixaChange(Sender: TObject);
    procedure jvceCaixaButtonClick(Sender: TObject);
    procedure jvceCaixaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvsbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fReportCaixa: TfReportCaixa;
  comando1,
  comando2,
  comando3: String;
  vControle : TControle;
implementation

uses
  view.cadastros.usuarioPesquisa;
{$R *.dfm}
procedure TfReportCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fReportCaixa := Nil;
end;
procedure TfReportCaixa.FormCreate(Sender: TObject);
begin
  vControle             := TControle.Create;
  fdMaster.Connection   := vControle.Conexao.GetConexao;
  fdReservas.Connection := vControle.Conexao.GetConexao;
  fdVendas.Connection   := vControle.Conexao.GetConexao;
  frxDBMaster.DataSet   := fdMaster;
  frxDBReservas.DataSet := fdReservas;
  frxDBVendas.DataSet   := fdVEndas;
  dtpData.Date          := Date();
end;
procedure TfReportCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If Key = #13 then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;
procedure TfReportCaixa.jvceCaixaButtonClick(Sender: TObject);
var
  ClasseUsuarios: TClasseUsuarios;
begin
  inherited;
  Try
    ClasseUsuarios := TClasseUsuarios.Create(vControle);
    With ClasseUsuarios Do
    Begin
      nUsuario := 0;
      OpenFormModal(TfrmPesquisaUsuarios, frmPesquisaUsuarios);
      if nUsuario > 0 then
      Begin
        CarregaDados(nUsuario);
        jvceCaixa.Text := FormatFloat('000', Usuario);
        jvstCaixa.Caption := UserName;
      End;
    End;
  Finally
    FreeAndNil(ClasseUsuarios);
  End;
end;
procedure TfReportCaixa.jvceCaixaChange(Sender: TObject);
var
  ClasseUsuarios: TClasseUsuarios;
begin
  if jvceCaixa.Text <> EmptyStr then
  Begin
    Try
      ClasseUsuarios := TClasseUsuarios.Create(vControle);
      With ClasseUsuarios Do
      Begin
        nUsuario := StrToInt(jvceCaixa.Text);
        if nUsuario > 0 then
        Begin
          CarregaDados(nUsuario);
          if UserName <> EmptyStr then
            jvstCaixa.Caption := UserName
          else
            jvstCaixa.Caption := ' Inexistente';
        End;
      End;
    Finally
      FreeAndNil(ClasseUsuarios);
    End;
  End
  else
    jvstCaixa.Caption := ' Todos';
end;
procedure TfReportCaixa.jvceCaixaExit(Sender: TObject);
begin
  if (jvceCaixa.Text <> EmptyStr) And (jvstCaixa.Caption = ' Inexistente') then
    jvceCaixa.SetFocus;
end;
procedure TfReportCaixa.jvsbtnImprimirClick(Sender: TObject);
var
  sqlTmp: TFDQuery;
  registros : Integer;
begin
  // Definindo filtro caixa ou todos
  if jvceCaixa.Text <> EmptyStr then
    comando2 := 'AND idusercad = ' + jvceCaixa.Text
  else
    comando2 := 'AND idusercad > 0';
  // Definindo filtro para tipo de relatório
  if cboxReport.ItemIndex = 0 then
    comando3 := 'AND LENGTH(origem)>0'
  else if cboxReport.ItemIndex = 1 then
    comando3 := 'AND origem <> "Digitação"';
  // Chamando relatório pelo tipo escolhido
  if cboxReport.ItemIndex = 0 then
  Begin
    // Definindo filtro se cancelado ou não
    if jvrbTodos.Checked then
      comando1 := 'AND LENGTH(cancelado)>=0'
    else if jvrbSim.Checked then
      comando1 := 'AND LENGTH(cancelado)>0'
    else
      comando1 := 'AND LENGTH(cancelado)=0';
    fdMaster.Fields.Clear;
    With fdMaster Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM vw_boletim');
      SQL.Add('WHERE date(dtemissao) = ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
      SQL.Add(comando1);
      SQL.Add(comando2);
      SQL.Add(comando3);
      Open;
      if IsEmpty then
      Begin
        MsgInformacao('Não existem dados para imprimir');
        Abort;
      End;
    End;
    frxReport.LoadFromFile(LoadReportStream('rptcxadiario','rptCxaDiario.fr3'));
    frxReport.PrintOptions.ShowDialog := True;
    Try
      sqlTmp            := TFDQuery.Create(Application);
      sqlTmp.Connection := vControle.Conexao.GetConexao;
      sqlTmp.Open('select * from tbparametros');
      frxReport.PrintOptions.Printer := sqlTmp.FieldByName('imp_relatorio').AsString;
    Finally
      FreeAndNil(sqlTmp);
    End;
    frxReport.PrepareReport;
    frxReport.ShowReport;
  End
  else if cboxReport.ItemIndex = 1 then
  Begin
    comando1 := 'WHERE date(dtemissao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date));
    if jvrbNao.Checked then
      comando1 := comando1 + ' AND estado <> "Cancelado"'
    else if jvrbSim.Checked then
        comando1 := comando1 + ' AND estado = "Cancelado"';
    if jvrbItensCancNao.Checked then
      comando1 := comando1 + ' AND cancelado = "Não"'
    else if jvrbItensCancSim.Checked then
         comando1 := comando1 + ' AND cancelado = "Sim"';
    if jvceCaixa.Text <> EmptyStr then
      comando1 := comando1 + ' AND idusercad = ' + jvceCaixa.Text;

    With fdReservas Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM vw_reservascab_item');
      SQL.Add(comando1);
      SQL.Add('ORDER BY dtemissao, item');
      Open;
    End;
    registros := fdReservas.RecordCount;
    comando1 := 'WHERE date(dtemissao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date));
    if jvrbNao.Checked then
      comando1 := comando1 + ' AND estado <> "Cancelada"'
    else if jvrbSim.Checked then
        comando1 := comando1 + ' AND estado = "Cancelada"';
    if jvrbItensCancNao.Checked then
      comando1 := comando1 + ' AND cancelado <> "Sim"'
    else if jvrbItensCancSim.Checked then
         comando1 := comando1 + ' AND cancelado = "Sim"';
    if jvceCaixa.Text <> EmptyStr then
      comando1 := comando1 + ' AND idusercad = ' + jvceCaixa.Text;
    With fdVEndas Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM vw_vendascab_item');
      SQL.Add(comando1);
      SQL.Add('ORDER BY dtemissao, item');
      Open;
    End;
    registros := registros + fdVendas.RecordCount;
    if (fdReservas.IsEmpty) AND (fdVEndas.IsEmpty) then
    Begin
      MsgInformacao('Não existem dados para imprimir');
      Abort;
    End;
    Try
      sqlTmp            := TFDQuery.Create(Application);
      sqlTmp.Connection := vControle.Conexao.GetConexao;
      frxReport.LoadFromFile(LoadReportStream('rptdatacupom','rptDataCupom.fr3'));
      frxReport.PrintOptions.ShowDialog := True;
      sqlTmp.Open('select * from tbparametros');
      frxReport.PrintOptions.Printer := sqlTmp.FieldByName('imp_relatorio').AsString;
      With sqlTmp Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as fundo FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
        SQL.Add('AND tpmov = "Fundo"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['fundoscx'] :=
          StringReplace(FieldByName('fundo').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as suprimento FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
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
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
        SQL.Add('AND tpmov = "Sangria"');
         SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['sangrias'] :=
          StringReplace(FieldByName('sangria').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as totalcash FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
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
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
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
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
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
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
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
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
        SQL.Add('AND condicao = "Transf./Dep."');
        SQL.Add('AND origem <> "D"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['totaltransfdep'] :=
          StringReplace(FieldByName('totaltransfdep').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(qtde_total),0) AS total_alugadas FROM tbreservasnota');
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
        SQL.Add('AND estado <> "C"');
        Open;
        frxReport.Variables['qtde_alugadas'] :=
          StringReplace(FieldByName('total_alugadas').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(qtde_total),0) AS total_vendidas FROM tbvendasnota');
        SQL.Add('WHERE date(dtemissao) = ' +
          QuotedStr(FormatDateTime('YYYY-mm-dd', dtpData.Date)));
        SQL.Add('AND estado <> "C"');
        Open;
        frxReport.Variables['qtde_vendidas'] :=
          StringReplace(FieldByName('total_vendidas').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
      End;
    Finally
      FreeAndNil(sqlTmp);
    End;
    frxReport.PrepareReport;
    frxReport.ShowReport;
  End;
end;
end.
