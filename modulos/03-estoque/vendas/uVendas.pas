unit uVendas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  System.Actions,

  uClasseVendas,
  uClasseClientes,
  uClasseFantasias,
  uClasseFuncionarios,
  uGlobal,
  uRotinas,
  uControle,

  classe.global,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ActnList,
  Vcl.Menus,

  JvExMask,
  JvToolEdit,
  JvExStdCtrls,
  JvEdit,
  JvValidateEdit,
  JvSpin,
  JvExDBGrids,
  JvDBGrid,
  JvHint,
  JvComponentBase,
  JvBalloonHint,

  uPesquisaVendas,

  frxExportPDF,
  frxClass,
  frxExportBaseDialog,
  frxExportText,
  frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  TfVendas = class(TForm)
    pnlBotoes: TPanel;
    sbtnNovo: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    sbtnSair: TSpeedButton;
    shp2: TShape;
    sbtnPagamento: TSpeedButton;
    Shape2: TShape;
    shp1: TShape;
    pnlDados: TPanel;
    Label1: TLabel;
    ledt_idvenda: TLabeledEdit;
    jvcedt_idclie: TJvComboEdit;
    ledt_cliente: TLabeledEdit;
    Shape1: TShape;
    pnlProdutos: TPanel;
    sbtnIncluir: TSpeedButton;
    sbtnRetirar: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_qtde: TLabel;
    lbl_total: TLabel;
    ledt_fantasia: TLabeledEdit;
    jvsedt_qtde: TJvSpinEdit;
    jvcedt_idproduto: TJvComboEdit;
    ledt_vlvenda: TLabeledEdit;
    jvv_percdesc: TJvValidateEdit;
    jvv_valdesc: TJvValidateEdit;
    ledt_item: TLabeledEdit;
    jvdb_dados: TJvDBGrid;
    dsItens: TDataSource;
    JvBalloonHint: TJvBalloonHint;
    jvcedt_idvend: TJvComboEdit;
    Label6: TLabel;
    ledt_vendedor: TLabeledEdit;
    Shape3: TShape;
    sbtnImprimir: TSpeedButton;
    frxReport: TfrxReport;
    frxDBDNota: TfrxDBDataset;
    frxDBDItem: TfrxDBDataset;
    frxSimpleTextExport: TfrxSimpleTextExport;
    frxPDFExport: TfrxPDFExport;
    ActionList: TActionList;
    actImpComp: TAction;
    pmnImpressao: TPopupMenu;
    mnComprovante: TMenuItem;
    jvcedt_vlvenda: TJvValidateEdit;
    fdmVendaCab: TFDMemTable;
    fdmVendaItem: TFDMemTable;
    fdmVendaItemproduto: TWideStringField;
    fdmVendaItemtipo: TWideStringField;
    fdmVendaItemqtde: TIntegerField;
    fdmVendaItemcancelado: TWideStringField;
    fdmVendaItempreco_tabela: TBCDField;
    fdmVendaItemperc_desc: TBCDField;
    fdmVendaItemvalor_desc: TBCDField;
    fdmVendaItemvalor_total: TBCDField;
    fdmVendaItemvalor_unit: TBCDField;
    fdmVendaItemidusercad: TIntegerField;
    fdmVendaItemidtbempresa: TIntegerField;
    fdmVendaItemempresa: TWideStringField;
    fdmVendaItemidtbvendanota: TIntegerField;
    fdmVendaItempdv: TIntegerField;
    fdmVendaItemdtemissao: TDateField;
    fdmVendaItemidtbproduto: TIntegerField;
    fdmVendaItemperc_acre: TBCDField;
    fdmVendaItemvalor_acre: TBCDField;
    fdmVendaItemdtcadastro: TDateField;
    fdmVendaItemusercad: TWideStringField;
    fdmVendaItemdtalterado: TDateField;
    fdmVendaItemiduseralt: TIntegerField;
    fdmVendaItemuseralt: TWideStringField;
    fdmVendaItemitem: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure jvcedt_idclieButtonClick(Sender: TObject);
    procedure jvcedt_idprodutoButtonClick(Sender: TObject);
    procedure jvcedt_idprodutoChange(Sender: TObject);
    procedure jvdb_dadosCellClick(Column: TColumn);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnIncluirClick(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnRetirarClick(Sender: TObject);
    procedure jvcedt_idvendButtonClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure sbtnPagamentoClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure jvv_valdescExit(Sender: TObject);
    procedure actImpCompExecute(Sender: TObject);
    procedure mnComprovanteClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure jvv_percdescChange(Sender: TObject);
    procedure jvv_percdescClick(Sender: TObject);
    procedure jvv_percdescEnter(Sender: TObject);
    procedure jvv_percdescExit(Sender: TObject);
    procedure jvcedt_vlvendaExit(Sender: TObject);
    procedure jvcedt_vlvendaEnter(Sender: TObject);
    procedure jvcedt_vlvendaChange(Sender: TObject);
    procedure jvcedt_vlvendaClick(Sender: TObject);
    procedure jvv_valdescKeyPress(Sender: TObject; var Key: Char);
    procedure jvv_valdescEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure jvcedt_idclieChange(Sender: TObject);
    procedure jvcedt_idvendChange(Sender: TObject);
    procedure jvcedt_idprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CalcularDesconto(Metodo: Integer);
    procedure LimparItem;
    procedure CancelarItem;
    procedure IncluirItem;
    procedure NovaVenda;
    procedure CancelaVenda;
    procedure ListaCab;
    procedure ListaItens;
    procedure SetaDescAcre;
  public
    { Public declarations }
    condpagto: String;
    parcelas: Integer;
  end;

var
  fVendas      : TfVendas;
  fdqNotas,
  fdqItens     : TFDQuery;
  operacao     : String;
  desconto     : Boolean = true;
  ClasseVendas : TClasseVendas;
  Controle     : TControle;

implementation

{$R *.dfm}

uses
  uPrincipal,
  view.cadastros.clientePesquisa,
  view.cadastros.produtoPesquisa,
  view.cadastros.funcionarioPesquisa,
  uPagtoVendas;

procedure TfVendas.actImpCompExecute(Sender: TObject);
var
  fdqcomando: TFDQuery;
  impressora : String;
begin
  frxDBDNota.DataSet := fdmVendaCab;
  frxDBDItem.DataSet := fdmVendaItem;
  if Not fdmVendaCab.Active then
  Begin
    MsgErro('Nenhum documento aberto');
    Abort;
  End;

  if fdmVendaCab.RecordCount = 0 then
  Begin
    MsgAviso('Não existem dados para imprimir');
    Abort;
  End;

  frxReport.ReportOptions.CreateDate := Date();
  frxReport.ReportOptions.LastChange := Date();
  frxReport.ReportOptions.Author     := NameUser;

  Try

    fdqcomando := TFDQuery.Create(Application);
    fdqcomando.Connection := Controle.Conexao.GetConexao;
    fdqcomando.Open('select * from tbparametros');

    impressora    := fdqcomando.FieldByName('imp_bobina').AsString;

    With fdqcomando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM((qtde * valor_desc)) AS totaldesc,SUM((qtde * preco_tabela)) AS subtotal FROM tbvendasitem');
      SQL.Add('WHERE idtbvendanota=:venda AND pdv=:pdv AND canc = 0');
      ParamByName('venda').Value := fdmVendaCab.Fields[0].Value; //fdqNotas.FieldByName('idtbvendanota').Value;
      ParamByName('pdv').Value := fdmVendaCab.Fields[11].Value; //fdqNotas.FieldByName('pdv').Value;
      Open;
    End;

    while MsgConfirmacao('Imprimir comprovante de venda?') do
      Begin
        frxReport.LoadFromFile(LoadReportStream('rptcompvenda','rptCompVenda.fr3'));
        frxReport.PrintOptions.ShowDialog := False;
        frxReport.PrintOptions.Printer    := impressora;
        frxReport.PrintOptions.Copies     := 1;
        frxReport.PrepareReport;
        frxReport.Variables['totaldesc'] :=
          StringReplace(fdqcomando.FieldByName('totaldesc').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        frxReport.Variables['totalbruto'] :=
          StringReplace(fdqcomando.FieldByName('subtotal').Value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        frxReport.Print;
      End;


//    if MsgConfirmacao('Imprimir direto para impressora?') then
//    Begin
//      frxReport.LoadFromFile(LoadReportStream('rptcompvenda','rptCompVenda.fr3'));
//      frxReport.PrintOptions.ShowDialog := False;
//      frxReport.PrintOptions.Printer    := impressora;
//      frxReport.PrintOptions.Copies     := 1;
//      frxReport.PrepareReport;
//      frxReport.Variables['totaldesc'] :=
//        StringReplace(fdqcomando.FieldByName('totaldesc').Value, ',', '.',
//        [rfReplaceAll, rfIgnoreCase]);
//      frxReport.Variables['totalbruto'] :=
//        StringReplace(fdqcomando.FieldByName('subtotal').Value, ',', '.',
//        [rfReplaceAll, rfIgnoreCase]);
//      frxReport.Print;
//    End
//    else
//    Begin
//      frxReport.LoadFromFile(LoadReportStream('rptcompvenda','rptCompVenda.fr3'));
//      frxReport.PrintOptions.ShowDialog := True;
//      frxReport.PrintOptions.Printer    := impressora;
//      frxReport.PrepareReport;
//      frxReport.Variables['totaldesc'] :=
//        StringReplace(fdqcomando.FieldByName('totaldesc').Value, ',', '.',
//        [rfReplaceAll, rfIgnoreCase]);
//      frxReport.Variables['totalbruto'] :=
//        StringReplace(fdqcomando.FieldByName('subtotal').Value, ',', '.',
//        [rfReplaceAll, rfIgnoreCase]);
//      frxReport.ShowReport;
//    End;
  Finally
    FreeAndNil(fdqcomando);
  End;
end;

procedure TfVendas.CalcularDesconto(Metodo: Integer);
begin
case Metodo of
    0: // Desconto ao digitar o valor de venda
      Begin
        if desconto then
          Begin
            jvv_valdesc.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text)) -
              jvcedt_vlvenda.Value;

            if jvv_valdesc.Value > 0 then
            Begin
              jvv_percdesc.Value :=
                (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
                ledt_vlvenda.Text))) * 100;
            End
            Else
            Begin
              jvv_valdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));
            End;
          End
        else
          Begin
            jvv_valdesc.Value := jvcedt_vlvenda.Value -
            StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));

            if jvv_valdesc.Value > 0 then
            Begin
              jvv_percdesc.Value :=
                (jvv_valdesc.Value / jvcedt_vlvenda.Value) * 100;
            End
            Else
            Begin
              jvv_valdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));
            End;
          End;
      End;
    1: // Desconto ao digitar o percentual de desconto/acréscimo
      Begin
        if desconto then
          Begin
            if jvv_percdesc.Value > 0 then
            Begin
              jvv_valdesc.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text)) *
                (jvv_percdesc.Value / 100);
            End
            Else
            Begin
              jvv_valdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text))
            End;

            jvcedt_vlvenda.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text)) -
              jvv_valdesc.Value;
          End
        else
          Begin
            if jvv_percdesc.Value > 0 then
            Begin
              jvv_valdesc.Value :=
                jvcedt_vlvenda.Value *
                (jvv_percdesc.Value / 100);
            End
            Else
            Begin
              jvv_valdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text))
            End;

            jvcedt_vlvenda.Value :=
              jvv_valdesc.Value + StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));
          End;
      End;
    2: // Desconto ao digitar o valor de desconto/acréscimo
      Begin
        if desconto then
          Begin
            jvcedt_vlvenda.Value :=
              StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text)) -
              jvv_valdesc.Value;

            if jvv_valdesc.Value > 0 then
            Begin
              jvv_percdesc.Value :=
                (jvv_valdesc.Value / StrToCurr(SomenteNumero('R$ .',
                ledt_vlvenda.Text))) * 100;
            End
            Else
            Begin
              jvv_percdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text))
            End;
          End
        else
          Begin
            jvcedt_vlvenda.Value :=
              jvv_valdesc.Value + StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));

            if jvv_valdesc.Value > 0 then
            Begin
              jvv_percdesc.Value :=
                (jvv_valdesc.Value / jvcedt_vlvenda.Value) * 100;
            End
            Else
            Begin
              jvv_percdesc.Value := 0;

              jvv_percdesc.Value := 0;

              jvcedt_vlvenda.Value :=
                StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text))
            End;
          End;
      End;
  end;
end;

procedure TfVendas.CancelarItem;
var
  fdqcomando: TFDQuery;
begin
  Try
    fdqcomando            := TFDQuery.Create(nil);
    fdqcomando.Connection := Controle.Conexao.GetConexao;
    With fdqcomando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as registros FROM tbvendasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv AND canc = 0');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value   := fdmVendaCab.Fields[0].Value; //fdqNotas.FieldByName('idtbvendanota').Value;
      ParamByName('pdv').Value     := fdmVendaCab.Fields[11].Value; //Terminal;
      Open;

      if FieldByName('registros').Value = 1 then
      Begin
        MsgAviso('Existe apenas um produto na venda.' + #13 +
          'Cancelamento de item não permitido');
        Exit;
      End;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbvendasitem SET');
      SQL.Add('canc = 1');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda');
      SQL.Add('AND idtbproduto = :produto AND item = :item AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value   := fdmVendaItem.Fields[2].Value;
      ParamByName('produto').Value := fdmVendaItem.Fields[6].Value;
      ParamByName('item').Value    := fdmVendaItem.Fields[5].Value;
      ParamByName('pdv').Value     := fdmVendaItem.Fields[3].Value;

      Try
        ExecSQL;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
        End;
      End;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbvendasnota SET');
      SQL.Add('qtde_total = (select ifnull(sum(qtde),0) from tbvendasitem a');
      SQL.Add('where a.idtbempresa = :empresa AND a.idtbvendanota = :venda AND a.canc = 0 AND pdv = :pdv),');
      SQL.Add('valor_total = (select ifnull(sum(valor_total),0) from tbvendasitem a');
      SQL.Add('where a.idtbempresa = :empresa AND a.idtbvendanota = :venda AND a.canc = 0 AND pdv = :pdv)');
      SQL.Add('WHERE idtbvendanota = :venda AND idtbempresa = :empresa AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value   := fdmVendaCab.Fields[0].Value;
      ParamByName('pdv').Value     := fdmVendaCab.Fields[11].Value;

      try
        ExecSQL;
      except
        On E: Exception Do
        Begin
          MsgErro('Erro' + #13 + E.Message);
          Abort;
        End;
      end;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(qtde),0) as total FROM tbvendasitem');
      SQL.Add('WHERE canc = 0 AND idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value   := fdmVendaCab.Fields[0].Value;
      ParamByName('pdv').Value     := fdmVendaCab.Fields[11].Value;
      Open;

      lbl_qtde.Caption := 'Qtde: ' + FieldByName('total').AsString;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(valor_total),0) as total FROM tbvendasitem');
      SQL.Add('WHERE canc = 0 AND idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value   := fdmVendaCab.Fields[0].Value;
      ParamByName('pdv').Value     := fdmVendaCab.Fields[11].Value;
      Open;

      lbl_total.Caption := 'Total: R$ ' + FormatFloat('###,##0.00',
        FieldByName('total').Value);
    End;

    ListaItens();
    LimparItem;
  Finally
    FreeAndNil(fdqcomando);
  End;
end;

procedure TfVendas.CancelaVenda;
var
  fdqcomando: TFDQuery;
begin
  if operacao = 'alterar' then
  Begin
    if Not MsgConfirmacao('Confirma o cancelamento desta venda?') then
      Abort;

    Try
      fdqcomando            := TFDQuery.Create(nil);
      fdqcomando.Connection := Controle.Conexao.GetConexao;
      With fdqcomando Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbvendasitem SET');
        SQL.Add('canc = 1,');
        SQL.Add('useralt = :usuario');
        SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
        ParamByName('usuario').Value := UserLog;
        ParamByName('empresa').Value := EmpLog;
        ParamByName('venda').Value   := StrToInt(ledt_idvenda.Text);
        ParamByName('pdv').Value     := Terminal;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbvendasnota SET');
        SQL.Add('estado = "C",');
        SQL.Add('useralt = :useralt');
        SQL.Add(' WHERE idtbvendanota = :venda AND idtbempresa = :empresa AND pdv = :pdv');
        ParamByName('useralt').Value := UserLog;
        ParamByName('venda').Value   := StrToInt(ledt_idvenda.Text);
        ParamByName('empresa').Value := EmpLog;
        ParamByName('pdv').Value     := Terminal;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('UPDATE tbcaixa SET cancelado = 1 AND useralt = :usuario');
        SQL.Add('WHERE origem="V" AND idtbempresa=:empresa AND documento=:documento AND pdv = :pdv');
        ParamByName('usuario').Value       := EmpLog;
        ParamByName('empresa').Value       := fdmVendaCab.Fields[1].Value;
        ParamByName('documento').AsInteger := fdmVendaCab.Fields[0].Value;
        ParamByName('pdv').Value           := Terminal;
        ExecSQL;
      End;
    Finally
      FreeAndNil(fdqcomando);
    End;

    sbtnNovo.Enabled      := True;
    sbtnPesquisar.Enabled := True;
    sbtnSair.Enabled      := True;
    jvcedt_idclie.Enabled := True;
    sbtnNovo.Click;
  End;
end;

procedure TfVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fVendas := Nil;
end;

procedure TfVendas.FormCreate(Sender: TObject);
begin
  Controle              := TControle.Create;
  ClasseVendas          := TClasseVendas.Create(Controle);
  Application.HintColor := $005BFFAD;
end;

procedure TfVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ClasseVendas);
  FreeAndNil(Controle);
end;

procedure TfVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If Key = #13 then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TfVendas.FormResize(Sender: TObject);
begin
  Self.WindowState := wsNormal;
end;

procedure TfVendas.FormShow(Sender: TObject);
begin
  sbtnNovo.Click;
end;

procedure TfVendas.IncluirItem;
var
  fdqcomando: TFDQuery;
begin
  // Fazendo as validações
  if jvcedt_idvend.Text = EmptyStr then
  Begin
    MsgErro('Vendedor(a) não foi informado(a)');
    jvcedt_idvend.SetFocus;
    Abort;
  End;
  if jvcedt_idproduto.Text = EmptyStr then
  Begin
    MsgErro('Fantasia não foi informada');
    jvcedt_idproduto.SetFocus;
    Abort;
  End;

  ledt_vlvenda.SetFocus;

  Try
    With ClasseVendas Do
    Begin
      // Setando os campos incomuns entre nota/item
      IdVenda := StrToInt(ledt_idvenda.Text);
      Empresa := EmpLog;

      UserCad := UserLog;
      UserAlt := UserLog;

      // Incluindo nota se não existir
      if operacao = 'incluir' then
      Begin
        Funcionario := StrToInt(jvcedt_idvend.Text);

        if jvcedt_idclie.Text <> EmptyStr then
          Cliente := StrToInt(jvcedt_idclie.Text);

        QtdeTotal := 0;
        TotalNota := 0;
        FormaPagto := '';
        parcelas := 0;
        Estado := 'A';

        If Not InsereAlteraNotas then
          Exit;

        ListaCab();

        //
        pnlDados.Enabled      := False;
        sbtnNovo.Enabled      := False;
        sbtnPesquisar.Enabled := False;
        sbtnPagamento.Enabled := True;
        sbtnSair.Enabled      := False;
        operacao              := 'alterar';
      End;

      // Incluindo item
      Item      := StrToInt(ledt_item.Text);
      Produto   := StrToInt(jvcedt_idproduto.Text);
      QtdeUnit  := jvsedt_qtde.AsInteger;
      PrecoTab  := StrToCurr(SomenteNumero('R$ .', ledt_vlvenda.Text));
      ValorUnit := jvcedt_vlvenda.Value;
      if desconto then
      begin
      PercDesc  := jvv_percdesc.Value * -1;
      ValorDesc := jvv_valdesc.Value * -1;
      end
      else
      begin
      PercAcre  := jvv_percdesc.Value;
      ValorAcre := jvv_valdesc.Value;
      end;
      TotalItem := ValorUnit * QtdeUnit;
      Cancelado := False;

      if Not InsereAlteraItens then
        Exit;

      LimparItem;
    End;
  Except
    On E : Exception Do
      Begin
        MsgErro(E.Message);
      End;
  End;

  Try
    fdqcomando := TFDQuery.Create(nil);
    fdqcomando.Connection := Controle.Conexao.GetConexao;
    With fdqcomando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(qtde),0) as total FROM tbvendasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value := StrToInt(ledt_idvenda.Text);
      ParamByName('pdv').Value := Terminal;
      Open;

      lbl_qtde.Caption := 'Qtde: ' + FieldByName('total').AsString;

      Close;
      SQL.Clear;
      SQL.Add('SELECT IFNULL(SUM(valor_total),0) as total FROM tbvendasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value := StrToInt(ledt_idvenda.Text);
      ParamByName('pdv').Value := Terminal;
      Open;

      lbl_total.Caption := 'Total: R$ ' + FormatFloat('###,##0.00',
        FieldByName('total').Value);

      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(item)+1 AS item FROM tbvendasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('venda').Value := StrToInt(ledt_idvenda.Text);
      ParamByName('pdv').Value := Terminal;
      Open;
      ledt_item.Text := FieldByName('item').AsString;
    End;
  Finally
    FreeAndNil(fdqcomando)
  End;

  // Restaurando itens
    LimparItem;
 // Relistando os itens
    ListaItens();
end;

procedure TfVendas.jvcedt_idclieButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaClientes, frmPesquisaClientes);
  if TGlobal.entityId > 0 then
  Begin
    jvcedt_idclie.Text := FormatFloat('0000000', TGlobal.entityId);
    jvcedt_idproduto.SetFocus;
  End;
end;

procedure TfVendas.jvcedt_idclieChange(Sender: TObject);
var
  ClasseClientes: TClasseClientes;
begin
  inherited;
  if jvcedt_idclie.Text <> EmptyStr then
  Begin
    Try
      ClasseClientes := TClasseClientes.Create(Controle);
      With ClasseClientes Do
      Begin
        CarregaDados(StrToInt(jvcedt_idclie.Text));
        if Cliente > 0 then
        Begin
          CarregaDados(StrToInt(jvcedt_idclie.Text));
          jvcedt_idclie.Text := FormatFloat('0000000', Cliente);
          ledt_cliente.Text := Nome;
        End
        Else
        Begin
          ledt_cliente.Text := 'INEXISTENTE';
          jvcedt_idclie.SetFocus;
        End;
      End;
    Finally
      FreeAndNil(ClasseClientes);
    End;
  End
  Else
    ledt_cliente.Text := 'CONSUMIDOR FINAL';
end;

procedure TfVendas.jvcedt_idprodutoButtonClick(Sender: TObject);
var
  ClasseFantasias: TClasseFantasias;
begin
  Try
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao); //ClasseFantasias := TClasseFantasias.Create(Controle);

    OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
    if TGlobal.entityId > 0 then
      jvcedt_idproduto.Text := IntToStr(TGlobal.entityId);
  Finally
    FreeAndNil(ClasseFantasias);
  End;
end;

procedure TfVendas.jvcedt_idprodutoChange(Sender: TObject);
var
  ClasseFantasias: TClasseFantasias;
begin
  if jvcedt_idproduto.Text <> EmptyStr then
  Begin
    Try
      ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao); //ClasseFantasias := TClasseFantasias.Create(Controle);
      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(jvcedt_idproduto.Text));
        if Fantasia > 0 then
        Begin
          ledt_fantasia.Text := Nome;
          ledt_vlvenda.Text := FormatFloat('R$ ###,##0.00', VlVenda);
          jvcedt_vlvenda.Value := VlVenda;
          if ItemVenda = 'AL' then
          Begin
            MsgAviso('Produto cadastrado apenas para Alugar');
            jvcedt_idproduto.Clear;
          End;
        End
        Else
        Begin
          ledt_fantasia.Text := 'INEXISTENTE';
          ledt_vlvenda.Text := FormatFloat('R$ ###,##0.00', 0);
          jvcedt_vlvenda.Value := 0;
        End;
      End;
    Finally
      FreeAndNil(ClasseFantasias);
    End;
  End
  Else
  Begin
    ledt_fantasia.Text := '';
    ledt_vlvenda.Text := FormatFloat('R$ ###,##0.00', 0);
    jvcedt_vlvenda.Value := 0;
  End;
end;

procedure TfVendas.jvcedt_idprodutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F3 then
    begin
      desconto := not desconto;
      SetaDescAcre;
    end;
end;

procedure TfVendas.jvcedt_idvendButtonClick(Sender: TObject);
begin
  OpenFormModal(TfrmPesquisaFuncionarios, frmPesquisaFuncionarios);
  if TGlobal.entityId > 0 then
  Begin
    jvcedt_idvend.Text := FormatFloat('000', TGlobal.entityId);
    jvcedt_idclie.SetFocus;
  End;
end;

procedure TfVendas.jvcedt_idvendChange(Sender: TObject);
var
  ClasseFuncionarios: TClasseFuncionarios;
begin
  inherited;
  if jvcedt_idvend.Text <> EmptyStr then
  Begin
    Try
      ClasseFuncionarios := TClasseFuncionarios.Create
        (Controle);
      With ClasseFuncionarios Do
      Begin
        CarregaDados(StrToInt(jvcedt_idvend.Text));
        if Funcionario > 0 then
        Begin
          CarregaDados(StrToInt(jvcedt_idvend.Text));
          jvcedt_idvend.Text := FormatFloat('000', Funcionario);
          ledt_vendedor.Text := Abreviatura;
        End
        Else
        Begin
          ledt_vendedor.Text := 'INEXISTENTE';
          jvcedt_idvend.SetFocus;
        End;
      End;
    Finally
      FreeAndNil(ClasseFuncionarios);
    End;
  End
  Else
    ledt_vendedor.Text := '';
end;

procedure TfVendas.jvcedt_vlvendaChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('.,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  TJvValidateEdit(Sender).Text := FormatCurr('###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvcedt_vlvendaClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvcedt_vlvendaEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvcedt_vlvendaExit(Sender: TObject);
begin
  CalcularDesconto(0);
end;

procedure TfVendas.jvdb_dadosCellClick(Column: TColumn);
begin
  if (fdmVendaItem.RecordCount = 0) OR
    (fdmVendaItem.FieldByName('cancelado').AsString = 'Sim') OR
    (sbtnPagamento.Enabled = False) then
    Abort;

    nEmpresa            := fdmVendaItem.Fields[0].Value;
    nUsuario            := fdmVendaItem.Fields[19].Value;
    sbtnRetirar.Enabled := True;
end;

procedure TfVendas.jvv_percdescChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('.,', TJvValidateEdit(Sender).Text);

  if Length(valor) = 0 then
    valor := '0';

  TJvValidateEdit(Sender).Text := FormatCurr('###,##0.00',
    StrToCurr(valor) / 100);

  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvv_percdescClick(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvv_percdescEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfVendas.jvv_percdescExit(Sender: TObject);
begin
  if jvv_percdesc.Text = EmptyStr then
    jvv_percdesc.Value := 0;

  CalcularDesconto(1);
end;

procedure TfVendas.jvv_valdescEnter(Sender: TObject);
begin
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);

  Self.KeyPreview := False;
end;

procedure TfVendas.jvv_valdescExit(Sender: TObject);
begin
  if jvv_valdesc.Text = EmptyStr then
    jvv_valdesc.Value := 0;

  CalcularDesconto(2);

  Self.KeyPreview := True;
end;

procedure TfVendas.jvv_valdescKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    CalcularDesconto(2);
    sbtnIncluir.Click;
  End;
end;

procedure TfVendas.LimparItem;
var
  fdqcomando: TFDQuery;
begin
  Try
    fdqcomando            := TFDQuery.Create(nil);
    fdqcomando.Connection := Controle.Conexao.GetConexao;
    With fdqcomando Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(item)+1 AS item FROM tbvendasitem');
      SQL.Add('WHERE idtbempresa = :empresa AND idtbvendanota = :venda AND pdv = :pdv');
      ParamByName('empresa').Value := EmpLog;
      ParamByName('pdv').Value     := Terminal;
      ParamByName('venda').Value   := StrToInt(ledt_idvenda.Text);
      Open;

      jvcedt_idproduto.Clear;
      ledt_fantasia.Clear;
      jvsedt_qtde.Value := 1;
      ledt_vlvenda.Text := 'R$ 0,00';
      jvv_percdesc.Value := 0;
      jvv_valdesc.Value := 0;
      ledt_item.Text := FieldByName('item').AsString;
      sbtnIncluir.Enabled := True;
    End;
    sbtnIncluir.Enabled := True;
    sbtnRetirar.Enabled := False;

    jvcedt_idproduto.Enabled := True;
    jvsedt_qtde.Enabled      := True;
    jvv_percdesc.Enabled     := True;
    jvv_valdesc.Enabled      := True;
    jvcedt_idproduto.SetFocus;
  Finally
    FreeAndNil(fdqcomando);
  End;
end;

procedure TfVendas.ListaCab;
var
  VQry : TFDQuery;
  vClasseVendas : TClasseVendas;
  vControle     : TControle;
begin
  Try
    vControle     := TControle.Create;
    vClasseVendas := TClasseVendas.Create(vControle);
    fdmVendaCab.Close;
    VQry := vClasseVendas.VendaCab(EmpLog,StrToInt(ledt_idvenda.Text), Terminal);
    Try
      VQry.FetchAll;
      fdmVendaCab.Data := VQry.Data;
      fdmVendaCab.Open;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseVendas);
    FreeAndNil(vControle);
  End;
end;

procedure TfVendas.ListaItens;
var
  VQry : TFDQuery;
  vClasseVendas : TClasseVendas;
  vControle     : TControle;
begin
  Try
    vControle     := TControle.Create;
    vClasseVendas := TClasseVendas.Create(vControle);
    fdmVendaItem.Close;
    VQry := vClasseVendas.VendaItem(EmpLog,StrToInt(ledt_idvenda.Text), Terminal);
    Try
      VQry.FetchAll;
      fdmVendaItem.Data := VQry.Data;
      fdmVendaItem.Open;
      fdmVendaItem.Last;
    Finally
      VQry.Close;
      FreeAndNil(VQry);
    End;
  Finally
    FreeAndNil(vClasseVendas);
    FreeAndNil(vControle);
  End;
end;

procedure TfVendas.mnComprovanteClick(Sender: TObject);
begin
  actImpComp.Execute;
end;

procedure TfVendas.NovaVenda;
begin
  Try
    ClasseVendas.Empresa := EmpLog;
    ledt_idvenda.Text    := FormatFloat('00000',
      ClasseVendas.PegarRegistro(Terminal));
  Except
    On E : Exception Do
      Begin
        MsgErro(E.Message);
      End;
  End;

  pnlDados.Enabled         := True;
  jvcedt_idproduto.Enabled := True;
  jvsedt_qtde.Enabled      := True;
  jvv_percdesc.Enabled     := True;
  jvv_valdesc.Enabled      := True;

  mnComprovante.Enabled := False;
  sbtnPagamento.Enabled := False;
  sbtnSair.Enabled      := True;
  sbtnIncluir.Enabled   := True;

  LimparItem;
  jvcedt_idclie.Text := '';
  ledt_cliente.Text  := '';
  jvcedt_idvend.Text := '';
  ledt_vendedor.Text := '';
  ledt_item.Text     := '1';
  condpagto          := '';
  lbl_qtde.Caption   := 'Qtde: 0';
  lbl_total.Caption  := 'Total: R$ 0,00';
  jvcedt_idvend.SetFocus;

  ListaItens();
  ListaCab();

  operacao := 'incluir';
  desconto := true;
  SetaDescAcre;
end;

procedure TfVendas.sbtnCancelarClick(Sender: TObject);
begin
  CancelaVenda;
end;

procedure TfVendas.sbtnImprimirClick(Sender: TObject);
var
  P1, P2: TPoint;
begin
  P1.X := sbtnImprimir.Left;
  P1.Y := sbtnImprimir.Top + sbtnImprimir.Height;
  P2 := ClientToScreen(P1);
  pmnImpressao.PopUp(P2.X, P2.Y);
end;

procedure TfVendas.sbtnIncluirClick(Sender: TObject);
begin
  IncluirItem;
end;

procedure TfVendas.sbtnNovoClick(Sender: TObject);
begin
  NovaVenda;
end;

procedure TfVendas.sbtnPagamentoClick(Sender: TObject);
begin
  if operacao <> 'alterar' then
    Abort;

  VendaPaga := False;
  condpagto := '';
  if fPagtoVendas = nil then
    Application.CreateForm(TfPagtoVendas, fPagtoVendas);
  TForm.Create(Self);
  fPagtoVendas.ledt_vlvenda.Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(SomenteNumero('Total: R$ .', lbl_total.Caption)));
  fPagtoVendas.ShowModal;

  // Se Venda tiver sido paga finaliza
  if VendaPaga then
  Begin
    Try
      With ClasseVendas Do
      Begin
        IdVenda := StrToInt(ledt_idvenda.Text);
        Empresa := EmpLog;
        UserCad := UserLog;
        UserAlt := UserLog;
        Funcionario := StrToInt(jvcedt_idvend.Text);

        if jvcedt_idclie.Text <> EmptyStr then
          Cliente := StrToInt(jvcedt_idclie.Text)
        else
          Cliente := 0;

        QtdeTotal := StrToInt(SomenteNumero('Qtde: ', lbl_qtde.Caption));
        TotalNota := StrToCurr(SomenteNumero('Total: R$ .', lbl_total.Caption));
        FormaPagto := condpagto;
        parcelas := parcelas;
        Estado := 'F';

        If Not InsereAlteraNotas then
          Exit;
      End;

      // Dando refresh para atualizar cond. pagto
      ListaCab();

      // Imprimindo Comprovante
      actImpComp.Execute;

      sbtnNovo.Enabled := True;
      sbtnPesquisar.Enabled := True;
      sbtnSair.Enabled := True;
      jvcedt_idclie.Enabled := True;
      sbtnNovo.Click;
    Except
      On E : Exception Do
        Begin
          MsgErro(E.Message);
        End;
    End;
  End;
end;

procedure TfVendas.sbtnPesquisarClick(Sender: TObject);
begin
  sbtnNovo.Click;

  nVenda := 0;
  OpenFormModal(TfPesquisaVendas, fPesquisaVendas);

  if nVenda > 0 then
  Begin
    ledt_idvenda.Text := FormatFloat('00000', nVenda);
    ListaCab();

    if fdmVendaCab.Fields[14].Value <> Null then
      jvcedt_idclie.Text := FormatFloat('0000000', fdmVendaCab.Fields[14].Value);

    jvcedt_idvend.Text := fdmVendaCab.Fields[12].Value;

    ListaItens();

    pnlDados.Enabled := False;
    jvcedt_idproduto.Enabled := False;
    jvsedt_qtde.Enabled := False;
    jvv_percdesc.Enabled := False;
    jvv_valdesc.Enabled := False;

    if fdmVendaCab.Fields[20].Value = 'Cancelada' then
      sbtnCancelar.Enabled := False
    else
      operacao := 'alterar';

    condpagto := fdmVendaCab.Fields[18].AsString;

    sbtnPagamento.Enabled := False;
    sbtnIncluir.Enabled   := False;

    lbl_qtde.Caption  := 'Qtde: ' + fdmVendaCab.Fields[16].AsString;
    lbl_total.Caption := 'Total: ' + FormatCurr('R$ ###,##0.00',
      fdmVendaCab.Fields[17].Value);

    // Habilitando menu impressão comprovante
    mnComprovante.Enabled := True;
  End;
end;

procedure TfVendas.sbtnRetirarClick(Sender: TObject);
begin
  CancelarItem;
end;

procedure TfVendas.sbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfVendas.SetaDescAcre;
begin
  if not desconto then
    begin
      Label4.Caption := '% Acre';
      Label5.Caption := 'R$ Acre';
    end
  else
    begin
      Label4.Caption := '% Desc';
      Label5.Caption := 'R$ Desc';
    end;
end;

end.
