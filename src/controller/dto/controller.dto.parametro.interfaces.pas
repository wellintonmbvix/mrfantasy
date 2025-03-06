unit controller.dto.parametro.interfaces;

interface

uses
  System.Generics.Collections,

  model.parametro,
  model.service.interfaces;

type
  IParametro = interface
    ['{4F95A190-1AEB-4A72-937C-D0EBDCAFC168}']

    function versaobd(Value: Integer): IParametro; overload;
    function versaobd: Integer; overload;

    function pastabkp(Value: String): IParametro; overload;
    function pastabkp: String; overload;

    function dtbackup(Value: TDateTime): IParametro; overload;
    function dtbackup: TDateTime; overload;

    function imp_bobina(Value: String): IParametro; overload;
    function imp_bobina: String; overload;

    function imp_relatorio(Value: String): IParametro; overload;
    function imp_relatorio: String; overload;

    function comp_bobina(Value: Boolean): IParametro; overload;
    function comp_bobina: Boolean; overload;

    function inibe_acre(Value: Boolean): IParametro; overload;
    function inibe_acre: Boolean; overload;

    function Build: IService<TParametro>;
  end;

implementation

end.
