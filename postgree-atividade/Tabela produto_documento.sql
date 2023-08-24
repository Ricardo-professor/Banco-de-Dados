--create schema atividade;

create table atividade.produtos_documento (
	idprodutos int references atividade.produtos (idprodutos),
	iddocumento int references atividade.documentos (iddocumento),
	valor_unitario double precision not null,
	valor_desconto double precision not null,
	valor_acrescimo double precision not null,
	valor_bruto double precision not null,
	valor_liquido double precision not null,
	quantidade double precision not null
);



