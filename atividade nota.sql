--create schema atividade

--drop table atividade.produto

			--- criação tabela --- 

create table atividade.documento(
	iddocumento serial primary key,
	numerodoc varchar (20) not null,
	datad date not null,
	vltotal double precision not null,
	vlliquido double precision not null
);

create table atividade.produto(
	idproduto serial primary key,
	codigo varchar (100) not null ,
	nome varchar (100) not null,
	vlcusto double precision not null,
	vlvenda double precision not null
);

create table atividade.prodoc(
	idprodoc serial primary key,
	iddocumento int references atividade.documento(iddocumento),
	idproduto int references atividade.produto(idproduto),
	idcliente int references atividade.cliente (idcliente),
	quantidade double precision not null,
	vlunitario double precision not null,
	vldesconto double precision not null,
	vlacrescimo double precision not null,
	vlbruto double precision not null,
	vlliquido double precision not null
);

create table atividade.cliente(
	idcliente serial primary key,
	nome varchar(100)
);

		---inserção de dados----

insert into atividade.produto
	(codigo,nome,vlcusto,vlvenda)
values 
	('00011','camisa',25,50),
	('00012','calça',50,100),
	('00013','meia',5,10),
	('00014','casaco',100,125),
	('00015','camiseta',20,30)
	
insert into atividade.documento
	(numerodoc,datad,vltotal,vlliquido)
values
	(1,'25-08-2023',100,96),
	(2,'25-08-2023',125,120),
	(3,'26-08-2023',30,24),
	(4,'27-08-2023',60,64),
	(5,'26-08-2023',50,50)
	
insert into atividade.prodoc
	(iddocumento, idproduto, idcliente, vlunitario,quantidade, vldesconto,vlacrescimo,vlbruto,vlliquido)
values
	(1,1,1,50,2,2,0,100,96),
	(2,4,2,125,1,5,0,125,120),
	(3,3,3,10,3,2,0,30,24),
	(4,5,4,30,2,0,2,60,64),
	(5,1,5,50,1,0,0,50,50)
	
insert into atividade.cliente
	(nome)
values
	('Maria de Carvalho'),
	('Natalia Silva'),
	('Cecilia Souza'),
	('Luiz de Rocha'),
	('Marco de Medeiro')
	
select d.numerodoc,pdt.nome
from atividade.documento d
join atividade.prodoc pd on d.iddocumento = pd.iddocumento
join atividade.produto pdt on pd.idproduto = pdt.idproduto
where d.iddocumento = 1;

select * from atividade.produto where vlvenda > 100;

select d.numerodoc, cl.nome, pdt.nome
from atividade.documento d
join atividade.prodoc pd on d.iddocumento = pd.iddocumento
join atividade.produto pdt on pd.idproduto = pdt.idproduto
join atividade.cliente cl on pd.idcliente = cl.idcliente
where d.iddocumento = 3 ;

update atividade.produto set nome ='camiseta estampada' where nome ='camiseta';
update atividade.produto set vlvenda = 40 where idproduto = 5 ;
update atividade.produto set vlvenda = vlvenda * 1.10;