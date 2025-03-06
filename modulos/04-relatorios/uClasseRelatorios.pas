unit uClasseRelatorios;

interface

uses

  System.SysUtils,
  System.Classes,

  Data.DB,

  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  uControle,
  uRotinas,
  uGlobal;


type
  TClasseRelatorios = class
    protected

    private
      FControle: TControle;

    public
      constructor Create(pConexaoControle: TControle);
      destructor Destroy; override;

    function VendasAtendente(DataIni, DataFim: TDateTime): TFDQuery;
    function VendaAnual: TFDQuery;
  end;

implementation

{ TClasseRelatorios }

constructor TClasseRelatorios.Create(pConexaoControle: TControle);
begin
  FControle := pConexaoControle;
end;

destructor TClasseRelatorios.Destroy;
begin
  inherited;
  FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseRelatorios.VendaAnual: TFDQuery;
var
  i     : Integer;
  grupo : String;
begin

  i := 12;

  With FControle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('IFNULL((SELECT SUM(totalLiquido) FROM vw_ordens_resumidas WHERE vw_ordens_resumidas.dtdocumento BETWEEN DATE_FORMAT(ADDDATE(DATE(NOW()), INTERVAL -12 MONTH),''%Y-%m-01'') AND LAST_DAY(DATE(NOW()))),0)  AS totalGeral,');
        while i >= 1 do
          begin
            SQL.Add('	(DATE_FORMAT(ADDDATE(DATE(NOW()), INTERVAL -'+i.ToString+' MONTH),''%m/%Y'')) AS mes'+i.ToString+',');
            SQL.Add('	IFNULL((SELECT SUM(totalLiquido) FROM vw_ordens_resumidas WHERE vw_ordens_resumidas.dtdocumento BETWEEN DATE_FORMAT(ADDDATE(DATE(NOW()), INTERVAL -'+i.ToString+' MONTH),''%Y-%m-01'') AND LAST_DAY(ADDDATE(DATE(NOW()), INTERVAL -'+i.ToString+' MONTH))),0)  AS totalMes'+i.ToString+',');

            Dec(i);
          end;
      SQL.Add('(DATE_FORMAT(DATE(NOW()),''%m/%Y'')) AS mesAtual,');
      SQL.Add('	IFNULL((SELECT SUM(totalLiquido) FROM vw_ordens_resumidas WHERE vw_ordens_resumidas.dtdocumento BETWEEN DATE_FORMAT(DATE(NOW()),''%Y-%m-01'') AND LAST_DAY(DATE(NOW()))),0)  AS totalMesAtual');
      SQL.Add('FROM vw_ordens_resumidas');
      SQL.Add('WHERE estado IN (''A'',''F'',''D'')');
      SQL.Add('GROUP BY');

      i := 12;
        while i >= 1 do
          begin
            grupo := grupo + 'mes'+i.ToString+',totalMes'+i.ToString+',';

            Dec(i);
          end;

      SQL.Add(grupo+'mesAtual,totalMesAtual');
      Open;
    End;

  Result := FControle.SqlGeral;
end;

function TClasseRelatorios.VendasAtendente(DataIni,
  DataFim: TDateTime): TFDQuery;
begin

  With FControle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('	funcionario,');
      SQL.Add('	COUNT(*) nro_ordens,');
      SQL.Add('	SUM(totalItens) totalItens,');
      SQL.Add('	SUM(totalLiquido) totalLiquido,');
      SQL.Add('	SUM(itensVendidos) itensVendidos,');
      SQL.Add('	SUM(totalVendido) totalVendido,');
      SQL.Add('	SUM(itensAlugados) itensAlugados,');
      SQL.Add('	SUM(totalAlugado) totalAlugado');
      SQL.Add('FROM vw_ordens_resumidas');
      SQL.Add('WHERE dtdocumento BETWEEN'+QuotedStr(FormatDateTime('YYYY-mm-dd', DataIni))+' AND '+QuotedStr(FormatDateTime('YYYY-mm-dd', DataFim)));
      SQL.Add('GROUP BY funcionario');
      SQL.Add('ORDER BY totalLiquido DESC,nro_ordens DESC,totalItens DESC');
      Open;
    End;

  Result := FControle.SqlGeral;
end;

end.
