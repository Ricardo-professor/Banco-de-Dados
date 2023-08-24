--create database trabalho;

create schema trabalho_individual;

--Criando as tabelas--

create table trabalho_individual.clientes(
	idcliente serial primary key,
	nm_cliente varchar (100) not null
);

create table trabalho_individual.documentos (
	iddocumentos serial primary key,
	idcliente int  references trabalho_individual.clientes(idcliente),
	num_doc int not null,
	data_doc date not null,
	vl_total double precision not null,
	vl_liquido double precision not null		
);	

create table trabalho_individual.produtos(
	idprodutos serial primary key,
	cod_produto int unique not null,
	nome_produto varchar (20) not null,
	vl_custo_produto double precision not null,
	vl_venda_produto double precision not null
);

create table trabalho_individual.prod_documento(
	idprod_documento serial primary key,
	iddocumentos int references trabalho_individual.documentos(iddocumentos) ,
	idprodutos int references trabalho_individual.produtos(idprodutos),
	vlunitario double precision not null,
	vl_desconto double precision not null,
	vl_acrescimo double precision not null,
	vl_bruto double precision not null,
	vl_liquido double precision not null
);

--Inserindo os valores--

insert into 
	trabalho_individual.clientes (nm_cliente)	
values
	('Andre Maia'),
	('Natally'),
	('Gabriel Teixeira'),
	('Nathan'),
	('Samara');

insert into
	trabalho_individual.documentos (idcliente,num_doc, data_doc, vl_total, vl_liquido)
values
	(1,1,'2023-10-05',6,3),
	(2,2,'2023-10-05',7.5,4),
	(3,3,'2023-10-05',9,4.5),
	(4,4,'2023-10-05',6.5,2.5),
	(5,5,'2023-10-05',7,2);

--alter table trabalho_individual.produtos rename column lv_venda_produto to  vl_venda_produto;

insert into
	trabalho_individual.produtos (cod_produto, nome_produto, vl_custo_produto, vl_venda_produto)
values
	(1,'Web cam', 35,50),
	(2,'Microfone', 30,45),
	(3,'Monitor', 300,420),
	(4,'Teclado', 250,300),
	(5,'Mouse', 80,180);

--select * from trabalho_individual.produtos

insert into 
	trabalho_individual.prod_documento (iddocumentos, idprodutos, vlunitario, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
values
	(1,1,0,0,0,0,0),
	(2,2,0,0,0,0,0),
	(3,3,0,0,0,0,0),
	(4,4,0,0,0,0,0),
	(5,5,0,0,0,0,0);
				

------------------------------------------------------------------------------------------------------------------------
update 
	trabalho_individual.prod_documento
set
	vl_desconto = 3,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 1) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 1),
	vlunitario = (select vl_liquido from trabalho_individual.documentos where idDocumentos = 1),
	vl_liquido = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 1) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 1) - 3
where iddocumentos = 1 and idprodutos = 1;

update 
	trabalho_individual.prod_documento
set
	vl_desconto = 0,
	vl_acrescimo = 5,
	vl_bruto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 2) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 2),
	vlunitario = (select vl_liquido from trabalho_individual.documentos where idDocumentos = 2),
	vl_liquido = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 2) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 2) +5
where iddocumentos = 2 and idprodutos = 2;

update 
	trabalho_individual.prod_documento
set
	vl_desconto = 10,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 3) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 3),
	vlunitario = (select vl_liquido from trabalho_individual.documentos where idDocumentos = 3),
	vl_liquido = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 3) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 3) - 10
where iddocumentos = 3 and idprodutos = 3;

update 
	trabalho_individual.prod_documento
set
	vl_desconto = 6,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 4) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 4),
	vlunitario = (select vl_liquido from trabalho_individual.documentos where idDocumentos = 4),
	vl_liquido = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 4) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 4) - 6
where iddocumentos = 4 and idprodutos = 4;

update 
	trabalho_individual.prod_documento
set
	vl_desconto = 0,
	vl_acrescimo = 2,
	vl_bruto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 5) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 5),
	vlunitario = (select vl_liquido from trabalho_individual.documentos where idDocumentos = 5),
	vl_liquido = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 5) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 5) +2
where iddocumentos = 5 and idprodutos = 5;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Consultas:

1- Mostrar um documento com seus produtos (através de join)
2- Mostrar lista de produtos com valor maior que 100,00
3- Mostrar um documento com o nome de cliente e o nome dos produtos
*/

--1- Mostrar um documento com seus produtos (através de join)
select pdt.nome_produto, doc.num_doc 
from trabalho_individual.produtos pdt
left join trabalho_individual.prod_documento pd on  pdt.idprodutos =  pd.idprodutos
left join trabalho_individual.documentos doc on  pd.iddocumentos = doc.iddocumentos
where pd.idprodutos = 1

--2- Mostrar lista de produtos com valor maior que 100,00
select vl_venda_produto
from trabalho_individual.produtos
where vl_venda_produto > 100

--3- Mostrar um documento com o nome de cliente e o nome dos produtos

select cl.nm_cliente,pdt.nome_produto 
from trabalho_individual.clientes cl
left join trabalho_individual.documentos doc on cl.idcliente  = doc.idcliente
left join trabalho_individual.prod_documento pd on doc.iddocumentos = pd.iddocumentos
left join trabalho_individual.produtos pdt on  pdt.idprodutos =  pd.idprodutos
where pd.idprodutos = 1

/*
Atualizações:
1- Alterar o nome do produto
2- Alterar o valor do produto
3- Reajustar em 10% o valor de venda dos produtos
*/

--1- Alterar o nome do produto

update 
	trabalho_individual.produtos
set
	nome_produto = 'Guitarra'
where 
	idprodutos = 1; 
	
--2- Alterar o valor do produto

update 
	trabalho_individual.produtos
set
	vl_custo_produto = 850
where 
	idprodutos = 1; 

--3- Reajustar em 10% o valor de venda dos produtos

update 
	trabalho_individual.produtos
set
	vl_venda_produto = (select vl_venda_produto from trabalho_individual.produtos where idprodutos = 1) + (select vl_liquido from trabalho_individual.documentos where iddocumentos = 1) + 10
where 
	idprodutos = 1; 
	
	
select * from trabalho_individual.produtos;
select * from trabalho_individual.documentos;
select * from trabalho_individual.clientes;



