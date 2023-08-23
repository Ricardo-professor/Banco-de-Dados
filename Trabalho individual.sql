create schema individual;

create table individual.documento(
	iddocumento serial primary key,
	numdocumento varchar(10) unique not null,
	datdocumento date not null,
	valtotal double precision,
	valiquido double precision	
);

create table individual.produto(
	idproduto serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(100) not null,
	vlcustoprod double precision,
	vlvendaprod double precision
);
create table individual.cliente(
	idcliente serial primary key,
	cod_cliente varchar(10) not null,
	nome_cliente varchar(100)not null	
);
create table individual.prod_doc(
	idprod_doc serial primary key,
	iddocumento int references individual.documento(iddocumento),
	idproduto int references individual.produto(idproduto),
	idcliente int references individual.cliente(idcliente),
	vlunit double precision,
	vldesc double precision,
	vlacresc double precision,
	vlbruto double precision,
	vlliquido double precision,
	quantidade int not null
);
