unit view.financeiro.cartoes;

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
  Vcl.Mask,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  uRotinas,

  view.cadastros.padrao,
  model.cliente,
  model.cartoes,
  classe.global,

  DataSetUtils,

  firedac.Comp.DataSet,
  firedac.Comp.Client,

  JvToolEdit,
  JvExMask,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvExControls,
  JvStaticText,
  JvSpin,
  JvExStdCtrls,
  JvEdit,
  JvValidateEdit;

type
  TfrmCartoes = class(TfrmCadPadrao)
    idtbcartao: TLabeledEdit;
    dtemissao: TJvDatePickerEdit;
    Label1: TLabel;
    idcliente: TJvComboEdit;
    Label2: TLabel;
    cliente: TJvStaticText;
    parcela: TJvSpinEdit;
    Label3: TLabel;
    parcelas: TJvSpinEdit;
    Label4: TLabel;
    dtvencimento: TJvDatePickerEdit;
    Label5: TLabel;
    valor: TJvValidateEdit;
    Label7: TLabel;
    documento: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure valorChange(Sender: TObject);
    procedure valorClick(Sender: TObject);
    procedure valorEnter(Sender: TObject);
    procedure idclienteButtonClick(Sender: TObject);
    procedure idclienteChange(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fdmtb_cartoes: TFDMemTable;
  public
    { Public declarations }
  end;

var
  frmCartoes: TfrmCartoes;

implementation

{$R *.dfm}

uses
  view.cadastros.clientePesquisa,
  view.financeiro.cartoesPesquisa,
  controller.dto.cliente.interfaces,
  controller.dto.cliente.interfaces.impl,
  controller.dto.cartoes.interfaces,
  controller.dto.cartoes.interfaces.impl;

procedure TfrmCartoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCartoes := Nil;
end;

procedure TfrmCartoes.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_cartoes := TFDMemTable.Create(nil);
end;

procedure TfrmCartoes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_cartoes);
end;

procedure TfrmCartoes.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmCartoes.idclienteButtonClick(Sender: TObject);
begin
  inherited;
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
  Begin
    idcliente.Text := FormatFloat('0000000', TGlobal.entityId);
    parcela.SetFocus;
  End;
end;

procedure TfrmCartoes.valorChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);
  if Length(valor) = 0 then
    valor := '0';
  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCartoes.valorClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCartoes.valorEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmCartoes.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

{$REGION 'Procedures de manipulação de "objetos"'}

procedure TfrmCartoes.sbtnAnteriorClick(Sender: TObject);
var
  listaCartoes: TObjectList<TCartoes>;
begin
  Try
    var
    ICartoes := TICartoes.New;
    if operacao = 'incluir' then
      begin
        ICartoes.Build.GetRecordsNumber('tbcartoes', '', recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      if recordAtual > 0 then
        recordAtual := recordAtual - 1;

    ICartoes.Build.ListPaginate('', listaCartoes, 'idtbcartao', 1, recordAtual);
    if listaCartoes.Count > 0 then
      begin
        Self.Navegacao(fdmtb_cartoes, 2);
        Self.DataSetToFiels(fdmtb_cartoes);
        operacao := 'alterar';
      end;
    listaCartoes.Clear;
    FreeAndNil(listaCartoes);
  Except
    On E: Exception Do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmCartoes.sbtnProximoClick(Sender: TObject);
var
  listaCartoes: TObjectList<TCartoes>;
begin
  Try
    var
    ICartoes := TICartoes.New;
    if operacao = 'incluir' then
      begin
        ICartoes.Build.GetRecordsNumber('tbcartoes', '', recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    ICartoes.Build.ListPaginate('', listaCartoes, 'idtbcartao', 1, recordAtual);
    if listaCartoes.Count > 0 then
      begin
        Self.Navegacao(fdmtb_cartoes, 3);
        Self.DataSetToFiels(fdmtb_cartoes);
        operacao := 'alterar';
      end
    else
      recordAtual := recordAtual - 1; // Calculo para não avançar além do último
                                      // registro localizado
    listaCartoes.Clear;
    FreeAndNil(listaCartoes);
  Except
    On E: Exception Do
      MsgErro(E.Message);
  End;
  inherited;
end;

procedure TfrmCartoes.idclienteChange(Sender: TObject);
var
  listaClientes: TObjectList<TCliente>;
begin
  if idcliente.Text <> EmptyStr then
  begin
    Try
      var
      ICliente := TICliente.New;
      ICliente.Build.ListAll('idtbcliente = ' +
      (StrToInt(idcliente.Text)).ToString, listaClientes,'');

      if listaClientes.Count > 0 then
      begin
        cliente.Caption := (listaClientes.Items[0] as TCliente).nome;
        operacao := 'alterar';
      end
      else if idcliente.Text = '0' then
        cliente.Caption := 'CONSUMIDOR FINAL'
      else
        cliente.Caption := 'INEXISTENTE';
    Finally
      listaClientes.Clear;
      FreeAndNil(listaClientes);
    End;
  end
  else
    cliente.Caption := '';
end;

procedure TfrmCartoes.sbtnDeletarClick(Sender: TObject);
begin
  inherited;
  if operacao <> 'alterar' then
    Exit;
  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Exit;
  Try
    var
    ICartoes := TICartoes.New;
    ICartoes.idtbcartao(StrToInt(idtbcartao.Text)).Build.Delete;
    sbtnNovo.Click;
  Except
    On E: Exception Do
      MsgErro(E.Message);
  End;
end;

procedure TfrmCartoes.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  ICartoes := TICartoes.New;
  ICartoes.Build.GetRecordsNumber('tbcartoes', '', nextId);
  idtbcartao.Text := FormatFloat('000000', (nextId + 1));
  parcela.Value := 1;
  parcelas.Value := 1;
  dtemissao.SetFocus;
  inherited;
end;

procedure TfrmCartoes.sbtnPesquisarClick(Sender: TObject);
var
  listaCartoes: TObjectList<TCartoes>;
begin
  OpenFormModal(TfrmPesquisaCartoes, frmPesquisaCartoes);
  if TGlobal.entityId > 0 then
  begin
    var
    ICartoes := TICartoes.New;
    ICartoes.Build.ListAll('idtbcartao = ' + TGlobal.entityId.ToString,
      listaCartoes, '');
    TDataSetHelper.PreencheDataSet<TCartoes>(listaCartoes, fdmtb_cartoes);
    Self.DataSetToFiels(fdmtb_cartoes);
    listaCartoes.Clear;
    FreeAndNil(listaCartoes);
    case AnsiIndexStr(fdmtb_cartoes.FieldByName('origem').AsString,
      ['D', 'A', 'V']) of
      0:
        documento.Text := fdmtb_cartoes.FieldByName('documento').AsString;
      1:
        documento.Text := 'Aluguel: ' + fdmtb_cartoes.FieldByName
          ('origem').AsString;
      2:
        documento.Text := 'Venda: ' + fdmtb_cartoes.FieldByName
          ('origem').AsString;
    end;
    operacao := 'alterar';
  end;
  inherited;
end;

procedure TfrmCartoes.sbtnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    var
    ICartoes := TICartoes.New;
    if operacao = 'incluir' then
    begin
      ICartoes.idtbcartao(StrToInt(idtbcartao.Text))
        .idtbempresa(TGlobal.empresa).dtemissao(Self.dtemissao.Date)
        .idcliente(StrToInt(idcliente.Text)).parcela(parcela.AsInteger)
        .parcelas(parcelas.AsInteger).dtvencimento(dtvencimento.Date)
        .valor(valor.Value).origem('D').documento(documento.Text)
        .usercad(TGlobal.userId).useralt(TGlobal.userId).Build.Insert;
    end
    else
    begin
      var
        listaCartoes: TObjectList<TCartoes>;

      var
      objCartao := ICartoes.Build.ListById('idtbcartao',
        StrToInt(idtbcartao.Text), listaCartoes).This;
      ICartoes.Build.Modify(objCartao);

      With objCartao Do
      Begin
        idtbcartao := StrToInt(Self.idtbcartao.Text);
        idtbempresa := idtbempresa;
        dtemissao := Self.dtemissao.Date;
        idcliente := StrToInt(Self.idcliente.Text);
        parcela := Self.parcela.AsInteger;
        parcelas := Self.parcelas.AsInteger;
        dtvencimento := Self.dtvencimento.Date;
        valor := Self.valor.AsCurrency;
        origem := origem;
        documento := Self.documento.Text;
        useralt := TGlobal.userId;
      End;
      ICartoes.Build.Update;
      listaCartoes.Clear;
      FreeAndNil(listaCartoes);
    end;
    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  except
    on E: Exception do
      MsgErro(E.Message);
  end;
end;
{$ENDREGION}

end.
