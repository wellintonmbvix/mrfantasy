unit model.views.service.interfaces.impl;

interface

uses
  System.Generics.Collections,

  firedac.Comp.Client,

  dbebr.factory.interfaces,
  dbebr.factory.firedac,

  ormbr.dml.generator.mysql,
  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,
  ormbr.container.fdmemtable,

  model.resource.interfaces,
  model.service.interfaces,
  model.views.service.interfaces,
  model.caixa;

type
  TIServiceView = class(TInterfacedObject, IServiceView)
  private
    FConnection: IConnection;
    FConnectionORM: IDBConnection;
    FORMBrContainer: IContainerObjectSet<TCaixa>;
  public

  end;

implementation

end.
