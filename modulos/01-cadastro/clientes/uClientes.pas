unit uClientes;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,

  uControle,
  view.cadastros.padrao,
  uGlobal,
  uClasseClientes,
  uRotinas,

  Data.DB,

  ACBrBase,
  ACBrSocket,
  ACBrCEP,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,

  JvDBGrid,
  JvExDBGrids;

type
  TfClientes = class(TfrmCadPadrao)
    ledt_idcliente: TLabeledEdit;
    ledt_nome: TLabeledEdit;
    ledt_cpf: TLabeledEdit;
    ledt_rg: TLabeledEdit;
    ledt_cep: TLabeledEdit;
    ledt_endereco: TLabeledEdit;
    ledt_nro: TLabeledEdit;
    ledt_comp: TLabeledEdit;
    ledt_bairro: TLabeledEdit;
    ledt_cidade: TLabeledEdit;
    cbox_uf: TComboBox;
    Label1: TLabel;
    ledt_nascimento: TLabeledEdit;
    ledt_fone1: TLabeledEdit;
    ledt_fone2: TLabeledEdit;
    ledt_email: TLabeledEdit;
    ACBrCEP: TACBrCEP;
    pgc_obshist: TPageControl;
    tbs_observacao: TTabSheet;
    tbs_historico: TTabSheet;
    mem_obs: TMemo;
    jvdbg_hist: TJvDBGrid;
    dshistorico: TDataSource;
    fdmt_historico: TFDMemTable;
    fdmt_historicodtretirada: TDateField;
    fdmt_historicodtdevolucao: TDateField;
    fdmt_historicoproduto: TWideStringField;
    fdmt_historicoqtde: TFMTBCDField;
    fdmt_historicototalLiquido: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure ledt_cpfEnter(Sender: TObject);
    procedure ledt_cpfExit(Sender: TObject);
    procedure ledt_nascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure ledt_cepExit(Sender: TObject);
    procedure ACBrCEPBuscaEfetuada(Sender: TObject);
    procedure ledt_emailExit(Sender: TObject);
    procedure mem_obsEnter(Sender: TObject);
    procedure mem_obsExit(Sender: TObject);
    procedure ledt_fone1KeyPress(Sender: TObject; var Key: Char);
    procedure ledt_fone2KeyPress(Sender: TObject; var Key: Char);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure ledt_idclienteChange(Sender: TObject);
  private
    { Private declarations }
    procedure LerHistorico(iCodigo: Integer; FDMemTable: TFDMemTable);
  public
    { Public declarations }
  end;

var
  fClientes: TfClientes;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaClientes;

procedure TfClientes.ACBrCEPBuscaEfetuada(Sender: TObject);
var
  li: Integer;
begin
  inherited;
  for li := 0 to ACBrCEP.Enderecos.Count - 1 do
  begin
    ledt_bairro.Text := ACBrCEP.Enderecos[li].Bairro;
    ledt_cidade.Text := ACBrCEP.Enderecos[li].Municipio;
    cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(ACBrCEP.Enderecos[li].UF);
    // edUF.Text := ACBrCEP.Enderecos[li].UF;
    // dbedTipo.Text    := ACBrCEP.Enderecos[li].Tipo_Logradouro;
    ledt_endereco.Text := ACBrCEP.Enderecos[li].Logradouro;
    ledt_comp.Text := ACBrCEP.Enderecos[li].Complemento;
  end;
end;

procedure TfClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fClientes := Nil;
end;

procedure TfClientes.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfClientes.ledt_cepExit(Sender: TObject);
begin
  inherited;
  if ledt_cep.Text <> EmptyStr then
    ACBrCEP.BuscarPorCEP(ledt_cep.Text);
end;

procedure TfClientes.ledt_cpfEnter(Sender: TObject);
begin
  inherited;
  ledt_cpf.Text := SomenteNumero(' ./-', ledt_cpf.Text);
end;

procedure TfClientes.ledt_cpfExit(Sender: TObject);
var
  vControle : TControle;
  VQry      : TFDQuery;
begin
  inherited;
  if ledt_cpf.Text <> EmptyStr then
  Begin
    Try
      vControle       := TControle.Create;
      VQry            := TFDQuery.Create(Self);
      VQry.Connection := vControle.Conexao.GetConexao;
      if Not ValidaCpfCnpj(ledt_cpf.Text) then
      Begin
        MsgErro('CPF inválido');
        ledt_cpf.SetFocus;
      End
      else
      Begin
        ledt_cpf.Text := MascaraCpfCnpj(ledt_cpf.Text);
        With VQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT idtbcliente,nome FROM tbclientes');
          SQL.Add('WHERE cpf_cnpj = :cpf');
          ParamByName('cpf').Value := ledt_cpf.Text;
          Open;
          if Not IsEmpty then
          Begin
            MsgAviso('CPF já informado no cliente:' + #13 + FormatFloat('0000000',
              FieldByName('idtbcliente').Value) + ' ' + FieldByName('nome')
              .AsString);
            ledt_cpf.SetFocus;
            Abort;
          End;
        End;
      End;
    Finally
      FreeAndNil(VQry);
      FreeAndNil(vControle);
    End;
  End;
end;

procedure TfClientes.ledt_emailExit(Sender: TObject);
begin
  inherited;
  if ledt_email.Text <> EmptyStr then
  Begin
    if not ValidateEmail(ledt_email.Text) then
    Begin
      MsgErro('Email inválido');
      ledt_email.SetFocus;
      Abort;
    End;
  End;
end;

procedure TfClientes.ledt_fone1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(ledt_fone1, Key);
end;

procedure TfClientes.ledt_fone2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraFone(ledt_fone2, Key);
end;

procedure TfClientes.ledt_idclienteChange(Sender: TObject);
begin
  inherited;
  if ledt_idcliente.Text <> EmptyStr then
    LerHistorico(StrToInt(ledt_idcliente.Text), fdmt_historico);
end;

procedure TfClientes.ledt_nascimentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MascaraData(ledt_nascimento, Key);
end;

procedure TfClientes.LerHistorico(iCodigo: Integer; FDMemTable: TFDMemTable);
var
  vControle : TControle;
  VQry      : TFDQuery;
begin
  Try
    vControle       := TControle.Create;
    vQry            := TFDQuery.Create(Self);
    vQry.Connection := vControle.Conexao.GetConexao;
    With vQry Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('tboc.dtretirada');
      SQL.Add(',tboc.dtdevolucao');
      SQL.Add(',tbp.nome as produto');
      SQL.Add(',tboi.qtde');
      SQL.Add(',tboi.totalLiquido');
      SQL.Add('FROM tbordens_itens tboi');
      SQL.Add('INNER JOIN tbprodutos tbp ON tboi.idtbproduto = tbp.idtbproduto');
      SQL.Add('INNER JOIN tbordens_cab tboc ON tboi.idtbordens_cab = tboc.idtbordens_cab');
      SQL.Add('WHERE tboc.idtbcliente = :codigo');
      ParamByName('codigo').Value := iCodigo;
      Open;

      FDMemTable.FieldDefs := FieldDefs;
      FDMemTable.Open;
      FDMemTable.EmptyDataSet;
      FDMemTable.CopyDataSet(vQry);
    End;
  Finally
    FreeAndNil(VQry);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.mem_obsEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfClientes.mem_obsExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfClientes.sbtnAnteriorClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseClientes := TClasseClientes.Create(vControle);
    With ClasseClientes Do
    Begin
      CarregaDados(StrToInt(ledt_idcliente.Text) - 1);
      if vControle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idcliente.Text := FormatFloat('0000000', Cliente);
      ledt_nome.Text := Nome;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cpf.Text := CnpjCpf;
      ledt_rg.Text := RgInsc;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
      ledt_nascimento.Text := DtNascimento;
      ledt_email.Text := Email;
      mem_obs.Text := Obs;
    End;

    operacao         := 'alterar';
    ledt_cpf.Enabled := False;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

procedure TfClientes.sbtnDeletarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    vControle      := TControle.Create;
    ClasseClientes := TClasseClientes.Create(vControle);
    With ClasseClientes Do
    Begin
      Cliente := StrToInt(ledt_idcliente.Text);
      if Not ExcluiClientes then
        Exit;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnDuplicarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  Try
    vControle           := TControle.Create;
    ClasseClientes      := TClasseClientes.Create(vControle);
    ledt_idcliente.Text := FormatFloat('0000000', ClasseClientes.PegarRegistro);
    cbox_uf.ItemIndex   := 7; // 7-Define ES como estado escolhido
    operacao            := 'incluir';
    ledt_cpf.Clear;
    ledt_rg.Clear;

    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnNovoClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  Try
    LimpaCampos;
    vControle            := TControle.Create;
    ClasseClientes       := TClasseClientes.Create(vControle);
    ledt_idcliente.Text  := FormatFloat('0000000', ClasseClientes.PegarRegistro);
    cbox_uf.ItemIndex    := 7; // 7-Define ES como estado escolhido
    ledt_cpf.Enabled     := True;
    operacao             := 'incluir';
    pgc_obshist.TabIndex := 0;



    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnPesquisarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseClientes := TClasseClientes.Create(vControle);
    With ClasseClientes Do
    Begin
      nClientes := 0;
      OpenFormModal(TfPesquisaClientes, fPesquisaClientes);
      if nClientes > 0 then
      Begin
        CarregaDados(nClientes);
        ledt_idcliente.Text := FormatFloat('0000000', Cliente);
        ledt_nome.Text := Nome;
        ledt_endereco.Text := Endereco;
        ledt_nro.Text := Nro;
        ledt_comp.Text := Complemento;
        ledt_bairro.Text := Bairro;
        ledt_cidade.Text := Cidade;
        ledt_cep.Text := Cep;
        cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
        ledt_cpf.Text := CnpjCpf;
        ledt_rg.Text := RgInsc;
        ledt_fone1.Text := Fone1;
        ledt_fone2.Text := Fone2;
        ledt_nascimento.Text := DtNascimento;
        ledt_email.Text := Email;
        mem_obs.Text := Obs;

        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnProximoClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseClientes := TClasseClientes.Create(vControle);
    With ClasseClientes Do
    Begin
      CarregaDados(StrToInt(ledt_idcliente.Text) + 1);
      if vControle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idcliente.Text := FormatFloat('0000000', Cliente);
      ledt_nome.Text := Nome;
      ledt_endereco.Text := Endereco;
      ledt_nro.Text := Nro;
      ledt_comp.Text := Complemento;
      ledt_bairro.Text := Bairro;
      ledt_cidade.Text := Cidade;
      ledt_cep.Text := Cep;
      cbox_uf.ItemIndex := cbox_uf.Items.IndexOf(UF);
      ledt_cpf.Text := CnpjCpf;
      ledt_rg.Text := RgInsc;
      ledt_fone1.Text := Fone1;
      ledt_fone2.Text := Fone2;
      ledt_nascimento.Text := DtNascimento;
      ledt_email.Text := Email;
      mem_obs.Text := Obs;
    End;

    operacao         := 'alterar';
    ledt_cpf.Enabled := False;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

procedure TfClientes.sbtnSalvarClick(Sender: TObject);
var
  vControle     : TControle;
  ClasseClientes: TClasseClientes;
begin
  inherited;
  Try
    vControle      := TControle.Create;
    ClasseClientes := TClasseClientes.Create(vControle);
    With ClasseClientes Do
    Begin
      Cliente      := StrToInt(ledt_idcliente.Text);
      Empresa      := EmpLog;
      Nome         := ledt_nome.Text;
      Endereco     := ledt_endereco.Text;
      Nro          := ledt_nro.Text;
      Complemento  := ledt_comp.Text;
      Bairro       := ledt_bairro.Text;
      Cidade       := ledt_cidade.Text;
      Cep          := ledt_cep.Text;
      UF           := cbox_uf.Text;
      CnpjCpf      := ledt_cpf.Text;
      RgInsc       := ledt_rg.Text;
      Fone1        := ledt_fone1.Text;
      Fone2        := ledt_fone2.Text;
      DtNascimento := ledt_nascimento.Text;
      Email        := ledt_email.Text;
      Obs          := mem_obs.Text;
      UserCad      := UserLog;
      UserAlt      := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        Cliente := PegarRegistro;
        if Not InsereClientes then
          Exit;
      end
      else
      begin
        if Not AlteraClientes then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseClientes);
    FreeAndNil(vControle);
  End;
end;

end.
