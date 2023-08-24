--create schema atividade;

create table atividade.documentos (
	iddocumento serial primary key,
	numero_documento varchar (10) not null,
	data_documento date not null,
	valor_total double precision not null,
	valor_liquido double precision not null
);




