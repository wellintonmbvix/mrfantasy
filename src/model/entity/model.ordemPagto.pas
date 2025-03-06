unit model.ordemPagto;

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
  [Table('tbordens_pagto', '')]
  [PrimaryKey('idtbordens_pagto', TAutoIncType.AutoInc,
                                  TGeneratorType.Guid36Inc,
                                  TSortingOrder.NoSort,
                                  True, 'Chave primária')]
  [Sequence('tbordens_pagto')]
  [OrderBy('idtbordens_pagto')]
  TOrdemPayment = class
  private
    { Private declarations }

    Fidtbordens_pagto: String;
    Fidtbordens_cab: String;
    Fidtbformas_pagto: String;
    Fvalor: Currency;
    Fforma_pagto: String;
    Fdtdocumento: TDateTime;
    Festado: String;
  public
    { Public declarations }

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbordens_pagto', ftString)]
    [Dictionary('idtbordens_pagto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbordens_pagto: String read Fidtbordens_pagto
      write Fidtbordens_pagto;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbordens_cab', ftString)]
    [ForeignKey('fk_tbordens_pagto_tbordens_cab', 'idtbordens_cab', 'tbordens_cab',
      'idtbordens_cab', Cascade, None)]
    [Dictionary('idordens_cab', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbordens_cab: String read Fidtbordens_cab
      write Fidtbordens_cab;

//    [Restrictions([TRestriction.NoInsert,TRestriction.NoUpdate])]
//    [Column('dtdocumento', ftDateTime)]
//    [JoinColumn('idtbordens_cab', 'tbordens_cab', 'idtbordens_cab', 'dtdocumento', TJoin.InnerJoin, 'dtdocumento')]
//    [Dictionary('dtdocumento', '')]
//    property dtdocumento: TDateTime read Fdtdocumento write Fdtdocumento;

//    [Restrictions([TRestriction.NoInsert,TRestriction.NoUpdate])]
//    [Column('estado', ftString)]
//    [JoinColumn('idtbordens_cab', 'tbordens_cab', 'idtbordens_cab', 'estado', TJoin.InnerJoin, 'estado')]
//    [Dictionary('estado', '')]
//    property estado: String read Festado write Festado;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbformas_pagto', ftString)]
    [ForeignKey('fk_tbordens_pagto_tbformas_pagto', 'idtbformas_pagto', 'tbordens_cab',
      'idtbformas_pagto', None, None)]
    [Dictionary('idtbformas_pagto', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbformas_pagto: String read Fidtbformas_pagto
      write Fidtbformas_pagto;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('forma_pagto', ftString, 60)]
    [JoinColumn('idtbformas_pagto', 'tbformas_pagto', 'idtbformas_pagto', 'descricao', TJoin.InnerJoin, 'forma_pagto')]
    [Dictionary('forma_pagto', '')]
    property forma_pagto: String read Fforma_pagto write Fforma_pagto;

    [Column('valor', ftCurrency)]
    [Dictionary('valor', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property valor: Currency read Fvalor write Fvalor;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TOrdemPayment)

end.