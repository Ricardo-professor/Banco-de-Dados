insert into exerc.cliente
	(cliente_nome)
values
	('Gabriel'),
	('Rorivaldo'),
	('Rodrigo'),
	('Fernando'),
	('Juliana');
	
insert into exerc.produto
	(cd_prod, nome_prod, vl_custo, vl_venda)
values
	(1, 'Camisa', 25, 45),
	(2, 'Casaco', 80, 180),
	(3, 'Calça', 70, 170),
	(4, 'Tênis', 80, 200),
	(5, 'Meia', 10, 20);	
	
insert into exerc.documento
	(num_doc, data_doc, idcliente)
values
	(1, '2023-08-23', 1),
	(2, '2023-07-12', 2),
	(3, '2023-07-10', 3),
	(4, '2023-06-24', 4),
	(5, '2023-05-12', 5);
	
insert into exerc.produto_doc
	(iddocumento, idproduto, quantidade, vl_un, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
values	
	(1, 1, 3, (select vl_venda from exerc.produto where cd_prod = '1'), 0, 0.05, 0, 0),
	(2, 4, 4, (select vl_venda from exerc.produto where cd_prod = '4'), 0, 0.05, 0, 0),
	(3, 3, 3, (select vl_venda from exerc.produto where cd_prod = '3'), 0.05, 0, 0, 0),
	(4, 2, 2, (select vl_venda from exerc.produto where cd_prod = '2'), 0, 0.05, 0, 0),
	(5, 5, 10, (select vl_venda from exerc.produto where cd_prod = '5'), 0, 0.05, 0, 0),
	(5, 3, 2, (select vl_venda from exerc.produto where cd_prod = '3'), 0, 0.05, 0, 0);
	
update exerc.produto_doc set vl_bruto =
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 1
;
update exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 2
;
update exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 3
;
update exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 4
;
update exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 5
;
update exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 6
;

select * from exerc.produto_doc