unit model.cartoes;

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
  [Table('tbcartoes', '')]
  [PrimaryKey('idtbcartao', TAutoIncType.AutoInc,
                         TGeneratorType.NoneInc,
                         TSortingOrder.NoSort,
                         True, 'Chave primária')]
  [Sequence('tbcartoes')]
  [OrderBy('idtbcartao')]
  TCartoes = class
  private
    { Private declarations }

    Fidtbcartao: Integer;
    Fidtbempresa: Integer;
    Fdtemissao: nullable<TDateTime>;
    Fidcliente: nullable<Integer>;
    Fparcela: nullable<Integer>;
    Fparcelas: nullable<Integer>;
    Fdtvencimento: nullable<TDateTime>;
    Fvalor: Currency;
    Forigem: nullable<String>;
    Fdocumento: nullable<String>;
    Fdtconciliado: nullable<TDateTime>;
    Fdtcadastro: nullable<TDateTime>;
    Fusercad: Integer;
    Fdtalterado: nullable<TDateTime>;
    Fuseralt: Integer;
    Fcliente: String;
  public
    { Public declarations }

    [Column('idtbcartao', ftInteger)]
    [Dictionary('idtbcartao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbcartao: Integer read Fidtbcartao
      write Fidtbcartao;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbempresa', ftInteger)]
    [ForeignKey('fk_tbcartoes_tbempresas', 'idtbempresa', 'tbempresas',
      'idtbempresa', Cascade, Cascade)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbempresa: Integer read Fidtbempresa
      write Fidtbempresa;

    [Restrictions([TRestriction.NotNull])]
    [Column('dtemissao', ftDateTime)]
    [Dictionary('dtemissao', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtemissao: nullable<TDateTime> read Fdtemissao write Fdtemissao;

    [Column('idcliente', ftInteger)]
    [Dictionary('idcliente', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idcliente: nullable<Integer> read Fidcliente
      write Fidcliente;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('cliente', ftString, 60)]
    [JoinColumn('idcliente', 'tbclientes', 'idtbcliente', 'nome', TJoin.LeftJoin, 'cliente')]
    [Dictionary('Nome do Cliente', '')]
    property cliente: String read Fcliente write Fcliente;

    [Column('parcela', ftInteger)]
    [Dictionary('parcela', 'Mensagem de validação', '1', '', '',
      taCenter)]
    property parcela: nullable<Integer> read Fparcela
      write Fparcela;

    [Column('parcelas', ftInteger)]
    [Dictionary('parcelas', 'Mensagem de validação', '1', '', '',
      taCenter)]
    property parcelas: nullable<Integer> read Fparcelas
      write Fparcelas;

    [Restrictions([TRestriction.NotNull])]
    [Column('dtvencimento', ftDateTime)]
    [Dictionary('dtvencimento', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtvencimento: nullable<TDateTime> read Fdtvencimento write Fdtvencimento;

    [Column('valor', ftCurrency)]
    [Dictionary('valor', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property valor: Currency read Fvalor write Fvalor;

    [Column('origem', ftString, 1)]
    [Dictionary('origem', 'Mensagem de validação', 'D', '', '', taLeftJustify)]
    property origem: nullable<String> read Forigem write Forigem;

    [Column('documento', ftString, 30)]
    [Dictionary('documento', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property documento: nullable<String> read Fdocumento write Fdocumento;

    [Column('dtconciliado', ftDateTime)]
    [Dictionary('dtconciliado', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtconciliado: nullable<TDateTime> read Fdtconciliado write Fdtconciliado;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtcadastro', ftDateTime)]
    [Dictionary('dtcadastro', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtcadastro: nullable<TDateTime> read Fdtcadastro write Fdtcadastro;

    [Column('usercad', ftInteger)]
    [Dictionary('usercad', 'Mensagem de validação', '', '', '', taCenter)]
    property usercad: Integer read Fusercad write Fusercad;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtalterado', ftDateTime)]
    [Dictionary('dtalterado', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtalterado: nullable<TDateTime> read Fdtalterado write Fdtalterado;

    [Column('useralt', ftInteger)]
    [Dictionary('useralt', 'Mensagem de validação', '', '', '', taCenter)]
    property useralt: Integer read Fuseralt write Fuseralt;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TCartoes)

end.