unit uClasseReservas;

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

  TClasseReservas = class

  protected
    // Campos Tabela de Notas | * - Campos existentes em comum entre elas
    FReserva: Integer; { * }
    FEmpresa: Integer; { * }
    FEmissao: TDate; { * }
    FPdv: Integer; { * }
    FCliente: Integer;
    FQtdeTotal: Integer;
    FValorTotal: Currency;
    FCondPgto: String;
    FParcelas: Integer;
    FEstado: String;
    FRetirada: Boolean;
    FUserCad: Integer; { * }
    FUserAlt: Integer; { * }

    // Campos Tabela de Itens
    FItem: Integer;
    FProduto: Integer;
    FQtde: Integer;
    FVlTabela: Currency;
    FVlUnit: Currency;
    FVlDesc: Currency;
    FVlAcre: Currency;
    FVlTotal: Currency;
    FRetirado: Boolean;
    FDevolvido: Boolean;
    FCancelado: Boolean;

  private
    FControle: TControle;


  public
    constructor Create(pConexaoControle: TControle);
    constructor Campos;
    destructor Destroy; override;

    // Funções rotineiras
    function PegarRegistro(Pdv, Empresa: Integer): Integer;
    function ReservaNota(Empresa, Reserva, Pdv : Integer; Emissao : TDateTime) : TFDQuery; overload;
    function ReservaItem(Empresa, Reserva, Pdv : Integer; Emissao : TDateTime) : TFDQuery; overload;
    function ReservaNota(Reserva : String; DtEmissao: TDateTime) : TFDQuery; overload;
    function ReservaItem(Reserva : String; DtEmisao: TDateTime) : TFDQuery; overload;

    //
    property Reserva: Integer read FReserva write FReserva;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property Pdv: Integer read FPdv write FPdv;
    property Emissao: TDate read FEmissao write FEmissao;
    property Cliente: Integer read FCliente write FCliente;
    property QtdeTotal: Integer read FQtdeTotal write FQtdeTotal;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property CondPgto: String read FCondPgto write FCondPgto;
    property Parcelas: Integer read FParcelas write FParcelas;
    property Estado: String read FEstado write FEstado;
    property Retirada: Boolean read FRetirada write FRetirada;
    property UserCad: Integer read FUserCad write FUserCad;
    property UserAlt: Integer read FUserAlt write FUserAlt;

    //
    property Item: Integer read FItem write FItem;
    property Produto: Integer read FProduto write FProduto;
    property Qtde: Integer read FQtde write FQtde;
    property VlTabela: Currency read FVlTabela write FVlTabela;
    property VlUnit: Currency read FVlUnit write FVlUnit;
    property VlDesc: Currency read FVlDesc write FVlDesc;
    property VlAcre: Currency read FVlAcre write FVlAcre;
    property VlTotal: Currency read FVlTotal write FVlTotal;
    property Retirado: Boolean read FRetirado write FRetirado;
    property Devolvido: Boolean read FDevolvido write FDevolvido;
    property Cancelado: Boolean read FCancelado write FCancelado;

  end;

implementation

{ TClasseReservas }

constructor TClasseReservas.Campos;
begin

end;

constructor TClasseReservas.Create(pConexaoControle: TControle);
begin
  Campos; // Seta valores iniciais para os campos
  FControle := pConexaoControle;
end;

destructor TClasseReservas.Destroy;
begin
  { Comentando código para testar velocidade se manter conectado }
  // FControle.Conexao.ConexaoBanco.Close;
end;

function TClasseReservas.PegarRegistro(Pdv, Empresa: Integer): Integer;
var
  registro : Integer;
begin
  With FControle.SqlGeral Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT (:empresa*100000+((:pdv * 10000)+count(*)+1)) AS registro FROM tbreservasnota');
    SQL.Add('WHERE idtbempresa = :empresa AND pdv = :pdv');
    ParamByName('empresa').Value := Empresa;
    ParamByName('pdv').Value     := Pdv;
    Open;
//    if FieldByName('registro').Value = 0 then
//    registro := Terminal * 1000 + 1
//    else
    registro := FieldByName('registro').Value;
  End;
  Result := registro;
end;

function TClasseReservas.ReservaItem(Empresa, Reserva, Pdv : Integer; Emissao : TDateTime): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_reservasitem');
    SQL.Add('WHERE idtbempresa = :empresa AND idtbreservanota = :reserva AND pdv = :pdv AND date(dtemissao) = :emissao');
    SQL.Add('ORDER BY idtbempresa,idtbreservanota,item');
    ParamByName('empresa').Value := Empresa;
    ParamByName('reserva').Value := Reserva;
    ParamByName('pdv').Value     := Pdv;
    ParamByName('emissao').Value := Emissao;
    Open;
    End;
  Result := FControle.SqlGeral;
end;

function TClasseReservas.ReservaNota(Empresa, Reserva, Pdv : Integer; Emissao : TDateTime): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_reservasnota');
    SQL.Add('WHERE idtbempresa = :empresa AND idtbreserva = :reserva AND pdv = :pdv AND date(dtemissao) = :emissao');
    ParamByName('empresa').Value := Empresa;
    ParamByName('reserva').Value := Reserva;
    ParamByName('pdv').Value     := Pdv;
    ParamByName('emissao').Value := Emissao;
    Open;
    End;
  Result := FControle.SqlGeral;
end;

function TClasseReservas.ReservaItem(Reserva: String; DtEmisao: TDateTime): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_reservasitem');
    SQL.Add('WHERE idtbreservanota = ' + QuotedStr(Reserva));
    SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',DtEmisao)));
    SQL.Add('ORDER BY item');
    Open;
    End;
  Result := FControle.SqlGeral;
end;

function TClasseReservas.ReservaNota(Reserva: String; DtEmissao: TDateTime): TFDQuery;
begin
  With FControle.SqlGeral Do
    Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vw_reservasnota');
    SQL.Add('WHERE idtbreserva = ' + QuotedStr(Reserva));
    SQL.Add(' AND date(dtemissao) = '+QuotedStr(FormatDateTime('YYYY-mm-dd',DtEmissao)));
    Open;
    End;
  Result := FControle.SqlGeral;
end;

end.
