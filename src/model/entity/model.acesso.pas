unit model.acesso;

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
  [Table('tbacessos', '')]
  [PrimaryKey('idtbacesso', TAutoIncType.AutoInc,
                            TGeneratorType.NoneInc,
                            TSortingOrder.NoSort,
                            True, 'Chave primária')]
  [Sequence('tbacessos')]
  [OrderBy('idtbacesso')]
  TAcesso = class
  private
    { Private declarations }
    Fidtbacesso: nullable<Integer>;
    Fidusuario: Integer;
    Fidmenu: Integer;
    Facesso: nullable<Integer>;
  public
    { Public declarations }

    [Column('idtbacesso', ftInteger)]
    [Dictionary('idtbacesso', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbacesso: nullable<Integer> read Fidtbacesso write Fidtbacesso;

    [Restrictions([NotNull])]
    [Column('idusuario', ftInteger)]
    [ForeignKey('fk_tbacessos_tbusuarios', 'idusuario', 'tbusuarios',
      'idtbusuario', Cascade, Cascade)]
    [Dictionary('idusuario', 'Mensagem de validação', '', '', '', taCenter)]
    property idusuario: Integer read Fidusuario write Fidusuario;

    [Restrictions([NotNull])]
    [Column('idmenu', ftInteger)]
    [ForeignKey('fk_tbacessos_tbmenus', 'idmenu', 'tbmenus', 'idtbmenus',
      None, None)]
    [Dictionary('idmenu', 'Mensagem de validação', '', '', '', taCenter)]
    property idmenu: Integer read Fidmenu write Fidmenu;

    [Restrictions([NotNull])]
    [Column('acesso', ftInteger)]
    [Dictionary('acesso', 'Mensagem de validação', '0', '', '', taCenter)]
    property acesso: nullable<Integer> read Facesso write Facesso;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TAcesso)

end.
