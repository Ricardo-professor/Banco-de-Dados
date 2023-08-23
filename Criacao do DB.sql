--CREATE SCHEMA exercicio_gustavomonerat;

DROP TABLE IF EXISTS exercicio_gustavomonerat.documento CASCADE;
DROP TABLE IF EXISTS exercicio_gustavomonerat.produto CASCADE;
DROP TABLE IF EXISTS exercicio_gustavomonerat.prod_doc CASCADE;
DROP TABLE IF EXISTS exercicio_gustavomonerat.cliente CASCADE;

CREATE TABLE exercicio_gustavomonerat.cliente (
	idcliente serial PRIMARY KEY,
	nome_cli varchar(50) NOT null
);

CREATE TABLE exercicio_gustavomonerat.documento (
	iddocumento serial PRIMARY KEY,
	data_doc date NOT null,
	val_total double precision,
	val_liquid double precision,
	idcliente int REFERENCES exercicio_gustavomonerat.cliente(idcliente)
);

CREATE TABLE exercicio_gustavomonerat.produto (
	idproduto serial PRIMARY KEY,
	codigo varchar(10) UNIQUE NOT null,
	nome_prod varchar(50) NOT null,
	val_custo_prod double precision,
	val_venda_prod double precision
);

CREATE TABLE exercicio_gustavomonerat.prod_doc (
	idprod_doc serial PRIMARY KEY,
	iddocumento int REFERENCES exercicio_gustavomonerat.documento(iddocumento),
	idproduto int REFERENCES exercicio_gustavomonerat.produto(idproduto),
	qtd int NOT null,
	val_un double precision,
	val_desc double precision,
	val_acr double precision,
	val_bruto double precision,
	val_liquido_proddoc double precision
);