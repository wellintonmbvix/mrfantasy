unit uMisterConexao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Buttons,

  uRotinas,

  JvExMask,
  JvToolEdit,
  JvExExtCtrls,
  JvRadioGroup,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TfMisterConexao = class(TForm)
    JvComboEdit1: TJvComboEdit;
    Label1: TLabel;
    OpenDialog: TOpenDialog;
    JvRadioGroup1: TJvRadioGroup;
    ledtServidor: TLabeledEdit;
    ledtBD: TLabeledEdit;
    ledtUserName: TLabeledEdit;
    ledtPassword: TLabeledEdit;
    JvRadioGroup2: TJvRadioGroup;
    ledtEmpPadrao: TLabeledEdit;
    ledtPdv: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure JvComboEdit1ButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMisterConexao: TfMisterConexao;

implementation

{$R *.dfm}

procedure TfMisterConexao.JvComboEdit1ButtonClick(Sender: TObject);
var
  arqIni : TIniFile;
begin
  if OpenDialog.Execute then
      JvComboEdit1.Text := OpenDialog.FileName;

  if JvComboEdit1.Text = EmptyStr then
    Abort;

  arqIni := TIniFile.Create(JvComboEdit1.Text);
  ledtServidor.Text := Crypt('D',arqIni.ReadString('Dados','Servidor',''));
  ledtBD.Text       := Crypt('D',arqIni.ReadString('Dados','Database',''));
  ledtUserName.Text := Crypt('D',arqIni.ReadString('Dados','UserName',''));
  ledtPassword.Text := Crypt('D',arqIni.ReadString('Dados','PassWord',''));
  ledtEmpPadrao.Text := arqIni.ReadString('Empresa','Numero','');
  ledtPdv.Text       := arqIni.ReadString('Terminal','Pdv','');
  arqIni.Free;
end;

procedure TfMisterConexao.SpeedButton1Click(Sender: TObject);
var
  FConexaoBanco : TFDConnection;
begin
  Try
     FConexaoBanco := TFDConnection.Create(Application);
     FDPhysMySQLDriverLink.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
     try
       FConexaoBanco.LoginPrompt := False;
       FConexaoBanco.Params.Clear;
       FConexaoBanco.Params.Add('Server='+ledtServidor.Text);
       FConexaoBanco.Params.Add('User_Name='+ledtUserName.Text);
       FConexaoBanco.Params.Add('Password='+ledtPassword.Text);
       FConexaoBanco.Params.Add('Database='+ledtBD.Text);
       FConexaoBanco.Params.Add('DriverID=MySQL');
       FConexaoBanco.Params.Add('Port=3306');
       FConexaoBanco.Params.Add('CharacterSet=utf8');
       FConexaoBanco.Params.Add('Compress=True');
       FConexaoBanco.Connected := True;

       MsgInformacao('Conexão realizada com sucesso');
     except
     On E : Exception Do
      Begin
        MsgErro('Erro ao conectar ao Banco de Dados.'+#13+E.Message);
      End;
     end;
  Finally
    FreeAndNil(FConexaoBanco);
  End;
end;

procedure TfMisterConexao.SpeedButton2Click(Sender: TObject);
var
  arqIni : TIniFile;
begin
  try
  arqIni := TIniFile.Create(JvComboEdit1.Text);
  arqIni.WriteString('Dados','Servidor',Crypt('C',ledtServidor.Text));
  arqIni.WriteString('Dados','Database',Crypt('C',ledtBD.Text ));
  arqIni.WriteString('Dados','UserName',Crypt('C',ledtUserName.Text));
  arqIni.WriteString('Dados','PassWord',Crypt('C',ledtPassword.Text));
  arqIni.WriteString('Empresa','Numero',ledtEmpPadrao.Text);
  arqIni.WriteString('Empresa','Numero',ledtPdv.Text);


  MsgInformacao('Gravação realizada com sucesso');
  Application.Terminate;
  finally
  arqIni.Free;
  end;

end;

end.
