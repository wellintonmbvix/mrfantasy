unit uEmpresas;

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

  uControle,
  view.cadastros.padrao,
  uGlobal,
  uClasseEmpresas,
  uRotinas,

  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  FireDAC.Comp.Client, Vcl.Mask;

type
  TfEmpresas = class(TfrmCadPadrao)
    ledt_idempresa: TLabeledEdit;
    ledt_razao: TLabeledEdit;
    ledt_fantasia: TLabeledEdit;
    ledt_endereco: TLabeledEdit;
    ledt_nro: TLabeledEdit;
    ledt_comp: TLabeledEdit;
    ledt_bairro: TLabeledEdit;
    ledt_cidade: TLabeledEdit;
    ledt_cep: TLabeledEdit;
    cbox_uf: TComboBox;
    Label1: TLabel;
    ledt_cnpj: TLabeledEdit;
    ledt_inscest: TLabeledEdit;
    mobsaluguel: TMemo;
    Label2: TLabel;
    ledt_fone1: TLabeledEdit;
    ledt_fone2: TLabeledEdit;
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ledt_cnpjEnter(Sender: TObject);
    procedure ledt_cnpjExit(Sender: TObject);
    procedure ledt_inscestEnter(Sender: TObject);
    procedure ledt_inscestExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure mobsaluguelEnter(Sender: TObject);
    procedure mobsaluguelExit(Sender: TObject);
    procedure mobsaluguelKeyPress(Sender: TObject; var Key: Char);
    procedure ledt_fone1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmpresas: TfEmpresas;
  fdqEmpresa: TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaEmpresas;

procedure TfEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fEmpresas := Nil;
end;

procedure TfEmpresas.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfEmpresas.ledt_cnpjEnter(Sender: TObject);
begin
  inherited;
  ledt_cnpj.Text := SomenteNumero('./-', ledt_cnpj.Text);
end;

procedure TfEmpresas.ledt_cnpjExit(Sender: TObject);
begin
  inherited;
  // Se campo estiver vazio não faz nada
  if ledt_cnpj.Text = EmptyStr then
    Exit;

  if Not ValidaCpfCnpj(ledt_cnpj.Text) then
  Begin
    MsgErro('Cnpj inválido');
    ledt_cnpj.SetFocus;
    Abort;
  End;

  ledt_cnpj.Text := MascaraCpfCnpj(ledt_cnpj.Text);
end;

procedure TfEmpresas.ledt_fone1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(TLabeledEdit(Sender), Key);
end;

procedure TfEmpresas.ledt_inscestEnter(Sender: TObject);
begin
  inherited;
  ledt_inscest.Text := SomenteNumero(' .-/', ledt_inscest.Text);
end;

procedure TfEmpresas.ledt_inscestExit(Sender: TObject);
begin
  inherited;
  if ledt_inscest.Text = EmptyStr then
    Exit;
  ledt_inscest.Text := MascaraInscricao(ledt_inscest.Text, cbox_uf.Text);
end;

procedure TfEmpresas.mobsaluguelEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfEmpresas.mobsaluguelExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfEmpresas.mobsaluguelKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if mobsaluguel.Lines.Count > 2 then
    mobsaluguel.ScrollBars := ssVertical
  else
    mobsaluguel.ScrollBars := ssNone;
end;

procedure TfEmpresas.sbtnAnteriorClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    With ClasseEmpresas Do
    Begin
      CarregaDados(StrToInt(ledt_idempresa.Text) - 1);
      if vControle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idempresa.Text := FormatFloat('00', Empresa);
      ledt_razao.Text := Razao;
      ledt_fantasia.Text := Fantasia;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cnpj.Text := Cnpj;
      ledt_inscest.Text := InscEst;
      mobsaluguel.Text := ObsAluguel;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfEmpresas.sbtnDeletarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    With ClasseEmpresas Do
    Begin
      Empresa := StrToInt(ledt_idempresa.Text);
      if ExcluiEmpresas then
        sbtnNovo.Click;
    End;
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnDuplicarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    ledt_idempresa.Text := FormatFloat('00', ClasseEmpresas.PegarRegistro);
    cbox_uf.ItemIndex := 7; // 7-Define ES como estado escolhido
    operacao := 'incluir';
    ledt_cnpj.Clear;
    ledt_inscest.Clear;

    ledt_razao.SetFocus;
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnNovoClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  Try
    LimpaCampos;
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    ledt_idempresa.Text := FormatFloat('00', ClasseEmpresas.PegarRegistro);
    cbox_uf.ItemIndex := 7; // 7-Define ES como estado escolhido
    operacao := 'incluir';

    ledt_razao.SetFocus;
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnPesquisarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;

  sbtnNovo.Click;
  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    With ClasseEmpresas Do
    Begin
      nEmpresa := 0;
      OpenFormModal(TfPesquisaEmpresas, fPesquisaEmpresas);
      if nEmpresa > 0 then
      Begin
        CarregaDados(nEmpresa);
        ledt_idempresa.Text := FormatFloat('00', Empresa);
        ledt_razao.Text := Razao;
        ledt_fantasia.Text := Fantasia;
        ledt_endereco.Text := Endereco;
        ledt_nro.Text := Nro;
        ledt_comp.Text := Complemento;
        ledt_bairro.Text := Bairro;
        ledt_cidade.Text := Cidade;
        ledt_cep.Text := Cep;
        cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
        ledt_cnpj.Text := Cnpj;
        ledt_inscest.Text := InscEst;
        mobsaluguel.Text := ObsAluguel;
        ledt_fone1.Text := Fone1;
        ledt_fone2.Text := Fone2;
        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnProximoClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    With ClasseEmpresas Do
    Begin
      CarregaDados(StrToInt(ledt_idempresa.Text) + 1);
      if vControle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idempresa.Text := FormatFloat('00', Empresa);
      ledt_razao.Text := Razao;
      ledt_fantasia.Text := Fantasia;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cnpj.Text := Cnpj;
      ledt_inscest.Text := InscEst;
      mobsaluguel.Text := ObsAluguel;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

procedure TfEmpresas.sbtnSalvarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseEmpresas: TClasseEmpresas;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseEmpresas := TClasseEmpresas.Create(vControle);
    With ClasseEmpresas Do
    Begin
      Empresa := StrToInt(ledt_idempresa.Text);
      Razao := ledt_razao.Text;
      Fantasia := ledt_fantasia.Text;
      Endereco := ledt_endereco.Text;
      Nro := ledt_nro.Text;
      Complemento := ledt_comp.Text;
      Bairro := ledt_bairro.Text;
      Cidade := ledt_cidade.Text;
      Cep := ledt_cep.Text;
      UF := cbox_uf.Text;
      Cnpj := ledt_cnpj.Text;
      InscEst := ledt_inscest.Text;
      ObsAluguel := mobsaluguel.Text;
      Fone1 := ledt_fone1.Text;
      Fone2 := ledt_fone2.Text;
      UserCad := UserLog;
      UserAlt := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        if Not InsereEmpresas then
          Exit;
      end
      else
      begin
        if Not AlteraEmpreas then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseEmpresas);
    FreeAndNil(vControle);
  End;
end;

end.
