unit model.funcionario;

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
  [Table('tbfuncionarios', '')]
  [PrimaryKey('idtbfuncionario', TAutoIncType.AutoInc,
                                 TGeneratorType.NoneInc,
                                 TSortingOrder.NoSort,
                                 True, 'Chave primária')]
  [Sequence('tbfuncionarios')]
  [OrderBy('idtbfuncionario')]
  TFuncionario = class
  private
    { Public declarations }

    Fidtbfuncionario: Integer;
    Fcodigo: Integer;
    Fnome: nullable<String>;
    Fabreviatura: nullable<String>;
    Fendereco: nullable<String>;
    Fnro: nullable<String>;
    Fcomp: nullable<String>;
    Fbairro: nullable<String>;
    Fcidade: nullable<String>;
    Fcep: nullable<String>;
    Fuf: nullable<String>;
    Fcpf: nullable<String>;
    Frg: nullable<String>;
    Ffone1: nullable<String>;
    Ffone2: nullable<String>;
    Fdtadmissao: nullable<String>;
    Ffuncao: nullable<String>;
    Fdtdemissao: nullable<String>;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
  public
    { Public declarations }

    [Column('idtbfuncionario', ftInteger)]
    [Dictionary('idtbfuncionario', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property idtbfuncionario: Integer read Fidtbfuncionario
      write Fidtbfuncionario;

    [Column('codigo', ftInteger)]
    [Dictionary('codigo', 'Mensagem de validação', '0', '', '', taCenter)]
    property codigo: Integer read Fcodigo write Fcodigo;

    [Column('nome', ftString, 50)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: nullable<String> read Fnome write Fnome;

    [Column('abreviatura', ftString, 20)]
    [Dictionary('abreviatura', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property abreviatura: nullable<String> read Fabreviatura write Fabreviatura;

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

    [Column('cpf', ftString, 14)]
    [Dictionary('cpf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cpf: nullable<String> read Fcpf write Fcpf;

    [Column('rg', ftString, 16)]
    [Dictionary('rg', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property rg: nullable<String> read Frg write Frg;

    [Column('fone1', ftString, 15)]
    [Dictionary('fone1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone1: nullable<String> read Ffone1 write Ffone1;

    [Column('fone2', ftString, 15)]
    [Dictionary('fone2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone2: nullable<String> read Ffone2 write Ffone2;

    [Column('dtadmissao', ftString, 10)]
    [Dictionary('dtadmissao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property dtadmissao: nullable<String> read Fdtadmissao write Fdtadmissao;

    [Column('funcao', ftString, 20)]
    [Dictionary('funcao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property funcao: nullable<String> read Ffuncao write Ffuncao;

    [Column('dtdemissao', ftString, 10)]
    [Dictionary('dtdemissao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property dtdemissao: nullable<String> read Fdtdemissao write Fdtdemissao;

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

TRegisterClass.RegisterEntity(TFuncionario)

end.
