unit uClasseFantasias;

interface

uses

  System.SysUtils,
  System.Classes,

  Data.DB,

  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  uControle,
  uRotinas,
  uGlobal,
  JPeg;

type

  TClasseFantasias = class

  protected
    FFantasia: Integer;
    FNome: String;
    FDescricao: String;
    FFoto: TJpegImage;
    FVlCusto: Currency;
    FVlVenda: Currency;
    FVlAluguel: Currency;
    FTipo: Integer;
    FEstoque: Integer;
    FEstoqueMin: Integer;
    FAtivo: Boolean;
    FItemVenda: String;
    FUserCad: Integer;
    FUserAlt: Integer;

  private
    FControle: TFDConnection; //TControle;
    FQry     : TFDQuery;
  public
//    constructor Create(pConexaoControle: TControle);
    constructor Create(FConnection : TFDConnection);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function InsereFantasias: Boolean;
    function AlteraFantasias: Boolean;
    function ExcluiFantasias: Boolean;
    function Localiza(Campo, Valor, Registros, Inicial: String)
      : TClasseFantasias;
    function CarregaDados(Codigo: Integer): TClasseFantasias;
    function PegarRegistro: Integer;
    function ValidaCampos: Boolean;
    function HouveMovimento: Boolean;
    function Query(aQuery : TFDQuery): TClasseFantasias;

    //
    property Fantasia: Integer read FFantasia write FFantasia;
    property Nome: String read FNome write FNome;
    property Descricao: String read FDescricao write FDescricao;
    property Foto: TJpegImage read FFoto write FFoto;
    property VlCusto: Currency read FVlCusto write FVlCusto;
    property VlVenda: Currency read FVlVenda write FVlVenda;
    property VlAluguel: Currency read FVlAluguel write FVlAluguel;
    property Tipo: Integer read FTipo write FTipo;
    property Estoque: Integer read FEstoque write FEstoque;
    property EstoqueMin: Integer read FEstoqueMin write FEstoqueMin;
    property Ativo: Boolean read FAtivo write FAtivo;
    property ItemVenda: String read FItemVenda write FItemVenda;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;
  end;

implementation

{ TClasseFantasias }

function TClasseFantasias.AlteraFantasias: Boolean;
var
  Imagem: TJpegImage;
begin
  try
    Imagem := TJpegImage.Create;
    if FileExists('./img.jpg') then
      Imagem.LoadFromFile('./img.jpg');
    With FQry Do //With FControle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE tbprodutos SET');
      SQL.Add('nome = :nome,');
      SQL.Add('descricao = :descricao,');
      // Se houver imagem faça
      if Not Imagem.Empty then
        SQL.Add('foto = :foto,');
      SQL.Add('vlrcusto = :custo,');
      SQL.Add('vlrvenda = :venda,');
      SQL.Add('vlraluguel = :aluguel,');
      SQL.Add('tipo = :tipo,');
      SQL.Add('estoque = :estoque,');
      SQL.Add('estoquemin = :estoquemin,');
      SQL.Add('ativo = :ativo,');
      SQL.Add('itemvenda = :itemvenda,');
      SQL.Add('useralt = :useralt');
      SQL.Add('WHERE idtbproduto = :produto');
      ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
      ParamByName('descricao').Value := Self.FDescricao;
      // Se houver imagem faça
      if Not Imagem.Empty then
        ParamByName('foto').Assign(Imagem);
      ParamByName('custo').Value := Self.FVlCusto;
      ParamByName('venda').Value := Self.FVlVenda;
      ParamByName('aluguel').Value := Self.FVlAluguel;
      ParamByName('tipo').Value := Self.FTipo;
      ParamByName('estoque').Value := Self.FEstoque;
      ParamByName('estoquemin').Value := Self.FEstoqueMin;
      ParamByName('ativo').Value := Self.FAtivo;
      ParamByName('itemvenda').Value := Self.FItemVenda;
      ParamByName('useralt').Value := UserLog;
      ParamByName('produto').Value := Self.FFantasia;

      try
        ExecSQL;
        Result := True;
        MsgInformacao('Gravação realizada com sucesso');
      except
        On E: Exception Do
        Begin
          Result := False;
          MsgErro('Erro na gravação: ' + E.Message);
        End;
      end;

      // Incluindo o estoque do produto se o mesmo não existir
      Close;
      SQL.Clear;
      SQL.Add('REPLACE INTO tbestoque(');
      SQL.Add('idtbempresa,');
      SQL.Add('idtbproduto,');
      SQL.Add('qtde');
      SQL.Add(')VALUES(');
      SQL.Add(':idtbempresa,');
      SQL.Add(':produto,');
      SQL.Add(':qtde)');
      ParamByName('idtbempresa').Value := EmpLog;
      ParamByName('produto').Value := Self.FFantasia;
      ParamByName('qtde').Value := Self.FEstoque;
      ExecSQL;
    End;
  finally
    FreeAndNil(Imagem);
  end;
end;

constructor TClasseFantasias.Campos;
begin
  FFantasia := 0;
  FNome := '';
  FDescricao := '';
  FVlCusto := 0;
  FVlVenda := 0;
  FVlAluguel := 0;
  FTipo := 0;
  FEstoque := 0;
  FEstoqueMin := 0;
  FAtivo := True;
  FItemVenda := 'AM';
  FUserCad := UserLog;
  FUserAlt := UserLog;
end;

function TClasseFantasias.CarregaDados(Codigo: Integer): TClasseFantasias;
begin
  Result := Self;
   With FQry Do //With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *,(select ifnull(sum(qtde),0) from tbestoque a where vwp.idtbproduto=a.idtbproduto and a.idtbempresa=:empresa) as stock FROM vw_produtos vwp');
    SQL.Add('WHERE vwp.idtbproduto = :produto');
    ParamByName('produto').Value := Codigo;
    ParamByName('empresa').Value := EmpLog;
    Open;
    if IsEmpty then
    Begin
      Self.FFantasia := 0;
      Self.FNome     := 'INEXISTENTE';
    End
    else
    Begin
      Self.FFantasia := FieldByName('idtbproduto').Value;
      Self.FNome := FieldByName('nome').AsString;
      Self.FDescricao := FieldByName('descricao').AsString;
      Self.FVlCusto := FieldByName('vlrcusto').Value;
      Self.FVlVenda := FieldByName('vlrvenda').Value;
      Self.FVlAluguel := FieldByName('vlraluguel').Value;
      Self.FTipo := FieldByName('idtipo').Value;
      Self.FEstoque := FieldByName('stock').Value;
      Self.FEstoqueMin := FieldByName('estoquemin').Value;
      Self.FAtivo := FieldByName('ativo').AsBoolean;
      Self.FItemVenda := FieldByName('itemvenda').AsString;
      Self.FUserCad := FieldByName('usercad').Value;
      Self.FUserAlt := FieldByName('useralt').Value;
    End;
  End;
end;

constructor TClasseFantasias.Create(FConnection : TFDConnection);
begin
  Campos; // Seta valores iniciais para os campos
  FControle       := FConnection;
  FQry            := TFDQuery.Create(nil);
  FQry.Connection := FControle;
end;

destructor TClasseFantasias.Destroy;
begin
  FreeAndNil(FQry);
//  FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseFantasias.ExcluiFantasias: Boolean;
begin
  // Carregando dados para testar estoque e movimento
  CarregaDados(Fantasia);
  if Estoque > 0 then
  Begin
    MsgAviso('Exclusão não permitida por ainda possuir estoque.');
    Abort;
  End;
  if HouveMovimento then
  Begin
    MsgAviso('Exclusão não permitida por já ter sido movimentada');
    Abort;
  End;

  With FQry Do //With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbprodutos');
    SQL.Add('WHERE idtbproduto = :produto');
    ParamByName('produto').Value := Self.FFantasia;

    try
      ExecSQL;
      Result := True;
    except
      On E: Exception Do
      Begin
        Result := False;
        MsgErro('Erro na gravação: ' + E.Message);
      End;
    end;
  End;
end;

function TClasseFantasias.HouveMovimento: Boolean;
begin
  With FQry Do // With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS registros FROM tbvendasitem');
    SQL.Add('WHERE idtbproduto = :produto');
    ParamByName('produto').Value := Self.FFantasia;
    Open;
    if FieldByName('registros').Value = 0 then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS registros FROM tbreservasitem');
      SQL.Add('WHERE idtbproduto = :produto');
      ParamByName('produto').Value := Self.FFantasia;
      Open;
      if FieldByName('registros').Value = 0 then
        Result := False
      Else
        Result := True;
    End
    Else
    Begin
      Result := True;
    End;
  End;
end;

function TClasseFantasias.InsereFantasias: Boolean;
var
  Imagem: TJpegImage;
begin
  Try
    Imagem := TJpegImage.Create;
    if FileExists('./img.jpg') then
      Imagem.LoadFromFile('./img.jpg');

    With FQry Do //With FControle.SqlGeral Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO tbprodutos(');
      SQL.Add('nome,');
      SQL.Add('descricao,');
      // Se houver imagem faça
      if Not Imagem.Empty then
        SQL.Add('foto,');
      SQL.Add('vlrcusto,');
      SQL.Add('vlrvenda,');
      SQL.Add('vlraluguel,');
      SQL.Add('tipo,');
      SQL.Add('estoque,');
      SQL.Add('estoquemin,');
      SQL.Add('ativo,');
      SQL.Add('itemvenda,');
      SQL.Add('usercad,');
      SQL.Add('useralt');
      SQL.Add(')VALUES(');
      SQL.Add(':nome,');
      SQL.Add(':descricao,');
      // Se houver imagem faça
      if Not Imagem.Empty then
        SQL.Add(':foto,');
      SQL.Add(':custo,');
      SQL.Add(':venda,');
      SQL.Add(':aluguel,');
      SQL.Add(':tipo,');
      SQL.Add(':estoque,');
      SQL.Add(':estoquemin,');
      SQL.Add(':ativo,');
      SQL.Add(':itemvenda,');
      SQL.Add(':usercad,');
      SQL.Add(':useralt)');
      ParamByName('nome').Value := AnsiUpperCase(Self.FNome);
      ParamByName('descricao').Value := Self.FDescricao;
      // Se houver imagem faça
      if Not Imagem.Empty then
        ParamByName('foto').Assign(Imagem);
      ParamByName('custo').Value := Self.FVlCusto;
      ParamByName('venda').Value := Self.FVlVenda;
      ParamByName('aluguel').Value := Self.FVlAluguel;
      ParamByName('tipo').Value := Self.FTipo;
      ParamByName('estoque').Value := Self.FEstoque;
      ParamByName('estoquemin').Value := Self.FEstoqueMin;
      ParamByName('ativo').Value := Self.FAtivo;
      ParamByName('itemvenda').Value := Self.FItemVenda;
      ParamByName('usercad').Value := UserLog;
      ParamByName('useralt').Value := UserLog;

      try
        ExecSQL;
        Result := True;
        MsgInformacao('Gravação realizada com sucesso');
      except
        On E: Exception Do
        Begin
          Result := False;
          MsgErro('Erro na gravação: ' + E.Message);
        End;
      end;

      // Incluindo o estoque do produto se o mesmo não existir
      Close;
      SQL.Clear;
      SQL.Add('REPLACE INTO tbestoque(');
      SQL.Add('idtbempresa,');
      SQL.Add('idtbproduto,');
      SQL.Add('qtde');
      SQL.Add(')VALUES(');
      SQL.Add(':idtbempresa,');
      SQL.Add('(SELECT LAST_INSERT_ID()),');
      SQL.Add(':qtde)');
      ParamByName('idtbempresa').Value := EmpLog;
      ParamByName('qtde').Value := Self.FEstoque;
      ExecSQL;
    End;
  Finally
    FreeAndNil(Imagem);
  End;
end;

function TClasseFantasias.Localiza(Campo, Valor, Registros, Inicial: String)
  : TClasseFantasias;
begin
  Result := Self;
  With FQry Do //With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *,(select qtde from tbestoque a where vw_produtos.idtbproduto=a.idtbproduto and a.idtbempresa=:empresa) as stock FROM vw_produtos');
    SQL.Add('WHERE ' + Campo + ' LIKE ' + QuotedStr(Valor + '%'));
    SQL.Add(' LIMIT ' + Registros + ' OFFSET ' + Inicial);
    ParamByName('empresa').Value := EmpLog;
    Open;
    TNumericField(FieldByName('idtbproduto')).DisplayFormat := '00000';
    TNumericField(FieldByName('idtbproduto')).Alignment := taCenter;
  End;
end;

function TClasseFantasias.PegarRegistro: Integer;
begin
  With FQry Do //With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT IFNULL(MAX(idtbproduto),0) AS registro FROM tbprodutos');
    Open;
    Result := FieldByName('registro').Value + 1;
  End;
end;

function TClasseFantasias.Query(aQuery: TFDQuery): TClasseFantasias;
begin
  Result := Self;
  FQry   := aQuery;
end;

function TClasseFantasias.ValidaCampos: Boolean;
begin
  if Trim(Self.FNome) = EmptyStr then
  Begin
    MsgAviso('Nome da Fantasia não preenchida');
    Abort;
  End;

  if Self.FVlCusto = 0 then
  Begin
    MsgAviso('Valor de Custo não preenchido');
    Abort;
  End;

  if Self.FVlVenda = 0 then
  Begin
    MsgAviso('Valor de Venda não preenchida');
    Abort;
  End;

  if Self.FVlAluguel = 0 then
  Begin
    MsgAviso('Valor de Aluguel não preenchido');
    Abort;
  End;

  Result := True;
end;

end.
