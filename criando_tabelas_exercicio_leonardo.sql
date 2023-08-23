create schema exe_individual

create table exe_individual.documento(
	iddocumento serial primary key,
	numero_documento int not null,
	data_documento date not null,
	vltotal double precision,
	vlliquido double precision
);

create table exe_individual.produto(
	idproduto serial primary key,
	codigo int not null,
	nome_produto varchar(20) not null,
	vlcusto double precision not null,
	vlvenda double precision not null	
);

create table exe_individual.cliente(
	idcliente serial primary key,
	cod_cliente varchar(10) not null,
	nome_cliente varchar(100) not null
);

create table exe_individual.produtodocumento(
	idprodutodocumento serial primary key,
	iddocumento int references exe_individual.documento(iddocumento),
	idcliente int references exe_individual.cliente(idcliente),
	idproduto int references exe_individual.produto(idproduto),
	vlunitario double precision not null,
	quantidae int not null,
	vldesconto double precision not null,
	vlacrescimo double precision not null,
	vlbruto double precision not null,
	vlliquido double precision not null	
);







--select * from exe_individual.documentos
--select * from exe_individual.produtos
--select * from exe_individual.produtosdocumentos