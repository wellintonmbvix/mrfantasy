unit view.cadastros.funcionarioPesquisa;

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

  model.funcionario,
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
  TfrmPesquisaFuncionarios = class(TfrmPesquisaPadrao)
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
  frmPesquisaFuncionarios: TfrmPesquisaFuncionarios;

implementation

{$R *.dfm}

uses
  controller.dto.funcionario.interfaces.impl;

procedure TfrmPesquisaFuncionarios.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.FieldByName('idtbfuncionario')).DisplayFormat
    := '0000';
  TNumericField(fdmtb_dados.FieldByName('idtbfuncionario')).Alignment
    := taCenter;
end;

procedure TfrmPesquisaFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaFuncionarios := Nil;
  inherited;
end;

procedure TfrmPesquisaFuncionarios.sbtn_anteriorClick(Sender: TObject);
var
  filtro, valor: String;
  listaFuncionarios: TObjectList<TFuncionario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg - StrToInt(cbox_registros.Text);
      currentpg := currentpg - 1;

      if cbox_campo.ItemIndex = 1 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'cpf LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'rg LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IFuncionario := TIFuncionario.New;
        IFuncionario.Build.ListPaginate(filtro, listaFuncionarios,
          'idtbfuncionario', StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
        listaFuncionarios.Clear;
        FreeAndNil(listaFuncionarios);
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

procedure TfrmPesquisaFuncionarios.sbtn_proximoClick(Sender: TObject);
var
  filtro, valor: String;
  listaFuncionarios: TObjectList<TFuncionario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg + StrToInt(cbox_registros.Text);
      currentpg := currentpg + 1;

      if cbox_campo.ItemIndex = 1 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'cpf LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'rg LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IFuncionario := TIFuncionario.New;
        IFuncionario.Build.ListPaginate(filtro, listaFuncionarios,
          'idtbfuncionario', StrToInt(cbox_registros.Text), currentrg);
        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
        listaFuncionarios.Clear;
        FreeAndNil(listaFuncionarios);
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

procedure TfrmPesquisaFuncionarios.sbtn_searchClick(Sender: TObject);
var
  filtro, valor: String;
  listaFuncionarios: TObjectList<TFuncionario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      if cbox_campo.ItemIndex = 1 then
        valor := MascaraCpfCnpj(ledt_valor.Text)
      else
        valor := ledt_valor.Text;

      case cbox_campo.ItemIndex of
        0:
          filtro := 'nome LIKE ' + QuotedStr(valor + '%');
        1:
          filtro := 'cpf LIKE ' + QuotedStr(valor + '%');
        2:
          filtro := 'rg LIKE ' + QuotedStr(valor + '%');
      end;

      Try
        var
        IFuncionario := TIFuncionario.New;
        IFuncionario.Build.GetRecordsNumber('tbfuncionarios', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));

        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;

        IFuncionario.Build.ListPaginate(filtro, listaFuncionarios,
          'idtbfuncionario', StrToInt(cbox_registros.Text), currentrg);

        if listaFuncionarios.Count <= 0 then
          MsgInformacao('Não existem dados para exibir')
        else
          begin
          TThread.Synchronize(MyThread,
            procedure
            begin
              ds_dados.Enabled := False;
              if fdmtb_dados.Active then
                fdmtb_dados.EmptyDataSet;
              TDataSetHelper.PreencheDataSet<TFuncionario>(listaFuncionarios, fdmtb_dados);
              ds_dados.Enabled := True;
            end);
          end;
          listaFuncionarios.Clear;
          FreeAndNil(listaFuncionarios);

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
