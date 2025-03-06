unit uReservas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  System.Actions,
  System.Types,

  uClasseReservas,
  uClasseClientes,
  uClasseFantasias,
  uClasseFuncionarios,
  uGlobal,
  uControle,
  uRotinas,

  classe.global,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.ActnList,

  JvExMask,
  JvToolEdit,
  JvExStdCtrls,
  JvEdit,
  JvValidateEdit,
  JvSpin,
  JvExDBGrids,
  JvDBGrid,
  JvHint,
  JvComponentBase,
  JvBalloonHint,
  JvExControls,
  JvStaticText,

  frxClass,
  frxDBSet,
  frxExportBaseDialog,
  frxExportPDF,
  frxExportText,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  tpImpressao = (tpBobina, tpA4);

type
  TfReservas = class(TForm)
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    sbtnNovo: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    sbtnSair: TSpeedButton;
    shp2: TShape;
    shp1: TShape;
    sbtnPagamento: TSpeedButton;
    ledt_idreserva: TLabeledEdit;
    ledt_emissao: TLabeledEdit;
    jvcedt_idclie: TJvComboEdit;
    Label1: TLabel;
    ledt_cliente: TLabeledEdit;
    Shape1: TShape;
    pnlProdutos: TPanel;
    sbtnIncluir: TSpeedButton;
    ledt_fantasia: TLabeledEdit;
    jvsedt_qtde: TJvSpinEdit;
    Label2: TLabel;
    jvcedt_idproduto: TJvComboEdit;
    Label3: TLabel;
    ledt_vlaluguel: TLabeledEdit;
    jvv_percdesc: TJvValidateEdit;
    Label4: TLabel;
    jvv_valdesc: TJvValidateEdit;
    Label5: TLabel;
    ledt_item: TLabeledEdit;
    jvdb_dados: TJvDBGrid;
    dsItens: TDataSource;
    lbl_qtde: TLabel;
    lbl_total: TLabel;
    sbtnDevolucao: TSpeedButton;
    Shape2: TShape;
    dtp_devolucao: TDateTimePicker;
    Label7: TLabel;
    JvBalloonHint1: TJvBalloonHint;
    mem_obs: TMemo;
    Label6: TLabel;
    Label8: TLabel;
    dtp_retirada: TDateTimePicker;
    sbtnVendas: TSpeedButton;
    Shape3: TShape;
    sbtnImprimir: TSpeedButton;
    Shape4: TShape;
    pmnImpressao: TPopupMenu;
    mnComprovante: TMenuItem;
    frxReport: TfrxReport;
    frxDBDNota: TfrxDBDataset;
    frxDBDItem: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxSimpleTextExport: TfrxSimpleTextExport;
    ActionList: TActionList;
    actImpComp: TAction;
    jvcedt_idfun: TJvComboEdit;
    Label9: TLabel;
    ledt_funcionario: TLabeledEdit;
    ledt_venda: TLabeledEdit;
    cbx_venda: TComboBox;
    PopupMenu: TPopupMenu;
    mnpesquisa_reservas: TMenuItem;
    mnpesquisa_reservasprodutos: TMenuItem;
    pnl_trocaproduto: TPanel;
    ledt_produto: TLabeledEdit;
    jvcedt_produto: TJvComboEdit;
    jvst_produto: TJvStaticText;
    sbtn_confirmar: TSpeedButton;
    lbl_trocaprod: TLabel;
    jvcedt_vlaluguel: TJvValidateEdit;
    pnl_desc: TPanel;
    ledt_desc: TLabeledEdit;
    sbtnCancelarItem: TSpeedButton;
    fdmReservaCab: TFDMemTable;
    fdmReservaItem: TFDMemTable;
    fdmReservaItemproduto: TWideStringField;
    fdmReservaItemvenda: TWideStringField;
    fdmReservaItemqtde: TIntegerField;
    fdmReservaItempreco_tabela: TBCDField;
    fdmReservaItemperc_desc: TBCDField;
    fdmReservaItemvalor_desc: TBCDField;
    fdmReservaItemvalor_total: TBCDField;
    fdmReservaItemcancelado: TWideStringField;
    fdmReservaItemdevolvido: TWideStringField;
    fdmReservaItempdv: TIntegerField;
    fdmReservaItemidtbempresa: TIntegerField;
    fdmReservaItemempresa: TWideStringField;
    fdmReservaItemdtemissao: TDateField;
    fdmReservaItemidtbproduto: TIntegerField;
    fdmReservaItemtipo: TWideStringField;
    fdmReservaItemvalor_unit: TBCDField;
    fdmReservaItemperc_acre: TBCDField;
    fdmReservaItemvalor_acre: TBCDField;
    fdmReservaItemretirado: TWideStringField;
    fdmReservaItemdtcadastro: TDateField;
    fdmReservaItemidusercad: TIntegerField;
    fdmReservaItemusercad: TWideStringField;
    fdmReservaItemdtalterado: TDateField;
    fdmReservaItemiduseralt: TIntegerField;
    fdmReservaItemuseralt: TWideStringField;
    fdmReservaItemitem: TIntegerField;
    fdmReservaItemidtbreservanota: TIntegerField;
    fdmReservaItemidtbreservasitem: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvcedt_idclieButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnIncluirClick(Sender: TObject);
    procedure jvcedt_idprodutoButtonClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure jvdb_dadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbtnPagamentoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure sbtnDevolucaoClick(Sender: TObject);
    procedure mem_obsEnter(Sender: TObject);
    procedure mem_obsExit(Sender: TObject);
    procedure mem_obsKeyPress(Sender: TObject; var Key: Char);
    procedure jvv_percdescClick(Sender: TObject);
    procedure jvcedt_idprodutoExit(Sender: TObject);
    procedure jvcedt_idprodutoChange(Sender: TObject);
    procedure jvv_valdescKeyPress(Sender: TObject; var Key: Char);
    procedure jvv_valdescEnter(Sender: TObject);
    procedure jvcedt_idclieChange(Sender: TObject);
    procedure sbtnVendasClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure actImpCompExecute(Sender: TObject);
    procedure mnComprovanteClick(Sender: TObject);
    procedure jvcedt_idfunButtonClick(Sender: TObject);
    procedure jvv_percdescChange(Sender: TObject);
    procedure jvv_valdescChange(Sender: TObject);
    procedure jvv_percdescEnter(Sender: TObject);
    procedure jvv_valdescClick(Sender: TObject);
    procedure jvv_percdescExit(Sender: TObject);
    procedure jvv_valdescExit(Sender: TObject);
    procedure jvcedt_idfunChange(Sender: TObject);
    procedure jvdb_dadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnpesquisa_reservasClick(Sender: TObject);
    procedure mnpesquisa_reservasprodutosClick(Sender: TObject);
    procedure jvcedt_produtoButtonClick(Sender: TObject);
    procedure jvcedt_produtoChange(Sender: TObject);
    procedure jvcedt_produtoExit(Sender: TObject);
    procedure sbtn_confirmarClick(Sender: TObject);
    procedure jvcedt_vlaluguelChange(Sender: TObject);
    procedure jvcedt_vlaluguelClick(Sender: TObject);
    procedure jvcedt_vlaluguelEnter(Sender: TObject);
    procedure jvcedt_vlaluguelExit(Sender: TObject);
    procedure ledt_descKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnCancelarItemClick(Sender: TObject);
    procedure jvdb_dadosCellClick(Column: TColumn);
    procedure jvdb_dadosExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure jvcedt_idprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvcedt_idclieExit(Sender: TObject);
    procedure jvcedt_idfunExit(Sender: TObject);
  private
    { Private declarations }
    procedure RemoveItem;
    procedure LimparItem(Enabled: Boolean);
    procedure SelecionaItem;
    procedure CalcularDesconto(Metodo: Integer);
    procedure ListaCab(vEmpresa, vReserva, vTerminal : Integer; vEmissao : TDateTime); overload;
    procedure ListaItens(vEmpresa, vReserva, vTerminal : Integer; vEmissao : TDateTime); overload;

    procedure ListaCab(vReserva : String; DtEmissao: TDateTime); overload;
    procedure ListaItens(vReserva : String; DtEmissao: TDateTime); overload;
    function TrocaProduto(GuidItem: String; Produto: Integer;
      out Erro: String): Boolean;
  public
    { Public declarations }
    baixa_stock: Boolean;
    FTpBobina: tpImpressao;
  end;

var
  fReservas  : TfReservas;
  operacao,
  condpagto,
  commandsql,
  printercomp,
  reservaguid : String;
  descacre    : String = 'desconto';

implementation

{$R *.dfm}

uses
  uPrincipal,
  uPagtoReservas,
  uPesquisaReservas,
  uVendas,
  uPesquisaReservasProdutos,
  uImprimeComprovante,
  view.cadastros.clientePesquisa,
  view.cadastros.produtoPesquisa,
  view.cadastros.funcionarioPesquisa;

procedure TfReservas.actImpCompExecute(Sender: TObject);
begin
  frxDBDNota.DataSet := fdmReservaCab;
  frxDBDItem.DataSet := fdmReservaItem;
  if Not fdmReservaCab.Active then
  Begin
    MsgErro('Nenhum documento aberto');
    Abort;
  End;

  if fdmReservaCab.RecordCount = 0 then
  Begin
    MsgAviso('Não existem dados para imprimir');
    Abort;
  End;

  ListaCab(fdmReservaCab.Fields[0].AsString, fdmReservaCab.Fields[14].Value);
  ListaItens(fdmReservaCab.Fields[0].AsString, fdmReservaCab.Fields[5].Value);

  // 15/05/21 Comentei essa linha até que conclua o comprovante em folha A4
  // OpenFormModal(TfImprimeComprovante, fImprimeComprovante);

  frxReport.ReportOptions.CreateDate := Date();
  frxReport.ReportOptions.LastChange := Date();
  frxReport.ReportOptions.Author     := NameUser;

  while MsgConfirmacao('Imprimir comprovante de aluguel?') do
    begin
      if FTpBobina = tpBobina then
      Begin
        frxReport.LoadFromFile(LoadReportStream('rptcompaluguel',
          'rptCompAluguel.fr3'));
        frxReport.PrintOptions.ShowDialog := False;
        frxReport.PrintOptions.Printer    := printercomp;
        frxReport.PrintOptions.Copies     := 2;
        frxReport.Variables['regras'] :=
          fdmReservaCab.FieldByName('obsaluguel').AsString;
        if fdmReservaCab.FieldByName('observacao').AsString <> EmptyStr then
          frxReport.Variables['observacoes'] :=
            fdmReservaCab.FieldByName('observacao').AsString;
        frxReport.PrepareReport;
        frxReport.Print;
      End
      Else
      Begin

      End;
    end;
end;

procedure TfReservas.CalcularDesconto(Metodo: Integer);
begin
  case Metodo of
    0: // Desconto ao digitar o valor de venda
      Begin
        if descacre = 'desconto' then
        Begin
          jvv_valdesc.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) -
            jvcedt_vlaluguel.Value;

          if jvv_valdesc.Value > 0 then
          Begin
            jvv_percdesc.Value :=
              (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_vlaluguel.Text))) * 100;
          End
          Else
          Begin
            jvv_valdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;
        End
        Else
        Begin
          jvv_valdesc.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) +
            jvcedt_vlaluguel.Value;

          if jvv_valdesc.Value > 0 then
          Begin
            jvv_percdesc.Value :=
              (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_vlaluguel.Text))) * 100;
          End
          Else
          Begin
            jvv_valdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;
        End;
      End;
    1: // Desconto ao digitar o percentual de desconto
      Begin
        if descacre = 'desconto' then
        Begin
        if jvv_percdesc.Value > 0 then
          Begin
            jvv_valdesc.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) *
              (jvv_percdesc.Value / 100);
          End
          Else
          Begin
            jvv_valdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;

            jvcedt_vlaluguel.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) -
              jvv_valdesc.Value;
        End
        Else
        Begin
        if jvv_percdesc.Value > 0 then
          Begin
            jvv_valdesc.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) *
              (jvv_percdesc.Value / 100);
          End
          Else
          Begin
            jvv_valdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;

            jvcedt_vlaluguel.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) +
              jvv_valdesc.Value;
        End;
      End;
    2: // Desconto ao digitar o valor de desconto
      Begin
        if descacre = 'desconto' then
        Begin
          jvcedt_vlaluguel.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) -
            jvv_valdesc.Value;

          if jvv_valdesc.Value > 0 then
          Begin
            jvv_percdesc.Value :=
              (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_vlaluguel.Text))) * 100;
          End
          Else
          Begin
            jvv_percdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;
        End
        Else
        Begin
          jvcedt_vlaluguel.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) +
            jvv_valdesc.Value;

          if jvv_valdesc.Value > 0 then
          Begin
            jvv_percdesc.Value :=
              (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_vlaluguel.Text))) * 100;
          End
          Else
          Begin
            jvv_percdesc.Value := 0;

              jvcedt_vlaluguel.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text));
          End;
        End;
      End;
  end;
end;

procedure TfReservas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fReservas := Nil;
end;

procedure TfReservas.FormCreate(Sender: TObject);
begin
  Application.HintColor := $005BFFAD;
end;

procedure TfReservas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If (Key = #13) AND (Not jvdb_dados.Focused) then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TfReservas.FormResize(Sender: TObject);
begin
  Self.WindowState := wsNormal;
end;

procedure TfReservas.FormShow(Sender: TObject);
var
  vControle : TControle;
  vQry      : TFDQuery;
begin
  Try
    vControle       := TControle.Create;
    vQry            := TFDQuery.Create(nil);
    vQry.Connection := vControle.Conexao.GetConexao;
    vQry.Open('select * from tbparametros');
    printercomp := vQry.FieldByName('imp_bobina').AsString;
  Finally
    FreeAndNil(vQry);
    FreeAndNil(vControle);
  End;
  sbtnNovo.Click;
end;

procedure TfReservas.jvcedt_idclieButtonClick(Sender: TObject);
begin
  inherited;
  nClientes := 0;
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
  Begin
    jvcedt_idclie.Text := FormatFloat('0000000', TGlobal.entityId);
    jvcedt_idfun.SetFocus;
  End;
end;

procedure TfReservas.jvcedt_idclieChange(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  sbtnVendas.Enabled := Boolean(Length(jvcedt_idclie.Text));
  if jvcedt_idclie.Text <> EmptyStr then
  Begin
    Try
      vControle      := TControle.Create;
      ClasseClientes := TClasseClientes.Create(vControle);
      With ClasseClientes Do
      Begin
        CarregaDados(StrToInt(jvcedt_idclie.Text));
        if Cliente > 0 then
        Begin
          CarregaDados(StrToInt(jvcedt_idclie.Text));
          ledt_cliente.Text := Nome;
        End
        Else
        Begin
          ledt_cliente.Text := 'INEXISTENTE';
          jvcedt_idclie.SetFocus;
        End;
      End;
    Finally
      FreeAndNil(ClasseClientes);
      FreeAndNil(vControle);
    End;
  End
  Else
    ledt_cliente.Text := '';
end;

procedure TfReservas.jvcedt_idclieExit(Sender: TObject);
begin
  if jvcedt_idclie.Text <> EmptyStr then
    jvcedt_idclie.Text := FormatFloat('00000', StrToInt(jvcedt_idclie.Text));
end;

procedure TfReservas.jvcedt_idprodutoButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
  if TGlobal.entityId > 0 then
    jvcedt_idproduto.Text := IntToStr(TGlobal.entityId);
end;

procedure TfReservas.jvcedt_idprodutoChange(Sender: TObject);
var
  ClasseFantasias: TClasseFantasias;
  vControle       : TControle;
begin
  if jvcedt_idproduto.Text <> EmptyStr then
  Begin
    Try
//      vControle       := TControle.Create;
      ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao); //ClasseFantasias := TClasseFantasias.Create(vControle);
      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(jvcedt_idproduto.Text));
        if Fantasia > 0 then
        Begin
          ledt_fantasia.Text := Nome;
          if cbx_venda.ItemIndex = 0 then
          Begin
            jvcedt_vlaluguel.Value := VlAluguel;
            ledt_vlaluguel.Text := FormatFloat('R$  ###,##0.00', VlAluguel);
          End
          Else
          Begin
            jvcedt_vlaluguel.Value := VlVenda;
            ledt_vlaluguel.Text := FormatFloat('R$  ###,##0.00', VlVenda);
          End;
          if ItemVenda = 'VE' then
          Begin
            MsgAviso('Produto cadastrado apenas para Venda');
            jvcedt_idproduto.Clear;
          End;
        End
        Else
        Begin
          ledt_fantasia.Text := 'INEXISTENTE';
          jvcedt_vlaluguel.Value := 0;
          ledt_vlaluguel.Text := FormatFloat('R$ ###,##0.00', 0);
        End;
      End;
    Finally
      FreeAndNil(ClasseFantasias);
//      FreeAndNil(vControle);
    End;
  End
  Else
  Begin
    ledt_fantasia.Text := '';
    jvcedt_vlaluguel.Value := 0;
    ledt_vlaluguel.Text := FormatFloat('R$ ###,##0.00', 0);
  End;
end;

procedure TfReservas.jvcedt_idprodutoExit(Sender: TObject);
begin
  if ledt_fantasia.Text = 'INEXISTENTE' then
    jvcedt_idproduto.SetFocus;

  if jvcedt_idproduto.Text <> EmptyStr then
    if jvcedt_vlaluguel.Value = 0 then
    Begin
      jvcedt_idproduto.SetFocus;
      MsgAviso('Produto com preço final zerado');
    End;
end;

procedure TfReservas.jvcedt_idprodutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F3 then
    if descacre = 'desconto' then
      begin
        descacre       := 'acrescimo';
        Label4.Caption := '% Acre';
        Label5.Caption := 'R$ Acre';
      end
    else
      begin
        descacre       := 'desconto';
        Label4.Caption := '% Desc';
        Label5.Caption := 'R$ Desc';
      end;
end;

procedure TfReservas.jvcedt_produtoButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
  if TGlobal.entityId > 0 then
    jvcedt_produto.Text := IntToStr(TGlobal.entityId);
end;

procedure TfReservas.jvcedt_produtoChange(Sender: TObject);
var
  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  if jvcedt_produto.Text <> EmptyStr then
  Begin
    Try
//      vControle       := TControle.Create;
      ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao); //ClasseFantasias := TClasseFantasias.Create(vControle);
      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(jvcedt_produto.Text));
        if Fantasia > 0 then
        Begin
          jvst_produto.Caption := Nome;
          if ItemVenda = 'VE' then
          Begin
            MsgAviso('Produto cadastrado apenas para Venda');
            jvcedt_idproduto.Clear;
          End;
        End
        Else
          jvst_produto.Caption := 'INEXISTENTE';
      End;
    Finally
      FreeAndNil(ClasseFantasias);
//      FreeAndNil(vControle);
    End;
  End
  Else
    jvst_produto.Caption := '';
end;

procedure TfReservas.jvcedt_produtoExit(Sender: TObject);
begin
  if jvst_produto.Caption = 'INEXISTENTE' then
    jvcedt_produto.SetFocus;
end;

procedure TfReservas.jvcedt_vlaluguelChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('.,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  TJvValidateEdit(Sender).Text := FormatCurr('###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvcedt_vlaluguelClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvcedt_vlaluguelEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvcedt_vlaluguelExit(Sender: TObject);
begin
  CalcularDesconto(0);

  if (jvcedt_vlaluguel.Value = 0) AND (jvcedt_idproduto.Text <> EmptyStr) then
  Begin
    pnl_desc.Visible := True;
    ledt_desc.Text := '';
    ledt_desc.SetFocus;
    AlinharPanel(fReservas, pnl_desc, True);
    pnlDados.Enabled := False;
    pnlProdutos.Enabled := False;
    pnlBotoes.Enabled := False;
    fReservas.KeyPreview := False;
  End;

end;

procedure TfReservas.jvcedt_idfunButtonClick(Sender: TObject);
begin
  nFuncionario := 0;
  OpenFormModal(TfrmPesquisaFuncionarios, frmPesquisaFuncionarios);
  if TGlobal.entityId > 0 then
  Begin
    jvcedt_idfun.Text := FormatFloat('0000000', TGlobal.entityId);
    jvcedt_idproduto.SetFocus;
  End;
end;

procedure TfReservas.jvcedt_idfunChange(Sender: TObject);
var
  vControle         : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  if jvcedt_idfun.Text <> EmptyStr then
  Begin
    Try
      vControle          := TControle.Create;
      ClasseFuncionarios := TClasseFuncionarios.Create
        (vControle);
      With ClasseFuncionarios Do
      Begin
        CarregaDados(StrToInt(jvcedt_idfun.Text));
        if Funcionario > 0 then
        Begin
          CarregaDados(StrToInt(jvcedt_idfun.Text));
          ledt_funcionario.Text := Nome;
        End
        Else
        Begin
          ledt_funcionario.Text := 'INEXISTENTE';
          jvcedt_idfun.SetFocus;
        End;
      End;
    Finally
      FreeAndNil(ClasseFuncionarios);
      FreeAndNil(vControle);
    End;
  End
  Else
    ledt_funcionario.Text := '';
end;

procedure TfReservas.jvcedt_idfunExit(Sender: TObject);
begin
  if jvcedt_idfun.Text <> EmptyStr then
    jvcedt_idfun.Text := FormatFloat('000', StrToInt(jvcedt_idfun.Text));
end;

procedure TfReservas.jvdb_dadosCellClick(Column: TColumn);
begin
  SelecionaItem;
end;

procedure TfReservas.jvdb_dadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if fdmReservaItem.FieldByName('cancelado').AsString = 'Sim' then
    jvdb_dados.Canvas.Font.Color := clRed;
end;

procedure TfReservas.jvdb_dadosExit(Sender: TObject);
begin
  lbl_trocaprod.Visible := False;
end;

procedure TfReservas.jvdb_dadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F2 then
  Begin
    if (fdmReservaItem.RecordCount = 0) OR
      (fdmReservaItem.FieldByName('cancelado').AsString = 'Sim') OR
      (fdmReservaItem.FieldByName('devolvido').AsString = 'Sim') OR
      (fdmReservaItem.FieldByName('retirado').AsString = 'Sim') then
      Abort;

    pnl_trocaproduto.Visible := True;
    AlinharPanel(fReservas, pnl_trocaproduto, True);
    pnlDados.Enabled    := False;
    pnlProdutos.Enabled := False;
  End;
end;

procedure TfReservas.jvv_valdescChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('.,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  TJvValidateEdit(Sender).Text := FormatCurr('###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvv_valdescClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvv_valdescEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
  Self.KeyPreview := False;
end;

procedure TfReservas.jvv_valdescExit(Sender: TObject);
begin
  if jvv_valdesc.Text = EmptyStr then
    jvv_valdesc.Value := 0;

  CalcularDesconto(2);

  Self.KeyPreview := True;
end;

procedure TfReservas.jvv_valdescKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    CalcularDesconto(2);
    sbtnIncluir.Click;
  End;
end;

procedure TfReservas.ledt_descKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    pnl_desc.Visible := False;
    pnlDados.Enabled := True;
    pnlProdutos.Enabled := True;
    pnlBotoes.Enabled := True;
    fReservas.KeyPreview := True;
    sbtnIncluir.Click;
  End;
end;

procedure TfReservas.LimparItem(Enabled: Boolean);
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  Try
    vControle             := TControle.Create;
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    With fdqComando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*)+1 AS item FROM tbreservasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbreservanota = :reserva AND pdv = :pdv AND date(dtemissao) = :emissao');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('reserva').Value := StrToInt(ledt_idreserva.Text);
      ParamByName('pdv').Value     := Terminal;
      ParamByName('emissao').Value := StrToDate(ledt_emissao.Text);
      Open;

      jvcedt_idproduto.Clear;
      ledt_fantasia.Clear;
      jvsedt_qtde.Value      := 1;
      ledt_vlaluguel.Text    := 'R$ 0,00';
      jvv_percdesc.Value     := 0;
      jvcedt_vlaluguel.Value := 0;
      jvv_valdesc.Value      := 0;
      ledt_item.Text         := FieldByName('item').AsString;
      ledt_desc.Text         := '';
      sbtnIncluir.Enabled    := Enabled;
    End;

    sbtnIncluir.Enabled      := Enabled;
    jvcedt_idproduto.Enabled := Enabled;
    jvsedt_qtde.Enabled      := Enabled;
    jvv_percdesc.Enabled     := Enabled;
    jvv_valdesc.Enabled      := Enabled;
    jvcedt_vlaluguel.Enabled := Enabled;

    if Enabled then
      jvcedt_idproduto.SetFocus;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.ListaCab(vEmpresa, vReserva, vTerminal : Integer; vEmissao : TDateTime);
var
  VQry            : TFDQuery;
  vClasseReservas : TClasseReservas;
  vControle       : TControle;
begin
  Try
    vControle       := TControle.Create;
    vClasseReservas := TClasseReservas.Create(vControle);
    fdmReservaCab.Close;
    VQry := vClasseReservas.ReservaNota(vEmpresa, vReserva, vTerminal, vEmissao);
    Try
      VQry.FetchAll;
      fdmReservaCab.Data := VQry.Data;
      fdmReservaCab.Open;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseReservas);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.ListaItens(vEmpresa, vReserva, vTerminal : Integer; vEmissao : TDateTime);
var
  VQry            : TFDQuery;
  vClasseReservas : TClasseReservas;
  vControle       : TControle;
begin
  Try
    vControle       := TControle.Create;
    vClasseReservas := TClasseReservas.Create(vControle);
    fdmReservaItem.Close;
    VQry := vClasseReservas.ReservaItem(vEmpresa, vReserva, vTerminal, vEmissao);
    Try
      VQry.FetchAll;
      fdmReservaItem.Data := VQry.Data;
      fdmReservaItem.Open;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseReservas);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.jvv_percdescChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('.,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  TJvValidateEdit(Sender).Text := FormatCurr('###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvv_percdescClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvv_percdescEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfReservas.jvv_percdescExit(Sender: TObject);
begin
  if jvv_percdesc.Text = EmptyStr then
    jvv_percdesc.Value := 0;

  CalcularDesconto(1);
end;

procedure TfReservas.mem_obsEnter(Sender: TObject);
begin
  Self.KeyPreview := False;
end;

procedure TfReservas.mem_obsExit(Sender: TObject);
begin
  Self.KeyPreview := True;
end;

procedure TfReservas.mem_obsKeyPress(Sender: TObject; var Key: Char);
begin
  if mem_obs.Lines.Count > 3 then
    mem_obs.ScrollBars := ssVertical
  else
    mem_obs.ScrollBars := ssNone;
end;

procedure TfReservas.mnComprovanteClick(Sender: TObject);
begin
  actImpComp.Execute;
end;

procedure TfReservas.mnpesquisa_reservasClick(Sender: TObject);
begin
  sbtnNovo.Click;

  sReserva := EmptyStr;
  OpenFormModal(TfPesquisaReservas, fPesquisaReservas);

  if sReserva <> EmptyStr then
  Begin
    ListaCab(sReserva, StrToDate(ledt_emissao.Text));

    ledt_idreserva.Text := FormatFloat('00000', fdmReservaCab.Fields[0].Value);
    ledt_emissao.Text   := FormatDateTime('dd/mm/YYY', fdmReservaCab.Fields[14].Value);
    dtp_retirada.Date   := fdmReservaCab.Fields[15].Value;
    dtp_devolucao.Date  := fdmReservaCab.Fields[31].Value;
    jvcedt_idclie.Text  := FormatFloat('0000000', fdmReservaCab.Fields[16].Value);
    ledt_cliente.Text   := fdmReservaCab.Fields[17].Value;
    jvcedt_idfun.Text   := FormatFloat('0000', fdmReservaCab.Fields[12].Value);
    case AnsiIndexStr(fdmReservaCab.Fields[33].Value,
      ['Não', 'Sim']) of
      0:
        baixa_stock := False;
      1:
        baixa_stock := True;
    end;

    ListaItens(sReserva, StrToDate(ledt_emissao.Text));

    jvcedt_idclie.Enabled    := False;
    jvcedt_idfun.Enabled     := False;
    jvcedt_idproduto.Enabled := False;
    jvsedt_qtde.Enabled      := False;
    jvv_percdesc.Enabled     := False;
    jvv_valdesc.Enabled      := False;
    dtp_retirada.Enabled     := False;
    dtp_devolucao.Enabled    := False;
    sbtnCancelar.Enabled     := False;

    if (fdmReservaCab.FieldByName('estado').AsString = 'Fechado') AND
      (fdmReservaCab.FieldByName('retirada').AsString = 'Sim') then
      sbtnDevolucao.Enabled := True
    else
      sbtnDevolucao.Enabled := False;

    mem_obs.Text             := fdmReservaCab.FieldByName('observacao').AsString;
    mem_obs.Enabled          := False;
    sbtnPagamento.Enabled    := False;
    sbtnIncluir.Enabled      := False;
    sbtnCancelarItem.Enabled := False;
    sbtnVendas.Enabled       := False;

    lbl_qtde.Caption := 'Qtde: ' + fdmReservaCab.FieldByName('qtde_total').AsString;
    lbl_total.Caption := 'Total: ' + FormatCurr('R$ ###,##0.00',
      fdmReservaCab.FieldByName('valor_total').Value);

    // Habilitando menu impressão comprovante
    mnComprovante.Enabled := True;
  End;
end;

procedure TfReservas.mnpesquisa_reservasprodutosClick(Sender: TObject);
begin

  sbtnNovo.Click;

  sReserva := EmptyStr;
  OpenFormModal(TfPesquisaReservasProdutos, fPesquisaReservasProdutos);

  if sReserva <> EmptyStr then
  Begin
    ListaCab(sReserva, StrToDate(ledt_emissao.Text));

    ledt_idreserva.Text := FormatFloat('00000', fdmReservaCab.Fields[0].Value);
    ledt_emissao.Text   := FormatDateTime('dd/mm/YYY', fdmReservaCab.Fields[14].Value);
    dtp_retirada.Date   := fdmReservaCab.Fields[15].Value;
    dtp_devolucao.Date  := fdmReservaCab.Fields[31].Value;
    jvcedt_idclie.Text  := FormatFloat('0000000', fdmReservaCab.Fields[16].Value);
    ledt_cliente.Text   := fdmReservaCab.Fields[17].Value;
    jvcedt_idfun.Text   := FormatFloat('0000', fdmReservaCab.Fields[12].Value);
    case AnsiIndexStr(fdmReservaCab.Fields[33].Value,
      ['Não', 'Sim']) of
      0:
        baixa_stock := False;
      1:
        baixa_stock := True;
    end;

    ListaItens(sReserva, StrToDate(ledt_emissao.Text));

    jvcedt_idclie.Enabled    := False;
    jvcedt_idfun.Enabled     := False;
    jvcedt_idproduto.Enabled := False;
    jvsedt_qtde.Enabled      := False;
    jvv_percdesc.Enabled     := False;
    jvv_valdesc.Enabled      := False;
    dtp_retirada.Enabled     := False;
    dtp_devolucao.Enabled    := False;
    sbtnCancelar.Enabled     := False;

    if (fdmReservaCab.FieldByName('estado').AsString = 'Fechado') AND
      (fdmReservaCab.FieldByName('retirada').AsString = 'Sim') then
      sbtnDevolucao.Enabled := True
    else
      sbtnDevolucao.Enabled := False;

    mem_obs.Text             := fdmReservaCab.FieldByName('observacao').AsString;
    mem_obs.Enabled          := False;
    sbtnPagamento.Enabled    := False;
    sbtnIncluir.Enabled      := False;
    sbtnCancelarItem.Enabled := False;
    sbtnVendas.Enabled       := False;

    lbl_qtde.Caption := 'Qtde: ' + fdmReservaCab.FieldByName('qtde_total').AsString;
    lbl_total.Caption := 'Total: ' + FormatCurr('R$ ###,##0.00',
      fdmReservaCab.FieldByName('valor_total').Value);

    // Habilitando menu impressão comprovante
    mnComprovante.Enabled := True;
  End;
end;

procedure TfReservas.RemoveItem;
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  if (fdmReservaItem.RecordCount = 0) OR
    (fdmReservaItem.FieldByName('cancelado').AsString = 'Sim') OR
    (fdmReservaItem.FieldByName('devolvido').AsString = 'Sim') OR
    (operacao <> 'alterar') then
  Begin
    MsgAviso('Cancelamento abortado em caso de:' + #13 +
      'Item já foi retirado, item ja foi devolvido, item já encontra-se cancelado,'
      + #13 + ' ou não está em processo de inclusão de reserva');
    Abort;
  End;

  Try
    vControle             := TControle.Create;
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    With fdqComando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as registros FROM tbreservasitem');
      SQL.Add('WHERE idtbreservanota = '+QuotedStr(fdmReservaItem.Fields[1].AsString)+' AND canc = 0');
      SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDate(ledt_emissao.Text))));
      Open;

      if FieldByName('registros').Value = 1 then
      Begin
        MsgAviso('Existe apenas um produto na reserva.' + #13 +
          'Cancelamento de item não permitido');
        Exit;
      End;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasitem SET');
      SQL.Add('canc = 1');
      SQL.Add('WHERE idtbreservasitem = '+QuotedStr(fdmReservaItem.Fields[0].AsString));

      Try
        ExecSQL;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
        End;
      End;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasnota SET');
      SQL.Add('qtde_total = (select ifnull(sum(qtde),0) FROM tbreservasitem a');
      SQL.Add('WHERE a.idtbreservanota = :idreserva AND a.canc = 0),');
      SQL.Add('valor_total = (select ifnull(sum(valor_total),0) FROM tbreservasitem a');
      SQL.Add('WHERE a.idtbreservanota = :idreserva AND a.canc = 0)');
      SQL.Add('WHERE idtbreserva = :idreserva');
      Params.ParamByName('idreserva').Value := ledt_idreserva.Text;

      try
        ExecSQL;
      except
        On E: Exception Do
        Begin
          MsgErro('Erro' + #13 + E.Message);
          Abort;
        End;
      end;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(qtde),0) as total FROM tbreservasitem a');
      SQL.Add('WHERE a.idtbreservanota = :idreserva AND a.canc = 0');
      SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDate(ledt_emissao.Text))));
      Params.ParamByName('idreserva').Value := ledt_idreserva.Text;
      Open;

      lbl_qtde.Caption := 'Qtde: ' + FieldByName('total').AsString;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(valor_total),0) as total FROM tbreservasitem a');
      SQL.Add('WHERE a.idtbreservanota = :idreserva AND a.canc = 0');
      SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDate(ledt_emissao.Text))));
      Params.ParamByName('idreserva').Value := ledt_idreserva.Text;
      Open;

      lbl_total.Caption := 'Total: R$ ' + FormatFloat('###,##0.00',
        FieldByName('total').Value);

    End;
    //
    ListaItens(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.sbtnCancelarClick(Sender: TObject);
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  if operacao = 'alterar' then
  Begin
    if Not MsgConfirmacao('Confirma o cancelamento desta reserva?') then
      Abort;

    Try
      vControle             := TControle.Create;
      fdqComando            := TFDQuery.Create(nil);
      fdqComando.Connection := vControle.Conexao.GetConexao;
      With fdqComando Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbreservasitem SET');
        SQL.Add('canc = 1,');
        SQL.Add('useralt = :usuario');
        SQL.Add('WHERE idtbreservanota = ' + QuotedStr(ledt_idreserva.Text));
        SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
        ParamByName('usuario').Value := UserLog;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbreservasnota SET');
        SQL.Add('estado = "C",');
        SQL.Add('useralt = :usuario');
        SQL.Add('WHERE idtbreserva = ' + QuotedStr(ledt_idreserva.Text));
        SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
        ParamByName('usuario').Value := UserLog;
        ExecSQL;
      End;
    Finally
      FreeAndNil(fdqComando);
      FreeAndNil(vControle);
    End;

    sbtnNovo.Enabled      := True;
    sbtnPesquisar.Enabled := True;
    sbtnDevolucao.Enabled := True;
    sbtnSair.Enabled      := True;
    jvcedt_idclie.Enabled := True;
    jvcedt_idfun.Enabled  := True;
    sbtnNovo.Click;
  End;
end;

procedure TfReservas.sbtnCancelarItemClick(Sender: TObject);
begin
  RemoveItem;
end;

procedure TfReservas.sbtnDevolucaoClick(Sender: TObject);
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  if Not MsgConfirmacao('Confirma a devolução da(s) mercadoria(s)?') then
    Abort;

  Try
    vControle             := TControle.Create;
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    With fdqComando Do
    Begin
      if Date() <> dtp_devolucao.Date then
        if MsgConfirmacao('Deseja alterar a data de devolução pela data atual?')
        then
        Begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbreservasnota SET dtdevolucao = date(now())');
          SQL.Add('WHERE idtbreserva = ' + QuotedStr(fdmReservaCab.Fields[0].AsString));
          SQL.Add(' AND date(dtemissao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd',fdmReservaCab.Fields[14].Value)));

          Try
            ExecSQL;
          Except
            On E: Exception Do
            Begin
              MsgErro('Erro de rotina' + #13 + E.Message);
            End;
          End;
        End;

      // Setando devolvido nos itens
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasitem SET devolvido = 1');
      SQL.Add('WHERE idtbreservanota = ' + QuotedStr(fdmReservaCab.Fields[0].AsString));
      SQL.Add(' AND date(dtemissao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd',fdmReservaCab.Fields[14].Value)));

      Try
        ExecSQL;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
          Abort;
        End;
      End;

      // Setando devolvido na reserva
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasnota SET estado = "D"');
      SQL.Add('WHERE idtbreserva = ' + QuotedStr(fdmReservaCab.Fields[0].AsString));
      SQL.Add(' AND date(dtemissao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd',fdmReservaCab.Fields[14].Value)));

      Try
        ExecSQL;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
          Abort;
        End;
      End;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.sbtnImprimirClick(Sender: TObject);
var
  P1, P2: TPoint;
begin
  P1.X := sbtnImprimir.Left;
  P1.Y := sbtnImprimir.Top + sbtnImprimir.Height;
  P2 := ClientToScreen(P1);
  pmnImpressao.PopUp(P2.X, P2.Y);
end;

procedure TfReservas.sbtnIncluirClick(Sender: TObject);
var
  fdqComando: TFDQuery;
  vControle : TControle;
begin
  // Fazendo as validações
  if jvcedt_idclie.Text = EmptyStr then
  Begin
    MsgErro('Cliente não foi informado');
    jvcedt_idclie.SetFocus;
    Abort;
  End;

  if jvcedt_idfun.Text = EmptyStr then
  Begin
    MsgErro('Atendente não foi informado(a)');
    jvcedt_idfun.SetFocus;
    Abort;
  End;

  if jvcedt_idproduto.Text = EmptyStr then
  Begin
    MsgErro('Fantasia não foi informada');
    jvcedt_idproduto.SetFocus;
    Abort;
  End;

  // Força a saida dos campos de descontos em % e R$
  // para calcula-los
  ledt_vlaluguel.SetFocus;

  Try
    vControle             := TControle.Create;
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    With fdqComando Do
    Begin
      if operacao = 'incluir' then
      Begin

        if dtp_devolucao.Date = Date() then
        Begin
          if Not MsgConfirmacao('A data de Devolução está informada para hoje.'
            + #13 + 'Deseja continuar assim mesmo?') then
            Abort;
        End;

        // Se emissao e retirada forem iguais baixa estoque
        if (dtp_retirada.Date = StrToDate(ledt_emissao.Text)) OR
          (cbx_venda.Text = 'Venda') then
          baixa_stock := True;

        Close;
        SQL.Clear;
        SQL.Add('REPLACE INTO tbreservasnota(');
        SQL.Add('idresvcab,');
        SQL.Add('idtbreserva,');
        SQL.Add('idtbempresa,');
        SQL.Add('idtbcliente,');
        SQL.Add('pdv,');
        SQL.Add('idfuncionario,');
        SQL.Add('qtde_total,');
        SQL.Add('valor_total,');
        SQL.Add('forma_pagto,');
        SQL.Add('parcelas,');
        SQL.Add('estado,');
        SQL.Add('retirada,');
        SQL.Add('dtretirada,');
        SQL.Add('dtdevolucao,');
        SQL.Add('observacao,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idresvcab,');
        SQL.Add(':idtbreserva,');
        SQL.Add(':idtbempresa,');
        SQL.Add(':idtbcliente,');
        SQL.Add(':pdv,');
        SQL.Add(':idfuncionario,');
        SQL.Add(':qtde_total,');
        SQL.Add(':valor_total,');
        SQL.Add(':forma_pagto,');
        SQL.Add(':parcelas,');
        SQL.Add(':estado,');
        SQL.Add(':retirada,');
        SQL.Add(':dtretirada,');
        SQL.Add(':dtdevolucao,');
        SQL.Add(':observacao,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idresvcab').AsString := ledt_idreserva.Text;
        ParamByName('idtbreserva').Value := StrToInt(ledt_idreserva.Text);
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('idtbcliente').Value := StrToInt(jvcedt_idclie.Text);
        ParamByName('pdv').Value := Terminal;
        ParamByName('idfuncionario').Value := StrToInt(jvcedt_idfun.Text);
        ParamByName('qtde_total').Value :=
          StrToInt(SomenteNumero('Qtde: ', lbl_qtde.Caption));
        ParamByName('valor_total').AsCurrency :=
          StrToCurr(SomenteNumero('Total: R$,.', lbl_total.Caption)) / 100;
        ParamByName('forma_pagto').Value := '';
        ParamByName('parcelas').Value := 0;
        ParamByName('estado').Value := 'A';
        ParamByName('retirada').Value := Integer(baixa_stock);
        ParamByName('dtretirada').Value := dtp_retirada.DateTime;
        ParamByName('dtdevolucao').Value := dtp_devolucao.DateTime;
        ParamByName('observacao').Value := mem_obs.Text;
        ParamByName('usercad').Value := UserLog;
        ParamByName('useralt').Value := UserLog;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro' + #13 + E.Message);
            Abort;
          End;
        End;

        ListaCab(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));

        //
        jvcedt_idclie.Enabled := False;
        jvcedt_idfun.Enabled  := False;
        dtp_devolucao.Enabled := False;
        dtp_retirada.Enabled  := False;
        sbtnNovo.Enabled      := False;
        sbtnPesquisar.Enabled := False;
        sbtnDevolucao.Enabled := False;
        sbtnPagamento.Enabled := True;
        sbtnCancelar.Enabled  := True;
        sbtnSair.Enabled      := False;
        operacao              := 'alterar';
      End;

      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO tbreservasitem(');
      SQL.Add('idresvitem,');
      SQL.Add('idresvcab,');
      SQL.Add('idtbproduto,');
      SQL.Add('idtbempresa,');
      SQL.Add('pdv,');
      SQL.Add('dtemissao,');
      SQL.Add('item,');
      SQL.Add('qtde,');
      SQL.Add('retirado,');
      SQL.Add('dtretirada,');
      SQL.Add('preco_tabela,');
      SQL.Add('valor_unit,');
      SQL.Add('perc_desc,');
      SQL.Add('valor_desc,');
      SQL.Add('venda,');
      SQL.Add('motivo_desc,');
      SQL.Add('usercad,');
      SQL.Add('useralt');
      SQL.Add(')VALUES(');
      SQL.Add(':idresvitem,');
      SQL.Add(':idresvcab,');
      SQL.Add(':idtbproduto,');
      SQL.Add(':idtbempresa,');
      SQL.Add(':pdv,');
      SQL.Add(':dtemissao,');
      SQL.Add(':item,');
      SQL.Add(':qtde,');
      SQL.Add(':retirado,');
      SQL.Add(':dtretirada,');
      SQL.Add(':preco_tabela,');
      SQL.Add(':valor_unit,');
      SQL.Add(':perc_desc,');
      SQL.Add(':valor_desc,');
      SQL.Add(':venda,');
      SQL.Add(':motivo_desc,');
      SQL.Add(':usercad,');
      SQL.Add(':useralt)');
      ParamByName('idresvitem').AsString := GuidCreate();
      ParamByName('idresvcab').AsString := ledt_idreserva.Text;
      ParamByName('idtbempresa').Value := EmpLog;
      ParamByName('pdv').Value := Terminal;
      ParamByName('dtemissao').Value := StrToDate(ledt_emissao.Text);
      ParamByName('item').Value := StrToInt(ledt_item.Text);
      ParamByName('idtbproduto').Value := StrToInt(jvcedt_idproduto.Text);
      ParamByName('qtde').Value := StrToInt(jvsedt_qtde.Text);
      ParamByName('retirado').Value := Integer(baixa_stock);
      ParamByName('dtretirada').Value := dtp_retirada.DateTime;
      if jvcedt_vlaluguel.Value <= StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text)) then
        ParamByName('preco_tabela').Value :=
          StrToCurr(SomenteNumero('R$ .', ledt_vlaluguel.Text))
      else
        ParamByName('preco_tabela').Value :=jvcedt_vlaluguel.Value;
      ParamByName('valor_unit').Value := jvcedt_vlaluguel.Value;
      ParamByName('perc_desc').Value := jvv_percdesc.Value;
      ParamByName('valor_desc').Value := jvv_valdesc.Value;
      ParamByName('venda').AsBoolean := Boolean(cbx_venda.ItemIndex);
      if ledt_desc.Text <> EmptyStr then
        ParamByName('motivo_desc').AsString := ledt_desc.Text
      else
        ParamByName('motivo_desc').AsString := EmptyStr;
      ParamByName('usercad').Value := UserLog;
      ParamByName('useralt').Value := UserLog;

      try
        ExecSQL;
      except
        On E: Exception Do
        Begin
          MsgErro('Erro' + #13 + E.Message);
          Abort;
        End;
      end;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbreservasnota SET');
      SQL.Add('qtde_total = (select ifnull(sum(qtde),0) FROM tbreservasitem a');
      SQL.Add('WHERE a.idresvcab = :reserva AND a.canc = 0),');
      SQL.Add('valor_total = (select ifnull(sum(valor_total),0) FROM tbreservasitem a');
      SQL.Add('WHERE a.idresvcab = :reserva AND a.canc = 0)');
      SQL.Add('WHERE idresvcab = :reserva');
      ParamByName('reserva').AsString := reservaguid;

      try
        ExecSQL;
      except
        On E: Exception Do
        Begin
          MsgErro('Erro' + #13 + E.Message);
          Abort;
        End;
      end;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(qtde),0) as total FROM tbreservasitem a');
      SQL.Add('WHERE a.idresvcab = :reserva AND a.canc = 0');
      ParamByName('reserva').AsString := reservaguid;
      Open;

      lbl_qtde.Caption := 'Qtde: ' + FieldByName('total').AsString;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(valor_total),0) as total FROM tbreservasitem a');
      SQL.Add('WHERE a.idresvcab = :reserva AND a.canc = 0');
      ParamByName('reserva').AsString := reservaguid;
      Open;

      lbl_total.Caption := 'Total: R$ ' + FormatFloat('###,##0.00',
        FieldByName('total').Value);

//      Close;
//      SQL.Clear;
//      SQL.Add('SELECT COUNT(*)+1 AS item FROM tbreservasitem a');
//      SQL.Add('WHERE a.idresvcab = :reserva AND a.canc = 0');
//      ParamByName('reserva').AsString := reservaguid;
//      Open;
//      ledt_item.Text := FieldByName('item').AsString;
    End;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(vControle);
  End;

  // Restaurando itens
  LimparItem(True);

  //
  ListaItens(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));
  fdmReservaItem.Last;
  ledt_item.Text := IntToStr(fdmReservaItem.RecordCount + 1);
end;

procedure TfReservas.sbtnNovoClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseReservas: TClasseReservas;
  fdqComando: TFDQuery;
begin
  Try
    pnlDados.Enabled      := True;
    pnl_desc.Visible      := False;
    vControle             := TControle.Create;
    ClasseReservas        := TClasseReservas.Create(vControle);
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    ledt_idreserva.Text   := FormatFloat('00000',
    ClasseReservas.PegarRegistro(Terminal, EmpLog));

    jvcedt_idclie.Enabled    := True;
    jvcedt_idfun.Enabled     := True;
    jvcedt_idproduto.Enabled := True;
    jvsedt_qtde.Enabled      := True;
    jvv_percdesc.Enabled     := True;
    jvv_valdesc.Enabled      := True;
    mem_obs.Enabled          := True;
    dtp_devolucao.Enabled    := True;
    dtp_retirada.Enabled     := True;
    dtp_devolucao.Enabled    := True;
    mnComprovante.Enabled    := False;
    sbtnPagamento.Enabled    := False;
    sbtnDevolucao.Enabled    := False;
    sbtnIncluir.Enabled      := True;
    sbtnCancelarItem.Enabled := True;

    ledt_emissao.Text        := FormatDateTime('dd/mm/YYYY', Date());
    dtp_devolucao.Date       := Date();
    dtp_retirada.Date        := Date();
    jvcedt_idclie.Text       := '';
    jvcedt_idfun.Text        := '';
    ledt_cliente.Text        := '';
    ledt_item.Text           := '1';
    baixa_stock              := False;
    cbx_venda.ItemIndex      := 0;
    lbl_trocaprod.Visible    := False;
    lbl_qtde.Caption         := 'Qtde: 0';
    lbl_total.Caption        := 'Total: R$ 0,00';
    // Setando valores nas variaveis nEmpresa,nTerminal
    // para poder imprimir documento atual ou pesquisado
    nEmpresa                 := EmpLog;
    nTerminal                := Terminal;
    reservaguid              := GuidCreate();
    jvcedt_idclie.SetFocus;

    // Iniciando as Tabelas

    {
    // Utilizando os outros dois métodos de pesquisa que tem por parâmetro apenas a Reserva
    // idreserva que agora é unica pelo método GuidCreate;
    ListaCab(EmpLog, StrToInt(ledt_idreserva.Text), Terminal, StrToDate(ledt_emissao.Text));
    ListaItens(EmpLog, StrToInt(ledt_idreserva.Text), Terminal, StrToDate(ledt_emissao.Text));
    }

    ListaCab(ledt_idreserva.Text, StrToDate(ledt_emissao.Text)); //ListaCab(reservaguid);
    ListaItens(ledt_idreserva.Text, StrToDate(ledt_emissao.Text)); //ListaItens(reservaguid);

    operacao := 'incluir';
  Finally
    FreeAndNil(ClasseReservas);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.sbtnPagamentoClick(Sender: TObject);
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  if operacao <> 'alterar' then
    Abort;

  ReservaPaga := False;
  condpagto   := '';
  sReserva    := reservaguid;
  if fPagtoReservas = nil then
    Application.CreateForm(TfPagtoReservas, fPagtoReservas);
  TForm.Create(Self);
  fPagtoReservas.ledt_vlreserva.Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(SomenteNumero('Total: R$ .', lbl_total.Caption)));
  fPagtoReservas.ledt_vlsaldo.Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(SomenteNumero('Total: R$ .', lbl_total.Caption)));
  fPagtoReservas.ShowModal;

  // Se Reserva tiver sido paga finaliza
  if ReservaPaga then
  Begin
    Try
      vControle             := TControle.Create;
      fdqComando            := TFDQuery.Create(nil);
      fdqComando.Connection := vControle.Conexao.GetConexao;
      With fdqComando Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbreservasnota SET estado = "F",observacao = :obs,dtdevolucao = :devolucao, forma_pagto = '
          + QuotedStr(condpagto));
        SQL.Add('WHERE idtbreserva = ' + QuotedStr(ledt_idreserva.Text));
        SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
        ParamByName('devolucao').Value := dtp_devolucao.DateTime;
        ParamByName('obs').Value       := mem_obs.Text;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
            Abort;
          End;
        End;
      End;

      // Atualizando a query depois da finalização
      ListaCab(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));
      ListaItens(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));

      // Imprimindo Comprovante
      actImpComp.Execute;

      sbtnNovo.Enabled      := True;
      sbtnPesquisar.Enabled := True;
      sbtnDevolucao.Enabled := True;
      sbtnSair.Enabled      := True;
      jvcedt_idclie.Enabled := True;
      sbtnNovo.Click;
    Finally
      FreeAndNil(fdqComando);
      FreeAndNil(vControle);
    End;
  End;
end;

procedure TfReservas.sbtnPesquisarClick(Sender: TObject);
var
  vPonto: TPoint;
begin
  vPonto := sbtnPesquisar.ClientToScreen(Point(0, sbtnPesquisar.Height));
  PopupMenu.PopUp(vPonto.X, vPonto.Y);
end;

procedure TfReservas.sbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfReservas.sbtnVendasClick(Sender: TObject);
begin
  if jvcedt_idclie.Focused then
    dtp_retirada.SetFocus;

  OpenForm(TfVendas, fVendas);
  fVendas.jvcedt_idclie.Text := jvcedt_idclie.Text;
  fVendas.jvcedt_idclie.SetFocus;
  fVendas.jvcedt_idvend.SetFocus;

end;

procedure TfReservas.sbtn_confirmarClick(Sender: TObject);
var
  Erro: String;
begin
  if Not TrocaProduto(fdmReservaItem.FieldByName('idtbreservasitem').Value,
    StrToInt(jvcedt_produto.Text), Erro) then
    MsgErro(Erro);

  lbl_trocaprod.Visible := False;
end;

procedure TfReservas.SelecionaItem;
begin
  if (fdmReservaItem.RecordCount = 0) OR
    (fdmReservaItem.FieldByName('cancelado').AsString = 'Sim') OR
    (fdmReservaItem.FieldByName('devolvido').AsString = 'Sim') then
    Abort;

  nEmpresa := fdmReservaItem.Fields[2].Value;
  nUsuario := fdmReservaItem.Fields[23].Value;

  if (fdmReservaItem.FieldByName('retirado').AsString = 'Não') AND
    (fdmReservaItem.FieldByName('devolvido').AsString = 'Não') then
    lbl_trocaprod.Visible := True
  else
    lbl_trocaprod.Visible := False;
end;

function TfReservas.TrocaProduto(GuidItem: String; Produto: Integer;
  out Erro: String): Boolean;
var
  vControle : TControle;
  fdqComando: TFDQuery;
begin
  Try
    vControle             := TControle.Create;
    fdqComando            := TFDQuery.Create(nil);
    fdqComando.Connection := vControle.Conexao.GetConexao;
    Try
      With fdqComando Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbreservasitem SET');
          SQL.Add('idtbproduto = :produto');
          SQL.Add('WHERE idtbreservasitem = ' + QuotedStr(GuidItem));
//          SQL.Add(' AND date(dtemissao) = '+ QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
          ParamByName('produto').Value  := Produto;
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbreservasnota SET');
          SQL.Add('qtde_total = (select ifnull(sum(qtde),0) FROM tbreservasitem a');
          SQL.Add('WHERE a.idtbreservanota = ' + ledt_idreserva.Text + ' AND date(a.dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text)))+' AND a.canc = 0),');
          SQL.Add('valor_total = (select ifnull(sum(valor_total),0) FROM tbreservasitem a');
          SQL.Add('WHERE a.idtbreservanota = ' + ledt_idreserva.Text + ' AND date(a.dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text)))+' AND a.canc = 0)');
          SQL.Add('WHERE a.idtbreserva = ' + ledt_idreserva.Text + ' AND date(a.dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
          ParamByName('empresa').Value := EmpLog;
          ParamByName('usuario').Value := UserLog;
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('SELECT IFNULL(SUM(qtde),0) as total FROM tbreservasitem');
          SQL.Add('WHERE canc = 0 idtbreservanota = ' + ledt_idreserva.Text + ' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
          Open;

          lbl_qtde.Caption := 'Qtde: ' + FieldByName('total').AsString;

          Close;
          SQL.Clear;
          SQL.Add('SELECT IFNULL(SUM(valor_total),0) as total FROM tbreservasitem');
          SQL.Add('WHERE canc = 0 idtbreservanota = ' + ledt_idreserva.Text + ' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',StrToDateTime(ledt_emissao.Text))));
          Open;

          lbl_total.Caption := 'Total: R$ ' + FormatFloat('###,##0.00',
            FieldByName('total').Value);
        End;
    Except
      On E: Exception Do
      Begin
        Erro := 'Erro' + #13 + E.Message;
      End;
    End;
    Result := True;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(vControle);
    pnl_trocaproduto.Visible := False;
    pnlDados.Enabled         := True;
    pnlProdutos.Enabled      := True;
    //
    LimparItem(False);

    //
    ListaItens(ledt_idreserva.Text, StrToDate(ledt_emissao.Text));
    fdmReservaItem.Last;
  End;
end;

procedure TfReservas.ListaCab(vReserva: String; DtEmissao: TDateTime);
var
  VQry            : TFDQuery;
  vClasseReservas : TClasseReservas;
  vControle       : TControle;
begin
  Try
    vControle       := TControle.Create;
    vClasseReservas := TClasseReservas.Create(vControle);
    fdmReservaCab.Close;
    VQry := vClasseReservas.ReservaNota(vReserva, DtEmissao);
    Try
      VQry.FetchAll;
      fdmReservaCab.Data := VQry.Data;
      fdmReservaCab.Open;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseReservas);
    FreeAndNil(vControle);
  End;
end;

procedure TfReservas.ListaItens(vReserva: String; DtEmissao: TDateTime);
var
  VQry            : TFDQuery;
  vClasseReservas : TClasseReservas;
  vControle       : TControle;
begin
  Try
    vControle       := TControle.Create;
    vClasseReservas := TClasseReservas.Create(vControle);
    fdmReservaItem.Close;
    VQry := vClasseReservas.ReservaItem(vReserva, DtEmissao);
    Try
      VQry.FetchAll;
      fdmReservaItem.Data := VQry.Data;
      fdmReservaItem.Open;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseReservas);
    FreeAndNil(vControle);
  End;
end;

end.
