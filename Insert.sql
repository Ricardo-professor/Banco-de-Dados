/* Aluno: Douglas do Amaral Rocha Mariano

Inserir 5 registros em cada tabela pelo menos
*/
insert into douglas.documentos
	(nmdocumento, dtdocumento)
values
	(1, '22-06-2023'),
	(2, '23-07-2023'),
	(3, '01-08-2023'),
	(4, '09-08-2023'),
	(5, '15-08-2023'),
	(6, '23-08-2023');
	
insert into douglas.produtos
	(codigo, nome, valorcusto, valorvenda)
values
	(1, 'celular A2', 999.53, 1253.99),
	(2, 'celular A3', 1299.53, 1553.99),
	(3, 'celular J3', 1599.53, 1753.99),
	(4, 'celular G30', 899.53, 1153.99),
	(5, 'celular G22', 799.53, 999.99),
	(6, 'celular G50', 699.53, 859.99),
	(7, 'celular J5', 999.53, 1253.99),
	(8, 'celular Q30', 1999.53, 2300.99),
	(9, 'celular A50', 2599.53, 2999.99),
	(10, 'celular S5', 599.53, 789.99),
	(11, 'celular S30', 699.53, 985.99),
	(12, 'celular A45', 799.53, 999.99),
	(13, 'celular D3', 499.53, 859.99),
	(14, 'celular A1', 1009.53, 1359.99);
	
insert into douglas.clientes
	(codigo, nome)
values
	('001', 'Douglas'),
	('002', 'Leonardo'),
	('003', 'Eduardo'),
	('004', 'Raynan'),
	('005', 'Bernardo');
	
insert into douglas.produtosdocumento
	(iddocumento, idproduto, idcliente, quantidade, valordesc, valoracresc, 
	 valorunit, valorbruto, valorliquido)
values
(
	(select iddocumento from douglas.documentos where nmdocumento = '1'),
	(select idproduto from douglas.produtos where codigo = '1'),
	(select idcliente from douglas.clientes where codigo = '001'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '1'),
	(select valorvenda from douglas.produtos where codigo = '1') * 2,
	(((select valorvenda from douglas.produtos where codigo = '1') - 100) * 2) + 50.50
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '1'),
	(select idproduto from douglas.produtos where codigo = '3'),
	(select idcliente from douglas.clientes where codigo = '001'), 2, 50.00,
	(select valorvenda from douglas.produtos where codigo = '3'),
	(select valorvenda from douglas.produtos where codigo = '3') * 2,
	((select valorvenda from douglas.produtos where codigo = '3') - 50) * 2
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '2'),
	(select idproduto from douglas.produtos where codigo = '2'),
	(select idcliente from douglas.clientes where codigo = '003'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '2'),
	(select valorvenda from douglas.produtos where codigo = '2') * 2,
	(((select valorvenda from douglas.produtos where codigo = '2') - 100) * 2) + 50.50
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '3'),
	(select idproduto from douglas.produtos where codigo = '4'),
	(select idcliente from douglas.clientes where codigo = '002'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '1'),
	(select valorvenda from douglas.produtos where codigo = '1') * 2,
	(((select valorvenda from douglas.produtos where codigo = '1') - 100) * 2) + 50.50
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '4'),
	(select idproduto from douglas.produtos where codigo = '10'),
	(select idcliente from douglas.clientes where codigo = '005'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '10'),
	(select valorvenda from douglas.produtos where codigo = '10') * 2,
	(((select valorvenda from douglas.produtos where codigo = '10') - 100) * 2) + 50.50
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '5'),
	(select idproduto from douglas.produtos where codigo = '4'),
	(select idcliente from douglas.clientes where codigo = '003'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '4'),
	(select valorvenda from douglas.produtos where codigo = '4') * 2,
	(((select valorvenda from douglas.produtos where codigo = '4') - 100) * 2) + 50.50
),
(
	(select iddocumento from douglas.documentos where nmdocumento = '6'),
	(select idproduto from douglas.produtos where codigo = '6'),
	(select idcliente from douglas.clientes where codigo = '004'), 2, 100.00, 50.50,
	(select valorvenda from douglas.produtos where codigo = '6'),
	(select valorvenda from douglas.produtos where codigo = '6') * 2,
	(((select valorvenda from douglas.produtos where codigo = '6') - 100) * 2) + 50.50
);
