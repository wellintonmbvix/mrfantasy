unit controller.dto.produto.interfaces;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  model.produto,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces,
  model.scripts.service.interfaces;

type
  IProduto = interface
    ['{640FBE17-E9B2-417E-83E4-288CF8B86BBC}']

    function idtbproduto(Value: Integer): IProduto; overload;
    function idtbproduto: Integer; overload;

    function nome(Value: String): IProduto; overload;
    function nome: String; overload;

    function descricao(Value: String): IProduto; overload;
    function descricao: String; overload;

    function foto(Value: TBlob): IProduto; overload;
    function foto: TBlob; overload;

    function vlrcusto(Value: Currency): IProduto; overload;
    function vlrcusto: Currency; overload;

    function vlrvenda(Value: Currency): IProduto; overload;
    function vlrvenda: Currency; overload;

    function vlraluguel(Value: Currency): IProduto; overload;
    function vlraluguel: Currency; overload;

    function Settipo(Value: TEnumTipoProduto): IProduto; overload;
    function Gettipo: TEnumTipoProduto; overload;

    function estoque(Value: Integer): IProduto; overload;
    function estoque: Integer; overload;

    function Setestoquemin(Value: Integer): IProduto; overload;
    function Getestoquemin: Integer; overload;

    function ativo(Value: Boolean): IProduto; overload;
    function ativo: Boolean; overload;

    function itemvenda(Value: String): IProduto; overload;
    function itemvenda: String; overload;

    function dtcadastro(Value: TDateTime): IProduto; overload;
    function dtcadastro: TDateTime; overload;

    function usercad(Value: Integer): IProduto; overload;
    function usercad: Integer; overload;

    function dtalterado(Value: TDateTime): IProduto; overload;
    function dtalterado: TDateTime; overload;

    function useralt(Value: Integer): IProduto; overload;
    function useralt: Integer; overload;

    function Build: IService<TProduto>;

    function Manufacture: IServiceView;

  end;

implementation

end.
