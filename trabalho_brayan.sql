--Criar uma tabela de documentos com os seguintes campos:
--id sequencial
--número do documento
--data do documento
--valor total
--valor liquido

CREATE TABLE exaula_bd.documentos (
    id SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(20),
    numero_documento VARCHAR(20),
    data_documento DATE,
    valor_total DOUBLE PRECISION,
    valor_liquido DOUBLE PRECISION
);

--Criar uma tabela de produtos com os seguintes campos:
--id sequencial
--codigo do produto
--nome do produto
--valor do custo do produto
--valor de venda do produto

CREATE TABLE exaula_bd.produtos (
    id SERIAL PRIMARY KEY,
    codigo_produto VARCHAR(20),
    nome_produto VARCHAR(100),
    valor_custo DOUBLE PRECISION,
    valor_venda DOUBLE PRECISION
);

-- Criar uma tabela de produtos do documento com os seguintes campos:
--id sequencial
--documento (relacionado à tabela de documentos - chave estrangeira)
--produto (relacionado à tabela de produtos - chave estrangeira)
--valor unitário
--valor de desconto
--valor de acréscimo
--valor bruto
--valor liquido

CREATE TABLE exaula_bd.produtos_documento (
    id SERIAL PRIMARY KEY,
    documento_id INT REFERENCES exaula_bd.documentos(id),
    produto_id INT REFERENCES exaula_bd.produtos(id),
    valor_unitario DOUBLE PRECISION,
    valor_desconto DOUBLE PRECISION,
    valor_acrescimo DOUBLE PRECISION,
    valor_bruto DOUBLE PRECISION,
    valor_liquido DOUBLE PRECISION
);

--Inserir 5 registros em cada tabela pelo menos */

INSERT INTO exaula_bd.documentos (nome_cliente, numero_documento, data_documento, valor_total, valor_liquido)
VALUES ('Rafael', 'DOC001', '2023-08-01', 150.00, 120.00);
INSERT INTO exaula_bd.documentos (nome_cliente, numero_documento, data_documento, valor_total, valor_liquido)
VALUES ('Fernando', 'DOC002', '2023-09-21', 50.00, 20.00);
INSERT INTO exaula_bd.documentos (nome_cliente, numero_documento, data_documento, valor_total, valor_liquido)
VALUES ('Ana', 'DOC003', '2023-09-03', 150.00, 70.00);
INSERT INTO exaula_bd.documentos (nome_cliente, numero_documento, data_documento, valor_total, valor_liquido)
VALUES ('Julia', 'DOC004', '2023-08-31', 500.00, 370.00);
INSERT INTO exaula_bd.documentos (nome_cliente, numero_documento, data_documento, valor_total, valor_liquido)
VALUES ('Anonimo', 'DOC005', '2023-10-11', 350.00, 250.00);

INSERT INTO exaula_bd.produtos (codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES ('HDWR', 'HD', 250.00, 420.00);
INSERT INTO exaula_bd.produtos (codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES ('HDWR', 'RAM', 110.00, 220.00);
INSERT INTO exaula_bd.produtos (codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES ('HDWR', 'CPU', 700.00, 1420.00);
INSERT INTO exaula_bd.produtos (codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES ('HDWR', 'Fonte', 50.00, 90.00);
INSERT INTO exaula_bd.produtos (codigo_produto, nome_produto, valor_custo, valor_venda)
VALUES ('PER', 'Mouse', 2.00, 10.00);

INSERT INTO exaula_bd.produtos_documento (documento_id, produto_id, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES (1, 1, 120.00, 0.00, 0.00, 120.00, 120.00);
INSERT INTO exaula_bd.produtos_documento (documento_id, produto_id, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES (2, 2, 20.00, 0.00, 0.00, 20.00, 20.00);
INSERT INTO exaula_bd.produtos_documento (documento_id, produto_id, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES (3, 3, 70.00, 0.00, 0.00, 70.00, 70.00);
INSERT INTO exaula_bd.produtos_documento (documento_id, produto_id, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES (4, 4, 370.00, 0.00, 0.00, 370.00, 370.00);
INSERT INTO exaula_bd.produtos_documento (documento_id, produto_id, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
VALUES (5, 5, 250.00, 0.00, 0.00, 250.00, 250.00);

--Atualizações:
--1- Alterar o nome do produto

UPDATE exaula_bd.produtos
SET nome_produto = 'SSD'
WHERE id = 1;

--2- Alterar o valor do produto

UPDATE exaula_bd.produto
SET valor_custo = 260.00
WHERE id = 1;

UPDATE exaula_bd.produto
SET valor_custo = 160.00
WHERE id = 2;

UPDATE exaula_bd.produto
SET valor_custo = 600.00
WHERE id = 3;

UPDATE exaula_bd.produto
SET valor_custo = 60.00
WHERE id = 4;

UPDATE exaula_bd.produto
SET valor_custo = 7.00
WHERE id = 5;



--3- Reajustar em 10% o valor de venda dos produtos 

UPDATE exaula_bd.produtos
SET valor_venda = valor_venda * 1.10;

--Consultas:
 
-- 1- Mostrar um documento com seus produtos (através de join)

SELECT d.*, pd.*, p.*
FROM exaula_bd.documentos d
JOIN exaula_bd.produtos_documento pd ON d.id = pd.documento_id
JOIN exaula_bd.produtos p ON pd.produto_id = p.id
WHERE d.id in (1, 2, 3, 4 ,5)

--2- Mostrar lista de produtos com valor maior que 100,00 */

SELECT * FROM exaula_bd.produtos WHERE valor_venda > 100.00;

-- 3- Mostrar um documento com o nome de cliente e o nome dos produtos */

SELECT d.numero_documento, d.nome_cliente,  p.nome_produto
FROM exaula_bd.documentos d
JOIN exaula_bd.produtos_documento pd ON d.id = pd.documento_id
JOIN exaula_bd.produtos p ON pd.produto_id = p.id
WHERE d.id IN (1, 2, 3, 4, 5);
