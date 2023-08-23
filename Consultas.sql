/* Aluno: Douglas do Amaral Rocha Mariano

Consultas:

1- Mostrar um documento com seus produtos (através de join)
2- Mostrar lista de produtos com valor maior que 100,00
3- Mostrar um documento com o nome de cliente e o nome dos produtos
*/

select * from douglas.documentos
--- Mostrar um documento com seus produtos ---
select
	nmdocumento "nº do documento", dtdocumento "data da compra", 
	nome produto, valortotal bruto, pdoc.valorliquido "total a pagar"
from douglas.produtosdocumento pdoc
	right join douglas.documentos doc on doc.iddocumento = pdoc.iddocumento
	right join douglas.produtos prod on prod.idproduto = pdoc.idproduto
where nmdocumento = '1'

--- Mostrar lista de produtos com valor maior que 100,00 ---
select
	codigo, nome, valorcusto, valorvenda
from douglas.produtos
where valorvenda <= 100.00

--- Mostrar um documento com o nome de cliente e o nome dos produtos ---
select
	nmdocumento "nº do documento", dtdocumento "data da compra", 
	cli.nome cliente, prod.nome produto
from douglas.produtosdocumento pdoc
	right join douglas.documentos doc on doc.iddocumento = pdoc.iddocumento
	right join douglas.produtos prod on prod.idproduto = pdoc.idproduto
	right join douglas.clientes cli on cli.idcliente = pdoc.idcliente
where nmdocumento = '2'