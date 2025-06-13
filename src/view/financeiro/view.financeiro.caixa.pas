unit view.financeiro.caixa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ExtDlgs,
  Vcl.Mask,
  Vcl.Menus,
  uRotinas,
  view.cadastros.padrao,
  model.caixa,
  classe.global,
  DataSetUtils,
  Data.DB,
  JvExStdCtrls,
  JvEdit,
  JvValidateEdit,
  FireDAC.Comp.Client;

type
  TfrmCaixas = class(TfrmCadPadrao)
    idcaixa: TLabeledEdit;
    dtemissao: TLabeledEdit;
    rgroup_operacao: TRadioGroup;
    rgroup_tipo: TRadioGroup;
    documento: TLabeledEdit;
    valor: TJvValidateEdit;
    Label1: TLabel;
    Shape1: TShape;
    sbtnImprimir: TSpeedButton;
    pmnBoletim: TPopupMenu;
    mnCxaDiario: TMenuItem;
    mnRptDataCupom: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure rgroup_operacaoClick(Sender: TObject);
    procedure rgroup_tipoClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure valorChange(Sender: TObject);
    procedure valorEnter(Sender: TObject);
    procedure valorClick(Sender: TObject);
  private
    { Private declarations }
    fdmtb_caixas: TFDMemTable;
  public
    { Public declarations }
  end;

var
  frmCaixas: TfrmCaixas;

implementation

{$R *.dfm}

uses
  uReportCaixa,
  view.financeiro.caixaPesquisa,
  view.financeiro.relatorioCaixa,
  controller.dto.caixa.interfaces,
  controller.dto.caixa.interfaces.impl;

procedure TfrmCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCaixas := Nil;
end;

procedure TfrmCaixas.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_caixas := TFDMemTable.Create(nil);
end;

procedure TfrmCaixas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_caixas);
end;

procedure TfrmCaixas.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmCaixas.valorChange(Sender: TObject);
var
  valor: String;
begin
  inherited;
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);
  if Length(valor) = 0 then
    valor := '0';
  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCaixas.valorClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCaixas.valorEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCaixas.rgroup_operacaoClick(Sender: TObject);
begin
  inherited;
  if rgroup_operacao.ItemIndex = 1 then
  Begin
    TCustomRadioGroup(rgroup_tipo.Components[0]).Enabled := False;
    TCustomRadioGroup(rgroup_tipo.Components[1]).Enabled := True;
    TCustomRadioGroup(rgroup_tipo.Components[2]).Enabled := False;
    rgroup_tipo.ItemIndex := 1;
  End
  else
  Begin
    TCustomRadioGroup(rgroup_tipo.Components[0]).Enabled := True;
    TCustomRadioGroup(rgroup_tipo.Components[1]).Enabled := False;
    TCustomRadioGroup(rgroup_tipo.Components[2]).Enabled := True;
    rgroup_tipo.ItemIndex := 0;
  End;
end;

procedure TfrmCaixas.rgroup_tipoClick(Sender: TObject);
begin
  inherited;
  if rgroup_tipo.ItemIndex = 1 then
    rgroup_operacao.ItemIndex := 1
  else
    rgroup_operacao.ItemIndex := 0;
end;

procedure TfrmCaixas.sbtnDuplicarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCaixas.sbtnImprimirClick(Sender: TObject);
begin
  OpenFormModal(TfrmReportCaixa, frmReportCaixa);
end;

{$REGION 'Procedure de manipulação de "objetos"'}

procedure TfrmCaixas.sbtnAnteriorClick(Sender: TObject);
var
  listaCaixas: TObjectList<TCaixa>;
begin
  Try
    var
    ICaixa := TICaixa.New;
    if operacao = 'incluir' then
    begin
      ICaixa.Build.GetRecordsNumber('tbcaixa', '', recordAtual);
      recordAtual := recordAtual - 1;
    end
    else if recordAtual > 0 then
      recordAtual := recordAtual - 1;

    ICaixa.Build.ListPaginate('', listaCaixas, 'idtbcaixa', 1, recordAtual);

    if listaCaixas.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_caixas);
      Self.Navegacao(fdmtb_caixas, 2);
      Self.DataSetToFiels(fdmtb_caixas);
      case AnsiIndexStr(fdmtb_caixas.FieldByName('operacao').AsString,
        ['C', 'D']) of
        0:
          rgroup_operacao.ItemIndex := 0;
        1:
          rgroup_operacao.ItemIndex := 1;
      end;
      case AnsiIndexStr(fdmtb_caixas.FieldByName('tpmov').AsString,
        ['Fundo', 'Sangria', 'Suprimento']) of
        0:
          rgroup_tipo.ItemIndex := 0;
        1:
          rgroup_tipo.ItemIndex := 1;
        2:
          rgroup_tipo.ItemIndex := 2;
      end;
      operacao := 'alterar';
    end;
    listaCaixas.Clear;
    FreeAndNil(listaCaixas);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmCaixas.sbtnProximoClick(Sender: TObject);
var
  listaCaixas: TObjectList<TCaixa>;
begin
  Try
    var
    ICaixa := TICaixa.New;
    if operacao = 'incluir' then
    begin
      ICaixa.Build.GetRecordsNumber('tbcaixa', '', recordAtual);
      recordAtual := recordAtual - 1;
    end
    else
      recordAtual := recordAtual + 1;

    ICaixa.Build.ListPaginate('', listaCaixas, 'idtbcaixa', 1, recordAtual);

    if listaCaixas.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_caixas);
      Self.Navegacao(fdmtb_caixas, 3);
      Self.DataSetToFiels(fdmtb_caixas);
      case AnsiIndexStr(fdmtb_caixas.FieldByName('operacao').AsString,
        ['C', 'D']) of
        0:
          rgroup_operacao.ItemIndex := 0;
        1:
          rgroup_operacao.ItemIndex := 1;
      end;
      case AnsiIndexStr(fdmtb_caixas.FieldByName('tpmov').AsString,
        ['Fundo', 'Sangria', 'Suprimento']) of
        0:
          rgroup_tipo.ItemIndex := 0;
        1:
          rgroup_tipo.ItemIndex := 1;
        2:
          rgroup_tipo.ItemIndex := 2;
      end;
    end
    else
      recordAtual := recordAtual - 1;
    listaCaixas.Clear;
    FreeAndNil(listaCaixas);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmCaixas.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if Not MsgConfirmacao('Confirma o cancelamento desse registro?') then
    Exit;
  try
    var
    ICaixa := TICaixa.New;
    var
      listaCaixas: TObjectList<TCaixa>;
    var
    objCaixa := ICaixa.Build.ListById('idcaixa', StrToInt(idcaixa.Text),
      listaCaixas).This;
    ICaixa.Build.Modify(objCaixa);
    with objCaixa do
    begin
      idcaixa := idcaixa;
      idtbempresa := idtbempresa;
      dtemissao := dtemissao;
      operacao := operacao;
      origem := origem;
      valor := valor;
      saldo := saldo;
      pdv := pdv;
      documento := documento;
      condicao := condicao;
      tpmov := tpmov;
      cancelado := True;
      useralt := TGlobal.userId;
    end;
    ICaixa.Build.Update;
    listaCaixas.Clear;
    FreeAndNil(listaCaixas);
  except
    on e: Exception do
      MsgErro(e.Message);
  end;
end;

procedure TfrmCaixas.sbtnDeletarClick(Sender: TObject);
begin
  inherited;
  if operacao <> 'alterar' then
    Exit;
  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Exit;
  Try
    var
    ICaixa := TICaixa.New;
    ICaixa.idcaixa(fdmtb_caixas.Fields[0].AsInteger).Build.Delete;
    sbtnNovo.Click;
  Except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  End;
end;

procedure TfrmCaixas.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  inherited;
  LimpaCampos;
  var
  ICaixa := TICaixa.New;
  ICaixa.Build.GetRecordsNumber('tbcaixa', '', nextId);
  idcaixa.Text := FormatFloat('00', (nextId + 1));
  dtemissao.Text := FormatDateTime('dd/mm/YYYY', Date());
  rgroup_tipo.ItemIndex := 0;
  rgroup_operacao.ItemIndex := 0;
  valor.Value := 0;
  TCustomRadioGroup(rgroup_tipo.Components[0]).Enabled := True;
  TCustomRadioGroup(rgroup_tipo.Components[1]).Enabled := False;
  TCustomRadioGroup(rgroup_tipo.Components[2]).Enabled := True;
  operacao := 'incluir';
end;

procedure TfrmCaixas.sbtnPesquisarClick(Sender: TObject);
var
  listaCaixas: TObjectList<TCaixa>;
begin
  inherited;
  OpenFormModal(TfrmPesquisaCaixas, frmPesquisaCaixas);
  if TGlobal.entityId > 0 then
  Begin
    var
    ICaixa := TICaixa.New;
    ICaixa.Build.ListAll('idcaixa = ' + TGlobal.entityId.ToString, listaCaixas);
    TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_caixas);
    Self.DataSetToFiels(fdmtb_caixas);
    listaCaixas.Clear;
    FreeAndNil(listaCaixas);

    idcaixa.Text := FormatFloat('00', fdmtb_caixas.FieldByName('idcaixa')
      .AsInteger);
    case AnsiIndexStr(fdmtb_caixas.FieldByName('operacao').AsString,
      ['C', 'D']) of
      0:
        rgroup_operacao.ItemIndex := 0;
      1:
        rgroup_operacao.ItemIndex := 1;
    end;

    case AnsiIndexStr(fdmtb_caixas.FieldByName('tpmov').AsString,
      ['Fundo', 'Sangria', 'Suprimento']) of
      0:
        rgroup_tipo.ItemIndex := 0;
      1:
        rgroup_tipo.ItemIndex := 1;
      2:
        rgroup_tipo.ItemIndex := 2;
    end;
    operacao := 'alterar';
  End;
end;

procedure TfrmCaixas.sbtnSalvarClick(Sender: TObject);
begin
  inherited;
  Try
    var
    ICaixa := TICaixa.New;
    if operacao = 'incluir' then
    begin
      ICaixa.idcaixa(StrToInt(Self.idcaixa.Text)).idtbempresa(TGlobal.empresa)
        .dtemissao(StrToDateTime(Self.dtemissao.Text))
        .Setoperacao(TEnumOperacao(rgroup_operacao.ItemIndex)).origem('D')
        .valor(Self.valor.AsCurrency).pdv(TGlobal.terminal)
        .documento(Self.documento.Text)
      // 0-Dinheiro,1-Cartão Crédito,2-Cartão Débito,3-Cheque Á Vista,4-Cheque Á Prazo,5-Diversos
        .Setcondicao(TEnumTipoMoeda(0))
        .Settpmov(TEnumTipoMovimento(rgroup_tipo.ItemIndex)).cancelado(False)
        .usercad(TGlobal.userId).useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
        listaCaixas: TObjectList<TCaixa>;

      var
      objCaixa := ICaixa.Build.ListById('idcaixa', StrToInt(Self.idcaixa.Text),
        listaCaixas).This;
      ICaixa.Build.Modify(objCaixa);

      with objCaixa do
      begin
        idcaixa := idcaixa;
        idtbempresa := idtbempresa;
        dtemissao := StrToDateTime(Self.dtemissao.Text);
        operacao := TEnumOperacao(rgroup_operacao.ItemIndex);
        origem := 'D';
        valor := Self.valor.AsCurrency;
        pdv := TGlobal.terminal;
        documento := Self.documento.Text;
        // 0-Dinheiro,1-Cartão Crédito,2-Cartão Débito,3-Cheque Á Vista,4-Cheque Á Prazo,5-Diversos
        condicao := TEnumTipoMoeda(0);
        tpmov := TEnumTipoMovimento(rgroup_tipo.ItemIndex);
        useralt := TGlobal.userId;
      end;

      ICaixa.Build.Update;
      listaCaixas.Clear;
      FreeAndNil(listaCaixas);
    end;
    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
end;
{$ENDREGION}

end.
