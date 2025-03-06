unit uPesquisaCartoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.Grids,
  Vcl.DBGrids,

  uControle,
  uRotinas,
  uGlobal,
  uClasseCartoes,
  uPesquisaPadrao,

  FireDAC.Comp.Client,

  Data.DB,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,

  Datasnap.Provider,
  Datasnap.DBClient;

type
  TfPesquisaCartoes = class(TfPesquisaPadrao)
    jvdpe_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    Label2: TLabel;
    jvdpe_vencimento: TJvDatePickerEdit;
    dsCartoes: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbox_registrosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure FormatCampoDataSet;
  public
    { Public declarations }
  end;

var
  fPesquisaCartoes: TfPesquisaCartoes;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  cds: TClientDataSet;
  dsp: TDataSetProvider;
  Controle : TControle;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaCartoes.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsCartoes.Enabled := False;
end;

procedure TfPesquisaCartoes.FormatCampoDataSet;
begin
  TNumericField(cds.FieldByName('idtbcartao')).DisplayFormat := '000000';
  TNumericField(cds.FieldByName('idtbcartao')).Alignment := taCenter;
  TNumericField(cds.FieldByName('idtbempresa')).DisplayFormat := '00';
  TNumericField(cds.FieldByName('idtbempresa')).Alignment := taCenter;
  TNumericField(cds.FieldByName('valor')).DisplayFormat := '###,##0.00';
end;

procedure TfPesquisaCartoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action           := caFree;
  fPesquisaCartoes := Nil;
end;

procedure TfPesquisaCartoes.FormCreate(Sender: TObject);
begin
  inherited;
  Controle          := TControle.Create;
  dsp               := TDataSetProvider.Create(Self);
  cds               := TClientDataSet.Create(Self);
  dsp.Name          := 'dsp';
  dsp.DataSet       := Controle.SqlGeral;;
  cds.ProviderName  := dsp.Name;
  dsCartoes.DataSet := cds;
end;

procedure TfPesquisaCartoes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(cds);
  FreeAndNil(dsp);
  FreeAndNil(Controle);
end;

procedure TfPesquisaCartoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaCartoes.Close;
end;

procedure TfPesquisaCartoes.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if cds.RecordCount > 0 then
    nCartao := cds.FieldByName('idtbcartao').Value
  else
    nCartao := 0;
  Self.Close;
end;

procedure TfPesquisaCartoes.sbtn_anteriorClick(Sender: TObject);
var
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';
  Try
    ClasseCartoes := TClasseCartoes.Create(Controle);
    ClasseCartoes.Localiza(jvdpe_emissao.Date, jvdpe_vencimento.Date, EmpLog,
      currentrg, StrToInt(cbox_registros.Text));

    if Not cds.Active then
      cds.Open;
    cds.Refresh;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  Finally
    FreeAndNil(ClasseCartoes);
  End;
end;

procedure TfPesquisaCartoes.sbtn_proximoClick(Sender: TObject);
var
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';
  Try
    ClasseCartoes := TClasseCartoes.Create(Controle);
    ClasseCartoes.Localiza(jvdpe_emissao.Date, jvdpe_vencimento.Date, EmpLog,
      currentrg, StrToInt(cbox_registros.Text));

    if Not cds.Active then
      cds.Open;
    cds.Refresh;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  Finally
    FreeAndNil(ClasseCartoes);
  End;
end;

procedure TfPesquisaCartoes.sbtn_searchClick(Sender: TObject);
var
  ClasseCartoes: TClasseCartoes;
begin
  inherited;
  Try
    ClasseCartoes := TClasseCartoes.Create(Controle);
    ClasseCartoes.Localiza(jvdpe_emissao.Date, jvdpe_vencimento.Date, EmpLog, 1,
      999999); // Passando de 1 até 999999 nos registros
    // pra pegar o máximo possível de registros no RecordCount

    if Not cds.Active then
      cds.Open;
    cds.Refresh;
    FormatCampoDataSet; // Formatando a exibição dos campos
    totalrg := cds.RecordCount;
    totalpg := Ceil(cds.RecordCount / StrToInt(cbox_registros.Text));
    currentrg := 0;
    currentpg := 1;
    direcao := 'Proximo';

    dsCartoes.Enabled := True;
    sbtn_anterior.Enabled := False;
    sbtn_proximo.Enabled := False;

    ClasseCartoes.Localiza(jvdpe_emissao.Date, jvdpe_vencimento.Date, EmpLog,
      currentrg, StrToInt(cbox_registros.Text));

    if Not cds.Active then
      cds.Open;
    cds.Refresh;

    if totalrg > StrToInt(cbox_registros.Text) then
    Begin
      sbtn_anterior.Enabled := False;
      sbtn_proximo.Enabled := True;
    End;

  Finally
    FreeAndNil(ClasseCartoes);
  End;
end;

end.
