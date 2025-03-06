unit uClasseOrdens;

interface

uses
  System.SysUtils,

  SimpleAttributes,
  SimpleEntity,

  Data.DB,

  uControle,
  uRotinas,
  uGlobal;

type
  [Tabela('tbordens_cab')]
  TOrdemCab = class(TSimpleEntity)
    private
      Fobservacao    : String;
      FdtRetirada    : TDate;
      FuserAlt       : Integer;
      FidtbEmpresa   : Integer;
      FidFuncionario : Integer;
      FdtDocumento   : TDate;
      FuserCad       : Integer;
      FdtDevolucao   : TDate;
      FidtbordensCab : String;
      Festado        : String;
      FidtbCliente   : Integer;
      Fretirada      : String;
      FnroControle   : Integer;

    public
      [Campo('idtbordens_cab'), PK, NotNull]
      property idtbordensCab : String read FidtbordensCab write FidtbordensCab;
      [Campo('idtbempresa'), FK, NotNull]
      property idtbEmpresa   : Integer read FidtbEmpresa write FidtbEmpresa;
      [Campo('idfuncionario'), FK]
      property idFuncionario : Integer read FidFuncionario write FidFuncionario;
      [Campo('idtbcliente'), FK]
      property idtbCliente   : Integer read FidtbCliente write FidtbCliente;
      [Campo('controle'), NotNull, NumberOnly]
      property nroControle   : Integer read FnroControle write FnroControle;
      [Campo('dtdocumento')]
      property dtDocumento   : TDate read FdtDocumento write FdtDocumento;
      [Campo('dtretirada')]
      property dtRetirada    : TDate read FdtRetirada write FdtRetirada;
      [Campo('retirada')]
      property retirada      : String read Fretirada write Fretirada;
      [Campo('dtdevolucao')]
      property dtDevolucao   : TDate read FdtDevolucao write FdtDevolucao;
      [Campo('observacao')]
      property observacao    : String read Fobservacao write Fobservacao;
      [Campo('estado')]
      property estado        : String read Festado write Festado;
      [Campo('usercad')]
      property userCad       : Integer read FuserCad write FuserCad;
      [Campo('useralt')]
      property userAlt       : Integer read FuserAlt write FuserAlt;
  end;

   TOrdensCab = TSimpleEntityList<TOrdemCab>;

type
  [Tabela('tbordens_itens')]
  TOrdemItem = class(TSimpleEntity)
    private
      Fvenda: String;
      Fdtretirada: TDate;
      FuserAlt: Integer;
      FvalorAcrescimo: Currency;
      FvalorDesconto: Currency;
      FpercAcrescimo: Currency;
      FpercDesconto: Currency;
      FtotalBruto: Currency;
      Fcancelado: String;
      FvalorUnitario: Currency;
      FidtbordensItens: String;
      Fdevolvido: String;
      Fqtde: Currency;
      Fitem: Integer;
      FidtbProduto: Integer;
      FprecoTabela: Currency;
      Fretirado: String;
      FidtbordensCab: String;
      FtotalLiquido: Currency;
    public
      [Campo('idtbordens_itens'), PK, NotNull]
      property idtbordensItens : String read FidtbordensItens write FidtbordensItens;
      [Campo('idtbordens_cab'), FK, NotNull]
      property idtbordensCab   : String read FidtbordensCab write FidtbordensCab;
      [Campo('idtbproduto'), FK, NotNull]
      property idtbProduto     : Integer read FidtbProduto write FidtbProduto;
      [Campo('item'), NumberOnly]
      property item            : Integer read Fitem write Fitem;
      [Campo('qtde')]
      property qtde            : Currency read Fqtde write Fqtde;
      [Campo('precoTabela')]
      property precoTabela     : Currency read FprecoTabela write FprecoTabela;
      [Campo('valorUnitario')]
      property valorUnitario   : Currency read FvalorUnitario write FvalorUnitario;
      [Campo('percDesconto')]
      property percDesconto    : Currency read FpercDesconto write FpercDesconto;
      [Campo('valorDesconto')]
      property valorDesconto   : Currency read FvalorDesconto write FvalorDesconto;
      [Campo('percAcrescimo')]
      property percAcrescimo   : Currency read FpercAcrescimo write FpercAcrescimo;
      [Campo('valorAcrescimo')]
      property valorAcrescimo  : Currency read FvalorAcrescimo write FvalorAcrescimo;
      [Campo('totalBruto')]
      property totalBruto      : Currency read FtotalBruto write FtotalBruto;
      [Campo('totalLiquido')]
      property totalLiquido    : Currency read FtotalLiquido write FtotalLiquido;
      [Campo('venda')]
      property venda           : String read Fvenda write Fvenda;
      [Campo('dtretirada')]
      property dtretirada      : TDate read Fdtretirada write Fdtretirada;
      [Campo('retirado')]
      property retirado        : String read Fretirado write Fretirado;
      [Campo('devolvido')]
      property devolvido       : String read Fdevolvido write Fdevolvido;
      [Campo('cancelado')]
      property cancelado       : String read Fcancelado write Fcancelado;
      [Campo('useralt')]
      property userAlt         : Integer read FuserAlt write FuserAlt;
  end;

  TOrdensItens = TSimpleEntityList<TOrdemItem>;

type
  [Tabela('tbordens_pagto')]
  TOrdemPagto = class(TSimpleEntity)
    private
    Fvalor: Currency;
    FidtbFormasPagto: String;
    FidtbOrdensPagto: String;
    FidtbOrdensCab: String;
    public
      [Campo('idtbordens_pagto'), PK, AutoInc]
      property idtbOrdensPagto : String read FidtbOrdensPagto write FidtbOrdensPagto;
      [Campo('idtbordens_cab'), PK, NotNull]
      property idtbOrdensCab   : String read FidtbOrdensCab write FidtbOrdensCab;
      [Campo('idtbformas_pagto'), PK, NotNull]
      property idtbFormasPagto : String read FidtbFormasPagto write FidtbFormasPagto;
      [Campo('valor'), NotNull]
      property valor           : Currency read Fvalor write Fvalor;
  end;

  TOrdensPagto = TSimpleEntityList<TOrdemPagto>;

implementation

end.
