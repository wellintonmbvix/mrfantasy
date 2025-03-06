unit uPesquisaFantasias;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
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

  uControle,
  uRotinas,
  uGlobal,
  uClasseFantasias,
  uPesquisaPadrao,
  Data.DB,
  FireDAC.Comp.Client,

  JvExDBGrids,
  JvDBGrid,

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
  TfPesquisaFantasias = class(TfPesquisaPadrao)
    dsFantasias: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure jvdb_dadosDblClick(Sender: TObject);
    procedure sbtn_anteriorClick(Sender: TObject);
    procedure sbtn_proximoClick(Sender: TObject);
    procedure cbox_registrosChange(Sender: TObject);
    procedure ledt_valorEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ledt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisaFantasias: TfPesquisaFantasias;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;
  vControle : TControle;
  vQry      : TFDQuery;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfPesquisaFantasias.cbox_registrosChange(Sender: TObject);
begin
  inherited;
  dsFantasias.Enabled := False;
end;

procedure TfPesquisaFantasias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fPesquisaFantasias := Nil;
end;

procedure TfPesquisaFantasias.FormCreate(Sender: TObject);
begin
  inherited;
  vControle           := TControle.Create;
  vQry                := TFDQuery.Create(Self);
  vQry.Connection     := vControle.Conexao.GetConexao;
  dsFantasias.DataSet := vQry;
end;

procedure TfPesquisaFantasias.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vQry);
  FreeAndNil(vControle);
end;

procedure TfPesquisaFantasias.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    fPesquisaFantasias.Close;
end;

procedure TfPesquisaFantasias.jvdb_dadosDblClick(Sender: TObject);
begin
  inherited;
  if vQry.RecordCount > 0 then
    nProduto := vQry.FieldByName
      ('idtbproduto').Value
  else
    nProduto := 0;
  Self.Close;
end;

procedure TfPesquisaFantasias.ledt_valorEnter(Sender: TObject);
begin
  inherited;
  dsFantasias.Enabled := False;
end;

procedure TfPesquisaFantasias.ledt_valorKeyPress(Sender: TObject;
  var Key: Char);
var
  campo: String;
begin
  inherited;
  if key = #13 then
    begin
      Try
        case cbox_campo.ItemIndex of
          0:
            campo := 'idtbproduto';
          1:
            campo := 'nome';
          2:
            campo := 'descricao';
        end;
        With vQry Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS registros FROM tbprodutos');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(ledt_valor.Text + '%'));
          Open;
          totalrg := FieldByName('registros').Value;
          totalpg := Ceil(FieldByName('registros').Value /
            StrToInt(cbox_registros.Text));
          currentrg := 0;
          currentpg := 1;
          direcao := 'Proximo';

          dsFantasias.Enabled := True;
          sbtn_anterior.Enabled := False;
          sbtn_proximo.Enabled := False;

          Close;
          SQL.Clear;
          SQL.Add('SELECT a.idtbproduto,a.nome,a.descricao,a.vlrcusto,a.vlrvenda,a.vlraluguel,');
          SQL.Add('(case a.tipo when 0 then "Fantasia Masculina" when 1 then "Fantasia Feminina"');
          SQL.Add(' when 2 then "Fantasia Infantil" when 3 then "Mascaras" when 4 then "Perucas" when 5');
          SQL.Add(' then "Acessórios" else "Mágica e Outros" end) AS tipo,');
          SQL.Add('ifnull((select qtde from tbestoque b where a.idtbproduto=b.idtbproduto and b.idtbempresa=:empresa),0) as stock,a.estoquemin,');
          SQL.Add('(case a.ativo when 0 then "Não" else "Sim" end) AS ativo,');
          SQL.Add('a.itemvenda,a.dtcadastro,a.usercad,a.dtalterado,a.useralt');
          SQL.Add('from tbprodutos a');
          SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(ledt_valor.Text + '%'));
          SQL.Add('ORDER BY idtbproduto');
          SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
          ParamByName('empresa').Value := EmpLog;
          Open;
          FetchAll;
          if IsEmpty then
          Begin
            MsgInformacao('Não existem dados para exibir');
            Exit;
          End;

          TNumericField(FieldByName('idtbproduto')).DisplayFormat := '00000';
          TNumericField(FieldByName('idtbproduto')).Alignment := taCenter;

          if totalrg > StrToInt(cbox_registros.Text) then
          Begin
            sbtn_anterior.Enabled := False;
            sbtn_proximo.Enabled := True;
          End;
        End;
      Except
        On E: Exception Do
        Begin
          MsgErro('Erro de rotina' + #13 + E.Message);
        End;
      End;
    end;
end;

procedure TfPesquisaFantasias.sbtn_anteriorClick(Sender: TObject);
var
  campo: String;
begin
  inherited;
  currentrg := currentrg - StrToInt(cbox_registros.Text);
  currentpg := currentpg - 1;
  direcao := 'Anterior';

  case cbox_campo.ItemIndex of
    0:
      campo := 'idtbproduto';
    1:
      campo := 'nome';
    2:
      campo := 'descricao';
  end;
  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.idtbproduto,a.nome,a.descricao,a.vlrcusto,a.vlrvenda,a.vlraluguel,');
    SQL.Add('(case a.tipo when 0 then "Fantasia Masculina" when 1 then "Fantasia Feminina"');
    SQL.Add(' when 2 then "Fantasia Infantil" when 3 then "Mascaras" when 4 then "Perucas" when 5');
    SQL.Add(' then "Acessórios" else "Mágica e Outros" end) AS tipo,');
    SQL.Add('ifnull((select qtde from tbestoque b where a.idtbproduto=b.idtbproduto and b.idtbempresa=:empresa),0) as stock,a.estoquemin,');
    SQL.Add('(case a.ativo when 0 then "Não" else "Sim" end) AS ativo,');
    SQL.Add('a.itemvenda,a.dtcadastro,a.usercad,a.dtalterado,a.useralt');
    SQL.Add('from tbprodutos a');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(ledt_valor.Text + '%'));
    SQL.Add('ORDER BY idtbproduto');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbproduto')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbproduto')).Alignment := taCenter;

    if currentpg = 1 then
      sbtn_anterior.Enabled := False;

    if Not sbtn_proximo.Enabled then
      sbtn_proximo.Enabled := True;
  End;
end;

procedure TfPesquisaFantasias.sbtn_proximoClick(Sender: TObject);
var
  campo : String;
begin
  inherited;
  currentrg := currentrg + StrToInt(cbox_registros.Text);
  currentpg := currentpg + 1;
  direcao := 'Proximo';

  case cbox_campo.ItemIndex of
    0:
      campo := 'idtbproduto';
    1:
      campo := 'nome';
    2:
      campo := 'descricao';
  end;
  With vQry Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.idtbproduto,a.nome,a.descricao,a.vlrcusto,a.vlrvenda,a.vlraluguel,');
    SQL.Add('(case a.tipo when 0 then "Fantasia Masculina" when 1 then "Fantasia Feminina"');
    SQL.Add(' when 2 then "Fantasia Infantil" when 3 then "Mascaras" when 4 then "Perucas" when 5');
    SQL.Add(' then "Acessórios" else "Mágica e Outros" end) AS tipo,');
    SQL.Add('ifnull((select qtde from tbestoque b where a.idtbproduto=b.idtbproduto and b.idtbempresa=:empresa),0) as stock,a.estoquemin,');
    SQL.Add('(case a.ativo when 0 then "Não" else "Sim" end) AS ativo,');
    SQL.Add('a.itemvenda,a.dtcadastro,a.usercad,a.dtalterado,a.useralt');
    SQL.Add('from tbprodutos a');
    SQL.Add('WHERE ' + campo + ' LIKE ' + QuotedStr(ledt_valor.Text + '%'));
    SQL.Add('ORDER BY idtbproduto');
    SQL.Add('LIMIT ' + IntToStr(currentrg) + ',' + cbox_registros.Text);
    ParamByName('empresa').Value := EmpLog;
    Open;

    TNumericField(FieldByName('idtbproduto')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbproduto')).Alignment := taCenter;

    if currentpg >= totalpg then
      sbtn_proximo.Enabled := False;

    if Not sbtn_anterior.Enabled then
      sbtn_anterior.Enabled := True;
  End;
end;

end.
