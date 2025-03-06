unit model.resource.interfaces;

interface

uses
  Data.DB;

type
  IConnection = interface
    function Connect: TCustomConnection;
  end;

  IConfiguration = interface
    ['{9EE12B64-681A-46D4-8B27-B73DEAFAA5A7}']

    function DriverID(Value: String): IConfiguration; overload;
    function DriverID: String; overload;

    function Database(Value: String): IConfiguration; overload;
    function Database: String; overload;

    function Username(Value: String): IConfiguration; overload;
    function Username: String; overload;

    function Password(Value: String): IConfiguration; overload;
    function Password: String; overload;

    function Port(Value: String): IConfiguration; overload;
    function Port: String; overload;

    function Server(Value: String): IConfiguration; overload;
    function Server: String; overload;

    function Schema(Value: String): IConfiguration; overload;
    function Schema: String; overload;
  end;

  IResource = interface
    ['{7C48AC58-C99F-4CB8-94EE-4779F5F1F652}']

    function Connection: IConnection;
    function Configuration: IConfiguration;
  end;

implementation

end.
