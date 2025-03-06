unit uPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Inifiles,
  System.DateUtils,
  System.Generics.Collections,

  uControle,
  uGlobal,
  uRotinas,

  model.resource.interfaces,
  model.empresa,
  model.parametro,
  classe.global,

  Data.DB,

  Vcl.Buttons,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ComCtrls,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Comp.Script,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param;

type
  pRGBQuadArray = ^TRGBQuadArray;
  TRGBQuadArray = ARRAY [0 .. 0] OF TRGBQuad;

const
  InputBoxMessage = WM_USER + 200;

type
  TfPrincipal = class(TForm)
    stbarr_info: TStatusBar;
    imgFormPrincipal: TImage;
    Timer: TTimer;
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    Shape1: TShape;
    sbtn_configuracoes: TSpeedButton;
    pnl_mnuconfiguracoes: TPanel;
    sbtn_carteirasdigitais: TSpeedButton;
    sbtn_configbackup: TSpeedButton;
    Shape2: TShape;
    sbtn_cadastros: TSpeedButton;
    pnl_mnucadastros: TPanel;
    sbtn_empresas: TSpeedButton;
    sbtn_usuarios: TSpeedButton;
    Shape4: TShape;
    Shape5: TShape;
    sbtn_funcionarios: TSpeedButton;
    Shape6: TShape;
    sbtn_produtos: TSpeedButton;
    Shape7: TShape;
    sbtn_clientes: TSpeedButton;
    sbtn_financeiro: TSpeedButton;
    pnl_mnufinanceiro: TPanel;
    sbtn_caixa: TSpeedButton;
    sbtn_movimentacao: TSpeedButton;
    pnl_mnumovimentacao: TPanel;
    sbtn_venda: TSpeedButton;
    sbtn_reservas: TSpeedButton;
    Shape3: TShape;
    Shape8: TShape;
    sbtn_cartoes: TSpeedButton;
    sbtn_backup: TSpeedButton;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    sbtn_configimpressao: TSpeedButton;
    Shape15: TShape;
    sbtn_ordens: TSpeedButton;
    sbtn_relatorios: TSpeedButton;
    pnl_mnurelatorios: TPanel;
    sbtn_movimentacao1: TSpeedButton;
    Shape16: TShape;
    Shape17: TShape;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnBackupClick(Sender: TObject);
    procedure sbtn_configuracoesMouseEnter(Sender: TObject);
    procedure imgFormPrincipalMouseEnter(Sender: TObject);
    procedure sbtn_carteirasdigitaisMouseEnter(Sender: TObject);
    procedure sbtn_carteirasdigitaisClick(Sender: TObject);
    procedure sbtn_configbackupClick(Sender: TObject);
    procedure sbtn_empresasClick(Sender: TObject);
    procedure sbtn_usuariosClick(Sender: TObject);
    procedure sbtn_funcionariosClick(Sender: TObject);
    procedure sbtn_produtosClick(Sender: TObject);
    procedure sbtn_clientesClick(Sender: TObject);
    procedure sbtn_caixaClick(Sender: TObject);
    procedure sbtn_cartoesClick(Sender: TObject);
    procedure sbtn_vendaClick(Sender: TObject);
    procedure sbtn_reservasClick(Sender: TObject);
    procedure sbtn_backupClick(Sender: TObject);
    procedure sbtn_carteirasdigitaisMouseLeave(Sender: TObject);
    procedure sbtn_empresasMouseLeave(Sender: TObject);
    procedure sbtn_empresasMouseEnter(Sender: TObject);
    procedure sbtn_caixaMouseEnter(Sender: TObject);
    procedure sbtn_caixaMouseLeave(Sender: TObject);
    procedure sbtn_vendaMouseEnter(Sender: TObject);
    procedure sbtn_vendaMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtn_configimpressaoClick(Sender: TObject);
    procedure sbtn_ordensClick(Sender: TObject);
    procedure sbtn_movimentacao1MouseEnter(Sender: TObject);
    procedure sbtn_movimentacao1MouseLeave(Sender: TObject);
    procedure sbtn_movimentacao1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetImageAlpha(Image: TImage; Alpha: Byte);
    procedure prc_controla_menu(botao: TSpeedButton; ativar: Boolean);
    procedure prc_focar_btn(botao: TSpeedButton; barra: TShape;
      visivel: Boolean; direcao: String);
    procedure InputBoxSetPasswordChar(var Msg: TMessage);
      message InputBoxMessage;
    function viewRptMovimento: Boolean;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;
  versaobd: Integer = 1010;
  databackup: TDateTime;
  patchbackup: String;
  vControle: TControle;

implementation

{$R *.dfm}

uses
  uCaixas,
  uReservas,
  uVendas,
  uCfgWalletsDigital,
  uCartoes,
  uConfigBackups,
  uConfigImpressao,
  uOrdens,
  uReportMovimento,
  model.resource.impl.factory,
  view.cadastros.empresa,
  view.cadastros.usuario,
  view.cadastros.funcionario,
  view.cadastros.cliente,
  view.cadastros.produto,
  view.configuracoes.carteiraDigital,
  view.financeiro.caixa,
  view.financeiro.cartoes,
  view.estoque.ordem,
  view.principal.login,
  controller.dto.empresa.interfaces,
  controller.dto.empresa.interfaces.impl,
  controller.dto.parametro.interfaces,
  controller.dto.parametro.interfaces.impl;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
  Configuracoes: TIniFile;
  Arquivo: String;
begin
{$IFDEF DEBUG}
  Arquivo := ExtractFilePath(Application.ExeName) + '..\..\config.ini';
{$ENDIF}
{$IFDEF RELEASE}
  Arquivo := ExtractFilePath(Application.ExeName) + '\config.ini';
{$ENDIF}
  if not FileExists(Arquivo) then
  begin
    MsgErro('Arquivo de Configuração não encontrado' + #13 +
      'Entre em contato com o desenvolvedor');
    Exit;
  end;

  // Carregando as informações do arquivo de configurações
  Configuracoes := TIniFile.Create(Arquivo);
  Try
    stbarr_info.Panels[0].Text := 'Terminal Nº - ' + Configuracoes.ReadString
      ('Terminal', 'Pdv', '');
    TGlobal.terminal := Configuracoes.ReadInteger('Terminal', 'Pdv', 0);
    TGlobal.empresa := Configuracoes.ReadInteger('Empresa', 'Numero', 0);
    if (TGlobal.terminal = 0) Or (TGlobal.empresa = 0) then
    Begin
      MsgErro('Configurações de Empresa ou Terminal não definidas');
      Application.Terminate;
    End;
  Finally
    Configuracoes.Free;
  end;

  // Instanciando Controle Global momentaneamente
//  try
//    vControle := TControle.Create;
//  except
//    On E: Exception Do
//    Begin
//      MsgErro('Falha de conexão' + #13 + E.Message);
//    End;
//  end;
end;

procedure TfPrincipal.FormDestroy(Sender: TObject);
begin
  DeleteFile(PChar(GetCurrentDir() + '\rptCompAluguel.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptCompAluguelA4.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptCompVenda.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptCxaDiario.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptDataAlugueis.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptDataCupom.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptFantasiasReservadas.fr3'));
  DeleteFile(PChar(GetCurrentDir() + '\rptOrdensPorFuncionario.fr3'));
  FreeAndNil(vControle);
end;

procedure TfPrincipal.FormShow(Sender: TObject);
var
  FConnection: IConnection;
  lParametro: IParametro;
begin
  // Self.Width := Screen.Width;
  // Self.Height := Screen.Height - fncAlturaBarraTarefas;
  // Self.Left := 0;
  // Self.Top := 0;
  // rect_menu.Width := 42; //** Não descomentar essa linha

  for var i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.components[i] is TMenuItem then
    begin
      if TMenuItem(components[i]).Tag = 1 then
        TMenuItem(components[i]).Enabled := False;
    end;
  end;

  var listParametro: TObjectList<TParametro>;

  lParametro := TIParametro.New;
  lParametro.Build.ListAll('', listParametro, '');
  TGlobal.pathBackup := listParametro.Items[0].pastabkp;
  TGlobal.dateBackup := listParametro.Items[0].dtbackup;

  var
  vdb_old := listParametro.Items[0].versaobd;

  FConnection := TResource.New.Connection;

  if vdb_old < TGlobal.versionDB then
  begin
    var
    memoScripts := TMemo.Create(Self);
    var
    fdScript := TFDScript.Create(Application);

    memoScripts.Parent := TWinControl(fPrincipal);
    fdScript.Connection := TFDCustomConnection(FConnection.Connect);

    try
      ListarArquivos(ExtractFilePath(Application.ExeName) + 'scripts', 'sql',
        memoScripts.Lines);
      if memoScripts.Lines.Count > 0 then
      Begin
        for var i := 0 to memoScripts.Lines.Count - 1 do
        Begin
          With fdScript Do
          Begin
            SQLScriptFileName := ExtractFilePath(Application.ExeName) +
              'scripts\' + memoScripts.Lines[i];
            ValidateAll;
            ExecuteAll;
          End;

          DeleteFile(ExtractFilePath(Application.ExeName) + 'scripts\' +
            memoScripts.Lines[i]);
        End;
      End;

      var
      objParametro := listParametro.Items[0];

      lParametro.Build.Modify(objParametro);
      objParametro.versaobd := TGlobal.versionDB;
      lParametro.Build.Update;
      FreeAndNil(objParametro);
    finally
      FreeAndNil(fdScript);
      FreeAndNil(memoScripts);
    end;
  end
  else
  begin
    var
    memoScripts := TMemo.Create(Self);
    memoScripts.Parent := TWinControl(fPrincipal);

    ListarArquivos(ExtractFilePath(Application.ExeName) + 'scripts', 'sql',
      memoScripts.Lines);
    if memoScripts.Lines.Count > 0 then
    Begin
      for var i := 0 to memoScripts.Lines.Count - 1 do
      Begin
        DeleteFile(ExtractFilePath(Application.ExeName) + 'scripts\' +
          memoScripts.Lines[i]);
      End;
    End;

    memoScripts.Free;
  end;

  listParametro.Clear;
  listParametro.Free;

  stbarr_info.Panels[4].Text := 'Release: ' + GetBuildInfo(Application.ExeName);

  SetImageAlpha(imgFormPrincipal, 200);

  sbtn_backup.Glyph.LoadFromResourceName(HInstance, 'bkpdados');

  OpenFormModal(TfrmLogin, frmLogin);
  if Not TGlobal.userLogado then
    Application.Terminate;

  var
    listEmpresa: TObjectList<TEmpresa>;

  TIEmpresa.New.Build.ListAll('idtbempresa = ' + TGlobal.empresa.ToString,
    listEmpresa, '');

  stbarr_info.Panels[1].Text := 'Empresa: ' + listEmpresa.Items[0].razao;

  stbarr_info.Panels[2].Text := 'Usuário: ' + TGlobal.userName;

  listEmpresa.Clear;

  listEmpresa.Free;

  pnl_mnumovimentacao.Height := 42;
end;

procedure TfPrincipal.imgFormPrincipalMouseEnter(Sender: TObject);
begin
  prc_controla_menu(nil, False);
  prc_focar_btn(nil, Shape9, False, '');
end;

procedure TfPrincipal.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit, hButton: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

procedure TfPrincipal.mnBackupClick(Sender: TObject);
begin
  if Not BkpMySQL('mrfantasy', 'root', 'W311int0n', patchbackup, 3306, True,
    stbarr_info.Panels[5]) then
    Abort;
end;

procedure TfPrincipal.prc_controla_menu(botao: TSpeedButton; ativar: Boolean);
var
  i, j: Integer;
begin
  if ativar then
  Begin
    for i := 0 to fPrincipal.ComponentCount - 1 do
    Begin
      if (fPrincipal.components[i] is TPanel) AND
        ((fPrincipal.components[i] as TPanel).Tag <> 0) then
      Begin
        if (fPrincipal.components[i] as TPanel).Tag = botao.Tag then
        Begin
          (fPrincipal.components[i] as TPanel).Visible := True;
          (fPrincipal.components[i] as TPanel).Left := botao.Left;
        End
        Else
        Begin
          (fPrincipal.components[i] as TPanel).Visible := False;
          if botao <> nil then
            for j := 0 to fPrincipal.ComponentCount - 1 do
            Begin
              if (fPrincipal.components[j] is TSpeedButton) AND
                ((fPrincipal.components[j] as TSpeedButton).Tag <> 0) then
                (fPrincipal.components[j] as TSpeedButton)
                  .Glyph.LoadFromResourceName(HInstance, 'arrowup');
            End;
        End;
      End;
    End;
  End
  Else
  Begin
    for i := 0 to fPrincipal.ComponentCount - 1 do
    Begin
      if (fPrincipal.components[i] is TPanel) AND
        ((fPrincipal.components[i] as TPanel).Tag <> 0) then
        (fPrincipal.components[i] as TPanel).Visible := False;

      if (fPrincipal.components[i] is TSpeedButton) AND
        ((fPrincipal.components[i] as TSpeedButton).Tag <> 0) then
        (fPrincipal.components[i] as TSpeedButton).Glyph.LoadFromResourceName
          (HInstance, 'arrowup');
    End;
  End;
end;

procedure TfPrincipal.prc_focar_btn(botao: TSpeedButton; barra: TShape;
  visivel: Boolean; direcao: String);
begin
  if visivel then
  Begin
    if direcao = 'H' then
    Begin
      barra.Width := botao.Width;
      barra.Left := botao.Left;
      barra.Top := botao.Height - barra.Height;
    End
    else if direcao = 'V' then
    Begin
      barra.Height := botao.Height;
      barra.Top := botao.Top;
      barra.Left := botao.Width - barra.Width;
    End;
    barra.Visible := visivel;
  End
  Else
    barra.Visible := visivel;
end;

procedure TfPrincipal.sbtn_configbackupClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenFormModal(TfConfigBackups, fConfigBackups);
end;

procedure TfPrincipal.sbtn_configimpressaoClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenFormModal(TfConfigImpressao, fConfigImpressao);
end;

procedure TfPrincipal.sbtn_configuracoesMouseEnter(Sender: TObject);
begin
  prc_focar_btn(TSpeedButton(Sender), Shape9, True, 'H');
  prc_controla_menu(TSpeedButton(Sender), False);
  prc_controla_menu(TSpeedButton(Sender), True);
  TSpeedButton(Sender).Glyph.LoadFromResourceName(HInstance, 'arrowdown');
  TSpeedButton(Sender).Font.Color := clWhite;
end;

procedure TfPrincipal.sbtn_empresasClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmEmpresas, frmEmpresas);
end;

procedure TfPrincipal.sbtn_empresasMouseEnter(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := clWhite;
  prc_focar_btn(TSpeedButton(Sender), Shape11, True, 'V');
end;

procedure TfPrincipal.sbtn_empresasMouseLeave(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := $00B4B4B4;
  prc_focar_btn(nil, Shape11, False, '');
end;

procedure TfPrincipal.sbtn_funcionariosClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmFuncionarios, frmFuncionarios);
end;

procedure TfPrincipal.sbtn_movimentacao1Click(Sender: TObject);
begin
  if Not viewRptMovimento then
  begin
    MsgErro('Acesso não permitido');
    Abort;
  end;
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfReportMovimento, fReportMovimento);
end;

procedure TfPrincipal.sbtn_movimentacao1MouseEnter(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := clWhite;
  prc_focar_btn(TSpeedButton(Sender), Shape17, True, 'V');
end;

procedure TfPrincipal.sbtn_movimentacao1MouseLeave(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := $00B4B4B4;
  prc_focar_btn(nil, Shape17, False, '');
end;

procedure TfPrincipal.sbtn_ordensClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmOrdens, frmOrdens);
end;

procedure TfPrincipal.sbtn_produtosClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmFantasias, frmFantasias);
end;

procedure TfPrincipal.sbtn_reservasClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfReservas, fReservas);
end;

procedure TfPrincipal.sbtn_usuariosClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmUsuarios, frmUsuarios);
end;

procedure TfPrincipal.sbtn_vendaClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfVendas, fVendas);
end;

procedure TfPrincipal.sbtn_vendaMouseEnter(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := clWhite;
  prc_focar_btn(TSpeedButton(Sender), Shape13, True, 'V');
end;

procedure TfPrincipal.sbtn_vendaMouseLeave(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := $00B4B4B4;
  prc_focar_btn(nil, Shape13, False, '');
end;

procedure TfPrincipal.sbtn_backupClick(Sender: TObject);
begin
  if Not BkpMySQL('mrfantasy', 'root', 'W311int0n', patchbackup, 3306, True,
    stbarr_info.Panels[5]) then
    Abort;
end;

procedure TfPrincipal.sbtn_caixaClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmCaixas, frmCaixas);
end;

procedure TfPrincipal.sbtn_caixaMouseEnter(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := clWhite;
  prc_focar_btn(TSpeedButton(Sender), Shape12, True, 'V');
end;

procedure TfPrincipal.sbtn_caixaMouseLeave(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := $00B4B4B4;
  prc_focar_btn(nil, Shape12, False, '');
end;

procedure TfPrincipal.sbtn_carteirasdigitaisClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmCarteiraDigital, frmCarteiraDigital);
end;

procedure TfPrincipal.sbtn_carteirasdigitaisMouseEnter(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := clWhite;
  prc_focar_btn(TSpeedButton(Sender), Shape10, True, 'V');
end;

procedure TfPrincipal.sbtn_carteirasdigitaisMouseLeave(Sender: TObject);
begin
  TSpeedButton(Sender).Font.Color := $00B4B4B4;
  prc_focar_btn(nil, Shape10, False, '');
end;

procedure TfPrincipal.sbtn_cartoesClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmCartoes, frmCartoes);
end;

procedure TfPrincipal.sbtn_clientesClick(Sender: TObject);
begin
  prc_controla_menu(TSpeedButton(Sender), False);
  OpenForm(TfrmClientes, frmClientes);
end;

procedure TfPrincipal.SetImageAlpha(Image: TImage; Alpha: Byte);
var
  pscanLine32, pscanLine32_src: pRGBQuadArray;
  nScanLineCount, nPixelCount: Integer;
  BMP1, BMP2: TBitMap;
  WasBitMap: Boolean;
begin
  if Assigned(Image.Picture) then
  begin
    // check if another graphictype than an bitmap is assigned
    // don't check Assigned(Image.Picture.Bitmap) which will return always true
    // since a bitmap is created if needed and the graphic will be discared
    WasBitMap := Not Assigned(Image.Picture.Graphic);
    if not WasBitMap then
    begin
      // let's create a new bitmap from the graphic
      BMP1 := TBitMap.Create;
      BMP1.Assign(Image.Picture.Graphic);
    end
    else
      BMP1 := Image.Picture.Bitmap; // take the bitmap

    BMP1.PixelFormat := pf32Bit;

    // we need a copy since setting Alphaformat:= afDefined will clear the Bitmap
    BMP2 := TBitMap.Create;
    BMP2.Assign(BMP1);

    BMP1.Alphaformat := afDefined;

  end;
  for nScanLineCount := 0 to BMP1.Height - 1 do
  begin
    pscanLine32 := BMP1.Scanline[nScanLineCount];
    pscanLine32_src := BMP2.Scanline[nScanLineCount];
    for nPixelCount := 0 to BMP1.Width - 1 do
    begin
      pscanLine32[nPixelCount].rgbReserved := Alpha;
      pscanLine32[nPixelCount].rgbBlue := pscanLine32_src[nPixelCount].rgbBlue;
      pscanLine32[nPixelCount].rgbRed := pscanLine32_src[nPixelCount].rgbRed;
      pscanLine32[nPixelCount].rgbGreen := pscanLine32_src[nPixelCount]
        .rgbGreen;
    end;
  end;
  If not WasBitMap then
  begin
    // assign and free Bitmap if we had to create it
    Image.Picture.Assign(BMP1);
    FreeAndNil(BMP1);
  end;
  FreeAndNil(BMP2); // free the copy
end;

function TfPrincipal.viewRptMovimento: Boolean;
var
  ano, mes, dia: Word;
  resposta: String;
begin
  Result := False;

  repeat
    PostMessage(Handle, InputBoxMessage, 0, 0);
    resposta := InputBox('Relatório de Movimentação',
      'Digite a senha de acesso', '');
  until resposta <> EmptyStr;

  Decodedate(Date, ano, mes, dia);

  Inc(ano);
  Inc(mes);
  Inc(dia);

  if AnsiUpperCase(resposta) = 'MR' + FormatDateTime('YYYYmmdd',
    EncodeDate(ano, mes, dia)) then
    Result := True;
end;

end.
