unit view.cadastros.usuarioPesquisa;

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

  model.usuario,
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
  TfrmPesquisaUsuarios = class(TfrmPesquisaPadrao)
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
  frmPesquisaUsuarios: TfrmPesquisaUsuarios;

implementation

{$R *.dfm}

uses
  controller.dto.usuario.interfaces.impl;

procedure TfrmPesquisaUsuarios.fdmtb_dadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(fdmtb_dados.FieldByName('idtbusuario')).DisplayFormat
    := '000';
  TNumericField(fdmtb_dados.FieldByName('idtbusuario')).Alignment
    := taCenter;
end;

procedure TfrmPesquisaUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaUsuarios := nil;
  inherited;
end;

procedure TfrmPesquisaUsuarios.sbtn_anteriorClick(Sender: TObject);
var
  filtro, valor: String;
  listaUsuarios: TObjectList<Tusuario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg - StrToInt(cbox_registros.Text);
      currentpg := currentpg - 1;
      filtro := 'username like ' + QuotedStr(ledt_valor.Text + '%');

      Try
        var
        IUsuario := TIUsuario.New;
        IUsuario.Build.ListPaginate(filtro, listaUsuarios, 'idtbusuario',
          StrToInt(cbox_registros.Text), currentrg);

        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<Tusuario>(listaUsuarios, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
         listaUsuarios.Clear;
         FreeAndNil(listaUsuarios);
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

procedure TfrmPesquisaUsuarios.sbtn_proximoClick(Sender: TObject);
var
  filtro, valor: String;
  listaUsuarios: TObjectList<TUsuario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      currentrg := currentrg + StrToInt(cbox_registros.Text);
      currentpg := currentpg + 1;
      filtro := 'username like ' + QuotedStr(ledt_valor.Text + '%');

      Try
        var
        IUsuario := TIUsuario.New;
        IUsuario.Build.ListPaginate(filtro, listaUsuarios, 'idtbusuario',
          StrToInt(cbox_registros.Text), currentrg);

        TThread.Synchronize(MyThread,
          procedure
          begin
            ds_dados.Enabled := False;
            fdmtb_dados.EmptyDataSet;
            TDataSetHelper.PreencheDataSet<Tusuario>(listaUsuarios, fdmtb_dados);
            ds_dados.Enabled := True;
          end);
         listaUsuarios.Clear;
         FreeAndNil(listaUsuarios);
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

procedure TfrmPesquisaUsuarios.sbtn_searchClick(Sender: TObject);
var
  filtro: String;
  listaUsuarios: TObjectList<TUsuario>;
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    Begin
      MyThread.FreeOnTerminate := True;
      filtro := 'username like ' + QuotedStr(ledt_valor.Text + '%');

      Try
        var
        IUsuario := TIUsuario.New;
        IUsuario.Build.GetRecordsNumber('tbusuarios', filtro, totalrg);
        currentrg := 0;
        currentpg := 1;
        totalpg := Ceil(totalrg / StrToInt(cbox_registros.Text));

        ds_dados.Enabled := True;
        sbtn_anterior.Enabled := False;
        sbtn_proximo.Enabled := False;

        if fdmtb_dados.Active then
          fdmtb_dados.EmptyDataSet;


        IUsuario.Build.ListPaginate(filtro, listaUsuarios, 'idtbusuario',
          StrToInt(cbox_registros.Text), currentrg);

        if listaUsuarios.Count <= 0 then
          MsgInformacao('Não existem dados para exibir')
        else
          begin
            TThread.Synchronize(MyThread,
              procedure
              begin
                ds_dados.Enabled := False;
                if fdmtb_dados.Active then
                  fdmtb_dados.EmptyDataSet;
                TDataSetHelper.PreencheDataSet<Tusuario>(listaUsuarios, fdmtb_dados);
                ds_dados.Enabled := True;
              end);
          end;
         listaUsuarios.Clear;
         FreeAndNil(listaUsuarios);

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
