--create schema atividade;

create table atividade.produtos (
	idprodutos serial primary key,
	codigo_produto varchar (10) not null,
	nome_produto varchar (50) not null,
	valor_custo double precision not null,
	valor_venda double precision not null
)




