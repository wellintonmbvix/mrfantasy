unit model.views.service.interfaces;

interface

uses
  System.Generics.Collections,

  model.caixa;

type
  IServiceView = interface
    ['{2EBEFD1C-3298-4185-8D31-E2E24A22EB14}']
    function ListCaixaSintetico(aFilter: String; var aList: TObjectList<TCaixa>): IServiceView;
  end;

implementation

end.
