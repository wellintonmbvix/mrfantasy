unit model.cliente;

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
  [Table('tbclientes', '')]
  [PrimaryKey('idtbcliente', TAutoIncType.AutoInc,
                             TGeneratorType.NoneInc,
                             TSortingOrder.NoSort,
                             True, 'Chave primária')]
  [Sequence('tbclientes')]
  [OrderBy('idtbcliente')]
  TCliente = class
  private
    { Public declarations }

    Fidtbcliente: Integer;
    Fidtbempresa: Integer;
    Fcpf_cnpj: String;
    Fnome: nullable<String>;
    Frg_insc: nullable<String>;
    Fendereco: nullable<String>;
    Fnro: nullable<String>;
    Fcomp: nullable<String>;
    Fbairro: nullable<String>;
    Fcidade: nullable<String>;
    Fcep: nullable<String>;
    Fuf: nullable<String>;
    Fdtnascimento: nullable<String>;
    Ffone1: nullable<String>;
    Ffone2: nullable<String>;
    Femail: nullable<String>;
    Fobs: nullable<String>;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
  public
    { Public declarations }

    [Column('idtbcliente', ftInteger)]
    [Dictionary('idtbcliente', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbcliente: Integer read Fidtbcliente
      write Fidtbcliente;

    [Restrictions([NotNull])]
    [Column('idtbempresa', ftInteger)]
    [ForeignKey('fk_tbclientes_tbemrpesa', 'idtbempresa', 'tbempresa',
      'idtbempresa', None, None)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbempresa: Integer read Fidtbempresa write Fidtbempresa;

    [Restrictions([NotNull])]
    [Column('cpf_cnpj', ftString, 18)]
    [Dictionary('cpf_cnpj', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cpf_cnpj: String read Fcpf_cnpj write Fcpf_cnpj;

    [Column('nome', ftString, 50)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: nullable<String> read Fnome write Fnome;

    [Column('rg_insc', ftString, 20)]
    [Dictionary('rg_insc', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property rg_insc: nullable<String> read Frg_insc write Frg_insc;

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

    [Column('dtnascimento', ftString, 10)]
    [Dictionary('dtnascimento', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property dtnascimento: nullable<String> read Fdtnascimento
      write Fdtnascimento;

    [Column('fone1', ftString, 15)]
    [Dictionary('fone1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone1: nullable<String> read Ffone1 write Ffone1;

    [Column('fone2', ftString, 15)]
    [Dictionary('fone2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone2: nullable<String> read Ffone2 write Ffone2;

    [Column('email', ftString, 120)]
    [Dictionary('email', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property email: nullable<String> read Femail write Femail;

    [Column('obs', ftString)]
    [Dictionary('obs', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property obs: nullable<String> read Fobs write Fobs;

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

TRegisterClass.RegisterEntity(TCliente)

end.
