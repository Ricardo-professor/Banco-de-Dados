insert into trabalho_bd.clientes
	(nome_cliente)
values
	('Jairo'),
	('Mariana'),
	('Pedro'),
	('Silvana'),
	('Elaine');
insert into trabalho_bd.docs
	(numero_doc, data_doc, vltotal, vlliquido)
values
	(1, '2023-08-23', 10, 5),
	(2, '2023-08-23', 5, 2),
	(3, '2023-08-23', 30, 15),
	(4, '2023-08-23', 6, 3),
	(5, '2023-08-23', 10, 5);
insert into trabalho_bd.produtos
	(codigo, nome_prod, vlcusto, vlvenda)
values
	('00001', 'Brinco', 13, 29),
	('00002', 'Anel', 10, 25),
	('00003', 'Colar', 17, 45),
	('00004', 'Pulseira',14, 35),
	('00005', 'Tiara', 13, 29);
insert into trabalho_bd.prod_doc
	(iddocs, idprodutos, vlunidade, vlacr, vlbruto, vlliquido)
values
	(1, 1, 0, 0, 0, 0),
	(2, 2, 0, 0, 0, 0),
	(3, 3, 0, 0, 0, 0),
	(4, 4, 0, 0, 0, 0),
	(5, 5, 0, 0, 0, 0);
	
