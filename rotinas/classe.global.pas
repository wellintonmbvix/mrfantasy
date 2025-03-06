unit classe.global;

interface

uses
  System.SysUtils;

type
  TGlobal = class(TObject)
  private
    class var FuserId: Integer;
    class var FuserName: String;
    class var Fterminal: Integer;
    class var Fempresa: Integer;
    class var FuserLogado: Boolean;
    class var FentityId: Integer;
    class var FentityGuid: String;
    class var FtypeDB: String;
    class var FpathBackup: String;
    class var FdateBackup: TDateTime;
    class var FversionDB: Integer;
    class procedure SettypeDB(const Value: String = 'MySQL'); static;
    class procedure SetversionDB(const Value: Integer = 1010); static;
  public
    class property userId: Integer read FuserId write FuserId;
    class property userName: String read FuserName write FuserName;
    class property terminal: Integer read Fterminal write Fterminal;
    class property empresa: Integer read Fempresa write Fempresa;
    class property userLogado: Boolean read FuserLogado write FuserLogado;
    class property entityId: Integer read FentityId write FentityId;
    class property entityGuid: String read FentityGuid write FentityGuid;
    class property typeDB: String read FtypeDB write SettypeDB;
    class property pathBackup: String read FpathBackup write FpathBackup;
    class property dateBackup: TDateTime read FdateBackup write FdateBackup;
    class property versionDB: Integer read FversionDB write SetversionDB;
  end;

implementation

{ TGlobal }

class procedure TGlobal.SettypeDB(const Value: String);
begin
  FtypeDB := Value;
end;

class procedure TGlobal.SetversionDB(const Value: Integer);
begin
  FversionDB := Value;
end;

end.
