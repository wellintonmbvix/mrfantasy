unit model.scripts.service.interfaces;

interface

uses
  FireDAC.Comp.Client,
  System.Generics.Collections;

type
  IServiceView = interface
    ['{8447D085-306F-4577-B442-00E8015A95F8}']

    function ViewCaixa(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewProduto(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewCartao(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewCliente(aFilter: String; var aList: TFDMemTable;
      aPageSize: Integer = 10; aPageNext: Integer = 1): IServiceView;
    function ViewFormasPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceView;
  end;

  IServiceScripts = interface
    ['{50B0A41A-2A9E-4018-99ED-78336AEAE9B9}']

    function ViewOrdemMaster(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdemDetail(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdemPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewCompCab(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewCompItem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewCompPagto(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewOrdensAlugadas(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewItensAlugados(var aList: TFDMemTable; aFilter: String;
      aOrdemBy: String = ''; Asc: Boolean = True)
      : IServiceScripts;
    function ViewOrdemWithDetail(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewPagtoByOrdem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
    function ViewDetailByOrdem(aFilter: String; var aList: TFDMemTable)
      : IServiceScripts;
  end;

implementation

end.
