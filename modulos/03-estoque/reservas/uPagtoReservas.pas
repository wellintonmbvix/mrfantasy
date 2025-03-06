unit uPagtoReservas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,

  uGlobal,
  uRotinas,
  uControle,

  Data.Db,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Mask,

  JvExStdCtrls,
  JvEdit,
  JvValidateEdit,
  JvExMask,
  JvSpin,
  JvComponentBase,
  JvBalloonHint, JvToolEdit;

type
  TfPagtoReservas = class(TForm)
    pnlDinheiro: TPanel;
    Image1: TImage;
    jvv_dinheiro: TJvValidateEdit;
    lbl_dinheiro: TLabel;
    pnlCartDeb: TPanel;
    Image2: TImage;
    lbl_cartaodeb: TLabel;
    jvv_cartaodeb: TJvValidateEdit;
    pnCartCred: TPanel;
    Image3: TImage;
    lbl_cartaocred: TLabel;
    jvv_cartaocred: TJvValidateEdit;
    check_cash: TCheckBox;
    check_debito: TCheckBox;
    check_credito: TCheckBox;
    ledt_vlreserva: TLabeledEdit;
    pnlTotais: TPanel;
    Image4: TImage;
    Label1: TLabel;
    Image5: TImage;
    Label2: TLabel;
    jvsedt_parcelas: TJvSpinEdit;
    Label3: TLabel;
    JvBalloonHint1: TJvBalloonHint;
    pnlWalletDigital: TPanel;
    Image6: TImage;
    jvv_walletdigital: TJvValidateEdit;
    check_wallet: TCheckBox;
    Label4: TLabel;
    jvce_idcarteira: TJvComboEdit;
    ledt_vlsaldo: TLabeledEdit;
    pnlTransfDep: TPanel;
    Image7: TImage;
    Label5: TLabel;
    jvv_transfdep: TJvValidateEdit;
    check_transfdep: TCheckBox;
    procedure check_cashClick(Sender: TObject);
    procedure check_debitoClick(Sender: TObject);
    procedure check_creditoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image5Click(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure jvv_dinheiroEnter(Sender: TObject);
    procedure jvv_dinheiroChange(Sender: TObject);
    procedure jvv_cartaodebChange(Sender: TObject);
    procedure jvv_cartaocredChange(Sender: TObject);
    procedure jvv_dinheiroClick(Sender: TObject);
    procedure jvv_walletdigitalChange(Sender: TObject);
    procedure jvce_idcarteiraButtonClick(Sender: TObject);
    procedure jvce_idcarteiraChange(Sender: TObject);
    procedure jvv_transfdepChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPagtoReservas: TfPagtoReservas;
  wallet: String;
  Controle      : TControle;

implementation

{$R *.dfm}

uses uPrincipal, uReservas, uPesquisaWalletsDigital;

procedure TfPagtoReservas.check_cashClick(Sender: TObject);
begin
  { ***  Decidi não validar se escolhido e não preenchido
    deixei validando a soma de tudo antes de gravar *** }

  // jvv_dinheiro.Enabled := check_cash.Checked;
  // if Not check_cash.Checked then
  // jvv_dinheiro.Value   := 0;
end;

procedure TfPagtoReservas.check_creditoClick(Sender: TObject);
begin
  { ***  Decidi não validar se escolhido e não preenchido
    deixei validando a soma de tudo antes de gravar *** }

  // jvv_cartaocred.Enabled   := check_credito.Checked;
  // jvsedt_parcelas.Enabled  := check_credito.Checked;
  // if Not check_credito.Checked then
  // jvv_cartaocred.Value := 0;
end;

procedure TfPagtoReservas.check_debitoClick(Sender: TObject);
begin
  { ***  Decidi não validar se escolhido e não preenchido
    deixei validando a soma de tudo antes de gravar *** }

  // jvv_cartaodeb.Enabled := check_debito.Checked;
  // if Not check_debito.Checked then
  // jvv_cartaodeb.Value := 0;
end;

procedure TfPagtoReservas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fPagtoReservas := Nil;
end;

procedure TfPagtoReservas.FormCreate(Sender: TObject);
begin
  Controle := TControle.Create;
end;

procedure TfPagtoReservas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Controle);
end;

procedure TfPagtoReservas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If Key = #13 then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TfPagtoReservas.Image4Click(Sender: TObject);
var
  fdqComando: TFDQuery;
begin

  if ledt_vlsaldo.Text <> 'R$ 0,00' then
  Begin
    MsgAviso('A soma das condições não confere com o Valor Total');
    Abort;
  End;

  if Not MsgConfirmacao('Confirmar o pagamento dessa reserva?') then
    Abort;

  Try
    fdqComando := TFDQuery.Create(nil);
    fdqComando.Connection := Controle.Conexao.GetConexao;

    With fdqComando Do
    Begin
      // Se pagto wallet preenchido
      if check_wallet.Checked then
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT descricao FROM tbcfgwalletsdigital');
        SQL.Add('WHERE idtbwallet = :carteira');
        ParamByName('carteira').Value := StrToInt(jvce_idcarteira.Text);
        Open;
        if IsEmpty then
        Begin
          MsgErro('Carteira digital inválida');
          Exit;
        End
        Else
          wallet := FieldByName('descricao').AsString;

        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcaixa(');
        SQL.Add('idtbempresa,');
        SQL.Add('operacao,');
        SQL.Add('origem,');
        SQL.Add('valor,');
        SQL.Add('documento,');
        SQL.Add('condicao,');
        SQL.Add('tpmov,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':operacao,');
        SQL.Add(':origem,');
        SQL.Add(':valor,');
        SQL.Add(':documento,');
        SQL.Add(':condicao,');
        SQL.Add(':tpmov,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('operacao').Value    := 'C';
        ParamByName('origem').Value      := 'A';
        ParamByName('valor').AsCurrency  := jvv_walletdigital.Value;
        ParamByName('documento').Value   := fReservas.ledt_idreserva.Text;
        ParamByName('condicao').Value    := wallet;
        ParamByName('tpmov').Value       := '';
        ParamByName('usercad').Value     := UserLog;
        ParamByName('useralt').Value     := UserLog;

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
        SQL.Add('INSERT INTO tbreservaspagto(');
        SQL.Add('idresvpagto,');
        SQL.Add('idresvcab,');
        SQL.Add('tipopagto,');
        SQL.Add('valor');
        SQL.Add(')values(');
        SQL.Add(':idresvpagto,');
        SQL.Add(':idresvcab,');
        SQL.Add(':tipopagto,');
        SQL.Add(':valor)');
        ParamByName('idresvpagto').AsString := GuidCreate();
        ParamByName('idresvcab').AsString   := sReserva;
        ParamByName('tipopagto').AsString   := wallet;
        ParamByName('valor').Value          := jvv_walletdigital.Value;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
          End;
        End;
      End;

      // Se pagto dinheiro preenchido
      if check_cash.Checked then
      Begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcaixa(');
        SQL.Add('idtbempresa,');
        SQL.Add('operacao,');
        SQL.Add('origem,');
        SQL.Add('valor,');
        SQL.Add('documento,');
        SQL.Add('condicao,');
        SQL.Add('tpmov,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':operacao,');
        SQL.Add(':origem,');
        SQL.Add(':valor,');
        SQL.Add(':documento,');
        SQL.Add(':condicao,');
        SQL.Add(':tpmov,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('operacao').Value    := 'C';
        ParamByName('origem').Value      := 'A';
        ParamByName('valor').AsCurrency  := jvv_dinheiro.Value;
        ParamByName('documento').Value   := fReservas.ledt_idreserva.Text;
        ParamByName('condicao').Value    := 'Dinheiro';
        ParamByName('tpmov').Value       := 'Suprimento';
        ParamByName('usercad').Value     := UserLog;
        ParamByName('useralt').Value     := UserLog;

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
        SQL.Add('INSERT INTO tbreservaspagto(');
        SQL.Add('idresvpagto,');
        SQL.Add('idresvcab,');
        SQL.Add('tipopagto,');
        SQL.Add('valor');
        SQL.Add(')values(');
        SQL.Add(':idresvpagto,');
        SQL.Add(':idresvcab,');
        SQL.Add(':tipopagto,');
        SQL.Add(':valor)');
        ParamByName('idresvpagto').AsString := GuidCreate();
        ParamByName('idresvcab').AsString   := sReserva;
        ParamByName('tipopagto').AsString   := 'Dinheiro';
        ParamByName('valor').Value          := jvv_dinheiro.Value;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
          End;
        End;
      End;

      // Se pagto Card Débito preenchido
      if check_debito.Checked then
      Begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcaixa(');
        SQL.Add('idtbempresa,');
        SQL.Add('operacao,');
        SQL.Add('origem,');
        SQL.Add('valor,');
        SQL.Add('documento,');
        SQL.Add('condicao,');
        SQL.Add('tpmov,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':operacao,');
        SQL.Add(':origem,');
        SQL.Add(':valor,');
        SQL.Add(':documento,');
        SQL.Add(':condicao,');
        SQL.Add(':tpmov,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('operacao').Value    := 'C';
        ParamByName('origem').Value      := 'A';
        ParamByName('valor').AsCurrency  := jvv_cartaodeb.Value;
        ParamByName('documento').Value   := fReservas.ledt_idreserva.Text;
        ParamByName('condicao').Value    := 'Cartão Débito';
        ParamByName('tpmov').Value       := '';
        ParamByName('usercad').Value     := UserLog;
        ParamByName('useralt').Value     := UserLog;

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
        SQL.Add('call stp_insertcartoes(');
        SQL.Add(':empresa,');
        SQL.Add(':emissao,');
        SQL.Add(':cliente,');
        SQL.Add(':parcelas,');
        SQL.Add(':valortotal,');
        SQL.Add(':origem,');
        SQL.Add(':documento,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt,');
        SQL.Add(':tipo)');
        ParamByName('empresa').Value    := EmpLog;
        ParamByName('emissao').Value    := Date();
        ParamByName('cliente').Value    := StrToInt(fReservas.jvcedt_idclie.Text);
        ParamByName('parcelas').Value   := 1;
        ParamByName('valortotal').Value := jvv_cartaodeb.Value;
        ParamByName('origem').Value     := 'A';
        ParamByName('documento').Value  := fReservas.ledt_idreserva.Text;
        ParamByName('usercad').Value    := UserLog;
        ParamByName('useralt').Value    := UserLog;
        ParamByName('tipo').AsString    := 'D';

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
        SQL.Add('INSERT INTO tbreservaspagto(');
        SQL.Add('idresvpagto,');
        SQL.Add('idresvcab,');
        SQL.Add('tipopagto,');
        SQL.Add('valor');
        SQL.Add(')values(');
        SQL.Add(':idresvpagto,');
        SQL.Add(':idresvcab,');
        SQL.Add(':tipopagto,');
        SQL.Add(':valor)');
        ParamByName('idresvpagto').AsString := GuidCreate();
        ParamByName('idresvcab').AsString   := sReserva;
        ParamByName('tipopagto').AsString   := 'Cartão Débito';
        ParamByName('valor').Value          := jvv_cartaodeb.Value;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
          End;
        End;
      End;

      // Se pagto Card Crédito preenchido
      if check_credito.Checked then
      Begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcaixa(');
        SQL.Add('idtbempresa,');
        SQL.Add('operacao,');
        SQL.Add('origem,');
        SQL.Add('valor,');
        SQL.Add('documento,');
        SQL.Add('condicao,');
        SQL.Add('tpmov,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':operacao,');
        SQL.Add(':origem,');
        SQL.Add(':valor,');
        SQL.Add(':documento,');
        SQL.Add(':condicao,');
        SQL.Add(':tpmov,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('operacao').Value    := 'C';
        ParamByName('origem').Value      := 'A';
        ParamByName('valor').AsCurrency  := jvv_cartaocred.Value;
        ParamByName('documento').Value   := fReservas.ledt_idreserva.Text;
        ParamByName('condicao').Value    := 'Cartão Crédito';
        ParamByName('tpmov').Value       := '';
        ParamByName('usercad').Value     := UserLog;
        ParamByName('useralt').Value     := UserLog;

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
        SQL.Add('call stp_insertcartoes(');
        SQL.Add(':empresa,');
        SQL.Add(':emissao,');
        SQL.Add(':cliente,');
        SQL.Add(':parcelas,');
        SQL.Add(':valortotal,');
        SQL.Add(':origem,');
        SQL.Add(':documento,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt,');
        SQL.Add(':tipo)');
        ParamByName('empresa').Value    := EmpLog;
        ParamByName('emissao').Value    := Date();
        ParamByName('cliente').Value    := StrToInt(fReservas.jvcedt_idclie.Text);
        ParamByName('parcelas').Value   := jvsedt_parcelas.Value;
        ParamByName('valortotal').Value := jvv_cartaocred.Value;
        ParamByName('origem').Value     := 'A';
        ParamByName('documento').Value  := fReservas.ledt_idreserva.Text;
        ParamByName('usercad').Value    := UserLog;
        ParamByName('useralt').Value    := UserLog;
        ParamByName('tipo').AsString    := 'C';

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
        SQL.Add('INSERT INTO tbreservaspagto(');
        SQL.Add('idresvpagto,');
        SQL.Add('idresvcab,');
        SQL.Add('tipopagto,');
        SQL.Add('valor');
        SQL.Add(')values(');
        SQL.Add(':idresvpagto,');
        SQL.Add(':idresvcab,');
        SQL.Add(':tipopagto,');
        SQL.Add(':valor)');
        ParamByName('idresvpagto').AsString := GuidCreate();
        ParamByName('idresvcab').AsString   := sReserva;
        ParamByName('tipopagto').AsString   := 'Cartão Crédito';
        ParamByName('valor').Value          := jvv_cartaocred.Value;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
          End;
        End;
      End;

      // Se pagto transf. dep. preenchido
      if check_transfdep.Checked then
      Begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbcaixa(');
        SQL.Add('idtbempresa,');
        SQL.Add('operacao,');
        SQL.Add('origem,');
        SQL.Add('valor,');
        SQL.Add('documento,');
        SQL.Add('condicao,');
        SQL.Add('tpmov,');
        SQL.Add('usercad,');
        SQL.Add('useralt');
        SQL.Add(')VALUES(');
        SQL.Add(':idtbempresa,');
        SQL.Add(':operacao,');
        SQL.Add(':origem,');
        SQL.Add(':valor,');
        SQL.Add(':documento,');
        SQL.Add(':condicao,');
        SQL.Add(':tpmov,');
        SQL.Add(':usercad,');
        SQL.Add(':useralt)');
        ParamByName('idtbempresa').Value := EmpLog;
        ParamByName('operacao').Value    := 'C';
        ParamByName('origem').Value      := 'A';
        ParamByName('valor').AsCurrency  := jvv_transfdep.Value;
        ParamByName('documento').Value   := fReservas.ledt_idreserva.Text;
        ParamByName('condicao').Value    := 'Transf./Dep.';
        ParamByName('tpmov').Value       := '';
        ParamByName('usercad').Value     := UserLog;
        ParamByName('useralt').Value     := UserLog;

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
        SQL.Add('INSERT INTO tbreservaspagto(');
        SQL.Add('idresvpagto,');
        SQL.Add('idresvcab,');
        SQL.Add('tipopagto,');
        SQL.Add('valor');
        SQL.Add(')values(');
        SQL.Add(':idresvpagto,');
        SQL.Add(':idresvcab,');
        SQL.Add(':tipopagto,');
        SQL.Add(':valor)');
        ParamByName('idresvpagto').AsString := GuidCreate();
        ParamByName('idresvcab').AsString   := sReserva;
        ParamByName('tipopagto').AsString   := 'Transf./Dep.';
        ParamByName('valor').Value          := jvv_transfdep.Value;

        Try
          ExecSQL;
        Except
          On E: Exception Do
          Begin
            MsgErro('Erro de rotina' + #13 + E.Message);
          End;
        End;
      End;
    End;

    if check_cash.Checked AND Not check_debito.Checked AND
      Not check_credito.Checked AND Not check_wallet.Checked AND
      Not check_transfdep.Checked then
      condpagto := 'Dinheiro'
    else if Not check_cash.Checked AND check_debito.Checked AND
      Not check_credito.Checked AND Not check_wallet.Checked AND
      Not check_transfdep.Checked then
      condpagto := 'Cartão Débito'
    else if Not check_cash.Checked AND Not check_debito.Checked AND
      check_credito.Checked AND Not check_wallet.Checked AND
      Not check_transfdep.Checked then
      condpagto := 'Cartão Crédito'
    else if Not check_cash.Checked AND Not check_debito.Checked AND
      Not check_credito.Checked AND check_wallet.Checked AND
      Not check_transfdep.Checked then
      condpagto := wallet
    else if Not check_cash.Checked AND Not check_debito.Checked AND
      Not check_credito.Checked AND Not check_wallet.Checked AND
      check_transfdep.Checked then
      condpagto := 'Transf./Dep.'
    else
      condpagto := 'Diversos';

    ReservaPaga := True;

    Self.Close;
  Finally
    FreeAndNil(fdqComando);
  End;
end;

procedure TfPagtoReservas.Image4MouseEnter(Sender: TObject);
begin
  (Sender as TImage).Height := 76;
  (Sender as TImage).Width := 76;
  (Sender as TImage).Left := (Sender as TImage).Left + 2;
  (Sender as TImage).Top := (Sender as TImage).Top + 2;
  Label1.Font.Style := [fsBold];
end;

procedure TfPagtoReservas.Image4MouseLeave(Sender: TObject);
begin
  (Sender as TImage).Height := 78;
  (Sender as TImage).Width := 78;
  (Sender as TImage).Left := (Sender as TImage).Left - 2;
  (Sender as TImage).Top := (Sender as TImage).Top - 2;
  Label1.Font.Style := [];
end;

procedure TfPagtoReservas.Image5Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfPagtoReservas.Image5MouseEnter(Sender: TObject);
begin
  (Sender as TImage).Height := 76;
  (Sender as TImage).Width := 76;
  (Sender as TImage).Left := (Sender as TImage).Left + 2;
  (Sender as TImage).Top := (Sender as TImage).Top + 2;
  Label2.Font.Style := [fsBold];
end;

procedure TfPagtoReservas.Image5MouseLeave(Sender: TObject);
begin
  (Sender as TImage).Height := 78;
  (Sender as TImage).Width := 78;
  (Sender as TImage).Left := (Sender as TImage).Left - 2;
  (Sender as TImage).Top := (Sender as TImage).Top - 2;
  Label2.Font.Style := [];
end;

procedure TfPagtoReservas.jvce_idcarteiraButtonClick(Sender: TObject);
begin
  nWallet := 0;
  OpenFormModal(TfPesquisaWalletsDigital, fPesquisaWalletsDigital);
  if nWallet > 0 then
    jvce_idcarteira.Text := FormatFloat('000', nWallet);
end;

procedure TfPagtoReservas.jvce_idcarteiraChange(Sender: TObject);
begin
  jvv_walletdigital.Enabled := Boolean(Length(jvce_idcarteira.Text));
end;

procedure TfPagtoReservas.jvv_cartaocredChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  ledt_vlsaldo.Text := FormatFloat('R$ ###,##0.00',
    StrToCurr(SomenteNumero('R$ .', ledt_vlreserva.Text)) -
    ((StrToCurr(SomenteNumero('R$ .', valor)) / 100) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaodeb.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_dinheiro.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_transfdep.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_walletdigital.Text))));

  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  if TJvValidateEdit(Sender).Text = 'R$ 0,00' then
    check_credito.Checked := False
  else
    check_credito.Checked := True;
end;

procedure TfPagtoReservas.jvv_cartaodebChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  ledt_vlsaldo.Text := FormatFloat('R$ ###,##0.00',
    StrToCurr(SomenteNumero('R$ .', ledt_vlreserva.Text)) -
    ((StrToCurr(SomenteNumero('R$ .', valor)) / 100) +
    StrToCurr(SomenteNumero('R$ .', jvv_dinheiro.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaocred.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_transfdep.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_walletdigital.Text))));

  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  if TJvValidateEdit(Sender).Text = 'R$ 0,00' then
    check_debito.Checked := False
  else
    check_debito.Checked := True;
end;

procedure TfPagtoReservas.jvv_dinheiroChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  ledt_vlsaldo.Text := FormatFloat('R$ ###,##0.00',
    StrToCurr(SomenteNumero('R$ .', ledt_vlreserva.Text)) -
    ((StrToCurr(SomenteNumero('R$ .', valor)) / 100) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaodeb.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaocred.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_transfdep.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_walletdigital.Text))));

  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  if TJvValidateEdit(Sender).Text = 'R$ 0,00' then
    check_cash.Checked := False
  else
    check_cash.Checked := True;
end;

procedure TfPagtoReservas.jvv_dinheiroClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfPagtoReservas.jvv_dinheiroEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfPagtoReservas.jvv_transfdepChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  ledt_vlsaldo.Text := FormatFloat('R$ ###,##0.00',
    StrToCurr(SomenteNumero('R$ .', ledt_vlreserva.Text)) -
    ((StrToCurr(SomenteNumero('R$ .', valor)) / 100) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaodeb.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaocred.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_walletdigital.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_dinheiro.Text))));

  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  if TJvValidateEdit(Sender).Text = 'R$ 0,00' then
    check_transfdep.Checked := False
  else
    check_transfdep.Checked := True;
end;

procedure TfPagtoReservas.jvv_walletdigitalChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  ledt_vlsaldo.Text := FormatFloat('R$ ###,##0.00',
    StrToCurr(SomenteNumero('R$ .', ledt_vlreserva.Text)) -
    ((StrToCurr(SomenteNumero('R$ .', valor)) / 100) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaodeb.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_cartaocred.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_transfdep.Text)) +
    StrToCurr(SomenteNumero('R$ .', jvv_dinheiro.Text))));

  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  if TJvValidateEdit(Sender).Text = 'R$ 0,00' then
    check_wallet.Checked := False
  else
    check_wallet.Checked := True;
end;

end.
