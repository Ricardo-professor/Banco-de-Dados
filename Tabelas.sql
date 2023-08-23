/* Aluno: Douglas do Amaral Rocha Mariano

Criar uma tabela de documentos com os seguintes campos:

id sequencial
número do documento
data do documento
valor total
valor liquido

Criar uma tabela de produtos com os seguintes campos:

id sequencial
codigo do produto
nome do produto
valor do custo do produto
valor de venda do produto

Criar uma tabela de produtos do documento com os seguintes campos:

id sequencial
documento (relacionado à tabela de documentos - chave estrangeira)
produto (relacionado à tabela de produtos - chave estrangeira)
valor unitário
valor de desconto
valor de acréscimo
valor bruto
valor liquido
*/

create schema douglas;

create table douglas.documentos (
	iddocumento serial primary key,
	nmdocumento integer not null,
	dtdocumento date not null,
	valortotal double precision,
	valorliquido double precision
);

create table douglas.produtos (
	idproduto serial primary key,
	codigo integer not null,
	nome varchar(100) not null,
	valorcusto double precision,
	valorvenda double precision
);

create table douglas.clientes (
	idcliente serial primary key,
	codigo varchar(10) not null,
	nome varchar(100)
);

create table douglas.produtosdocumento (
	idprodutosdocumento serial primary key,
	iddocumento integer references douglas.documentos(iddocumento),
	idproduto integer references douglas.produtos(idproduto),
	idcliente integer references douglas.clientes(idcliente),
	quantidade integer,
	valorunit double precision,
	valordesc double precision,
	valoracresc double precision,
	valorbruto double precision,
	valorliquido double precision
);
