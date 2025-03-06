unit uReportMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfReportMovimento = class(TForm)
    Label1: TLabel;
    cbox_tiporelatorio: TComboBox;
    Label2: TLabel;
    dtp_dtinicial: TDateTimePicker;
    Label3: TLabel;
    dtp_dtfinal: TDateTimePicker;
    pnl_btnImprimir: TPanel;
    sbtn_imprimir: TSpeedButton;
    FDMemTable: TFDMemTable;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtn_imprimirClick(Sender: TObject);
    procedure cbox_tiporelatorioChange(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir(opcao: Integer);
  public
    { Public declarations }
  end;

var
  fReportMovimento: TfReportMovimento;

implementation

{$R *.dfm}

uses uClasseRelatorios, uControle, uRotinas;

procedure TfReportMovimento.cbox_tiporelatorioChange(Sender: TObject);
var
  year,month,day : word;
  dtinicial : TDate;
begin
  if TComboBox(Sender).ItemIndex = 1 then
    begin
      dtinicial := IncMonth(Date(), -12);
      decodedate(dtinicial,year,month,day);
      day := 1;
      dtinicial := encodedate(year,month,day);
      dtp_dtinicial.Date := dtinicial;
      dtp_dtfinal.Date   := Date();
      dtp_dtinicial.Enabled := False;
      dtp_dtfinal.Enabled   := False;
    end
  else
    begin
      dtp_dtinicial.Date    := Date();
      dtp_dtfinal.Date      := Date();
      dtp_dtinicial.Enabled := Enabled;
      dtp_dtfinal.Enabled   := Enabled;
    end;
end;

procedure TfReportMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action           := caFree;
  fReportMovimento := Nil;
end;

procedure TfReportMovimento.FormCreate(Sender: TObject);
begin
  Application.HintColor := $005BFFAD;
end;

procedure TfReportMovimento.Imprimir(opcao: Integer);
var
  VQry              : TFDQuery;
  vClasseRelatorios : TClasseRelatorios;
  vControle         : TControle;
begin
  try
    vControle         := TControle.Create;
    vClasseRelatorios := TClasseRelatorios.Create(vControle);
    FDMemTable.Close;

    case opcao of
      1:
        begin
          vQry := vClasseRelatorios.VendasAtendente(dtp_dtinicial.Date, dtp_dtfinal.Date);
            Try
              VQry.FetchAll;
              FDMemTable.Data := VQry.Data;
              FDMemTable.Open;
              frxReport.LoadFromFile(LoadReportStream('rptordensporfuncionario','rptOrdensPorFuncionario.fr3'));
              frxReport.Variables['periodo'] := QuotedStr(FormatDateTime('dd/mm/YYYY', dtp_dtinicial.Date)+' até '+FormatDateTime('dd/mm/YYYY', dtp_dtfinal.Date));
              frxReport.PrepareReport;
              frxReport.ShowReport;
            Finally
              VQry.Close;
              FreeAndNil(VQry);
            End;
        end;
      2:
        begin
          vQry := vClasseRelatorios.VendaAnual;
            Try
               vQry.FetchAll;
               FDMemTable.Data := vQry.Data;
               FDMemTable.Open;
               frxReport.LoadFromFile(LoadReportStream('rptordensmovimentacaoanual','rptOrdensMovimentacaoAnual.fr3'));
               frxReport.PrepareReport;
               frxReport.ShowReport;
            Finally
              vQry.Close;
              FreeAndNil(vQry);
            End;
        end;
    end;

  finally
    FreeAndNil(vClasseRelatorios);
    FreeAndNil(vControle);
  end;
end;

procedure TfReportMovimento.sbtn_imprimirClick(Sender: TObject);
begin
  Imprimir(cbox_tiporelatorio.ItemIndex + 1 );
end;

end.
