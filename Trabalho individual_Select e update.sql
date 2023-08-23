--Consultas:
/*1- Mostrar um documento com seus produtos (através de join)*/
select doc.datdocumento "Data do Doc", doc.numdocumento "Numero", prod.nome "Produto"
from individual.prod_doc pd
left join individual.documento doc on doc.iddocumento = pd.iddocumento
left join individual.produto prod on prod.idproduto = pd.idproduto
order by doc.numdocumento,nome
/*2-Mostrar lista de produtos com valor maior que 100,00*/	
select* from individual.produto where vlvendaprod>=100

/*3-Mostrar um documento com o nome de cliente e o nome dos produtos*/
select cli.nome_cliente "Nome do cliente",prod.nome "Produto"
from individual.prod_doc pd
left join individual.cliente cli on cli.idcliente = pd.idcliente
left join individual.produto prod on prod.idproduto = pd.idproduto
order by nome_cliente,nome

--Atualizações:
/*1- Alterar o nome do produto*/
update individual.produto
set nome = 'Produto x'
where nome = 'Produto3';
--Pesquisa para testar atualização
select* from individual.produto order by nome

/*2-Alterar o valor do produto*/
update individual.produto
set vlcustoprod = 45
where vlcustoprod = 40;

/*3- Reajustar em 10% o valor de venda dos produtos*/
update individual.produto
set vlvendaprod = round(vlvendaprod * 1.10);
select* from individual.produto









