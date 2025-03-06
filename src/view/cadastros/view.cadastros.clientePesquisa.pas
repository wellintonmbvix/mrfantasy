unit view.cadastros.clientePesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Math,
  System.Rtti,

  model.cliente,
  view.cadastros.pesquisaPadrao,
  ormbr.types.nullable,

  uRotinas,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Buttons,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  DataSetUtils,
  Datasnap.DBClient;

type
  TfrmPesquisaClientes = class(TfrmPesquisaPadrao)
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure sbtn_searchClick(Sender: TObject);
    procedure fdmtb_dadosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaClientes: TfrmPesquisaClientes;

implementation

{$R *.dfm}

uses
  controller.dto.cliente.interfaces.impl;

procedure TfrmPesquisaClientes.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.Fields[0]).DisplayFormat := '000000';
  TNumericField(fdmtb_dados.Fields[0]).Alignment := taCenter;
end;

procedure TfrmPesquisaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPesquisaClientes := Nil;
end;

procedure TfrmPesquisaClientes.sbtn_anteriorClick(Sender: TObject);
var
  filtro, valor: String;
  listaClientes: TObjectList<TCliente>;
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
          filtro := 'idtbcliente = '+valor;
        1:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        ICliente := TICliente.New;

        ICliente.Build.ListPaginate(filtro, listaClientes, 'idtbcliente',
          StrToInt(cbox_registros.Text), currentrg);

        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TCliente>(listaClientes,
              fdmtb_dados);
            ds_dados.Enabled := True;
          end);

        listaClientes.Clear;
        FreeAndNil(listaClientes);

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

procedure TfrmPesquisaClientes.sbtn_proximoClick(Sender: TObject);
var
  filtro, valor: String;
  listaClientes: TObjectList<TCliente>;
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
          filtro := 'idtbcliente = '+valor;
        1:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        ICliente := TICliente.New;
        ICliente.Build.ListPaginate(filtro, listaClientes, 'idtbcliente',
          StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TCliente>(listaClientes,
              fdmtb_dados);
            ds_dados.Enabled := True;
          end);
        listaClientes.Clear;
        FreeAndNil(listaClientes);
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

procedure TfrmPesquisaClientes.sbtn_searchClick(Sender: TObject);
var
  filtro, valor: String;
  listaClientes: TObjectList<TCliente>;
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
          filtro := 'idtbcliente = '+valor;
        1:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'cpf_cnpj LIKE ' + QuotedStr(valor + '%');
        3:
          filtro := 'rg_insc LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        ICliente := TICliente.New;
        ICliente.Build.GetRecordsNumber('tbclientes', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));

        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        TICliente.New.Build.ListPaginate(filtro, listaClientes, 'idtbcliente',
          StrToInt(cbox_registros.Text), currentrg);

        if listaClientes.Count <= 0 then
          MsgInformacao('Não existem dados para exibir')
        else
        begin
          TThread.Synchronize(MyThread,
            procedure
            begin
              ds_dados.Enabled := False;
              TDataSetHelper.PreencheDataSet<TCliente>(listaClientes,
                fdmtb_dados);
              ds_dados.Enabled := True;
            end);
        end;
        listaClientes.Clear;
        FreeAndNil(listaClientes);

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
