--create schema exerc 

drop table if exists exerc.documento cascade;
drop table if exists exerc.produto cascade;
drop table if exists exerc.produto_doc cascade;
drop table if exists exerc.cliente cascade;


create table exerc.cliente(
    idcliente serial primary key,
    cliente_nome varchar(150) not null
);

create table exerc.documento(
    iddocumento serial primary key,
    num_doc varchar(10) unique not null,
    data_doc date not null,
    idcliente int references exerc.cliente(idcliente),
    vl_total double precision,
    vl_liquido double precision
);

create table exerc.produto(
    idproduto serial primary key,
    cd_prod varchar(10) unique not null,
    nome_prod varchar(120) not null,
    vl_custo double precision,
    vl_venda double precision
);

create table exerc.produto_doc(
    idprodutodoc serial primary key,
    iddocumento int references exerc.documento(iddocumento),
    idproduto int references exerc.produto(idproduto),
    quantidade int,
    vl_un double precision,
    vl_desconto double precision,
    vl_acrescimo double precision,
    vl_bruto double precision,
    vl_liquido double precision
);
insert into exerc.cliente
    (cliente_nome)
values
    ('Gabriel'),
    ('Rorivaldo'),
    ('Rodrigo'),
    ('Fernando'),
    ('Juliana');

insert into exerc.produto
    ( cd_prod, nome_prod, vl_custo, vl_venda)
values
    (1, 'Camisa', 25, 45),
    (2, 'Casaco', 80, 180),
    (3, 'Calça', 70, 170),
    (4, 'Tênis', 80, 200),
    (5, 'Meia', 10, 20);

insert into exerc.documento
    (num_doc, idcliente, data_doc)
values
    (1, 1, '2023-08-23'),
    (2, 2, '2023-07-12'),
    (3, 3, '2023-07-10'),
    (4, 4, '2023-06-24'),
    (5, 5, '2023-05-12');

insert into exerc.produto_doc
    (iddocumento, idproduto, quantidade, vl_un, vl_desconto, vl_acrescimo, vl_bruto, vl_liquido)
values
    (1, 1, 3, (select vl_venda from exerc.produto where cd_prod = '1'), 0, 0.05, 0, 0),
    (2, 4, 4, (select vl_venda from exerc.produto where cd_prod = '4'), 0, 0.05, 0, 0),
    (3, 3, 3, (select vl_venda from exerc.produto where cd_prod = '3'), 0.05, 0, 0, 0),
    (4, 2, 2, (select vl_venda from exerc.produto where cd_prod = '2'), 0, 0.05, 0, 0),
    (5, 5, 10, (select vl_venda from exerc.produto where cd_prod = '5'), 0, 0.05, 0, 0);

UPDATE exerc.produto_doc set vl_bruto =
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 1;
UPDATE exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 2;
UPDATE exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 3;
UPDATE exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 4;
UPDATE exerc.produto_doc set vl_bruto =    
    (vl_un* quantidade), vl_liquido = 
    ((vl_bruto+(vl_bruto * vl_acrescimo)) - (vl_bruto*vl_desconto)) where idprodutodoc = 5;
	
UPDATE exerc.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM exerc.produto_doc WHERE iddocumento = 1) WHERE iddocumento = 1;
UPDATE exerc.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM exerc.produto_doc WHERE iddocumento = 2) WHERE iddocumento = 2;
UPDATE exerc.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM exerc.produto_doc WHERE iddocumento = 3) WHERE iddocumento = 3;
UPDATE exerc.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM exerc.produto_doc WHERE iddocumento = 4) WHERE iddocumento = 4;
UPDATE exerc.documento SET vl_total =(
	SELECT SUM(vl_bruto) FROM exerc.produto_doc WHERE iddocumento = 5) WHERE iddocumento = 5;

UPDATE exerc.documento SET vl_liquido =(
	SELECT SUM(vl_liquido) FROM exerc.produto_doc WHERE iddocumento = 1) WHERE iddocumento = 1;
UPDATE exerc.documento SET vl_liquido =(
	SELECT SUM(vl_liquido) FROM exerc.produto_doc WHERE iddocumento = 2) WHERE iddocumento = 2;
UPDATE exerc.documento SET vl_liquido =(
	SELECT SUM(vl_liquido) FROM exerc.produto_doc WHERE iddocumento = 3) WHERE iddocumento = 3;
UPDATE exerc.documento SET vl_liquido =(
	SELECT SUM(vl_liquido) FROM exerc.produto_doc WHERE iddocumento = 4) WHERE iddocumento = 4;
UPDATE exerc.documento SET vl_liquido =(
	SELECT SUM(vl_liquido) FROM exerc.produto_doc WHERE iddocumento = 5) WHERE iddocumento = 5;
    
--CONSULTAS:

--1- Mostrar um documento com seus produtos (através de join)
SELECT 
	doc.num_doc,
	pr.nome_prod AS nome_produto,
	prdoc.vl_un,
	prdoc.quantidade,
	prdoc.vl_bruto,
	CONCAT(prdoc.vl_acrescimo*100, '%') AS acrescimo,
	CONCAT(prdoc.vl_desconto*100, '%') AS desconto,
	prdoc.vl_liquido
FROM exerc.documento doc
LEFT JOIN exerc.produto_doc prdoc ON prdoc.iddocumento = doc.iddocumento
LEFT JOIN exerc.produto pr ON pr.idproduto = prdoc.idproduto
WHERE num_doc = '0001';


--2- Mostrar lista de produtos com valor maior que 100,00
SELECT idproduto, nome_prod, vl_venda FROM exerc.produto WHERE vl_venda > 100;

--3- Mostrar um documento com o nome de cliente e o nome dos produtos

SELECT 
	doc.num_doc,
	cl.cliente_nome AS cliente,
	pr.nome_prod AS produto
FROM exerc.documento doc
LEFT JOIN exerc.cliente cl ON cl.idcliente = doc.idcliente
LEFT JOIN exerc.produto_doc prdoc ON prdoc.iddocumento = doc.iddocumento
LEFT JOIN exerc.produto pr ON pr.idproduto = prdoc.idproduto
WHERE num_doc = '0003';

------------------------------------------------------------------
--ATUALIZAÇÕES:

--1- Alterar o nome do produto
UPDATE exerc.produto SET nome_prod = 'Bandana' WHERE idproduto = 5;

--2- Alterar o valor do produto
UPDATE exerc.produto SET vl_venda = 50 WHERE idproduto = 4;
UPDATE exerc.produto_doc SET vl_un = (SELECT vl_venda FROM exerc.produto WHERE idproduto = 4) WHERE idproduto = 4;
UPDATE exerc.produto_doc SET vl_bruto =	
	(vl_un * quantidade) WHERE idproduto = 4; 
UPDATE exerc.produto_doc SET vl_liquido = 
	((vl_bruto + (vl_bruto * vl_acrescimo)) - (vl_bruto * vl_desconto)) WHERE idproduto = 4;
UPDATE exerc.produto_doc SET vl_bruto =	
	(vl_un * quantidade) WHERE idproduto = 5; 
UPDATE exerc.produto_doc SET vl_liquido = 
	((vl_bruto + (vl_bruto * vl_acrescimo)) - (vl_bruto * vl_desconto)) WHERE idproduto = 5;
	
--3- Reajustar em 10% o valor de venda dos produtos
UPDATE exerc.produto SET vl_venda = (vl_venda+(vl_venda*0.10));
UPDATE exerc.produto_doc SET vl_un = (vl_un+(vl_un*0.10));
UPDATE exerc.produto_doc SET vl_bruto =	
	(vl_un * quantidade); 
UPDATE exerc.produto_doc SET vl_liquido = 
	((vl_bruto + (vl_bruto * vl_acrescimo)) - (vl_bruto * vl_desconto));