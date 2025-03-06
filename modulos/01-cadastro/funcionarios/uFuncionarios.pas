unit uFuncionarios;

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
  uCadPadrao,
//  view.cadastros.padrao,

  uGlobal,
  uClasseFuncionarios,
  uRotinas,

  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  FireDAC.Comp.Client, Vcl.Mask;

type
  TfFuncionarios = class(TfCadPadrao)
    ledt_idfuncionario: TLabeledEdit;
    ledt_nome: TLabeledEdit;
    ledt_funcao: TLabeledEdit;
    ledt_cpf: TLabeledEdit;
    ledt_rg: TLabeledEdit;
    ledt_admissao: TLabeledEdit;
    ledt_demissao: TLabeledEdit;
    ledt_cep: TLabeledEdit;
    ledt_endereco: TLabeledEdit;
    ledt_nro: TLabeledEdit;
    ledt_comp: TLabeledEdit;
    ledt_bairro: TLabeledEdit;
    ledt_cidade: TLabeledEdit;
    cbox_uf: TComboBox;
    Label1: TLabel;
    ledt_fone1: TLabeledEdit;
    ledt_fone2: TLabeledEdit;
    ledt_abreviatura: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ledt_admissaoKeyPress(Sender: TObject; var Key: Char);
    procedure ledt_demissaoKeyPress(Sender: TObject; var Key: Char);
    procedure ledt_fone1KeyPress(Sender: TObject; var Key: Char);
    procedure ledt_fone2KeyPress(Sender: TObject; var Key: Char);
    procedure ledt_cpfExit(Sender: TObject);
    procedure ledt_cpfEnter(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFuncionarios: TfFuncionarios;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaFuncionarios;

procedure TfFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fFuncionarios := Nil;
end;

procedure TfFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfFuncionarios.ledt_admissaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraData(ledt_admissao, Key);
end;

procedure TfFuncionarios.ledt_cpfEnter(Sender: TObject);
begin
  inherited;
  ledt_cpf.Text := SomenteNumero(' ./-', ledt_cpf.Text);
end;

procedure TfFuncionarios.ledt_cpfExit(Sender: TObject);
begin
  inherited;
  if ledt_cpf.Text <> EmptyStr then
  Begin
    if Not ValidaCpfCnpj(ledt_cpf.Text) then
    Begin
      MsgErro('CPF inv lido');
      ledt_cpf.SetFocus;
    End
    else
    Begin
      ledt_cpf.Text := MascaraCpfCnpj(ledt_cpf.Text);
    End;
  End;
end;

procedure TfFuncionarios.ledt_demissaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraData(ledt_demissao, Key);
end;

procedure TfFuncionarios.ledt_fone1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(ledt_fone1, Key);
end;

procedure TfFuncionarios.ledt_fone2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(ledt_fone2, Key);
end;

procedure TfFuncionarios.sbtnAnteriorClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    With ClasseFuncionarios Do
    Begin
      CarregaDados(StrToInt(ledt_idfuncionario.Text) - 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idfuncionario.Text := FormatFloat('0000', Funcionario);
      ledt_nome.Text := Nome;
      ledt_abreviatura.Text := Abreviatura;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cpf.Text := Cpf;
      ledt_rg.Text := Rg;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
      ledt_admissao.Text := Admissao;
      ledt_funcao.Text := Funcao;
      ledt_demissao.Text := Demissao;
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as altera  es?') then
    sbtnNovo.Click;
end;

procedure TfFuncionarios.sbtnDeletarClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    With ClasseFuncionarios Do
    Begin
      Funcionario := StrToInt(ledt_idfuncionario.Text);
      if Not ExcluiFuncionarios then
        Exit;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnDuplicarClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    ledt_idfuncionario.Text := FormatFloat('0000',
      ClasseFuncionarios.PegarRegistro);
    cbox_uf.ItemIndex := 7; // 7-Define ES como estado escolhido
    operacao := 'incluir';
    ledt_cpf.Clear;
    ledt_rg.Clear;

    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnNovoClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  Try
    LimpaCampos;
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    ledt_idfuncionario.Text := FormatFloat('0000',
      ClasseFuncionarios.PegarRegistro);
    cbox_uf.ItemIndex := 7; // 7-Define ES como estado escolhido
    operacao := 'incluir';

    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnPesquisarClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    With ClasseFuncionarios Do
    Begin
      nFuncionario := 0;
      OpenFormModal(TfPesquisaFuncionarios, fPesquisaFuncionarios);
      if nFuncionario > 0 then
      Begin
        CarregaDados(nFuncionario);
        ledt_idfuncionario.Text := FormatFloat('0000', Funcionario);
        ledt_nome.Text := Nome;
        ledt_abreviatura.Text := Abreviatura;
        ledt_endereco.Text := Endereco;
        ledt_nro.Text := Nro;
        ledt_comp.Text := Complemento;
        ledt_bairro.Text := Bairro;
        ledt_cidade.Text := Cidade;
        ledt_cep.Text := Cep;
        cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
        ledt_cpf.Text := Cpf;
        ledt_rg.Text := Rg;
        ledt_fone1.Text := Fone1;
        ledt_fone2.Text := Fone2;
        ledt_admissao.Text := Admissao;
        ledt_funcao.Text := Funcao;
        ledt_demissao.Text := Demissao;
        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnProximoClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    With ClasseFuncionarios Do
    Begin
      CarregaDados(StrToInt(ledt_idfuncionario.Text) + 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idfuncionario.Text := FormatFloat('0000', Funcionario);
      ledt_nome.Text := Nome;
      ledt_abreviatura.Text := Abreviatura;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cpf.Text := Cpf;
      ledt_rg.Text := Rg;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
      ledt_admissao.Text := Admissao;
      ledt_funcao.Text := Funcao;
      ledt_demissao.Text := Demissao;
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

procedure TfFuncionarios.sbtnSalvarClick(Sender: TObject);
var
  Controle          : TControle;
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  Try
    Controle           := TControle.Create;
    ClasseFuncionarios := TClasseFuncionarios.Create(Controle);
    With ClasseFuncionarios Do
    Begin
      Funcionario := StrToInt(ledt_idfuncionario.Text);
      Nome := ledt_nome.Text;
      Abreviatura := ledt_abreviatura.Text;
      Endereco := ledt_endereco.Text;
      Nro := ledt_nro.Text;
      Complemento := ledt_comp.Text;
      Bairro := ledt_bairro.Text;
      Cidade := ledt_cidade.Text;
      Cep := ledt_cep.Text;
      UF := cbox_uf.Text;
      Cpf := ledt_cpf.Text;
      Rg := ledt_rg.Text;
      Fone1 := ledt_fone1.Text;
      Fone2 := ledt_fone2.Text;
      Admissao := ledt_admissao.Text;
      Funcao := ledt_funcao.Text;
      Demissao := ledt_demissao.Text;
      UserCad := UserLog;
      UserAlt := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        if Not InsereFuncionarios then
          Exit;
      end
      else
      begin
        if Not AlteraFuncionarios then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseFuncionarios);
    FreeAndNil(Controle);
  End;
end;

end.
