-- Consultas:
-- 1 - Mostrar um documento com seus produtos (através de join)
select
	doc.iddocumento numero_documento, prod.nome_prod produtos, prod_doc.quantidade,
	prod_doc.vl_un, prod_doc.vl_desconto, prod_doc.vl_acrescimo, prod_doc.vl_bruto,
	prod_doc.vl_liquido
from exerc.produto_doc prod_doc
left join exerc.documento doc on doc.iddocumento = prod_doc.iddocumento
left join exerc.produto prod on prod.idproduto = prod_doc.idproduto
where doc.iddocumento = 2

-- 2 - Mostrar lista de produtos com valor maior que 100,00
select
	prod.cd_prod codigo, prod.nome_prod, prod.vl_venda valor
from exerc.produto prod
where prod.vl_venda > 100

-- 3 - Mostrar um documento com o nome de cliente e o nome dos produtos
select
	doc.iddocumento numero_documento, cl.cliente_nome, cl.idcliente, prod.nome_prod
from exerc.produto_doc prod_doc
left join exerc.documento doc on doc.iddocumento = prod_doc.iddocumento
left join exerc.produto prod on prod.idproduto = prod_doc.idproduto
left join exerc.cliente cl on cl.idcliente = doc.idcliente
where doc.iddocumento = 2

-- Atualizações:
-- 1 - Alterar o nome do produto
update exerc.produto set 
	nome_prod = 'Blusa'
where idproduto = 1	

-- 2 - Alterar o valor do produto
update exerc.produto set
	lv_custo = 15
where idproduto = 5

-- 3 - Reajustar em 10% o valor de venda dos produtos
update exerc.produto set
	vl_venda = vl_venda + (vl_venda * 0.1)
where idproduto = 4	