unit model.estoque;

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
  [Table('tbestoque', '')]
  [PrimaryKey('idtbempresa;idtbproduto;', TAutoIncType.NotInc,
                         TGeneratorType.NoneInc,
                         TSortingOrder.NoSort,
                         True, 'Chave primária')]
  [Sequence('tbestoque')]
  [OrderBy('idtbempresa;idtbproduto;')]
  TEstoque = class
  private
    { Private declarations }

    Fidtbempresa: Integer;
    Fidtbproduto: Integer;
    Fqtde: Integer;
  public
    { Public declarations }

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbempresa', ftInteger)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbempresa: Integer read Fidtbempresa
      write Fidtbempresa;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbproduto', ftInteger)]
    [Dictionary('idtbproduto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbproduto: Integer read Fidtbproduto
      write Fidtbproduto;

    [Dictionary('qtde', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property qtde: Integer read Fqtde
      write Fqtde;        
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TEstoque)

end.