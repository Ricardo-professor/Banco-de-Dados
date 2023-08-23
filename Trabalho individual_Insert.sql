insert into individual.cliente
	(cod_cliente,nome_cliente)
values
	('001','Cliente1'),
	('002','Cliente2'),
	('003','Cliente3'),
	('004','Cliente4'),
	('005','Cliente5');

insert into individual.documento
	(numdocumento,datdocumento)
values
	('11', '10-01-2023'),
	('22', '5-03-2023'),
	('33', '9-03-2023'),
	('44', '15-04-2023'),
	('55', '19-04-2023');
	
insert into individual.produto
	(codigo,nome,vlcustoprod,vlvendaprod)
values
	('1a', 'Produto1', 10, 20),
	('2b', 'Produto2', 20, 40),
	('3c', 'Produto3', 30, 60),
	('4d', 'Produto4', 40, 80),
	('5e', 'Produto5', 50, 100);

insert into individual.prod_doc
	(iddocumento, idproduto, idcliente, quantidade, vlunit, vldesc,vlacresc,vlbruto,vlliquido)
values
( 
	(select iddocumento from individual.documento where numdocumento = '11'), 
	(select idproduto from individual.produto where codigo = '1a'),
	(select idcliente from individual.cliente where cod_cliente = '001'),
	10, 
	(select vlvendaprod from individual.produto where codigo='1a'),
	5, 10, 
	((select vlvendaprod from individual.produto where codigo='1a') * 10),
	(((select vlvendaprod from individual.produto where codigo='1a') * 10) -5 + 10)
),
( 
	(select iddocumento from individual.documento where numdocumento = '22'), 
	(select idproduto from individual.produto where codigo = '2b'),
	(select idcliente from individual.cliente where cod_cliente = '002'),
	20, 
	(select vlvendaprod from individual.produto where codigo='1a'),
	2, 5, 
	((select vlvendaprod from individual.produto where codigo='1a') * 20),
	(((select vlvendaprod from individual.produto where codigo='1a') * 20) -2 + 5)
),
( 
	(select iddocumento from individual.documento where numdocumento = '33'), 
	(select idproduto from individual.produto where codigo = '3c'),
	(select idcliente from individual.cliente where cod_cliente = '003'),
	30, 
	(select vlvendaprod from individual.produto where codigo='3c'),
	4, 0, 
	((select vlvendaprod from individual.produto where codigo='1a') * 30),
	(((select vlvendaprod from individual.produto where codigo='1a') * 30) -4 + 0)
),
( 
	(select iddocumento from individual.documento where numdocumento = '44'), 
	(select idproduto from individual.produto where codigo = '4d'),
	(select idcliente from individual.cliente where cod_cliente = '004'),
	25, 
	(select vlvendaprod from individual.produto where codigo='4d'),
	3, 6, 
	((select vlvendaprod from individual.produto where codigo='1a') * 25),
	(((select vlvendaprod from individual.produto where codigo='1a') * 25) -3 + 6)
),
( 
	(select iddocumento from individual.documento where numdocumento = '55'), 
	(select idproduto from individual.produto where codigo = '5e'),
	(select idcliente from individual.cliente where cod_cliente = '005'),
	44, 
	(select vlvendaprod from individual.produto where codigo='5e'),
	6, 0, 
	((select vlvendaprod from individual.produto where codigo='5e') * 44),
	(((select vlvendaprod from individual.produto where codigo='5e') * 44) -6 + 0)
),
( 
	(select iddocumento from individual.documento where numdocumento = '11'), 
	(select idproduto from individual.produto where codigo = '2b'),
	(select idcliente from individual.cliente where cod_cliente = '001'),
	5, 
	(select vlvendaprod from individual.produto where codigo='2b'),
	5, 10, 
	((select vlvendaprod from individual.produto where codigo='2b') * 5),
	(((select vlvendaprod from individual.produto where codigo='2b') * 5) -5 + 10)
),
( 
	(select iddocumento from individual.documento where numdocumento = '22'), 
	(select idproduto from individual.produto where codigo = '3c'),
	(select idcliente from individual.cliente where cod_cliente = '002'),
	5, 
	(select vlvendaprod from individual.produto where codigo='3c'),
	5, 10, 
	((select vlvendaprod from individual.produto where codigo='3c') * 5),
	(((select vlvendaprod from individual.produto where codigo='3c') * 5) -5 + 10)
);

--Atualizando valor total da tabela documento
update individual.documento set valtotal = 
(
    select sum(vlbruto)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '11')
) where numdocumento = '11';

update individual.documento set valtotal = 
(
    select sum(vlbruto)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '22')
) where numdocumento = '22';

update individual.documento set valtotal = 
(
    select sum(vlbruto)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '33')
) where numdocumento = '33';

update individual.documento set valtotal = 
(
    select sum(vlbruto)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '44')
) where numdocumento = '44';

update individual.documento set valtotal = 
(
    select sum(vlbruto)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '55')
) where numdocumento = '55';

--Atualizando valor liquido da tabela documento
update individual.documento set valiquido = 
(
    select sum(vlliquido)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '11')
) where numdocumento = '11';

update individual.documento set valiquido = 
(
    select sum(vlliquido)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '22')
) where numdocumento = '22';

update individual.documento set valiquido = 
(
    select sum(vlliquido)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '33')
) where numdocumento = '33';

update individual.documento set valiquido = 
(
    select sum(vlliquido)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '44')
) where numdocumento = '44';

update individual.documento set valiquido = 
(
    select sum(vlliquido)
    from individual.prod_doc
    where iddocumento = (select iddocumento from individual.documento where numdocumento = '55')
) where numdocumento = '55';

 
