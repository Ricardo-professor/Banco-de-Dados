create table clientes(
	idcliente serial primary key,
	nome_cliente varchar (100) not null
);

create table documentos (
	id_documentos serial primary key,
	id_cliente int references clientes(idcliente),
	numero_doc int not null,
	data_doc date not null,
	valor_total double precision not null,
	valor_liquido double precision not null
);

create table produtos (
	id_produtos serial primary key,
	cod_prod int unique not null,
	nome_prod varchar (100) not null,
	valor_custo_prod double precision not null,
	valor_venda_prod double precision not null
);

create table prod_doc(
	idprod_doc serial primary key,
	id_documentos int references documentos(id_documentos),
	id_produtos int references produtos(id_produtos),
	valor_unit int not null,
	valor_desconto double precision not null,
	valor_acresc double precision not null,
	valor_bruto double precision not null,
	valor_liq double precision not null
);

---------------------------------------------valores------------------------------------------------------
insert into clientes (nome_cliente)
values
		('Losé'),
		('Larissa'),
		('Julia'),
		('João'),
		('Carlos');
		
select * from clientes

insert into documentos(numero_doc, id_cliente, data_doc, valor_total, valor_liquido)
values 
		(1,1, '2023-09-07', 10,15),
		(2,2, '2023-09-07', 9,8),
		(3,3, '2023-09-07', 16,18),
		(4,4, '2023-09-07', 14,11),
		(5,5, '2023-09-07', 15,20);
		
		
select * from documentos

insert into produtos(cod_prod, nome_prod, valor_custo_prod, valor_venda_prod)
values
		(1, 'Blusa', 40,50),
		(2, 'Casaco', 80,85),
		(3, 'Calça', 60,75),
		(4, 'Vestido', 40,55),
		(5, 'Short', 50,65);
		
select * from produtos
		
		
insert into prod_doc(id_documentos, id_produtos, valor_unit, valor_desconto, valor_acresc, valor_bruto, valor_liq)
values 
		(1,1,0,5,10,0,40),
		(2,2,0,25,15,0,80),
		(3,3,0,35,15,0,60),
		(4,4,0,25,15,0,40),
		(5,5,0,30,15,0,50);
		
select * from prod_doc
---------------------------------------------------------------------------------------------------------------------------------

select prod.nome_prod, doc.numero_doc
from produtos prod
join prod_doc pd on prod.id_produtos = pd.id_produtos
join documentos doc on pd.id_documentos = doc.id_documentos
--where pd.idprodutos = 3

---------------------------------------------------------------------------------------------------------------------------------

select nome_prod, valor_venda_prod
from produtos where valor_venda_prod > 100;

---------------------------------------------------------------------------------------------------------------------------------

select prod.nome_prod, nm.clientes
from produtos prod
join prod_doc pd on prod.id_produtos = pd.id_produtos
join cliente nm on doc.id_cliente = nm.id_cliente

---------------------------------------------------------------------------------------------------------------------------------

update produtos
set nome_prod = 'Novo Nome'
where id_produtos = 1; -- *Substituição*

update produtos
set valor_custo_prod = 75 -- Novo valor
where id_produtos = 2; -- *Substituição*

update produtos
set valor_venda_prod = valor_venda_prod * 1.1 -- *Acrescimo de 10%*
