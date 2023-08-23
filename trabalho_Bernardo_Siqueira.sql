trabalho ponto

select * from venda.produto
select * from venda.documento
select * from venda.produtodoc

insert into venda.produtodoc
	(iddocumento,idproduto,vlunitario,vldesconto,vlacrescimo,vlbruto,vlliquido)
values
	(1,6,15,0,5,18,),
	(00002,'2023-07-01',20,20),
	(00001,'2023-07-01',18,30);

update venda.produtodoc set vlliquido = vlbruto 

-----------------

create table venda.documento(
iddocumento serial primary key,
nrdocumento serial unique not null,
dtdocumento date not null,
vltotal  double precision,
vlliquido double precision
)
-------------------------
create table venda.produto(
idproduto serial primary key,
cdproduto varchar (10) unique not null,
nmproduto varchar (100) not null,
vlcustoprod double precision,
vlvendaprod double precision
)
-----------------------

create table venda.produtodoc(
idprodutodoc serial primary key,
iddocumento serial references venda.documento(iddocumento), 
idproduto serial references venda.produto(idproduto),
vlunitário double precision,
vldesconto double precision,
vlacrescimo double precision,
vlbruto double precision,
vlliquido double precision
)

-------------------
--Inserir 5 registros em cada tabela pelo menos
insert into venda.produto
(cdproduto,nmproduto,vlcustoprod,vlvendaprod)
values
('00001','Carne de hambúrguer',0.30,2.00),
('00002','Queijo',0.10,0.50),
('00003','Bacon',0.30,1.00),
('00004','Salada completa',0.20,1.00),
('00005','Pão de hambúrguer ',0.30,2.00),
('00006','Hambúrguer pronto',1.20,15.00);

select * from venda.produto
----------------------
insert into venda.documento
	(nrdocumento,dtdocumento,vltotal,vlliquido)
values
	(00004,'2023-07-01',15,20),
	(00005,'2023-07-01',15,20);

select * from venda.documento
----------------------

select * from venda.produtodoc

insert into venda.produtodoc 
	(iddocumento,idproduto,vlunitario,vldesconto,vlacrescimo,vlbruto,vlliquido)
values
	(1,6,15,0,0,15,0),
	(1,4,1,0,0,1,0),
	(1,3,1,0,0,1,0),
	(2,6,15,5,0,15,0),
	(2,6,15,5,0,15,0);
	
update venda.produtodoc set vlliquido = (vlunitario - vldesconto + vlacrescimo)

---------------------------

select * from venda.produtodoc where iddocumento = '5'

insert into venda.produtodoc 
	(iddocumento,idproduto,vlunitario,vldesconto,vlacrescimo,vlbruto)
values
	(4,6,15,0,5,15),
	(5,6,15,0,0,15),
	(5,5,2,0,0,2),
	(5,5,2,0,1,3);
	
update venda.produtodoc set vlliquido = (vlunitario - vldesconto + vlacrescimo)

-----------------------------

--Consultas
--1)

select 
	--pdc.iddocumento,
	D.nrdocumento,
	D.dtdocumento,
	prod.cdproduto,
	prod.nmproduto
	pdc.vlliquido	
from venda.documento D 
join venda.produtodoc pdc on D.iddocumento = pdc.iddocumento
join venda.produto prod on pdc.idproduto = prod.idproduto
where D.iddocumento = '5'

--2)

select * from venda.produto where vlvendaprod > 100
-- nenhum produto com esse valor

--3)

create table venda.cliente(
idcliente serial primary key,
nmcliente varchar (100) not null,
dtcadastro date not null,
cpf  varchar (11) unique not null
)

insert into venda.cliente
	(nmcliente,dtcadastro,cpf)
values
	('Bernardo Siqueira', now(), '11111111111'),
	('Jorge André', now(), '22222222222'),
	('Tadeu Martins', now(), '33333333333');
	
select * from venda.cliente
	
alter table venda.documento add column idcliente int references venda.cliente (idcliente)
	
update venda.documento set idcliente = '1'

select * from venda.documento

select 
	d.nrdocumento,
	cl.nmcliente,
	pdc.idproduto,
	prod.nmproduto
from venda.documento d 
join venda.cliente cl on d.idcliente = cl.idcliente
join venda.produtodoc pdc on pdc.iddocumento = d.iddocumento
join venda.produto prod on pdc.idproduto = prod.idproduto
where pdc.iddocumento = '3'

--Atualizacao
-1)

select * from venda.produto where idproduto = '6'

update venda.produto set nmproduto = 'Xbúrguer' where idproduto = '6'

--2)

update venda.produto set vlvendaprod = 20 where idproduto = '6'

select * from venda.produto where idproduto = '6'

--3)
update venda.produto set vlvendaprod = (vlvendaprod * 1.10) where idproduto = '6'

select * from venda.produto where idproduto = '6'








