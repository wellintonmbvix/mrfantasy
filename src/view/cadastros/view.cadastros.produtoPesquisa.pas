unit view.cadastros.produtoPesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Math,

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

  model.produto,
  view.cadastros.pesquisaPadrao,

  uRotinas,
  DataSetUtils,
  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TfrmPesquisaProdutos = class(TfrmPesquisaPadrao)
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure fdmtb_dadosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaProdutos: TfrmPesquisaProdutos;

implementation

{$R *.dfm}

uses
  controller.dto.produto.interfaces.impl;

procedure TfrmPesquisaProdutos.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.Fields[0]).DisplayFormat := '00000';
  TNumericField(fdmtb_dados.Fields[0]).Alignment := taCenter;
end;

procedure TfrmPesquisaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaProdutos := Nil;
  inherited;
end;

procedure TfrmPesquisaProdutos.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    sbtn_search.Click;
  inherited;
end;

procedure TfrmPesquisaProdutos.sbtn_anteriorClick(Sender: TObject);
var
  filtro: String;
  listaProdutos: TObjectList<TProduto>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg - StrToInt(cbox_registros.Text);
      currentpg := currentpg - 1;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'idtbcliente = ' + ledt_valor.Text;
        1:
          filtro := 'nome LIKE ' + QuotedStr(ledt_valor.Text + '%');
        2:
          filtro := 'descricao LIKE ' + QuotedStr(ledt_valor.Text + '%');
      end;

      Try
        var
        IProduto := TIProduto.New;
        IProduto.Manufacture.ViewProduto(filtro, fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);
//        IProduto.Build.ListPaginate(filtro, listaProdutos, 'idtbproduto',
//          StrToInt(cbox_registros.Text), currentrg);
//        TThread.Synchronize(MyThread,
//          procedure
//          begin
//            ds_dados.Enabled := False;
//            fdmtb_dados.EmptyDataSet;
//            TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos,
//              fdmtb_dados);
//            ds_dados.Enabled := True;
//          end);
//        listaProdutos.Clear;
//        FreeAndNil(listaProdutos);
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

procedure TfrmPesquisaProdutos.sbtn_proximoClick(Sender: TObject);
var
  filtro: String;
  listaProdutos: TObjectList<TProduto>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg + StrToInt(cbox_registros.Text);
      currentpg := currentpg + 1;
      case cbox_campo.ItemIndex of
        0:
          filtro := 'idtbcliente = ' + ledt_valor.Text;
        1:
          filtro := 'nome LIKE ' + QuotedStr(ledt_valor.Text + '%');
        2:
          filtro := 'descricao LIKE ' + QuotedStr(ledt_valor.Text + '%');
      end;
      Try
        var
        IProduto := TIProduto.New;
        IProduto.Manufacture.ViewProduto(filtro, fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);
//        IProduto.Build.ListPaginate(filtro, listaProdutos, 'idtbproduto',
//          StrToInt(cbox_registros.Text), currentrg);
//        TThread.Synchronize(MyThread,
//          procedure
//          begin
//            ds_dados.Enabled := False;
//            fdmtb_dados.EmptyDataSet;
//            TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos,
//              fdmtb_dados);
//            ds_dados.Enabled := True;
//          end);
//        listaProdutos.Clear;
//        FreeAndNil(listaProdutos);
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

procedure TfrmPesquisaProdutos.sbtn_searchClick(Sender: TObject);
var
  filtro: String;
  listaProdutos: TObjectList<TProduto>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      case cbox_campo.ItemIndex of
        0:
          filtro := 'idtbcliente = ' + ledt_valor.Text;
        1:
          filtro := 'nome LIKE ' + QuotedStr(ledt_valor.Text + '%');
        2:
          filtro := 'descricao LIKE ' + QuotedStr(ledt_valor.Text + '%');
      end;
      Try
        var
        IProduto := TIProduto.New;
        IProduto.Build.GetRecordsNumber('tbprodutos', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));
        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        IProduto.Manufacture.ViewProduto(filtro, fdmtb_dados,
          StrToInt(cbox_registros.Text), currentrg);

//        IProduto.Build.ListPaginate(filtro, listaProdutos, 'idtbproduto',
//          StrToInt(cbox_registros.Text), currentrg);
//
//        if listaProdutos.Count <= 0 then
//          MsgInformacao('Não existem dados para exibir')
//        else
//          begin
//            TThread.Synchronize(MyThread,
//              procedure
//              begin
//                ds_dados.Enabled := False;
//                TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos,
//                  fdmtb_dados);
//                ds_dados.Enabled := True;
//              end);
//          end;
//        listaProdutos.Clear;
//        FreeAndNil(listaProdutos);

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
