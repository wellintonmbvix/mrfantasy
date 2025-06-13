unit model.caixa;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  uRotinas,
  // ormbr
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type
  TEnumOperacao = (opCredito,opDebito);
  TEnumTipoMoeda = (tpmDinheiro,tpmCartaoCredito,tpmCartaoDebito,tpmChqAVista,tpmChqAPrazo,tpmDiversos);
  TEnumTipoMovimento = (tpmFundo,tpmSangria,tpmSuprimento,tpmSobra);

  [Entity]
  [Table('tbcaixa', '')]
  [PrimaryKey('idcaixa', TAutoIncType.AutoInc, TGeneratorType.NoneInc,
    TSortingOrder.NoSort, True, 'Chave primária')]
  [Sequence('tbcaixa')]
  [OrderBy('idcaixa')]
  TCaixa = class
  private
    { Private declarations }
    Fidcaixa: Integer;
    Fidtbempresa: Integer;
    Fdtemissao: TDateTime;
    Foperacao: TEnumOperacao;
    Forigem: nullable<String>;
    Fvalor: Currency;
    Fsaldo: nullable<Currency>;
    Fpdv: nullable<Integer>;
    Fdocumento: nullable<String>;
    Fcondicao: TEnumTipoMoeda;
    Ftpmov: TEnumTipoMovimento;
    Fcancelado: Boolean;
    Fdtcadastro: TDateTime;
    Fusercad: Integer;
    Fdtalterado: TDateTime;
    Fuseralt: Integer;
    Fusername: String;
  public
    { Public declarations }
    [Column('idcaixa', ftInteger)]
    [Dictionary('idcaixa', 'Mensagem de validação', '', '', '', taCenter)]
    property idcaixa: Integer read Fidcaixa write Fidcaixa;

    [Restrictions([TRestriction.NotNull])]
    [Column('idtbempresa', ftInteger)]
    [ForeignKey('fk_tbcaixa_tbempresas', 'idtbempresa', 'tbempresas',
      'idtbempresa', Cascade, Cascade)]
    [Dictionary('idtbempresa', 'Mensagem de validação', '', '', '', taCenter)]
    property idtbempresa: Integer read Fidtbempresa write Fidtbempresa;

    [Restrictions([TRestriction.NotNull])]
    [Column('dtemissao', ftDateTime)]
    [Dictionary('dtemissao', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtemissao: TDateTime read Fdtemissao write Fdtemissao;

    [Column('operacao', ftString, 1)]
    [Dictionary('operacao', 'Mensagem de validação', 'C', '', '',
      taLeftJustify)]
    [Enumeration(TEnumType.etChar,'C,D')]
    property operacao: TEnumOperacao read Foperacao write Foperacao;

    [Column('origem', ftString, 1)]
    [Dictionary('origem', 'Mensagem de validação', 'D', '', '', taLeftJustify)]
    property origem: nullable<String> read Forigem write Forigem;

    [Column('valor', ftCurrency)]
    [Dictionary('valor', 'Mensagem de validação', '0', '#,###,##0.00', '', taRightJustify)]
    property valor: Currency read Fvalor write Fvalor;

    [Column('saldo', ftCurrency)]
    [Dictionary('saldo', 'Mensagem de validação', '0', '#,###,##0.00', '', taRightJustify)]
    property saldo: nullable<Currency> read Fsaldo write Fsaldo;

    [Column('pdv', ftInteger)]
    [Dictionary('pdv', 'Mensagem de validação', '', '', '', taCenter)]
    property pdv: nullable<Integer> read Fpdv write Fpdv;

    [Column('documento', ftString, 30)]
    [Dictionary('documento', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property documento: nullable<String> read Fdocumento write Fdocumento;

    [Column('condicao', ftString, 14)]
    [Dictionary('condicao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    [Enumeration(TEnumType.etString,'DINHEIRO,CARTAOCREDITO,CARTAODEBITO,CHQAVISTA,CHQAPRAZO,DIVERSOS')]
    property condicao: TEnumTipoMoeda read Fcondicao write Fcondicao;

    [Column('tpmov', ftString, 10)]
    [Dictionary('tpmov', 'Mensagem de validação', '', '', '', taLeftJustify)]
    [Enumeration(TEnumType.etString,'FUNDO,SANGRIA,SUPRIMENTO,SOBRA')]
    property tpmov: TEnumTipoMovimento read Ftpmov write Ftpmov;

    [Column('cancelado', ftBoolean)]
    [Dictionary('cancelado', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property cancelado: Boolean read Fcancelado write Fcancelado;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('dtcadastro', ftDateTime)]
    [Dictionary('dtcadastro', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property dtcadastro: TDateTime read Fdtcadastro write Fdtcadastro;

    [Column('usercad', ftInteger)]
    [Dictionary('usercad', 'Mensagem de validação', '', '', '', taCenter)]
    property usercad: Integer read Fusercad write Fusercad;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('username', ftString, 60)]
    [JoinColumn('usercad', 'tbusuarios', 'idtbusuario', 'username',
      TJoin.LeftJoin)]
    [Dictionary('Nome do Usuário', '')]
    property username: String read Fusername write Fusername;

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

TRegisterClass.RegisterEntity(TCaixa)

end.
