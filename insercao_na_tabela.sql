insert into cadastrousuario.usuario
	(codigo,nome,nomeusuario,cpf,email,datanascimento)
values
	('31j1k21','gabriel','gargar','192.192.192-05','meuemail@gmail.com','2003-04-10'),
	('31j1k22','samara','sarmar','192.192.192-06','meuemail2@gmail.com','2003-04-11'),
	('31j1k23','bárbara','barbar','192.192.192-07','meuemail3@gmail.com','2003-04-12'),
	('31j1k24','natally','natar','192.192.192-08','meuemail4@gmail.com','2003-04-13'),
	('31j1k25','andré','andar','192.192.192-09','meuemail5@gmail.com','2003-04-14'),
	('31j1k26','nathan','nardar','192.192.192-10','meuemail6@gmail.com','2003-04-15'),
	('31j1k27','gabrss','sdfs','192.192.192-11','meuemail7@gmail.com','2003-04-16'),
	('31j1k28','gabrsdfl','asdf','192.192.192-12','meuemail8@gmail.com','2003-04-17'),
	('31j1k29','gafaiel','asfa','192.192.192-13','meuemail9@gmail.com','2003-04-18'),
	('31j1k30','esbriel','asdfs','192.192.192-14','meuemail10@gmail.com','2003-04-19');


insert into cadastroUsuario.vendedor
    (codigo,fk_idusuario,qtdvendida,totalvendido)
values
    ('4955782726',1,0,0),
    ('0790124732',2,0,0),
    ('0119621238',3,0,0),
    ('3577510535',4,0,0),
    ('8763681346',5,0,0),
    ('0830247437',6,0,0),
    ('9362770608',7,0,0),
    ('0430291715',8,0,0),
    ('0899917411',9,0,0),
    ('5079168250',10,0,0);
	
insert into cadastroUsuario.cliente
    (codigo,fk_idusuario,totalgasto,qtdcomprada)
values
    ('4955782726',1,0.0,0),
    ('0790124732',2,0.0,0),
    ('0119621238',3,0.0,0),
    ('3577510535',4,0.0,0),
    ('8763681346',5,0.0,0),
    ('0830247437',6,0.0,0),
    ('9362770608',7,0.0,0),
    ('0430291715',8,0.0,0),
    ('0899917411',9,0.0,0),
    ('5079168250',10,0.0,0);

insert into cadastroUsuario.telefone
	(codigo,fk_idUsuario,numero)
values
	('yhsyau5lwd',1,'5578963985213'),
	('ytrgyh7jgf',2,'5563998545215'),
	('yjuhathyjk',3,'5526985745621'),
	('lokju6tghb',4,'5521969547851'),
	('liokjj7hgh',5,'5524975842584'),
	('yjj5rtvhkj',6,'5521985412478'),
	('laoiuhj87k',7,'5522987414754'),
	('etybh7ty78',8,'5535978412475'),
	('iomhjhgl7b',9,'5532954152484'),
	('yjuhgthyjk',9,'5522981745621'),
	('uhbllyh7hi',10,'5535948412574');


insert into cadastroUsuario.logradouro 
     (codigo, nomerua)
values
    ('45524f156g','Broadway'),
    ('64894yhf4j','Champs-Élysées'),
    ('20fg154grs','Oxford Street'),
    ('057654ngz7','Shibuya Crossing'),
    ('0925714s56','George Street'),
    ('507435g1d2','Avenida Atlântica'),
    ('64345v551k','Unter den Linden'),
    ('26s7454g8d','Via del Corso'),
    ('7644des26f','Tverskaya Street'),
    ('45789aef55','Long Street');

insert into cadastroUsuario.bairro
     (codigo, nomeBairro)
values
    ('duh8ff156g','Shibuya'),
    ('g5gj4yhf4j','Soho'),
    ('4sfgh45grs','Copacabana'),
    ('kyjk54ngz7','Montmartre'),
    ('lkjs214s56','Harlem'),
    ('mhgsk5g1d2','Kreuzberg'),
    ('ehggdv551k','Shinjuku'),
    ('kasfhn4g8d','La Boca'),
    ('ajf4des26f','Vesterbro'),
    ('sfhf4aef55','Gamla Stan');

insert into cadastroUsuario.uf_pais
	(codigo, uf, pais)
values
	('duh8ff156g','rio de janeiro', 'Brasil'),
    ('g5gj4yhf4j','são paulo', 'Brasil'),
    ('4sfgh45grs','santa carina', 'Brasil'),
    ('kyjk54ngz7','rio grande do sul', 'Brasil'),
    ('lkjs214s56','amapa','Brasil'),
    ('mhgsk5g1d2','sergipe','Brasil'),
    ('ehggdv551k','Minas gerais', 'Brasil'),
    ('kasfhn4g8d','New york', 'USA'),
    ('ajf4des26f','uppland','Suécia'),
    ('sfhf4aef55','Mato grosso', 'Brasil');

insert into cadastroUsuario.cidade
     (codigo, nomecidade)
values
    ('du524f156g','Tóquio'),
    ('g7894yhf4j','Londres'),
    ('4sfg154grs','Rio de Janeiro'),
    ('k47654ngz7','Paris'),
    ('lk25714s56','Nova York'),
    ('mh7435g1d2','Berlim'),
    ('eh345v551k','Tóqui'),
    ('kas7454g8d','Buenos Aires'),
    ('7644des26f','Copenhague'),
    ('sf789aef55','Estocolmo');

insert into cadastroUsuario.endereco
    (codigo,fk_idusuario,fk_idlogradouro,numero,fk_idbairro,fk_idcidade,cep,fk_idufpais)
values
    ('167sdfs74',1,2,72,1,1,'32816405',1),
    ('sdffsdfs',2,3,712,2,4,'70999561',1),
    ('1674sdf774',3,3,7,6,3,'48798314',1),
    ('341asda599',4,4,172,4,8,'26717248',1),
    ('5669sdf159',5,5,629,5,3,'90295706',1),
    ('1257r21447',6,7,23,6,6,'63491742',1),
    ('123asd5607',7,1,78,7,4,'66813287',1),
    ('361f282053',8,1,90,8,9,'68333633',1),
    ('638gfgf267',9,2,54,9,1,'89290634',1),
	('638bvcb267',9,2,54,10,1,'89290634',1),
    ('5zxcv94286',10,3,23,9,8,'86842196',1);



insert into cadastroproduto.categoria
    (codigo, nome, descricao)
values
    ('2345', 'moda', 'roupas, acessorios'),
    ('4568', 'beleza e cuidados pessoais', 'itens para higiene e bem estar'),
    ('8547', 'pet', 'itens para seu pet'),
    ('7895', 'utensilios para cozinha', 'itens para sua cozinha'),
    ('9845', 'jogos', 'diversão e afins');
   

insert into cadastroproduto.produto
    (codigo, nome, descricao, qtdestoque, dataFab, valoruni, fk_idvendedor, fk_idcategoria)
values
    ('2345', 'bolsa de couro','bolsa de couro unissex',                   1234, '2022-08-22', 200, 1, 1),
    ('4568', 'batom', 'batom vermelho',                                   2514, '2022-08-22', 2.5, 2, 2),
    ('8547', 'panela de pressão', 'panela de pressão alumímio polido 7L', 585, '2022-08-22', 20, 3 , 4),
    ('7895', 'ração para gatos', 'ração para gatos castrados sabor carne',585, '2022-08-22', 120, 4, 3),
    ('9845', 'perfume', 'perfume floral feminino 100 ml',                 584, '2022-08-22', 250, 2, 2),
    ('7458', 'shampoo', 'shampoo para cabelos oleosos 200ml',             548, '2022-08-22', 7.5, 2, 2),
    ('9874', 'tênis', 'tênis de couro feminino tamanho 36',               56, '2022-08-22', 350, 1, 1),
    ('7845', 'quebra-cabeças', 'quebra-cabeças 60 peças',                 54, '2022-08-22', 23, 5, 5),
    ('7460', 'legging feminina', 'legging preta feminina tamanho único',  85, '2022-08-22', 35, 1, 1),
    ('7459', 'cordão', 'cordão feminino prata 925',                       58, '2022-08-22', 120, 1, 1);



insert into compra_venda.carrinho
    (codigo, fk_idvendedor, fk_idcliente, datacarrinho, qtdvendida, totalcarrinho)
values
    ('fud8suf8h',1,1,'2023-10-02',0,0),
    ('fudreuf8h',2,2,'2023-10-02',0,0),
    ('frew3uf8h',2,2,'2023-10-02',0,0),
    ('fud654f8h',4,4,'2023-10-02',0,0),
    ('fud876f8h',5,5,'2023-10-02',0,0);

insert into compra_venda.carrinhoItem
    (codigo, fk_idcarrinho, fk_idProduto, qtdItem,subTotal)
values
    ('g87guj89',1,1,3,0),
    ('g8765789',1,1,2,0),
    ('ggfguj89',2,2,3,0),
    ('gs7fgsf9',3,3,4,0),
	('g87fsdff',5,5,2,0),
	('g87asad9',5,5,4,0),
    ('g8bnmuj9',4,4,5,0);
 
 



