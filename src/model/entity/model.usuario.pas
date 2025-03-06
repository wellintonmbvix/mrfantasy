unit model.usuario;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  uRotinas,

  model.acesso,

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
  [Table('tbusuarios', '')]
  [PrimaryKey('idtbusuario', TAutoIncType.AutoInc,
                             TGeneratorType.NoneInc,
                             TSortingOrder.NoSort,
                             True, 'Chave primária')]
  [Sequence('tbusuarios')]
  [OrderBy('idtbusuario')]
  Tusuario = class
  private
    { Private declarations }

    Fidtbusuario: Integer;
    Fusername: nullable<String>;
    Fpassword: nullable<String>;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
    Facesso: TObjectList<TAcesso>;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('idtbusuario', ftInteger)]
    [Dictionary('idtbusuario', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbusuario: Integer read Fidtbusuario
      write Fidtbusuario;

    [Restrictions([TRestriction.NotNull, TRestriction.Unique])]
    [Column('username', ftString, 20)]
    [Dictionary('username', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property username: nullable<String> read Fusername write Fusername;

    [Restrictions([TRestriction.NotNull])]
    [Column('password', ftString, 35)]
    [Dictionary('password', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property password: nullable<String> read Fpassword write Fpassword;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtcadastro', ftDateTime)]
    [Dictionary('dtcadastro', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtcadastro: TDateTime read Fdtcadastro write Fdtcadastro;

    [Restrictions([TRestriction.NoUpdate])]
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

    [Association(TMultiplicity.OneToMany, 'idtbusuario', 'tbacessos',
      'idusuario')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
      TCascadeAction.CascadeInsert, TCascadeAction.CascadeUpdate,
      TCascadeAction.CascadeDelete])]
    property acesso: TObjectList<TAcesso> read Facesso write Facesso;
  end;

implementation

{ TUsuario }

constructor Tusuario.Create;
begin
  Facesso := TObjectList<TAcesso>.Create;
end;

destructor Tusuario.Destroy;
begin
    Facesso.Free;
  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tusuario)

end.
