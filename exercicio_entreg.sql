create table aula.cliente (
	id serial primary key,
	nome varchar (100) not null,
	nome_produto varchar (100)	
)
create table aula.documentos (
	id serial primary key,
	numero_documento varchar (100) unique not null,
    data_documento date not null,
	valor_total real,
	valor_liquido real,
	cliente_id int references aula.cliente(id)
	)
create table aula.produtos (    
	id serial primary key,
	codigo_produto varchar (100) unique not null,
	nome varchar (100) not null,
	valor_custo real not null,
	valor_venda real not null,
	cliente_id int references aula.produtos(id)
)

create table aula.prod_documento (
    id serial primary key,
    valor_unitario serial not null,
    valor_desconto serial,
    valor_acrescimo serial,
    valor_bruto serial not null,
    valor_liquido serial not null,
	id_documento int references aula.documentos(id),
    id_produto int references aula.produtos(id)
)

insert into aula.produtos 
	(nome, codigo_produto, valor_custo, valor_venda)
values 
	('Camiseta', 978020137962, 29.49, 35.99),
	('Calça',978047111709, 69.90, 99.99),
	('Meia', 978013030796, 9.99, 19.99),
	('Blusa', 978047118636, 40.90, 69.99),
	('Short',978013185794, 20.99, 49.99)
	
	
	insert into aula.cliente
    (nome, nome_produto)
values
    ('Josefina', 'sapato'),
    ('Marly', 'calça'),
    ('Marlon', 'meia'),
    ('Pietro', 'casaco'),
    ('Maria', 'chinelo')
	
insert into aula.documentos 
	(numero_documento, data_documento, valor_total, valor_liquido)
values
	('12345', '2023-08-23', 35.99, 29.49),
	('54321', '2023-08-21',  5.99, 3.99),
	('21435', '2023-08-22', 119.99, 89.99),
	('34512', '2023-08-19', 39.99, 30.90),
	('41235', '2023-08-24', 49.99, 190.99)
	
insert into aula.prod_documento 
	(id_documento, id_produto, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido) 
values
	(1, 1,  35.99, 0.00, 0.00, 35.99, 29.49),
	(2, 2, 5.99, 0.00, 0.00, 5.99, 3.99 ),
	(3, 3, 119.99, 0.00, 0.00, 119.99, 89.99),
	(4, 4, 39.99, 0.00, 0.00, 39.99, 30.90),
	(5, 5, 499.99, 0.00, 0.00, 499.99, 450.99)
	
select 
	aula.documentos.numero_documento, aula.documentos.data_documento, aula.documentos.valor_total, 
	aula.documentos.valor_liquido, aula.produtos.nome, aula.prod_documento.valor_unitario, 
	aula.prod_documento.valor_desconto, aula.prod_documento.valor_acrescimo, aula.prod_documento.valor_bruto, 
	aula.prod_documento.valor_liquido 
	
from aula.documentos
join aula.prod_documento on aula.documentos.id = aula.prod_documento.id_documento
join aula.produtos on aula.prod_documento.id_produto = aula.produtos.id
where aula.documentos.id = 2;

select * from aula.produtos where valor_venda > 100.00;

update aula.produtos set nome = 'Casaco' where id = 2;

update aula.produtos set valor_venda = 49.90  where id = 1;

SELECT 
    aula.documentos.numero_documento,   
    aula.produtos.nome,
FROM aula.documentos
JOIN aula.prod_documento ON aula.documentos.id = aula.prod_documento.id_documento
JOIN aula.produtos ON aula.prod_documento.id_produto = aula.produtos.id
JOIN aula.cliente ON aula.documentos.cliente_id = aula.cliente.id
WHERE aula.documentos.id = 2;