INSERT INTO exercicio_gustavomonerat.cliente 
	(nome_cli)
VALUES
	('Astrogildo'),
	('José'),
	('João'),
	('Ana'),
	('Maria');

INSERT INTO exercicio_gustavomonerat.documento 
	(data_doc, val_total, val_liquid, idcliente)
VALUES
	('2023-08-15', 0, 0, 1),
	('2023-08-16', 0, 0, 2),
	('2023-08-17', 0, 0, 3),
	('2023-08-18', 0, 0, 4),
	('2023-08-19', 0, 0, 5);

INSERT INTO exercicio_gustavomonerat.produto 
	(codigo, nome_prod, val_custo_prod, val_venda_prod)
VALUES
	('0001', 'Calça', 50.00, 100.00),
	('0002', 'Camisa', 20.00, 80.00),
	('0003', 'Meia', 5.00, 20.00),
	('0004', 'Casaco', 150.00, 220.00),
	('0005', 'Boné', 20.00, 60.00);

INSERT INTO exercicio_gustavomonerat.prod_doc 
  (iddocumento, idproduto, qtd, val_un, val_desc, val_acr, val_bruto, val_liquido_proddoc)
SELECT
  new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr, new_val_un*new_qtd, (new_val_un*new_qtd)-(new_val_desc*new_qtd)+(new_val_acr*new_qtd)
FROM
	(VALUES (1, 1, 3, (SELECT val_venda_prod FROM exercicio_gustavomonerat.produto WHERE codigo = '0001'), 10, 0)) 
	AS v1 (new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr);
	
INSERT INTO exercicio_gustavomonerat.prod_doc 
  (iddocumento, idproduto, qtd, val_un, val_desc, val_acr, val_bruto, val_liquido_proddoc)
SELECT
  new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr, new_val_un*new_qtd, (new_val_un*new_qtd)-(new_val_desc*new_qtd)+(new_val_acr*new_qtd)
FROM
	(VALUES (2, 2, 5, (SELECT val_venda_prod FROM exercicio_gustavomonerat.produto WHERE codigo = '0002'), 0, 4)) 
	AS v1 (new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr);

INSERT INTO exercicio_gustavomonerat.prod_doc 
  (iddocumento, idproduto, qtd, val_un, val_desc, val_acr, val_bruto, val_liquido_proddoc)
SELECT
  new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr, new_val_un*new_qtd, (new_val_un*new_qtd)-(new_val_desc*new_qtd)+(new_val_acr*new_qtd)
FROM
	(VALUES (1, 3, 6, (SELECT val_venda_prod FROM exercicio_gustavomonerat.produto WHERE codigo = '0003'), 5, 0)) 
	AS v1 (new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr);

INSERT INTO exercicio_gustavomonerat.prod_doc 
  (iddocumento, idproduto, qtd, val_un, val_desc, val_acr, val_bruto, val_liquido_proddoc)
SELECT
  new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr, new_val_un*new_qtd, (new_val_un*new_qtd)-(new_val_desc*new_qtd)+(new_val_acr*new_qtd)
FROM
	(VALUES (4, 4, 1, (SELECT val_venda_prod FROM exercicio_gustavomonerat.produto WHERE codigo = '0004'), 20, 4)) 
	AS v1 (new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr);

INSERT INTO exercicio_gustavomonerat.prod_doc 
  (iddocumento, idproduto, qtd, val_un, val_desc, val_acr, val_bruto, val_liquido_proddoc)
SELECT
  new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr, new_val_un*new_qtd, (new_val_un*new_qtd)-(new_val_desc*new_qtd)+(new_val_acr*new_qtd)
FROM
	(VALUES (5, 5, 2, (SELECT val_venda_prod FROM exercicio_gustavomonerat.produto WHERE codigo = '0005'), 0, 0)) 
	AS v1 (new_iddocumento,new_idproduto, new_qtd, new_val_un, new_val_desc, new_val_acr);
	
UPDATE exercicio_gustavomonerat.documento
SET val_total = (select 
					sum(coalesce(val_bruto, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 1),
	val_liquid = (select 
					sum(coalesce(val_liquido_proddoc, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 1)
WHERE iddocumento = 1;

UPDATE exercicio_gustavomonerat.documento
SET val_total = (select 
					sum(coalesce(val_bruto, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 2),
	val_liquid = (select 
					sum(coalesce(val_liquido_proddoc, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 2)
WHERE iddocumento = 2;

UPDATE exercicio_gustavomonerat.documento
SET val_total = (select 
					sum(coalesce(val_bruto, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 3),
	val_liquid = (select 
					sum(coalesce(val_liquido_proddoc, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 3)
WHERE iddocumento = 3;

UPDATE exercicio_gustavomonerat.documento
SET val_total = (select 
					sum(coalesce(val_bruto, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 4),
	val_liquid = (select 
					sum(coalesce(val_liquido_proddoc, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 4)
WHERE iddocumento = 4;

UPDATE exercicio_gustavomonerat.documento
SET val_total = (select
					sum(coalesce(val_bruto, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 5),
	val_liquid = (select
					sum(coalesce(val_liquido_proddoc, 0)) FROM exercicio_gustavomonerat.prod_doc WHERE iddocumento = 5)
WHERE iddocumento = 5;