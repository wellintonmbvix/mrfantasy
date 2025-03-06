unit model.formasPagto;

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
  [Table('tbformas_pagto', '')]
  [PrimaryKey('idtbformas_pagto', TAutoIncType.AutoInc,
                         TGeneratorType.NoneInc,
                         TSortingOrder.NoSort,
                         True, 'Chave primária')]
  [Sequence('tbformas_pagto')]
  [OrderBy('idtbformas_pagto')]
  TFormaPagamento = class
  private
    { Private declarations }

    Fidtbformas_pagto: Integer;
    Fdescricao: nullable<String>;
    Fativo: Boolean;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
  public
    { Public declarations }

    [Column('idtbformas_pagto', ftInteger)]
    [Dictionary('idtbformas_pagto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbformas_pagto: Integer read Fidtbformas_pagto
      write Fidtbformas_pagto;

    [Column('descricao', ftString, 30)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: nullable<String> read Fdescricao write Fdescricao;

    [Column('ativo', ftBoolean)]
    [Dictionary('ativo', 'Mensagem de validação', 'false', '', '', taCenter)]
    property ativo: Boolean read Fativo write Fativo;

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

TRegisterClass.RegisterEntity(TFormaPagamento)

end.