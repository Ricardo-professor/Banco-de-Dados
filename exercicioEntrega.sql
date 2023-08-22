create table exer.documento(
	iddocumento serial primary key,
	nrdocumento varchar(6) unique not null,
	dtdocumento timestamp not null,
	vltotal double precision,
	vlliquido double precision
	);

create table exer.produto(
	idproduto serial primary key,
	cdproduto varchar(6) unique not null,
	descricao varchar(100) not null,
	vlcusto double precision,
	vlvenda double precision
	);

create table exer.proddoc(
	idproddoc serial primary key,
	iddocumento int references exer.documento(iddocumento),
	idproduto int references exer.produto(idproduto),
	vluni double precision not null,
	vldesc double precision,
	vlacresc double precision,
	vlbruto double precision not null,
	vlliquido double precision not null
	);

create table exer.cliente(
	idcliente serial primary key,
	cdcliente varchar(6) unique not null,
	nome varchar(100) not null
	);


insert into exer.produto
(cdproduto, descricao, vlcusto, vlvenda)
values
('000001', 'Produto1', 100.00, 150.00),
('000002', 'Produto2', 5.00, 10.50),
('000003', 'Produto3', 20.00, 32.00),
('000004', 'Produto4', 80.00, 110.00),
('000005', 'Produto5', 11.50, 23.99);

insert into exer.documento
(nrdocumento, dtdocumento)
values
('000134', '22-08-2023 14:32:00'),
('000135', '23-08-2023 11:15:00'),
('000136', '24-08-2023 16:40:00'),
('000137', '25-08-2023 08:10:00'),
('000138', '26-08-2023 17:48:00');

insert into exer.proddoc
(iddocumento, idproduto, vluni, vldesc, vlacresc, vlbruto, vlliquido)
values
(1, 1, 150.00, 0.0, 0.0, 150.00, 150.00),
(2, 2, 10.50, 2.00, 0.0, 10.50, 8.50),
(3, 3, 32.00, 0.0, 5.00, 32.00, 37.00),
(4, 4, 110.00, 0.0, 0.0, 110.00, 110.00),
(5, 5, 23.99, 5.00, 0.0, 23.99, 18.99);

insert into exer.cliente
(cdcliente, nome)
values
('000001', 'Joao'),
('000002', 'Maria'),
('000003', 'Jose'),
('000004', 'Pedro'),
('000005', 'Paula');

alter table exer.documento add column idcliente int references exer.cliente(idcliente);
update exer.documento set idcliente = 1 where iddocumento = 1;
update exer.documento set idcliente = 2 where iddocumento = 2;
update exer.documento set idcliente = 3 where iddocumento = 3;
update exer.documento set idcliente = 4 where iddocumento = 4;
update exer.documento set idcliente = 5 where iddocumento = 5;

select * from exer.produto where vlvenda >= 100.00;
update exer.produto set descricao  = 'ProdutoAlterado' where idproduto = '1';
update exer.proddoc set vluni = (vluni * 1.10);
update exer.proddoc set vlbruto = (vlbruto * 1.10);
update exer.proddoc set vlliquido = (vlliquido * 1.10);

select pd.nrdocumento, pr.cdproduto, pr.descricao
from exer.proddoc pi
join exer.produto pr on pr.idproduto = pi.idproduto
join exer.documento pd on pd.iddocumento = pi.iddocumento

select pd.nrdocumento, cl.cdcliente, cl.nome
from exer.documento pd
join exer.cliente cl on cl.idcliente = pd.idcliente



