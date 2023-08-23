--create schema exerc;

drop table if exists exerc.documento cascade;
drop table if exists exerc.produto cascade;
drop table if exists exerc.produto_doc cascade;
drop table if exists exerc.cliente cascade;

create table exerc.cliente(
	idcliente serial primary key,
	cliente_nome varchar(150) not null
);

create table exerc.documento(
	iddocumento serial primary key,
	num_doc varchar(10) unique not null,
	data_doc date not null,
	idcliente int references exerc.cliente(idcliente),
	vl_total double precision,
	vl_liquido double precision
);

create table exerc.produto(
	idproduto serial primary key,
	cd_prod varchar(10) unique not null,
	nome_prod varchar(120) not null,
	vl_custo double precision,
	vl_venda double precision
);

create table exerc.produto_doc(
	idprodutodoc serial primary key,
	iddocumento int references exerc.documento(iddocumento),
	idproduto int references exerc.produto(idproduto),
	quantidade int,
	vl_un double precision,
	vl_desconto double precision,
	vl_acrescimo double precision,
	vl_bruto double precision,
	vl_liquido double precision
);
	