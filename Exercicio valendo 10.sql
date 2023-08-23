CREATE SCHEMA exercicio

CREATE TABLE exercicio.documentos (
	id_documento SERIAL PRIMARY KEY,
	numero_documento VARCHAR(15) NOT NULL,
	data_documento DATE NOT NULL,
	valor_total DOUBLE PRECISION NOT NULL,
	valor_liquido DOUBLE PRECISION NOT NULL
);

CREATE TABLE exercicio.produtos (
	id_produto SERIAL PRIMARY KEY,
	codigo_produto INT NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	valor_custo DOUBLE PRECISION NOT NULL,
	valor_venda DOUBLE PRECISION NOT NULL
);

CREATE TABLE exercicio.clientes (
	ID SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(20) NOT NULL,
	tel_whatsapp VARCHAR(20) NOT NULL
);

CREATE TABLE exercicio.prodocumento (
	ID SERIAL PRIMARY KEY,
	id_documento INT REFERENCES exercicio.documentos,
	id_produto INT REFERENCES exercicio.produtos,
	id_clientes INT REFERENCES exercicio.clientes,
	valor_unitario DOUBLE PRECISION NOT NULL,
	valor_desconto DOUBLE PRECISION NOT NULL,
	valor_acrescimo DOUBLE PRECISION NOT NULL,
	valor_bruto DOUBLE PRECISION NOT NULL,
	valor_liquido DOUBLE PRECISION NOT NULL
);



INSERT INTO exercicio.produtos
	(codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES
	('0001', 'Bolsa', 110, 200),
	('0002', 'Brinco', 30, 100),
	('0003', 'Sapato', 50, 200),
	('0004', 'Vestido', 300, 750),
	('0005', 'Colar', 90, 140)
	
	
	
INSERT INTO exercicio.documentos
	(numero_documento, data_documento, valor_total, valor_liquido)
VALUES
	('0010', '2023-08-22', 20.00, 18.00),
	('0020', '2023-08-22', 300, 230),
	('0030', '2023-08-22', 50.00, 37.00),
	('0040', '2023-08-22', 80.00, 60.00),
	('0050', '2023-08-22', 10.00, 8.00)
	
	
INSERT INTO exercicio.prodocumento
	(id_documento, id_produto, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES
	(1, 1, 300, 260.00, 250.00, 310.50, 200.00),
	(2, 2, 65.00, 55.00, 350, 500, 200),
	(3, 3, 210, 150, 70, 90, 50),
	(4, 4, 20.00, 10.00, 9.00, 12.00, 8.00),
	(5, 5, 4.00, 2.00, 1.50, 3.00, 2.50)
	
--1
				
	SELECT doc.numero_documento, pro.nome_produto, pd.valor_unitario, pd.valor_desconto, pd.valor_acrescimo, pd.valor_bruto, pd.valor_liquido
FROM exercicio.documentos doc
JOIN exercicio.prodocumento pd ON doc.id_documento = pd.id_documento
JOIN exercicio.produtos pro ON pd.id_produto = pro.id_produto
WHERE doc.id_documento = 1;


--2

	SELECT * FROM exercicio.produtos WHERE valor_venda > 100;
	
--3

	SELECT doc.numero_documento, cl.nome_cliente, cl.tel_whatsapp, pro.nome_produto, pd.valor_unitario, pd.valor_desconto, pd.valor_acrescimo, pd.valor_liquido
FROM exercicio.documentos doc
JOIN "exercicio"."prodocumento" pd ON doc.id_documento = pd.id_documento
JOIN exercicio.produtos pro ON pd.id_produto = pro.id_produto
JOIN exercicio.clientes cl ON pd.id_clientes = cl.id
WHERE doc.id_documento = 5;



--1

UPDATE exercicio.produtos SET nome_produto = 'Salto' WHERE id_produto = 3;
--2

UPDATE exercicio.produtos SET valor_venda = '200' WHERE id_produto = 2

--3

UPDATE exercicio.produtos SET valor_custo = '1.00'
