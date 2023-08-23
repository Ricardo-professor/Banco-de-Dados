CREATE SCHEMA ecommerce;

CREATE TABLE ecommerce.cidade (
    idcidade serial primary key,
    cidade varchar(20) not NULL,
    uf varchar(2) not NULL
);

CREATE TABLE ecommerce.bairro(
    idbairro serial PRIMARY KEY,
    nome varchar(100) NOT NULL
); 

CREATE TABLE ecommerce.pessoa(
    idpessoa serial PRIMARY KEY,
    nome varchar(120) NOT NULL,
    cpf varchar(14) NOT NULL
);

CREATE TABLE ecommerce.categoria (
    idcategoria serial PRIMARY KEY,
	codigo varchar(10) UNIQUE NOT NULL,
    nome varchar(100) NOT NULL,
    descricao text
    
);

CREATE TABLE ecommerce.funcionario(
    idfuncionario serial PRIMARY KEY,
    codigo varchar(10) UNIQUE NOT NULL,
    idpessoa int REFERENCES ecommerce.pessoa(idpessoa) NOT NULL
);

CREATE TABLE ecommerce.cliente(
    idcliente serial PRIMARY KEY,
    codigo varchar(10) UNIQUE NOT NULL,
    nomeusuario varchar(100) NOT NULL,
    dtnascimento varchar(10) NOT NULL,
    nmendereco varchar(200) NOT NULL,
    idpessoa int REFERENCES ecommerce.pessoa (idpessoa)
);

CREATE TABLE ecommerce.endereco(
    idendereco serial PRIMARY KEY,
    cep varchar(15) NOT NULL,
    logradouro varchar(100) NOT NULL,
	idcliente int REFERENCES ecommerce.cliente (idcliente),
    idbairro int REFERENCES ecommerce.bairro (idbairro),
    idcidade int REFERENCES ecommerce.cidade (idcidade)
	
);

CREATE TABLE ecommerce.email(
    idemail serial PRIMARY KEY,
    email varchar(100) UNIQUE NOT NULL,
    idcliente int REFERENCES ecommerce.cliente(idcliente) NOT NULL
);

CREATE TABLE ecommerce.telefone(
    idtelefone serial PRIMARY KEY,
    numtelefone varchar(12) NOT NULL,
    idcliente int REFERENCES ecommerce.cliente(idcliente)
);

CREATE TABLE ecommerce.estoque(
    idestoque serial PRIMARY KEY,
    quantestoque int NOT NULL,
	fabricacao date
);

CREATE TABLE ecommerce.produto (
    idproduto serial PRIMARY KEY,
    codigo varchar(10) UNIQUE NOT NULL,
    nome varchar(100) NOT NULL,
    descricao text,
    vlunit double precision NOT NULL,
   	idestoque int REFERENCES ecommerce.estoque (idestoque),
    idcategoria int REFERENCES ecommerce.categoria(idcategoria)
);

CREATE TABLE ecommerce.cadastro(
    idcadastro serial PRIMARY KEY,
	codigo int NOT NULL,
    emissao date,
    idproduto int REFERENCES ecommerce.produto(idproduto),
    idfuncionario int REFERENCES ecommerce.funcionario(idfuncionario)
);

CREATE TABLE ecommerce.pedido (
	idpedido serial PRIMARY KEY,
	codigo varchar(20) UNIQUE NOT NULL,
	datapedido date NOT NULL,
	idcliente int REFERENCES ecommerce.cliente(idcliente)
);

CREATE TABLE ecommerce.item (
	iditem serial PRIMARY KEY,
	quantidade int NOT NULL,
	valorvenda double precision NOT NULL,
	desconto double precision,
	acrescimo double precision,
	valortotal double precision NOT NULL,
	idpedido int REFERENCES ecommerce.pedido(idpedido),
	idproduto int REFERENCES ecommerce.produto (idproduto)
);
