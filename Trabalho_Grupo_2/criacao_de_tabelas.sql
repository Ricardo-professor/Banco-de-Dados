--create database eCommerce_tech_tere;

create schema cadastrousuario;

create schema cadastroproduto;

create schema compra_venda;

create table cadastroProduto.categoria (
	idCategoria serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(50) not null,
	descricao varchar(500) not null
);


create table cadastroUsuario.usuario (
	idUsuario serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(100) not null,
	nomeUsuario varchar(16) unique not null, 
	cpf varchar(14) unique not null,
	email varchar(256) unique not null,
	dataNascimento date not null
);

create table cadastroUsuario.vendedor (
	idVendedor serial primary key,
	codigo varchar(10) unique not null,
	fk_idUsuario int references cadastroUsuario.usuario(idUsuario) unique not null,
	qtdvendida int not null,
	totalVendido double precision not null
);

create table cadastroProduto.produto (
	idProduto serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(100) not null,
	descricao varchar(500) not null,
	qtdEstoque int not null,
	dataFab date not null,
	valorUni double precision not null,	
	fk_idVendedor int references cadastroUsuario.vendedor(idVendedor) not null,
	fk_idCategoria int references cadastroProduto.categoria(idCategoria) not null
);

create table cadastroUsuario.cliente (
	idCliente serial primary key,
	codigo varchar(10) unique not null,
	fk_idUsuario int references cadastroUsuario.usuario(idUsuario) unique not null,
	totalGasto double precision not null,
	qtdComprada int not null	
);

create table cadastroUsuario.telefone (
	idTelefone serial primary key,
	codigo varchar(10) unique not null,
	fk_idUsuario int references cadastroUsuario.usuario(idUsuario) not null,
	numero varchar(20) unique not null
);

create table cadastroUsuario.logradouro (
	idLogradouro serial primary key,
	codigo varchar(10) unique not null,
	nomeRua varchar(100) unique not null
);


create table cadastroUsuario.bairro (
	idBairro serial primary key,
	codigo varchar(10) unique not null,
	nomeBairro varchar(100) unique not null
);


create table cadastroUsuario.cidade (
	idCidade serial primary key,
	codigo varchar(10) unique not null,
	nomeCidade varchar(60) unique not null
);


create table cadastroUsuario.uf_pais (
	idUfPais serial primary key,
	codigo varchar(10) unique not null,
	uf varchar(60) not null,
	pais varchar(100) not null,

	unique(uf,pais)
);


create table cadastroUsuario.endereco (
	idEndereco serial primary key,
	codigo varchar(10) unique not null,
	fk_idUsuario int references cadastroUsuario.usuario(idUsuario) not null,
	fk_idLogradouro int references cadastroUsuario.logradouro(idLogradouro) not null,
	numero int not null,
	fk_idBairro int references cadastroUsuario.bairro(idBairro) not null,
	fk_idCidade int references cadastroUsuario.cidade(idCidade) not null,
	cep varchar(20) not null,
	fk_idUfPais int references cadastroUsuario.uf_pais(idUfPais) not null
);


create table compra_venda.carrinho (
	idCarrinho serial primary key,
	codigo varchar(10) unique not null,
	fk_idVendedor int references cadastroUsuario.vendedor(idVendedor) not null,
	fk_idCliente int references cadastroUsuario.cliente(idCliente) not null,
	dataCarrinho date not null,
	qtdVendida int not null,
	totalCarrinho double precision not null
);


create table compra_venda.carrinhoItem (
	idItem serial primary key,
	codigo varchar(10) unique not null,
	fk_idCarrinho int references compra_venda.carrinho(idCarrinho) not null,
	fk_idProduto int references cadastroProduto.produto(idProduto) not null,
	qtdItem int not null,
	subTotal double precision not null
);




