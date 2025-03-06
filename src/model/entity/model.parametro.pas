unit model.parametro;

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
  [Table('tbparametros', '')]
  TParametro = class
  private
    { Private declarations }

    Fversaobd: Integer;
    Fpastabkp: String;
    Fdtbackup: TDateTime;
    Fimp_bobina: String;
    Fimp_relatorio: String;
    Fcomp_bobina: Boolean;
    Finibe_acre: Boolean;
  public
    { Public declarations }

    [Column('versaobd', ftInteger)]
    [Dictionary('versaobd', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property versaobd: Integer read Fversaobd write Fversaobd;

    [Column('pastabkp', ftString)]
    [Dictionary('pastabkp', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property pastabkp: String read Fpastabkp write Fpastabkp;

    [Column('dtbackup', ftString)]
    [Dictionary('dtbackup', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property dtbackup: TDateTime read Fdtbackup write Fdtbackup;

    [Column('imp_bobina', ftString)]
    [Dictionary('imp_bobina', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property imp_bobina: String read Fimp_bobina write Fimp_bobina;

    [Column('imp_relatorio', ftString)]
    [Dictionary('imp_relatorio', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property imp_relatorio: String read Fimp_relatorio write Fimp_relatorio;

    [Column('comp_bobina', ftBoolean)]
    [Dictionary('comp_bobina', 'Mensagem de validação', '', '', '', taCenter)]
    property comp_bobina: Boolean read Fcomp_bobina write Fcomp_bobina;

    [Column('inibe_acre', ftBoolean)]
    [Dictionary('inibe_acre', 'Mensagem de validação', '', '', '', taCenter)]
    property inibe_acre: Boolean read Finibe_acre write Finibe_acre;
  end;

implementation

initialization

TRegisterClass.RegisterEntity(TParametro);

end.
