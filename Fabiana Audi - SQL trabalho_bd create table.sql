--create database Trabalho;
--create schema trabalho_bd;
create table trabalho_bd.clientes(
	idcliente serial primary key,
	nome_cliente varchar(100) not null
);
create table trabalho_bd.docs(
	iddocs serial primary key,
	numero_doc int not null,
	data_doc date not null,
	vltotal double precision not null,
	vlliquido double precision not null
);
create table trabalho_bd.produtos(
	idprodutos serial primary key,
	codigo int not null,
	nome_prod varchar (20) not null,
	vlcusto double precision not null,
	vlvenda double precision not null
);
create table trabalho_bd.prod_doc(
	idproddoc serial primary key,
	iddocs int references trabalho_bd.docs(iddocs),
	idprodutos int references trabalho_bd.produtos(idprodutos),
	vlunidade double precision not null,
	vlacr double precision not null,
	vlbruto double precision not null,
	vlliquido double precision not null
);