unit uConfigImpressao;

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
  Vcl.Printers,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,


  Data.DB,
  uRotinas,
  uControle;

type
  TfConfigImpressao = class(TForm)
    qry_comando: TFDQuery;
    ledt_printbobina: TLabeledEdit;
    cbox_impressoras1: TComboBox;
    cbox_impressoras2: TComboBox;
    ledt_printreport: TLabeledEdit;
    chk_compbobina: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  procedure ListaImpressoras;
  public
    { Public declarations }
  end;

var
  fConfigImpressao: TfConfigImpressao;
  vControle       : TControle;

implementation

{$R *.dfm}

procedure TfConfigImpressao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Try
  With qry_comando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbparametros SET imp_bobina = :imp1, imp_relatorio = :imp2, comp_bobina = :imp3');
      ParamByName('imp1').Value := cbox_impressoras1.Text;
      ParamByName('imp2').Value := cbox_impressoras2.Text;
      ParamByName('imp3').Value := Integer(chk_compbobina.Checked);
      ExecSQL;
    End;
  Except On e : Exception do
    raise Exception.Create('Erro ao gravar impressora(s). ' + e.Message);
  End;
  Action           := caFree;
  fConfigImpressao := Nil;
end;

procedure TfConfigImpressao.FormCreate(Sender: TObject);
begin
  vControle              := TControle.Create;
  qry_comando.Connection := vControle.Conexao.GetConexao;
end;

procedure TfConfigImpressao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(vControle);
end;

procedure TfConfigImpressao.FormShow(Sender: TObject);
begin
  ListaImpressoras();
end;

procedure TfConfigImpressao.ListaImpressoras;
var
  i : Integer;
begin
  cbox_impressoras1.Items.Clear;
  cbox_impressoras2.Items.Clear;
  for I := 0 to Printer.Printers.Count - 1 do
   begin
       cbox_impressoras1.Items.Add(Printer.Printers.Strings[i]);
       cbox_impressoras2.Items.Add(Printer.Printers.Strings[i]);
   end;

   qry_comando.Open('select * from tbparametros');

   cbox_impressoras1.ItemIndex := cbox_impressoras1.Items.IndexOf(qry_comando.FieldByName('imp_bobina').AsString);
   cbox_impressoras2.ItemIndex := cbox_impressoras2.Items.IndexOf(qry_comando.FieldByName('imp_relatorio').AsString);
   chk_compbobina.Checked      := Boolean(qry_comando.FieldByName('comp_bobina').Value);
end;

end.
