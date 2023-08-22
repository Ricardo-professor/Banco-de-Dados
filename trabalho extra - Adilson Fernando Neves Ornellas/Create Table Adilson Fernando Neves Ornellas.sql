--ADILSON FERNANDO NEVES ORNELLAS - TRABALHO PONTO EXTRA BANCO DE DADOS

CREATE SCHEMA trabalhoPontoExtra

CREATE TABLE trabalhoPontoExtra.documento(
	idDocumento serial not null primary key,
	numeroDoDocumento serial not null, 
	dataDoDocumento date not null,
	valorTotal double precision not null,
	valorLiquido double precision not null
);

CREATE TABLE trabalhoPontoExtra.produtos(
	idProduto serial not null primary key,
	codigoDoDocumento serial not null, 
	nomeDoDocumento varchar(100) not null,
	valorCustoDoProduto double precision not null,
	valorDeVendaProduto double precision not null
);