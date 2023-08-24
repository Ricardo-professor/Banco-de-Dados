/*
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

Inserir 5 registros em cada tabela pelo menos

Consultas:

1- Mostrar um documento com seus produtos (através de join)
2- Mostrar lista de produtos com valor maior que 100,00
3- Mostrar um documento com o nome de cliente e o nome dos produtos

Atualizações:
1- Alterar o nome do produto
2- Alterar o valor do produto
3- Reajustar em 10% o valor de venda dos produtos

*/

create table trabalho.cliente
(
	idcliente serial primary key,
	codigo varchar(6) unique not null,
	nomeCliente varchar(50) not null
);

create table trabalho.documento
(
	iddocumento serial primary key,
	nunDocumento int not null,
	dataDocumento date not null,
	valorTotal double precision not null,
	valorLiquido double precision not null,
	fk_idcliente int references trabalho.cliente(idcliente)
);

create table trabalho.produto
(
	idproduto serial primary key,
	codigo varchar(10) not null,
	nomeProduto varchar(40) not null,
	valorCusto double precision not null, 
	valorVendaProduto double precision not null
);

create table trabalho.produto_documento
(
	idproduto_documento serial primary key,
	fk_iddocumento int references trabalho.documento(iddocumento),
	fk_idproduto int references trabalho.produto(idproduto),
	valorUn int not null,
	valorDesc double precision not null, 
	valorAcres double precision not null, 
	valorBruto double precision not null, 
	valorLiq double precision not null 
);

insert into trabalho.cliente
	(codigo,nomeCliente)
values 
	('980asd','Ana Beatriz'),
	('WERC23','Barbara'),
	('92dqws','Carlos'),
	('9821ds','Daniel'),
	('18htrs','Emanuel');

insert into trabalho.produto
	(codigo,nomeProduto,valorCusto,valorVendaProduto)
values
	('245dfg','TV Samsung 50"',1000.0,1750.0),
	('115asd','Cafeteira polishop',120.0,200.0),
	('440gfv','Cenoura',1.0,1.25),
	('002bnd','Guarda-chuva',20.0,30.0),
	('999efh','Ração canina',25.0,45.0);
	
insert into trabalho.documento
	(nunDocumento,dataDocumento,valorTotal,valorLiquido,fk_idcliente)
values
	(245,'2021-08-12',250.0,215.0,1),
	(115,'2001-07-21',520.0,500.0,3),
	(440,'2023-10-01',331.0,300.0,4),
	(002,'2003-12-02',123.0,115.0,3),
	(999,'2022-01-17',050.0,45.0,3);
	
insert into trabalho.produto_documento
	(fk_iddocumento,fk_idproduto,valorUn,valorDesc,valorAcres,valorBruto,valorLiq)
values
	(2,	4,(select valorCusto from trabalho.produto where idproduto = 1),5,0,250,225),
	(3,5,(select valorCusto from trabalho.produto where idproduto = 2),10,0,123.0,115.0),
	(5,1,(select valorCusto from trabalho.produto where idproduto = 3),30,0,520.0,500.0),
	(1,5,(select valorCusto from trabalho.produto where idproduto = 4),70,0,331.0,300.0),
	(2,2,(select valorCusto from trabalho.produto where idproduto = 5),0,15,250.0,215.0);	
	
/*	 
--drop table trabalho.produto_documento
--drop table trabalho.documento
--drop table trabalho.produto
--drop table trabalho.cliente

--select * from trabalho.produto_documento
--select * from trabalho.documento
--select * from trabalho.produto
*/

--consultas 

--1 Mostrar um documento com seus produtos (através de join)
select 
	doc.iddocumento,pdt.codigo,pdt.nomeproduto,pdt.valorcusto,pdt.valorvendaproduto
from trabalho.produto pdt
left join trabalho.produto_documento pd on pdt.idproduto = pd.fk_idproduto
left join trabalho.documento doc on doc.iddocumento = pd.fk_iddocumento 
where doc.iddocumento = 2

--2 Mostrar lista de produtos com valor maior que 100,00
select 
	nomeproduto,valorvendaproduto 
from trabalho.produto 
where valorvendaproduto > 100

--3 Mostrar um documento com o nome de cliente e o nome dos produtos
select 
	doc.iddocumento,clt.nomeCliente,pdt.nomeproduto
from trabalho.cliente clt
left join trabalho.documento doc on doc.fk_idcliente = clt.idcliente
left join trabalho.produto_documento pd on pd.fk_iddocumento = doc.iddocumento
left join trabalho.produto pdt on pdt.idproduto = pd.fk_idproduto where doc.iddocumento = 2

--Atualizações:
--1- Alterar o nome do produto
update trabalho.produto 
set nomeproduto = 'Webcam' 
where idproduto = 1

--2- Alterar o valor do produto
update trabalho.produto
set valorvendaproduto = 540
where idproduto = 1

--3- Reajustar em 10% o valor de venda dos produtos
update trabalho.produto
set valorvendaproduto = (valorvendaproduto * 10/100)










