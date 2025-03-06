unit model.empresa;

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
  [Table('tbempresas', '')]
  [PrimaryKey('id_empresa', TAutoIncType.AutoInc, TGeneratorType.NoneInc,
    TSortingOrder.NoSort, True, 'Chave primária')]
  [Sequence('tbempresas')]
  [OrderBy('idtbempresa')]
  Tempresa = class
  private
    { Public declarations }
    Fdtcadastro: TDateTime;
    Fcnpj: nullable<String>;
    Ffantasia: nullable<String>;
    Finsc: nullable<String>;
    Fbairro: nullable<String>;
    Fuseralt: Integer;
    Fidtbempresa: Integer;
    Fuf: nullable<String>;
    Fcomp: nullable<String>;
    Fobsaluguel: nullable<String>;
    Fcep: nullable<String>;
    Fdtalterado: TDateTime;
    Ffone2: nullable<String>;
    Fusercad: Integer;
    Ffone1: nullable<String>;
    Fcidade: nullable<String>;
    Fendereco: nullable<String>;
    Fnro: nullable<String>;
    Frazao: nullable<String>;
  public
    { Public declarations }

    [Column('idtbempresa', ftInteger)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbempresa: Integer read Fidtbempresa
      write Fidtbempresa;

    [Column('razao', ftString, 60)]
    [Dictionary('razao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property razao: nullable<String> read Frazao write Frazao;

    [Column('fantasia', ftString, 50)]
    [Dictionary('fantasia', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fantasia: nullable<String> read Ffantasia write Ffantasia;

    [Column('endereco', ftString, 50)]
    [Dictionary('endereco', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property endereco: nullable<String> read Fendereco write Fendereco;

    [Column('nro', ftString, 5)]
    [Dictionary('nro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nro: nullable<String> read Fnro write Fnro;

    [Column('comp', ftString, 30)]
    [Dictionary('comp', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property comp: nullable<String> read Fcomp write Fcomp;

    [Column('bairro', ftString, 30)]
    [Dictionary('bairro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property bairro: nullable<String> read Fbairro write Fbairro;

    [Column('cidade', ftString, 30)]
    [Dictionary('cidade', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cidade: nullable<String> read Fcidade write Fcidade;

    [Column('cep', ftString, 8)]
    [Dictionary('cep', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cep: nullable<String> read Fcep write Fcep;

    [Column('uf', ftString, 2)]
    [Dictionary('uf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property uf: nullable<String> read Fuf write Fuf;

    [Column('cnpj', ftString, 18)]
    [Dictionary('cnpj', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cnpj: nullable<String> read Fcnpj write Fcnpj;

    [Column('insc', ftString, 20)]
    [Dictionary('insc', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property insc: nullable<String> read Finsc write Finsc;

    [Column('fone1', ftString, 15)]
    [Dictionary('fone1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone1: nullable<String> read Ffone1 write Ffone1;

    [Column('fone2', ftString, 15)]
    [Dictionary('fone2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone2: nullable<String> read Ffone2 write Ffone2;

    [Column('obsaluguel', ftString)]
    [Dictionary('obsaluguel', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property obsaluguel: nullable<String> read Fobsaluguel write Fobsaluguel;

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

TRegisterClass.RegisterEntity(Tempresa)

end.
