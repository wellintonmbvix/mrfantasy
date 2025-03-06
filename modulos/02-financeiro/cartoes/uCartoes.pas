unit uCartoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Mask,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  uControle,
  uClasseClientes,
  uClasseCartoes,
  uCadPadrao,
  uGlobal,
  uRotinas,
  classe.global,

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
  TfCartoes = class(TfCadPadrao)
    ledt_idcartao: TLabeledEdit;
    jvdpe_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    jvce_idcliente: TJvComboEdit;
    Label2: TLabel;
    jvst_cliente: TJvStaticText;
    jvspe_parcela: TJvSpinEdit;
    Label3: TLabel;
    jvspe_parcelas: TJvSpinEdit;
    Label4: TLabel;
    jvdpe_vencimento: TJvDatePickerEdit;
    Label5: TLabel;
    jvve_valor: TJvValidateEdit;
    Label7: TLabel;
    ledt_documento: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure jvve_valorChange(Sender: TObject);
    procedure jvve_valorClick(Sender: TObject);
    procedure jvve_valorEnter(Sender: TObject);
    procedure jvce_idclienteButtonClick(Sender: TObject);
    procedure jvce_idclienteChange(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCartoes: TfCartoes;

implementation

{$R *.dfm}

uses uPrincipal, view.cadastros.clientePesquisa, uPesquisaCartoes;

procedure TfCartoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fCartoes := Nil;
end;

procedure TfCartoes.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfCartoes.jvce_idclienteButtonClick(Sender: TObject);
begin
  inherited;
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
  Begin
    jvce_idcliente.Text := FormatFloat('0000000', TGlobal.entityId);
    jvspe_parcela.SetFocus;
  End;
end;

procedure TfCartoes.jvce_idclienteChange(Sender: TObject);
var
  Controle      : TControle;
  ClasseClientes: TClasseClientes;
begin
  if jvce_idcliente.Text <> EmptyStr then
  Begin
    Try
      Controle       := TControle.Create;
      ClasseClientes := TClasseClientes.Create(Controle);
      With ClasseClientes Do
      Begin
        CarregaDados(StrToInt(jvce_idcliente.Text));
        if Cliente > 0 then
          jvst_cliente.Caption := Nome
        else
          jvst_cliente.Caption := 'INEXISTENTE';
      End;
    Finally
      FreeAndNil(ClasseClientes);
      FreeAndNil(Controle);
    End;
  End
  Else
    jvst_cliente.Caption := '';
end;

procedure TfCartoes.jvve_valorChange(Sender: TObject);
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

procedure TfCartoes.jvve_valorClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfCartoes.jvve_valorEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfCartoes.sbtnAnteriorClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  Try
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    With ClasseCartoes Do
    Begin
      CarregaDados(StrToInt(ledt_idcartao.Text) - 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idcartao.Text := FormatFloat('000000', IdCartao);
      jvdpe_emissao.Date := DtEmissao;
      if IdCliente > 0 then
        jvce_idcliente.Text := FormatFloat('000000', IdCliente)
      else
        jvce_idcliente.Clear;
      jvspe_parcela.Value := Parcela;
      jvspe_parcelas.Value := Parcelas;
      jvdpe_vencimento.Date := DtVencto;
      jvve_valor.Value := valor;
      case AnsiIndexStr(Origem, ['D', 'A', 'V']) of
        0:
          ledt_documento.Text := Documento;
        1:
          ledt_documento.Text := 'Aluguel: ' + Documento;
        2:
          ledt_documento.Text := 'Venda: ' + Documento;
      end;
    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

procedure TfCartoes.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as altera  es?') then
    sbtnNovo.Click;
end;

procedure TfCartoes.sbtnDeletarClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    With ClasseCartoes Do
    Begin
      IdCartao := StrToInt(ledt_idcartao.Text);
      if ExcluiCartoes then
        sbtnNovo.Click;
    End;
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

procedure TfCartoes.sbtnNovoClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  Try
    LimpaCampos;
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    ledt_idcartao.Text := FormatFloat('000000', ClasseCartoes.PegarRegistro);
    jvdpe_emissao.Date := Date;
    jvce_idcliente.Text := '';
    jvspe_parcela.Value := 1;
    jvspe_parcelas.Value := 1;
    jvdpe_vencimento.Date := Date;
    jvve_valor.Value := 0;
    ledt_documento.Text := '';

    jvdpe_emissao.SetFocus;
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

procedure TfCartoes.sbtnPesquisarClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  sbtnNovo.OnClick(sbtnNovo);
  Try
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    With ClasseCartoes Do
    Begin
      nCartao := 0;
      OpenFormModal(TfPesquisaCartoes, fPesquisaCartoes);
      if nCartao > 0 then
      Begin
        CarregaDados(nCartao);
        ledt_idcartao.Text := FormatFloat('000000', IdCartao);
        jvdpe_emissao.Date := DtEmissao;
        if IdCliente > 0 then
          jvce_idcliente.Text := FormatFloat('000000', IdCliente)
        else
          jvce_idcliente.Clear;
        jvspe_parcela.Value := Parcela;
        jvspe_parcelas.Value := Parcelas;
        jvdpe_vencimento.Date := DtVencto;
        jvve_valor.Value := valor;
        case AnsiIndexStr(Origem, ['D', 'A', 'V']) of
          0:
            ledt_documento.Text := Documento;
          1:
            ledt_documento.Text := 'Aluguel: ' + Documento;
          2:
            ledt_documento.Text := 'Venda: ' + Documento;
        end;
      End;
      operacao := 'alterar';
    End;
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

procedure TfCartoes.sbtnProximoClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  Try
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    With ClasseCartoes Do
    Begin
      CarregaDados(StrToInt(ledt_idcartao.Text) + 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idcartao.Text := FormatFloat('000000', IdCartao);
      jvdpe_emissao.Date := DtEmissao;
      if IdCliente > 0 then
        jvce_idcliente.Text := FormatFloat('000000', IdCliente)
      else
        jvce_idcliente.Clear;
      jvspe_parcela.Value := Parcela;
      jvspe_parcelas.Value := Parcelas;
      jvdpe_vencimento.Date := DtVencto;
      jvve_valor.Value := valor;
      case AnsiIndexStr(Origem, ['D', 'A', 'V']) of
        0:
          ledt_documento.Text := Documento;
        1:
          ledt_documento.Text := 'Aluguel: ' + Documento;
        2:
          ledt_documento.Text := 'Venda: ' + Documento;
      end;
    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

procedure TfCartoes.sbtnSalvarClick(Sender: TObject);
var
  Controle     : TControle;
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  Try
    Controle      := TControle.Create;
    ClasseCartoes := TClasseCartoes.Create(Controle);
    With ClasseCartoes Do
    Begin
      IdCartao := StrToInt(ledt_idcartao.Text);
      DtEmissao := jvdpe_emissao.Date;
      if jvce_idcliente.Text <> EmptyStr then
        IdCliente := StrToInt(jvce_idcliente.Text);
      Parcela := jvspe_parcela.AsInteger;
      Parcelas := jvspe_parcelas.AsInteger;
      DtVencto := jvdpe_vencimento.Date;
      valor := jvve_valor.Value;
      Documento := ledt_documento.Text;
      Origem := 'D';

      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        if Not InsereCartoes then
          Exit;
      end
      else
      begin
        if Not AlteraCartoes then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseCartoes);
    FreeAndNil(Controle);
  End;
end;

end.
