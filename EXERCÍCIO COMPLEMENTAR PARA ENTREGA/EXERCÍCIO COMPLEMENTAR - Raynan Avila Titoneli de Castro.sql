-- CRIAÇÃO DO SCHEMA ------------------------------------------------------------------------

-CREATE SCHEMA tarefa

-- CRIAÇÃO DAS TABELAS ----------------------------------------------------------------------


CREATE TABLE tarefa.documento(
	iddocumento serial PRIMARY KEY,
	numdoc varchar (100) UNIQUE NOT NULL,
	datadoc date NOT NULL,
	vltotal double precision,
	vlliquido double precision
	);
	
CREATE TABLE tarefa.produto(
	idproduto serial PRIMARY KEY,
	codproduto varchar(10) NOT NULL,
	nomeprod varchar (100),
	vlcusto double precision,
	vlvenda double precision
	);

CREATE TABLE tarefa.cliente(
	idcliente SERIAL PRIMARY KEY,
	codcliente varchar (10) NOT NULL,
	nomecliente varchar (100)

	);
	
CREATE TABLE tarefa.docprod(
	iddocprod serial PRIMARY KEY,
	iddocumento int REFERENCES tarefa.documento (iddocumento),
	idproduto int REFERENCES tarefa.produto (idproduto),
	quantidade varchar (10),
	vlunit double precision,
	vldesconto double precision,
	vlacrescimo double precision,
	vlbruto double precision,
	vlliquido double precision
	);



-- ALIMENTAÇÃO INICIAL----------------------------------------------------------------------


INSERT INTO tarefa.produto
	(codproduto, nomeprod, vlcusto, vlvenda)
	
VALUES
	('01', 'papel', 10, 15),
	('02', 'madeira', 20, 30),
	('03', 'metal', 5, 10),
	('04', 'água', 8, 20),
	('05', 'fogo', 25, 50);
	

	
INSERT INTO tarefa.cliente
	(codcliente, nomecliente)
	
VALUES
	('01', 'joão'),
	('02', 'fulão'),
	('03', 'tião'),
	('04', 'alexa'),
	('05', 'Nieve');



INSERT INTO tarefa.docprod
	(iddocumento, idproduto, quantidade, vlunit, vldesconto, vlacrescimo, vlbruto, vlliquido)

VALUES
	(1, 1, 5, 15, 5, 10, 75, 80),
	(2, 2, 1, 30, 0, 0, 30, 30),
	(3, 3, 11, 10, 0, 10, 110, 120),
	(4, 4, 1, 20, 5, 0, 20, 15),
	(5, 5, 6, 50, 10, 5, 300, 295);
	

INSERT INTO tarefa.documento
	(numdoc, datadoc)
VALUES
	('01', '22-08-2023'),
	('02', '23-08-2023'),
	('03', '24-08-2023'),
	('04', '25-08-2023'),
	('05', '26-08-2023');
	
--FIM DA ALIMENTAÇÃO INICIAL ----------------------------------------------------------------







/*SELECT * FROM tarefa.documento
	
UPDATE tarefa.documento SET vlliquido = 
	(SELECT
	SUM (docprod.vlliquido) from tarefa.docprod AS docprod
	LEFT JOIN tarefa.documento AS doc ON doc.iddocprod = docprod.iddocprod
WHERE doc.numdoc = '1'
	GROUP BY doc.numdoc)
*/






-- ADIÇÃO DE COLUNA + UPDATES ---------------------------------------------------------------

ALTER TABLE tarefa.documento ADD COLUMN idcliente int REFERENCES tarefa.cliente(idcliente);

	UPDATE tarefa.documento SET idcliente = 1 where iddocumento = 1;
	
	UPDATE tarefa.documento SET idcliente = 2 where iddocumento = 2;
	
	UPDATE tarefa.documento SET idcliente = 3 where iddocumento = 3;
	
	UPDATE tarefa.documento SET idcliente = 4 where iddocumento = 4;
	
	UPDATE tarefa.documento SET idcliente = 5 where iddocumento = 5;


-- AUMENTO DOS PREÇOS E TROCA DE NOME DO PRODUTO ----------------------------------------------


	UPDATE tarefa.produto SET nomeprod = 'metal mais caro que o metal de antes' WHERE idproduto = 3
	
	UPDATE tarefa.produto SET vlcusto = 100 WHERE idproduto = 3
	UPDATE tarefa.produto SET vlvenda = 150 WHERE idproduto = 3
	
	UPDATE tarefa.docprod SET vlunit = ROUND(vlunit * 1.10);
	UPDATE tarefa.docprod SET vlbruto = ROUND(vlbruto * 1.10);
	UPDATE tarefa.docprod SET vlliquido = ROUND(vlliquido * 1.10);
	
--QUERIES-----------------------------------------------------------------------------------

--prod >= R$100-----------------------------------------------


SELECT * FROM tarefa.produto WHERE vlvenda >= 100.00;
	
	
--lista de produtos-------------------------------------------


SELECT
	prod.codproduto "código do produto", prod.nomeprod "nome do produto", prod.vlvenda "preço do produto"
FROM tarefa.docprod AS docprod
	LEFT JOIN tarefa.produto AS prod ON prod.idproduto = docprod.idproduto
ORDER BY prod.codproduto


--clientes e produtos-----------------------------------------


SELECT
	cli.nomecliente "nomes dos clientes", prod.nomeprod "nomes dos produtos"
FROM tarefa.cliente AS cli
	LEFT JOIN tarefa.documento AS doc ON doc.idcliente = cli.idcliente
	LEFT JOIN tarefa.docprod AS docprod ON docprod.iddocumento = doc.iddocumento
	LEFT JOIN tarefa.produto AS prod ON prod.idproduto = docprod.idproduto




--fim--
/*

select * from tarefa.produto
select * from tarefa.cliente
select * from tarefa.documento
select * from tarefa.docprod

*/