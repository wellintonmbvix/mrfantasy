unit uConfigBackups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.FileCtrl,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uRotinas, uControle;

type
  TfConfigBackups = class(TForm)
    ledt_pathbackup: TLabeledEdit;
    jvcedt_patchbackup: TJvComboEdit;
    ledt_dthrbackup: TLabeledEdit;
    qry_comando: TFDQuery;
    procedure jvcedt_patchbackupButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfigBackups: TfConfigBackups;
  vControle     : TControle;


const
  SELDIRHELP = 1000;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfConfigBackups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Try
  With qry_comando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbparametros SET pastabkp=:patchbkp,dtbackup=:dthrbkp');
      ParamByName('patchbkp').AsString  := jvcedt_patchbackup.Text;
      ParamByName('dthrbkp').AsDateTime := Now();
      ExecSQL;
    End;
  Except On e : Exception Do
    begin
      MsgErro(PChar('Falha ao gravar configurações: ' + #13 + e.Message));
    end;
  End;
  Action         := caFree;
  fConfigBackups := Nil;
end;

procedure TfConfigBackups.FormCreate(Sender: TObject);
begin
  vControle              := TControle.Create;
  qry_comando.Connection := vControle.Conexao.GetConexao;
end;

procedure TfConfigBackups.FormDestroy(Sender: TObject);
begin
  FreeAndNil(vControle);
end;

procedure TfConfigBackups.FormShow(Sender: TObject);
begin
  With qry_comando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select pastabkp,dtbackup from tbparametros');
      Open;
      jvcedt_patchbackup.Text := FieldByName('pastabkp').AsString;
      ledt_dthrbackup.Text    := FormatDateTime('dd/mm/YYYY HH:mm:ss',FieldByName('dtbackup').AsDateTime);
    End;
end;

procedure TfConfigBackups.jvcedt_patchbackupButtonClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := ExtractFilePath(Application.ExeName);
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    jvcedt_patchbackup.Text := Dir;
end;

end.
