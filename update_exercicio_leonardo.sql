--1- Alterar o nome do produto

update exe_individual.produto set nome_produto = 'camisa nike' where codigo = 1;


--2- Alterar o valor do produto

update exe_individual.produto set vlcusto = 120 where codigo = 1;
update exe_individual.produto set vlvenda = 170 where codigo = 1;


--3- Reajustar em 10% o valor de venda dos produtos

update exe_individual.produto set vlcusto = round(vlcusto*1.10);
update exe_individual.produto set vlvenda = round(vlvenda*1.10);



--select * from exe_individual.documento
--select * from exe_individual.produto
--select * from exe_individual.cliente
--select * from exe_individual.produtodocumento


