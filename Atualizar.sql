/* Aluno: Douglas do Amaral Rocha Mariano

Atualizações:
1- Alterar o nome do produto
2- Alterar o valor do produto
3- Reajustar em 10% o valor de venda dos produtos
*/

--- Alterar o nome de 1 produto ---
update douglas.produtos
set nome = 'fone simples'
where codigo = '14';

--- Alterar o valor de 1 produto ---
update douglas.produtos
set valorcusto = '50.99', valorvenda = '69.90'
where codigo = '14';

--- Reajustar em 10% o valor de venda dos produtos ---
update douglas.produtosdocumento 
set valorunit = valorunit * 1.10, valorbruto = valorbruto * 1.10, 
	valorliquido = valorliquido * 1.10
where iddocumento = '1';

--- Colocando o valor na tabela documentos ---
update douglas.documentos doc 
set valortotal = todos.soma
	from (
		select pdoc.iddocumento, sum(pdoc.valorbruto) soma
		from douglas.produtosdocumento pdoc
		group by pdoc.iddocumento
	) todos
where doc.iddocumento = todos.iddocumento;

update douglas.documentos doc 
set valorliquido = todos.soma
	from (
		select pdoc.iddocumento, sum(pdoc.valorliquido) soma
		from douglas.produtosdocumento pdoc
		group by pdoc.iddocumento
	) todos
where doc.iddocumento = todos.iddocumento
