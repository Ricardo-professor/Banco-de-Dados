-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- PROJETO GRUPO 5 * BANCO DE DADOS -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

--Adilson Fernando
--Bruna Zimbrão
--Elaine Dutra
--Luan Terra
--Lucas Caldas
--Victor Anderson
--Taynara Aguiar

-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- RESET TABLES -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

CREATE SCHEMA IF NOT EXISTS projeto;

DROP TABLE IF EXISTS projeto.bairro CASCADE;
DROP TABLE IF EXISTS projeto.cidade CASCADE;
DROP TABLE IF EXISTS projeto.logradouro CASCADE;
DROP TABLE IF EXISTS projeto.telefone CASCADE;
DROP TABLE IF EXISTS projeto.usuario CASCADE;
DROP TABLE IF EXISTS projeto.endereco CASCADE;
DROP TABLE IF EXISTS projeto.categoria CASCADE;
DROP TABLE IF EXISTS projeto.pedido CASCADE;
DROP TABLE IF EXISTS projeto.produto CASCADE;
DROP TABLE IF EXISTS projeto.pedido_produto CASCADE;

-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- CREATE TABLES -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

CREATE SCHEMA IF NOT EXISTS projeto;

CREATE TABLE projeto.bairro(
    idbairro SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT null
);

CREATE TABLE projeto.cidade(
	idcidade SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT null,
	uf VARCHAR (2) NOT null
);

CREATE TABLE projeto.logradouro(
	idlogradouro SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT null,
	cep VARCHAR (11) NOT null
);

CREATE TABLE projeto.categoria(
	idcategoria SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT null,
	descricao TEXT
);

CREATE TABLE projeto.usuario(
	idusuario SERIAL PRIMARY KEY,
	codigo TEXT GENERATED ALWAYS AS ( 'USER' || LPAD(idusuario::TEXT, 3, '0') ) STORED,
	nome VARCHAR (255) NOT null,
	cpf VARCHAR (11) NOT null,
	nome_usuario VARCHAR (50) NOT null,
	email VARCHAR (50) NOT null,
 	data_nasc DATE NOT null,
	numero_endereco INT NOT null
);

CREATE TABLE projeto.pedido(
	idpedido SERIAL PRIMARY KEY,
	codigo TEXT GENERATED ALWAYS AS ( 'PED' || LPAD(idpedido::TEXT, 3, '0') ) STORED,
	data_pedido DATE NOT null,
	idusuario INT REFERENCES projeto.usuario (idusuario)
);

CREATE TABLE projeto.endereco(
	idendereco SERIAL PRIMARY KEY,
	idlogradouro INT REFERENCES projeto.logradouro (idlogradouro),
	idbairro INT REFERENCES projeto.bairro (idbairro),
	idcidade INT REFERENCES projeto.cidade (idcidade),
	idusuario INT REFERENCES projeto.usuario (idusuario)
);

CREATE TABLE projeto.telefone(
	idtelefone SERIAL PRIMARY KEY,
	numero VARCHAR (11) NOT null,
	idusuario INT REFERENCES projeto.usuario (idusuario)
);

CREATE TABLE projeto.produto(
    idproduto serial PRIMARY KEY,
    codigo TEXT GENERATED ALWAYS AS ( 'PROD' || LPAD(idproduto::TEXT, 3, '0') ) STORED,
    nome varchar (100) not null,
    descricao text not null,
    data_de_fabricacao date not null,
    quantidade_em_estoque int not null,
    valor_unitario numeric not null,
    idusuario int REFERENCES projeto.usuario (idusuario),
    idcategoria int REFERENCES projeto.categoria (idcategoria)
);

CREATE TABLE projeto.pedido_produto(
	id_pedido INT REFERENCES projeto.pedido (idpedido),
	id_produto INT REFERENCES projeto.produto (idproduto),
	quantidade INT NOT null,
	valor_unitario DOUBLE PRECISION Not null,
	valor_desconto DOUBLE PRECISION Not null,
	valor_acrescimo DOUBLE PRECISION Not null,
	valor_bruto  DOUBLE PRECISION Not null,
	valor_liquido DOUBLE PRECISION Not null
);