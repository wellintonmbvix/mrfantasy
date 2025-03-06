unit view.financeiro.cartoesPesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  System.Generics.Collections,

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

  uRotinas,

  model.cartoes,
  view.cadastros.pesquisaPadrao,
  classe.global,

  Data.DB,

  JvDatePickerEdit,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TfrmPesquisaCartoes = class(TfrmPesquisaPadrao)
    jvdpe_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    Label2: TLabel;
    jvdpe_vencimento: TJvDatePickerEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbox_registrosChange(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaCartoes: TfrmPesquisaCartoes;

implementation

{$R *.dfm}

uses
  controller.dto.cartoes.interfaces.impl;

procedure TfrmPesquisaCartoes.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  ds_dados.Enabled := False;
end;

procedure TfrmPesquisaCartoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPesquisaCartoes := Nil;
end;

procedure TfrmPesquisaCartoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    frmPesquisaCartoes.Close;
end;

procedure TfrmPesquisaCartoes.FormShow(Sender: TObject);
begin
  inherited;
  jvdpe_emissao.Date := Date();
  jvdpe_vencimento.Date := Date();
end;

procedure TfrmPesquisaCartoes.sbtn_anteriorClick(Sender: TObject);
var
  filtro: String;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg - StrToInt(cbox_registros.Text);
      currentpg := currentpg - 1;
      filtro := 'date(dtemissao) >= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_emissao.Date) + ''')';
      filtro := filtro + ' AND date(dtvencimento) <= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_vencimento.Date) + ''')';
      filtro := filtro + ' AND a.idtbempresa = ' + TGlobal.empresa.ToString;
      Try
        var
        ICartoes := TICartoes.New;
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            ICartoes.Manufacture.ViewCartao(filtro, fdmtb_dados,
              StrToInt(cbox_registros.Text), currentrg);
            ds_dados.Enabled := True;
          end);
      Except
        on E: Exception do
          MsgErro(E.Message);
      End;
    End);
  MyThread.Start;
  inherited;
end;

procedure TfrmPesquisaCartoes.sbtn_proximoClick(Sender: TObject);
var
  filtro: String;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg + StrToInt(cbox_registros.Text);
      currentpg := currentpg + 1;
      filtro := 'date(dtemissao) >= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_emissao.Date) + ''')';
      filtro := filtro + ' AND date(dtvencimento) <= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_vencimento.Date) + ''')';
      filtro := filtro + ' AND a.idtbempresa = ' + TGlobal.empresa.ToString;
      Try
        var
        ICartoes := TICartoes.New;
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            ICartoes.Manufacture.ViewCartao(filtro, fdmtb_dados,
              StrToInt(cbox_registros.Text), currentrg);
            ds_dados.Enabled := True;
          end);
      Except
        on E: Exception do
          MsgErro(E.Message);
      End;
    End);
  MyThread.Start;
  inherited;
end;

procedure TfrmPesquisaCartoes.sbtn_searchClick(Sender: TObject);
var
  filtro: String;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      filtro := 'date(dtemissao) >= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_emissao.Date) + ''')';
      filtro := filtro + ' AND date(dtvencimento) <= date(''' +
        FormatDateTime('YYYY-mm-dd',jvdpe_vencimento.Date) + ''')';
      filtro := filtro + ' AND a.idtbempresa = ' + TGlobal.empresa.ToString;
      Try
        var
        ICartoes := TICartoes.New;
        ICartoes.Build.GetRecordsNumber('tbcartoes a', filtro, totalrg);

        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));
        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;
        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        ICartoes.Manufacture.ViewCartao(filtro, fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);

        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            ICartoes.Manufacture.ViewCartao(filtro, fdmtb_dados,
              StrToInt(cbox_registros.Text), currentrg);
            ds_dados.Enabled := True;
            if fdmtb_dados.RecordCount = 0 then
              MsgInformacao('Não existem dados para exibir');
          end);
        if totalrg > StrToInt(cbox_registros.Text) then
        Begin
          sbtn_anterior.Enabled := False;
          sbtn_proximo.Enabled := True;
        End;
      Except
        on E: Exception do
          MsgErro(E.Message);
      End;
    End);
  MyThread.Start;
  inherited;
end;

end.
