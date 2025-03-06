unit view.configuracoes.carteiraDigitalPesquisa;
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
  uRotinas,
  DataSetUtils,
  model.carteiraDigital,
  view.cadastros.pesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;
type
  TfrmPesquisaCarteiraDigital = class(TfrmPesquisaPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_searchClick(Sender: TObject);
    procedure fdmtb_dadosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmPesquisaCarteiraDigital: TfrmPesquisaCarteiraDigital;
implementation
{$R *.dfm}
uses
  controller.dto.carteiraDigital.interfaces.impl;
procedure TfrmPesquisaCarteiraDigital.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.Fields[0]).DisplayFormat := '00';
  TNumericField(fdmtb_dados.Fields[0]).Alignment := taCenter;
end;

procedure TfrmPesquisaCarteiraDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaCarteiraDigital := Nil;
  inherited;
end;
procedure TfrmPesquisaCarteiraDigital.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    sbtn_search.Click;
end;
procedure TfrmPesquisaCarteiraDigital.sbtn_anteriorClick(Sender: TObject);
var
  filtro: String;
  listaCarteiras: TObjectList<TCarteiraDigital>;
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
          filtro := 'nome LIKE ' + QuotedStr(ledt_valor.Text + '%');
      end;
      Try
        var
        ICarteiraDigital := TICarteiraDigital.New;
        ICarteiraDigital.Build.ListPaginate(filtro, listaCarteiras, 'idtbwallet',
          StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TCarteiraDigital>(listaCarteiras,
              fdmtb_dados);
            ds_dados.Enabled := True;
          end);
        listaCarteiras.Clear;
        FreeAndNil(listaCarteiras);
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
end;
procedure TfrmPesquisaCarteiraDigital.sbtn_proximoClick(Sender: TObject);
var
  filtro: String;
  listaCarteiras: TObjectList<TCarteiraDigital>;
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
          filtro := 'nome LIKE ' + QuotedStr(ledt_valor.Text + '%');
      end;
      Try
        var
        ICarteiraDigital := TICarteiraDigital.New;
        ICarteiraDigital.Build.ListPaginate(filtro, listaCarteiras, 'idtbwallet',
          StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TCarteiraDigital>(listaCarteiras,
              fdmtb_dados);
            ds_dados.Enabled := True;
          end);
        listaCarteiras.Clear;
        FreeAndNil(listaCarteiras);
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
procedure TfrmPesquisaCarteiraDigital.sbtn_searchClick(Sender: TObject);
var
  filtro, valor: String;
  listaCarteiras: TObjectList<TCarteiraDigital>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        ICarteiraDigital := TICarteiraDigital.New;
        ICarteiraDigital.Build.GetRecordsNumber('tbcfgwalletsdigital', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));

        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        ICarteiraDigital.Build.ListPaginate(filtro, listaCarteiras, 'idtbwallet',
          StrToInt(cbox_registros.Text), currentrg);

        if listaCarteiras.Count <= 0 then
          MsgInformacao('Não existem dados para exibir')
        else
        begin
          TThread.Synchronize(MyThread,
            procedure
            begin
              ds_dados.Enabled := False;
              TDataSetHelper.PreencheDataSet<TCarteiraDigital>(listaCarteiras,
                fdmtb_dados);
              ds_dados.Enabled := True;
            end);
        end;
        listaCarteiras.Clear;
        FreeAndNil(listaCarteiras);

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
