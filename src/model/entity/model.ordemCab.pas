unit model.ordemCab;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  // models
  model.ordemItem,
  model.ordemPagto,

  // ormbr
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type
  TEnumEstado = (esA, esF, esC);

  [Entity]
  [Table('tbordens_cab', '')]
  [PrimaryKey('idtbordens_cab',
                                TAutoIncType.NotInc,
                                TGeneratorType.NoneInc,
                                TSortingOrder.NoSort,
                                True, 'Chave primária')]
  [Sequence('tbordens_cab')]
  [OrderBy('idtbordens_cab')]
  TOrdemMaster = class
  private
    { Private declarations }

    Fidtbordens_cab: String;
    Fidtbempresa: Integer;
    Fidfuncionario: nullable<Integer>;
    Fidtbcliente: nullable<Integer>;
    Fcontrole: nullable<Integer>;
    Fdtdocumento: nullable<TDateTime>;
    Fdtretirada: nullable<TDateTime>;
    Fdtdevolucao: nullable<TDateTime>;
    Fobservacao: nullable<String>;
    Festado: nullable<String>;
    Fretirada: nullable<String>;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
    FordemItem: TObjectList<TOrdemDetail>;
    FordemPagto: TObjectList<TOrdemPayment>;
    Ffuncionario: String;
    Fcliente: nullable<String>;
    function GetQtdeTotal: Currency;
    function GetValorTotal: Currency;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Restrictions([TRestriction.NoUpdate])]
    [Column('idtbordens_cab', ftString)]
    [Dictionary('idtbordens_cab', 'Mensagem de validação', '', '', '',
      taCenter)]
    property idtbordens_cab: String read Fidtbordens_cab write Fidtbordens_cab;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbempresa', ftInteger)]
    [ForeignKey('fk_tbordens_cab_tbempresas', 'idtbempresa', 'tbempresas',
      'idtbempresa', Cascade, Cascade)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbempresa: Integer read Fidtbempresa write Fidtbempresa;

    [Restrictions([TRestriction.NotNull])]
    [Column('idfuncionario', ftInteger)]
    [ForeignKey('fk_tbordens_cab_tbfuncionarios', 'idfuncionario',
      'tbfuncionarios', 'idtbfuncionario', Cascade, Cascade)]
    [Dictionary('idfuncionario', 'Mensagem de validação', '', '', '', taCenter)]
    property idfuncionario: nullable<Integer> read Fidfuncionario
      write Fidfuncionario;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('funcionario', ftString, 60)]
    [JoinColumn('idfuncionario', 'tbfuncionarios', 'idtbfuncionario', 'nome',
      TJoin.LeftJoin, 'funcionario')]
    [Dictionary('Nome do Funcionário', '')]
    property funcionario: String read Ffuncionario
      write Ffuncionario;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbcliente', ftInteger)]
    [ForeignKey('fk_tbordens_cab_tbclientes', 'idtbcliente', 'tbclientes',
      'idtbcliente', Cascade, Cascade)]
    [Dictionary('idtbcliente', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbcliente: nullable<Integer> read Fidtbcliente
      write Fidtbcliente;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('cliente', ftString, 60)]
    [JoinColumn('idtbcliente', 'tbclientes', 'idtbcliente', 'nome',
      TJoin.LeftJoin, 'cliente')]
    [Dictionary('Nome do Cliente', '')]
    property cliente: nullable<String> read Fcliente write Fcliente;

    [Column('controle', ftInteger)]
    [Dictionary('controle', 'Mensagem de validação', '', '', '', taCenter)]
    property controle: nullable<Integer> read Fcontrole write Fcontrole;

    [Column('dtdocumento', ftDateTime)]
    [Dictionary('dtdocumento', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtdocumento: nullable<TDateTime> read Fdtdocumento
      write Fdtdocumento;

    [Column('dtretirada', ftDateTime)]
    [Dictionary('dtretirada', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtretirada: nullable<TDateTime> read Fdtretirada write Fdtretirada;

    [Column('dtdevolucao', ftDateTime)]
    [Dictionary('dtdevolucao', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtdevolucao: nullable<TDateTime> read Fdtdevolucao
      write Fdtdevolucao;

    [Column('observacao', ftString)]
    [Dictionary('observacao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property observacao: nullable<String> read Fobservacao write Fobservacao;

    [Column('estado', ftString, 1)]
    [Dictionary('estado', 'Mensagem de validação', '', '', '', taLeftJustify)]
    // [Enumeration(TEnumType.etString, 'Aberta, Fechada, Cancelada')]
    // property estado: TEnumEstado read Festado write Festado;
    property estado: nullable<String> read Festado write Festado;

    [Column('retirada', ftString)]
    [Dictionary('retirada', 'Mensagem de validação', 'false', '', '', taCenter)]
    property retirada: nullable<String> read Fretirada write Fretirada;

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

    [Association(TMultiplicity.OneToMany, 'idtbordens_cab', 'idtbordens_itens',
      'idtbordens_cab')]
    [CascadeActions([TCascadeAction.CascadeInsert, TCascadeAction.CascadeUpdate,
      TCascadeAction.CascadeDelete])]
    property ordemItem: TObjectList<TOrdemDetail> read FordemItem
      write FordemItem;

    [Association(TMultiplicity.OneToMany, 'idtbordens_cab', 'tbordens_pagto',
      'idtbordens_cab')]
    [CascadeActions([TCascadeAction.CascadeInsert, TCascadeAction.CascadeUpdate,
      TCascadeAction.CascadeDelete])]
    property ordemPagto: TObjectList<TOrdemPayment> read FordemPagto
      write FordemPagto;


    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    property qtdeTotal: Currency read GetQtdeTotal;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    property valorTotal: Currency read GetValorTotal;
  end;

implementation

{ TOrdemCab }

constructor TOrdemMaster.Create;
begin
  FordemItem := TObjectList<TOrdemDetail>.Create;
  FordemPagto := TObjectList<TOrdemPayment>.Create;
end;

destructor TOrdemMaster.Destroy;
begin
  FreeAndNil(FordemItem);
  FreeAndNil(FordemPagto);
  inherited;
end;

function TOrdemMaster.GetQtdeTotal: Currency;
begin
  Result := 0;
  for var iFor in FordemItem do
    Result := Result + iFor.qtde.Value;
end;

function TOrdemMaster.GetValorTotal: Currency;
begin
  Result := 0;
  for var iFor in FordemItem do
    Result := Result + iFor.totalLiquido.Value;
end;

initialization

TRegisterClass.RegisterEntity(TOrdemMaster)

end.
