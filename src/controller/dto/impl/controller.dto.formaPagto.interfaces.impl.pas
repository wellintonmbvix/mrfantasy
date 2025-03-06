unit controller.dto.formaPagto.interfaces.impl;

interface

uses
  controller.dto.formaPagto.interfaces,
  model.scripts.service.interfaces,
  model.scripts.service.interfaces.impl;

type
  TIFormaPagto = class(TInterfacedObject, IFormaPagto)
    private
      FServiceView: IServiceView;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IFormaPagto;

      function Manufacture: IServiceView;
  end;

implementation

{ TIFormaPagto }

constructor TIFormaPagto.Create;
begin
  FServiceView := TServiceView.New;
end;

destructor TIFormaPagto.Destroy;
begin
  inherited;
end;

function TIFormaPagto.Manufacture: IServiceView;
begin
  Result := FServiceView;
end;

class function TIFormaPagto.New: IFormaPagto;
begin
  Result := Self.Create;
end;

end.
