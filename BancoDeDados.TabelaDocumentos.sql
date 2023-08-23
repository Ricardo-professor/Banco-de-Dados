--CREATE SCHEMA ativluan

										--CRIAÇÃO DAS TABELAS--

CREATE TABLE ativluan.documento (
	iddoc SERIAL PRIMARY KEY,
	doc_num TEXT GENERATED ALWAYS AS ( 'DOC' || LPAD(iddoc::TEXT, 3, '0') ) STORED,
	cl_nome VARCHAR (255) NOT null,
	doc_data DATE NOT null,
	val_total NUMERIC NOT null,
	val_liquido NUMERIC NOT null
);

CREATE TABLE ativluan.produto (
	idprod SERIAL PRIMARY KEY,
	prod_cod TEXT GENERATED ALWAYS AS ( 'PROD' || LPAD(idprod::TEXT, 3, '0') ) STORED,
	prod_nome VARCHAR (100) NOT null,
	prod_desc TEXT NOT null,
	val_custo NUMERIC NOT null,
	val_venda NUMERIC NOT null
);

CREATE TABLE ativluan.prod_itens_doc (
	idprod_itens_doc SERIAL PRIMARY KEY,
	iddoc INT REFERENCES ativluan.documento (iddoc),
	idprod INT REFERENCES ativluan.produto (idprod),
	item_quant INT NOT null,
	val_un NUMERIC NOT null,
	val_desc NUMERIC NOT null,
	val_acresc NUMERIC NOT null,
	val_bruto NUMERIC NOT null,
	val_liquido NUMERIC NOT null
);

										--INSERÇÃO DE DADOS NAS TABELAS--

INSERT INTO ativluan.documento 
	(cl_nome, doc_data, val_total, val_liquido)
VALUES
    ('João Silva', '2023-08-23', 0, 0),
    ('Maria Santos', '2023-08-24', 0, 0),
    ('Pedro Alves', '2023-08-25', 0, 0),
    ('Ana Oliveira', '2023-08-26', 0, 0),
    ('Luiz Pereira', '2023-08-27', 0, 0);
	
INSERT INTO ativluan.produto 
	(prod_nome, prod_desc, val_custo, val_venda)
VALUES
    ('Camiseta de Algodão', 'Camiseta básica de algodão, disponível em várias cores.', 10.00, 25.00),
    ('Sapatos Esportivos', 'Tênis esportivos leves e confortáveis para corrida e caminhada.', 30.00, 70.00),
    ('Mochila Resistente', 'Mochila durável e espaçosa, perfeita para viagens e aventuras ao ar livre.', 25.00, 60.00),
    ('Smartphone Android', 'Telefone Android de última geração com uma câmera de alta resolução e tela brilhante.', 200.00, 400.00),
    ('Fone de Ouvido Bluetooth', 'Fone de ouvido sem fio com cancelamento de ruído, qualidade de som excepcional.', 50.00, 120.00);
	
INSERT INTO ativluan.prod_itens_doc 
	(iddoc, idprod, item_quant, val_un, val_desc, val_acresc, val_bruto, val_liquido)
SELECT 
    1, 1, 4, p.val_venda, 20.00, 0.00, (p.val_venda * 4), (p.val_venda * 4) - 20.00 + 0.00 
FROM ativluan.produto p
WHERE p.idprod = 1
UNION ALL
SELECT 
    1, 2, 3, p.val_venda, 21.00, 3.00, (p.val_venda * 3), (p.val_venda * 3) - 21.00 + 3.00 
FROM ativluan.produto p
WHERE p.idprod = 2
UNION ALL
SELECT 
    2, 3, 2, p.val_venda, 0.00, 12.00, (p.val_venda * 2), (p.val_venda * 2) - 0.00 + 12.00 
FROM ativluan.produto p
WHERE p.idprod = 3
UNION ALL
SELECT 
    2, 4, 1, p.val_venda, 0.00, 40.00, (p.val_venda * 1), (p.val_venda * 1) - 0.00 + 40.00 
FROM ativluan.produto p
WHERE p.idprod = 4
UNION ALL
SELECT 
    3, 5, 4, p.val_venda, 48.00, 6.00, (p.val_venda * 4), (p.val_venda * 4) - 48.00 + 6.00 
FROM ativluan.produto p
WHERE p.idprod = 5
UNION ALL
SELECT 
    5, 2, 1, p.val_venda, 3.00, 14.00, (p.val_venda * 1), (p.val_venda * 1) - 3.00 + 14.00 
FROM ativluan.produto p
WHERE p.idprod = 2
UNION ALL
SELECT 
    4, 5, 3, p.val_venda, 36.00, 7.00, (p.val_venda * 1), (p.val_venda * 1) - 36.00 + 7.00 
FROM ativluan.produto p
WHERE p.idprod = 5;

UPDATE ativluan.documento AS d
SET val_total = (
    SELECT SUM(val_bruto)
    FROM ativluan.prod_itens_doc AS pid
    WHERE pid.iddoc = d.iddoc
), 
val_liquido = (
    SELECT SUM(val_liquido)
    FROM ativluan.prod_itens_doc AS pid
    WHERE pid.iddoc = d.iddoc
);

										--CONSULTAS TABELAS--

SELECT
	doc.doc_num AS "Numero do Documento",
	doc.doc_data AS "Data do Documento",
	STRING_AGG(prod.prod_nome, ', ') AS "Nome dos Produtos",
	doc.val_total AS "Valor Total do Documento",
	doc.val_liquido AS "Valor Liquido do Documento"

FROM ativluan.prod_itens_doc AS pid

INNER JOIN ativluan.documento AS doc ON pid.iddoc = doc.iddoc
INNER JOIN ativluan.produto AS prod ON pid.idprod = prod.idprod

GROUP BY 
	doc.doc_num,
	doc.doc_data,
	doc.val_total,
	doc.val_liquido
ORDER BY 
	doc.doc_num
	

SELECT
	prod.prod_nome AS "Nome do Produto",
	prod.val_venda AS "Valor da Venda"
	
FROM ativluan.produto AS prod
WHERE prod.val_venda > 100.00


SELECT
	doc.doc_num AS "Numero do Documento",
	doc.doc_data AS "Data do Documento",
	doc.cl_nome AS "Nome do Cliente",
	STRING_AGG(prod.prod_nome, ', ') AS "Nome dos Produtos"

FROM ativluan.prod_itens_doc AS pid

INNER JOIN ativluan.documento AS doc ON pid.iddoc = doc.iddoc
INNER JOIN ativluan.produto AS prod ON pid.idprod = prod.idprod

GROUP BY 
	doc.doc_num,
	doc.doc_data,
	doc.cl_nome
ORDER BY 
	doc.doc_num

										--ATUALIZAÇÕES DA TABELA--

UPDATE ativluan.produto SET prod_nome = 'Camiseta de Algodão Lisa' WHERE idprod = 1;

UPDATE ativluan.produto SET val_venda = 30.00 WHERE idprod = 1;

UPDATE ativluan.produto SET val_venda = ROUND(val_venda * 0.90, 2);