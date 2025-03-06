unit model.produto;

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
  TEnumTipoProduto = (tp0, tp1, tp2, tp3, tp4, tp5, tp6);

  [Entity]
  [Table('tbprodutos', '')]
  [PrimaryKey('idtbproduto', TAutoIncType.AutoInc,
                             TGeneratorType.NoneInc,
                             TSortingOrder.NoSort,
                             True, 'Chave primária')]
  [Sequence('tbprodutos')]
  [OrderBy('idtbproduto')]
  TProduto = class
  private
    { Private declarations }

    Fidtbproduto: Integer;
    Fnome: nullable<String>;
    Fdescricao: nullable<String>;
    Ffoto: TBlob;
    Fvlrcusto: nullable<Currency>;
    Fvlrvenda: nullable<Currency>;
    Fvlraluguel: nullable<Currency>;
    Ftipo: TEnumTipoProduto;
    Festoque: nullable<Integer>;
    Festoquemin: nullable<Integer>;
    Fativo: Boolean;
    Fitemvenda: nullable<String>;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
  public
    { Public declarations }

    [Column('idtbproduto', ftInteger)]
    [Dictionary('idtbproduto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbproduto: Integer read Fidtbproduto
      write Fidtbproduto;

    [Column('nome', ftString)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: nullable<String> read Fnome write Fnome;

    [Column('descricao', ftString)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property descricao: nullable<String> read Fdescricao write Fdescricao;

    [Column('foto', ftBlob)]
    [Dictionary('foto', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property foto: TBlob read Ffoto write Ffoto;

    [Column('vlrcusto', ftCurrency)]
    [Dictionary('vlrcusto', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property vlrcusto: nullable<Currency> read Fvlrcusto write Fvlrcusto;

    [Column('vlrvenda', ftCurrency)]
    [Dictionary('vlrvenda', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property vlrvenda: nullable<Currency> read Fvlrvenda write Fvlrvenda;

    [Restrictions([TRestriction.NotNull])]
    [Column('vlraluguel', ftCurrency)]
    [Dictionary('vlraluguel', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property vlraluguel: nullable<Currency> read Fvlraluguel write Fvlraluguel;

    [Restrictions([TRestriction.NotNull])]
    [Column('tipo', ftString)]
    [Dictionary('tipo', 'Mensagem de validação', '', '', '', taCenter)]
    [Enumeration(TEnumType.etInteger,'0, 1, 2, 3, 4, 5, 6')]
    property tipo: TEnumTipoProduto read Ftipo write Ftipo;

    [Restrictions([TRestriction.NotNull])]
    [Column('estoque', ftInteger)]
    [Dictionary('estoque', 'Mensagem de validação', '', '', '', taCenter)]
    property estoque: nullable<Integer> read Festoque write Festoque;

    [Restrictions([TRestriction.NotNull])]
    [Column('estoquemin', ftInteger)]
    [Dictionary('estoquemin', 'Mensagem de validação', '', '', '', taCenter)]
    property estoquemin: nullable<Integer> read Festoquemin write Festoquemin;

    [Restrictions([TRestriction.NotNull])]
    [Column('ativo', ftBoolean)]
    [Dictionary('ativo', 'Mensagem de validação', '', '', '', taCenter)]
    property ativo: Boolean read Fativo write Fativo;

    [Restrictions([TRestriction.NotNull])]
    [Column('itemvenda', ftString)]
    [Dictionary('itemvenda', 'Mensagem de validação', '', '', '', taCenter)]
    property itemvenda: nullable<String> read Fitemvenda write Fitemvenda;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtcadastro', ftDateTime)]
    [Dictionary('dtcadastro', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtcadastro: TDateTime read Fdtcadastro write Fdtcadastro;

    [Column('usercad', ftInteger)]
    [Dictionary('usercad', 'Mensagem de validação', '', '', '', taCenter)]
    property usercad: Integer read Fusercad write Fusercad;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtalterado', ftDateTime)]
    [Dictionary('dtalterado', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtalterado: TDateTime read Fdtalterado write Fdtalterado;

    [Column('useralt', ftInteger)]
    [Dictionary('useralt', 'Mensagem de validação', '', '', '', taCenter)]
    property useralt: Integer read Fuseralt write Fuseralt;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TProduto)

end.
