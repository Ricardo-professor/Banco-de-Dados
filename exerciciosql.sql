create database Exercicio

create schema venda

create table venda.documento(
	iddoc serial primary key not null,
	numerodoc varchar (6) unique not null,
	datadoc date not null,
	vltotal double precision,
	vlliquido double precision
);

create table venda.produto(
	idprod serial primary key not null,
	cdproduto varchar (6) unique not null,
	nmproduto varchar (100) not null,
	vlcusto double precision,
	vlvenda double precision
);

create table venda.prodocumento(
	idprodoc serial primary key not null,
	iddoc int references venda.documento(iddoc),
	idprod int references venda.produto(idprod),
	vlunitario double precision,
	vldesconto double precision,
	vlacrescimo double precision,
	vlbruto double precision,
	vlliquido double precision
);

--Inserir 5 registros em cada tabela pelo menos

insert into venda.produto
	(cdproduto, nmproduto,vlcusto,vlvenda)
values
	('0001','Mochila',33.00,110.0),
	('0002','Mala',70.00,310.0),
	('0003','Bolsa Feminina',33.00,70.0),
	('0004','Bolsa Bag',23.00,210.0),
	('0005','Necessaire',5.00,20.0)
	
select * from venda.produto	

insert into venda.documento
	(numerodoc, datadoc, vltotal,vlliquido)
values
	('0121','2023-08-20',310.00 ,300.00),
	('0131','2023-08-20',110.00 ,110.00),
	('0141','2023-08-20',70.00 ,65.00),
	('0151','2023-08-20',210.00 ,150.00),
	('0161',now(),20.00 ,20.00)

select * from venda.documento

insert into venda.prodocumento
	(iddoc,idprod,vlunitario,vldesconto,vlacrescimo,vlbruto,vlliquido)
values
	(1,2,310.00,10.00,0.00,300.00,230.00),
	(2,1,110.00,0.00,0.00,110.00,77.00),
	(3,3,70.00,5.00,0.00,65.00,32.00),
	(4,4,210.00,60.00,0.00,150.00,127.00),
	(5,5,20.00,0.00,0.00,20.00,15.00)
	
select * from venda.prodocumento	

--1 Mostrar um documento com seus produtos (através de join)

select pr.idprod, pr.nmproduto, pd.vlliquido,pd.idprodoc  from venda.prodocumento pd

join venda.produto pr on pr.idprod = pd.idprod


--2- Mostrar lista de produtos com valor maior que 100,00

select * from venda.produto where vlvenda > 100.00 

--3- Mostrar um documento com DATA e o nome dos produtos

select pd.idprodoc ,pr.nmproduto, dc.datadoc, pd.vlunitario, pd.vldesconto, dc.vlliquido from venda.prodocumento pd

join venda.produto pr on pr.idprod = pd.idprod
join venda.documento dc on dc.iddoc = pd.iddoc

--Atualizações:
--1- Alterar o nome do produto

update venda.produto set nmproduto='Mochila Premiun' where venda.produto.idprod=1 

select nmproduto from venda.produto

--2- Alterar o valor do produto

update venda.produto set vlvenda = 130.00 where venda.produto.idprod = 1

select * from venda.produto

--3- Reajustar em 10% o valor de venda dos produtos

update venda.produto set vlvenda = venda.produto.vlvenda-(venda.produto.vlvenda*0.1) where venda.produto.idprod = 1;
update venda.produto set vlvenda = venda.produto.vlvenda-(venda.produto.vlvenda*0.1) where venda.produto.idprod = 2;
update venda.produto set vlvenda = venda.produto.vlvenda-(venda.produto.vlvenda*0.1) where venda.produto.idprod = 3;
update venda.produto set vlvenda = venda.produto.vlvenda-(venda.produto.vlvenda*0.1) where venda.produto.idprod = 4;
update venda.produto set vlvenda = venda.produto.vlvenda-(venda.produto.vlvenda*0.1) where venda.produto.idprod = 5

select * from venda.produto



