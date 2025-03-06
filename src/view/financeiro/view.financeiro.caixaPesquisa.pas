unit view.financeiro.caixaPesquisa;

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
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,

  model.caixa,
  view.cadastros.pesquisaPadrao,
  classe.global,

  uRotinas,
  DataSetUtils,
  Data.DB,

  JvExDBGrids,
  JvDBGrid,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvComponentBase,
  JvBalloonHint,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.StorageXML,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TfrmPesquisaCaixas = class(TfrmPesquisaPadrao)
    jvdedt_emissao: TJvDatePickerEdit;
    Label1: TLabel;
    check_ent_cash: TCheckBox;
    check_caixas: TCheckBox;
    JvBalloonHint: TJvBalloonHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure jvdedt_emissaoPopupShown(Sender: TObject);
    procedure cbox_registrosChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaCaixas: TfrmPesquisaCaixas;

implementation

{$R *.dfm}

uses
  controller.dto.caixa.interfaces.impl;

procedure TfrmPesquisaCaixas.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  ds_dados.Enabled := False;
end;

procedure TfrmPesquisaCaixas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPesquisaCaixas := Nil;
end;

procedure TfrmPesquisaCaixas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    frmPesquisaCaixas.Close;
end;

procedure TfrmPesquisaCaixas.jvdedt_emissaoPopupShown(Sender: TObject);
begin
  inherited;
  ds_dados.Enabled := False;
end;

procedure TfrmPesquisaCaixas.sbtn_anteriorClick(Sender: TObject);
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
      filtro := 'date(dtemissao) = date(' +
        DateTimeToStr(jvdedt_emissao.Date) + ')';
      filtro := filtro + ' AND cancelado = "Não" AND condicao = "Dinheiro"';
      if check_ent_cash.Checked then
        filtro := filtro + ' AND origem IS NOT NULL'
      else
        filtro := filtro + ' AND origem = "Digitação"';
      if check_caixas.Checked then
        filtro := filtro + ' AND a.usercad > 0'
      else
        filtro := filtro + ' AND a.usercad = ' + TGlobal.userId.ToString;
      Try
        var
        ICaixa := TICaixa.New;
        ICaixa.Manufacture.ViewCaixa(filtro,fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);
//        ICaixa.Build.ListPaginate(filtro, listaCaixas, 'idcaixa',
//          StrToInt(cbox_registros.Text), currentrg);
//        TThread.Synchronize(MyThread,
//          procedure
//          begin
//            ds_dados.Enabled := False;
//            fdmtb_dados.EmptyDataSet;
//            TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_dados);
//            ds_dados.Enabled := True;
//          end);
//        listaCaixas.Clear;
//        FreeAndNil(listaCaixas);
      Except
        on E: Exception do
          raise Exception.Create('Erro: ' + E.Message);
      End;
      if currentpg = 1 then
        sbtn_anterior.Enabled := False;
      if Not sbtn_proximo.Enabled then
        sbtn_proximo.Enabled := True;
    End);
  MyThread.Start;
  inherited;
end;

procedure TfrmPesquisaCaixas.sbtn_proximoClick(Sender: TObject);
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
      filtro := 'date(dtemissao) = date(' + jvdedt_emissao.Text + ')';
      filtro := filtro + ' AND cancelado = "Não" AND condicao = "Dinheiro"';
      if check_ent_cash.Checked then
        filtro := filtro + ' AND origem IS NOT NULL'
      else
        filtro := filtro + ' AND origem = "Digitação"';
      if check_caixas.Checked then
        filtro := filtro + ' AND a.usercad > 0'
      else
        filtro := filtro + ' AND a.usercad = ' + TGlobal.userId.ToString;
      Try
        var
        ICaixa := TICaixa.New;
        ICaixa.Manufacture.ViewCaixa(filtro,fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);
//        ICaixa.Build.ListPaginate(filtro, listaCaixas, 'idcaixa',
//          StrToInt(cbox_registros.Text), currentrg);
//        TThread.Synchronize(MyThread,
//          procedure
//          begin
//            ds_dados.Enabled := False;
//            fdmtb_dados.EmptyDataSet;
//            TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_dados);
//            ds_dados.Enabled := True;
//          end);
//        listaCaixas.Clear;
//        FreeAndNil(listaCaixas);
      Except
        on E: Exception do
          MsgErro(E.Message);
      End;
      if currentpg >= totalpg then
        sbtn_proximo.Enabled := False;
      if Not sbtn_anterior.Enabled then
        sbtn_anterior.Enabled := True;
    End);
  MyThread.Start;
  inherited;
end;

procedure TfrmPesquisaCaixas.sbtn_searchClick(Sender: TObject);
var
  filtro: String;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      filtro := 'date(dtemissao) = date(''' + FormatDateTime('YYYY-mm-dd',
        jvdedt_emissao.Date) + ''')';
      filtro := filtro + ' AND cancelado = "Não" AND condicao = "Dinheiro"';
      if check_ent_cash.Checked then
        filtro := filtro + ' AND origem IS NOT NULL'
      else
        filtro := filtro + ' AND origem = "D"';
      if check_caixas.Checked then
        filtro := filtro + ' AND a.usercad > 0'
      else
        filtro := filtro + ' AND a.usercad = ' + TGlobal.userId.ToString;
      Try
        var
        ICaixa := TICaixa.New;
        ICaixa.Build.GetRecordsNumber('tbcaixa AS a', filtro, totalrg);

        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));
        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;
        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        ICaixa.Manufacture.ViewCaixa(filtro,fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);

//        ICaixa.Build.ListPaginate(filtro, listaCaixas, 'idcaixa',
//          StrToInt(cbox_registros.Text), currentrg);
//        if listaCaixas.Count <= 0 then
//          MsgInformacao('Não existem dados para exibir')
//        else
//        begin
//          TThread.Synchronize(MyThread,
//            procedure
//            begin
//              ds_dados.Enabled := False;
//              TDataSetHelper.PreencheDataSet<TCaixa>(listaCaixas, fdmtb_dados);
//              ds_dados.Enabled := True;
//            end);
//        end;
//        listaCaixas.Clear;
//        FreeAndNil(listaCaixas);
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
