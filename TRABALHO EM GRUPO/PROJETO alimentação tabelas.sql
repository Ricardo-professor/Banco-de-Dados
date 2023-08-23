INSERT INTO ecommerce.bairro
	(nome)
VALUES
	('Vargem Grande'),
	('Albuquerque'),
	('Venda Nova'),
	('centro'),
	('bela vista');

INSERT INTO ecommerce.cidade
	(cidade, uf)
VALUES
	('Teresópolis', 'RJ'),
	('Petrópolis','RJ'),
	('Santos','SP'),
	('Areal','RJ'),
	('Leopoldina','MG');
	

INSERT INTO ecommerce.pessoa
	(nome, cpf)
VALUES
	('Raynan', '11111111111'),
	('Bernardo','22222222222'),
	('Douglas One', '33333333333'),
	('Douglas Dois', '44444444444'),
	('Eduardo', '55555555555'),
	('Manel', '66666666666'),
	('Marciano', '77777777777'),
	('EtBilu', '88888888888'),
	('Leonardo','99999999999'),
	('Jonas Brother','00000000000');

INSERT INTO ecommerce.categoria
	(codigo, nome, descricao)
VALUES
	(1, 'roupa', 'ARTIGOS DE PANO'),
	(2, 'higiene', 'ARTIGOS DE HIGIENE'),
	(3, 'bomboniere', 'BOMBONS'),
	(4, 'marcenaria', 'MADEIRAS'),
	(5, 'eletronicos', 'EQUIPAMENTOS ELETROELETRONICOS');

INSERT INTO ecommerce.funcionario
	(codigo, idpessoa)
VALUES
	(1, (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '11111111111')),
	(2, (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '22222222222')),
	(3, (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '33333333333')),
	(4, (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '44444444444')),
	(5, (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '55555555555'));
	
INSERT INTO ecommerce.cliente
	(codigo, nomeusuario, dtnascimento, nmendereco, idpessoa)
VALUES
	(1, 'Manelnick', '11-03-2000', '21 a', (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '66666666666')),
	(2, 'Marcianonick', '05-02-1960', '837 b', (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '77777777777')),
	(3, 'EtBilunick', '22-05-1970', 'casa 2', (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '88888888888')),
	(4, 'Leonardonick', '21-04-1990', '8', (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '99999999999')),
	(5, 'Jonasnick', '1-07-1980', '99', (SELECT idpessoa FROM ecommerce.pessoa WHERE cpf = '00000000000'));

INSERT INTO ecommerce.endereco
	(cep, logradouro, idcliente, idbairro, idcidade)
VALUES
	('11111111', 'rua a', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '1'), 1, 1),
	('22222222', 'rua b', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '2'), 2, 2),
	('33333333', 'rua c', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '3'), 5, 5),
	('44444444', 'rua d', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '4'), 1, 1),
	('55555555', 'rua e', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '5'), 3, 1);

INSERT INTO ecommerce.email
	(email, idcliente)
VALUES
	('Manel@gmail.com', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '1')),
	('Marciano@gmail.com', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '2')),
	('EtBilu@gmail.com', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '3')),
	('Leonardo@gmail.com', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '4')),
	('Jonas@gmail.com', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '5'));

INSERT INTO ecommerce.telefone
	(numtelefone, idcliente)
VALUES
	('1111-1111', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '1')),
	('2222-2222', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '2')),
	('3333-3333', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '3')),
	('4444-4444', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '4')),
	('5555-5555', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '5'));

INSERT INTO ecommerce.estoque
	(quantestoque, fabricacao)
VALUES
	(10, '1-03-2023'),
	(20, '2-03-2023'),
	(30, '3-03-2023'),
	(40, '4-03-2023'),
	(50, '5-03-2023'),
	(60, '6-03-2023'),
	(70, '7-03-2023'),
	(80, '8-03-2023'),
	(90, '9-03-2023'),
	(100,'10-03-2023');
	
INSERT INTO ecommerce.produto
	(codigo, nome, vlunit, idestoque, idcategoria)
VALUES
	(1, 'camisa a', 70.00, 7, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '1')),
	(2, 'camisa b', 50.00, 2, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '1')),
	(3, 'shampoo', 30.00, 4, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '2')),
	(4, 'papel higiênico', 6.00, 1, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '2')),
	(5, 'chokete', 6.00, 1, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '3')),
	(6, 'sonho de tango', 5.00, 1, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '3')),
	(7, 'pé da mesa', 50.00, 2, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '4')),
	(8, 'drywall', 100.00, 4, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '4')),
	(9, 'cd-ROM', 70.00, 3, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '5')),
	(10, 'tablet', 1700.00, 6, (SELECT idcategoria FROM ecommerce.categoria WHERE codigo = '5'));

INSERT INTO ecommerce.cadastro
	(codigo, emissao, idproduto, idfuncionario)
VALUES
	(1, '01-05-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '1'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '1')),
	(2, '02-05-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '2'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '1')),
	(3, '03-05-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '3'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '2')),
	(4, '04-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '4'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '2')),
	(5, '05-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '5'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '4')),
	(6, '06-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '6'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '4')),
	(7, '07-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '7'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '3')),
	(8, '08-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '8'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '3')),
	(9, '09-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '9'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '5')),
	(10, '10-04-2023', (SELECT idproduto FROM ecommerce.produto WHERE codigo = '10'), (SELECT idfuncionario FROM ecommerce.funcionario WHERE codigo = '5'));

INSERT INTO ecommerce.pedido
	(codigo, datapedido, idcliente)
VALUES
	(1, '10-10-2023', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '1')),
	(2, '11-10-2023', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '2')),
	(3, '13-10-2023', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '3')),
	(4, '15-10-2023', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '4')),
	(5, '15-10-2023', (SELECT idcliente FROM ecommerce.cliente WHERE codigo = '5'));

INSERT INTO ecommerce.item
	(quantidade, valorvenda, desconto, acrescimo, valortotal, idpedido, idproduto)
VALUES
	(
		5, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '1' ), 5, 10, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '1' ) * 5) - 5 + 10),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '1' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '1')
	),

	(
		10, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '4' ), 5, 15, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '4' ) *10) - 5 + 15),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '1' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '4')
	),
	
	(
		2, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '8' ), 0, 20, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '8' ) * 2) - 0 + 20),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '2' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '8')
	),
	
	(
		7, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '5' ), 0, 5, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '5' ) * 7) - 0 + 5),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '3' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '5')
	),
	
	(
		20, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '6' ), 5, 3, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '6' ) * 20) - 5 + 3),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '3' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '6')
	),
	
	(
		2, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '9' ), 0, 0, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '10' ) * 2) - 0 + 0),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '4' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '10')
	),
	
	(
		1, (SELECT vlunit FROM ecommerce.produto WHERE codigo = '10' ), 50, 0, 
		(((SELECT vlunit FROM ecommerce.produto WHERE codigo = '10' ) * 1) - 50 + 0),
		(SELECT idpedido FROM ecommerce.pedido WHERE codigo = '4' ),
		(SELECT idproduto FROM ecommerce.produto WHERE codigo = '10')
	);