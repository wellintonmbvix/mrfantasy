
SELECT
CONVERT(tboc.idtbordens_cab USING utf8mb3) idtbordens_cab,
LPAD(tboc.controle, 5, "0") AS controle,
tboc.dtdocumento,
tboc.dtretirada,
tboc.dtdevolucao,
tbfu.nome as atendente,
ifnull(tbcli.nome,'CONSUMIDOR FINAL') as cliente,
(CASE WHEN tboc.estado = 'A' THEN 'Aberta'
	  WHEN tboc.estado = 'D' THEN 'Devolvida'
      WHEN tboc.estado = 'F' THEN 'Finalizada'
      WHEN tboc.estado = 'C' THEN 'Cancelada' END) as estado,
(SELECT SUM(tboi.qtde) FROM tbordens_itens tboi WHERE tboc.idtbordens_cab = tboi.idtbordens_cab) AS qtdeTotal,
(SELECT SUM(tboi.totalLiquido) FROM tbordens_itens tboi WHERE tboc.idtbordens_cab = tboi.idtbordens_cab) AS totalOrdem, 
select_formapagto(tboc.idtbordens_cab) AS forma_pagto,
tboi.item,
tbpr.nome AS produto,
(CASE WHEN tbpr.tipo = 0 THEN 'Fantasia Masculina'
      WHEN tbpr.tipo = 1 THEN 'Fantasia Feminina'
      WHEN tbpr.tipo = 2 THEN 'Fantasia Infantil'
      WHEN tbpr.tipo = 3 THEN 'Mascaras'
      WHEN tbpr.tipo = 4 THEN 'Perucas'
      WHEN tbpr.tipo = 5 THEN 'Acessórios'
      ELSE 'Mágica e Outros' END) AS tipo,
tboi.qtde,
tboi.valorUnitario,
tboi.percDesconto,
tboi.valorDesconto,
tboi.totalLiquido,
(CASE WHEN tboi.venda = 1 THEN 'Sim' ELSE 'Não' END) AS venda
FROM tbordens_cab tboc
	INNER JOIN tbordens_itens tboi ON tboc.idtbordens_cab = tboi.idtbordens_cab
    INNER JOIN tbfuncionarios tbfu ON tboc.idfuncionario = tbfu.idtbfuncionario
    INNER JOIN tbprodutos tbpr ON tboi.idtbproduto = tbpr.idtbproduto
    LEFT JOIN tbclientes tbcli ON tboc.idtbcliente = tbcli.idtbcliente