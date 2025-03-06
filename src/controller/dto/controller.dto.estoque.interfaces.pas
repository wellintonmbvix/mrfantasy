unit controller.dto.estoque.interfaces;

interface

uses
  model.estoque,
  model.service.interfaces;

type
  IEstoque = interface
    ['{79691097-9B50-41EA-AE7E-6F9480AEBB9B}']

    function idtbempresa(Value: Integer): IEstoque; overload;
    function idtbempresa: Integer; overload;

    function idtbproduto(Value: Integer): IEstoque; overload;
    function idtbproduto: Integer; overload;

    function qtde(Value: Integer): IEstoque; overload;
    function qtde: Integer; overload;

    function Build: IService<TEstoque>;
  end;

implementation

end.
