unit model.menu;

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
  [Table('tbmenus', '')]
  [PrimaryKey('idtbmenu', TAutoIncType.AutoInc,
                         TGeneratorType.NoneInc,
                         TSortingOrder.NoSort,
                         True, 'Chave primária')]
  [Sequence('tbmenus')]
  [OrderBy('idtbmenu')]
  TMenu = class
  private
    { Private declarations }

    Fidtbmenu: nullable<Integer>;
    Fnome: String;
    Fmenu: String;
    Fform: String;
    Fordem: Integer;
  public
    { Public declarations }

    [Column('idtbmenu', ftInteger)]
    [Dictionary('idtbmenu', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbmenu: nullable<Integer> read Fidtbmenu
      write Fidtbmenu;

    [Restrictions([TRestriction.NotNull])]
    [Column('nome', ftString, 50)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read Fnome write Fnome;

    [Restrictions([TRestriction.NotNull])]
    [Column('menu', ftString, 50)]
    [Dictionary('menu', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property menu: String read Fmenu write Fmenu;

    [Restrictions([TRestriction.NotNull])]
    [Column('form', ftString, 50)]
    [Dictionary('form', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property form: String read Fform write Fform;

    [Restrictions([TRestriction.NotNull])]
    [Column('ordem', ftInteger)]
    [Dictionary('ordem', 'Mensagem de validação', '', '', '',
      taCenter)]
    property ordem: Integer read Fordem
      write Fordem;            
  end;

implementation

initialization
TRegisterClass.RegisterEntity(TMenu)

end.