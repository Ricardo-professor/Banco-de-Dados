CREATE TABLE atividade.cliente(
	idcliente serial PRIMARY KEY,
	nmcliente varchar(45) NOT null
);

CREATE TABLE atividade.documento(
	iddocumento serial PRIMARY KEY,
	idcliente int REFERENCES atividade.cliente(idcliente),
	num_doc varchar(10) unique not null,
	data_doc date NOT null,
	vl_total double precision,
	vl_liquid double precision	
);

CREATE TABLE atividade.produto(
	idproduto serial PRIMARY KEY,
	cod_prod varchar(15) UNIQUE NOT null,
	nmprod varchar(45) NOT null,
	vl_custo double precision,
	vl_venda double precision
);

CREATE TABLE atividade.produto_doc(
	iddoc_prod serial PRIMARY KEY,
	iddocumento int REFERENCES atividade.documento(iddocumento),
	idproduto int REFERENCES atividade.produto(idproduto),
	qtd int NOT null CHECK (qtd > 0),
	vl_unid double precision,
	vl_desc double precision,
	vl_acres double precision,
	vl_bruto double precision,
	vl_liquid_docprod double precision
);

INSERT INTO atividade.cliente
	(nmcliente)
VALUES
    ('Mariana'),
    ('Rafael'),
    ('Aline'),
    ('Lucas'),
    ('Carolina'),
    ('Fernando'),
    ('Beatriz');
	
INSERT INTO atividade.produto
	(cod_prod, nmprod, vl_custo, vl_venda)
VALUES
	('0001', 'Óculos', 45.75, 89.99),
    ('0002', 'Cinto', 18.50, 32.75),
    ('0003', 'Relógio', 112.35, 240.50),
    ('0004', 'Bolsa', 65.20, 135.75),
    ('0005', 'Chapéu', 22.10, 45.60),
    ('0006', 'Sandália', 53.80, 99.25),
    ('0007', 'Carteira', 30.15, 59.90);

INSERT INTO atividade.documento
    (idcliente, num_doc, data_doc, vl_total, vl_liquid)
VALUES
    (1, '0001', '2023-01-10', 0, 0),
    (2, '0002', '2023-02-15', 0, 0),
    (3, '0003', '2023-03-20', 0, 0),
    (4, '0004', '2023-04-25', 0, 0),
    (5, '0005', '2023-05-05', 0, 0);
	
INSERT INTO atividade.produto_doc	
	(iddocumento, idproduto, qtd, vl_unid, vl_desc, vl_acres, vl_bruto, vl_liquid_docprod)
VALUES
	(1, 1, 3, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 1), 0.07, 0.03, 0, 0),
	(1, 2, 4, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 2), 0.04, 0.02, 0, 0),
	(2, 3, 7, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 3), 0.02, 0.05, 0, 0),
	(3, 4, 2, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 4), 0.01, 0.07, 0, 0),
	(4, 5, 11, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 5), 0.06, 0.01, 0, 0),
	(5, 6, 5, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 6), 0.03, 0.04, 0, 0),
    (4, 7, 6, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 7), 0.05, 0.06, 0, 0),
    (3, 7, 9, (SELECT vl_venda FROM atividade.produto WHERE idproduto = 7), 0.03, 0.01, 0, 0);
	

UPDATE atividade.produto_doc SET vl_bruto =
	(vl_unid * qtd) WHERE iddoc_prod = 1; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 1;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 2;
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 2;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 3; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 3;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 4; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 4;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 5; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 5;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 6; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 6;
	
UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 7; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 7;

UPDATE atividade.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 8; 
UPDATE atividade.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 8;

UPDATE atividade.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM atividade.produto_doc WHERE iddocumento = 1) WHERE iddocumento = 1;
UPDATE atividade.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM atividade.produto_doc WHERE iddocumento = 2) WHERE iddocumento = 2;
UPDATE atividade.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM atividade.produto_doc WHERE iddocumento = 3) WHERE iddocumento = 3;
UPDATE atividade.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM atividade.produto_doc WHERE iddocumento = 4) WHERE iddocumento = 4;
UPDATE atividade.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM atividade.produto_doc WHERE iddocumento = 5) WHERE iddocumento = 5;

UPDATE atividade.documento SET vl_liquid =(
	SELECT SUM(vl_liquid_docprod) FROM atividade.produto_doc WHERE iddocumento = 1) WHERE iddocumento = 1;
UPDATE atividade.documento SET vl_liquid =(
	SELECT SUM(vl_liquid_docprod) FROM atividade.produto_doc WHERE iddocumento = 2) WHERE iddocumento = 2;
UPDATE atividade.documento SET vl_liquid =(
	SELECT SUM(vl_liquid_docprod) FROM atividade.produto_doc WHERE iddocumento = 3) WHERE iddocumento = 3;
UPDATE atividade.documento SET vl_liquid =(
	SELECT SUM(vl_liquid_docprod) FROM atividade.produto_doc WHERE iddocumento = 4) WHERE iddocumento = 4;
UPDATE atividade.documento SET vl_liquid =(
	SELECT SUM(vl_liquid_docprod) FROM atividade.produto_doc WHERE iddocumento = 5) WHERE iddocumento = 5;
