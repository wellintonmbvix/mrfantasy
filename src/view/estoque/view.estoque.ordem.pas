unit view.estoque.ordem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.DateUtils,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.StrUtils,

  SimpleInterface,

  DataSetUtils,
  Data.DB,

  FireDAC.Stan.Param,
  FireDAC.Stan.StorageJSON,
  FireDAC.Comp.Client,

  uClasseOrdens,

  uRotinas,
  uGlobal,
//  uControle,

  classe.global,
  model.funcionario,
  model.cliente,
  model.produto,
  model.ordemCab,
  model.ordemItem,
  model.ordemPagto,
  model.estoque,
  model.kardex,
  model.parametro,
  model.empresa,
  model.caixa,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.DBCtrls,
  Vcl.WinXPickers,

  frxExportPDF,
  frxClass,
  frxExportBaseDialog,
  frxExportText,
  frxDBSet,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvExControls,
  JvStaticText,
  JvExStdCtrls,
  JvEdit,
  JvValidateEdit,
  JvDataSource,
  JvDBLookup,
  JvComponentBase,
  JvBalloonHint,
  JvSpin,
  JvRadioButton,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvExComCtrls,
  JvDateTimePicker,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  eAcao = (acInserindo, acAtualizando, acListando, acComecando);
  eSituacao = (ftComecando, ftRetirar, ftDevolver, ftDevolvida);

  TfrmOrdens = class(TForm)
    PageControl1: TPageControl;
    tbsItens: TTabSheet;
    tbsCab: TTabSheet;
    pnlMain1: TPanel;
    pnl_btnsItens: TPanel;
    jvdbgItens: TJvDBGrid;
    pnlPesquisa: TPanel;
    ledt_produto: TLabeledEdit;
    jvcedt_produto: TJvComboEdit;
    jvstProduto: TJvStaticText;
    ledt_valorUnitario: TLabeledEdit;
    ledt_percDesconto: TLabeledEdit;
    ledt_valorDesconto: TLabeledEdit;
    jvedt_valorUnitario: TJvValidateEdit;
    jvedt_percDesconto: TJvValidateEdit;
    jvedt_valorDesconto: TJvValidateEdit;
    pnl_btnPagto: TPanel;
    sbtn_pagto: TSpeedButton;
    pnl_btnCancelar: TPanel;
    sbtn_cancelar: TSpeedButton;
    dsFormaPagto: TDataSource;
    jvdsItens: TJvDataSource;
    jvdsCab: TJvDataSource;
    pnl_btnAddItem: TPanel;
    sbtn_addItem: TSpeedButton;
    jvdsPagto: TJvDataSource;
    lblTotal: TLabel;
    pnl_observacao1: TPanel;
    lblOpcoes1: TLabel;
    pnlMain2: TPanel;
    Panel1: TPanel;
    ledt_atendente: TLabeledEdit;
    jvcedt_atendente: TJvComboEdit;
    jvstAtendente: TJvStaticText;
    ledt_dtretirada: TLabeledEdit;
    jvdt_dtretirada: TJvDateEdit;
    ledt_dtdevolucao: TLabeledEdit;
    jvdt_dtdevolucao: TJvDateEdit;
    ledt_cliente: TLabeledEdit;
    jvcedt_cliente: TJvComboEdit;
    jvstCliente: TJvStaticText;
    ledt_fone1: TLabeledEdit;
    ledt_fone2: TLabeledEdit;
    jvstTel1: TJvStaticText;
    jvstTel2: TJvStaticText;
    mem_obs: TMemo;
    lbl_memobs: TLabel;
    pnl_btnsCab: TPanel;
    lblPagto: TLabel;
    pnl_btnFinalizar: TPanel;
    sbtn_finalizar: TSpeedButton;
    pnl_btnVoltar: TPanel;
    sbtn_voltar: TSpeedButton;
    jvdbPagto: TJvDBLookupCombo;
    lbl_formpagto: TLabel;
    Panel3: TPanel;
    sbtn_addpagto: TSpeedButton;
    ledt_valorPagto: TLabeledEdit;
    jvedt_valorPagto: TJvValidateEdit;
    jvdbFormasPagto: TJvDBGrid;
    dsFuncionarios: TDataSource;
    JvBalloonHint: TJvBalloonHint;
    pnl_btnAddCliente: TPanel;
    sbtn_addcliente: TSpeedButton;
    pnl_btnCaixa: TPanel;
    sbtn_caixa: TSpeedButton;
    jvdbgItens1: TJvDBGrid;
    tbsPesquisa: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    pnl_btnPesquisar: TPanel;
    sbtn_pesquisar: TSpeedButton;
    Panel6: TPanel;
    jvdbgCabs: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    jvcedt_cliente1: TJvComboEdit;
    jvstCliente1: TJvStaticText;
    Label5: TLabel;
    pnl_btnPesquisar1: TPanel;
    sbtn_pesquisar1: TSpeedButton;
    pnl_btnsPesquisa: TPanel;
    Panel10: TPanel;
    sbtn_voltar1: TSpeedButton;
    Panel9: TPanel;
    jvdbgItens3: TJvDBGrid;
    tbsManutencao: TTabSheet;
    Panel11: TPanel;
    Panel12: TPanel;
    jvst_dtemissao: TJvStaticText;
    Label11: TLabel;
    jvst_controle: TJvStaticText;
    Label12: TLabel;
    jvst_atendente: TJvStaticText;
    Label13: TLabel;
    jvdt_dtretirada1: TJvDateEdit;
    jvdt_dtdevolucao1: TJvDateEdit;
    Label14: TLabel;
    Label15: TLabel;
    jvst_cliente: TJvStaticText;
    Label16: TLabel;
    pnl_btnsManutencao: TPanel;
    pnl_btnVoltar1: TPanel;
    sbtn_voltar2: TSpeedButton;
    Panel2: TPanel;
    jvstProduto2: TJvStaticText;
    jvcedt_produto2: TJvComboEdit;
    Label17: TLabel;
    jvdbgItens4: TJvDBGrid;
    jvst_valorUnitario: TJvStaticText;
    Label18: TLabel;
    img_addItem: TImage;
    pnl_btnRefreshItem: TPanel;
    img_resfreshItem: TImage;
    sbtn_refreshItem: TSpeedButton;
    pnl_btnRetirada: TPanel;
    sbtn_retirada: TSpeedButton;
    pnl_btnDevolucao: TPanel;
    sbtn_devolucao: TSpeedButton;
    frxSimpleTextExport: TfrxSimpleTextExport;
    frxPDFExport: TfrxPDFExport;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    jvsedt_qtde: TJvSpinEdit;
    LabeledEdit1: TLabeledEdit;
    cbox_pesquisa: TComboBox;
    Label4: TLabel;
    Label8: TLabel;
    jvdt_dtStart: TJvDateEdit;
    Label9: TLabel;
    jvdt_dtEnd: TJvDateEdit;
    chkOrdensRetiradas: TCheckBox;
    tbsReservadas: TTabSheet;
    Panel8: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    SpeedButton1: TSpeedButton;
    Panel16: TPanel;
    jvdbg_Fantasias: TJvDBGrid;
    rdgFiltros: TRadioGroup;
    jvrbtn_aretirar: TJvRadioButton;
    jvrbtn_adevolver: TJvRadioButton;
    ledt_produto2: TLabeledEdit;
    jvdsReservadas: TJvDataSource;
    jvrbtn_devolvidas: TJvRadioButton;
    pnl_btnListaFantasias: TPanel;
    sbtn_listaFantasias: TSpeedButton;
    pnl_btnRptFantasias: TPanel;
    sbtn_rptFantasias: TSpeedButton;
    pnl_observacao2: TPanel;
    lblOpcoes2: TLabel;
    pnl_btnAcaoFantasias: TPanel;
    sbtn_acaoFantasias: TSpeedButton;
    pnl_dtdevolucao: TPanel;
    Label3: TLabel;
    sbt_confirma: TSpeedButton;
    Label1: TLabel;
    jvedt_dtdevolucao: TJvDatePickerEdit;
    jvedt_dtretirada: TJvDatePickerEdit;
    chbFiltraData: TCheckBox;
    jvdtpDataFiltro1: TJvDateTimePicker;
    jvdtpDataFiltro2: TJvDateTimePicker;
    Label2: TLabel;
    pnl_btnRelCaixa: TPanel;
    sbtn_listaOrdens: TSpeedButton;
    pnl_btnComprovante: TPanel;
    sbtn_comprovante: TSpeedButton;
    fdmtb_ordemMaster: TFDMemTable;
    fdmtb_ordemDetail: TFDMemTable;
    fdmtb_ordemPagto: TFDMemTable;
    frxDBCab: TfrxDBDataset;
    frxDBItem: TfrxDBDataset;
    frxReport: TfrxReport;
    fdmtb_formasPagto: TFDMemTable;
    fdmtb_listaPagtos: TFDMemTable;
    fdmtb_listaItens: TFDMemTable;
    fdmtb_listaOrdens: TFDMemTable;
    procedure jvedt_valorUnitarioChange(Sender: TObject);
    procedure jvedt_valorUnitarioEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtn_pagtoMouseEnter(Sender: TObject);
    procedure sbtn_pagtoMouseLeave(Sender: TObject);
    procedure sbtn_cancelarMouseEnter(Sender: TObject);
    procedure sbtn_cancelarMouseLeave(Sender: TObject);
    procedure sbtn_addItemMouseEnter(Sender: TObject);
    procedure sbtn_addItemMouseLeave(Sender: TObject);
    procedure sbtn_addItemClick(Sender: TObject);
    procedure jvcedt_produtoButtonClick(Sender: TObject);
    procedure jvcedt_produtoChange(Sender: TObject);
    procedure jvdsCabDataSetScrolled(Sender: TObject);
    procedure jvedt_valorUnitarioExit(Sender: TObject);
    procedure sbtn_cancelarClick(Sender: TObject);
    procedure jvdbgItensEnter(Sender: TObject);
    procedure jvdbgItensExit(Sender: TObject);
    procedure jvdbgItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtn_pagtoClick(Sender: TObject);
    procedure jvcedt_atendenteButtonClick(Sender: TObject);
    procedure jvcedt_clienteButtonClick(Sender: TObject);
    procedure jvcedt_atendenteChange(Sender: TObject);
    procedure sbtn_addpagtoClick(Sender: TObject);
    procedure sbtn_voltarClick(Sender: TObject);
    procedure jvcedt_clienteChange(Sender: TObject);
    procedure sbtn_addclienteClick(Sender: TObject);
    procedure sbtn_caixaClick(Sender: TObject);
    procedure jvdbFormasPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtn_finalizarClick(Sender: TObject);
    procedure jvcedt_clienteExit(Sender: TObject);
    procedure jvcedt_atendenteExit(Sender: TObject);
    procedure sbtn_pesquisarClick(Sender: TObject);
    procedure jvcedt_cliente1ButtonClick(Sender: TObject);
    procedure jvcedt_cliente1Change(Sender: TObject);
    procedure jvcedt_cliente1Exit(Sender: TObject);
    procedure sbtn_pesquisar1Click(Sender: TObject);
    procedure sbtn_voltar1Click(Sender: TObject);
    procedure jvdbgCabsDblClick(Sender: TObject);
    procedure jvcedt_produto2Change(Sender: TObject);
    procedure sbtn_refreshItemClick(Sender: TObject);
    procedure jvdbgItens4DblClick(Sender: TObject);
    procedure jvdbgItensDblClick(Sender: TObject);
    procedure jvdt_dtretInicioMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure jvdbgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbtn_retiradaClick(Sender: TObject);
    procedure sbtn_devolucaoClick(Sender: TObject);
    procedure jvdbgCabsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure jvdbgCabsKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_rptFantasiasClick(Sender: TObject);
    procedure jvcedt_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvdbgItens1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure jvdbgItens3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbtn_listaFantasiasClick(Sender: TObject);
    procedure jvrbtn_aretirarClick(Sender: TObject);
    procedure jvdbg_FantasiasTitleClick(Column: TColumn);
    procedure sbtn_acaoFantasiasClick(Sender: TObject);
    procedure jvdbg_FantasiasEnter(Sender: TObject);
    procedure jvdbg_FantasiasExit(Sender: TObject);
    procedure ledt_produto2Change(Sender: TObject);
    procedure chbFiltraDataClick(Sender: TObject);
    procedure sbtn_listaOrdensClick(Sender: TObject);
    procedure sbtn_comprovanteClick(Sender: TObject);
    procedure fdmtb_ordemDetailAfterOpen(DataSet: TDataSet);
    procedure fdmtb_ordemPagtoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    DaoOrdemCab: iSimpleDAO<TOrdemCab>;
    DaoOrdemItem: iSimpleDAO<TOrdemItem>;
    DaoOrdemPagto: iSimpleDAO<TOrdemPayment>;
    DaoFantasias: iSimpleDAO<TOrdemItem>;
    FStatus: eAcao;
    FSituacao: eSituacao;
//    Controle: TControle;
    nroOrdem: String;
    FListItens: TObjectList<TOrdemItem>;

    procedure SetStatus(const poStatus: eAcao);
    procedure SetSituacao(const poSituacao: eSituacao);
    procedure IniciaOrdem;
    procedure InsereItem;

    procedure ListaOrdem(aOrdem: String); overload;
    procedure ListaOrdem(dtInicio, dtFim: TDate;
      idClieIni, idClieFim: Integer); overload;
    procedure ListaItensOrdem(aOrdem: String); overload;
    procedure ListaItensOrdem(dtInicio, dtFim: TDate;
      produto, OrderBy, Direcao: String); overload;
    procedure ListaFantasias(Fantasia, OrderBy, Direcao: String);
    procedure CalculaDesconto(Metodo: Integer = 0);
    procedure CancelarOrdem(aOrdem: String);
    procedure CancelarItem(aOrdemItem: String);
    procedure AlterarItem(aOrdemItem: String);
    procedure ListaOrdemPagtos(aOrdem: String);
    procedure InserirPagto;
    procedure GetItemDataSet(Itens: TOrdemItem; DataSource: TJvDataSource);
    procedure SwitchVenda(aOrdemItem: String);
    procedure ExcluiPagto(aIdFormaPagto: String);
    procedure FinalizaOrdem(aOrdemCab: String);
    procedure MovEstoqueKardex(nIdProduto, nQtd, nTipo: Integer;
      nDocumento: String);
    procedure ManutencaoOrdem(aOrdem: String);
    procedure RetirarOrdem(aOrdemCab: String);
    procedure DevolverOrdem(aOrdemCab: String);
    procedure ImprimirComprovante(aOrdemCab: String);
    procedure ImprimirOrdens(dtEmissaoIni, dtEmissaoFim: TDate);
    procedure ImprimirFantasias(produto, OrderBy, Direcao: String);
    procedure SwitchDescVenda(modo: String);
    procedure CriarFieldsTables;
  public
    { Public declarations }
  end;

var
  frmOrdens: TfrmOrdens;
  vQtde, vTotal, vPagto: Currency;
  itensAlugados: Integer;
  descacre: String = 'desconto';
  dtEmissao: TDate;
  OrderBy: String = 'produto';
  Direcao: String = '';
  ordemRetirada: Boolean = false;
  inibeAcresc: Boolean = false;

implementation

{$R *.dfm}

uses
  controller.dto.funcionario.interfaces,
  controller.dto.funcionario.interfaces.impl,
  controller.dto.cliente.interfaces,
  controller.dto.cliente.interfaces.impl,
  controller.dto.produto.interfaces,
  controller.dto.produto.interfaces.impl,
  controller.dto.ordemCab.interfaces,
  controller.dto.ordemCab.interfaces.impl,
  controller.dto.ordemItem.interfaces,
  controller.dto.ordemItem.interfaces.impl,
  controller.dto.ordemPagto.interfaces,
  controller.dto.ordemPagto.interfaces.impl,
  controller.dto.formaPagto.interfaces,
  controller.dto.formaPagto.interfaces.impl,
  controller.dto.kardex.interfaces,
  controller.dto.kardex.interfaces.impl,
  controller.dto.estoque.interfaces,
  controller.dto.estoque.interfaces.impl,
  controller.dto.parametro.interfaces,
  controller.dto.parametro.interfaces.impl,
  controller.dto.empresa.interfaces,
  controller.dto.empresa.interfaces.impl,
  controller.dto.caixa.interfaces,
  controller.dto.caixa.interfaces.impl,

  view.cadastros.produtoPesquisa,
  view.cadastros.funcionarioPesquisa,
  view.cadastros.clientePesquisa,
  view.cadastros.cliente,
  view.financeiro.caixa;

{$REGION 'Métodos e Funções'}

procedure TfrmOrdens.GetItemDataSet(Itens: TOrdemItem;
  DataSource: TJvDataSource);
begin
  With Itens Do
  Begin
    idtbordensItens := DataSource.DataSet.FieldByName
      ('idtbordens_itens').AsString;
    idtbordensCab := DataSource.DataSet.FieldByName('idtbordens_cab').AsString;
    idtbProduto := DataSource.DataSet.FieldByName('idtbproduto').Value;
    item := DataSource.DataSet.FieldByName('item').Value;
    qtde := DataSource.DataSet.FieldByName('qtde').Value;
    precoTabela := DataSource.DataSet.FieldByName('precoTabela').Value;
    valorUnitario := DataSource.DataSet.FieldByName('valorUnitario').Value;
    percDesconto := DataSource.DataSet.FieldByName('percDesconto').Value;
    valorDesconto := DataSource.DataSet.FieldByName('valorDesconto').Value;
    percAcrescimo := DataSource.DataSet.FieldByName('percAcrescimo').Value;
    valorAcrescimo := DataSource.DataSet.FieldByName('valorAcrescimo').Value;
    totalBruto := DataSource.DataSet.FieldByName('totalBruto').Value;
    totalLiquido := DataSource.DataSet.FieldByName('totalLiquido').Value;
    if Length(Trim(DataSource.DataSet.FieldByName('venda').AsString)) > 0 then
      venda := 'S'
    else
      venda := 'N';
    dtretirada := jvdsCab.DataSet.FieldByName('dtretirada').Value;
    if Length(Trim(DataSource.DataSet.FieldByName('retirado').AsString)) > 0
    then
      retirado := 'S'
    else
      retirado := 'N';
    if Length(Trim(DataSource.DataSet.FieldByName('devolvido').AsString)) > 0
    then
      devolvido := 'S'
    else
      devolvido := 'N';
    if Length(Trim(DataSource.DataSet.FieldByName('cancelado').AsString)) > 0
    then
      cancelado := 'S'
    else
      cancelado := 'N';
    userAlt := UserLog;
  End;
end;

procedure TfrmOrdens.CalculaDesconto(Metodo: Integer);
begin
  case Metodo of
    0: {--- Desconto ao digitar o valor de venda ---}
      begin
        if descacre = 'desconto' then
        Begin
          jvedt_valorDesconto.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) -
            jvedt_valorUnitario.Value;
          if jvedt_valorDesconto.Value > 0 then
          Begin
            jvedt_percDesconto.Value :=
              (jvedt_valorDesconto.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_valorUnitario.Text))) * 100;
          End
          Else
          Begin
            jvedt_valorDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
        End
        else
        Begin
          jvedt_valorDesconto.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) +
            jvedt_valorUnitario.Value;
          if jvedt_valorDesconto.Value > 0 then
          Begin
            jvedt_percDesconto.Value :=
              (jvedt_valorDesconto.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_valorUnitario.Text))) * 100;
          End
          Else
          Begin
            jvedt_valorDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
        End;
      end;
    1: {--- Desconto ao digitar o percentual de desconto ---}
      begin
        if descacre = 'desconto' then
        Begin
          if jvedt_percDesconto.Value > 0 then
          Begin
            jvedt_valorDesconto.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) *
              (jvedt_percDesconto.Value / 100);
          End
          Else
          Begin
            jvedt_valorDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
          jvedt_valorUnitario.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) -
            jvedt_valorDesconto.Value;
        End
        else
        Begin
          if jvedt_percDesconto.Value > 0 then
          Begin
            jvedt_valorDesconto.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) *
              (jvedt_percDesconto.Value / 100);
          End
          Else
          Begin
            jvedt_valorDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
          jvedt_valorUnitario.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) +
            jvedt_valorDesconto.Value;
        End;
      end;
    2: {--- Desconto ao digitar o valor de desconto ---}
      begin
        if descacre = 'desconto' then
        Begin
          jvedt_valorUnitario.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) -
            jvedt_valorDesconto.Value;
          if jvedt_valorDesconto.Value > 0 then
          Begin
            jvedt_percDesconto.Value :=
              (jvedt_valorDesconto.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_valorUnitario.Text))) * 100;
          End
          Else
          Begin
            jvedt_percDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
        End
        else
        Begin
          jvedt_valorUnitario.Value :=
            StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text)) +
            jvedt_valorDesconto.Value;
          if jvedt_valorDesconto.Value > 0 then
          Begin
            jvedt_percDesconto.Value :=
              (jvedt_valorDesconto.Value / StrToCurr(SomenteNumero('R$ .',
              ledt_valorUnitario.Text))) * 100;
          End
          Else
          Begin
            jvedt_percDesconto.Value := 0;
            jvedt_valorUnitario.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_valorUnitario.Text));
          End;
        End;
      end;
  end;
end;

procedure TfrmOrdens.IniciaOrdem;
var
  nextId: Integer;
begin
  var
  IOrdemMaster := TIOrdemMaster.New;
  IOrdemMaster.Build.GetLastId('tbordens_cab','date(dtdocumento) = '
    + QuotedStr(FormatDateTime('YYYY-mm-dd', Date())),'controle',nextId);

  {--- Criando os campos das tables temporárias ---}
  CriarFieldsTables();

  With fdmtb_ordemMaster Do
    begin
      if not Active then
        Active := True;

      EmptyDataSet;

      Append;

      FieldByName('idtbordens_cab').AsString :=  GuidCreate;
      FieldByName('idtbempresa').AsInteger := TGlobal.empresa;
      FieldByName('controle').AsInteger := nextId + 1;
      FieldByName('dtdocumento').AsDateTime := Date();
      FieldByName('estado').AsString := 'P';
      FieldByName('usercad').AsInteger := TGlobal.userId;
      FieldByName('useralt').AsInteger := TGlobal.userId;
      FieldByName('dtretirada').AsDateTime := Date();
      FieldByName('dtdevolucao').AsDateTime := Date();
      FieldByName('observacao').AsString := EmptyStr;

      Post;
    end;

  SetStatus(acInserindo);
end;

procedure TfrmOrdens.InsereItem;
var
  listaProduto: TObjectList<TProduto>;
begin
  var
  IProduto := TIProduto.New;
  IProduto.Build.ListById('idtbproduto', StrToInt(jvcedt_produto.Text),
   listaProduto);
  With fdmtb_ordemDetail Do
    Begin
      if not Active then
        Active := True;

      Append;
      FieldByName('idtbordens_itens').AsString := GuidCreate;
      FieldByName('idtbordens_cab').AsString :=
        fdmtb_ordemMaster.FieldByName('idtbordens_cab').AsString;
      FieldByName('idtbproduto').AsInteger := StrToInt(jvcedt_produto.Text);
      FieldByName('produto').AsString := jvstProduto.Caption;
      FieldByName('item').AsInteger := RecordCount + 1;
      FieldByName('qtde').AsCurrency := jvsedt_qtde.Value;
      FieldByName('precoTabela').AsCurrency := StrToCurr(SomenteNumero('.,',
        ledt_valorUnitario.Text)) / 100;
      FieldByName('valorUnitario').AsCurrency := jvedt_valorUnitario.Value;
      if descacre = 'desconto' then
      begin
        FieldByName('percDesconto').AsCurrency := jvedt_percDesconto.Value;
        FieldByName('valorDesconto').AsCurrency :=
          FieldByName('qtde').AsCurrency * (jvedt_valorDesconto.Value * (-1));
        FieldByName('percAcrescimo').AsCurrency := 0;
        FieldByName('valorAcrescimo').AsCurrency := 0;
      end
      else
      begin
        FieldByName('percDesconto').AsCurrency := 0;
        FieldByName('valorDesconto').AsCurrency := 0;
        FieldByName('percAcrescimo').AsCurrency := jvedt_percDesconto.Value;
        FieldByName('valorAcrescimo').AsCurrency :=
          FieldByName('qtde').AsCurrency * jvedt_valorDesconto.Value;
      end;
      FieldByName('totalBruto').AsCurrency :=
        FieldByName('precoTabela').AsCurrency * FieldByName('qtde').AsCurrency;
      FieldByName('totalLiquido').AsCurrency :=
        FieldByName('valorUnitario').AsCurrency * FieldByName('qtde').AsCurrency;
      if (listaProduto.Items[0] as TProduto).itemvenda = 'VE' then
        begin
          FieldByName('venda').AsString := 'S';
        end
      else
        begin
          FieldByName('venda').AsString := EmptyStr;
          itensAlugados := itensAlugados + 1;
        end;
      FieldByName('dtretirada').AsDateTime := Date;
      FieldByName('retirado').AsString := EmptyStr;
      FieldByName('devolvido').AsString := EmptyStr;
      FieldByName('cancelado').AsString := EmptyStr;
      FieldByName('useralt').AsInteger := TGlobal.userId;
      Post;

      vQtde := vQtde + FieldByName('qtde').AsCurrency;
      vTotal := vTotal + FieldByName('totalLiquido').AsCurrency;
    End;
  lblTotal.Caption := 'Qtde.: ' + CurrToStr(vQtde) +
    ' Total: ' + FormatFloat('###,###,##0.00', vTotal);
  listaProduto.Clear;
  FreeAndNil(listaProduto);

  jvsedt_qtde.Value := 1;
  jvcedt_produto.Clear;
  jvcedt_produto.SetFocus;
end;

procedure TfrmOrdens.ListaItensOrdem(aOrdem: String);
begin
  try
    var
    IOrdemDetail := TIOrdemDetail.New;
    IOrdemDetail.Manufacture.ViewOrdemDetail('a.idtbordens_cab = ' +
      QuotedStr(aOrdem), fdmtb_listaItens);
    jvdsItens.DataSet := fdmtb_listaItens;
    vQtde := 0;
    vTotal := 0;
    itensAlugados := 0;
    fdmtb_ordemDetail.DisableControls;
    fdmtb_ordemDetail.First;
    if not fdmtb_ordemDetail.Eof then
      repeat
        vQtde := vQtde + fdmtb_ordemDetail.FieldByName('qtde').Value;
        vTotal := vTotal + fdmtb_ordemDetail.FieldByName('totalLiquido')
          .AsCurrency;
        if fdmtb_ordemDetail.FieldByName('venda').AsString.Trim().IsEmpty then
          itensAlugados := itensAlugados + 1;

        fdmtb_ordemDetail.Next
      until fdmtb_ordemDetail.Eof;
    fdmtb_ordemDetail.EnableControls;
    lblTotal.Caption := 'Qtde.: ' + CurrToStr(vQtde) + ' Total: ' +
      FormatCurr('###,###,##0.00', vTotal) + ' ';
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.ListaItensOrdem(dtInicio, dtFim: TDate;
  produto, OrderBy, Direcao: String);
var
  strSQL: String;
begin
  FListItens := TObjectList<TOrdemItem>.Create;
  try
    DaoOrdemItem.SQL.Fields
      ('CONVERT(tbordens_itens.idtbordens_cab USING utf8mb3) idtbordens_cab')
      .Fields(',tbprodutos.nome produto').Fields(',tbordens_cab.dtdocumento')
      .Fields(',tbordens_cab.dtretirada').Fields(',tbordens_cab.dtdevolucao')
      .Fields(',LPAD(tbordens_cab.controle, 6, "0") controle')
      .Fields(',tbclientes.nome cliente')
      .Fields(',(CASE WHEN tbordens_itens.retirado = "S" THEN "Sim" ELSE "Não" END) AS retirado')
      .Join('INNER JOIN tbordens_cab ON tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab')
      .Join('INNER JOIN tbprodutos ON tbordens_itens.idtbproduto = tbprodutos.idtbproduto')
      .Join('INNER JOIN tbclientes ON tbordens_cab.idtbcliente = tbclientes.idtbcliente')
      .Where('tbordens_cab.estado = "A"')
      .Where(' AND tbordens_itens.venda = "N"')
      .Where(' AND tbordens_itens.cancelado = "N"')
    // .Where(IfThen(chkMostraRetiradas.Checked,' AND tbordens_itens.retirado IN ("N","S")',' AND tbordens_itens.retirado = "N"'))
      .Where(' AND tbprodutos.nome Like ' + QuotedStr(produto + '%'))
      .Where(strSQL).OrderBy(' ' + OrderBy + ' ' + Direcao)
      .&End.Find(FListItens);
  finally
    FreeAndNil(FListItens);
  end;
end;

procedure TfrmOrdens.ListaFantasias(Fantasia, OrderBy, Direcao: String);
var
  strSQL: String;
begin
  strSQL := 'b.estado = "A"';
  strSQL := strSQL + ' AND a.venda = "N"';
  strSQL := strSQL + ' AND a.cancelado = "N"';
  strSQL := strSQL + ' AND a.idtbordens_cab IN (SELECT tbo.idtbordens_cab ' +
    'FROM tbordens_cab tbo WHERE tbo.estado IN ("F","A","D"))';
  strSQL := strSQL + ' AND tbprodutos.nome Like ' + QuotedStr(Fantasia + '%');
  case FSituacao of
    ftRetirar:
      begin
        strSQL := ' AND tbordens_itens.retirado="N" AND ' +
          'tbordens_itens.devolvido="N" AND tbordens_itens.idtbordens_cab ' +
          'IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab ' +
          'WHERE tbordens_cab.estado IN ("F","A","D"))';
        if chbFiltraData.Checked then
          strSQL := strSQL + ' AND date(tbordens_cab.dtretirada) between ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdtpDataFiltro1.Date)) +
            ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdtpDataFiltro2.Date));
      end;
    ftDevolver:
      begin
        strSQL := ' AND tbordens_itens.retirado="S" AND ' +
          'tbordens_itens.devolvido="N" AND tbordens_itens.idtbordens_cab ' +
          'IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab ' +
          'WHERE tbordens_cab.estado IN ("F","A","D"))';
        if chbFiltraData.Checked then
          strSQL := strSQL + ' AND date(tbordens_cab.dtdevolucao) = ' +
            QuotedStr(FormatDateTime('YYYY-mm-dd', jvdtpDataFiltro1.Date)) +
            ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
            jvdtpDataFiltro2.Date));
      end;
    ftDevolvida:
      begin
        chbFiltraData.Checked := false;
        strSQL := ' AND tbordens_itens.retirado="S" AND ' +
        'tbordens_itens.devolvido="S"  AND tbordens_itens.idtbordens_cab ' +
        'IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab ' +
        'WHERE tbordens_cab.estado IN ("D"))';
      end;
  end;

  var
  IOrdemDetail := TIOrdemDetail.New;
  IOrdemDetail.Manufacture.ViewItensAlugados(fdmtb_listaItens, strSQL,
    OrderBy);
end;

procedure TfrmOrdens.ListaOrdem(dtInicio, dtFim: TDate;
  idClieIni, idClieFim: Integer);
var
  strSQL: String;
begin
  strSQL := 'a.estado IN ("A","F")';
  strSQL := strSQL + ' AND a.idtbcliente BETWEEN ' + idClieIni.ToString;
  strSQL := strSQL + ' AND ' + idClieFim.ToString;
  strSQL := strSQL + IfThen(chkOrdensRetiradas.Checked,
      ' AND a.retirada = "S"', ' AND retirada IS NULL');
  case cbox_pesquisa.ItemIndex of
    0:
      strSQL := strSQL + ' AND a.dtdocumento BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtInicio)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtFim));
    1:
      strSQL := strSQL + ' AND a.dtretirada BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtInicio)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtFim));
    2:
      strSQL := strSQL + ' AND a.dtdevolucao BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtInicio)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtFim));
    3:
      strSQL := strSQL + ' AND a.dtdocumento BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtInicio)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtFim));
  end;

  var
  IOrdemMaster := TIOrdemMaster.New;
  IOrdemMaster.Manufacture.ViewOrdensAlugadas(strSQL, fdmtb_listaOrdens);
end;

procedure TfrmOrdens.ListaOrdem(aOrdem: String);
begin
  try
    var
    IOrdemMaster := TIOrdemMaster.New;
    IOrdemMaster.Manufacture.ViewOrdemMaster('idtbordens_cab = ' +
      QuotedStr(aOrdem), fdmtb_listaOrdens);
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.CancelarOrdem(aOrdem: String);
begin
  var
  IOrdemMaster := TIOrdemMaster.New;
  try
    if (FStatus = acInserindo) Or (FStatus = acComecando) then
    begin
      fdmtb_ordemPagto.EmptyDataSet;
      fdmtb_ordemDetail.EmptyDataSet;
      fdmtb_ordemMaster.EmptyDataSet;
    end
    else
    begin
      var listaOrdemMaster : TObjectList<TOrdemMaster>;

      var objOrdemMaster :=
      IOrdemMaster.Build.ListByGuid('idtbordens_cab', aOrdem,
        listaOrdemMaster).This;
      IOrdemMaster.Build.Modify(objOrdemMaster);
      With objOrdemMaster Do
        Begin
          estado := 'C';
          useralt := TGlobal.userId;
        End;
      IOrdemMaster.Build.Update;
      listaOrdemMaster.Clear;
      FreeAndNil(listaOrdemMaster);
    end;

    SetStatus(acComecando);
    fdmtb_ordemPagto.EmptyDataSet;
    fdmtb_ordemDetail.EmptyDataSet;
    fdmtb_ordemMaster.EmptyDataSet;
    jvcedt_produto.Clear;
    jvcedt_produto.SetFocus;
  except
    on e: Exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.chbFiltraDataClick(Sender: TObject);
begin
  jvdtpDataFiltro1.Enabled := TCheckBox(Sender).Checked;
  jvdtpDataFiltro2.Enabled := TCheckBox(Sender).Checked;
  ListaFantasias(ledt_produto2.Text, OrderBy, Direcao);
end;

procedure TfrmOrdens.CancelarItem(aOrdemItem: String);
var
  cancelados: Integer;
begin
  {--- Validando ---}
  if fdmtb_ordemDetail.FieldByName('cancelado').AsString = 'S' then
    Exit;

 {--- Verificando quantos itens não cancelados restam ---}
 With fdmtb_ordemDetail Do
  Begin
    DisableControls;
    if not Eof then
      repeat
        if not FieldByName('cancelado').AsString.Trim.IsEmpty then
            cancelados := cancelados + 1;
        Next;
      until Eof;
    EnableControls;
  End;

  if (fdmtb_ordemDetail.RecordCount = 1) Or
    ((fdmtb_ordemDetail.RecordCount - cancelados) = 1) then
  begin
    MsgAviso('Cancelamento não permitido por ser o único item da lista.');
    Exit;
  end;

  {--- Se estiver na geração da Ordem cancela apenas o item na FDMemTable
    caso contrário cancela em banco ---}
  if FStatus <> acAtualizando then
    begin
      With fdmtb_ordemDetail Do
        begin
          Edit;
          FieldByName('cancelado').AsString := 'S';
          FieldByName('userAlt').AsInteger := TGlobal.userId;
          Post;
        end;
    end
  else
    begin
      var
      listaItem: TObjectList<TOrdemDetail>;

      var
      IOrdemDetail := TIOrdemDetail.New;
      var objItem := IOrdemDetail.Build.ListByGuid('idtbordens_itens',
        fdmtb_ordemDetail.FieldByName('idtbordens_itens').AsString,
          listaItem).This;
      IOrdemDetail.Build.Modify(objItem);
      With objItem Do
        Begin
          cancelado := 'S';
          useralt := TGlobal.userId;
        End;
      IOrdemDetail.Build.Update;
      listaItem.Clear;
      FreeAndNil(listaItem);
    end;
end;

procedure TfrmOrdens.AlterarItem(aOrdemItem: String);
begin
  try
    var
    listaOrdemDetail: TObjectList<TOrdemDetail>;
    var
    IOrdemDetail := TIOrdemDetail.New;
    var
    objDetail := IOrdemDetail.Build.ListByGuid('idtbordens_itens', aOrdemItem,
      listaOrdemDetail).This;
    IOrdemDetail.Build.Modify(objDetail);
    With objDetail Do
      Begin
        idtbproduto := StrToInt(jvcedt_produto.Text);
        qtde := jvsedt_qtde.Value;
        precoTabela := StrToCurr(SomenteNumero('.,',
          ledt_valorUnitario.Text)) / 100;
        valorUnitario := jvedt_valorUnitario.Value;
        if descacre = 'desconto' then
        begin
          percDesconto := jvedt_percDesconto.Value;
          valorDesconto := qtde.Value * (jvedt_valorDesconto.Value * (-1));
          percAcrescimo := 0;
          valorAcrescimo := 0;
        end
        else
        begin
          percDesconto := 0;
          valorDesconto := 0;
          percAcrescimo := jvedt_percDesconto.Value;
          valorAcrescimo := qtde.Value *
            jvedt_valorDesconto.Value;
        end;
        totalBruto := precoTabela.Value * qtde.Value;
        totalLiquido := valorUnitario.Value * qtde.Value;
        dtretirada := fdmtb_ordemMaster.FieldByName
          ('dtretirada').Value;
        useralt := TGlobal.userId;
      End;
    IOrdemDetail.Build.Update;
    listaOrdemDetail.Clear;
    FreeAndNil(listaOrdemDetail);

    With fdmtb_ordemDetail Do
    begin
      Edit;

      FieldByName('idtbproduto').AsInteger := StrToInt(jvcedt_produto.Text);
      FieldByName('produto').AsString := jvstProduto.Caption;
      FieldByName('qtde').Value := jvsedt_qtde.Value;
      FieldByName('precoTabela').AsCurrency :=
        StrToCurr(SomenteNumero('.,', ledt_valorUnitario.Text)) / 100;
      FieldByName('valorUnitario').AsCurrency := jvedt_valorUnitario.Value;
      if descacre = 'desconto' then
      begin
        FieldByName('percDesconto').AsCurrency := jvedt_percDesconto.Value;
        FieldByName('valorDesconto').AsCurrency := FieldByName('qtde').Value *
          (jvedt_valorDesconto.Value * (-1));
        FieldByName('percAcrescimo').AsCurrency := 0;
        FieldByName('valorAcrescimo').AsCurrency := 0;
      end
      else
      begin
        FieldByName('percDesconto').AsCurrency := 0;
        FieldByName('valorDesconto').AsCurrency := 0;
        FieldByName('percAcrescimo').AsCurrency := jvedt_percDesconto.Value;
        FieldByName('valorAcrescimo').AsCurrency := FieldByName('qtde').Value *
          jvedt_valorDesconto.Value;
      end;
      FieldByName('totalBruto').AsCurrency := FieldByName('precoTabela')
        .AsCurrency * FieldByName('qtde').Value;
      FieldByName('totalLiquido').AsCurrency := FieldByName('valorUnitario')
        .AsCurrency * FieldByName('qtde').Value;
      FieldByName('dtretirada').AsDateTime := fdmtb_ordemMaster.FieldByName
        ('dtretirada').Value;
      FieldByName('userAlt').AsInteger := TGlobal.userId;

      Post;

      DisableControls;
      First;
      vQtde := 0;
      vTotal := 0;
      if not Eof then
        repeat
          vQtde := vQtde + FieldByName('qtde').Value;
          vTotal := vTotal + FieldByName('totalLiquido').Value;
          Next;
        until Eof;
      EnableControls;
    end;
    lblTotal.Caption := 'Qtde.: ' + CurrToStr(vQtde) + ' Total: ' +
      FormatFloat('###,###,##0.00', vTotal);
    SetStatus(acInserindo);
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'circleadd');
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.ListaOrdemPagtos(aOrdem: String);
begin
  Try
    var
    IOrdemPagto := TIOrdemPagto.New;
    IOrdemPagto.Manufacture.ViewOrdemPagto('a.idtbordens_cab = ' +
      QuotedStr(aOrdem), fdmtb_listaPagtos);
    jvdsPagto.DataSet := fdmtb_listaPagtos;
    vPagto := 0;
    if not fdmtb_ordemPagto.Eof then
      repeat
        vPagto := vPagto + fdmtb_ordemPagto.FieldByName('valor').AsCurrency;

        fdmtb_ordemPagto.Next;
      until fdmtb_ordemPagto.Eof;
    lblPagto.Caption := 'Total a Pagar: ' + FormatCurr('###,###,##0.00', vTotal)
      + ' | Recebido: ' + FormatCurr('###,###,##0.00', vPagto);
  except
    on e: exception do
      MsgErro(e.Message);
  End;
end;

procedure TfrmOrdens.InserirPagto;
begin
  With fdmtb_ordemPagto Do
    Begin
      Append;
      FieldByName('idtbordens_pagto').AsString := GuidCreate;
      FieldByName('idtbordens_cab').AsString :=
        fdmtb_ordemMaster.FieldByName('idtbordens_cab').AsString;
      FieldByName('idtbformas_pagto').Value := jvdbPagto.KeyValue;
      FieldByName('forma_pagto').AsString := jvdbPagto.Text;
      FieldByName('valor').AsCurrency := jvedt_valorPagto.Value;
      Post;

      vPagto := 0;
      DisableControls;
      First;
      if not Eof then
        repeat
          vPagto := vPagto + FieldByName('valor').AsCurrency;
          Next;
        until Eof;
      EnableControls;
    End;
  lblPagto.Caption := 'Total a Pagar: ' +
    FormatCurr('###,###,##0.00', vTotal)+' | Recebido: ' +
      FormatCurr('###,###,##0.00',vPagto);
end;

procedure TfrmOrdens.SwitchDescVenda(modo: String);
begin
  if inibeAcresc then
  begin
    MsgAviso('Opção acrescimo encontra-se bloqueda!');
    Exit;
  end;
  if modo = 'desconto' then
  begin
    descacre := 'acrescimo';
    ledt_percDesconto.EditLabel.Caption := '% Acrescimo';
    ledt_valorDesconto.EditLabel.Caption := 'R$ Acrescimo';
  end
  else
  begin
    descacre := 'desconto';
    ledt_percDesconto.EditLabel.Caption := '% Desconto';
    ledt_valorDesconto.EditLabel.Caption := 'R$ Desconto';
  end;
end;

procedure TfrmOrdens.SwitchVenda(aOrdemItem: String);
var
  listaProdutos: TObjectList<TProduto>;
begin
  var
  IProduto := TIProduto.New;
  try
    With fdmtb_ordemDetail Do
      Begin
        IProduto.Build.ListAll('idtbproduto = ' +
          FieldByName('idtbproduto').AsString, listaProdutos);
        Edit;
        if FieldByName('venda').AsString <> 'S' then
          begin
            FieldByName('venda').AsString := 'S';
            FieldByName('precoTabela').Value :=
              (listaProdutos.Items[0] as TProduto).vlrvenda;
            FieldByName('valorUnitario').Value :=
              (listaProdutos.Items[0] as TProduto).vlrvenda;
            itensAlugados := itensAlugados - 1;
          end
        else
          begin
            FieldByName('venda').AsString := '';
            FieldByName('precoTabela').Value :=
              (listaProdutos.Items[0] as TProduto).vlraluguel;
            FieldByName('valorUnitario').Value :=
              (listaProdutos.Items[0] as TProduto).vlraluguel;
            itensAlugados := itensAlugados + 1;
          end;

        if descacre = 'desconto' then
          FieldByName('valorUnitario').Value := FieldByName('precoTabela').Value -
            (FieldByName('valorDesconto').Value * (-1))
        else
          FieldByName('valorUnitario').Value := FieldByName('precoTabela').Value +
            FieldByName('valorAcrescimo').Value;

        FieldByName('totalBruto').Value := FieldByName('qtde').Value *
          FieldByName('precoTabela').Value;
        FieldByName('totalLiquido').Value := FieldByName('qtde').Value *
          FieldByName('valorUnitario').Value;

        Post;
      End;
    listaProdutos.Clear;
    FreeAndNil(listaProdutos);
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.ExcluiPagto(aIdFormaPagto: String);
begin
  {---  Testar a atualização da tabela "tbordens_pagto" através da modificação
        feita no objeto "ordemPagto" no "ordemCab" no momento da
        atualização e depois de testado remover esse comentário ---}

//  var
//  IOrdemPagto := TIOrdemPagto.New;
//  IOrdemPagto
//    .idtbordem_pagto(aIdFormaPagto)
//      .Build
//        .Delete;
  fdmtb_ordemPagto.Delete;
  vPagto := 0;
  With fdmtb_ordemPagto Do
    Begin
      DisableControls;
      if not Eof then
        repeat
          vPagto := vPagto + FieldByName('valor').AsCurrency;
          Next;
        until Eof;
      EnableControls;
    End;
  lblPagto.Caption := 'Total a Pagar: ' +
    FormatCurr('###,###,##0.00', vTotal)+' | Recebido: ' +
     FormatCurr('###,###,##0.00',vPagto);
end;

procedure TfrmOrdens.fdmtb_ordemDetailAfterOpen(DataSet: TDataSet);
begin
  TNumericField(fdmtb_ordemDetail.FieldByName('precoTabela'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('precoTabela'))
    .Alignment := taRightJustify;
  TNumericField(fdmtb_ordemDetail.FieldByName('totalBruto'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('totalBruto'))
    .Alignment := taRightJustify;
  TNumericField(fdmtb_ordemDetail.FieldByName('valorDesconto'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('valorDesconto'))
    .Alignment := taRightJustify;
  TNumericField(fdmtb_ordemDetail.FieldByName('valorAcrescimo'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('valorAcrescimo'))
    .Alignment := taRightJustify;
  TNumericField(fdmtb_ordemDetail.FieldByName('valorUnitario'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('valorUnitario'))
    .Alignment := taRightJustify;
  TNumericField(fdmtb_ordemDetail.FieldByName('totalLiquido'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemDetail.FieldByName('totalLiquido'))
    .Alignment := taRightJustify;
end;

procedure TfrmOrdens.fdmtb_ordemPagtoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(fdmtb_ordemPagto.FieldByName('valor'))
    .DisplayFormat := '###,##0.00';
  TNumericField(fdmtb_ordemPagto.FieldByName('valor'))
    .Alignment := taRightJustify;
end;

procedure TfrmOrdens.FinalizaOrdem(aOrdemCab: String);
begin
  try
    var
    IOrdemMaster := TIOrdemMaster.New;
    if (FSituacao = ftComecando) then
      begin

        {--- Pegando o id do funcionario uma vez que o número mostrado em tela
             na verdade é referente ao campo código que se altera sempre que
             um funcionário é demitido ---}
        var
        IFuncionario := TIFuncionario.New;
        var
        listaFuncionarios: TObjectList<TFuncionario>;
        IFuncionario.Build.ListAll('codigo = ' + jvcedt_atendente.Text,
          listaFuncionarios,'');

        fdmtb_ordemMaster.Edit;
        fdmtb_ordemMaster.FieldByName('idtbcliente').AsInteger :=
          StrToInt(jvcedt_cliente.Text);
        fdmtb_ordemMaster.FieldByName('idfuncionario').AsInteger :=
          (listaFuncionarios.Items[0] as TFuncionario).idtbfuncionario;

        fdmtb_ordemMaster.FieldByName('dtretirada').AsDateTime :=
          jvdt_dtretirada.Date;
        fdmtb_ordemMaster.FieldByName('dtdevolucao').AsDateTime :=
          jvdt_dtdevolucao.Date;

        if jvdt_dtretirada.Date = Date then
          fdmtb_ordemMaster.FieldByName('retirada').AsString := 'S'
        else if (jvdt_dtretirada.Date <> Date) and (ordemRetirada = true) then
          fdmtb_ordemMaster.FieldByName('retirada').AsString := 'S'
        else
          fdmtb_ordemMaster.FieldByName('retirada').AsString := 'N';

        if itensAlugados = 0 then
          fdmtb_ordemMaster.FieldByName('estado').AsString := 'F'
        else
          fdmtb_ordemMaster.FieldByName('estado').AsString := 'A';

        fdmtb_ordemMaster.Post;

        listaFuncionarios.Clear;
        FreeAndNil(listaFuncionarios);

        With fdmtb_ordemMaster Do
          Begin
            IOrdemMaster
                .idtbordens_cab(FieldByName('idtbordens_cab').AsString)
                .idtbempresa(FieldByName('idtbempresa').AsInteger)
                .idfuncionario(FieldByName('idfuncionario').AsInteger)
                .idtbcliente(FieldByName('idtbcliente').AsInteger)
                .controle(FieldByName('controle').AsInteger)
                .dtdocumento(FieldByName('dtdocumento').AsDateTime)
                .dtretirada(FieldByName('dtretirada').AsDateTime)
                .dtdevolucao(FieldByName('dtdevolucao').AsDateTime)
                .observacao(FieldByName('observacao').AsString)
                .estado(FieldByName('estado').AsString)
                .retirada(FieldByName('retirada').AsString)
                .usercad(TGlobal.userId)
                .useralt(TGlobal.userId)
                .ordemItem(fdmtb_ordemDetail)
                .ordemPagto(fdmtb_ordemPagto)
              .Build
            .Insert;
          End;
      end
    else
      begin
        var
        listaOrdensMaster: TObjectList<TOrdemMaster>;

        var objOrdemMaster := IOrdemMaster.Build.ListByGuid('idtbordens_cab',
          fdmtb_ordemMaster.FieldByName('idtbordens_cab').AsString,
            listaOrdensMaster).This;
        IOrdemMaster.Build.Modify(objOrdemMaster);
        With objOrdemMaster Do
          begin
            dtretirada := jvdt_dtretirada.Date;
            dtdevolucao := jvdt_dtdevolucao.Date;
            observacao := mem_obs.Text;
            useralt := TGlobal.userId;

{$REGION 'Manipulando Itens da lista'}
            fdmtb_ordemDetail.DisableControls;
            fdmtb_ordemDetail.First;
            if ordemItem.Count <> fdmtb_ordemDetail.RecordCount then
              begin
                ordemItem.Clear;

                if not fdmtb_ordemDetail.Eof then
                  repeat
                    ordemItem.Add(TOrdemDetail.Create);
                    With ordemItem.Last Do
                      begin
                        idtbordens_itens := GuidCreate;
                        idtbordens_cab := fdmtb_ordemMaster
                          .FieldByName('idtbordens_cab').AsString;
                        idtbproduto := fdmtb_ordemDetail
                          .FieldByName('idtbproduto').AsInteger;
                        item := fdmtb_ordemDetail
                          .FieldByName('item').AsInteger;
                        qtde := fdmtb_ordemDetail
                          .FieldByName('qtde').AsInteger;
                        precoTabela := fdmtb_ordemDetail
                          .FieldByName('precoTabela').AsCurrency;
                        valorUnitario := fdmtb_ordemDetail
                          .FieldByName('valorUnitario').AsCurrency;
                        percDesconto := fdmtb_ordemDetail
                          .FieldByName('percDesconto').AsCurrency;
                        valorDesconto := fdmtb_ordemDetail
                          .FieldByName('valorDesconto').AsCurrency;
                        percAcrescimo := fdmtb_ordemDetail
                          .FieldByName('percAcrescimo').AsCurrency;
                        valorAcrescimo := fdmtb_ordemDetail
                          .FieldByName('valorAcrescimo').AsCurrency;
                        totalBruto := fdmtb_ordemDetail
                          .FieldByName('totalBruto').AsCurrency;
                        totalLiquido := fdmtb_ordemDetail
                          .FieldByName('totalLiquido').AsCurrency;
                        venda := fdmtb_ordemDetail
                          .FieldByName('venda').AsString;
                        dtretirada := jvdt_dtretirada.Date;
                        retirado := fdmtb_ordemDetail
                          .FieldByName('retirado').AsString;
                        devolvido := fdmtb_ordemDetail
                          .FieldByName('retirado').AsString;
                        cancelado := fdmtb_ordemDetail
                          .FieldByName('cancelado').AsString;
                        useralt := TGlobal.userId;
                      end;

                    fdmtb_ordemDetail.Next;
                  until fdmtb_ordemDetail.Eof;

              end
            else
              begin
                fdmtb_ordemDetail.IndexFieldNames := 'item;idtbproduto;';
               for var objItem in ordemItem do
                  begin
                    fdmtb_ordemDetail.FindKey([
                      objItem.item.ToString,
                      objItem.idtbproduto
                    ]);

                    objItem.qtde := fdmtb_ordemDetail
                      .FieldByName('qtde').AsInteger;
                    objItem.precoTabela := fdmtb_ordemDetail
                      .FieldByName('precoTabela').AsCurrency;
                    objItem.valorUnitario := fdmtb_ordemDetail
                      .FieldByName('valorUnitario').AsCurrency;
                    objItem.percDesconto := fdmtb_ordemDetail
                      .FieldByName('percDesconto').AsCurrency;
                    objItem.valorDesconto := fdmtb_ordemDetail
                      .FieldByName('valorDesconto').AsCurrency;
                    objItem.percAcrescimo := fdmtb_ordemDetail
                      .FieldByName('percAcrescimo').AsCurrency;
                    objItem.valorAcrescimo := fdmtb_ordemDetail
                      .FieldByName('valorAcrescimo').AsCurrency;
                    objItem.totalBruto := fdmtb_ordemDetail
                      .FieldByName('totalBruto').AsCurrency;
                    objItem.totalLiquido := fdmtb_ordemDetail
                      .FieldByName('totalLiquido').AsCurrency;
                    objItem.venda := fdmtb_ordemDetail
                      .FieldByName('venda').AsCurrency;
                    objItem.dtretirada := jvdt_dtretirada.Date;
                    objItem.retirado := fdmtb_ordemDetail
                      .FieldByName('retirado').AsString;
                    objItem.devolvido := fdmtb_ordemDetail
                      .FieldByName('devolvido').AsString;
                    objItem.cancelado := fdmtb_ordemDetail
                      .FieldByName('cancelado').AsString;
                    objItem.useralt := TGlobal.userId;
                  end;
              end;
            fdmtb_ordemDetail.EnableControls;
{$ENDREGION}

{$REGION 'Manipulando formas de pagamento'}
            ordemPagto.Clear;
            fdmtb_ordemPagto.First;
            if not fdmtb_ordemPagto.Eof then
              repeat
                ordemPagto.Add(TOrdemPayment.Create);
                  With ordemPagto.Last Do
                    begin
                      idtbordens_pagto := fdmtb_ordemPagto
                        .FieldByName('idtbordens_pagto').AsString;
                      idtbordens_cab := fdmtb_ordemPagto
                        .FieldByName('idtbordens_cab').AsString;
                      idtbformas_pagto := fdmtb_ordemPagto
                        .FieldByName('idtbformas_pagto').AsString;
                      valor := fdmtb_ordemPagto
                        .FieldByName('valor').AsCurrency;
                    end;
                fdmtb_ordemPagto.Next;
              until fdmtb_ordemPagto.Eof;
{$ENDREGION}
          end;
        IOrdemMaster.Build.Update;
        listaOrdensMaster.Clear;
        FreeAndNil(listaOrdensMaster);
      end;
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.MovEstoqueKardex(nIdProduto, nQtd, nTipo: Integer;
  nDocumento: String);
begin
  // nTipo -> 0-Inclusão, 1-Ajuste (+), 2-Ajuste (-), 3-Saida,
  //          4-Anulação Saída, 5-Reserva, 6-Anulação Reserva,
  //          7-Devolução, 8-Anulação Devolução

  case nTipo of
    2, 3, 5, 8:
      nQtd := nQtd * -1;
  end;

  var filtro := 'idtbproduto = ' + nIdProduto.ToString + ' AND idtbempresa = ' +
    TGlobal.empresa.ToString;

  var
  listaEstoque: TObjectList<TEstoque>;
  var
  IKardex := TIKardex.New;
  var
  IEstoque := TIEstoque.New;
  IEstoque.Build.ListAll(filtro, listaEstoque, '');

  try
    if listaEstoque.Count = 0 then
      begin
        IEstoque
            .idtbempresa(TGlobal.empresa)
            .idtbproduto(nIdProduto)
            .qtde(nQtd)
          .Build
        .Insert;

        IKardex
            .idtbempresa(TGlobal.empresa)
            .documento(nDocumento)
            .idtbproduto(nIdProduto)
            .tipo(nTipo)
            .qtde(nQtd)
            .usercad(TGlobal.userId)
          .Build
        .Insert;
      end
    else
      begin
        listaEstoque.Clear;
        FreeAndNil(listaEstoque);

        var
          objEstoque := IEstoque.Build.ListById('idtbproduto', nIdProduto,
            listaEstoque).This;
          IEstoque.Build.Modify(objEstoque);
          With objEstoque Do
            Begin
              idtbempresa := idtbempresa;
              idtbproduto := idtbproduto;
              qtde := qtde + nQtd;
            End;
          IEstoque.Build.Update;

        {--- Se qtde negativa fazendo calculo para positivar ---}
        if nQtd < 0 then
          nQtd := nQtd * -1;

        IKardex
            .idtbempresa(TGlobal.empresa)
            .documento(nDocumento)
            .idtbproduto(nIdProduto)
            .tipo(nTipo)
            .qtde(nQtd)
            .usercad(TGlobal.userId)
          .Build
        .Insert;
      end;
    listaEstoque.Clear;
    FreeAndNil(listaEstoque);
  except
    on e: exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.ManutencaoOrdem(aOrdem: String);
begin

  CriarFieldsTables;

  var
  IOrdemMaster := TIOrdemMaster.New;
  var
  listaOrdemMaster: TObjectList<TOrdemMaster>;

  IOrdemMaster.Build.ListAll('idtbordens_cab = ' + QuotedStr(aOrdem),
      listaOrdemMaster, '');
  TDataSetHelper.PreencheDataSet<TOrdemMaster>(listaOrdemMaster,
    fdmtb_ordemMaster);
  listaOrdemMaster.Clear;
  FreeAndNil(listaOrdemMaster);

  vQtde := fdmtb_ordemMaster.FieldByName('qtdeTotal').AsCurrency;
  vTotal := fdmtb_ordemMaster.FieldByName('valorTotal').AsCurrency;

  var
  IOrdemDetail := TIOrdemDetail.New;
  var
  listaOrdemDetails: TObjectList<TOrdemDetail>;

  IOrdemDetail.Build.ListAll('idtbordens_cab = ' + QuotedStr(aOrdem),
    listaOrdemDetails, '');
  TDataSetHelper.PreencheDataSet<TOrdemDetail>(listaOrdemDetails,
    fdmtb_ordemDetail);
  listaOrdemDetails.Clear;
  FreeAndNil(listaOrdemDetails);

  var
  IOrdemPagto := TIOrdemPagto.New;
  var
  listaOrdemPagtos: TObjectList<TOrdemPayment>;

  IOrdemPagto.Build.ListAll('idtbordens_cab = ' + QuotedStr(aOrdem),
      listaOrdemPagtos, '');
  TDataSetHelper.PreencheDataSet<TOrdemPayment>(listaOrdemPagtos,
    fdmtb_ordemPagto);
  listaOrdemPagtos.Clear;
  FreeAndNil(listaOrdemPagtos);

  dtEmissao := fdmtb_ordemMaster.FieldByName('dtdocumento').Value;
  jvcedt_atendente.Text := fdmtb_ordemMaster.FieldByName
    ('idfuncionario').AsString;
  jvcedt_atendente.Enabled := false;
  jvcedt_cliente.Text := fdmtb_ordemMaster.FieldByName('idtbcliente').AsString;
  nroOrdem := aOrdem;
  jvdt_dtretirada.Date := fdmtb_ordemMaster.FieldByName('dtretirada').Value;
  jvdt_dtdevolucao.Date := fdmtb_ordemMaster.FieldByName('dtdevolucao').Value;
  mem_obs.Text := fdmtb_ordemMaster.FieldByName('observacao').AsString;

  jvdsCab.DataSet := fdmtb_ordemMaster;
  jvdsItens.DataSet := fdmtb_ordemDetail;
  jvdsPagto.DataSet := fdmtb_ordemPagto;
  if (fdmtb_ordemMaster.FieldByName('retirada').AsString = 'S') then
  begin
    ordemRetirada := true;
    jvdt_dtretirada.Enabled := false;
    jvcedt_cliente.Enabled := false;
    PageControl1.ActivePageIndex := 1;
    SetSituacao(ftDevolver);
  end
  else
  begin
    SetStatus(acInserindo);
    SetSituacao(ftRetirar);
    ordemRetirada := false;
    PageControl1.ActivePageIndex := 0;
  end;

end;

procedure TfrmOrdens.RetirarOrdem(aOrdemCab: String);
begin
  var
  IOrdemMaster := TIOrdemMaster.New;
  var
  listaOrdemMaster: TObjectList<TOrdemMaster>;

  try
    var objOrdemMaster := IOrdemMaster.Build.ListByGuid('idtbordens_cab',
    aOrdemCab, listaOrdemMaster).This;
    IOrdemMaster.Build.Modify(objOrdemMaster);
    With objOrdemMaster Do
      begin
        retirada := 'S';
        observacao := mem_obs.Text;
        case AnsiIndexStr(jvdsCab.DataSet.FieldByName('estado').AsString,
          ['Aberta', 'Fechada', 'Cancelada', 'Pendente', 'Devolvida']) of
          0:
            estado := 'A';
          1:
            estado := 'F';
          2:
            estado := 'C';
          3:
            estado := 'P';
          4:
            estado := 'D'
          else
            estado := estado;
        end;
        useralt := TGlobal.userId;

        {--- Setando como retirado "S" os itens da ordem ---}
        for var objItem in ordemItem do
          begin
            objItem.retirado := 'S';
            objItem.useralt := TGlobal.userId;
          end;
      end;
    IOrdemMaster.Build.Update;
    listaOrdemMaster.Clear;
    FreeAndNil(listaOrdemMaster);
  except
    on e: Exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.DevolverOrdem(aOrdemCab: String);
begin
  var
  IOrdemMaster := TIOrdemMaster.New;
  var
  listaOrdemMaster: TObjectList<TOrdemMaster>;

  try
    var objOrdemMaster := IOrdemMaster.Build.ListByGuid('idtbordens_cab',
      aOrdemCab, listaOrdemMaster).This;
    IOrdemMaster.Build.Modify(objOrdemMaster);
    With objOrdemMaster Do
      begin
        retirada := 'S';
        estado := 'D';
        useralt := TGlobal.userId;

        {--- Setando como devolvido "S" os itens da ordem ---}
        for var objItem in ordemItem do
          begin
            objItem.devolvido := 'S';
            objItem.retirado := 'S';
            objItem.useralt := TGlobal.userId;
          end;
      end;
    IOrdemMaster.Build.Update;
    listaOrdemMaster.Clear;
    FreeAndNil(listaOrdemMaster);
  except
    on e: Exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmOrdens.ImprimirComprovante(aOrdemCab: String);
var
  condpagto, imp_bobina: String;
  mMemo: TMemo;
  comp_bobina: Boolean;
  fdmtb_compCab,
  fdmtb_compItem,
  fdmtb_compPagto : TFDMemTable;
begin

  fdmtb_compCab := TFDMemTable.Create(nil);
  fdmtb_compItem := TFDMemTable.Create(nil);
  fdmtb_compPagto := TFDMemTable.Create(nil);
  mMemo := TMemo.Create(self);
  mMemo.Parent := Self;
  mMemo.Visible := False;

  try
    var
    IOrdemMaster := TIOrdemMaster.New;
    IOrdemMaster.Manufacture.ViewCompCab('a.idtbordens_cab = ' +
      QuotedStr(aOrdemCab), fdmtb_compCab);

    var
    IOrdemDetail := TIOrdemDetail.New;
    IOrdemDetail.Manufacture.ViewCompItem('a.idtbordens_cab = ' +
      QuotedStr(aOrdemCab), fdmtb_compItem);

    var
    IOrdemPagto := TIOrdemPagto.New;
    IOrdemPagto.Manufacture.ViewCompPagto('a.idtbordens_cab = ' +
      QuotedStr(aOrdemCab), fdmtb_compPagto);

    frxReport.ReportOptions.CreateDate := Date();
    frxReport.ReportOptions.LastChange := Date();
    frxReport.ReportOptions.Author := NameUser;

    var
      listaParametro: TObjectList<TParametro>;
    var
      IParametro := TIParametro.New;
    IParametro.Build.ListAll('', listaParametro,'');
    imp_bobina := (listaParametro.Items[0] as TParametro).imp_bobina;
    comp_bobina := (listaParametro.Items[0] as TParametro).comp_bobina;

    {--- liberando TObjectList<TParametro> da memória ---}
    listaParametro.Clear;
    FreeAndNil(listaParametro);

    if comp_bobina then
      frxReport.LoadFromFile(LoadReportStream('rptordemAluguel',
        'rptCompAluguel.fr3'))
    else
      frxReport.LoadFromFile(LoadReportStream('rptcompaluguel_a4',
        'rptCompAluguelA4.fr3'));

    frxReport.PrintOptions.ShowDialog := false;
    frxReport.PrintOptions.Printer := imp_bobina;
    frxReport.PrintOptions.Copies := 2;

    With fdmtb_compItem Do
      begin
        DisableControls;
        First;
        itensAlugados := 0;
        if not Eof then
          repeat
            if (FieldByName('venda').AsString = 'N') Or
              (FieldByName('venda').AsString.Trim.IsEmpty) then
                itensAlugados := itensAlugados + 1;

            Next;
          until Eof;
        EnableControls;
      end;

      if itensAlugados > 0 then
      begin
        if comp_bobina then
          frxReport.LoadFromFile(LoadReportStream('rptordemAluguel',
            'rptCompAluguel.fr3'))
        else
          frxReport.LoadFromFile(LoadReportStream('rptcompaluguel_a4',
            'rptCompAluguelA4.fr3'));
      end
      else
      begin
        if comp_bobina then
          frxReport.LoadFromFile(LoadReportStream('rptcompordemvenda',
            'rptCompVenda.fr3'))
        else
          frxReport.LoadFromFile(LoadReportStream('rptcompvenda_a4',
            'rptCompVendaA4.fr3'));
      end;

    frxReport.PrintOptions.ShowDialog := false;
    frxReport.PrintOptions.Printer := imp_bobina;
    frxReport.PrintOptions.Copies :=
      StrToInt(IfThen(itensAlugados > 0, '2', '1'));

    var
      listaEmpresa: TObjectList<TEmpresa>;
    var
      IEmpresa := TIEmpresa.New;
    IEmpresa.Build.ListAll('idtbempresa = ' + TGlobal.empresa.ToString,
      listaEmpresa, '');

    frxReport.Variables['empFantasia'] :=
      QuotedStr((listaEmpresa.Items[0] as TEmpresa).fantasia);
    frxReport.Variables['empEndLine1'] :=
      QuotedStr((listaEmpresa.Items[0] as TEmpresa).endereco.ToString + ',' +
      (listaEmpresa.Items[0] as TEmpresa).nro.ToString);
    frxReport.Variables['empEndLine2'] :=
      QuotedStr((listaEmpresa.Items[0] as TEmpresa).bairro.ToString  + ' - ' +
      (listaEmpresa.Items[0] as TEmpresa).cidade.ToString + '/' +
      (listaEmpresa.Items[0] as TEmpresa).uf.ToString);
    frxReport.Variables['empFone1'] :=
      QuotedStr((listaEmpresa.Items[0] as TEmpresa).fone1);
    frxReport.Variables['empFone2'] :=
      QuotedStr((listaEmpresa.Items[0] as TEmpresa).fone2);

    if itensAlugados > 0 then
    begin
      if comp_bobina then
        frxReport.Variables['regras'] :=
          QuotedStr((listaEmpresa.Items[0] as TEmpresa).obsaluguel)
      else
        frxReport.Variables['regras'] :=
          StringReplace
          (StringReplace(QuotedStr(QuotedStr(
            (listaEmpresa.Items[0] as TEmpresa).obsaluguel)),
              #$D#$A, ' ', [rfReplaceAll]), #13#10, ' ',[rfReplaceAll])
    end
    else
      frxReport.Variables['regras'] := QuotedStr('');

    {--- liberando TObjectList<TEmpresa> da memória ---}
    listaEmpresa.Clear;
    FreeAndNil(listaEmpresa);

    With fdmtb_compPagto Do
      begin
        if RecordCount > 1 then
        begin
          condpagto := ';' + FieldByName('forma_pagto').AsString;
          mMemo.Lines.Add(FieldByName('forma_pagto').AsString);
          Next;
          if not Eof then
            repeat
              condpagto := condpagto + ', ' + ';' +
                FieldByName('forma_pagto').AsString;
              mMemo.Lines.Add(FieldByName('forma_pagto').AsString);
              Next;
            until Eof;
        end
        else
        begin
          condpagto := FieldByName('forma_pagto').AsString;
          mMemo.Lines.Add(FieldByName('forma_pagto').AsString);
        end;
      end;

    if comp_bobina then
      frxReport.Variables['condPagto'] := QuotedStr(mMemo.Text)
    else
      frxReport.Variables['condPagto'] :=
        StringReplace(StringReplace(QuotedStr(mMemo.Text), #$D#$A, '|',
        [rfReplaceAll]), #13#10, '|', [rfReplaceAll]);

    frxDBCab.DataSet := fdmtb_compCab;
    frxDBItem.DataSet := fdmtb_compItem;
    frxReport.PrepareReport;
    frxReport.ShowReport;
  Finally
    FreeAndNil(mMemo);
    FreeAndNil(fdmtb_compPagto);
    FreeAndNil(fdmtb_compItem);
    FreeAndNil(fdmtb_compCab);
  End;
end;

procedure TfrmOrdens.ImprimirOrdens(dtEmissaoIni, dtEmissaoFim: TDate);
var
  fdmtb_tmp: TFDMemTable;
begin
  fdmtb_tmp := TFDMemTable.Create(nil);
  frxDBCab.DataSet := fdmtb_tmp;
  frxReport.ReportOptions.CreateDate := Date();
  frxReport.ReportOptions.LastChange := Date();
  frxReport.ReportOptions.Author := TGlobal.userName;
  frxReport.LoadFromFile(LoadReportStream('rptdataOrdens',
    'rptDataAlugueis.fr3'));

  Try
    try
      {--- Declarando variáveis de somatória ---}
      var fundo: Currency := 0;
      var suprimento: Currency := 0;
      var sangria: Currency := 0;
      var sobra: Currency := 0;
      var totalDinheiro: Currency := 0;
      var totalCartaoDeb: Currency := 0;
      var totalCartaoCred: Currency := 0;
      var totalChqAvista: Currency := 0;
      var totalChqAprazo: Currency := 0;
      var totalPicPay: Currency := 0;
      var totalPix: Currency := 0;
      var totalDeposito: Currency := 0;
      var totalTransf: Currency := 0;

      frxReport.Variables['itens_alugados'] := 0;
      frxReport.Variables['itens_vendidos'] := 0;

      var
      listaCaixa: TObjectList<TCaixa>;
      var
      ICaixa := TICaixa.New;
      ICaixa.Build.ListAll('date(dtemissao) BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)), listaCaixa, '');

      if listaCaixa.Count > 0 then
        for var iFor in listaCaixa do
            begin
              case iFor.tpmov of
                tpmFundo:
                  if iFor.cancelado = false then
                    fundo := fundo + iFor.valor;
                tpmSangria:
                  if iFor.cancelado = false then
                    sangria := sangria + iFor.valor;
                tpmSuprimento:
                  if (iFor.origem = 'D') And (iFor.cancelado = false) then
                    suprimento := suprimento + iFor.valor;
                tpmSobra:
                  if iFor.cancelado = false then
                    sobra := sobra + iFor.valor;
              end;
            end;

      {--- Liberando TObjectList<TCaixa> da memória ---}
      listaCaixa.Clear;
      FreeAndNil(listaCaixa);

      {--- Passando resultados para variáveis do relatório ---}
      frxReport.Variables['fundoscx'] := fundo;
      frxReport.Variables['suprimentos'] := suprimento;
      frxReport.Variables['sangrias'] := sangria;

      var
      strSQL: String;

      strSQL := 'date(dtdocumento) BETWEEN ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)) + ' AND ' +
        'estado IN ("A","F")';

      var
      listaOrdemPagtos: TObjectList<TOrdemPayment>;
      var
      IOrdemPagto := TIOrdemPagto.New;
      IOrdemPagto.Build.ListAll(strSQL, listaOrdemPagtos, '');

      for var iFor in listaOrdemPagtos do
        case AnsiIndexStr(UpperCase(iFor.forma_pagto),['DINHEIRO',
        'CARTÃO DÉBITO','CARTÃO CRÉDITO','CHEQUE À VISTA','CHEQUE Á PRAZO',
        'PIX','PIC-PAY','CARTEIRA DIGITAL','DEPÓSITO BANCÁRIO',
        'TRANSF. BANCÁRIA']) of
          0: totalDinheiro := totalDinheiro + iFor.valor;
          1: totalCartaoDeb := totalCartaoDeb + iFor.valor;
          2: totalCartaoCred := totalCartaoCred + iFor.valor;
          3: totalChqAvista := totalChqAvista + iFor.valor;
          4: totalChqAprazo := totalChqAprazo + iFor.valor;
          5: totalPix := totalPix + iFor.valor;
          6: totalPicPay := totalPicPay + iFor.valor;
          7: totalPicPay := totalPicpay + iFor.valor;
          8: totalDeposito := totalDeposito + iFor.valor;
          9: totalTransf := totalTransf + iFor.valor;
        end;

      {--- Liberando TObjectList<TOrdemPayment> da memória ---}
      listaOrdemPagtos.Clear;
      FreeAndNil(listaOrdemPagtos);

      {--- Setando resultados nas variáveis ---}
      frxReport.Variables['totalDinheiro'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalDinheiro));
      frxReport.Variables['totalCartaoDeb'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalCartaoDeb));
      frxReport.Variables['totalCartaoCred'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalCartaoCred));
      frxReport.Variables['totalChqAvista'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalChqAvista));
      frxReport.Variables['totalChqAprazo'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalChqAprazo));
      frxReport.Variables['totalPix'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalPix));
      frxReport.Variables['totalPicPay'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalPicPay));
      frxReport.Variables['totalDeposito'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalDeposito));
      frxReport.Variables['totalTransf'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalTransf));
      frxReport.Variables['totalGeral'] :=
        QuotedStr(FormatFloat('###,###,##0.00', totalDinheiro + totalCartaoDeb
        + totalCartaoCred + totalChqAvista + totalChqAprazo + totalPix +
        totalPicPay + totalDeposito + totalTransf + totalTransf));

      strSQL := 'idtbordens_cab IN (SELECT a.idtbordens_cab FROM tbordens_cab a ' +
      'WHERE date(a.dtdocumento) BETWEEN date(' + QuotedStr(
        FormatDateTime('YYYY-mm-dd', dtEmissaoIni)) + ') AND date(' +
         QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)) +
          ') AND estado IN ("A","F")) AND cancelado IS NULL ';

      var
      listaOrdemDetail: TObjectList<TOrdemDetail>;
      var
      IOrdemDetail := TIOrdemDetail.New;
      IOrdemDetail.Build.ListAll(strSQL, listaOrdemDetail, '');

      var itensAlugados: Currency := 0;
      var itensVendidos: Currency := 0;

      for var iFor in listaOrdemDetail do
        if iFor.venda.Value = 'S' then
          itensVendidos := itensVendidos + iFor.qtde.Value
        else
          itensAlugados := itensAlugados + iFor.qtde.Value;

      {--- Liberando TObjectList<TOrdemDetail> da memória ---}
      listaOrdemDetail.Clear;
      FreeAndNil(listaOrdemDetail);

      frxReport.Variables['itens_alugados'] := itensAlugados;
      frxReport.Variables['itens_vendidos'] := itensVendidos;

      strSQL := 'date(tboc.dtdocumento) BETWEEN date(' +
      QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni)) + ') AND date(' +
      QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)) + ')';

      var
      IOrdemMaster := TIOrdemMaster.New;
      IOrdemMaster.Manufacture.ViewOrdemWithDetail(strSQL, fdmtb_tmp);

      frxReport.PrepareReport;
      frxReport.ShowReport;
    except
      on e: Exception do
        MsgErro(e.Message);
    end;
  Finally
    FreeAndNil(fdmtb_tmp);
  End;
end;

procedure TfrmOrdens.ImprimirFantasias(produto, OrderBy, Direcao: String);
var
  vQry: TFDQuery;
  strSQL: String;
  fdmtb_tmp : TFDMemTable;
begin
//  vQry := TFDQuery.Create(nil);
//  vQry.Connection := Controle.Conexao.GetConexao;
  fdmtb_tmp := TFDMemTable.Create(nil);
  var
  listaParametros: TObjectList<TParametro>;
  var
  IParametro := TIParametro.New;
  IParametro.Build.ListAll('', listaParametros, '');

  frxReport.LoadFromFile(LoadReportStream('rptOrdensPorFantasias',
    'rptFantasiasReservadas.fr3'));
  frxReport.PrintOptions.ShowDialog := true;
  frxDBItem.DataSet := fdmtb_tmp;
//  vQry.Open('select imp_relatorio from tbparametros');
//  frxReport.PrintOptions.Printer := vQry.FieldByName('imp_relatorio').AsString;
  frxReport.PrintOptions.Printer := (listaParametros.Items[0] as TParametro).imp_relatorio;

  {--- Liberando TObjectList<TParametro> da memória ---}
  listaParametros.Clear;
  FreeAndNil(listaParametros);
  Try
    Try
      strSQL := 'c.estado = "A" AND a.venda = "N"';
      case FSituacao of
        ftRetirar:
          begin
            strSQL := strSQL + ' AND a.retirado="N" AND a.devolvido="N"';
            if chbFiltraData.Checked then
              strSQL := strSQL + ' AND date(c.dtretirada) between ' +
                QuotedStr(FormatDateTime('YYYY-mm-dd', jvdtpDataFiltro1.Date)) +
                ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
                jvdtpDataFiltro2.Date));
          end;
        ftDevolver:
          begin
            strSQL := strSQL + ' AND tbordens_itens.retirado="S" AND '+
              'tbordens_itens.devolvido="N"';
            if chbFiltraData.Checked then
              strSQL := strSQL + ' AND a.retirado="S" AND a.devolvido="N"'
                + ' AND a.idtbordens_cab IN (SELECT tboc.idtbordens_cab'
                + ' FROM tbordens_cab tboc WHERE tboc.estado IN ("F","A","D"))';
          end;
        ftDevolvida:
          begin
            strSQL := strSQL + ' AND a.retirado="S" AND a.devolvido="S"'
              + ' AND a.idtbordens_cab IN (SELECT tboc.idtbordens_cab'
              + ' FROM tbordens_cab tboc WHERE tboc.estado IN ("D"))';
          end;
      end;
      strSQL := strSQL + ' AND b.nome Like ' + QuotedStr(produto + '%');

      var
      IOrdemDetail := TIOrdemDetail.New;
      IOrdemDetail.Manufacture.ViewDetailByOrdem('', fdmtb_tmp);
      if fdmtb_tmp.RecordCount = 0 then
        begin
          MsgAviso('Não existem fantasias exibidas para as datas de ' +
            '"Retirada" e "Devolução" selecionadas');
          Exit;
        end;
      frxReport.PrepareReport(true);
      frxReport.ShowReport;
    Except
      On E: Exception Do
        MsgErro(E.Message);
    End;
  Finally
    FreeAndNil(fdmtb_tmp);
  End;

//  Try
//    With vQry Do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('SELECT ');
//      SQL.Add('CONVERT(tbordens_itens.idtbordens_cab USING utf8mb3) idtbordens_cab');
//      SQL.Add(',tbprodutos.idtbproduto');
//      SQL.Add(',tbprodutos.nome produto');
//      SQL.Add(',(CASE tbprodutos.tipo');
//      SQL.Add('      WHEN 0 THEN "Fantasia Masculina" ');
//      SQL.Add('      WHEN 1 THEN "Fantasia Feminina" ');
//      SQL.Add('      WHEN 2 THEN "Fantasia Infantil" ');
//      SQL.Add('      WHEN 3 THEN "Mascaras" ');
//      SQL.Add('      WHEN 4 THEN "Perucas" ');
//      SQL.Add('      WHEN 5 THEN "Acessórios" ');
//      SQL.Add('      ELSE "Mágica e Outros" END) AS tipo');
//      SQL.Add(',DATE_FORMAT(tbordens_cab.dtdocumento,''%d/%m/%Y'') dtdocumento');
//      SQL.Add(',DATE_FORMAT(tbordens_cab.dtretirada,''%d/%m/%Y'') dtretirada');
//      SQL.Add(',DATE_FORMAT(tbordens_cab.dtdevolucao,''%d/%m/%Y'') dtdevolucao');
//      SQL.Add(',LPAD(tbordens_cab.controle, 5, "0") AS controle');
//      SQL.Add(',tbclientes.nome cliente');
//      SQL.Add(' FROM tbordens_itens');
//      SQL.Add('INNER JOIN tbordens_cab ON tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab');
//      SQL.Add('INNER JOIN tbprodutos ON tbordens_itens.idtbproduto = tbprodutos.idtbproduto');
//      SQL.Add('INNER JOIN tbclientes ON tbordens_cab.idtbcliente = tbclientes.idtbcliente');
//      SQL.Add('WHERE tbordens_cab.estado = ''A''');
//      SQL.Add(' AND tbordens_itens.venda = "N"');
//      // case cbox_campo.ItemIndex of
//      // 0: SQL.Add(' AND tbordens_cab.dtdocumento BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//      // 1: SQL.Add(' AND tbordens_cab.dtretirada BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//      // 2: SQL.Add(' AND tbordens_cab.dtdevolucao BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//      // end;
//      case FSituacao of
//        ftRetirar:
//          begin
//            SQL.Add(' AND tbordens_itens.retirado="N" AND tbordens_itens.devolvido="N"');
//            if chbFiltraData.Checked then
//              SQL.Add(' AND date(tbordens_cab.dtretirada) between ' +
//                QuotedStr(FormatDateTime('YYYY-mm-dd', jvdtpDataFiltro1.Date)) +
//                ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',
//                jvdtpDataFiltro2.Date)));
//          end;
//        ftDevolver:
//          begin
//            SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="N"');
//            if chbFiltraData.Checked then
//              SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="N"'
//                + ' AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab'
//                + ' FROM tbordens_cab WHERE tbordens_cab.estado IN ("F","A","D"))');
//          end;
//        ftDevolvida:
//          begin
//            SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="S"');
//            SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="S"'
//              + ' AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab'
//              + ' FROM tbordens_cab WHERE tbordens_cab.estado IN ("D"))');
//          end;
//      end;
//      SQL.Add(' AND tbprodutos.nome Like ' + QuotedStr(produto + '%'));
//      SQL.Add(' GROUP BY idtbordens_cab, idtbproduto, produto, tipo, dtdocumento, dtretirada, dtdevolucao, controle, cliente');
//      SQL.Add(' ORDER BY ' + OrderBy + ' ' + Direcao);
//      IndexFieldNames := 'produto';
//      Open;
//      if Not IsEmpty then
//      begin
//        frxReport.PrepareReport(true);
//        frxReport.ShowReport;
//      end
//      else
//        MsgAviso('Não existem fantasias exibidas para as datas de Retirada e Devolução selecionadas');
//    end;
//  Finally
//    FreeAndNil(vQry);
//  End;
end;

procedure TfrmOrdens.CriarFieldsTables;
begin
  With fdmtb_ordemMaster Do
    Begin
      Close;
      Indexes.Clear;
      IndexDefs.Clear;
      Fields.Clear;
      FieldDefs.Clear;

      FieldDefs.Add('idtbordens_cab', ftString, 50, false);
      FieldDefs.Add('idtbempresa', ftInteger, 0, false);
      FieldDefs.Add('controle', ftInteger, 0, false);
      FieldDefs.Add('idfuncionario', ftInteger, 0, false);
      FieldDefs.Add('funcionario', ftString, 50, false);
      FieldDefs.Add('idtbcliente', ftInteger, 0, false);
      FieldDefs.Add('cliente', ftString, 50, false);
      FieldDefs.Add('dtdocumento', ftDate, 0, false);
      FieldDefs.Add('dtretirada', ftDate, 0, false);
      FieldDefs.Add('dtdevolucao', ftDate, 0, false);
      FieldDefs.Add('observacao', ftMemo, 0, false);
      FieldDefs.Add('estado', ftString, 10, false);
      FieldDefs.Add('retirada', ftString, 3, false);
      FieldDefs.Add('dtcadastro', ftDate, 0, false);
      FieldDefs.Add('usercad', ftInteger, 0, false);
      FieldDefs.Add('dtalterado', ftDate, 0, false);
      FieldDefs.Add('useralt', ftInteger, 0, false);
      FieldDefs.Add('qtdeTotal', ftFloat, 0, false);
      FieldDefs.Add('valorTotal', ftFloat, 0, false);
      CreateDataSet;
      LogChanges := False;
      FetchOptions.RecsMax := 300000;  //Sample value
      ResourceOptions.SilentMode := True;
      UpdateOptions.LockMode := lmNone;
      UpdateOptions.LockPoint := lpDeferred;
      UpdateOptions.FetchGeneratorsPoint := gpImmediate;
      Active := true;
    End;

  With fdmtb_ordemDetail Do
    Begin
      Close;
      Indexes.Clear;
      IndexDefs.Clear;
      Fields.Clear;
      FieldDefs.Clear;

      FieldDefs.Add('idtbordens_itens', ftString, 50, false);
      FieldDefs.Add('idtbordens_cab', ftString, 50, false);
      FieldDefs.Add('idtbproduto', ftInteger, 0, false);
      FieldDefs.Add('item', ftInteger, 0, false);
      FieldDefs.Add('produto', ftString, 50, false);
      FieldDefs.Add('qtde', ftFloat, 0, false);
      FieldDefs.Add('precoTabela', ftFloat, 0, false);
      FieldDefs.Add('valorUnitario', ftFloat, 0, false);
      FieldDefs.Add('percDesconto', ftFloat, 0, false);
      FieldDefs.Add('valorDesconto', ftFloat, 0, false);
      FieldDefs.Add('percAcrescimo', ftFloat, 0, false);
      FieldDefs.Add('valorAcrescimo', ftFloat, 0, false);
      FieldDefs.Add('totalBruto', ftFloat, 0, false);
      FieldDefs.Add('totalLiquido', ftFloat, 0, false);
      FieldDefs.Add('venda', ftString, 3, false);
      FieldDefs.Add('dtretirada', ftDate, 0, false);
      FieldDefs.Add('retirado', ftString, 3, false);
      FieldDefs.Add('devolvido', ftString, 3, false);
      FieldDefs.Add('cancelado', ftString, 3, false);
      FieldDefs.Add('dtalterado', ftDate, 0, false);
      FieldDefs.Add('useralt', ftInteger, 0, false);
      CreateDataSet;
      LogChanges := False;
      FetchOptions.RecsMax := 300000;  //Sample value
      ResourceOptions.SilentMode := True;
      UpdateOptions.LockMode := lmNone;
      UpdateOptions.LockPoint := lpDeferred;
      UpdateOptions.FetchGeneratorsPoint := gpImmediate;
      Active := true;
    End;

  With fdmtb_ordemPagto Do
    Begin
      Close;
      Indexes.Clear;
      IndexDefs.Clear;
      Fields.Clear;
      FieldDefs.Clear;

      FieldDefs.Add('idtbordens_pagto', ftString, 50, false);
      FieldDefs.Add('idtbordens_cab', ftString, 50, false);
      FieldDefs.Add('idtbformas_pagto', ftString, 50, false);
      FieldDefs.Add('forma_pagto', ftString, 50, false);
      FieldDefs.Add('valor', ftFloat, 0, false);
      CreateDataSet;
      LogChanges := False;
      FetchOptions.RecsMax := 300000;  //Sample value
      ResourceOptions.SilentMode := True;
      UpdateOptions.LockMode := lmNone;
      UpdateOptions.LockPoint := lpDeferred;
      UpdateOptions.FetchGeneratorsPoint := gpImmediate;
      Active := true;
    End;
end;

{$ENDREGION}

procedure TfrmOrdens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmOrdens := nil;
end;

procedure TfrmOrdens.FormCreate(Sender: TObject);
begin

  {--- Criando os campos das tables temporárias ---}
  CriarFieldsTables();

  var
  IFormaPagto := TIFormaPagto.New;
  IFormaPagto.Manufacture.ViewFormasPagto('ativo = 1', fdmtb_formasPagto);
  dsFormaPagto.DataSet := fdmtb_formasPagto;

  for var i := 0 to PageControl1.PageCount - 1 do
  begin
    PageControl1.Pages[i].TabVisible := false;
  end;

  tbsItens.TabVisible := false;
  tbsCab.TabVisible := false;
  PageControl1.ActivePageIndex := 0;
  jvcedt_produto.Button.Cursor := crHandPoint;
  jvcedt_atendente.Button.Cursor := crHandPoint;
  jvcedt_cliente.Button.Cursor := crHandPoint;
  SetStatus(acComecando);
end;

procedure TfrmOrdens.jvcedt_atendenteButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaFuncionarios, frmPesquisaFuncionarios);
  if TGlobal.entityId > 0 then
    jvcedt_atendente.Text := TGlobal.entityId.ToString;
end;

procedure TfrmOrdens.jvcedt_atendenteChange(Sender: TObject);
var
  listaFuncionarios: TObjectList<TFuncionario>;
begin
  if jvcedt_atendente.Text <> EmptyStr then
  begin
    Try
      var
      IFuncionario := TIFuncionario.New;
      IFuncionario.Build.ListAll('codigo = ' + jvcedt_atendente.Text,
        listaFuncionarios, '');
      if listaFuncionarios.Count > 0 then
        jvstAtendente.Caption :=
          (listaFuncionarios.Items[0] as TFuncionario).nome
      else
        jvstAtendente.Caption := 'INEXISTENTE';
    Finally
      listaFuncionarios.Clear;
      FreeAndNil(listaFuncionarios);
    End;
  end
  else
    jvstAtendente.Caption := EmptyStr;
end;

procedure TfrmOrdens.jvcedt_atendenteExit(Sender: TObject);
begin
  if jvstAtendente.Caption = ' INEXISTENTE' then
    jvcedt_atendente.SetFocus;
end;

procedure TfrmOrdens.jvcedt_cliente1ButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
    jvcedt_cliente1.Text := TGlobal.entityId.ToString;
end;

procedure TfrmOrdens.jvcedt_cliente1Change(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  if jvcedt_cliente1.Text <> EmptyStr then
  begin
    try
      var
      ICliente := TICliente.New;
      ICliente.Build.ListAll('idtbcliente = ' + jvcedt_cliente1.Text,
        listaClientes, '');
      if listaClientes.Count > 0 then
        jvstCliente1.Caption := (listaClientes.Items[0] as TCliente).nome
      else
        jvstCliente1.Caption := 'INEXISTENTE';
    finally
      listaClientes.Clear;
      FreeAndNil(listaClientes);
    end;
  end
  else
    jvstCliente1.Caption := EmptyStr;
end;

procedure TfrmOrdens.jvcedt_cliente1Exit(Sender: TObject);
begin
  if jvstCliente1.Caption = ' INEXISTENTE' then
    jvcedt_cliente1.SetFocus;
end;

procedure TfrmOrdens.jvcedt_clienteButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
    jvcedt_cliente.Text := TGlobal.entityId.ToString;
end;

procedure TfrmOrdens.jvcedt_clienteChange(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  if (jvcedt_cliente.Text <> EmptyStr) AND (jvcedt_cliente.Text <> '999999')
  then
  begin
    try
      var
      ICliente := TICliente.New;
      ICliente.Build.ListAll('idtbcliente = ' + jvcedt_cliente.Text,
        listaClientes, '');
      if listaClientes.Count > 0 then
      begin
        jvstCliente.Caption := (listaClientes.Items[0] as TCliente).nome;
        jvstTel1.Caption := (listaClientes.Items[0] as TCliente).fone1;
        jvstTel2.Caption := (listaClientes.Items[0] as TCliente).fone2;
      end
      else
      begin
        jvstCliente.Caption := ' INEXISTENTE';
        jvstTel1.Caption := '';
        jvstTel2.Caption := '';
      end;
    finally
      listaClientes.Clear;
      FreeAndNil(listaClientes);
    end;
  end
  else if jvcedt_cliente.Text = '999999' then
  begin
    jvstCliente.Caption := ' CONSUMIDOR FINAL';
    jvstTel1.Caption := '';
    jvstTel2.Caption := '';
  end
  else
  begin
    jvstCliente.Caption := '';
    jvstTel1.Caption := '';
    jvstTel2.Caption := '';
  end;
end;

procedure TfrmOrdens.jvcedt_clienteExit(Sender: TObject);
begin
  if jvstCliente.Caption = ' INEXISTENTE' then
    jvcedt_cliente.SetFocus;
end;

procedure TfrmOrdens.jvcedt_produtoButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
  if TGlobal.entityId > 0 then
    jvcedt_produto.Text := TGlobal.entityId.ToString;
end;

procedure TfrmOrdens.jvcedt_produtoChange(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  {---
    O campo ledt_valorUnitario.Text é para armazenar apenas o valor
    original do item para salva-lo em tabela como preço de tabela e
    realizar calculo de desconto.
  ---}
  if jvcedt_produto.Text <> EmptyStr then
  Begin
    Try
      var
      IProduto := TIProduto.New;
      IProduto.Build.ListAll('idtbproduto = ' + jvcedt_produto.Text,
        listaProdutos, '');
      if listaProdutos.Count > 0 then
      begin
        jvstProduto.Caption := (listaProdutos.Items[0] as TProduto).nome;

        if ((listaProdutos.Items[0] as TProduto).itemvenda = 'AM') Or
          ((listaProdutos.Items[0] as TProduto).itemvenda = 'AL') then
        begin
          jvedt_valorUnitario.Value := (listaProdutos.Items[0] as TProduto)
            .vlraluguel;
          ledt_valorUnitario.Text := FormatFloat('###,###,##0.00',
            (listaProdutos.Items[0] as TProduto).vlraluguel);
        end
        else
        begin
          jvedt_valorUnitario.Value :=
            (listaProdutos.Items[0] as TProduto).vlrvenda;
          ledt_valorUnitario.Text := FormatFloat('###,###,##0.00',
            (listaProdutos.Items[0] as TProduto).vlrvenda);
        end;

        if (FStatus = acAtualizando) then
        begin
          jvedt_valorDesconto.Value := jvdsItens.DataSet.FieldByName
            ('valorDesconto').Value;
        end;
      end
      else
      begin
        jvstProduto.Caption := ' INEXISTENTE';
        jvedt_valorUnitario.Value := 0;
        jvedt_percDesconto.Value := 0;
        jvedt_valorDesconto.Value := 0;
        ledt_valorUnitario.Text := FormatFloat('###,###,##0.00', 0);
      end;
    Finally
      listaProdutos.Clear;
      FreeAndNil(listaProdutos);
    End;
  End
  Else
  Begin
    jvstProduto.Caption := EmptyStr;
    jvedt_valorUnitario.Value := 0;
    jvedt_percDesconto.Value := 0;
    jvedt_valorDesconto.Value := 0;
    ledt_valorUnitario.Text := FormatFloat('###,###,##0.00', 0);
  End;
end;

procedure TfrmOrdens.jvcedt_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F3 then
    SwitchDescVenda(descacre);
end;

procedure TfrmOrdens.jvcedt_produto2Change(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  if jvcedt_produto2.Text <> EmptyStr then
  Begin
    Try
      var
      IProduto := TIProduto.New;
      IProduto.Build.ListAll('idtbproduto = ' + jvcedt_produto2.Text,
        listaProdutos, '');
      if listaProdutos.Count > 0 then
        jvstProduto2.Caption := (listaProdutos.Items[0] as TProduto).nome
      else
        jvstProduto2.Caption := 'INEXISTENTE';
    Finally
      listaProdutos.Clear;
      FreeAndNil(listaProdutos);
    End;
  End
  Else
    jvstProduto2.Caption := EmptyStr;
end;

procedure TfrmOrdens.jvdbFormasPagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_DELETE then
  begin
    if MsgConfirmacao('Excluir condição de pagamento selecionada?') then
      ExcluiPagto(jvdsPagto.DataSet.FieldByName('idtbordens_pagto').AsString);
  end;
end;

procedure TfrmOrdens.jvdbgItensEnter(Sender: TObject);
begin
  if fdmtb_ordemDetail.RecordCount > 0 then
    pnl_observacao1.Visible := true;
end;

procedure TfrmOrdens.jvdbgItensExit(Sender: TObject);
begin
  pnl_observacao1.Visible := false;
end;

procedure TfrmOrdens.jvdbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  idItem: String;
begin
  case Key of
    VK_SPACE:
      begin
        if (fdmtb_ordemDetail.RecordCount > 0) AND
          (fdmtb_ordemDetail.FieldByName('cancelado').AsString = '') then
        begin
          jvcedt_produto.Text := fdmtb_ordemDetail.FieldByName
            ('idtbproduto').AsString;
          jvsedt_qtde.Value := fdmtb_ordemDetail.FieldByName('qtde').Value;
          ledt_valorUnitario.Text := FormatCurr('###,###,##0.00',
            fdmtb_ordemDetail.FieldByName('precoTabela').Value);
          jvedt_valorUnitario.Value := FormatCurr('###,###,##0.00',
            fdmtb_ordemDetail.FieldByName('valorUnitario').Value);
          jvedt_percDesconto.Value := FormatCurr('##0.00',
            fdmtb_ordemDetail.FieldByName('percDesconto').Value);
          jvedt_valorDesconto.Value :=
            IfThen(fdmtb_ordemDetail.FieldByName('valorDesconto').Value < 0,
            fdmtb_ordemDetail.FieldByName('valorDesconto').Value * (-1),
            fdmtb_ordemDetail.FieldByName('valorDesconto').Value);
          idItem := fdmtb_ordemDetail.FieldByName('idtbordens_itens').AsString;
          SwitchVenda(idItem);
          SetStatus(acInserindo);
          jvcedt_produto.Clear;
          jvdsItens.Locate('idtbordens_itens',idItem, [])
        end;
      end;
    VK_RETURN:
      begin
        if (fdmtb_ordemDetail.RecordCount > 0) AND
          (fdmtb_ordemDetail.FieldByName('cancelado').AsString = '') then
        begin
          jvcedt_produto.Text := fdmtb_ordemDetail.FieldByName
            ('idtbproduto').AsString;
          jvsedt_qtde.Value := fdmtb_ordemDetail.FieldByName('qtde').Value;
          ledt_valorUnitario.Text := FormatCurr('###,###,##0.00',
            fdmtb_ordemDetail.FieldByName('precoTabela').Value);
          jvedt_valorUnitario.Value := FormatCurr('###,###,##0.00',
            fdmtb_ordemDetail.FieldByName('valorUnitario').Value);
          jvedt_percDesconto.Value := FormatCurr('##0.00',
            fdmtb_ordemDetail.FieldByName('percDesconto').Value);
          jvedt_valorDesconto.Value :=
            IfThen(fdmtb_ordemDetail.FieldByName('valorDesconto').Value < 0,
            (fdmtb_ordemDetail.FieldByName('valorDesconto').Value /
            fdmtb_ordemDetail.FieldByName('qtde').Value) * (-1),
            (fdmtb_ordemDetail.FieldByName('valorDesconto').Value /
            fdmtb_ordemDetail.FieldByName('qtde').Value));
          if fdmtb_ordemDetail.FieldByName('valorDesconto').Value < 0 then
          begin
            descacre := 'desconto';
            ledt_percDesconto.EditLabel.Caption := '% Desconto';
            ledt_valorDesconto.EditLabel.Caption := 'R$ Desconto';
          end
          else
          begin
            descacre := 'acrescimo';
            ledt_percDesconto.EditLabel.Caption := '% Acrescimo';
            ledt_valorDesconto.EditLabel.Caption := 'R$ Acrescimo';
          end;
          SetStatus(acAtualizando);
          jvcedt_produto.SetFocus;
          sbtn_addItem.Caption := 'Alterar Item';
          img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'refresh');
        end;
      end;
    VK_DELETE:
      begin
       CancelarItem(fdmtb_ordemDetail.FieldByName('idtbordens_itens').AsString);
      end;
  end;
end;

procedure TfrmOrdens.jvdbg_FantasiasEnter(Sender: TObject);
begin
  if jvdsItens.DataSet.RecordCount > 0 then
    pnl_observacao2.Visible := true;
end;

procedure TfrmOrdens.jvdbg_FantasiasExit(Sender: TObject);
begin
  if jvdsItens.DataSet.RecordCount > 0 then
    pnl_observacao2.Visible := false;
end;

procedure TfrmOrdens.jvdbg_FantasiasTitleClick(Column: TColumn);
begin
  if jvdsItens.RecordCount = 0 then
    Exit;

  OrderBy := Column.FieldName;
  if Direcao = '' then
    Direcao := 'DESC'
  else
    Direcao := '';
  fdmtb_ordemDetail.IndexFieldNames := IfThen(Direcao.Trim().IsEmpty,
    OrderBy + ':A', OrderBy + ':D');
  fdmtb_ordemDetail.Refresh;
end;

procedure TfrmOrdens.jvdbgCabsDblClick(Sender: TObject);
begin
  if jvdsCab.RecordCount > 0 then
    ManutencaoOrdem(fdmtb_listaOrdens.FieldByName('idtbordens_cab').AsString);
end;

procedure TfrmOrdens.jvdbgCabsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgCabs.Canvas.Font.Color := clWhite
    else if fdmtb_ordemMaster.FieldByName('retirada').AsString = 'S' then
      jvdbgCabs.Canvas.Font.Color := $00D56A00
    else
      jvdbgCabs.Canvas.Font.Color := $00525252
  else if fdmtb_ordemMaster.FieldByName('retirada').AsString = 'S' then
    jvdbgCabs.Canvas.Font.Color := $00D56A00
  else
    jvdbgCabs.Canvas.Font.Color := $00525252;
  jvdbgCabs.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmOrdens.jvdbgCabsKeyPress(Sender: TObject; var Key: Char);
begin
  if UpperCase(Key) = 'P' then
    ImprimirComprovante(fdmtb_listaOrdens.FieldByName('idtbordens_cab')
      .AsString);
end;

procedure TfrmOrdens.jvdbgItens1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens1.Canvas.Font.Color := clWhite
    else
      jvdbgItens1.Canvas.Font.Color := $00525252;
  if fdmtb_ordemDetail.FieldByName('cancelado').AsString = 'S' then
    jvdbgItens1.Canvas.Font.Color := $00E6E6E6;
  jvdbgItens1.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmOrdens.jvdbgItens3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens3.Canvas.Font.Color := clWhite
    else
      jvdbgItens3.Canvas.Font.Color := $00525252;
  if fdmtb_ordemDetail.FieldByName('retirado').AsString = 'S' then
    jvdbgItens3.Canvas.Font.Color := $00D56A00;
  jvdbgItens3.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmOrdens.jvdbgItens4DblClick(Sender: TObject);
begin
  jvcedt_produto2.Text := fdmtb_ordemDetail.FieldByName('idtbproduto').AsString;
end;

procedure TfrmOrdens.jvdbgItensDblClick(Sender: TObject);
begin
  if (fdmtb_ordemDetail.RecordCount > 0) AND
    (fdmtb_ordemDetail.FieldByName('venda').AsString <> 'S') AND
    (fdmtb_ordemDetail.FieldByName('cancelado').AsString <> 'S') then
    if (FSituacao = ftComecando) Or (FSituacao = ftRetirar) then
    begin
      if fdmtb_ordemDetail.FieldByName('retirado').AsString = 'S' then
      begin
        MsgAviso('Este item já foi retirado não podendo ser mais alterado');
        Exit;
      end;
      jvcedt_produto.Text := fdmtb_ordemDetail.FieldByName
        ('idtbproduto').AsString;
      jvcedt_produto.SetFocus;
    end;
end;

procedure TfrmOrdens.jvdbgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens.Canvas.Font.Color := clWhite
    else
      jvdbgItens.Canvas.Font.Color := $00525252;
  if fdmtb_ordemDetail.FieldByName('cancelado').AsString = 'S' then
    jvdbgItens.Canvas.Font.Color := $00565656; // $00E6E6E6;
  jvdbgItens.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmOrdens.jvdsCabDataSetScrolled(Sender: TObject);
begin
  if (FStatus = acListando) then
    begin
      ListaOrdemPagtos(fdmtb_listaOrdens.FieldByName('idtbordens_cab').AsString);
      ListaItensOrdem(fdmtb_listaOrdens.FieldByName('idtbordens_cab').AsString);
      if (FStatus = acAtualizando) then
        nroOrdem := fdmtb_listaOrdens.FieldByName('idtbordens_cab').AsString;
    end;
end;

procedure TfrmOrdens.jvdt_dtretInicioMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TJvDateEdit(Sender).Hint :=
  'Pressione "Q" para adicionar 15 dias a data' + #13 +
  'Pressione "M" para adicionar 30 dias a data' + #13 +
  'Pressione "A" para adicionar  1 ano a data' + #13 +
  'Pressione "S" para adicionar  1 semana a data';
end;

procedure TfrmOrdens.jvedt_valorUnitarioChange(Sender: TObject);
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

procedure TfrmOrdens.jvedt_valorUnitarioEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmOrdens.jvedt_valorUnitarioExit(Sender: TObject);
begin
  CalculaDesconto(TLabeledEdit(Sender).Tag);
end;

procedure TfrmOrdens.jvrbtn_aretirarClick(Sender: TObject);
begin
  if jvrbtn_aretirar.Checked then
  begin
    SetSituacao(ftRetirar);
    sbtn_acaoFantasias.Caption := 'Retirar Fantasia(s)';
    sbtn_acaoFantasias.Enabled := true;
  end
  else if jvrbtn_adevolver.Checked then
  begin
    SetSituacao(ftDevolver);
    sbtn_acaoFantasias.Caption := 'Devolver Fantasia(s)';
    sbtn_acaoFantasias.Enabled := true;
  end
  else if jvrbtn_devolvidas.Checked then
  begin
    SetSituacao(ftDevolvida);
    sbtn_acaoFantasias.Enabled := false;
  end
  else
    SetSituacao(ftRetirar);
  jvdsItens.Enabled := false;
  jvdsItens.DisableEventsOnLoading := true;
  ListaFantasias(ledt_produto2.Text, OrderBy, Direcao);
  jvdsItens.Enabled := true;
  jvdsItens.DisableEventsOnLoading := false;
end;

procedure TfrmOrdens.ledt_produto2Change(Sender: TObject);
begin
  ListaFantasias(ledt_produto2.Text, OrderBy, Direcao);
end;

procedure TfrmOrdens.sbtn_acaoFantasiasClick(Sender: TObject);
var
  i: Integer;
  aux: string;
  DataSet: TDataSet;
  vQry: TFDQuery;
begin
  {--- 08/11/2024:
       Ver a necessidade desse trecho de código e se preciso
       verificar o tratamento em TFDMemTable ou diratamente em banco ---}
  if jvdbg_Fantasias.SelectedRows.Count > 0 then
  begin
    if Not MsgConfirmacao(PChar(sbtn_acaoFantasias.Caption + '?')) then
      Exit;
    DataSet := jvdbg_Fantasias.DataSource.DataSet;
    try
      DataSet.DisableControls;
      var
      listaDetails: TObjectList<TOrdemDetail>;
      var
      IOrdemDetail := TIOrdemDetail.New;
      for i := 0 to jvdbg_Fantasias.SelectedRows.Count - 1 do
      begin
        DataSet.GotoBookmark((jvdbg_Fantasias.SelectedRows.Items[i]));

        var
        objDetail := IOrdemDetail.Build.ListByGuid('idtbordens_itens',
        QuotedStr(DataSet.FieldByName('idtbordens_itens').AsString),
          listaDetails).This;
        IOrdemDetail.Build.Modify(objDetail);
        With objDetail Do
          Begin
            retirado := 'S';
            devolvido := 'S';
          End;
        IOrdemDetail.Build.Update;
        listaDetails.Clear;

//        aux := aux + QuotedStr(DataSet.FieldByName('idtbordens_itens')
//          .AsString) + ',';
      end;
      FreeAndNil(listaDetails);
//      aux := Copy(aux, 1, Length(aux) - 1);
//      vQry := TFDQuery.Create(nil);
//      vQry.Connection := Controle.Conexao.GetConexao;
//      With vQry Do
//      Begin
//        Close;
//        SQL.Clear;
//        SQL.Add('UPDATE tbordens_itens');
//        case FSituacao of
//          ftRetirar:
//            SQL.Add(' SET retirado="S"');
//          ftDevolver:
//            SQL.Add(' SET devolvido="S"');
//          ftDevolvida:
//            ;
//        end;
//        SQL.Add(' WHERE idtbordens_itens in (' + aux + ')');
//        ExecSQL;
//      End;
      ListaFantasias(ledt_produto2.Text, OrderBy, Direcao);
    finally
      DataSet.EnableControls;
//      FreeAndNil(vQry);
    end;
  end
  else
    MsgAviso('Nenhuma fantasia foi selecionada');
end;

procedure TfrmOrdens.sbtn_addclienteClick(Sender: TObject);
begin
  OpenFormModal(TfrmClientes, frmClientes);
end;

procedure TfrmOrdens.sbtn_addItemClick(Sender: TObject);
begin
  if jvcedt_produto.Text = EmptyStr then
  begin
    MsgErro('Campo produto não foi preenchido');
    jvcedt_produto.SetFocus;
    Abort;
  end;
  {--- Força a saida dos campos de descontos em % e R$ para calcula-los ---}
  ledt_valorUnitario.SetFocus;
  ledt_valorDesconto.SetFocus;
  if (FSituacao = ftComecando) then
  begin
    ordemRetirada := false;
    IniciaOrdem;
  end;

  if (FStatus = acInserindo) then
    InsereItem;
  if (FStatus = acAtualizando) then
    AlterarItem(fdmtb_ordemDetail.FieldByName('idtbordens_itens').AsString);
end;

procedure TfrmOrdens.sbtn_addItemMouseEnter(Sender: TObject);
begin
  pnl_btnAddItem.Color := $00A36215;
end;

procedure TfrmOrdens.sbtn_addItemMouseLeave(Sender: TObject);
begin
  pnl_btnAddItem.Color := $00565656;
end;

procedure TfrmOrdens.sbtn_caixaClick(Sender: TObject);
begin
  OpenFormModal(TfrmCaixas, frmCaixas);
end;

procedure TfrmOrdens.sbtn_cancelarClick(Sender: TObject);
begin
  if fdmtb_ordemMaster.FieldByName('retirada').AsString = 'S' then
  begin
    MsgErro('Ordem já foi retirada e sua anulação não é permitida');
    Exit;
  end;
  if (FSituacao = ftComecando) Or (FSituacao = ftRetirar) then
    if MsgConfirmacao('Tem certeza que deseja anular esta ordem?') then
      CancelarOrdem(fdmtb_ordemMaster.FieldByName('idtbordens_cab').AsString);
end;

procedure TfrmOrdens.sbtn_cancelarMouseEnter(Sender: TObject);
begin
  pnl_btnCancelar.Color := clRed;
end;

procedure TfrmOrdens.sbtn_cancelarMouseLeave(Sender: TObject);
begin
  pnl_btnCancelar.Color := $00565656;
end;

procedure TfrmOrdens.sbtn_comprovanteClick(Sender: TObject);
begin
  ImprimirComprovante(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfrmOrdens.sbtn_finalizarClick(Sender: TObject);
begin
  {--- Validando ---}
  if jvcedt_atendente.Text = EmptyStr then
  begin
    jvcedt_atendente.SetFocus;
    MsgAviso('Campo Atendente não foi preenchido');
    Exit;
  end;
  if jvcedt_cliente.Text = EmptyStr then
  begin
    jvcedt_cliente.SetFocus;
    MsgAviso('Campo Cliente não foi preenchido');
    Exit;
  end;
  if vTotal <> vPagto then
  begin
    jvdbPagto.SetFocus;
    MsgAviso('Valor recebido não confere com o Total a pagar');
    Exit;
  end;
  if (jvdt_dtdevolucao.Date = Date()) AND (itensAlugados > 0) then
  begin
    jvdt_dtdevolucao.SetFocus;
    MsgAviso('Data de Devolução não pode ser a data atual');
    Exit;
  end;

  FinalizaOrdem(nroOrdem);

  fdmtb_ordemDetail.DisableControls;
  fdmtb_ordemDetail.First;

  {--- Movimentando Estoque e Kardex ---}
  if not fdmtb_ordemDetail.Eof then
    repeat
      if (fdmtb_ordemDetail.FieldByName('venda').AsString = '') AND
        (jvdt_dtretirada.Date = Date()) then
        MovEstoqueKardex(fdmtb_ordemDetail.FieldByName('idtbproduto').AsInteger,
          fdmtb_ordemDetail.FieldByName('qtde').AsInteger, 5,
          FormatFloat('00000', fdmtb_ordemMaster.FieldByName('controle')
          .AsInteger));

      if fdmtb_ordemDetail.FieldByName('venda').AsString = 'Sim' then
        MovEstoqueKardex(fdmtb_ordemDetail.FieldByName('idtbproduto').AsInteger,
          fdmtb_ordemDetail.FieldByName('qtde').AsInteger, 3,
          FormatFloat('00000', fdmtb_ordemMaster.FieldByName('controle')
          .AsInteger));

      fdmtb_ordemDetail.Next;
    until fdmtb_ordemDetail.Eof;
  fdmtb_ordemDetail.EnableControls;

  ImprimirComprovante(fdmtb_ordemMaster.FieldByName('idtbordens_cab').AsString);

  MsgInformacao('Ordem finalizada com sucesso!');
  jvcedt_atendente.Clear;
  jvcedt_cliente.Clear;
  jvcedt_atendente.Enabled := true;
  jvcedt_cliente.Enabled := true;
  jvdt_dtretirada.Date := Date();
  jvdt_dtdevolucao.Date := Date();
  img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'circleadd');

  fdmtb_ordemPagto.EmptyDataSet;
  fdmtb_ordemDetail.EmptyDataSet;
  fdmtb_ordemMaster.EmptyDataSet;
  PageControl1.ActivePageIndex := 0;
  jvcedt_produto.SetFocus;
  SetStatus(acComecando);
end;

procedure TfrmOrdens.sbtn_listaFantasiasClick(Sender: TObject);
begin
  jvdsCab.Enabled := false;
  jvdsItens.DisableEventsOnLoading := true;
  jvrbtn_aretirar.Checked := true;
  SetSituacao(ftRetirar);
  sbtn_acaoFantasias.Caption := 'Retirar Fantasia(s)';
  sbtn_acaoFantasias.Enabled := true;

  jvdsItens.Enabled := false;
  jvdsItens.DisableEventsOnLoading := true;
  ListaFantasias(ledt_produto2.Text, OrderBy, Direcao);
  jvdsItens.Enabled := true;
  jvdsItens.DisableEventsOnLoading := false;

  jvdsCab.Enabled := true;
  jvdsItens.Enabled := true;
  jvdsItens.DisableEventsOnLoading := false;
  PageControl1.ActivePageIndex := 4;
end;

procedure TfrmOrdens.sbtn_listaOrdensClick(Sender: TObject);
begin
  ImprimirOrdens(jvdt_dtStart.Date, jvdt_dtEnd.Date);
end;

procedure TfrmOrdens.sbtn_pagtoClick(Sender: TObject);
begin
  {--- Validando ---}
  if fdmtb_ordemDetail.RecordCount = 0 then  
  begin
    MsgErro('Inclua ao menos um item válido');
    Abort;
  end;

  if itensAlugados > 0 then
    begin
      jvdt_dtretirada.Enabled := True;
      jvdt_dtdevolucao.Enabled := True;
    end
  else
    begin
      jvdt_dtretirada.Enabled := False;
      jvdt_dtdevolucao.Enabled := False;
    end;
  PageControl1.ActivePageIndex := 1;
  lblPagto.Caption := 'Total a Pagar: ' + FormatCurr('###,###,##0.00', vTotal) +
    ' | Recebido: ' + FormatCurr('###,###,##0.00', vPagto);
end;

procedure TfrmOrdens.sbtn_pagtoMouseEnter(Sender: TObject);
begin
  pnl_btnPagto.Color := $00A36215;
end;

procedure TfrmOrdens.sbtn_pagtoMouseLeave(Sender: TObject);
begin
  pnl_btnPagto.Color := $00565656;
end;

procedure TfrmOrdens.sbtn_pesquisar1Click(Sender: TObject);
begin
  case cbox_pesquisa.ItemIndex of
    0, 1, 2:
      begin
        if jvcedt_cliente1.Text <> EmptyStr then
          ListaOrdem(jvdt_dtStart.Date, jvdt_dtEnd.Date,
            StrToInt(jvcedt_cliente1.Text), StrToInt(jvcedt_cliente1.Text))
        else
          ListaOrdem(jvdt_dtStart.Date, jvdt_dtEnd.Date, 1, 99999999);
      end;
    3:
      begin
        if jvcedt_cliente1.Text = EmptyStr then
        begin
          MsgAviso('Cliente não foi informado');
          Exit;
        end;
        ListaOrdem(IncYear(Date) - 1, IncYear(Date),
          StrToInt(jvcedt_cliente1.Text), StrToInt(jvcedt_cliente1.Text));
      end;
  end;
end;

procedure TfrmOrdens.sbtn_pesquisarClick(Sender: TObject);
begin
  if (FStatus = acAtualizando) Or (FStatus = acInserindo) then
  begin
    MsgAviso('Encerre a Ordem ou anule antes de prosseguir');
    Exit;
  end;
  if fdmtb_listaOrdens.Active then
    fdmtb_listaOrdens.EmptyDataSet;

  if fdmtb_listaItens.Active then
    fdmtb_listaItens.EmptyDataSet;

  if fdmtb_listaPagtos.Active then
    fdmtb_listaPagtos.EmptyDataSet;

  SetStatus(acListando);
  jvdsCab.DataSet := fdmtb_listaOrdens;
  PageControl1.ActivePageIndex := 2;
end;

procedure TfrmOrdens.sbtn_refreshItemClick(Sender: TObject);
begin
  if jvcedt_produto2.Text = EmptyStr then
  begin
    MsgErro('Campo produto não foi preenchido');
    Exit;
  end;
  {--- Passando o código do item para o ---}
  jvcedt_produto.Text := jvcedt_produto2.Text;
  AlterarItem(jvdsItens.DataSet.FieldByName('idtbordens_itens').AsString);

  {--- Listando a Ordem e Itens ---}
  ListaOrdem(nroOrdem);
  ListaItensOrdem(nroOrdem);
end;

procedure TfrmOrdens.sbtn_retiradaClick(Sender: TObject);
begin
  if jvdsCab.RecordCount = 0 then
  begin
    MsgErro('Nenhuma ordem foi selecionada');
    Exit;
  end;
  if jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim' then
  begin
    MsgErro('A ordem ' + FormatFloat('00000',
      jvdsCab.DataSet.FieldByName('controle').Value) +
      ' já teve o(s) item(ns) retirado(s).');
    Exit;
  end;
  if MsgConfirmacao('Confirma a retirada da ordem ' + FormatFloat('00000',
    jvdsCab.DataSet.FieldByName('controle').Value) + '?') then
    RetirarOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfrmOrdens.sbtn_rptFantasiasClick(Sender: TObject);
begin
  ImprimirFantasias(ledt_produto2.Text, OrderBy, Direcao);
end;

procedure TfrmOrdens.sbtn_devolucaoClick(Sender: TObject);
begin
  if jvdsCab.RecordCount = 0 then
  begin
    MsgErro('Nenhuma ordem foi selecionada');
    Exit;
  end;

  if jvdsCab.DataSet.FieldByName('estado').AsString = 'Fechada' then
  begin
    MsgAviso('A ordem ' + FormatFloat('00000',
      jvdsCab.DataSet.FieldByName('controle').Value) +
      ' não teve itens alugados');
    Exit;
  end;

  if MsgConfirmacao('Confirma a devolução da ordem ' + FormatFloat('00000',
    jvdsCab.DataSet.FieldByName('controle').Value) + '?') then
    DevolverOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfrmOrdens.sbtn_voltar1Click(Sender: TObject);
begin
  jvdsCab.DataSet := fdmtb_ordemMaster;
  jvdsItens.DataSet := fdmtb_ordemDetail;
  jvdsPagto.DataSet := fdmtb_ordemPagto;
  SetStatus(acComecando);
  img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'circleadd');
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmOrdens.sbtn_voltarClick(Sender: TObject);
begin
  if (jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim') then
  begin
    MsgErro('Não é permitido alterar o(s) iten(s) pois retirada já foi confirmada');
    Exit;
  end;
  if jvdsPagto.DataSet.RecordCount > 0 then
  begin
    MsgAviso('Exclua os pagamentos para poder retornar');
    Abort;
  end;
  if (FStatus = acAtualizando) then
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'refresh');
  if (FStatus = acInserindo) OR (FStatus = acComecando) then
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance, 'circleadd');
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmOrdens.SetStatus(const poStatus: eAcao);
begin
  FStatus := poStatus;
end;

procedure TfrmOrdens.SetSituacao(const poSituacao: eSituacao);
begin
  FSituacao := poSituacao;
end;

procedure TfrmOrdens.sbtn_addpagtoClick(Sender: TObject);
begin
  // Validando
  if jvdbPagto.Text = EmptyStr then
  begin
    MsgAviso('Forma de pagamento não foi informada');
    Exit;
  end;
  if jvedt_valorPagto.Value = 0 then
  begin
    MsgAviso('Valor pago não foi informado');
    Exit;
  end;
  if jvedt_valorPagto.Value > (vTotal - vPagto) then
  begin
    MsgErro('Valor excede o restante a receber');
    Exit;
  end;
  InserirPagto;
  jvdbPagto.ResetField;
  jvedt_valorPagto.Value := 0;
end;

end.

