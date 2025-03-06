unit model.service.interfaces;

interface

uses
  System.Generics.Collections;

type
  IService<T: Class> = interface(IInterface)

    function ListAll(aFilter: String; var aList: TObjectList<T>;
      const aOrderBy: String = ''): IService<T>;
    function ListPaginate(aFilter: String; var aList: TObjectList<T>;
      const aOrderBy: String = ''; aPageSize: Integer = 10;
      aPageNext: Integer = 1): IService<T>;
    function ListById(aField: String; aId: Integer): IService<T>; overload;
    function ListById(aField: String; aId: Integer; var aList: TObjectList<T>)
      : IService<T>; overload;
    function ListByGuid(aField, aGuid: String; var aList: TObjectList<T>)
      : IService<T>; overload;
    function Insert: IService<T>;
    function Modify(AValue: T): IService<T>;
    function Update: IService<T>;
    function Delete: IService<T>;
    function This: T;
    function GetLastId(aTableName: String; aFilter: String;
      aIdField: String; var nRecord: Integer): IService<T>;
    function GetRecordsNumber(aTableName: String; aFilter: String;
      var nRecords: Integer): IService<T>;
    procedure SetEstadoOrdem(guidId: String; estado: String);
  end;

implementation

end.
