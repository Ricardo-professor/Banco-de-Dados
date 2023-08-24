insert into atividade.documentos 
		(numero_documento, data_documento, valor_total, valor_liquido)
values 
		(1, '2023-08-22', 2.0, 2.0),
		(2, '2023-08-23', 10.0, 10.0),
		(3, '2023-07-22', 10.0, 10.0),
		(4, '2023-08-28', 7.0, 7.0),
		(5, '2023-06-24', 3.0, 3.0)
		
insert into atividade.produtos
		(codigo, nome_produto, valor_custo, valor_venda)
values
		('68ja', 'beterraba', 1.0, 2.0),
		('78ck', 'arroz', 5.0, 100.0),
		('79ck', 'feijão', 5.0, 10.0),
		('81ck', 'banana', 4.0, 7.0),
		('59ck', 'miojo', 2.0, 3.0)
		
insert into atividade.produtos_documento
		(idprodutos, iddocumento, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido, quantidade)
values
		(1, 1, 2.0, 0, 0, 2.0, 2.0, 1),
		(2, 2, 10.0, 0, 0, 10.0, 10.0, 1),
		(3, 3, 10.0, 0, 0, 10.0, 10.0, 1),
		(4, 4, 7.0, 0, 0, 7.0, 7.0, 1),
		(5, 5, 3.0, 0, 0, 3.0, 3.0, 1)
update atividade.produtos set nome_produto='cenoura' where idprodutos=1
update atividade.produtos set valor_custo='1.5' where idprodutos=1
update atividade.produtos set valor_venda=(valor_venda * 1.1) where idprodutos <=5

select * from atividade.produtos where valor_venda >= 100