--ADILSON FERNANDO NEVES ORNELLAS - TRABALHO PONTO EXTRA BANCO DE DADOS

-- CODIGO PARA CRIAR O SCHEMA 

	-- CREATE SCHEMA trabalhoPontoExtra

-- CODIGO PARA APAGAR AS TABELAS SE PRECISO

-- 	DROP TABLE trabalhoPontoExtra.documento CASCADE;
-- 	DROP TABLE trabalhoPontoExtra.produto CASCADE;
-- 	DROP TABLE trabalhoPontoExtra.produtoDoDocumento CASCADE;

-- CRIANDO AS TABELAS

	CREATE TABLE trabalhoPontoExtra.documento(
		idDocumento serial unique not null primary key,
		numeroDoDocumento varchar(100) not null, 
		dataDoDocumento date not null,
		valorTotal double precision,
		valorTotalLiquido double precision
	);

	CREATE TABLE trabalhoPontoExtra.produto(
		idProduto serial unique not null primary key,
		codigoDoDocumento varchar(100) not null, 
		nomeDoDocumento varchar(100) not null,
		valorCustoDoProduto double precision not null,
		valorDeVendaProduto double precision not null
	);

	CREATE TABLE trabalhoPontoExtra.produtoDoDocumento(
		idProdutoDoDocumento serial unique not null primary key,
		idDocumento int REFERENCES trabalhoPontoExtra.documento(idDocumento), 
		idProduto int REFERENCES trabalhoPontoExtra.produto(idProduto),
		quantidade int not null,
		valorUnitario double precision not null,
		valorDeAcrescimo double precision not null,
		valorBruto double precision,
		valorLiquido double precision 
	);

-- INSERIR VALORES NAS TABELAS

	INSERT INTO trabalhoPontoExtra.documento
		(numeroDoDocumento, dataDoDocumento)
	VALUES
		('DOC001', '2023-08-01'),
		('DOC002', '2023-08-02'),
		('DOC003', '2023-08-03'),
		('DOC004', '2023-08-04'),
		('DOC005', '2023-08-05');

	INSERT INTO trabalhoPontoExtra.produto
		(codigoDoDocumento, nomeDoDocumento, valorCustoDoProduto, valorDeVendaProduto)
	VALUES
		('PROD001', 'Produto A', 50.00, 80.00),
		('PROD002', 'Produto B', 30.00, 50.00),
		('PROD003', 'Produto C', 20.00, 40.00),
		('PROD004', 'Produto D', 10.00, 25.00),
		('PROD005', 'Produto F', 15.00, 30.00);

	INSERT INTO trabalhoPontoExtra.produtoDoDocumento
		(idDocumento, idProduto, valorUnitario, quantidade,valorDeAcrescimo)
	VALUES
		(1, 1, 80.00, 2, 0),
		(1, 2, 50.00, 5, 0),
		(2, 3, 40.00, 8, 0),
		(3, 4, 25.00, 1, 0),
		(4, 5, 30.00, 6, 0);


-- UPDATE VALOR DO PRODUTO
	UPDATE trabalhoPontoExtra.produtoDoDocumento
		SET valorUnitario = 105.00
		WHERE idProdutoDoDocumento = 1;
-- UPDATE VALOR DE ACRESCIMO 
	UPDATE trabalhoPontoExtra.produtoDoDocumento
		SET valorDeAcrescimo = (valorUnitario*0.10)
		WHERE idProdutoDoDocumento <= 5;
-- UPDATE VALOR BRUTO DOS PRODUTOS 
	UPDATE trabalhoPontoExtra.produtoDoDocumento
		SET valorBruto = (valorUnitario*quantidade)
		WHERE idProdutoDoDocumento <= 5;
-- UPDATE VALOR LIQUIDOS DOS PRODUTOS 
	UPDATE trabalhoPontoExtra.produtoDoDocumento
		SET valorLiquido = (valorBruto+(valorDeAcrescimo*quantidade))
		WHERE idProdutoDoDocumento <= 5;

	SELECT * FROM trabalhoPontoExtra.produtoDoDocumento;


-- UPDATE DO NOME DO PRODUTO 	
	UPDATE trabalhoPontoExtra.produto
		SET nomeDoDocumento = 'Produto E'
		WHERE idProduto = 5;

	SELECT * FROM trabalhoPontoExtra.produto;

-- UPDATE DO VALOR TOTAL DO PRODUTO DO DOCUMENTO 

-- UPDATE DO VALOR LIQUIDO DO PRODUTO DO DOCUMENTO

-- MOSTRAR UM DOCUMENTO COM OS SEUS PRODUTOS (ATRAVÉS DO JOIN)


-- MOSTRAR LISTA DE PRODUTOS COM VALOR MAIOR QUE 100,00
	SELECT *
	FROM trabalhoPontoExtra.produtoDoDocumento
	WHERE valorUnitario  >= 100.00;
		
-- MOSTRAR UM DOCUMENTO COM O NOME DE CLIENTE E O NOME DOS PREÇOS


