insert into exe_individual.documento
(numero_documento,data_documento)
values
(1001,'13-07-1994'),
(1002,'17-05-1974'),
(1003,'19-07-2000'),
(1004,'21-11-1991'),
(1005,'30-04-2013');

insert into exe_individual.cliente
(cod_cliente,nome_cliente)
values
('10a','Carlos'),
('20b','Bruna'),
('30c','Maia'),
('40d','cueca'),
('50e','Leonardo');

insert into exe_individual.produto
(codigo,nome_produto,vlcusto,vlvenda)
values
(1,'camisa',100.0,150.0),
(2,'bermuda',50.0,100.0),
(3,'meia',30.0,45.0),
(4,'cueca',10.0,20.0),
(5,'sapato',80.0,160.0);

insert into exe_individual.produtodocumento
(iddocumento,idcliente, idproduto, vlunitario, quantidae, vldesconto, vlacrescimo, vlbruto, vlliquido)
values --select * from aula.itens where idvenda = 6
(
	(select iddocumento from exe_individual.documento where numero_documento = 1001 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '10a' ),
	(select idproduto from exe_individual.produto where codigo = 1),
	(select vlvenda from exe_individual.produto where codigo = 1),
	2,15,0,
	((select vlvenda from exe_individual.produto where codigo = 1) * 2),
	(((select vlvenda from exe_individual.produto where codigo = 1) - 15) * 2) 
),
(
	(select iddocumento from exe_individual.documento where numero_documento = 1001 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '10a' ),
	(select idproduto from exe_individual.produto where codigo = 2),
	(select vlvenda from exe_individual.produto where codigo = 2),
	1,10,0,
	((select vlvenda from exe_individual.produto where codigo = 2) * 1),
	(((select vlvenda from exe_individual.produto where codigo = 2) - 10) * 1) 
),
(
	(select iddocumento from exe_individual.documento where numero_documento = 1002 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '20b' ),
	(select idproduto from exe_individual.produto where codigo = 2),
	(select vlvenda from exe_individual.produto where codigo = 2),
	2,0,10,
	((select vlvenda from exe_individual.produto where codigo = 2) * 2),
	(((select vlvenda from exe_individual.produto where codigo = 2) + 10) * 2) 
),
(
	(select iddocumento from exe_individual.documento where numero_documento = 1003 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '30c' ),
	(select idproduto from exe_individual.produto where codigo =3),
	(select vlvenda from exe_individual.produto where codigo = 3),
	3,0,0,
	((select vlvenda from exe_individual.produto where codigo = 3) * 3),
	(((select vlvenda from exe_individual.produto where codigo = 3) - 0) * 3) 
),
(
	(select iddocumento from exe_individual.documento where numero_documento = 1004 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '40d' ),
	(select idproduto from exe_individual.produto where codigo = 4),
	(select vlvenda from exe_individual.produto where codigo = 4),
	4,5,0,
	((select vlvenda from exe_individual.produto where codigo = 4) * 4),
	(((select vlvenda from exe_individual.produto where codigo = 4) - 5) * 4) 
),
(
	(select iddocumento from exe_individual.documento where numero_documento = 1005 ),
	(select idcliente from exe_individual.cliente where cod_cliente = '50e' ),
	(select idproduto from exe_individual.produto where codigo = 5),
	(select vlvenda from exe_individual.produto where codigo = 5),
	1,0,16,
	((select vlvenda from exe_individual.produto where codigo = 5) * 1),
	(((select vlvenda from exe_individual.produto where codigo = 5) + 16) * 1) 
);


