unit model.carteiraDigital;

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
  [Table('tbcfgwalletsdigital', '')]
  [PrimaryKey('idtbwallet', TAutoIncType.AutoInc,
                             TGeneratorType.NoneInc,
                             TSortingOrder.NoSort,
                             True, 'Chave primária')]
  [Sequence('tbcfgwalletsdigital')]
  [OrderBy('idtbwallet')]
  TCarteiraDigital = class
  private
    { Private declatations }

    Fidtbwallet: Integer;
    Fdescricao: nullable<String>;
    Fdias_dep: Integer;
    Fimagem: TBlob;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
  public
    { Public declarations }

    [Column('idtbwallet', ftInteger)]
    [Dictionary('idtbwallet', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbwallet: Integer read Fidtbwallet
      write Fidtbwallet;

    [Column('descricao', ftString, 50)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: nullable<String> read Fdescricao write Fdescricao;

    [Restrictions([TRestriction.NotNull])]
    [Column('dias_dep', ftInteger)]
    [Dictionary('dias_dep', 'Mensagem de validação', '0', '', '', taCenter)]
    property dias_dep: Integer read Fdias_dep write Fdias_dep;

    [Column('imagem', ftBlob)]
    [Dictionary('imagem', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property imagem: TBlob read Fimagem write Fimagem;

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

TRegisterClass.RegisterEntity(TCarteiraDigital)

end.