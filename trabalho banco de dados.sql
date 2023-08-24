--create database trab individual BDados;

create schema trabalho_bdados;

--Criando as tabelas--

create table trabalho_bdados.clientes(
	idcliente serial primary key,
	nm_cliente varchar (100) not null
);

create table trabalho_bdados.documentos (
	iddocumentos serial primary key,
	idcliente int references trabalho_bdados.clientes(idcliente),
    num_doc int not null,
	data_doc date not null,
	vl_total double precision not null,
	vl_liquido double precision not null		
);	

create table trabalho_bdados.produtos(
	idprodutos serial primary key,
	cod_produto int unique not null,
	nome_produto varchar (20) not null,
	vl_custo_produto double precision not null,
	vl_venda_produto double precision not null
);

create table trabalho_bdados.prod_documento(
	idprod_documento serial primary key,
	iddocumentos int references trabalho_bdados.documentos(iddocumentos) ,
	idprodutos int references trabalho_bdados.produtos(idprodutos),
	vlunitario int not null,
	vl_desconto double precision not null,
	vl_acrescimo double precision not null,
	vl_bruto double precision not null,
	vl_liquido double precision not null
);

--Inserindo os valores--

insert into
    trabalho_bdados.clientes (nm_cliente)
values
     ('João'),
     ('Pedro'),
     ('Bruna'),
     ('Ana'),
     ('Isabela');

insert into
	trabalho_bdados.documentos (num_doc, data_doc, vl_total, vl_liquido)
values
	(1,'2023-10-05',5,2),
	(2,'2023-10-05',1,3),
	(3,'2023-10-05',4,2),
	(4,'2023-10-05',3,4),
	(5,'2023-10-05',1,3);

alter table trabalho_bdados.produtos rename column lv_venda_produto to  vl_venda_produto;

insert into
	trabalho_bdados.produtos (cod_produto, nome_produto, vl_custo_produto, vl_venda_produto)
values
	(1,'Web cam', 27,69),
	(2,'Microfone', 19,47),
	(3,'Monitor', 270,590),
	(4,'Teclado', 27,52),
	(5,'Mouse', 14,29);

select * from trabalho_bdados.produtos

insert into 
	trabalho_bdados.prod_documento (iddocumentos, idprodutos, vlunitario, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
values
	(1,1,0,0,0,0,0),
	(2,2,0,0,0,0,0),
	(3,3,0,0,0,0,0),
	(4,4,0,0,0,0,0),
	(5,5,0,0,0,0,0);
				

-------------------------------------------------------------------------------------
update 
	trabalho_bdados.prod_documento
set
	vl_desconto = 4,5,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 1) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 1),
	vlunitario = (select vl_liquido from trabalho_bdados.documentos where idDocumentos = 1),
	vl_liquido = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 1) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 1) - 4.5
where iddocumentos = 1 and idprodutos = 1;

update 
	trabalho_bdados.prod_documento
set
	vl_desconto = 7.5,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 2) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 2),
	vlunitario = (select vl_liquido from trabalho_bdados.documentos where idDocumentos = 2),
	vl_liquido = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 2) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 2) - 7.5
where iddocumentos = 2 and idprodutos = 2;

update 
	trabalho_bdados.prod_documento
set
	vl_desconto = 0,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 3) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 3),
	vlunitario = (select vl_liquido from trabalho_bdados.documentos where idDocumentos = 3),
	vl_liquido = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 3) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 3) - 0
where iddocumentos = 3 and idprodutos = 3;

update 
	trabalho_bdados.prod_documento
set
	vl_desconto = 0,
	vl_acrescimo = 8.0,
	vl_bruto = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 4) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 4),
	vlunitario = (select vl_liquido from trabalho_bdados.documentos where idDocumentos = 4),
	vl_liquido = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 4) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 4) + 8.0
where iddocumentos = 4 and idprodutos = 4;

update 
	trabalho_bdados.prod_documento
set
	vl_desconto = 4.0,
	vl_acrescimo = 0,
	vl_bruto = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 5) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 5),
	vlunitario = (select vl_liquido from trabalho_bdados.documentos where idDocumentos = 5),
	vl_liquido = (select vl_venda_produto from trabalho_bdados.produtos where idprodutos = 5) + (select vl_liquido from trabalho_bdados.documentos where iddocumentos = 5) - 4.0
where iddocumentos = 5 and idprodutos = 5;


/*Consultas:

1- Mostrar um documento com seus produtos (através de join)
*/

select pdt.nome_produto, doc.num_doc
from trabalho_bdados.produtos pdt
left join trabalho_bdados.prod_documento pd on pdt.idprodutos = pd.idprodutos
left join trabalho_bdados.documentos doc on pd.iddocumentos = doc.iddocumentos

where pd.idprodutos = 3 

/*2- Mostrar lista de produtos com valor maior que 100,00
*/

select vl_venda_produto
from trabalho_bdados.produtos
where vl_venda_produto > 100

/*3- Mostrar um documento com o nome de cliente e o nome dos produtos
*/

select nm_cliente, nome_produto
from trabalho_bdados.produtos pdt
left join trabalho_bdados.prod_documento pd on pd.cliente = doc.cliente
left join trabalho_bdados.documentos doc on pdt.idprodutos = pd.idprodutos

where pd.idprodutos = 3



select * from trabalho_bdados.prod_documento;
select * from trabalho_bdados.produtos;
select * from trabalho_bdados.documentos;
select * from trabalho_bdados.clientes;

UPDATE trabalho_bdados.documentos
SET vl_total = 7 , vl_liquido = 2
WHERE iddocumentos= 5