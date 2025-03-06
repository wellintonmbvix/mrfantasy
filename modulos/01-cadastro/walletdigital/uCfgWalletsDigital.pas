unit uCfgWalletsDigital;

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
  uClasseCfgWalletsDigital,
  uRotinas,

  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  FireDAC.Comp.Client, uPrincipal, Vcl.Mask, JvExMask, JvSpin,
  Vcl.Imaging.pngimage, Vcl.ExtDlgs;

type
  TfCfgWalletsDigital = class(TfrmCadPadrao)
    ledt_idwallet: TLabeledEdit;
    ledt_descricao: TLabeledEdit;
    Shape1: TShape;
    jvsedt_diasdep: TJvSpinEdit;
    Label1: TLabel;
    pnlLogo: TPanel;
    imgLogo: TImage;
    SpeedButton1: TSpeedButton;
    opdImg: TOpenPictureDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCfgWalletsDigital: TfCfgWalletsDigital;

implementation

{$R *.dfm}

uses uPesquisaWalletsDigital;

procedure TfCfgWalletsDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fCfgWalletsDigital := Nil;
end;

procedure TfCfgWalletsDigital.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfCfgWalletsDigital.sbtnAnteriorClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    With ClasseCfgWalletsDigital Do
    Begin
      CarregaDados(StrToInt(ledt_idwallet.Text) - 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idwallet.Text := FormatFloat('00', IdWallet);
      ledt_descricao.Text := Descricao;
      jvsedt_diasdep.Value := DiasDep;
      ExibirImagem(Controle.SqlGeral, 'imagem', imgLogo);
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

procedure TfCfgWalletsDigital.sbtnDeletarClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;

  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    With ClasseCfgWalletsDigital Do
    Begin
      IdWallet := StrToInt(ledt_idwallet.Text);
      if Not ExcluiWallets then
        Exit;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnDuplicarClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    ledt_idwallet.Text := FormatFloat('00',
      ClasseCfgWalletsDigital.PegarRegistro);
    jvsedt_diasdep.Value := 0;
    operacao := 'incluir';

    ledt_descricao.SetFocus;
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnNovoClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  Try
    LimpaCampos;
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    ledt_idwallet.Text := FormatFloat('00',
      ClasseCfgWalletsDigital.PegarRegistro);
    jvsedt_diasdep.Value := 0;
    imgLogo.Picture.Bitmap := Nil;
    operacao := 'incluir';

    ledt_descricao.SetFocus;
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnPesquisarClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    With ClasseCfgWalletsDigital Do
    Begin
      nWallet := 0;
      OpenFormModal(TfPesquisaWalletsDigital, fPesquisaWalletsDigital);
      if nWallet > 0 then
      Begin
        CarregaDados(nWallet);
        ledt_idwallet.Text := FormatFloat('000', IdWallet);
        ledt_descricao.Text := Descricao;
        jvsedt_diasdep.Value := DiasDep;

        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnProximoClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    With ClasseCfgWalletsDigital Do
    Begin
      CarregaDados(StrToInt(ledt_idwallet.Text) + 1);
      if Controle.SqlGeral.RecordCount < 1 then
        Abort;

      ledt_idwallet.Text := FormatFloat('00', IdWallet);
      ledt_descricao.Text := Descricao;
      jvsedt_diasdep.Value := DiasDep;
      ExibirImagem(Controle.SqlGeral, 'imagem', imgLogo);
    End;

    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.sbtnSalvarClick(Sender: TObject);
var
  Controle               : TControle;
  ClasseCfgWalletsDigital: TClasseCfgWalletsDigital;
begin
  inherited;
  Try
    Controle                := TControle.Create;
    ClasseCfgWalletsDigital := TClasseCfgWalletsDigital.Create
      (Controle);
    // Se diretório nos temporário não existir cria
    if Not DirectoryExists(GetEnvVarValue('TEMP') + '\mrfantasy') then
      if Not CreateDir(GetEnvVarValue('TEMP') + '\mrfantasy') then
        ForceDirectories(GetEnvVarValue('TEMP') + '\mrfantasy');

    // Se existir alguma imagem apaga no diretório temporário
    if FileExists(GetEnvVarValue('TEMP') + '\mrfantasy\img.jpg') then
      DeleteFile(GetEnvVarValue('TEMP') + '\mrfantasy\img.jpg');

    // Se imagem foi escolhida salva no diretório temporário
    if imgLogo.Picture <> nil then
      imgLogo.Picture.SaveToFile(GetEnvVarValue('TEMP') + '\mrfantasy\img.jpg');
    With ClasseCfgWalletsDigital Do
    Begin
      IdWallet := StrToInt(ledt_idwallet.Text);
      Descricao := ledt_descricao.Text;
      DiasDep := StrToInt(jvsedt_diasdep.Text);
      UserCad := UserLog;
      UserAlt := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;

      if operacao = 'incluir' then
      begin
        if Not InsereWallets then
          Exit;
      end
      else
      begin
        if Not AlteraWallets then
          Exit;
      end;
    End;
    sbtnNovo.Click;
  Finally
    FreeAndNil(ClasseCfgWalletsDigital);
    FreeAndNil(Controle);
  End;
end;

procedure TfCfgWalletsDigital.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if opdImg.Execute then
    imgLogo.Picture.LoadFromFile(opdImg.FileName);
end;

end.
