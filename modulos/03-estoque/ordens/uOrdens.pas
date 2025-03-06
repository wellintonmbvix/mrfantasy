unit uOrdens;

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
  SimpleDAO,
  SimpleQueryFiredac,
  SimpleAttributes,

  Data.DB,

  FireDAC.Stan.Param,
  FireDAC.Stan.StorageJSON,
  FireDAC.Comp.Client,

  uClasseOrdens,
  uClasseFantasias,
  uClasseClientes,
  uClasseFuncionarios,
  uRotinas,
  uGlobal,
  uControle,

  classe.global,

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

  frxExportPDF,
  frxClass,
  frxExportBaseDialog,
  frxExportText,
  frxDBSet,

  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvExComCtrls,
  JvDateTimePicker;


type
    eAcao = (acInserindo, acAtualizando, acListando, acComecando);

type
    eSituacao = (ftRetirar, ftDevolver, ftDevolvida);

type
  TfOrdens = class(TForm)
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
    frxReport: TfrxReport;
    frxDBCab: TfrxDBDataset;
    frxDBItem: TfrxDBDataset;
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
    procedure FormDestroy(Sender: TObject);
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
    procedure jvdt_dtretInicioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
  private
    { Private declarations }
    DaoOrdemCab    : iSimpleDAO<TOrdemCab>;
    DaoOrdemItem   : iSimpleDAO<TOrdemItem>;
    DaoOrdemPagto  : iSimpleDAO<TOrdemPagto>;
    DaoFantasias   : iSimpleDAO<TOrdemItem>;
    FStatus        : eAcao;
    FSituacao      : eSituacao;
    Controle       : TControle;
    nroOrdem       : String;
    FListOrdens    : TObjectList<TOrdemCab>;
    FListItens     : TObjectList<TOrdemItem>;
    FListPagtos    : TObjectList<TOrdemPagto>;
    FListFantasias : TObjectList<TOrdemItem>;

    procedure SetStatus(const poStatus: eAcao);
    procedure SetSituacao(const poSituacao: eSituacao);
    procedure IniciaOrdem;
    procedure InsereItem;
    procedure ListaOrdem(aOrdem : String); overload;
    procedure ListaOrdem(dtInicio, dtFim : TDate; idClieIni, idClieFim : Integer); overload;
    procedure ListaItensOrdem(aOrdem : String); overload;
    procedure ListaItensOrdem(dtInicio, dtFim : TDate; Produto, OrderBy, Direcao: String); overload;
    procedure ListaFantasias(Fantasia, OrderBy, Direcao: String);
    procedure CalculaDesconto(Metodo : Integer = 0);
    procedure CancelarOrdem(aOrdem: String);
    procedure CancelarItem(aOrdemItem: String);
    procedure AlterarItem(aOrdemItem: String);
    procedure ListaOrdemPagtos(aOrdem: String);
    procedure InserirPagto;
    procedure GetItemDataSet(Itens: TOrdemItem; DataSource: TJvDataSource);
    procedure SwitchVenda(aOrdemItem: String);
    procedure ExcluiPagto(aOrdemPagto, aOrdem, aIdFormaPagto: String);
    procedure FinalizaOrdem(aOrdemCab: String);
    procedure MovEstoqueKardex(nIdProduto, nQtd, nTipo: Integer; nDocumento : String);
    procedure ManutencaoOrdem(aOrdem: String);
    procedure RetirarOrdem(aOrdemCab: String);
    procedure DevolverOrdem(aOrdemCab: String);
    procedure ImprimirComprovante(aOrdemCab: String);
    procedure ImprimirOrdens(dtEmissaoIni, dtEmissaoFim : TDate);
    procedure ImprimirFantasias(Produto, OrderBy, Direcao: String);
    procedure SwitchDescVenda(modo: String);
  public
    { Public declarations }
  end;

var
  fOrdens       : TfOrdens;
  vQtde,
  vTotal,
  vPagto        : Currency;
  itensAlugados : Integer;
  descacre      : String = 'desconto';
  dtEmissao     : TDate;
  orderby       : String = 'produto';
  direcao       : String = '';
  ordemRetirada : Boolean = false;
  inibeAcresc   : Boolean = false;

implementation

{$R *.dfm}

uses
  uCaixas,
  view.cadastros.produtoPesquisa,
  view.cadastros.funcionarioPesquisa,
  view.cadastros.clientePesquisa,
  view.cadastros.cliente;

{$REGION 'Métodos e Funções'}

procedure TfOrdens.GetItemDataSet(Itens : TOrdemItem; DataSource : TJvDataSource);
begin
    With Itens Do
      Begin
        idtbordensItens := DataSource.DataSet.FieldByName('idtbordens_itens').AsString;
        idtbordensCab   := DataSource.DataSet.FieldByName('idtbordens_cab').AsString;
        idtbProduto     := DataSource.DataSet.FieldByName('idtbproduto').Value;
        item            := DataSource.DataSet.FieldByName('item').Value;
        qtde            := DataSource.DataSet.FieldByName('qtde').Value;
        precoTabela     := DataSource.DataSet.FieldByName('precoTabela').Value;
        valorUnitario   := DataSource.DataSet.FieldByName('valorUnitario').Value;
        percDesconto    := DataSource.DataSet.FieldByName('percDesconto').Value;
        valorDesconto   := DataSource.DataSet.FieldByName('valorDesconto').Value;
        percAcrescimo   := DataSource.DataSet.FieldByName('percAcrescimo').Value;
        valorAcrescimo  := DataSource.DataSet.FieldByName('valorAcrescimo').Value;
        totalBruto      := DataSource.DataSet.FieldByName('totalBruto').Value;
        totalLiquido    := DataSource.DataSet.FieldByName('totalLiquido').Value;
        if Length(Trim(DataSource.DataSet.FieldByName('venda').AsString)) > 0 then
          venda         := 'S'
        else
          venda         := 'N';
        dtretirada      := jvdsCab.DataSet.FieldByName('dtretirada').Value;
        if Length(Trim(DataSource.DataSet.FieldByName('retirado').AsString)) > 0 then
          retirado      := 'S'
        else
          retirado      := 'N';
        if Length(Trim(DataSource.DataSet.FieldByName('devolvido').AsString)) > 0 then
          devolvido     := 'S'
        else
          devolvido     := 'N';
        if Length(Trim(DataSource.DataSet.FieldByName('cancelado').AsString)) > 0 then
          cancelado     := 'S'
        else
          cancelado     := 'N';
        userAlt         := UserLog;
      End;
end;

procedure TfOrdens.CalculaDesconto(Metodo: Integer);
begin
  case Metodo of
    0 : // Desconto ao digitar o valor de venda
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
    1 : // Desconto ao digitar o percentual de desconto
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
    2 : // Desconto ao digitar o valor de desconto
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

procedure TfOrdens.IniciaOrdem;
var
  OrdemCab : TOrdemCab;
  vQry     : TFDQuery;
begin
  OrdemCab := TOrdemCab.Create;
  // Inicializando GUID da Ordem
  nroOrdem := GuidCreate;
  // Listando ordens da data atual para incluir a qtde como nro de controle
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  vQry.Open('SELECT ifnull(MAX(controle),0)+1 as controle FROM tbordens_cab WHERE date(dtdocumento) = '+QuotedStr(FormatDateTime('YYYY-mm-dd', Date())));
  try
    With OrdemCab Do
      begin
        idtbordensCab := nroOrdem;
        idtbEmpresa   := EmpLog;
        nroControle   := vQry.FieldByName('controle').Value;
        dtDocumento   := dtEmissao;
        estado        := 'P';
        userCad       := UserLog;
        userAlt       := UserLog;
        idFuncionario := 999;
        idtbCliente   := 999999;
        dtRetirada    := Date();
        dtDevolucao   := Date();
        observacao    := EmptyStr;
      end;
    DaoOrdemCab.Insert(OrdemCab);
    ListaOrdem(nroOrdem);
    SetStatus(acInserindo);
  finally
    FreeAndNil(vQry);
    FreeAndNil(OrdemCab);
  end;
end;

 procedure TfOrdens.InsereItem;
var
  OrdemItem : TOrdemItem;
begin
  OrdemItem := TOrdemItem.Create;
  try
    With OrdemItem Do
      begin
        idtbordensItens := GuidCreate;
        idtbordensCab   := nroOrdem;
        idtbProduto     := StrToInt(jvcedt_produto.Text);
        item            := jvdsItens.RecordCount + 1;
        qtde            := jvsedt_qtde.Value;
        precoTabela     := StrToCurr(SomenteNumero('.,',ledt_valorUnitario.Text))/100;
        valorUnitario   := jvedt_valorUnitario.Value;        
        if descacre = 'desconto' then
        begin
          percDesconto   := jvedt_percDesconto.Value;
          valorDesconto  := qtde * (jvedt_valorDesconto.Value *(-1));
          percAcrescimo  := 0;
          valorAcrescimo := 0;
        end
        else
        begin
          percDesconto   := 0;
          valorDesconto  := 0;
          percAcrescimo  := jvedt_percDesconto.Value;
          valorAcrescimo := qtde *jvedt_valorDesconto.Value;
        end;
        totalBruto      := precoTabela * qtde;
        totalLiquido    := valorUnitario * qtde;
        venda           := 'N';
        retirado        := 'N';
        devolvido       := 'N';
        cancelado       := 'N';
        userAlt         := UserLog;
      end;
    DaoOrdemItem.Insert(OrdemItem);
    ListaItensOrdem(nroOrdem);
    jvsedt_qtde.Value := 1;
    jvcedt_produto.Clear;
    jvcedt_produto.SetFocus;
  finally
    FreeAndNil(OrdemItem);
  end;
end;

procedure TfOrdens.ListaItensOrdem(aOrdem: String);
var
  OrdemItem : TOrdemItem;
begin
  FListItens := TObjectList<TOrdemItem>.Create;
  try
   DaoOrdemItem
      .SQL
          .Fields('CONVERT(tbordens_itens.idtbordens_itens USING UTF8mb3) AS idtbordens_itens')
          .Fields(',CONVERT(tbordens_itens.idtbordens_cab USING UTF8mb3) AS idtbordens_cab')
          .Fields(',tbordens_itens.idtbproduto')
          .Fields(',tbprodutos.nome AS produto')
          .Fields(',tbordens_itens.item')
          .Fields(',tbordens_itens.qtde')
          .Fields(',FORMAT(tbordens_itens.precoTabela,2, "pt_BR") precoTabela')
          .Fields(',FORMAT(tbordens_itens.valorUnitario,2, "pt_BR") valorUnitario')
          .Fields(',FORMAT(tbordens_itens.percDesconto,2, "pt_BR") percDesconto')
          .Fields(',FORMAT(tbordens_itens.valorDesconto,2, "pt_BR") valorDesconto')
          .Fields(',FORMAT(tbordens_itens.percAcrescimo,2, "pt_BR") percAcrescimo')
          .Fields(',FORMAT(tbordens_itens.valorAcrescimo,2, "pt_BR") valorAcrescimo')
          .Fields(',FORMAT(tbordens_itens.totalBruto, 2, "pt_BR") totalBruto')
          .Fields(',FORMAT(tbordens_itens.totalLiquido, 2, "pt_BR") totalLiquido')
          .Fields(',(CASE WHEN (tbordens_itens.venda = '+QuotedStr('S')+') THEN '+QuotedStr('Sim')+' ELSE "" END) AS venda')
          .Fields(',(CASE WHEN (tbordens_itens.cancelado = '+QuotedStr('S')+') THEN '+QuotedStr('Sim')+' ELSE "" END) AS cancelado')
          .Fields(',(CASE WHEN (tbordens_itens.retirado = '+QuotedStr('S')+') THEN '+QuotedStr('Sim')+' ELSE "" END) AS retirado')
          .Fields(',(CASE WHEN (tbordens_itens.devolvido = '+QuotedStr('S')+') THEN '+QuotedStr('Sim')+' ELSE "" END) AS devolvido')
          .Join('INNER JOIN tbordens_cab ON tbordens_cab.idtbordens_cab = tbordens_itens.idtbordens_cab')
          .Join('INNER JOIN tbprodutos ON tbprodutos.idtbproduto = tbordens_itens.idtbproduto')
          .OrderBy('tbordens_itens.item')
        .Where('tbordens_itens.idtbordens_cab = ' + QuotedStr(aOrdem))
      .&End
   .Find(FListItens);

   vQtde  := 0;
   vTotal := 0;
   itensAlugados := 0;
    for OrdemItem in FListItens do
      begin
        if OrdemItem.cancelado = '' then
        begin
          vQtde  := vQtde + OrdemItem.qtde;
          vTotal := vTotal + OrdemItem.totalLiquido;
          if OrdemItem.venda = '' then
            itensAlugados := itensAlugados + 1;
        end;
      end;
    lblTotal.Caption := 'Qtde.: ' + CurrToStr(vQtde) + ' Total: ' + FormatCurr('###,###,##0.00', vTotal) + ' ';
  finally
    FreeAndNil(FListItens);
  end;
end;

procedure TfOrdens.ListaItensOrdem(dtInicio, dtFim : TDate; Produto, OrderBy, Direcao: String);
var
  strSQL : String;
begin

  FListItens := TObjectList<TOrdemItem>.Create;
  try
    DaoOrdemItem
      .SQL
        .Fields('CONVERT(tbordens_itens.idtbordens_cab USING utf8mb3) idtbordens_cab')
        .Fields(',tbprodutos.nome produto')
        .Fields(',tbordens_cab.dtdocumento')
        .Fields(',tbordens_cab.dtretirada')
        .Fields(',tbordens_cab.dtdevolucao')
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
       .Where(' AND tbprodutos.nome Like '+QuotedStr(Produto + '%'))
       .Where(strSQL)
       .OrderBy(' '+OrderBy+' '+Direcao)
      .&End
    .Find(FListItens);
  finally
    FreeAndNil(FListItens);
  end;
end;

procedure TfOrdens.ListaFantasias(Fantasia, OrderBy, Direcao: String);
var
  strSQL : String;
begin
    case FSituacao of
     ftRetirar:
       begin
        strSQL := ' AND tbordens_itens.retirado="N" AND tbordens_itens.devolvido="N" AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab WHERE tbordens_cab.estado IN ("F","A","D"))';
          if chbFiltraData.Checked then
            strSQL := strSQL + ' AND date(tbordens_cab.dtretirada) between ' + QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro1.Date)) +
            ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro2.Date));
       end;
     ftDevolver:
       begin
        strSQL := ' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="N" AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab WHERE tbordens_cab.estado IN ("F","A","D"))';
          if chbFiltraData.Checked then
            strSQL := strSQL + ' AND date(tbordens_cab.dtdevolucao) = ' + QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro1.Date)) +
            ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro2.Date));
       end;
     ftDevolvida:
      begin
        chbFiltraData.Checked := false;
        strSQL := ' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="S"  AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab WHERE tbordens_cab.estado IN ("D"))';
      end;
    end;

  FListItens := TObjectList<TOrdemItem>.Create;
  try
    DaoOrdemItem
      .SQL
        .Fields('CONVERT(tbordens_itens.idtbordens_itens USING utf8mb3) idtbordens_itens')
        .Fields(',CONVERT(tbordens_itens.idtbordens_cab USING utf8mb3) idtbordens_cab')
        .Fields(',tbprodutos.nome produto')
        .Fields(',tbordens_cab.dtdocumento')
        .Fields(',tbordens_cab.dtretirada')
        .Fields(',tbordens_cab.dtdevolucao')
        .Fields(',LPAD(tbordens_cab.controle, 6, "0") controle')
        .Fields(',tbclientes.nome cliente')
        .Fields(',(CASE WHEN tbordens_itens.retirado = "S" THEN "Sim" ELSE "Não" END) AS retirado')
        .Join('INNER JOIN tbordens_cab ON tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab')
        .Join('INNER JOIN tbprodutos ON tbordens_itens.idtbproduto = tbprodutos.idtbproduto')
        .Join('INNER JOIN tbclientes ON tbordens_cab.idtbcliente = tbclientes.idtbcliente')
       .Where('tbordens_cab.estado = "A"')
       .Where(' AND tbordens_itens.venda = "N"')
       .Where(' AND tbordens_itens.cancelado = "N"')
       .Where(' AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab FROM tbordens_cab WHERE tbordens_cab.estado IN ("F","A","D"))')
//       .Where(IfThen(chkMostraRetiradas.Checked,' AND tbordens_itens.retirado IN ("N","S")',' AND tbordens_itens.retirado = "N"'))
       .Where(' AND tbprodutos.nome Like '+QuotedStr(Fantasia + '%'))
       .Where(strSQL)
       .OrderBy(' '+OrderBy+' '+Direcao)
      .&End
    .Find(FListItens);
  finally
    FreeAndNil(FListItens);
  end;
end;

procedure TfOrdens.ListaOrdem(dtInicio, dtFim : TDate; idClieIni, idClieFim : Integer);
var
  strSQL : String;
begin

  case cbox_pesquisa.ItemIndex of
  0: strSQL := ' AND tbordens_cab.dtdocumento BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim));
  1: strSQL := ' AND tbordens_cab.dtretirada BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim));
  2: strSQL := ' AND tbordens_cab.dtdevolucao BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim));
  3: strSQL := ' AND tbordens_cab.dtdocumento BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim));
  end;

  FListOrdens := TObjectList<TOrdemCab>.Create;
  try
    DaoOrdemCab
          .SQL
              .Fields('CONVERT(idtbordens_cab USING utf8mb3) idtbordens_cab')
              .Fields(',tbordens_cab.idtbempresa')
              .Fields(',tbordens_cab.idfuncionario')
              .Fields(',LPAD(tbordens_cab.controle, 6, "0") controle')
              .Fields(',tbfuncionarios.nome atendente')
              .Fields(',tbordens_cab.idtbcliente')
              .Fields(',(CASE WHEN tbordens_cab.idtbcliente <> 999999 THEN tbclientes.nome')
              .Fields('       ELSE "CONSUMIDOR FINAL" END) AS cliente')
              .Fields(',tbordens_cab.dtdocumento')
              .Fields(',tbordens_cab.dtretirada')
              .Fields(',tbordens_cab.dtdevolucao')
              .Fields(',(CASE WHEN tbordens_cab.estado = '+QuotedStr('A')+' THEN '+QuotedStr('Aberta'))
              .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('F')+' THEN '+QuotedStr('Fechada'))
              .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('C')+' THEN '+QuotedStr('Cancelada'))
              .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('D')+' THEN '+QuotedStr('Devolvida')+' END) AS estado')
              .Fields(',(CASE WHEN tbordens_cab.retirada = '+QuotedStr('S')+' THEN '+QuotedStr('Sim')+' ELSE "" END) AS retirada')
              .Fields(',(SELECT IFNULL(SUM(tbi.qtde),0) FROM tbordens_itens tbi WHERE tbi.idtbordens_cab = tbordens_cab.idtbordens_cab AND tbi.cancelado = ''N'') pecas')
              .Fields(',(SELECT FORMAT(IFNULL(SUM(tbi.totalLiquido),0),2,"pt_BR") FROM tbordens_itens tbi WHERE tbi.idtbordens_cab = tbordens_cab.idtbordens_cab AND tbi.cancelado = ''N'') totalLiquido')
              .Fields(',tbordens_cab.dtcadastro')
              .Fields(',tbordens_cab.usercad')
              .Fields(',tbuser1.username usercadNome')
              .Fields(',tbordens_cab.dtalterado')
              .Fields(',tbordens_cab.useralt')
              .Fields(',tbuser2.username useraltNome')
              .Join('INNER JOIN tbempresas ON tbempresas.idtbempresa = tbordens_cab.idtbempresa')
              .Join('LEFT JOIN tbfuncionarios ON tbfuncionarios.idtbfuncionario = tbordens_cab.idfuncionario')
              .Join('LEFT JOIN tbclientes ON tbclientes.idtbcliente = tbordens_cab.idtbcliente')
              .Join('LEFT JOIN tbusuarios tbuser1 ON tbuser1.idtbusuario = tbordens_cab.usercad')
              .Join('LEFT JOIN tbusuarios tbuser2 ON tbuser2.idtbusuario = tbordens_cab.useralt')
           .Where('estado IN (''A'',''F'') ')
           .Where(' AND tbordens_cab.idtbcliente BETWEEN '+IntToStr(idClieIni)+' AND '+IntToStr(idClieFim))
           .Where(IfThen(chkOrdensRetiradas.Checked,' AND retirada IN ("N","S")',' AND retirada = "N"'))
           .Where(strSQL)
           .OrderBy('dtdocumento,controle,dtretirada')
          .&End
      .Find(FListOrdens);
  finally
    FreeAndNil(FListOrdens);
  end;
end;

procedure TfOrdens.ListaOrdem(aOrdem: String);
begin
  DaoOrdemCab
      .SQL
          .Fields('CONVERT(tbordens_cab.idtbordens_cab USING UTF8mb3) idtbordens_cab')
          .Fields(',tbordens_cab.idtbempresa')
          .Fields(',tbordens_cab.idfuncionario')
          .Fields(',tbordens_cab.controle')
          .Fields(',tbfuncionarios.nome atendente')
          .Fields(',tbordens_cab.idtbcliente')
          .Fields(',tbclientes.nome cliente')
          .Fields(',tbclientes.cep')
          .Fields(',tbclientes.endereco')
          .Fields(',tbclientes.nro')
          .Fields(',tbclientes.comp')
          .Fields(',tbclientes.bairro')
          .Fields(',tbclientes.cidade')
          .Fields(',tbclientes.uf')
          .Fields(',tbclientes.fone1')
          .Fields(',tbclientes.fone2')
          .Fields(',tbordens_cab.dtdocumento')
          .Fields(',tbordens_cab.dtretirada')
          .Fields(',tbordens_cab.dtdevolucao')
          .Fields(',tbordens_cab.observacao')
          .Fields(',tbempresas.obsaluguel')
          .Fields(',(CASE WHEN tbordens_cab.estado = '+QuotedStr('A')+' THEN '+QuotedStr('Aberta'))
          .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('F')+' THEN '+QuotedStr('Fechada'))
          .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('C')+' THEN '+QuotedStr('Cancelada'))
          .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('P')+' THEN '+QuotedStr('Pendente'))
          .Fields('       WHEN tbordens_cab.estado = '+QuotedStr('D')+' THEN '+QuotedStr('Devolvida')+' END) AS estado')
          .Fields(',(CASE WHEN tbordens_cab.retirada = '+QuotedStr('S')+' THEN '+QuotedStr('Sim')+' ELSE "" END) AS retirada')
          .Fields(',tbordens_cab.dtcadastro')
          .Fields(',tbordens_cab.usercad')
          .Fields(',tbuser1.username usercadNome')
          .Fields(',tbordens_cab.dtalterado')
          .Fields(',tbordens_cab.useralt')
          .Fields(',tbuser2.username useraltNome')
         .Where('tbordens_cab.idtbordens_cab = '+QuotedStr(aOrdem))
        .Join('INNER JOIN tbempresas ON tbempresas.idtbempresa = tbordens_cab.idtbempresa')
        .Join('LEFT JOIN tbfuncionarios ON tbfuncionarios.idtbfuncionario = tbordens_cab.idfuncionario')
        .Join('LEFT JOIN tbclientes ON tbclientes.idtbcliente = tbordens_cab.idtbcliente')
        .Join('LEFT JOIN tbusuarios tbuser1 ON tbuser1.idtbusuario = tbordens_cab.usercad')
        .Join('LEFT JOIN tbusuarios tbuser2 ON tbuser2.idtbusuario = tbordens_cab.useralt')
      .&End
    .Find;
end;

procedure TfOrdens.CancelarOrdem(aOrdem: String);
var
  OrdemCab : TOrdemCab;
  vQry     : TFDQuery;
begin
  OrdemCab        := TOrdemCab.Create;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  try
    With OrdemCab Do
      begin
        idtbordensCab := jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString;
        idtbEmpresa   := jvdsCab.DataSet.FieldByName('idtbempresa').Value;
        idFuncionario := jvdsCab.DataSet.FieldByName('idfuncionario').Value;
        idtbCliente   := jvdsCab.DataSet.FieldByName('idtbcliente').Value;
        nroControle   := jvdsCab.DataSet.FieldByName('controle').Value;
        dtDocumento   := jvdsCab.DataSet.FieldByName('dtdocumento').Value;
        dtRetirada    := jvdsCab.DataSet.FieldByName('dtretirada').Value;
        retirada      := jvdsCab.DataSet.FieldByName('retirada').AsString;
        dtDevolucao   := jvdsCab.DataSet.FieldByName('dtdevolucao').Value;
        observacao    := jvdsCab.DataSet.FieldByName('observacao').AsString;
        estado        := 'C';
        userCad       := jvdsCab.DataSet.FieldByName('usercad').Value;
        userAlt       := UserLog;
      end;

    vQry.SQL.Add('UPDATE tbordens_itens SET cancelado = "S" WHERE idtbordens_cab = :Ordem');
    vQry.Params.ParamByName('Ordem').AsString := jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString;
    vQry.ExecSQL;

    DaoOrdemCab.Update(OrdemCab);

    ListaOrdem('');
    ListaItensOrdem('');
    SetStatus(acComecando);
    jvcedt_produto.SetFocus;
  finally
    FreeAndNil(vQry);
    FreeAndNil(OrdemCab);
  end;
end;

procedure TfOrdens.chbFiltraDataClick(Sender: TObject);
begin
    jvdtpDataFiltro1.Enabled := TCheckBox(Sender).Checked;
    jvdtpDataFiltro2.Enabled := TCheckBox(Sender).Checked;

    ListaFantasias(
      ledt_produto2.Text,
      orderby,
      direcao);
end;

procedure TfOrdens.CancelarItem(aOrdemItem : String);
var
  OrdemItem : TOrdemItem;
begin
  // Validando
  if jvdsItens.DataSet.FieldByName('cancelado').AsString = 'Sim' then
    Abort;

  if vQtde = 1 then
    begin
      MsgAviso('Únido item da ordem. Cancelamento não permitido');
      Abort;
    end;

  OrdemItem := TOrdemItem.Create;
  try
    GetItemDataSet(OrdemItem, jvdsItens);
    OrdemItem.idtbordensItens := aOrdemItem;
    OrdemItem.idtbordensCab   := nroOrdem;
    OrdemItem.cancelado       := 'S';
    OrdemItem.userAlt         := UserLog;
    DaoOrdemItem.Update(OrdemItem);
    ListaItensOrdem(nroOrdem);
    jvcedt_produto.SetFocus;
  finally
    if Assigned(OrdemItem) then
      FreeAndNil(OrdemItem);
  end;
end;

procedure TfOrdens.AlterarItem(aOrdemItem: String);
var
  OrdemItem : TOrdemItem;
begin
  OrdemItem := TOrdemItem.Create;
  try
    GetItemDataSet(OrdemItem, jvdsItens);

    With OrdemItem Do
      begin
        idtbordensItens := aOrdemItem;
        idtbordensCab   := jvdsItens.DataSet.FieldByName('idtbordens_cab').AsString;
        idtbProduto     := StrToInt(jvcedt_produto.Text);
        qtde            := jvsedt_qtde.Value;
        precoTabela     := StrToCurr(SomenteNumero('.,',ledt_valorUnitario.Text))/100;
        valorUnitario   := jvedt_valorUnitario.Value;
        if descacre = 'desconto' then
        begin
          percDesconto   := jvedt_percDesconto.Value;
          valorDesconto  := qtde * (jvedt_valorDesconto.Value *(-1));
          percAcrescimo  := 0;
          valorAcrescimo := 0;
        end
        else
        begin
          percDesconto   := 0;
          valorDesconto  := 0;
          percAcrescimo  := jvedt_percDesconto.Value;
          valorAcrescimo := qtde *jvedt_valorDesconto.Value;
        end;
        totalBruto      := precoTabela * qtde;
        totalLiquido    := valorUnitario * qtde;
        dtretirada      := jvdsCab.DataSet.FieldByName('dtretirada').Value;
        userAlt         := UserLog;
      end;
    DaoOrdemItem.Update(OrdemItem);
    ListaItensOrdem(nroOrdem);
    sbtn_addItem.Caption := 'Adicionar Item';
    SetStatus(acInserindo);
    jvcedt_produto.Clear;
    jvcedt_produto.SetFocus;
  finally
    FreeAndNil(OrdemItem);
  end;
end;

procedure TfOrdens.ListaOrdemPagtos(aOrdem : String);
var
  OrdemPagto : TOrdemPagto;
begin
  FListPagtos := TObjectList<TOrdemPagto>.Create;
  Try
  DaoOrdemPagto
    .SQL
      .Fields('CONVERT(tbordens_pagto.idtbordens_pagto USING utf8mb3) idtbordens_pagto ')
      .Fields(',CONVERT(tbordens_pagto.idtbordens_cab USING utf8mb3) idtbordens_cab ')
      .Fields(',CONVERT(tbordens_pagto.idtbformas_pagto USING utf8mb3) idtbformas_pagto ')
      .Fields(',tbformas_pagto.descricao')
      .Fields(',FORMAT(tbordens_pagto.valor, 2, "pt_BR") valor')
     .Join('INNER JOIN tbformas_pagto ON tbformas_pagto.idtbformas_pagto = tbordens_pagto.idtbformas_pagto')
     .Where('tbordens_pagto.idtbordens_cab = ' + QuotedStr(aOrdem))
    .&End
  .Find(FListPagtos);

  vPagto := 0;

  for OrdemPagto in FListPagtos do
      begin
        vPagto := vPagto + OrdemPagto.valor;
      end;
  lblPagto.Caption := 'Total a Pagar: '+FormatCurr('###,###,##0.00', vTotal)+' | Recebido: '+FormatCurr('###,###,##0.00',vPagto);
  Finally
    FreeAndNil(FListPagtos);
  End;
end;

procedure TfOrdens.InserirPagto;
var
  OrdemPagto : TOrdemPagto;
begin
  OrdemPagto := TOrdemPagto.Create;
  Try
    With OrdemPagto Do
      begin
        idtbOrdensPagto := uRotinas.GuidCreate;
        idtbOrdensCab   := nroOrdem;
        idtbFormasPagto := jvdbPagto.KeyValue;
        valor           := jvedt_valorPagto.Value;
      end;
    DaoOrdemPagto.Insert(OrdemPagto);
    ListaOrdemPagtos(nroOrdem);
  Finally
    FreeAndNil(OrdemPagto);
  End;
end;

procedure TfOrdens.SwitchDescVenda(modo: String);
begin

  if inibeAcresc then
    begin
      MsgAviso('Opção acrescimo encontra-se bloqueda!');
      Abort;
    end;

  if modo = 'desconto' then
    begin
      descacre                             := 'acrescimo';
      ledt_percDesconto.EditLabel.Caption  := '% Acrescimo';
      ledt_valorDesconto.EditLabel.Caption := 'R$ Acrescimo';
    end
  else
    begin
      descacre                             := 'desconto';
      ledt_percDesconto.EditLabel.Caption  := '% Desconto';
      ledt_valorDesconto.EditLabel.Caption := 'R$ Desconto';
    end;
end;

procedure TfOrdens.SwitchVenda(aOrdemItem: String);
var
  OrdemItem : TOrdemItem;
  vQry      : TFDquery;
begin
  OrdemItem := TOrdemItem.Create;
  try
    GetItemDataSet(OrdemItem, jvdsItens);
    OrdemItem.idtbordensItens := aOrdemItem;
    if OrdemItem.venda = 'N' then
      begin
        try
          vQry            := TFDQuery.Create(nil);
          vQry.Connection := Controle.Conexao.GetConexao;
          vQry.Open('SELECT vlrvenda as valor FROM tbprodutos WHERE idtbproduto = '+OrdemItem.idtbProduto.ToString);

          OrdemItem.precoTabela   := vQry.FieldByName('valor').Value;
          OrdemItem.valorUnitario := vQry.FieldByName('valor').Value ;
        finally
          FreeAndNil(vQry);
        end;
        OrdemItem.venda := 'S';
      end
    else
      begin
        try
          vQry            := TFDQuery.Create(nil);
          vQry.Connection := Controle.Conexao.GetConexao;
          vQry.Open('SELECT vlraluguel as valor FROM tbprodutos WHERE idtbproduto = '+OrdemItem.idtbProduto.ToString);

          OrdemItem.precoTabela   := vQry.FieldByName('valor').Value;
          OrdemItem.valorUnitario := vQry.FieldByName('valor').Value;
        finally
          FreeAndNil(vQry);
        end;
        OrdemItem.venda := 'N';
      end;

    if descacre = 'desconto' then
      OrdemItem.valorUnitario := OrdemItem.precoTabela - (OrdemItem.valorDesconto*(-1))
    else
      OrdemItem.valorUnitario := OrdemItem.precoTabela + OrdemItem.valorAcrescimo;

    OrdemItem.totalBruto   := OrdemItem.qtde * OrdemItem.precoTabela;
    OrdemItem.totalLiquido := OrdemItem.qtde * OrdemItem.valorUnitario;

    DaoOrdemItem.Update(OrdemItem);
    ListaItensOrdem(nroOrdem);
  finally
    FreeAndNil(OrdemItem);
  end;
end;

procedure TfOrdens.ExcluiPagto(aOrdemPagto, aOrdem, aIdFormaPagto: String);
var
  OrdemPagto : TOrdemPagto;
begin
  OrdemPagto := TOrdemPagto.Create;
  try
    With OrdemPagto Do
      begin
        idtbOrdensPagto := aOrdemPagto;
        idtbOrdensCab   := aOrdem;
        idtbFormasPagto := aIdFormaPagto;
      end;
    DaoOrdemPagto.Delete(OrdemPagto);
    ListaOrdemPagtos(nroOrdem);
  finally
    FreeAndNil(OrdemPagto);
  end;
end;

procedure TfOrdens.FinalizaOrdem(aOrdemCab: String);
var
  OrdemCab : TOrdemCab;
  vQry     : TFDQuery;
begin
  OrdemCab        := TOrdemCab.Create;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  try
    try
      vQry.Open('SELECT idtbfuncionario FROM tbfuncionarios WHERE codigo='+jvcedt_atendente.Text);
      With OrdemCab Do
        begin
          idtbordensCab := aOrdemCab;
          idtbEmpresa   := EmpLog;
          idFuncionario := vQry.FieldByName('idtbfuncionario').Value; //StrToInt(jvcedt_atendente.Text);
          idtbCliente   := StrToInt(jvcedt_cliente.Text);
          nroControle   := jvdsCab.DataSet.FieldByName('controle').AsInteger;
          dtDocumento   := dtEmissao;
          dtRetirada    := jvdt_dtretirada.Date;
          if jvdt_dtretirada.Date = Date then
            retirada    := 'S'
          else
           if (jvdt_dtretirada.Date <> Date) and ( ordemRetirada = true ) then
             retirada   := 'S'
           else
            retirada    := 'N';
          dtDevolucao   := jvdt_dtdevolucao.Date;
          observacao    := mem_obs.Text;
          if itensAlugados = 0 then
            estado      := 'F'
          else
            estado      := 'A';
          userCad       := UserLog;
          userAlt       := UserLog;
        end;
      DaoOrdemCab.Update(OrdemCab);

      //Atualizando informações nos itens
      With vQry Do
        begin
          SQL.Clear;
          SQL.Add('UPDATE tbordens_itens SET');
          SQL.Add('dtretirada = :dtretirada,');
          SQL.Add('retirado = :retirado');
          SQL.Add('WHERE idtbordens_cab = :idtbordens_cab');
          ParamByName('dtretirada').Value := jvdt_dtretirada.Date;
          if jvdt_dtretirada.Date = Date then
            ParamByName('retirado').AsString := 'S'
          else
            ParamByName('retirado').AsString := 'N';
          ParamByName('idtbordens_cab').Value := nroOrdem;
          ExecSQL;
        end;

    except on E: exception do
        begin
          MsgErro(E.Message);
          Abort;
        end;
    end;
  finally
    FreeAndNil(vQry);
    FreeAndNil(OrdemCab);
  end;
end;

procedure TfOrdens.MovEstoqueKardex(nIdProduto, nQtd, nTipo: Integer; nDocumento : String);
var
  vQry : TFDQuery;
begin
  // nTipo -> 0-Inclusão,1-Ajuste (+),2-Ajuste (-),3-Saida,4-Anulação Saída,5-Reserva,6-Anulação Reserva,7-Devolução,8-Anulação Devolução

  vQry := TFDQuery.Create(nil);

  case nTipo of
    2,3,5,8 : nQtd := nQtd * -1;
  end;

  try
    vQry.Connection := Controle.Conexao.GetConexao;
    With vQry Do
      begin
        Close;
        SQL.Clear;
        SQL.Add('REPLACE INTO tbestoque(');
        SQL.Add('idtbempresa,');
        SQL.Add('idtbproduto,');
        SQL.Add('qtde');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':idtbproduto,');
        SQL.Add('((SELECT IFNULL(SUM(tbe.qtde),0) FROM tbestoque tbe WHERE tbe.idtbempresa = :idtbempresa AND tbe.idtbproduto = :idtbproduto) + :qtde))');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('idtbproduto').Value := nIdProduto;
        ParamByName('qtde').Value        := nQtd;
        ExecSQL;

        // Se qtde negativa fazendo calculo para positivar
        if nQtd < 0 then
          nQtd := nQtd * -1;

        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbkardex(');
        SQL.Add('idtbempresa,');
        SQL.Add('documento,');
        SQL.Add('idtbproduto,');
        SQL.Add('tipo,');
        SQL.Add('qtde,');
        SQL.Add('usercad');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':documento,');
        SQL.Add(':idtbproduto,');
        SQL.Add(':tipo,');
        SQL.Add(':qtde,');
        SQL.Add(':usercad)');
        ParamByName('idtbempresa').Value  := EmpLog;
        ParamByName('documento').AsString := nDocumento;
        ParamByName('idtbproduto').Value  := nIdProduto;
        ParamByName('tipo').Value         := nTipo;
        ParamByName('qtde').Value         := nQtd;
        ParamByName('usercad').Value      := UserLog;
        ExecSQL;
      end;
  finally
    FreeAndNil(vQry);
  end;
end;

procedure TfOrdens.ManutencaoOrdem(aOrdem: String);
begin
    // Listando a Ordem e Itens
    ListaOrdem(aOrdem);
    ListaItensOrdem(aOrdem);

    SetStatus(acAtualizando);
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance,'refresh');

    dtEmissao                    := jvdsCab.DataSet.FieldByName('dtdocumento').Value;
    jvcedt_atendente.Text        := jvdsCab.DataSet.FieldByName('idfuncionario').AsString;
    jvcedt_atendente.Enabled     := False;
    jvcedt_cliente.Text          := jvdsCab.DataSet.FieldByName('idtbcliente').AsString;
    nroOrdem                     := aOrdem;

    jvdt_dtretirada.Date         := jvdsCab.DataSet.FieldByName('dtretirada').Value;
    jvdt_dtdevolucao.Date        := jvdsCab.DataSet.FieldByName('dtdevolucao').Value;
    mem_obs.Text                 := jvdsCab.DataSet.FieldByName('observacao').AsString;
    if (jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim') then
      begin
      ordemRetirada                := true;    
      jvdt_dtretirada.Enabled      := False;
      jvcedt_cliente.Enabled       := False;
      PageControl1.ActivePageIndex := 1;
      end
    else
      begin
      ordemRetirada                := false;
      PageControl1.ActivePageIndex := 0;
      end;
end;

procedure TfOrdens.RetirarOrdem(aOrdemCab: String);
var
  OrdemCab : TOrdemCab;
  vQry     : TFDQuery;
begin
  OrdemCab        := TOrdemCab.Create;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  try
    try
      With OrdemCab Do
        begin
          idtbordensCab := aOrdemCab;
          idtbEmpresa   := jvdsCab.DataSet.FieldByName('idtbempresa').Value;
          idFuncionario := jvdsCab.DataSet.FieldByName('idfuncionario').Value;
          idtbCliente   := jvdsCab.DataSet.FieldByName('idtbcliente').Value;
          nroControle   := jvdsCab.DataSet.FieldByName('controle').AsInteger;
          dtDocumento   := jvdsCab.DataSet.FieldByName('dtdocumento').Value;
          dtRetirada    := Date();
          dtDevolucao   := jvdsCab.DataSet.FieldByName('dtdevolucao').Value;
          retirada      := 'S';
          observacao    := mem_obs.Text;
          case AnsiIndexStr(jvdsCab.DataSet.FieldByName('estado').AsString, ['Aberta', 'Fechada', 'Cancelada', 'Pendente', 'Devolvida']) of
            0: estado := 'A';
            1: estado := 'F';
            2: estado := 'C';
            3: estado := 'P';
            4: estado := 'D';
          end;
          userCad     := jvdsCab.DataSet.FieldByName('usercad').Value;
          userAlt     := UserLog;
        end;
      DaoOrdemCab.Update(OrdemCab);

      With vQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbordens_itens SET retirado = "S"');
          SQL.Add('WHERE idtbordens_cab = :ordem');
          ParamByName('ordem').AsString := aOrdemCab;
          ExecSQL;
        End;

     sbtn_pesquisar1.Click;

     jvdsCab.DataSet.Locate('idtbordens_cab', nroOrdem, []);

    except on E: exception do
      begin
        MsgErro(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(vQry);
    FreeAndNil(OrdemCab);
  end;
end;

procedure TfOrdens.DevolverOrdem(aOrdemCab : String);
var
  OrdemCab : TOrdemCab;
  vQry     : TFDQuery;
begin
  OrdemCab        := TOrdemCab.Create;
  vQry            := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  try
    try
      With OrdemCab Do
        begin
          idtbordensCab := aOrdemCab;
          idtbEmpresa   := jvdsCab.DataSet.FieldByName('idtbempresa').Value;
          idFuncionario := jvdsCab.DataSet.FieldByName('idfuncionario').Value;
          idtbCliente   := jvdsCab.DataSet.FieldByName('idtbcliente').Value;
          nroControle   := jvdsCab.DataSet.FieldByName('controle').AsInteger;
          dtDocumento   := jvdsCab.DataSet.FieldByName('dtdocumento').Value;
          dtRetirada    := jvdsCab.DataSet.FieldByName('dtretirada').Value;
          dtDevolucao   := jvdsCab.DataSet.FieldByName('dtdevolucao').Value;
          retirada      := 'S';
          observacao    := mem_obs.Text;
          estado        := 'D';
          userCad       := jvdsCab.DataSet.FieldByName('usercad').Value;
          userAlt       := UserLog;
        end;
      DaoOrdemCab.Update(OrdemCab);

      With vQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE tbordens_itens SET retirado = '+QuotedStr('S')+',devolvido = '+QuotedStr('S'));
          SQL.Add('WHERE idtbordens_cab = :ordem');
          ParamByName('ordem').AsString := aOrdemCab;
          SQL.SaveToFile('D:\comando.txt');
          ExecSQL;
        End;

      sbtn_pesquisar1.Click;

      jvdsCab.DataSet.Locate('idtbordens_cab', nroOrdem, []);

    except on E: exception do
      begin
        MsgErro(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(vQry);
    FreeAndNil(OrdemCab);
  end;
end;

procedure TfOrdens.ImprimirComprovante(aOrdemCab : String);
var
  Controle    : TControle;
  vQry,
  vQryCab,
  vQryItem    : TFDQuery;
  condpagto,
  imp_bobina  : String;
  mMemo       : TMemo;
  comp_bobina : Boolean;
begin
  Controle            := TControle.Create;
  mMemo               := TMemo.Create(self);
  vQry                := TFDQuery.Create(nil);
  vQryCab             := TFDQuery.Create(nil);
  vQryItem            := TFDQuery.Create(nil);  
  vQry.Connection     := Controle.Conexao.GetConexao;
  vQryCab.Connection  := Controle.Conexao.GetConexao;
  vQryItem.Connection := Controle.Conexao.GetConexao;

  frxDBCab.DataSet                   := vQryCab;
  frxDBItem.DataSet                  := vQryItem;
  frxReport.ReportOptions.CreateDate := Date();
  frxReport.ReportOptions.LastChange := Date();
  frxReport.ReportOptions.Author     := NameUser;

  Try
    With vQryCab Do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('(CASE WHEN CHAR_LENGTH(tbclientes.nome) > 0 THEN tbclientes.nome ELSE "CONSUMIDOR FINAL" END) as cliente');
        SQL.Add(',tbordens_cab.dtdocumento');
        SQL.Add(',LPAD(tbordens_cab.controle, 5, "0") AS controle');
        SQL.Add(',tbordens_cab.dtretirada');
        SQL.Add(',tbordens_cab.dtdevolucao');
        SQL.Add(',tbfuncionarios.abreviatura AS atendente');
        SQL.Add(',tbclientes.endereco');
        SQL.Add(',tbclientes.nro');
        SQL.Add(',tbclientes.bairro');
        SQL.Add(',tbclientes.cidade');
        SQL.Add(',tbclientes.uf');
        SQL.Add(',tbclientes.fone1');
        SQL.Add(',tbclientes.fone2');
        SQL.Add(',tbclientes.cpf_cnpj AS cpf');
        SQL.Add(',tbclientes.rg_insc AS rg');
        SQL.Add(',tbclientes.obs AS obs');
        SQL.Add(',(SELECT SUM(qtde) FROM tbordens_itens WHERE tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab AND tbordens_itens.cancelado = ''N'') AS pecas');
        SQL.Add(',(SELECT SUM(totalLiquido) FROM tbordens_itens WHERE tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab AND tbordens_itens.cancelado = ''N'') As totalLiquido');
        SQL.Add(',tbordens_cab.observacao');
        SQL.Add('FROM tbordens_cab');
        SQL.Add('LEFT JOIN tbclientes ON tbordens_cab.idtbcliente = tbclientes.idtbcliente');
        SQL.Add('INNER JOIN tbfuncionarios ON tbordens_cab.idfuncionario = tbfuncionarios.idtbfuncionario');
        SQL.Add('WHERE tbordens_cab.idtbordens_cab = :ordem');
        ParamByName('ordem').AsString := aOrdemCab;
        Open;
      end;

    With vQryItem Do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('item');
        SQL.Add(',tbprodutos.nome AS produto');
        SQL.Add(',(CASE WHEN tbprodutos.tipo = 0 THEN "Fantasia Masculina"');
        SQL.Add('       WHEN tbprodutos.tipo = 1 THEN "Fantasia Feminina"');
        SQL.Add('       WHEN tbprodutos.tipo = 2 THEN "Fantasia Infantil"');
        SQL.Add('       WHEN tbprodutos.tipo = 3 THEN "Mascaras"');
        SQL.Add('       WHEN tbprodutos.tipo = 4 THEN "Perucas"');
        SQL.Add('       WHEN tbprodutos.tipo = 5 THEN "Acessórios"');
        SQL.Add('       ELSE "Mágica e Outros" END) AS tipo');
        SQL.Add(',tbordens_itens.qtde');
        SQL.Add(',tbordens_itens.precoTabela');
        SQL.Add(',tbordens_itens.percDesconto');
        SQL.Add(',tbordens_itens.valorDesconto');
        SQL.Add(',tbordens_itens.totalLiquido');
        SQL.Add(',(CASE WHEN tbordens_itens.cancelado = ''S'' THEN "Sim" ELSE "" END) AS cancelado');
        SQL.Add(',(CASE WHEN tbordens_itens.venda = ''S'' THEN "Sim" ELSE "" END) AS venda');
        SQL.Add('FROM tbordens_itens');
        SQL.Add('INNER JOIN tbprodutos ON tbordens_itens.idtbproduto = tbprodutos.idtbproduto');
        SQL.Add('WHERE tbordens_itens.idtbordens_cab = :ordem');
//        SQL.Add(' AND tbordens_itens.cancelado = ''N''');
        SQL.Add('ORDER BY tbordens_itens.item');
        ParamByName('ordem').AsString := aOrdemCab;
        Open;
      end;

    vQry.Open('SELECT imp_bobina, comp_bobina FROM tbparametros');

    imp_bobina  := vQry.Fields[0].AsString;
    comp_bobina := Boolean(vQry.Fields[1].Value);

    if comp_bobina then
      frxReport.LoadFromFile(LoadReportStream('rptordemAluguel','rptCompAluguel.fr3'))
    else
     frxReport.LoadFromFile(LoadReportStream('rptcompaluguel_a4','rptCompAluguelA4.fr3'));

      //rptcompaluguel_a4
    frxReport.PrintOptions.ShowDialog := False;
    frxReport.PrintOptions.Printer    := imp_bobina;
    frxReport.PrintOptions.Copies     := 2;

    With vQry Do
      begin
      
        Close;
        SQL.Clear;
        SQL.Add('SELECT count(*) alugados');
        SQL.Add('FROM tbordens_itens');
        SQL.Add('WHERE venda = ''N''');
        SQL.Add(' AND idtbordens_cab = :ordem');
        SQL.Add(' AND tbordens_itens.cancelado = ''N''');
        ParamByName('ordem').AsString := aOrdemCab;
        Open;

        itensAlugados := FieldByName('alugados').Value;

        if itensAlugados > 0 then
          begin
            if comp_bobina then
              frxReport.LoadFromFile(LoadReportStream('rptordemAluguel','rptCompAluguel.fr3'))
            else
              frxReport.LoadFromFile(LoadReportStream('rptcompaluguel_a4','rptCompAluguelA4.fr3'));
          end
        else
          begin
            if comp_bobina then
              frxReport.LoadFromFile(LoadReportStream('rptcompordemvenda','rptCompVenda.fr3'))
            else
              frxReport.LoadFromFile(LoadReportStream('rptcompvenda_a4','rptCompVendaA4.fr3'));
          end;

        frxReport.PrintOptions.ShowDialog := False;
        frxReport.PrintOptions.Printer    := imp_bobina;
        frxReport.PrintOptions.Copies     := StrToInt(IfThen(itensAlugados > 0, '2', '1'));

        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('fantasia AS nomeFantasia');
        SQL.Add(',endereco');
        SQL.Add(',nro');
        SQL.Add(',bairro');
        SQL.Add(',cidade');
        SQL.Add(',uf');
        SQL.Add(',fone1');
        SQL.Add(',fone2');
        SQL.Add(',obsaluguel');
        SQL.Add(' FROM tbempresas');
        SQL.Add(' WHERE idtbempresa = :empresa');
        ParamByName('empresa').Value := EmpLog;
        Open;
      end;

    frxReport.Variables['empFantasia'] := QuotedStr(vQry.FieldByName('nomeFantasia').AsString);
    frxReport.Variables['empEndLine1'] := QuotedStr(vQry.FieldByName('endereco').AsString+
                                          ','+vQry.FieldByName('nro').AsString);
    frxReport.Variables['empEndLine2'] := QuotedStr(vQry.FieldByName('bairro').AsString+
                                          ' - '+vQry.FieldByName('cidade').AsString+
                                          '/'+vQry.FieldByName('uf').AsString);
    frxReport.Variables['empFone1']    := QuotedStr(vQry.FieldByName('fone1').AsString);
    frxReport.Variables['empFone2']    := QuotedStr(vQry.FieldByName('fone2').AsString);
    if itensAlugados > 0 then
      begin
        if comp_bobina then
          frxReport.Variables['regras']      := QuotedStr(vQry.FieldByName('obsaluguel').AsString)
        else
          frxReport.Variables['regras']      := StringReplace(StringReplace(QuotedStr(QuotedStr(vQry.FieldByName('obsaluguel').AsString)), #$D#$A, ' ', [rfReplaceAll]), #13#10, ' ', [rfReplaceAll])
      end
    else
      frxReport.Variables['regras']      :=  QuotedStr('');

    With vQry Do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('tbformas_pagto.descricao');
        SQL.Add(',valor');
        SQL.Add('FROM tbordens_pagto');
        SQL.Add('INNER JOIN tbformas_pagto ON tbordens_pagto.idtbformas_pagto = tbformas_pagto.idtbformas_pagto');
        SQL.Add('WHERE idtbordens_cab = :ordem');
        ParamByName('ordem').AsString := aOrdemCab;
        Open;     

        mMemo.Parent  := Self;
        mMemo.Visible := False;
        mMemo.Lines.Add('');

        if RecordCount > 1 then
          begin
            condpagto := ';' + FieldByName('descricao').AsString;
            mMemo.Lines.Add(FieldByName('descricao').AsString);
            Next;
            if not Eof then
              repeat
               condpagto := condpagto + ', ' + ';' + FieldByName('descricao').AsString;
               mMemo.Lines.Add(FieldByName('descricao').AsString);
               Next;
              until Eof;
          end
        else
          begin
          condpagto := FieldByName('descricao').AsString;
          mMemo.Lines.Add(FieldByName('descricao').AsString);
          end;
      end;

      if comp_bobina then
        frxReport.Variables['condPagto'] := QuotedStr(mMemo.Text)
      else
        frxReport.Variables['condPagto'] := StringReplace(StringReplace(QuotedStr(mMemo.Text), #$D#$A, '|', [rfReplaceAll]), #13#10, '|', [rfReplaceAll]);
    frxReport.PrepareReport;
    frxReport.ShowReport;
//    frxReport.Print;
  Finally
    FreeAndNil(mMemo);
    FreeAndNil(vQry);
    FreeAndNil(vQryCab);
    FreeAndNil(vQryItem);
    FreeAndNil(Controle);
  End;
end;

procedure TfOrdens.ImprimirOrdens(dtEmissaoIni, dtEmissaoFim : TDate);
var
  Controle           : TControle;
  vQry,
  vQryCab            : TFDQuery;
  totalDinheiro,
  totalCartaoDeb,
  totalCartaoCred,
  totalChqAvista,
  totalChqAprazo,
  totalPicPay,
  totalPix,
  totalDeposito,
  totalTransf        : Currency;
begin
  Controle            := TControle.Create;
  vQry                := TFDQuery.Create(nil);
  vQryCab             := TFDQuery.Create(nil);
  vQry.Connection     := Controle.Conexao.GetConexao;
  vQryCab.Connection  := Controle.Conexao.GetConexao;

  frxDBCab.DataSet                   := vQryCab;
  frxReport.ReportOptions.CreateDate := Date();
  frxReport.ReportOptions.LastChange := Date();
  frxReport.ReportOptions.Author     := NameUser;

  frxReport.LoadFromFile(LoadReportStream('rptdataOrdens',
  'rptDataAlugueis.fr3'));

  Try
    With vQryCab Do
      begin

      {$REGION 'Somando das condições'}

        // *** Zerando variáveis
        totalDinheiro   := 0;
        totalCartaoDeb  := 0;
        totalCartaoCred := 0;
        totalChqAvista  := 0;
        totalChqAprazo  := 0;
        totalPicPay     := 0;
        totalPix        := 0;
        totalDeposito   := 0;
        totalTransf     := 0;

        frxReport.Variables['itens_alugados']   := 0;
        frxReport.Variables['itens_vendidos']   := 0;

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as fundo FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)));
        SQL.Add('AND tpmov = "Fundo"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['fundoscx'] :=
          StringReplace(FieldByName('fundo').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(SUM(valor),0) as suprimento FROM tbcaixa');
        SQL.Add('WHERE date(dtemissao) BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)));
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
        SQL.Add('WHERE date(dtemissao) BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)));
        SQL.Add('AND tpmov = "Sangria"');
        SQL.Add('AND cancelado = 0');
        Open;
        frxReport.Variables['sangrias'] :=
          StringReplace(FieldByName('sangria').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT dtdocumento, condicao, ifnull(sum(valor),0) AS valor FROM vw_ordens_pagto');
        SQL.Add('WHERE date(dtdocumento) BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)));
        SQL.Add('AND estado IN (''A'',''F'') GROUP BY dtdocumento, controle, condicao ORDER BY dtdocumento, controle');
        Open;
        if Not IsEmpty then
          begin
            if Not Eof then
              repeat
                  case AnsiIndexStr(UpperCase(FieldByName('condicao').AsString),
                    ['DINHEIRO',
                    'CARTÃO DÉBITO',
                    'CARTÃO CRÉDITO',
                    'CHEQUE Á VISTA',
                    'CHEQUE Á PRAZO',
                    'PIX',
                    'PIC-PAY',
                    'DEPÓSITO BANCÁRIO',
                    'TRANSF. BANCÁRIA']) of
                    0: totalDinheiro   := totalDinheiro + FieldByName('valor').Value;
                    1: totalCartaoDeb  := totalCartaoDeb + FieldByName('valor').Value;
                    2: totalCartaoCred := totalCartaoCred + FieldByName('valor').Value;
                    3: totalChqAvista  := totalChqAvista + FieldByName('valor').Value;
                    4: totalChqAprazo  := totalChqAprazo + FieldByName('valor').Value;
                    5: totalPix        := totalPix +FieldByName('valor').Value;
                    6: totalPicPay     := totalPicPay + FieldByName('valor').Value;
                    7: totalDeposito   := totalDeposito + FieldByName('valor').Value;
                    8: totalTransf     := totalTransf + FieldByName('valor').Value;
                  end;
                Next;
              until Eof;

            // Setando resultados nas variáveis
            frxReport.Variables['totalDinheiro']   := QuotedStr(FormatFloat('###,###,##0.00',totalDinheiro));
            frxReport.Variables['totalCartaoDeb']  := QuotedStr(FormatFloat('###,###,##0.00',totalCartaoDeb));
            frxReport.Variables['totalCartaoCred'] := QuotedStr(FormatFloat('###,###,##0.00',totalCartaoCred));
            frxReport.Variables['totalChqAvista']  := QuotedStr(FormatFloat('###,###,##0.00',totalChqAvista));
            frxReport.Variables['totalChqAprazo']  := QuotedStr(FormatFloat('###,###,##0.00',totalChqAprazo));
            frxReport.Variables['totalPix']        := QuotedStr(FormatFloat('###,###,##0.00',totalPix));
            frxReport.Variables['totalPicPay']     := QuotedStr(FormatFloat('###,###,##0.00',totalPicPay));
            frxReport.Variables['totalDeposito']   := QuotedStr(FormatFloat('###,###,##0.00',totalDeposito));
            frxReport.Variables['totalTransf']     := QuotedStr(FormatFloat('###,###,##0.00',totalTransf));

            frxReport.Variables['totalGeral']      := QuotedStr(FormatFloat('###,###,##0.00',
                                                      totalDinheiro+
                                                      totalCartaoDeb+
                                                      totalCartaoCred+
                                                      totalChqAvista+
                                                      totalChqAprazo+
                                                      totalPix+
                                                      totalPicPay+
                                                      totalDeposito+
                                                      totalTransf+
                                                      totalTransf));
          end;

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(COUNT(*),0) AS itens_alugados FROM tbordens_itens tboi');
        SQL.Add('WHERE tboi.idtbordens_cab IN (SELECT tboc.idtbordens_cab FROM tbordens_cab tboc WHERE date(tboc.dtdocumento) BETWEEN '+
                QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+
                QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim))+' AND estado IN (''A'',''F'') )');
        SQL.Add(' AND tboi.cancelado = "N" and tboi.venda = "N" ');
        Open;

        frxReport.Variables['itens_alugados'] :=
          StringReplace(FieldByName('itens_alugados').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

        Close;
        SQL.Clear;
        SQL.Add('SELECT IFNULL(COUNT(*),0) AS itens_vendidos FROM tbordens_itens tboi');
        SQL.Add('WHERE tboi.idtbordens_cab IN (SELECT tboc.idtbordens_cab FROM tbordens_cab tboc WHERE date(tboc.dtdocumento) BETWEEN '+
                QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+
                QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim))+' AND estado IN (''A'',''F'') )');
        SQL.Add(' AND tboi.cancelado = "N" and tboi.venda = "S" ');
        Open;

        frxReport.Variables['itens_vendidos'] :=
          StringReplace(FieldByName('itens_vendidos').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);

      {$ENDREGION}

        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('CONVERT(tboc.idtbordens_cab USING utf8mb3) idtbordens_cab,');
        SQL.Add('LPAD(tboc.controle, 5, "0") AS controle,');
        SQL.Add('tboc.dtdocumento,');
        SQL.Add('tboc.dtretirada,');
        SQL.Add('tboc.dtdevolucao,');
        SQL.Add('tbfu.nome as atendente,');
        SQL.Add('ifnull(tbcli.nome,''CONSUMIDOR FINAL'') as cliente,');
        SQL.Add('(CASE WHEN tboc.estado = ''A'' THEN ''Aberta''');
        SQL.Add('      WHEN tboc.estado = ''D'' THEN ''Devolvida''');
        SQL.Add('      WHEN tboc.estado = ''F'' THEN ''Finalizada''');
        SQL.Add('      WHEN tboc.estado = ''C'' THEN ''Cancelada'' END) as estado,');
        SQL.Add('(SELECT SUM(tboi.qtde) FROM tbordens_itens tboi WHERE tboc.idtbordens_cab = tboi.idtbordens_cab AND tboi.cancelado = "N") AS qtdeTotal,');
        SQL.Add('(SELECT SUM(tboi.totalLiquido) FROM tbordens_itens tboi WHERE tboc.idtbordens_cab = tboi.idtbordens_cab AND tboi.cancelado = "N") AS totalOrdem,');
        SQL.Add('select_formapagto(tboc.idtbordens_cab) AS forma_pagto,');
        SQL.Add('tboi.item,');
        SQL.Add('tbpr.nome AS produto,');
        SQL.Add('(CASE tbpr.tipo');
        SQL.Add('      WHEN 0 THEN "Fantasia Masculina" ');
        SQL.Add('      WHEN 1 THEN "Fantasia Feminina" ');
        SQL.Add('      WHEN 2 THEN "Fantasia Infantil" ');
        SQL.Add('      WHEN 3 THEN "Mascaras" ');
        SQL.Add('      WHEN 4 THEN "Perucas" ');
        SQL.Add('      WHEN 5 THEN "Acessórios" ');
        SQL.Add('      ELSE "Mágica e Outros" END) AS tipo,');
        SQL.Add('tboi.qtde,');
        SQL.Add('tboi.valorUnitario,');
        SQL.Add('tboi.percDesconto,');
        SQL.Add('tboi.valorDesconto,');
        SQL.Add('tboi.totalLiquido,');
        SQL.Add('(CASE WHEN tboi.cancelado = "S" THEN ''Sim'' ELSE '''' END) AS cancelado,');
        SQL.Add('(CASE WHEN tboi.venda = "S" THEN ''Sim'' ELSE ''Não'' END) AS venda');
        SQL.Add('FROM tbordens_cab tboc');
        SQL.Add('	INNER JOIN tbordens_itens tboi ON tboc.idtbordens_cab = tboi.idtbordens_cab');
        SQL.Add(' INNER JOIN tbfuncionarios tbfu ON tboc.idfuncionario = tbfu.idtbfuncionario');
        SQL.Add(' INNER JOIN tbprodutos tbpr ON tboi.idtbproduto = tbpr.idtbproduto');
        SQL.Add(' LEFT JOIN tbclientes tbcli ON tboc.idtbcliente = tbcli.idtbcliente');
        SQL.Add(' WHERE date(tboc.dtdocumento) BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', dtEmissaoFim)));
        SQL.Add(' GROUP BY idtbordens_cab,controle,dtdocumento,dtretirada,dtdevolucao,atendente');
        SQL.Add(',cliente,estado,qtdeTotal,totalOrdem,forma_pagto,item,produto,tipo,qtde,valorUnitario');
        SQL.Add(',percDesconto,valorDesconto,totalLiquido,venda,cancelado');
        SQL.Add(' ORDER BY tboc.dtdocumento, controle, item');
        Open;

        if IsEmpty then
          begin
            MsgErro('Nenhuma ordem foi encontrada');
            Exit;
          end;
      end;

    frxReport.PrepareReport;
    frxReport.ShowReport;

  Finally
    FreeAndNil(vQry);
    FreeAndNil(vQryCab);
    FreeAndNil(Controle);
  End;
end;

procedure TfOrdens.ImprimirFantasias(Produto, OrderBy, Direcao: String);
var
  vQry   : TFDQuery;
  strSQL : String;
begin
  vQry                 := TFDQuery.Create(nil);
  vQry.Connection      := Controle.Conexao.GetConexao;

  frxReport.LoadFromFile(LoadReportStream('rptOrdensPorFantasias','rptFantasiasReservadas.fr3'));
  frxReport.PrintOptions.ShowDialog := True;
  frxDBItem.DataSet                 := vQry;
  vQry.Open('select imp_relatorio from tbparametros');
  frxReport.PrintOptions.Printer := vQry.FieldByName('imp_relatorio').AsString;

  Try
    With vQry Do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('CONVERT(tbordens_itens.idtbordens_cab USING utf8mb3) idtbordens_cab');
        SQL.Add(',tbprodutos.idtbproduto');
        SQL.Add(',tbprodutos.nome produto');
        SQL.Add(',(CASE tbprodutos.tipo');
        SQL.Add('      WHEN 0 THEN "Fantasia Masculina" ');
        SQL.Add('      WHEN 1 THEN "Fantasia Feminina" ');
        SQL.Add('      WHEN 2 THEN "Fantasia Infantil" ');
        SQL.Add('      WHEN 3 THEN "Mascaras" ');
        SQL.Add('      WHEN 4 THEN "Perucas" ');
        SQL.Add('      WHEN 5 THEN "Acessórios" ');
        SQL.Add('      ELSE "Mágica e Outros" END) AS tipo');
        SQL.Add(',DATE_FORMAT(tbordens_cab.dtdocumento,''%d/%m/%Y'') dtdocumento');
        SQL.Add(',DATE_FORMAT(tbordens_cab.dtretirada,''%d/%m/%Y'') dtretirada');
        SQL.Add(',DATE_FORMAT(tbordens_cab.dtdevolucao,''%d/%m/%Y'') dtdevolucao');
        SQL.Add(',LPAD(tbordens_cab.controle, 5, "0") AS controle');
        SQL.Add(',tbclientes.nome cliente');
        SQL.Add(' FROM tbordens_itens');
        SQL.Add('INNER JOIN tbordens_cab ON tbordens_itens.idtbordens_cab = tbordens_cab.idtbordens_cab');
        SQL.Add('INNER JOIN tbprodutos ON tbordens_itens.idtbproduto = tbprodutos.idtbproduto');
        SQL.Add('INNER JOIN tbclientes ON tbordens_cab.idtbcliente = tbclientes.idtbcliente');
        SQL.Add('WHERE tbordens_cab.estado = ''A''');
        SQL.Add(' AND tbordens_itens.venda = "N"');

//        case cbox_campo.ItemIndex of
//         0: SQL.Add(' AND tbordens_cab.dtdocumento BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//         1: SQL.Add(' AND tbordens_cab.dtretirada BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//         2: SQL.Add(' AND tbordens_cab.dtdevolucao BETWEEN '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtInicio))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd',dtFim)));
//        end;

        case FSituacao of
         ftRetirar:
         begin
          SQL.Add(' AND tbordens_itens.retirado="N" AND tbordens_itens.devolvido="N"');
          if chbFiltraData.Checked then
            SQL.Add(' AND date(tbordens_cab.dtretirada) between ' +
              QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro1.Date)) +
              ' and ' + QuotedStr(FormatDateTime('YYYY-mm-dd',jvdtpDataFiltro2.Date)));
         end;
         ftDevolver:
         begin
          SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="N"');
          if chbFiltraData.Checked then
            SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="N"'+
            ' AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab'+
            ' FROM tbordens_cab WHERE tbordens_cab.estado IN ("F","A","D"))');
         end;
         ftDevolvida:
         begin
          SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="S"');
          SQL.Add(' AND tbordens_itens.retirado="S" AND tbordens_itens.devolvido="S"'+
           ' AND tbordens_itens.idtbordens_cab IN (SELECT tbordens_cab.idtbordens_cab'+
           ' FROM tbordens_cab WHERE tbordens_cab.estado IN ("D"))');
         end;
        end;

        SQL.Add(' AND tbprodutos.nome Like '+QuotedStr(Produto + '%'));
        SQL.Add(' GROUP BY idtbordens_cab, idtbproduto, produto, tipo, dtdocumento, dtretirada, dtdevolucao, controle, cliente');
        SQL.Add(' ORDER BY '+OrderBy+' '+Direcao);
        IndexFieldNames := 'produto';
        Open;

        if Not IsEmpty then
          begin
           frxReport.PrepareReport(True);
           frxReport.ShowReport;
          end
        else
          MsgAviso('Não existem fantasias exibidas para as datas de Retirada e Devolução selecionadas');
      end;

  Finally
    FreeAndNil(vQry);
  End;
end;

{$ENDREGION}

procedure TfOrdens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
  fOrdens := nil;
end;

procedure TfOrdens.FormCreate(Sender: TObject);
var
  fdqListPagtos : TFDQuery;
  vQry          : TFDQuery;
  i             : byte;
begin
  Controle := TControle.Create;

  DaoOrdemCab := TSimpleDAO<TOrdemCab>
                   .New(TSimpleQueryFireDac.New(Controle.Conexao.GetConexao))
                   .DataSource(jvdsCab)
                 .BindForm(fOrdens);

  DaoOrdemItem := TSimpleDAO<TOrdemItem>
                    .New(TSimpleQueryFireDac.New(Controle.Conexao.GetConexao))
                    .DataSource(jvdsItens)
                  .BindForm(fOrdens);

  DaoOrdemPagto := TSimpleDAO<TOrdemPagto>
                    .New(TSimpleQueryFireDac.New(Controle.Conexao.GetConexao))
                    .DataSource(jvdsPagto)
                  .BindForm(fOrdens);

  DaoFantasias := TSimpleDAO<TOrdemItem>
                   .New(TSimpleQueryFireDac.New(Controle.Conexao.GetConexao))
                   .DataSource(jvdsReservadas)
                  .BindForm(fOrdens);

    for i := 0 to PageControl1.PageCount - 1 do
      begin
        PageControl1.Pages[i].TabVisible := False;
      end;

  tbsItens.TabVisible          := False;
  tbsCab.TabVisible            := False;
  PageControl1.ActivePageIndex := 0;

  jvcedt_produto.Button.Cursor   := crHandPoint;
  jvcedt_atendente.Button.Cursor := crHandPoint;
  jvcedt_cliente.Button.Cursor   := crHandPoint;

  fdqListPagtos := TFDQuery.Create(nil);
  fdqListPagtos.Connection := Controle.Conexao.GetConexao;
  fdqListPagtos.Open('SELECT CONVERT(idtbformas_pagto USING utf8mb3) idtbformas_pagto, descricao FROM tbformas_pagto WHERE ativo = 1');
  dsFormaPagto.DataSet := fdqListPagtos;

  vQry := TFDQuery.Create(nil);
  vQry.Connection := Controle.Conexao.GetConexao;
  vQry.Open('SELECT inibe_acre from tbparametros');
  inibeAcresc := Boolean(vQry.FieldByName('inibe_acre').Value);

  SetStatus(acComecando);
end;

procedure TfOrdens.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Controle);
end;

procedure TfOrdens.jvcedt_atendenteButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaFuncionarios, frmPesquisaFuncionarios);
  if TGlobal.entityId > 0 then
    jvcedt_atendente.Text := IntToStr(TGlobal.entityId);
end;

procedure TfOrdens.jvcedt_atendenteChange(Sender: TObject);
var
  ClasseFuncionarios : TClasseFuncionarios;
  vControle          : TControle;
begin
  if jvcedt_atendente.Text <> EmptyStr then
    begin
      Try
        vControle           := TControle.Create;
        ClasseFuncionarios := TClasseFuncionarios.Create(vControle);
        With ClasseFuncionarios Do
          Begin
            CarregaDados(StrToInt(jvcedt_atendente.Text));
            if Funcionario > 0 then
              jvstAtendente.Caption := ' ' + Nome
            else
              jvstAtendente.Caption := ' INEXISTENTE';
          End;
      Finally
        FreeAndNil(ClasseFuncionarios);
        FreeAndNil(vControle);
      End;
    end
  else
    begin
      jvstAtendente.Caption := '';
    end;
end;

procedure TfOrdens.jvcedt_atendenteExit(Sender: TObject);
begin
  if jvstAtendente.Caption = ' INEXISTENTE' then
    jvcedt_atendente.SetFocus;
end;

procedure TfOrdens.jvcedt_cliente1ButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
    jvcedt_cliente1.Text := IntToStr(TGlobal.entityId);
end;

procedure TfOrdens.jvcedt_cliente1Change(Sender: TObject);
var
  vControle      : TControle;
  ClasseClientes : TClasseClientes;
begin
  if jvcedt_cliente1.Text <> EmptyStr then
    begin
      try
        vControle      := TControle.Create;
        ClasseClientes := TClasseClientes.Create(vControle);
        With ClasseClientes Do
          begin
            CarregaDados(StrToInt(jvcedt_cliente1.Text));
            if Cliente > 0 then
              begin
                jvstCliente1.Caption := ' ' + Nome;
              end
            else
              begin
                jvstCliente1.Caption := ' INEXISTENTE';
              end;
          end;
      finally
        FreeAndNil(ClasseClientes);
        FreeAndNil(vControle);
      end;
    end
  else
    begin
      jvstCliente1.Caption := '';
    end;
end;

procedure TfOrdens.jvcedt_cliente1Exit(Sender: TObject);
begin
  if jvstCliente1.Caption = ' INEXISTENTE' then
    jvcedt_cliente1.SetFocus;
end;

procedure TfOrdens.jvcedt_clienteButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
    jvcedt_cliente.Text := IntToStr(TGlobal.entityId);
end;

procedure TfOrdens.jvcedt_clienteChange(Sender: TObject);
var
  vControle      : TControle;
  ClasseClientes : TClasseClientes;
begin
  if (jvcedt_cliente.Text <> EmptyStr) AND (jvcedt_cliente.Text <> '999999') then
    begin
      try
        vControle      := TControle.Create;
        ClasseClientes := TClasseClientes.Create(vControle);
        With ClasseClientes Do
          begin
            CarregaDados(StrToInt(jvcedt_cliente.Text));
            if Cliente > 0 then
              begin
                jvstCliente.Caption := ' ' + Nome;
                jvstTel1.Caption    := ' ' + Fone1;
                jvstTel2.Caption    := ' ' + Fone2;
              end
            else
              begin
                jvstCliente.Caption := ' INEXISTENTE';
                jvstTel1.Caption    := '';
                jvstTel2.Caption    := '';
              end;
          end;
      finally
        FreeAndNil(ClasseClientes);
        FreeAndNil(vControle);
      end;
    end
  else
    if jvcedt_cliente.Text = '999999' then
      begin
        jvstCliente.Caption := ' CONSUMIDOR FINAL';
        jvstTel1.Caption    := '';
        jvstTel2.Caption    := '';
      end
  else
    begin
      jvstCliente.Caption := '';
      jvstTel1.Caption    := '';
      jvstTel2.Caption    := '';
    end;
end;

procedure TfOrdens.jvcedt_clienteExit(Sender: TObject);
begin
  if jvstCliente.Caption = ' INEXISTENTE' then
    jvcedt_cliente.SetFocus;
end;

procedure TfOrdens.jvcedt_produtoButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
  if nProduto > 0 then
    jvcedt_produto.Text := IntToStr(nProduto);
end;

procedure TfOrdens.jvcedt_produtoChange(Sender: TObject);
var
  ClasseFantasias : TClasseFantasias;
begin
  // O campo ledt_valorUnitario.Text é para armazenar
  // apenas o valor original do item para salva-lo
  // em tabela como preço de tabela e realizar
  // calculo de desconto
  if jvcedt_produto.Text <> EmptyStr then
  Begin
    Try
      ClasseFantasias := TClasseFantasias.Create(Controle.Conexao.GetConexao);
      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(jvcedt_produto.Text));
        if Fantasia > 0 then
        Begin
          jvstProduto.Caption := ' ' + Nome;

          if (ItemVenda = 'AM') OR (ItemVenda = 'AL') then
          Begin
            jvedt_valorUnitario.Value := VlAluguel;
            ledt_valorUnitario.Text   := FormatFloat('###,###,##0.00', VlAluguel);
          End
          Else
          Begin
            jvedt_valorUnitario.Value := VlVenda;
            ledt_valorUnitario.Text   := FormatFloat('###,###,##0.00', VlVenda);
          End;

          if (FStatus = acAtualizando) then
            begin
              jvedt_valorDesconto.Value := jvdsItens.DataSet.FieldByName('valorDesconto').Value;
            end;
        End
        Else
        Begin
          jvstProduto.Caption       := ' INEXISTENTE';
          jvedt_valorUnitario.Value := 0;
          jvedt_percDesconto.Value  := 0;
          jvedt_valorDesconto.Value := 0;
          ledt_valorUnitario.Text   := FormatFloat('###,###,##0.00', 0);
        End;
      End;
    Finally
      FreeAndNil(ClasseFantasias);
    End;
  End
  Else
  Begin
    jvstProduto.Caption       := '';
    jvedt_valorUnitario.Value := 0;
    jvedt_percDesconto.Value  := 0;
    jvedt_valorDesconto.Value := 0;
    ledt_valorUnitario.Text   := FormatFloat('###,###,##0.00', 0);
  End;
end;

procedure TfOrdens.jvcedt_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F3 then
    SwitchDescVenda(descacre);
//    if descacre = 'desconto' then
//      begin
//        descacre                             := 'acrescimo';
//        ledt_percDesconto.EditLabel.Caption  := '% Acrescimo';
//        ledt_valorDesconto.EditLabel.Caption := 'R$ Acrescimo';
//      end
//    else
//      begin
//        descacre                             := 'desconto';
//        ledt_percDesconto.EditLabel.Caption  := '% Desconto';
//        ledt_valorDesconto.EditLabel.Caption := 'R$ Desconto';
//      end;
end;

procedure TfOrdens.jvcedt_produto2Change(Sender: TObject);
var
  ClasseFantasias : TClasseFantasias;
begin
  if jvcedt_produto2.Text <> EmptyStr then
  Begin
    Try
      ClasseFantasias := TClasseFantasias.Create(Controle.Conexao.GetConexao);
      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(jvcedt_produto2.Text));
        if Fantasia > 0 then
          jvstProduto2.Caption := ' ' + Nome
        Else
          jvstProduto2.Caption  := ' INEXISTENTE';
      End;
    Finally
      FreeAndNil(ClasseFantasias);
    End;
  End
  Else
    jvstProduto2.Caption  := '';
end;

procedure TfOrdens.jvdbFormasPagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_DELETE then
    begin
      if uRotinas.MsgConfirmacao('Excluir condição de pagamento selecionada?') then
        ExcluiPagto(jvdsPagto.DataSet.FieldByName('idtbordens_pagto').AsString,
                    jvdsPagto.DataSet.FieldByName('idtbordens_cab').AsString,
                    jvdsPagto.DataSet.FieldByName('idtbformas_pagto').AsString);
    end;
end;

procedure TfOrdens.jvdbgItensEnter(Sender: TObject);
begin
  if jvdsItens.DataSet.RecordCount > 0 then
    pnl_observacao1.Visible := True;
end;

procedure TfOrdens.jvdbgItensExit(Sender: TObject);
begin
  pnl_observacao1.Visible := False;
end;

procedure TfOrdens.jvdbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var idItem : String;
begin
  if Key = vk_DELETE then
    begin
      CancelarItem(jvdsItens.DataSet.FieldByName('idtbordens_itens').AsString);
    end;

  if Key = vk_RETURN then
    begin
      if (jvdsItens.DataSet.RecordCount > 0) AND (jvdsItens.DataSet.FieldByName('cancelado').AsString = '') then
        begin
          jvcedt_produto.Text       := jvdsItens.DataSet.FieldByName('idtbproduto').AsString;
          jvsedt_qtde.Value         := jvdsItens.DataSet.FieldByName('qtde').Value;
          ledt_valorUnitario.Text   := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('precoTabela').Value);
          jvedt_valorUnitario.Value := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('valorUnitario').Value);
          jvedt_percDesconto.Value  := FormatCurr('##0.00',jvdsItens.DataSet.FieldByName('percDesconto').Value);
//          jvedt_valorDesconto.Value := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('valorDesconto').Value);
          jvedt_valorDesconto.Value := IfThen(jvdsItens.DataSet.FieldByName('valorDesconto').Value < 0,
            (jvdsItens.DataSet.FieldByName('valorDesconto').Value/jvdsItens.DataSet.FieldByName('qtde').Value) * (-1),
            (jvdsItens.DataSet.FieldByName('valorDesconto').Value/jvdsItens.DataSet.FieldByName('qtde').Value)
          );

          if jvdsItens.DataSet.FieldByName('valorDesconto').Value < 0 then 
            begin
              descacre                             := 'desconto';
              ledt_percDesconto.EditLabel.Caption  := '% Desconto';
              ledt_valorDesconto.EditLabel.Caption := 'R$ Desconto';              
            end
          else
            begin
              descacre                             := 'acrescimo';
              ledt_percDesconto.EditLabel.Caption  := '% Acrescimo';
              ledt_valorDesconto.EditLabel.Caption := 'R$ Acrescimo';            
            end;

          SetStatus(acAtualizando);
          jvcedt_produto.SetFocus;
          sbtn_addItem.Caption := 'Alterar Item';
        end;
    end;

  if Key = vk_SPACE then
    begin
      if (jvdsItens.DataSet.RecordCount > 0) AND (jvdsItens.DataSet.FieldByName('cancelado').AsString = '') then
        begin
          jvcedt_produto.Text       := jvdsItens.DataSet.FieldByName('idtbproduto').AsString;
          jvsedt_qtde.Value         := jvdsItens.DataSet.FieldByName('qtde').Value;
          ledt_valorUnitario.Text   := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('precoTabela').Value);
          jvedt_valorUnitario.Value := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('valorUnitario').Value);
          jvedt_percDesconto.Value  := FormatCurr('##0.00',jvdsItens.DataSet.FieldByName('percDesconto').Value);
//          jvedt_valorDesconto.Value := FormatCurr('###,###,##0.00',jvdsItens.DataSet.FieldByName('valorDesconto').Value);
          jvedt_valorDesconto.Value := IfThen(jvdsItens.DataSet.FieldByName('valorDesconto').Value < 0,
            jvdsItens.DataSet.FieldByName('valorDesconto').Value * (-1),
            jvdsItens.DataSet.FieldByName('valorDesconto').Value
          );

          idItem := jvdsItens.DataSet.FieldByName('idtbordens_itens').AsString;

          SwitchVenda(idItem);
          SetStatus(acInserindo);
          jvcedt_produto.Clear;
          jvdsItens.Locate('idtbordens_itens',idItem, [])
        end;
    end;
end;

procedure TfOrdens.jvdbg_FantasiasEnter(Sender: TObject);
begin
  if jvdsItens.DataSet.RecordCount > 0 then
    pnl_observacao2.Visible := True;
end;

procedure TfOrdens.jvdbg_FantasiasExit(Sender: TObject);
begin
  if jvdsItens.DataSet.RecordCount > 0 then
    pnl_observacao2.Visible := False;
end;

procedure TfOrdens.jvdbg_FantasiasTitleClick(Column: TColumn);
begin
  if jvdsItens.RecordCount = 0 then
    Abort;

  orderby := Column.FieldName;

  if direcao = '' then
    direcao := 'DESC'
  else
    direcao := '';

  ListaFantasias(
    ledt_produto2.Text,
    orderby,
    direcao);
end;

procedure TfOrdens.jvdbgCabsDblClick(Sender: TObject);
begin
  if jvdsCab.RecordCount > 0 then
    ManutencaoOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfOrdens.jvdbgCabsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgCabs.Canvas.Font.Color := clWhite
    else
      if jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim' then
        jvdbgCabs.Canvas.Font.Color := $00D56A00
       else
        jvdbgCabs.Canvas.Font.Color := $00525252
  else
   if jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim' then
          jvdbgCabs.Canvas.Font.Color := $00D56A00
         else
          jvdbgCabs.Canvas.Font.Color := $00525252;

  jvdbgCabs.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfOrdens.jvdbgCabsKeyPress(Sender: TObject; var Key: Char);
begin
  if UpperCase(Key) = 'P' then
    ImprimirComprovante(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfOrdens.jvdbgItens1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens.Canvas.Font.Color := clWhite
    else
      jvdbgItens.Canvas.Font.Color := $00525252;

  if jvdsItens.DataSet.FieldByName('cancelado').AsString = 'Sim' then
    jvdbgItens.Canvas.Font.Color := $00E6E6E6;

  jvdbgItens.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfOrdens.jvdbgItens3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens3.Canvas.Font.Color := clWhite
    else
      jvdbgItens3.Canvas.Font.Color := $00525252;

  if jvdsItens.DataSet.FieldByName('retirado').AsString = 'Sim' then
    jvdbgItens3.Canvas.Font.Color := $00D56A00;

//  if jvdsItens.DataSet.FieldByName('cancelado').AsString = 'Sim' then
//    jvdbgItens3.Canvas.Font.Color := $00C6C6C6;

  jvdbgItens3.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfOrdens.jvdbgItens4DblClick(Sender: TObject);
begin
  jvcedt_produto2.Text := jvdsItens.DataSet.FieldByName('idtbproduto').AsString;
end;

procedure TfOrdens.jvdbgItensDblClick(Sender: TObject);
begin
  if (jvdsItens.DataSet.RecordCount > 0) AND
  (jvdsItens.DataSet.FieldByName('venda').AsString <> 'Sim') AND
  (jvdsItens.DataSet.FieldByName('cancelado').AsString <> 'Sim') then
    if (FStatus = acAtualizando) then
      begin
        if jvdsItens.DataSet.FieldByName('retirado').AsString = 'Sim' then
          begin
            MsgAviso('Este item já foi retirado não podendo ser mais alterado');
            Exit;
          end;
        jvcedt_produto.Text := jvdsItens.DataSet.FieldByName('idtbproduto').AsString;
        jvcedt_produto.SetFocus;
      end;
end;

procedure TfOrdens.jvdbgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if TDBGrid(Sender).Focused then
    if (gdSelected in State) or (gdFocused in State) then
      jvdbgItens.Canvas.Font.Color := clWhite
    else
      jvdbgItens.Canvas.Font.Color := $00525252;

  if jvdsItens.DataSet.FieldByName('cancelado').AsString = 'Sim' then
    jvdbgItens.Canvas.Font.Color := $00565656; //$00E6E6E6;

  jvdbgItens.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfOrdens.jvdsCabDataSetScrolled(Sender: TObject);
begin
  ListaOrdemPagtos(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
  ListaItensOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
  if (FStatus = acAtualizando) then
  nroOrdem := jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString;
end;

procedure TfOrdens.jvdt_dtretInicioMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TJvDateEdit(Sender).Hint := 'Pressione "Q" para adicionar 15 dias a data'+#13+
                              'Pressione "M" para adicionar 30 dias a data'+#13+
                              'Pressione "A" para adicionar 1 ano a data'+#13+
                              'Pressione "S" para adicionar 1 semana a data';
end;

procedure TfOrdens.jvedt_valorUnitarioChange(Sender: TObject);
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

procedure TfOrdens.jvedt_valorUnitarioEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfOrdens.jvedt_valorUnitarioExit(Sender: TObject);
begin
  CalculaDesconto(TLabeledEdit(Sender).Tag);
end;

procedure TfOrdens.jvrbtn_aretirarClick(Sender: TObject);
begin
    if jvrbtn_aretirar.Checked then
      begin
      SetSituacao(ftRetirar);
      sbtn_acaoFantasias.Caption := 'Retirar Fantasia(s)';
      sbtn_acaoFantasias.Enabled := True;
      end
    else if jvrbtn_adevolver.Checked then
      begin
      SetSituacao(ftDevolver);
      sbtn_acaoFantasias.Caption := 'Devolver Fantasia(s)';
      sbtn_acaoFantasias.Enabled := True;
      end
    else if jvrbtn_devolvidas.Checked then
      begin
      SetSituacao(ftDevolvida);
      sbtn_acaoFantasias.Enabled := False;
      end
    else
      SetSituacao(ftRetirar);

     jvdsItens.Enabled := false;
     jvdsItens.DisableEventsOnLoading := true;
    ListaFantasias(
      ledt_produto2.Text,
      orderby,
      direcao);
    jvdsItens.Enabled := true;
    jvdsItens.DisableEventsOnLoading := false;
end;

procedure TfOrdens.ledt_produto2Change(Sender: TObject);
begin
    ListaFantasias(
      ledt_produto2.Text,
      orderby,
      direcao);
end;

procedure TfOrdens.sbtn_acaoFantasiasClick(Sender: TObject);
var
	i       : Integer;
	aux     : string;
  DataSet : TDataSet;
  VQry    : TFDQuery;
begin
  if jvdbg_Fantasias.SelectedRows.Count > 0 then
    begin
      if Not MsgConfirmacao(PChar(sbtn_acaoFantasias.Caption + '?')) then
        Abort;

      DataSet := jvdbg_Fantasias.DataSource.DataSet;

      try
        DataSet.DisableControls;

        for i := 0 to jvdbg_Fantasias.SelectedRows.Count - 1 do
          begin
            DataSet.GotoBookmark((jvdbg_Fantasias.SelectedRows.Items[i]));
            aux := aux + QuotedStr(DataSet.FieldByName('idtbordens_itens').AsString) + ',';
          end;

        aux := Copy(aux, 1, Length(aux) - 1);

        VQry            := TFDQuery.Create(nil);
        VQry.Connection := Controle.Conexao.GetConexao;

        With VQry Do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE tbordens_itens');
            case FSituacao of
             ftRetirar:
              SQL.Add(' SET retirado="S"');
             ftDevolver:
              SQL.Add(' SET devolvido="S"');
             ftDevolvida: ;
            end;
            SQL.Add(' WHERE idtbordens_itens in ('+ aux +')');
            ExecSQL;
          End;

        ListaFantasias(
          ledt_produto2.Text,
          orderby,
          direcao);
      finally
        DataSet.EnableControls;
        FreeAndNil(VQry);
      end;
    end
  else
    MsgAviso('Nenhuma fantasia foi selecionada');

end;

procedure TfOrdens.sbtn_addclienteClick(Sender: TObject);
begin
  OpenFormModal(TfrmClientes, frmClientes);
end;

procedure TfOrdens.sbtn_addItemClick(Sender: TObject);
begin
  if jvcedt_produto.Text = EmptyStr then
    begin
      MsgErro('Campo produto não foi preenchido');
      jvcedt_produto.SetFocus;
      Abort;
    end;

  // Força a saida dos campos de descontos em % e R$
  // para calcula-los
  ledt_valorUnitario.SetFocus;
  ledt_valorDesconto.SetFocus;

  if (FStatus = acComecando) then
    begin
      dtEmissao     := Date();
      ordemRetirada := false;
      IniciaOrdem;
    end;
  if (FStatus = acInserindo) then
    InsereItem;
  if (FStatus = acAtualizando) then
      AlterarItem(jvdsItens.DataSet.FieldByName('idtbordens_itens').AsString);
end;

procedure TfOrdens.sbtn_addItemMouseEnter(Sender: TObject);
begin
  pnl_btnAddItem.Color := $00A36215;
end;

procedure TfOrdens.sbtn_addItemMouseLeave(Sender: TObject);
begin
  pnl_btnAddItem.Color := $00565656;
end;

procedure TfOrdens.sbtn_caixaClick(Sender: TObject);
begin
  OpenFormModal(TfCaixas, fCaixas);
end;

procedure TfOrdens.sbtn_cancelarClick(Sender: TObject);
begin
  if jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim' then
    begin
      MsgErro('Ordem já foi retirada e sua anulação não é permitida');
      Exit;
    end;

  if (FStatus = acInserindo) OR (FStatus = acAtualizando) then
    if MsgConfirmacao('Tem certeza que deseja anular esta ordem?') then
      CancelarOrdem(nroOrdem);
end;

procedure TfOrdens.sbtn_cancelarMouseEnter(Sender: TObject);
begin
  pnl_btnCancelar.Color := clRed;
end;

procedure TfOrdens.sbtn_cancelarMouseLeave(Sender: TObject);
begin
  pnl_btnCancelar.Color := $00565656;
end;

procedure TfOrdens.sbtn_comprovanteClick(Sender: TObject);
begin
  ImprimirComprovante(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfOrdens.sbtn_finalizarClick(Sender: TObject);
begin
  // Validando
  if jvcedt_atendente.Text = EmptyStr then
    begin
      jvcedt_atendente.SetFocus;
      MsgAviso('Campo Atendente não foi preenchido');
      Abort;
    end;

  if jvcedt_cliente.Text = EmptyStr then
    begin
      jvcedt_cliente.SetFocus;
      MsgAviso('Campo Cliente não foi preenchido');
      Abort;
    end;

  if vTotal <> vPagto then
    begin
      jvdbPagto.SetFocus;
      MsgAviso('Valor recebido não confere com o Total a pagar');
      Abort;
    end;

  if (jvdt_dtdevolucao.Date = Date()) AND (itensAlugados > 0) then
    begin
      jvdt_dtdevolucao.SetFocus;
      MsgAviso('Data de Devolução não pode ser a data atual');
      Abort;
    end;
  
  FinalizaOrdem(nroOrdem);
  ListaOrdem(nroOrdem);
  ListaOrdemPagtos(nroOrdem);
  // Movimentando Estoque e Kardex
  if not jvdsItens.Eof then
    repeat
      if (jvdsItens.DataSet.FieldByName('venda').AsString = '') AND
         (jvdt_dtretirada.Date = Date()) then
        MovEstoqueKardex(
            jvdsItens.DataSet.FieldByName('idtbproduto').AsInteger,
            jvdsItens.DataSet.FieldByName('qtde').AsInteger,
            5,
            FormatFloat('00000', jvdsCab.DataSet.FieldByName('controle').AsInteger));

      if jvdsItens.DataSet.FieldByName('venda').AsString = 'Sim' then
        MovEstoqueKardex(
            jvdsItens.DataSet.FieldByName('idtbproduto').AsInteger,
            jvdsItens.DataSet.FieldByName('qtde').AsInteger,
            3,
            FormatFloat('00000', jvdsCab.DataSet.FieldByName('controle').AsInteger));

     jvdsItens.Next;
    until jvdsItens.Eof;

    ImprimirComprovante(nroOrdem);

//  if itensAlugados > 0 then
//    while MsgConfirmacao('Confirma impressão de comprovante?') do
//      begin
//        ImprimirComprovante(nroOrdem);
//      end;

  MsgInformacao('Ordem finalizada com sucesso!');
  jvcedt_atendente.Clear;
  jvcedt_cliente.Clear;
  jvcedt_atendente.Enabled := True;
  jvcedt_cliente.Enabled   := True;
  jvdt_dtretirada.Date     := Date();
  jvdt_dtdevolucao.Date    := Date();
  img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance,'circleadd');
  ListaOrdem('');
  ListaItensOrdem('');
  PageControl1.ActivePageIndex := 0;
  jvcedt_produto.SetFocus;
  SetStatus(acComecando);
end;

procedure TfOrdens.sbtn_listaFantasiasClick(Sender: TObject);
begin
  jvdsCab.Enabled := false;
  jvdsItens.DisableEventsOnLoading := true;

 // ListaOrdem('');
 // ListaItensOrdem('');
  //jvdsCab.Last;

  jvrbtn_aretirar.Checked := true;
  SetSituacao(ftRetirar);
  sbtn_acaoFantasias.Caption := 'Retirar Fantasia(s)';
  sbtn_acaoFantasias.Enabled := True;


   jvdsItens.Enabled := false;
   jvdsItens.DisableEventsOnLoading := true;
  ListaFantasias(
    ledt_produto2.Text,
    orderby,
    direcao);
  jvdsItens.Enabled := true;
  jvdsItens.DisableEventsOnLoading := false;


  jvdsCab.Enabled := true;
  jvdsItens.Enabled := true;
  jvdsItens.DisableEventsOnLoading := false;

  PageControl1.ActivePageIndex := 4;
end;

procedure TfOrdens.sbtn_listaOrdensClick(Sender: TObject);
begin
  ImprimirOrdens(jvdt_dtStart.Date,jvdt_dtEnd.Date);
end;

procedure TfOrdens.sbtn_pagtoClick(Sender: TObject);
begin
  // Validando
  if lblTotal.Caption = 'Qtde.: 0 Total: 0,00 ' then
    begin
      MsgErro('Inclua ao menos um item válido na Ordem');
      Abort;
    end;
  ListaOrdem(nroOrdem);
  ListaOrdemPagtos(nroOrdem);
  jvdt_dtretirada.Enabled      := Boolean(itensAlugados);
  jvdt_dtdevolucao.Enabled     := Boolean(itensAlugados);
  PageControl1.ActivePageIndex := 1;
  lblPagto.Caption := 'Total a Pagar: '+FormatCurr('###,###,##0.00', vTotal)+' | Recebido: '+FormatCurr('###,###,##0.00',vPagto);
end;

procedure TfOrdens.sbtn_pagtoMouseEnter(Sender: TObject);
begin
  pnl_btnPagto.Color := $00A36215;
end;

procedure TfOrdens.sbtn_pagtoMouseLeave(Sender: TObject);
begin
  pnl_btnPagto.Color := $00565656;
end;

procedure TfOrdens.sbtn_pesquisar1Click(Sender: TObject);
begin
  case cbox_pesquisa.ItemIndex of
  0,1,2:
    begin
      if jvcedt_cliente1.Text <> EmptyStr then
        ListaOrdem(
          jvdt_dtStart.Date,
          jvdt_dtEnd.Date,
          StrToInt(jvcedt_cliente1.Text),
          StrToInt(jvcedt_cliente1.Text))
      else
        ListaOrdem(
          jvdt_dtStart.Date,
          jvdt_dtEnd.Date,
          1,
          99999999);
    end;
  3:
    begin
      if jvcedt_cliente1.Text = EmptyStr then
        begin
          MsgAviso('Cliente não foi informado');
          Exit;
        end;
        ListaOrdem(
          IncYear(Date)-1,
          IncYear(Date),
          StrToInt(jvcedt_cliente1.Text),
          StrToInt(jvcedt_cliente1.Text));
    end;
  end;

end;

procedure TfOrdens.sbtn_pesquisarClick(Sender: TObject);
begin
  if (FStatus <> acComecando) then
    begin
      MsgAviso('Encerre a Ordem ou anule antes de prosseguir');
      Exit;
    end;

  ListaOrdem('');
  ListaItensOrdem('');
  jvdsCab.Last;
  PageControl1.ActivePageIndex := 2;
end;

procedure TfOrdens.sbtn_refreshItemClick(Sender: TObject);
begin
  if jvcedt_produto2.Text = EmptyStr then
    begin
      MsgErro('Campo produto não foi preenchido');
      Exit;
    end;

  // Passando o código do item para o
  jvcedt_produto.Text := jvcedt_produto2.Text;
  AlterarItem(jvdsItens.DataSet.FieldByName('idtbordens_itens').AsString);
  // Listando a Ordem e Itens
  ListaOrdem(nroOrdem);

  ListaItensOrdem(nroOrdem);
end;

procedure TfOrdens.sbtn_retiradaClick(Sender: TObject);
begin
  if jvdsCab.RecordCount = 0 then
    begin
      MsgErro('Nenhuma ordem foi selecionada');
      Exit;
    end;

  if jvdsCab.DataSet.FieldByName('retirada').AsString = 'Sim' then
    begin
      MsgErro('A ordem ' + FormatFloat('00000',jvdsCab.DataSet.FieldByName('controle').Value) + ' já teve o(s) item(ns) retirado(s).');
      Exit;
    end;

  if MsgConfirmacao('Confirma a retirada da ordem ' +
    FormatFloat('00000',jvdsCab.DataSet.FieldByName('controle').Value) + '?') then
      RetirarOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfOrdens.sbtn_rptFantasiasClick(Sender: TObject);
begin
  ImprimirFantasias(
        ledt_produto2.Text,
        orderby,
        direcao);
end;

procedure TfOrdens.sbtn_devolucaoClick(Sender: TObject);
begin
  if jvdsCab.RecordCount = 0 then
    begin
      MsgErro('Nenhuma ordem foi selecionada');
      Exit;
    end;

  if jvdsCab.DataSet.FieldByName('estado').AsString = 'Fechada' then
    begin
      MsgAviso('A ordem ' + FormatFloat('00000',jvdsCab.DataSet.FieldByName('controle').Value) +
      ' não teve itens alugados');
      Exit;
    end;


  if MsgConfirmacao('Confirma a devolução da ordem ' +
    FormatFloat('00000',jvdsCab.DataSet.FieldByName('controle').Value) + '?') then
      DevolverOrdem(jvdsCab.DataSet.FieldByName('idtbordens_cab').AsString);
end;

procedure TfOrdens.sbtn_voltar1Click(Sender: TObject);
begin
  ListaOrdem('');
  ListaItensOrdem('');
  jvdsCab.Last;
  img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance,'circleadd');
  PageControl1.ActivePageIndex := 0;
end;

procedure TfOrdens.sbtn_voltarClick(Sender: TObject);
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
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance,'refresh');
  if (FStatus = acInserindo) OR (FStatus = acComecando) then
    img_addItem.Picture.Bitmap.LoadFromResourceName(HInstance,'circleadd');
  PageControl1.ActivePageIndex := 0;
end;

procedure TfOrdens.SetStatus(const poStatus: eAcao);
begin
  FStatus := poStatus;
end;

procedure TfOrdens.SetSituacao(const poSituacao: eSituacao);
begin
  FSituacao := poSituacao;
end;

procedure TfOrdens.sbtn_addpagtoClick(Sender: TObject);
begin
  // Validando
  if jvdbPagto.Text = EmptyStr then
    begin
      MsgAviso('Forma de pagamento não foi informada');
      Abort;
    end;

  if jvedt_valorPagto.Value = 0 then
    begin
      MsgAviso('Valor pago não foi informado');
      Abort;
    end;

  if jvedt_valorPagto.Value > (vTotal - vPagto) then
    begin
      MsgErro('Valor excede o restante a receber');
      Abort;
    end;

  InserirPagto;
  jvdbPagto.ResetField;
  jvedt_valorPagto.Value := 0;
end;

end.
