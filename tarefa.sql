							----- DROPS TABELAS -----					
					
/*
DROP TABLE IF EXISTS tarefa.documento CASCADE;		
DROP TABLE IF EXISTS tarefa.produto CASCADE;		
DROP TABLE IF EXISTS tarefa.documento_produto CASCADE;
*/		

-----------------------------------------------------------------------------------------------------------------------------------------------
									----- CREATE TABLES -----		
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE SCHEMA tarefa;	
		
CREATE TABLE tarefa.documento(
	id SERIAL PRIMARY KEY,
	codigo TEXT GENERATED ALWAYS AS ( 'DOC' || LPAD(id::TEXT, 3, '0') ) STORED,
	nome VARCHAR(255) NOT NULL,
	numero_documento VARCHAR(14) NOT NULL,
	data_documento DATE NOT NULL,
	vl_total NUMERIC NOT NULL,
	vl_liquido NUMERIC NOT NULL
);

CREATE TABLE tarefa.produto(
	id SERIAL PRIMARY KEY,
    codigo TEXT GENERATED ALWAYS AS ( 'PROD' || LPAD(id::TEXT, 3, '0') ) STORED,
	nome VARCHAR(255) NOT NULL,
	vl_custo NUMERIC NOT NULL,
	vl_venda NUMERIC NOT NULL
);

CREATE TABLE tarefa.documento_produto(
	id SERIAL PRIMARY KEY,
	quantidade INT NOT NULL,
	vl_desconto NUMERIC NOT NULL,
	vl_acrescimo NUMERIC NOT NULL,
	vl_unit NUMERIC NOT NULL,
	vl_bruto NUMERIC NOT NULL,
	vl_liquido NUMERIC NOT NULL,
	id_documento INT,
	id_produto INT,
	FOREIGN KEY (id_documento) REFERENCES tarefa.documento(id),
	FOREIGN KEY (id_produto) REFERENCES tarefa.produto(id)
);

-----------------------------------------------------------------------------------------------------------------------------------------------
									----- INSERT VALUES -----		
-----------------------------------------------------------------------------------------------------------------------------------------------

-- inserir documentos
INSERT INTO tarefa.documento (numero_documento, nome, data_documento, vl_total, vl_liquido)
VALUES
('123.456.789-00', 'João Evangelista', '2023-08-23', 0.00, 0.00),
('234.567.890-01', 'Maria Silva', '2023-07-02', 0.00, 0.00),
('345.678.901-02', 'Pedro Moreira', '2022-02-16', 0.00, 0.00),
('456.789.012-03', 'Ana Silveira', '2021-11-30', 0.00, 0.00),
('567.890.123-04', 'Lucas Caldas', '2023-03-09', 0.00, 0.00);

-- inserir produtos					
INSERT INTO tarefa.produto (nome, vl_custo, vl_venda)
VALUES
('Smartphone', 800.00, 1200.00),
('Notebook', 1500.00, 2000.00),
('Smartwatch', 300.00, 500.00),
('Tablet', 600.00, 800.00),
('Fones de Ouvido', 100.00, 200.00),
('Caixa de Som', 80.00, 150.00),
('Smart TV', 1200.00, 1800.00),
('Videogame', 400.00, 2600.00),
('Dsektpo', 2600.00, 3000.00),
('Mnoitor', 700.00, 1000.00);

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	1, 6, 3, tarefa.produto.vl_venda,
	100, 50, 3 * tarefa.produto.vl_venda,
	(3 * tarefa.produto.vl_venda) - 100 + 50
FROM tarefa.produto
WHERE tarefa.produto.id = 6; -- Definir id do produto

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	2, 1, 5, tarefa.produto.vl_venda,
	118, 32, 5 * tarefa.produto.vl_venda,
	(5 * tarefa.produto.vl_venda) - 118 + 32
FROM tarefa.produto
WHERE tarefa.produto.id = 7;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	3, 4, 4, tarefa.produto.vl_venda,
	440, 55, 4 * tarefa.produto.vl_venda,
	(4 * tarefa.produto.vl_venda) - 440 + 55
FROM tarefa.produto
WHERE tarefa.produto.id = 4;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	4, 8, 2, tarefa.produto.vl_venda,
	33,	12, 2 * tarefa.produto.vl_venda,
	(2 * tarefa.produto.vl_venda) - 33 + 12
FROM tarefa.produto
WHERE tarefa.produto.id = 8;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	5, 6, 2, tarefa.produto.vl_venda,
	75,	32, 2 * tarefa.produto.vl_venda,
	(2 * tarefa.produto.vl_venda) - 75 + 32
FROM tarefa.produto
WHERE tarefa.produto.id = 6;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	3, 3, 1, tarefa.produto.vl_venda,
	189, 18, 1 * tarefa.produto.vl_venda,
	(1 * tarefa.produto.vl_venda) - 189 + 18
FROM tarefa.produto
WHERE tarefa.produto.id = 3;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	2, 7, 4, tarefa.produto.vl_venda,  
	210, 16, 4 * tarefa.produto.vl_venda,
	(4 * tarefa.produto.vl_venda) - 210 + 16
FROM tarefa.produto
WHERE tarefa.produto.id = 7;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	4, 8, 2, tarefa.produto.vl_venda,
	96,	50, 2 * tarefa.produto.vl_venda,
	(2 * tarefa.produto.vl_venda) - 96 + 50
FROM tarefa.produto
WHERE tarefa.produto.id = 8;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	5, 2, 5, tarefa.produto.vl_venda,
	120, 22, 5 * tarefa.produto.vl_venda,
	(5 * tarefa.produto.vl_venda) - 120 + 22
FROM tarefa.produto
WHERE tarefa.produto.id = 2;

-- Popular pedido_produto
INSERT INTO tarefa.documento_produto
	(id_documento, id_produto, quantidade, vl_unit, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
SELECT
	3, 9, 3, tarefa.produto.vl_venda,
	213, 52, 3 * tarefa.produto.vl_venda,
	(3 * tarefa.produto.vl_venda) - 213 + 52
FROM tarefa.produto
WHERE tarefa.produto.id = 9;

-----------------------------------------------------------------------------------------------------------------------------------------------
									----- UPDATES -----		
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Update do valor total e liquido de cada documento
UPDATE tarefa.documento
SET vl_total = (
    SELECT SUM(vl_bruto)
    FROM tarefa.documento_produto
    WHERE tarefa.documento_produto.id = tarefa.documento.id
), 
vl_liquido = (
    SELECT SUM(vl_liquido)
    FROM tarefa.documento_produto
    WHERE tarefa.documento_produto.id = tarefa.documento.id
);

	
-- (1) Alterar o nome do produto
UPDATE tarefa.produto SET nome = 'Computador' WHERE id = 9;
UPDATE tarefa.produto SET nome = 'Monitor' WHERE id = 10;

-- (2) Alterar o valor do produto

UPDATE tarefa.produto SET vl_venda = 3200 WHERE id = 9;
UPDATE tarefa.produto SET vl_venda = 1600 WHERE id = 10;

-- (3) Reajustar em 10% o valor de venda dos produtos
UPDATE tarefa.produto SET vl_venda = vl_venda * 1.1;

-----------------------------------------------------------------------------------------------------------------------------------------------
									----- QUERIES -----		
-----------------------------------------------------------------------------------------------------------------------------------------------

--verificar valores
SELECT * FROM tarefa.documento;
SELECT * FROM tarefa.produto;
SELECT * FROM tarefa.documento_produto;

-- (1) Mostrar um documento com seus produtos (através de join)
SELECT 	tarefa.documento.codigo AS "Código",
		tarefa.documento.nome AS "Cliente",
		tarefa.documento.numero_documento AS "Numero do Documento",	
		STRING_AGG(tarefa.produto.nome, ', ') AS "Lista de Compras", -- referência https://www.sqlservertutorial.net/sql-server-string-functions/sql-server-string_agg-function/
		CONCAT ('R$ ', SUM(tarefa.documento.vl_total)) AS "Valor Bruto Total",
		CONCAT ('R$ ', SUM(tarefa.documento.vl_liquido)) AS "Valor Liquido Total"
		--tarefa.documento.vl_liquido AS "Valor Liquido"
FROM tarefa.documento_produto
INNER JOIN tarefa.produto ON tarefa.documento_produto.id_produto = tarefa.produto.id
INNER JOIN tarefa.documento ON tarefa.documento_produto.id_documento = tarefa.documento.id
GROUP BY tarefa.documento.numero_documento,
		 tarefa.documento.codigo,
		 tarefa.documento.nome,
		 tarefa.documento.vl_liquido,
		 tarefa.documento.vl_total
ORDER BY tarefa.documento.codigo

-- (2) Mostrar lista de produtos com valor maior que 1000,00
SELECT 	tarefa.produto.codigo AS "Código",
		tarefa.produto.nome AS "Produto",
		CONCAT ( 'R$ ', ROUND(tarefa.produto.vl_venda,2)) AS "Valor Unitário" 
FROM tarefa.produto
WHERE tarefa.produto.vl_venda > 1000
ORDER BY tarefa.produto.vl_venda desc

-- (3) Mostrar um documento com o nome de cliente e o nome dos produtos
SELECT 	tarefa.documento.codigo AS "Código",
		tarefa.documento.nome AS "Nome do Cliente",
		STRING_AGG(tarefa.produto.nome, ', ') AS "Lista de Compras" -- referência https://www.sqlservertutorial.net/sql-server-string-functions/sql-server-string_agg-function/
FROM tarefa.documento_produto
INNER JOIN tarefa.produto ON tarefa.documento_produto.id_produto = tarefa.produto.id
INNER JOIN tarefa.documento ON tarefa.documento_produto.id_documento = tarefa.documento.id
--WHERE tarefa.documento.id = 3
GROUP BY tarefa.documento.numero_documento,
		 tarefa.documento.nome,
		 tarefa.documento.codigo
ORDER BY tarefa.documento.codigo

-----------------------------------------------------------------------------------------------------------------------------------------------
									----- EXTRAS! -----		
-----------------------------------------------------------------------------------------------------------------------------------------------

-- agrupar clientes por numero de pedidos
SELECT 	tarefa.documento.numero_documento AS "Codigo",
COUNT(tarefa.documento_produto.id) AS "Numero de Pedidos"
FROM tarefa.documento_produto
LEFT JOIN tarefa.documento	
ON tarefa.documento_produto.id_documento = tarefa.documento.id
GROUP BY tarefa.documento.numero_documento
ORDER BY "Numero de Pedidos" DESC
   		  
-- listar pedidos, agrupar valor das vendas totais e itens comprados
SELECT  tarefa.documento.numero_documento AS "Documento",
		tarefa.documento.data_documento AS "Expedição",
		CONCAT ( 'R$ ', SUM(tarefa.documento_produto.vl_liquido)) AS "Valor Total",
		STRING_AGG(tarefa.produto.nome, ', ') AS "Lista de Compras"
FROM tarefa.documento_produto
--INNER JOIN PEDIDOS
INNER JOIN tarefa.produto ON tarefa.documento_produto.id_produto = tarefa.produto.id
INNER JOIN tarefa.documento ON tarefa.documento_produto.id_documento = tarefa.documento.id
--GROUPBY
GROUP BY 	tarefa.documento.numero_documento,
			tarefa.documento.data_documento