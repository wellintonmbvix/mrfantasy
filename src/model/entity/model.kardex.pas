unit model.kardex;

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
  [Table('tbkardex', '')]
  [PrimaryKey('idtbkardex', TAutoIncType.AutoInc,
                         TGeneratorType.NoneInc,
                         TSortingOrder.NoSort,
                         True, 'Chave primária')]
  [Sequence('tbkardex')]
  [OrderBy('idtbkardex')]
  TKardex = class
  private
    { Private declarations }

    Fidtbkardex: nullable<Integer>;
    Fidtbempresa: Integer;
    Fdtmovimento: TDateTime;
    Fdocumento: String;
    Fidtbproduto: Integer;
    Ftipo: Integer;
    Fqtde: Integer;
    Fusercad: Integer;
  public
    { Public declarations }

    [Column('idtbkardex', ftInteger)]
    [Dictionary('idtbkardex', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbkardex: nullable<Integer> read Fidtbkardex
      write Fidtbkardex;

    [Column('idtbempresa', ftInteger)]
    [ForeignKey('fk_tbkardex_tbempresas', 'idtbempresa', 'tbempresas',
      'idtbempresa', Cascade, Cascade)]      
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbempresa: Integer read Fidtbempresa
      write Fidtbempresa;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtmovimento', ftDateTime)]
    [Dictionary('dtmovimento', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtmovimento: TDateTime read Fdtmovimento write Fdtmovimento;

    [Restrictions([TRestriction.NotNull])]
    [Column('documento', ftString, 50)]
    [Dictionary('documento', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property documento: String read Fdocumento write Fdocumento;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbproduto', ftInteger)]
    [ForeignKey('fk_tbkardex_tbprodutos', 'idtbproduto', 'tbprodutos',
      'idtbproduto', Cascade, Cascade)]      
    [Dictionary('idtbproduto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbproduto: Integer read Fidtbproduto
      write Fidtbproduto;

    [Restrictions([TRestriction.NotNull])]
    [Column('tipo', ftInteger)]
    [Dictionary('tipo', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property tipo: Integer read Ftipo
      write Ftipo;

    [Restrictions([TRestriction.NotNull])]
    [Column('qtde', ftInteger)]
    [Dictionary('qtde', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property qtde: Integer read Fqtde
      write Fqtde;

    [Restrictions([TRestriction.NotNull])]
    [Column('usercad', ftInteger)]
    [Dictionary('usercad', 'Mensagem de validação', '', '', '',
      taCenter)]
    property usercad: Integer read Fusercad
      write Fusercad;      
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TKardex)

end.