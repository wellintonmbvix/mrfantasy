unit uCaixas;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ExtDlgs,
  Vcl.Mask,

  uControle,
  uCadPadrao,
  uGlobal,
  uClasseCaixas,
  uRotinas,

  FireDAC.Comp.Client,

  JvExStdCtrls,
  JvEdit,
  JvExControls,
  JvLabel,
  JvValidateEdit,
  JvExMask,
  JvToolEdit, Vcl.Menus, frxClass, frxDBSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TfCaixas = class(TfCadPadrao)
    ledt_idcaixa: TLabeledEdit;
    ledt_emissao: TLabeledEdit;
    rgroup_operacao: TRadioGroup;
    rgroup_tipo: TRadioGroup;
    ledt_documento: TLabeledEdit;
    jvv_valor: TJvValidateEdit;
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
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure rgroup_operacaoClick(Sender: TObject);
    procedure rgroup_tipoClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure jvv_valorChange(Sender: TObject);
    procedure jvv_valorEnter(Sender: TObject);
    procedure jvv_valorClick(Sender: TObject);
  private
    { Private declarations }
    operacao: String;
  public
    { Public declarations }
  end;

var
  fCaixas: TfCaixas;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaCaixas, uReportCaixa;

procedure TfCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fCaixas := Nil;
end;

procedure TfCaixas.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfCaixas.jvv_valorChange(Sender: TObject);
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

procedure TfCaixas.jvv_valorClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfCaixas.jvv_valorEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfCaixas.rgroup_operacaoClick(Sender: TObject);
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

procedure TfCaixas.rgroup_tipoClick(Sender: TObject);
begin
  inherited;
  if rgroup_tipo.ItemIndex = 1 then
    rgroup_operacao.ItemIndex := 1
  else
    rgroup_operacao.ItemIndex := 0;
end;

procedure TfCaixas.sbtnAnteriorClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
begin
  inherited;
  Try
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    With Controle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbcaixa');
      SQL.Add('WHERE idcaixa < :codigo AND cancelado = 0 AND origem = "D"');
      SQL.Add('ORDER BY idcaixa DESC');
      SQL.Add('LIMIT 1');
      ParamByName('codigo').Value := StrToInt(ledt_idcaixa.Text);
      Open;
      if IsEmpty then
        Abort;

      With ClasseCaixas Do
      Begin
        CarregaDados(FieldByName('idcaixa').Value);

        ledt_idcaixa.Text := FormatFloat('00', IdCaixa);
        ledt_emissao.Text := FormatDateTime('dd/mm/YYYY', DtEmissao);
        case AnsiIndexStr(ClasseCaixas.operacao, ['C', 'D']) of
          0:
            rgroup_operacao.ItemIndex := 0;
          1:
            rgroup_operacao.ItemIndex := 1;
        end;
        case AnsiIndexStr(Tipo, ['Fundo', 'Sangria', 'Suprimento']) of
          0:
            rgroup_tipo.ItemIndex := 0;
          1:
            rgroup_tipo.ItemIndex := 1;
          2:
            rgroup_tipo.ItemIndex := 2;
        end;
        ledt_documento.Text := Documento;
        jvv_valor.Value := valor;
      End;

    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnCancelarClick(Sender: TObject);
var
  Controle : TControle;
  vQry     : TFDQuery;
begin
  inherited;
  if Not MsgConfirmacao('Confirma o cancelamento desse registro?') then
    Abort;

  Try
    Controle        := TControle.Create;
    vQry            := TFDQuery.Create(Self);
    vQry.Connection := Controle.Conexao.GetConexao;
    With vQry Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbcaixa SET');
      SQL.Add('cancelado = 1');
      SQL.Add('WHERE idcaixa = :codigo AND idtbempresa = :empresa');
      ParamByName('codigo').Value := StrToInt(ledt_idcaixa.Text);
      ParamByName('empresa').Value := EmpLog;
      try
        ExecSQL;
        sbtnNovo.Click;
      except
        On E: Exception Do
        Begin
          MsgErro('Erro' + #13 + E.Message);
        End;
      end;
    End;
  Finally
    FreeAndNil(vQry);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnDeletarClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
begin
  inherited;
  if fCaixas.operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    With ClasseCaixas Do
    Begin
      IdCaixa := StrToInt(ledt_idcaixa.Text);
      if ExcluiCaixas then
        sbtnNovo.Click;
    End;
  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnDuplicarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfCaixas.sbtnNovoClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
begin
  inherited;
  Try
    LimpaCampos;
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    ledt_idcaixa.Text := FormatFloat('00',
      ClasseCaixas.PegarRegistro(UserLog, EmpLog));
    ledt_emissao.Text := FormatDateTime('dd/mm/YYYY', Date());
    rgroup_tipo.ItemIndex := 0;
    rgroup_operacao.ItemIndex := 0;
    jvv_valor.Value := 0;
    TCustomRadioGroup(rgroup_tipo.Components[0]).Enabled := True;
    TCustomRadioGroup(rgroup_tipo.Components[1]).Enabled := False;
    TCustomRadioGroup(rgroup_tipo.Components[2]).Enabled := True;
    fCaixas.operacao := 'incluir';

  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnPesquisarClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
begin
  inherited;
  sbtnNovo.Click;
  Try
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    With ClasseCaixas Do
    Begin
      nCaixa := 0;
      OpenFormModal(TfPesquisaCaixas, fPesquisaCaixas);
      if nCaixa > 0 then
      Begin
        CarregaDados(nCaixa);

        ledt_idcaixa.Text := FormatFloat('00', IdCaixa);
        ledt_emissao.Text := FormatDateTime('dd/mm/YYYY', DtEmissao);
        case AnsiIndexStr(ClasseCaixas.operacao, ['C', 'D']) of
          0:
            rgroup_operacao.ItemIndex := 0;
          1:
            rgroup_operacao.ItemIndex := 1;
        end;
        case AnsiIndexStr(Tipo, ['Fundo', 'Sangria', 'Suprimento']) of
          0:
            rgroup_tipo.ItemIndex := 0;
          1:
            rgroup_tipo.ItemIndex := 1;
          2:
            rgroup_tipo.ItemIndex := 2;
        end;
        ledt_documento.Text := Documento;
        jvv_valor.Value := valor;

        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnProximoClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
begin
  inherited;
  Try
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    With Controle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT idcaixa FROM tbcaixa');
      SQL.Add('WHERE idcaixa > :codigo AND cancelado = 0 AND origem = "D"');
      SQL.Add('LIMIT 1');
      ParamByName('codigo').Value := StrToInt(ledt_idcaixa.Text);
      Open;
      if IsEmpty then
        Abort;

      With ClasseCaixas Do
      Begin
        CarregaDados(FieldByName('idcaixa').Value);

        ledt_idcaixa.Text := FormatFloat('00', IdCaixa);
        ledt_emissao.Text := FormatDateTime('dd/mm/YYYY', DtEmissao);
        case AnsiIndexStr(operacao, ['C', 'D']) of
          0:
            rgroup_operacao.ItemIndex := 0;
          1:
            rgroup_operacao.ItemIndex := 1;
        end;
        case AnsiIndexStr(Tipo, ['Fundo', 'Sangria', 'Suprimento']) of
          0:
            rgroup_tipo.ItemIndex := 0;
          1:
            rgroup_tipo.ItemIndex := 1;
          2:
            rgroup_tipo.ItemIndex := 2;
        end;
        ledt_documento.Text := Documento;
        jvv_valor.Value := valor;
      End;

    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnSalvarClick(Sender: TObject);
var
  Controle    : TControle;
  ClasseCaixas: TClasseCaixas;
  op, tp: String;
begin
  inherited;
  if (rgroup_operacao.ItemIndex = 0) AND (rgroup_tipo.ItemIndex = 1) then
  Begin
    MsgAviso('Tipo Sangria n o permitido para opera  o Cr dito');
    Abort;
  End;

  if (rgroup_operacao.ItemIndex = 1) AND (rgroup_tipo.ItemIndex <> 1) then
  Begin
    MsgAviso('Opera  o D bito permitod apenas para tipo Fundo');
    Abort;
  End;

  case rgroup_operacao.ItemIndex of
    0:
      op := 'C';
    1:
      op := 'D';
  end;

  case rgroup_tipo.ItemIndex of
    0:
      tp := 'Fundo';
    1:
      tp := 'Sangria';
    2:
      tp := 'Suprimento';
  end;
  Try
    Controle     := TControle.Create;
    ClasseCaixas := TClasseCaixas.Create(Controle);
    With ClasseCaixas Do
    Begin
      IdCaixa := StrToInt(ledt_idcaixa.Text);
      Empresa := EmpLog;
      DtEmissao := Date();
      operacao := op;
      Origem := 'D';
      valor := jvv_valor.Value;
      Documento := ledt_documento.Text;
      Condicao := 'Dinheiro';
      Tipo := tp;
      UserCad := UserLog;
      UserAlt := UserLog;

      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if fCaixas.operacao = 'incluir' then
      begin
        if Not InsereCaixas then
          Exit;
      end
      else
      begin
        if Not AlteraCaixas then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseCaixas);
    FreeAndNil(Controle);
  End;
end;

procedure TfCaixas.sbtnImprimirClick(Sender: TObject);
begin
  OpenFormModal(TfReportCaixa, fReportCaixa);
end;

end.
