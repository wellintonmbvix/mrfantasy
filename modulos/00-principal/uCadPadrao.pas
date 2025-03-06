unit uCadPadrao;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Mask,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  JvCombobox,
  JvToolEdit,
  JvValidateEdit,
  JvStaticText,
  JvExMask,
  JvExExtCtrls,
  JvExtComponent,
  JvPanel,

  model.usuario,

  uRotinas,
  uControle,
  uGlobal;

type
  TfCadPadrao = class(TForm)
    pnlBotoes: TPanel;
    sbtnNovo: TSpeedButton;
    sbtnDuplicar: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    sbtnSalvar: TSpeedButton;
    sbtnDeletar: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    sbtnAnterior: TSpeedButton;
    sbtnProximo: TSpeedButton;
    sbtnSair: TSpeedButton;
    shp1: TShape;
    pnlDados: TPanel;
    shp2: TShape;
    shp3: TShape;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnSairClick(Sender: TObject);
    procedure jvpnlTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos; Virtual;
  end;

var
  fCadPadrao: TfCadPadrao;
  operacao: String;

implementation

{$R *.dfm}

procedure TfCadPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If Key = #13 then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TfCadPadrao.FormResize(Sender: TObject);
begin
  Self.WindowState := wsNormal;
end;

procedure TfCadPadrao.FormShow(Sender: TObject);
var
  Controle: TControle;
  fdqComando: TFDQuery;
begin
  Try
    Controle := TControle.Create;
    fdqComando := TFDQuery.Create(Application);
    fdqComando.Connection := Controle.Conexao.ConexaoBanco;

    With fdqComando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT acesso FROM tbacessos');
      SQL.Add('WHERE idmenu = (SELECT idmenu FROM tbmenus WHERE form=' +
        QuotedStr(Self.Name) + ')');
      SQL.Add('AND idusuario = :usuario');
      ParamByName('usuario').Value := uGlobal.UserLog;
      Open;
    End;
  Finally
    FreeAndNil(fdqComando);
    FreeAndNil(Controle);
  End;
end;

procedure TfCadPadrao.jvpnlTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfCadPadrao.LimpaCampos;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  Begin
    if Components[i] is TEdit then
    Begin
      TEdit(Components[i]).Text := '';
    End;

    if Components[i] is TMemo then
    Begin
      TMemo(Components[i]).Clear;
      // TMemo(Components[i]).Text := '';
    End;

    if Components[i] is TButtonedEdit then
    Begin
      TButtonedEdit(Components[i]).Text := '';
    End;

    if Components[i] is TLabeledEdit then
    Begin
        TLabeledEdit(Components[i]).Text := '';
    End;

    if Components[i] is TComboBox then
    Begin
      TComboBox(Components[i]).Text := '';
      TComboBox(Components[i]).ItemIndex := -1;
    End;

    if Components[i] is TComboBoxEx then
    Begin
      TComboBoxEx(Components[i]).Text := '';
      TComboBoxEx(Components[i]).ItemIndex := -1;
    End;

    if Components[i] is TCheckBox then
    Begin
      TCheckBox(Components[i]).Checked := False;
    End;

    if Components[i] is TJvDateEdit then
    Begin
      TJvDateEdit(Components[i]).Text := '  /  /    ';
    End;

    if Components[i] is TJvComboEdit then
    Begin
      TJvComboEdit(Components[i]).Text := '';
    End;

    if Components[i] is TJvValidateEdit then
    Begin
      TJvValidateEdit(Components[i]).Value := 0;
    End;

    if Components[i] is TJvStaticText then
    Begin
      TJvStaticText(Components[i]).Caption := '';
    End;
  End;
end;

procedure TfCadPadrao.sbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
