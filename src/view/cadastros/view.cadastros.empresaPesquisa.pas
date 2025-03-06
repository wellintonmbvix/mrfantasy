unit view.cadastros.empresaPesquisa;

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

  model.empresa,
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
  TfrmPesquisaEmpresas = class(TfrmPesquisaPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_searchClick(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure fdmtb_dadosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaEmpresas: TfrmPesquisaEmpresas;

implementation

{$R *.dfm}

uses
  controller.dto.empresa.interfaces.impl;

{ TfrmPesquisaEmpresas }

procedure TfrmPesquisaEmpresas.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.FieldByName('idtbempresa')).DisplayFormat
    := '00';
  TNumericField(fdmtb_dados.FieldByName('idtbempresa')).Alignment
    := taCenter;
end;

procedure TfrmPesquisaEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPesquisaEmpresas := nil;
end;

procedure TfrmPesquisaEmpresas.sbtn_anteriorClick(Sender: TObject);
var
  filtro, valor: String;
  listaEmpresas: TObjectList<TEmpresa>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg - StrToInt(cbox_registros.Text);
      currentpg := currentpg - 1;

      if cbox_campo.ItemIndex = 2 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'razao LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'fantasia LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IEmpresa := TIEmpresa.New;

        IEmpresa.Build.ListPaginate(filtro, listaEmpresas, 'idtbempresa',
          StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
          listaEmpresas.Clear;
          FreeAndNil(listaEmpresas);
      Except
        on E: Exception do
          MsgErro(E.Message);
      End;

      if currentpg = 1 then
        sbtn_anterior.Enabled := False;
      if Not sbtn_proximo.Enabled then
        sbtn_proximo.Enabled := True;
    End);
  MyThread.Start;
  inherited;
end;

procedure TfrmPesquisaEmpresas.sbtn_proximoClick(Sender: TObject);
var
  filtro, valor: String;
  listaEmpresas: TObjectList<TEmpresa>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg + StrToInt(cbox_registros.Text);
      currentpg := currentpg + 1;

      if cbox_campo.ItemIndex = 2 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'razao LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'fantasia LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IEmpresa := TIEmpresa.New;

        IEmpresa.Build.ListPaginate(filtro, listaEmpresas, 'idtbempresa',
          StrToInt(cbox_registros.Text), currentrg);

        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
          listaEmpresas.Clear;
          FreeAndNil(listaEmpresas);
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

procedure TfrmPesquisaEmpresas.sbtn_searchClick(Sender: TObject);
var
  filtro, valor: String;
  listaEmpresas: TObjectList<TEmpresa>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      if cbox_campo.ItemIndex = 2 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'razao LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'fantasia LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IEmpresa := TIEmpresa.New;
        IEmpresa.Build.GetRecordsNumber('tbempresas', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));
        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        IEmpresa.Build.ListPaginate(filtro, listaEmpresas, 'idtbempresa',
          StrToInt(cbox_registros.Text), currentrg);

        if listaEmpresas.Count <= 0 then
          MsgInformacao('Não existem dados para exibir')
        else
          begin
            ds_dados.Enabled := False;
            if fdmtb_dados.Active then
              fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TEmpresa>(listaEmpresas, fdmtb_dados);
            ds_dados.Enabled := True;
          end;
        listaEmpresas.Clear;
        FreeAndNil(listaEmpresas);

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
