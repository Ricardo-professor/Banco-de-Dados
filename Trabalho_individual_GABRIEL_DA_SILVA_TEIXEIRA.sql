
create schema traIndividual;
--trabalho individual

--criando tabelas--

create table traIndividual.cliente (
	idcliente serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(100) not null
);

create table traIndividual.documento (
	idDocumento serial primary key,
	codigo varchar(10) unique not null,
	numero int unique not null,
	dataDoc date not null,
	valorTotal double precision not null,
	valorLiquido double precision not null,
	fk_cliente int references traIndividual.cliente(idcliente)
	
);

create table traIndividual.produto (
	idProduto serial primary key,
	codigo varchar(10) unique not null,
	nome varchar(100) not null,
	valorCusto double precision not null,
	valorVenda double precision not null
);

create table traIndividual.documento_produto (
	idDocProd serial primary key,
	fk_idDocumento int references traIndividual.documento(idDocumento),
	fk_idProduto int references traIndividual.produto(idProduto),
	valorUn double precision not null,
	valorDesconto double precision not null,
	valorAcrescimo double precision not null,
	valorBruto double precision not null,
	valorLiquido double precision not null,
	
	unique(fk_idDocumento,fk_idProduto)
);

--inserindo valores--

insert into traIndividual.cliente
	(codigo, nome)
values
	('0123456789', 'Gabriel'),
	('9876543210', 'Payet'),
	('2116543210', 'VASCO'),
	('2312543210', 'Arroz'),
	('9876234210', 'Feijão');
	
insert into traIndividual.documento
	(codigo,numero,datadoc,valortotal,valorliquido, fk_cliente)
values
	('0123456789',123,'2023-05-03',4.0,2.0,1),
	('0122256789',124,'2023-05-01',6.0,3.0,2),
	('0123356789',125,'2023-05-05',6.0,3.5,1),
	('0124456789',126,'2023-03-06',2.0,1.0,3),
	('0125556789',127,'2023-04-07',2.0,2.5,4);

insert into traIndividual.produto
	(codigo,nome,valorcusto,valorvenda)
values
	('0123456789','camera',27.99,50),
	('0122456789','mouse',199.99,450),
	('0133456789','teclado',199.99,450),
	('0144456789','monitor',1127.99,1950),
	('0155456789','fone apple',199.99,1650);
	
insert into traIndividual.documento_produto
	(fk_iddocumento,fk_idproduto,valorun,valordesconto,valoracrescimo,valorbruto,valorliquido)
values
	(1,1,0,0,0,0,0),
	(1,2,0,0,0,0,0),
	(3,3,0,0,0,0,0),
	(4,4,0,0,0,0,0),
	(5,5,0,0,0,0,0);

--realizando contas--
update 
	traIndividual.documento_produto
set
	valordesconto = 4.0,
	valoracrescimo = 0,
	valorbruto = (select valorvenda from traIndividual.produto where idproduto = 1) + (select valorLiquido from traIndividual.documento where idDocumento = 1),
	valorun = (select valorLiquido from traIndividual.documento where idDocumento = 1),
	valorliquido = (select valorvenda from traIndividual.produto where idproduto = 1) + (select valorLiquido from traIndividual.documento where idDocumento = 1) - 4.0
where fk_iddocumento = 1 and fk_idproduto = 1;

update 
	traIndividual.documento_produto
set
	valordesconto = 0,
	valoracrescimo = 4.0,
	valorbruto = (select valorvenda from traIndividual.produto where idproduto = 2) + (select valorLiquido from traIndividual.documento where idDocumento = 1),
	valorun = (select valorLiquido from traIndividual.documento where idDocumento = 1),
	valorliquido = (select valorvenda from traIndividual.produto where idproduto = 2) + (select valorLiquido from traIndividual.documento where idDocumento = 1) + 4.0
where fk_iddocumento = 1 and fk_idproduto = 2;

update 
	traIndividual.documento_produto
set
	valordesconto = 0,
	valoracrescimo = 0,
	valorbruto = (select valorvenda from traIndividual.produto where idproduto = 3) + (select valorLiquido from traIndividual.documento where idDocumento = 3),
	valorun = (select valorLiquido from traIndividual.documento where idDocumento = 3),
	valorliquido = (select valorvenda from traIndividual.produto where idproduto = 3) + (select valorLiquido from traIndividual.documento where idDocumento = 3)
where fk_iddocumento = 3 and fk_idproduto = 3;

update 
	traIndividual.documento_produto
set
	valordesconto = 0,
	valoracrescimo = 70,
	valorbruto = (select valorvenda from traIndividual.produto where idproduto = 4) + (select valorLiquido from traIndividual.documento where idDocumento = 4),
	valorun = (select valorLiquido from traIndividual.documento where idDocumento = 4),
	valorliquido = (select valorvenda from traIndividual.produto where idproduto = 4) + (select valorLiquido from traIndividual.documento where idDocumento = 4) + 70
where fk_iddocumento = 4 and fk_idproduto = 4;

update 
	traIndividual.documento_produto
set
	valordesconto = 1.0,
	valoracrescimo = 0,
	valorbruto = (select valorvenda from traIndividual.produto where idproduto = 5) + (select valorLiquido from traIndividual.documento where idDocumento = 5),
	valorun = (select valorLiquido from traIndividual.documento where idDocumento = 5),
	valorliquido = (select valorvenda from traIndividual.produto where idproduto = 5) + (select valorLiquido from traIndividual.documento where idDocumento = 5) - 1.0
where fk_iddocumento = 5 and fk_idproduto = 5;

--exercicios--
--fazendo consultas--

--(1)--
select
	doc.iddocumento, prod.idProduto, prod.nome, prod.valorcusto, prod.valorvenda 
from traIndividual.documento doc
left join traIndividual.documento_produto docprod on docprod.fk_iddocumento = doc.iddocumento
left join traIndividual.produto prod on prod.idproduto = docprod.fk_idproduto
where iddocumento = 1;

--(2)--
select * from traIndividual.produto prod where prod.valorvenda > 100;

--(3)--
select
	cl.nome, doc.iddocumento, prod.idProduto, prod.nome, prod.valorcusto, prod.valorvenda 
from traIndividual.cliente cl
left join traIndividual.documento doc on doc.fk_cliente = cl.idcliente
left join traIndividual.documento_produto docprod on docprod.fk_iddocumento = doc.iddocumento
left join traIndividual.produto prod on prod.idproduto = docprod.fk_idproduto
where iddocumento = 1;


--atualizações--

--(1 e 2)--
update traIndividual.produto prod
set nome = 'VASCO DA GAMA', valorVenda = 1000000000000
where prod.idproduto = 4;

--select * from traIndividual.produto;

--(3)--

select * from traIndividual.produto;

update traIndividual.produto prod
set valorVenda = (select valorVenda from traIndividual.produto where idproduto = 1) - ((select valorVenda from traIndividual.produto where idproduto = 1) * 0.01)
where prod.idproduto = 1;

update traIndividual.produto prod
set valorVenda = (select valorVenda from traIndividual.produto where idproduto = 2) - ((select valorVenda from traIndividual.produto where idproduto = 2) * 0.01)
where prod.idproduto = 2;

update traIndividual.produto prod
set valorVenda = (select valorVenda from traIndividual.produto where idproduto = 3) * 1.01
where prod.idproduto = 3;	

update traIndividual.produto prod
set valorVenda = (select valorVenda from traIndividual.produto where idproduto = 4) * 1.01
where prod.idproduto = 4;

update traIndividual.produto prod
set valorVenda = (select valorVenda from traIndividual.produto where idproduto = 5) * 1.01
where prod.idproduto = 5;








