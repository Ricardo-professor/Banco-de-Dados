-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- INSERT TABLES -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

INSERT INTO projeto.bairro
	(nome)
VALUES
	('Jardim Plutão'),
	('Jardim Primavera'),
	('Lagoa Azul'),
	('Bela Vista'),
	('Boa Esperança'),
	('Parque das Flores');

INSERT INTO projeto.cidade
	(nome, uf)
VALUES
	('São Paulo', 'SP'),
	('Rio de Janeiro', 'RJ'),
	('Porto Alegre', 'RS'),
	('Fortaleza', 'CE'),
	('Belo Horizonte', 'MG');
	
INSERT INTO projeto.logradouro
	(nome, cep)
VALUES
	('Rua das Acácias', '04567890'),
	('Avenida do Sol Nascente', '22011456'),
	('Rua das Magnólias', '90123456'),
	('Rua da Praia', '60000101'),
	('Avenida das Palmeiras', '30123222'),
	('Avenida da Montanha', '56789012'),
	('Avenida do Bosque Verde', '87654321'),
	('Avenida das Rosas', '12345678');
	
INSERT INTO projeto.categoria
	(nome, descricao)
VALUES
	('Beleza', 'Oferece uma variedade de produtos relacionados a cuidados pessoais, incluindo maquiagem, cuidados com a pele, produtos para o cabelo e perfumes.'),
	('Tecnologia', 'Oferece uma variedade de produtos relacionados a eletrônicos, gadgets e dispositivos.'),
	('Perfumaria', 'Dedicada à venda de uma ampla gama de fragrâncias e produtos relacionados ao aroma.' ),
	('Papelaria', 'oferece uma ampla variedade de produtos relacionados à escrita, organização e criatividade.'),
	('Moda', 'Oferece uma vasta seleção de roupas, calçados, acessórios e itens relacionados à moda.');

INSERT INTO projeto.usuario
	(nome, cpf, nome_usuario, email, data_nasc, numero_endereco)
VALUES
	('Maria da Silva Santos', '90028482000', 'MDSantos', 'MariaSSantos@gmail.com', '15/02/1983', '52'),
	('Ana Rodrigues', '98765432100', 'ARodrigues', 'AnaR@gmail.com', '25/03/1985', '42'),
	('Pedro Santos', '55555555500', 'PSantos', 'PedroS@gmail.com', '18/09/1995', '28'),
	('Carla Lima', '77777777700', 'CLima', 'CarlaL@gmail.com', '03/12/1988', '37'),
	('Rafaela Costa', '44444444400', 'RCosta', 'RafaelaC@gmail.com', '22/06/1977', '44'),
	('Fernando Oliveira', '12345678900', 'FOliveira', 'FernandoO@gmail.com', '09/08/1990', '32'),
	('Marta Pereira', '55555555501', 'MPereira', 'MartaP@gmail.com', '14/05/1982', '41'),
	('Luiz Santos', '98765432101', 'LSantos', 'LuizS@gmail.com', '27/11/1975', '47');
	
INSERT INTO projeto.pedido
	(data_pedido, idusuario)
VALUES
	('15/08/2023', 2),
	('05/08/2023', 4),
	('30/07/2023', 5),
	('10/07/2023', 1),
	('25/06/2023', 3);
	
INSERT INTO projeto.endereco
	(idlogradouro, idbairro, idcidade, idusuario)
VALUES
	(1, 1, 1, 1),
	(1, 2, 1, 1),
	(2, 2, 2, 3),
	(3, 3, 3, 2),
	(4, 4, 4, 4),
	(6, 2, 2, 6),
	(7, 5, 5, 8),
	(8, 3, 3, 7),
	(5, 5, 5, 5);

INSERT INTO projeto.telefone
	(numero, idusuario)
VALUES
	('11987654321', 1),
	('21998765432', 2),
	('51987651234', 3),
	('85998762345', 4),
	('31987653456', 5),
	('11998765432', 1),
	('85965432109', 4),
	('21998765432', 6),
	('51987654321', 7),
	('31976543210', 8);

INSERT INTO projeto.produto
	(nome, descricao, data_de_fabricacao, quantidade_em_estoque, valor_unitario, idusuario, idcategoria)
VALUES
	('Kit de Maquiagem de Luxo', ' Este kit de maquiagem de luxo inclui tudo o que você precisa para criar looks incríveis, desde sombras vibrantes até um batom elegante e uma máscara de cílios para um visual deslumbrante. Transforme sua aparência com facilidade!', '18/06/2023', 10, 289.99, 2, 1),
	('Notebook Ultrafino', 'Um notebook ultrafino e leve com desempenho excepcional para trabalho e entretenimento. Perfeito para profissionais em movimento.', '01/08/2022', 4, 2999.99, 6, 2),
	('Perfume Floral', 'Uma fragrância floral encantadora que exala elegância e sofisticação. Deixe uma impressão duradoura onde quer que vá.', '22/07/2023', 6, 199.99, 2, 3),
	('Conjunto de Canetas Gel Pastel', 'Um conjunto de canetas gel pastel com 8 cores suaves e elegantes. Perfeito para dar um toque delicado aos seus projetos artísticos e notas.', '14/04/2023', 20, 19.99, 8, 4),
	('Vestido de Cocktail Elegante', 'Este vestido de cocktail elegante é perfeito para qualquer ocasião especial. Com um design clássico, detalhes em renda e um corte que valoriza a silhueta, você se destacará em festas e eventos.', '28/05/2023', 15, 149.99, 7, 5),
	('Smartphone de Última Geração', 'O mais recente smartphone com tecnologia de ponta para mantê-lo conectado e produtivo. Capture fotos incríveis, desfrute de jogos de alta qualidade e muito mais.', '10/09/2023', 8, 799.99, 6, 2),
	('Kit de Pintura em Aquarela', 'Libere seu lado artístico com este kit de pintura em aquarela. Inclui pincéis de alta qualidade e uma paleta de cores vibrantes para criar obras de arte deslumbrantes.', '20/08/2023', 18, 39.99, 8, 4),
	('Sapatos Esportivos Aerodinâmicos', 'Estes sapatos esportivos não apenas proporcionam conforto durante os treinos, mas também possuem um design aerodinâmico que aumenta o desempenho. Prontos para ajudá-lo a atingir seus objetivos.', '15/06/2023', 9, 79.99, 7, 5);

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	2, 3, 3, projeto.produto.valor_unitario,
	50,	0, 3 * projeto.produto.valor_unitario,
	(3 * projeto.produto.valor_unitario) - 50 + 0
FROM projeto.produto
WHERE projeto.produto.idproduto = 3; -- COLOCAR AQUI O IDE DO PRODUTO

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	1, 6, 2, projeto.produto.valor_unitario,
	99,	15, 2 * projeto.produto.valor_unitario,
	(2 * projeto.produto.valor_unitario) - 99 + 15
FROM projeto.produto
WHERE projeto.produto.idproduto = 6; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	1, 2, 1, projeto.produto.valor_unitario,
	0, 50, 1 * projeto.produto.valor_unitario,
	(1 * projeto.produto.valor_unitario) - 0 + 50
FROM projeto.produto
WHERE projeto.produto.idproduto = 2; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	2, 1, 6, projeto.produto.valor_unitario,
	120, 0, 6 * projeto.produto.valor_unitario,
	(6 * projeto.produto.valor_unitario) - 120 + 0
FROM projeto.produto
WHERE projeto.produto.idproduto = 1; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	5, 7, 2, projeto.produto.valor_unitario,
	0, 30, 2 * projeto.produto.valor_unitario,
	(2 * projeto.produto.valor_unitario) - 0 + 30
FROM projeto.produto
WHERE projeto.produto.idproduto = 7; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	3, 5, 7, projeto.produto.valor_unitario,
	80,	10, 7 * projeto.produto.valor_unitario,
	(7 * projeto.produto.valor_unitario) - 80 + 10
FROM projeto.produto
WHERE projeto.produto.idproduto = 5; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	3, 8, 4, projeto.produto.valor_unitario,
	50,	20, 4 * projeto.produto.valor_unitario,
	(4 * projeto.produto.valor_unitario) - 50 + 20
FROM projeto.produto
WHERE projeto.produto.idproduto = 8; 

INSERT INTO projeto.pedido_produto
	(id_pedido, id_produto, quantidade, valor_unitario, valor_desconto, valor_acrescimo, valor_bruto, valor_liquido)
SELECT
	4, 5, 5, projeto.produto.valor_unitario,
	66,	0, 5 * projeto.produto.valor_unitario,
	(5 * projeto.produto.valor_unitario) - 66 + 0
FROM projeto.produto
WHERE projeto.produto.idproduto = 5; 

-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- DELETE AND UPDATE VALUES -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

DELETE FROM projeto.endereco WHERE idbairro = 1;
DELETE FROM projeto.bairro WHERE nome = 'Jardim Plutão';

UPDATE projeto.usuario SET nome = 'Maria Salgueiro dos Santos' WHERE idusuario = 1;