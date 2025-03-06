unit uGlobal;

interface

var
  // ************ Variáveis de Cadastro ************//
    nGrupo,
    nSubGrupo,
    nMarca,
    nFornecedor,
    nProduto,
    nClientes,
    nIndNota,
    nIndItem,
    nTamanho,
    nCor,
    nBandeira,
    nEmpresa,
    nUsuario,
    nFuncionario,
    nCaixa,
    nReserva,
    nWallet,
    nCartao,
    nTerminal: Integer;
    dtEmissao : TDateTime;

  vCustoReal: Currency = 0;

  sUnidade, sCest, sReserva: String;

  // ************ Variáveis de Tributação p/ Venda ************//
  cstInt, cstExt, CSOSNInt, CSOSNExt, CFOPPropInt, CFOPPropExt, CFOPTercInt,
    CFOPTercExt, TipTribInt, TipTribExt: String;
  AliqICMSInt, AliqICMSExt, RBCInt, RBCExt, AliqCredInt, AliqCredExt: Double;

  // ************ Variáveis de Acesso ************//
  UserLog: Integer = 1;
  NameUser: String;
  Terminal, EmpLog: Integer;
  Logado: Boolean = False;

  // ************ Variáveis de Conexao ************//
  TpConexao: String = 'MySQL';

  // ************ Variáveis de Movimentação ************//
  nVenda: Integer;
  nNotaEntrada: Integer;
  stEntrada: Boolean; // Se True está dando entrada em nota
  ReservaPaga: Boolean;
  VendaPaga: Boolean;

implementation

end.
