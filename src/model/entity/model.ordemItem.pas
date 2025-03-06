unit model.ordemItem;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  // ormbr
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes; 

type
  [Entity]
  [Table('tbordens_itens', '')]
  [PrimaryKey('idtbordens_itens', TAutoIncType.AutoInc,
                                  TGeneratorType.Guid36Inc,
                                  TSortingOrder.NoSort,
                                  True, 'Chave primária')]
  [Sequence('tbordens_itens')]
  [OrderBy('idtbordens_itens')]
  TOrdemDetail = class
  private
    { Private declarations }

    Fidtbordens_itens: String;
    Fidtbordens_cab: String;
    Fidtbproduto: Integer;
    Fitem: nullable<Integer>;
    Fqtde: nullable<Currency>;
    FprecoTabela: nullable<Currency>;
    FvalorUnitario: nullable<Currency>;
    FpercDesconto: nullable<Currency>;
    FvalorDesconto: nullable<Currency>;
    FpercAcrescimo: nullable<Currency>;
    FvalorAcrescimo: nullable<Currency>;
    FtotalBruto: nullable<Currency>;
    FtotalLiquido: nullable<Currency>;
    Fvenda: nullable<String>;
    Fdtretirada: nullable<TDateTime>;
    Fretirado: nullable<String>;
    Fdevolvido: nullable<String>;
    Fcancelado: nullable<String>;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
    Fproduto: String;
  public
    { Public declarations }

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbordens_itens', ftString)]
    [Dictionary('idtbordens_itens', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbordens_itens: String read Fidtbordens_itens
      write Fidtbordens_itens;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbordens_cab', ftString)]
    [ForeignKey('fk_tbordens_itens_tbordens_cab', 'idtbordens_cab', 'tbordens_cab',
      'idtbordens_cab', Cascade, Cascade)]      
    [Dictionary('idtbordens_cab', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbordens_cab: String read Fidtbordens_cab
      write Fidtbordens_cab;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbproduto', ftInteger)]
    [ForeignKey('fk_tbordens_itens_tbprodutos', 'idtbproduto', 'tbprodutos',
      'idtbproduto', Cascade, Cascade)]      
    [Dictionary('idtbproduto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbproduto: Integer read Fidtbproduto
      write Fidtbproduto;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('produto', ftString, 60)]
    [JoinColumn('idtbproduto', 'tbprodutos', 'idtbproduto', 'nome', TJoin.InnerJoin, 'produto')]
    [Dictionary('produto', '')]
    property produto: String read Fproduto write Fproduto;

    [Column('item', ftInteger)]   
    [Dictionary('item', 'Mensagem de validação', '1', '', '',
      taCenter)]
    property item: nullable<Integer> read Fitem write Fitem;

    [Column('qtde', ftCurrency)]   
    [Dictionary('qtde', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property qtde: nullable<Currency> read Fqtde write Fqtde;

    [Column('precoTabela', ftCurrency)]
    [Dictionary('precoTabela', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property precoTabela: nullable<Currency> read FprecoTabela write FprecoTabela;

    [Column('valorUnitario', ftCurrency)]
    [Dictionary('valorUnitario', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property valorUnitario: nullable<Currency> read FvalorUnitario write FvalorUnitario;

    [Column('percDesconto', ftCurrency)]
    [Dictionary('percDesconto', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property percDesconto: nullable<Currency> read FpercDesconto write FpercDesconto;

    [Column('valorDesconto', ftCurrency)]
    [Dictionary('valorDesconto', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property valorDesconto: nullable<Currency> read FvalorDesconto write FvalorDesconto;

    [Column('percAcrescimo', ftCurrency)]
    [Dictionary('percAcrescimo', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property percAcrescimo: nullable<Currency> read FpercAcrescimo write FpercAcrescimo;

    [Column('valorAcrescimo', ftCurrency)]
    [Dictionary('valorAcrescimo', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property valorAcrescimo: nullable<Currency> read FvalorAcrescimo write FvalorAcrescimo;

    [Column('totalBruto', ftCurrency)]
    [Dictionary('totalBruto', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property totalBruto: nullable<Currency> read FtotalBruto write FtotalBruto;

    [Column('totalLiquido', ftCurrency)]
    [Dictionary('totalLiquido', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property totalLiquido: nullable<Currency> read FtotalLiquido write FtotalLiquido;

    [Column('venda', ftString)]
    [Dictionary('venda', 'Mensagem de validação', 'false', '', '', taCenter)]
    property venda: nullable<String> read Fvenda write Fvenda;

    [Column('dtretirada', ftDateTime)]
    [Dictionary('dtretirada', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtretirada: nullable<TDateTime> read Fdtretirada write Fdtretirada;

    [Column('retirado', ftString)]
    [Dictionary('retirado', 'Mensagem de validação', 'false', '', '', taCenter)]
    property retirado: nullable<String> read Fretirado write Fretirado;

    [Column('devolvido', ftString)]
    [Dictionary('devolvido', 'Mensagem de validação', 'false', '', '', taCenter)]
    property devolvido: nullable<String> read Fdevolvido write Fdevolvido;

    [Column('cancelado', ftBoolean)]
    [Dictionary('cancelado', 'Mensagem de validação', 'false', '', '', taCenter)]
    property cancelado: nullable<String> read Fcancelado write Fcancelado;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtalterado', ftDateTime)]
    [Dictionary('dtalterado', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtalterado: TDateTime read Fdtalterado write Fdtalterado;

    [Column('useralt', ftInteger)]
    [Dictionary('useralt', 'Mensagem de validação', '', '', '',
      taCenter)]
    property useralt: Integer read Fuseralt write Fuseralt;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TOrdemDetail)

end.