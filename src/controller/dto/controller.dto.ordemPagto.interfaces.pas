unit controller.dto.ordemPagto.interfaces;

interface

uses
  System.Generics.Collections,

  model.ordemPagto,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  IOrdemPagto = interface
    ['{BD69A90F-9F1C-4316-BF74-0E949CDCEBAC}']

    function idtbordem_pagto(Value: String): IOrdemPagto; overload;
    function idtbordem_pagto: String; overload;

    function idtbordens_cab(Value: String): IOrdemPagto; overload;
    function idtbordens_cab: String; overload;

    function idtbforma_pagto(Value: String): IOrdemPagto; overload;
    function idtbforma_pagto: String; overload;

    function forma_pagto(Value: String): IOrdemPagto; overload;
    function forma_pagto: String; overload;

    function valor(Value: Currency): IOrdemPagto; overload;
    function valor: Currency; overload;

    function Build: IService<TOrdemPayment>;

    function Manufacture: IServiceScripts;
  end;

implementation

end.
