unit uImportaMovimentos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,

  uRotinas,
  uGlobal,
  uControle,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,

  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TfImportaMovimentos = class(TForm)
    progresso: TProgressBar;
    dtp_dtInicio: TDateTimePicker;
    lblInicio: TLabel;
    lblAte: TLabel;
    dtp_dttermino: TDateTimePicker;
    btn_Executar: TButton;
    rgrp_opcoes: TRadioGroup;
    rbtn_reservas: TRadioButton;
    rbtn_vednas: TRadioButton;
    FDQuery1: TFDQuery;
    procedure btn_ExecutarClick(Sender: TObject);
  private
    procedure IsExceptionThread(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportaMovimentos: TfImportaMovimentos;
  vControle         : TControle;

implementation

{$R *.dfm}

procedure TfImportaMovimentos.IsExceptionThread(Sender: TObject);
begin
    if Sender is TThread then
    begin
        if Assigned(TThread(Sender).FatalException) then
          ShowMessage('A Thread Falhou: ’' + Exception(TThread(sender).FatalException).Message);

//        btn_gerar.Enabled := True;
    end;
end;

procedure TfImportaMovimentos.btn_ExecutarClick(Sender: TObject);
var
  vMovimento,
  vQryCab,
  vQryPagto,
  vQryItem    : TFDQuery;
  controle,
  guid        : String;
  inicio      : TDateTime;
  MyThread    : TThread;
begin
  MyThread := TThread.CreateAnonymousThread( procedure var i, j, k: Integer;
    Begin
      MyThread.FreeOnTerminate := True;
      inicio                   := Now();

      vControle             := TControle.Create;
      vMovimento            := TFDQuery.Create(nil);
      vQryCab               := TFDQuery.Create(nil);
      vQryPagto             := TFDQuery.Create(nil);
      vQryItem              := TFDQuery.Create(nil);

      vMovimento.Connection := vControle.Conexao.GetConexao;
      vQryCab.Connection    := vControle.Conexao.GetConexao;
      vQryPagto.Connection  := vControle.Conexao.GetConexao;
      vQryItem.Connection   := vControle.Conexao.GetConexao;

      vMovimento.FetchOptions.RecordCountMode := cmTotal;

      if rbtn_reservas.Checked then
        vMovimento.Open('select * from vw_reservascab_item where date(dtemissao) between '+
                        QuotedStr(FormatDateTime('YYYY-mm-dd',dtp_dtInicio.DateTime))+
                        ' AND '+
                        QuotedStr(FormatDateTime('YYYY-mm-dd',dtp_dttermino.DateTime))+
                        ' order by dtemissao, grupo, item')
      else
        vMovimento.Open('select * from vw_vendascab_item where date(dtemissao) between '+
                              QuotedStr(FormatDateTime('YYYY-mm-dd',dtp_dtInicio.DateTime))+
                              ' AND '+
                              QuotedStr(FormatDateTime('YYYY-mm-dd',dtp_dttermino.DateTime))+
                              ' order by dtemissao, grupo, item');

      if vMovimento.IsEmpty then
        begin
          MsgAviso('Não existe movimento para período escolhido');
          Exit;
        end;

      progresso.Max      := vMovimento.RecordCount;
      progresso.Min      := 0;
      progresso.Position := 0;

      Try

        vQryCab.Close;
        vQryCab.SQL.Clear;
        vQryCab.SQL.Add('INSERT INTO tbordens_cab(');
        vQryCab.SQL.Add('idtbordens_cab');
        vQryCab.SQL.Add(',idtbempresa');
        vQryCab.SQL.Add(',controle');
        vQryCab.SQL.Add(',idfuncionario');
        vQryCab.SQL.Add(',idtbcliente');
        vQryCab.SQL.Add(',dtdocumento');
        vQryCab.SQL.Add(',dtretirada');
        vQryCab.SQL.Add(',dtdevolucao');
        vQryCab.SQL.Add(',observacao');
        vQryCab.SQL.Add(',estado');
        vQryCab.SQL.Add(',retirada');
        vQryCab.SQL.Add(')VALUES(');
        vQryCab.SQL.Add(':idtbordens_cab');
        vQryCab.SQL.Add(',:idtbempresa');
        vQryCab.SQL.Add(',:controle');
        vQryCab.SQL.Add(',(SELECT idtbfuncionario FROM tbfuncionarios WHERE nome = :funcionario)');
        vQryCab.SQL.Add(',:idtbcliente');
        vQryCab.SQL.Add(',:dtdocumento');
        vQryCab.SQL.Add(',:dtretirada');
        vQryCab.SQL.Add(',:dtdevolucao');
        vQryCab.SQL.Add(',:observacao');
        vQryCab.SQL.Add(',:estado');
        vQryCab.SQL.Add(',:retirada)');

        vQryPagto.Close;
        vQryPagto.SQL.Clear;
        vQryPagto.SQL.Add('INSERT INTO tbordens_pagto(');
        vQryPagto.SQL.Add('idtbordens_cab');
        vQryPagto.SQL.Add(',idtbformas_pagto');
        vQryPagto.SQL.Add(',valor');
        vQryPagto.SQL.Add(')VALUES(');
        vQryPagto.SQL.Add(':idtbordens_cab');
        vQryPagto.SQL.Add(',(SELECT idtbformas_pagto FROM tbformas_pagto WHERE descricao = :descricao)');
        vQryPagto.SQL.Add(',:valor)');

        vQryItem.Close;
        vQryItem.SQL.Clear;
        vQryItem.SQL.Add('INSERT INTO tbordens_itens(');
        vQryItem.SQL.Add('idtbordens_itens');
        vQryItem.SQL.Add(',idtbordens_cab');
        vQryItem.SQL.Add(',idtbproduto');
        vQryItem.SQL.Add(',item');
        vQryItem.SQL.Add(',qtde');
        vQryItem.SQL.Add(',precoTabela');
        vQryItem.SQL.Add(',valorUnitario');
        vQryItem.SQL.Add(',percDesconto');
        vQryItem.SQL.Add(',valorDesconto'); // valorAcrescimo
        vQryItem.SQL.Add(',percAcrescimo');
        vQryItem.SQL.Add(',valorAcrescimo');
        vQryItem.SQL.Add(',totalBruto');
        vQryItem.SQL.Add(',totalLiquido');
        vQryItem.SQL.Add(',venda');
        vQryItem.SQL.Add(',dtretirada');
        vQryItem.SQL.Add(',retirado');
        vQryItem.SQL.Add(',devolvido');
        vQryItem.SQL.Add(',cancelado');
        vQryItem.SQL.Add(')VALUES(');
        vQryItem.SQL.Add(':idtbordens_itens');
        vQryItem.SQL.Add(',:idtbordens_cab');
        vQryItem.SQL.Add(',:idtbproduto');
        vQryItem.SQL.Add(',:item');
        vQryItem.SQL.Add(',:qtde');
        vQryItem.SQL.Add(',:precoTabela');
        vQryItem.SQL.Add(',:valorUnitario');
        vQryItem.SQL.Add(',:percDesconto');
        vQryItem.SQL.Add(',:valorDesconto');
        vQryItem.SQL.Add(',:percAcrescimo');
        vQryItem.SQL.Add(',:valorAcrescimo');
        vQryItem.SQL.Add(',:totalBruto');
        vQryItem.SQL.Add(',:totalLiquido');
        vQryItem.SQL.Add(',:venda');
        vQryItem.SQL.Add(',:dtretirada');
        vQryItem.SQL.Add(',:retirado');
        vQryItem.SQL.Add(',:devolvido');
        vQryItem.SQL.Add(',:cancelado)');

        // Configura o tamanho do array de inserções
        vQryCab.Params.ArraySize   := 0;
        vQryPagto.Params.ArraySize := 0;
        vQryItem.Params.ArraySize  := 0;

        i := 0;
        k := 0;
        j := 0;

        if Not vMovimento.Eof then
          repeat
            TThread.Synchronize(MyThread, procedure
              begin

              progresso.Position := progresso.Position + 1;

              end);

            controle := vMovimento.FieldByName('grupo').AsString;
            guid     := GuidCreate;

            vQryCab.Params.ArraySize := vQryCab.Params.ArraySize + 1;

            vQryCab.ParamByName('idtbordens_cab').AsStrings[i]   := guid;
            vQryCab.ParamByName('idtbempresa').AsIntegers[i]     := vMovimento.FieldByName('idtbempresa').AsInteger;
            vQryCab.ParamByName('controle').AsIntegers[i]        := vMovimento.FieldByName('idtbreserva').AsInteger;
            vQryCab.ParamByName('funcionario').AsStrings[i]      := vMovimento.FieldByName('funcionario').AsString;
            vQryCab.ParamByName('idtbcliente').AsIntegers[i]     := vMovimento.FieldByName('idtbcliente').AsInteger;
            vQryCab.ParamByName('dtdocumento').AsDates[i]        := vMovimento.FieldByName('dtemissao').AsDateTime;
            vQryCab.ParamByName('dtretirada').AsDates[i]         := vMovimento.FieldByName('dtretirada').AsDateTime;
            vQryCab.ParamByName('dtdevolucao').AsDates[i]        := vMovimento.FieldByName('dtdevolucao').AsDateTime;
            vQryCab.ParamByName('observacao').AsStrings[i]       := '';
            vQryCab.ParamByName('estado').AsStrings[i]           := Copy(vMovimento.FieldByName('estado').AsString,1,1);
            vQryCab.ParamByName('retirada').AsStrings[i]         := Copy(vMovimento.FieldByName('retirada').AsString,1,1);

            vQryPagto.Params.ArraySize := vQryPagto.Params.ArraySize + 1;

            vQryPagto.ParamByName('idtbordens_cab').AsStrings[j] := guid;
            vQryPagto.ParamByName('descricao').AsStrings[j]      := IfThen(vMovimento.FieldByName('forma_pagto').AsString <> 'Diversos',
                                                                    vMovimento.FieldByName('forma_pagto').AsString, 'Dinheiro');
            vQryPagto.ParamByName('valor').AsCurrencys[j]        := vMovimento.FieldByName('total').Value;
            Inc(j);

            while controle = vMovimento.FieldByName('grupo').AsString do
              begin
                vQryItem.Params.ArraySize := vQryItem.Params.ArraySize + 1;

                vQryItem.ParamByName('idtbordens_itens').AsStrings[k] := GuidCreate;
                vQryItem.ParamByName('idtbordens_cab').AsStrings[k]   := guid;
                vQryItem.ParamByName('idtbproduto').AsIntegers[k]     := vMovimento.FieldByName('idtbproduto').Value;
                vQryItem.ParamByName('item').AsIntegers[k]            := vMovimento.FieldByName('item').Value;
                vQryItem.ParamByName('qtde').AsIntegers[k]            := vMovimento.FieldByName('qtde').Value;
                vQryItem.ParamByName('precoTabela').AsCurrencys[k]    := vMovimento.FieldByName('valorTabela').Value;
                vQryItem.ParamByName('valorUnitario').AsCurrencys[k]  := vMovimento.FieldByName('valor_unit').Value;
                vQryItem.ParamByName('percDesconto').AsCurrencys[k]   := 0;
                vQryItem.ParamByName('valorDesconto').AsCurrencys[k]  := 0;
                vQryItem.ParamByName('percAcrescimo').AsCurrencys[k]  := 0;
                vQryItem.ParamByName('valorAcrescimo').AsCurrencys[k] := 0;

                if (vMovimento.FieldByName('valorTabela').Value > vMovimento.FieldByName('valor_unit').Value) then
                  begin
                    vQryItem.ParamByName('percDesconto').AsCurrencys[k]   := vMovimento.FieldByName('perc_desc').Value;
                    vQryItem.ParamByName('valorDesconto').AsCurrencys[k]  := vMovimento.FieldByName('valor_desc').Value * (-1);
                  end;

                if (vMovimento.FieldByName('valorTabela').Value < vMovimento.FieldByName('valor_unit').Value) then
                  begin
                    vQryItem.ParamByName('percAcrescimo').AsCurrencys[k]  := vMovimento.FieldByName('perc_desc').Value;
                    vQryItem.ParamByName('valorAcrescimo').AsCurrencys[k] := vMovimento.FieldByName('valor_desc').Value;
                  end;

                vQryItem.ParamByName('totalBruto').AsCurrencys[k]     := vMovimento.FieldByName('valor_total').Value;
                vQryItem.ParamByName('totalLiquido').AsCurrencys[k]   := vMovimento.FieldByName('valor_total').Value;
                vQryItem.ParamByName('venda').AsStrings[k]            := Copy(vMovimento.FieldByName('venda').AsString,1,1);
                vQryItem.ParamByName('dtretirada').AsDates[k]         := vMovimento.FieldByName('dtretirada').Value;
                vQryItem.ParamByName('retirado').AsStrings[k]         := Copy(vMovimento.FieldByName('retirada').AsString,1,1);
                vQryItem.ParamByName('devolvido').AsStrings[k]        := Copy(vMovimento.FieldByName('devolvido').AsString,1,1);
                vQryItem.ParamByName('cancelado').AsStrings[k]        := Copy(vMovimento.FieldByName('cancelado').AsString,1,1);

                vMovimento.Next;
                Inc(k);
                progresso.Position := progresso.Position + 1;

                if vMovimento.Eof then
                  break;
              end;

            Inc(i);
          until vMovimento.Eof;

        // Executa as inserções em lote
        vQryCab.Execute(vQryCab.Params.ArraySize);
        vQryPagto.Execute(vQryPagto.Params.ArraySize);
        vQryItem.Execute(vQryItem.Params.ArraySize);

      Finally
        FreeAndNil(vQryItem);
        FreeAndNil(vQryPagto);
        FreeAndNil(vQryCab);
        FreeAndNil(vControle);
        ShowMessage(Format('Grupos importados do site em %s.', [FormatDateTime('hh":"nn":"ss"."zzz', Now - inicio)]));
      End;

    End);
  MyThread.OnTerminate := IsExceptionThread;
  MyThread.Start;
end;

end.
