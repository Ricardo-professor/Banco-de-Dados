
--ADICIONANDO DESCRIÇÕES--

	UPDATE ecommerce.produto SET descricao = 'Camiseta roxa braba pros bons' WHERE idproduto = 1;
	UPDATE ecommerce.produto SET descricao = 'Camiseta gola v branca mamãe to forte' WHERE idproduto = 2;
	UPDATE ecommerce.produto SET descricao = 'Shampoo para calvos' WHERE idproduto = 3;
	UPDATE ecommerce.produto SET descricao = 'Papel higiênico DELUX' WHERE idproduto = 4;
	UPDATE ecommerce.produto SET descricao = 'Chocolate ao leite' WHERE idproduto = 5;
	UPDATE ecommerce.produto SET descricao = 'Pedaço de madeira que encaixa em algumas mesas' WHERE idproduto = 7;
	UPDATE ecommerce.produto SET descricao = 'Cholate sem leite' WHERE idproduto = 6;
	UPDATE ecommerce.produto SET descricao = 'Drywall de madeira (tendência)' WHERE idproduto = 8;

--DELETANDO INFORMAÇÕES--

	DELETE FROM ecommerce.estoque WHERE	idestoque = 8

--CONSULTA 1: CONFIRMANDO A EXCLUSÃO--

	SELECT * FROM ecommerce.estoque
	
--CONSULTA 2: Checando updates apenas com os produtos que possuem descrição--

	SELECT nome, descricao
	FROM ecommerce.produto
	WHERE descricao <> ''
	ORDER BY nome ASC
	
--CONSULTA 3: exibição dos clientes cadastrados no sistema e seus dados pessoais--

	SELECT
		codigo, nomeusuario nick, pes.cpf "CPF", pes.nome "Nome", dtnascimento as "Data de Nascimento",
		ed.cep as "CEP", ed.logradouro, nmendereco as "Numero/Complemento"
	FROM 
		ecommerce.cliente cli
		
	LEFT JOIN ecommerce.endereco ed ON ed.idcliente = cli.idcliente
	LEFT JOIN ecommerce.pessoa pes ON pes.idpessoa = cli.idpessoa
	
--Consulta 4: join em tabelas relevantes à tabela pedido(nota fiscal)--

	SELECT
		ped.codigo, datapedido, pess.nome, pess.cpf,  ed.logradouro, cli.nmendereco, ba.nome bairro,
		cid.cidade, cid.uf, ed.cep, ema.email, tel.numtelefone telefone, prod.nome "nome do produto", item.quantidade,
		item.valorvenda "preço(un)", item.valortotal líquido, total
		
	FROM
		ecommerce.pedido ped
		
		LEFT JOIN ecommerce.cliente cli ON cli.idcliente = ped.idcliente
		LEFT JOIN ecommerce.pessoa pess ON cli.idpessoa = pess.idpessoa
		LEFT JOIN ecommerce.endereco ed ON ed.idcliente = cli.idcliente
		LEFT JOIN ecommerce.bairro ba ON ba.idbairro = ed.idbairro
		LEFT JOIN ecommerce.cidade cid ON cid.idcidade = ed.idcidade
		LEFT JOIN ecommerce.telefone tel ON tel.idcliente = cli.idcliente
		LEFT JOIN ecommerce.email ema ON ema.idcliente = cli.idcliente
		LEFT JOIN ecommerce.item item ON item.idpedido = ped.idpedido
		LEFT JOIN ecommerce.produto prod ON prod.idproduto = item.idproduto
		LEFT JOIN (select idpedido, sum (valortotal) total from ecommerce.item
          group by item.idpedido) soma on soma.idpedido = ped.idpedido
		
	WHERE 
		ped.codigo = '1'
		
	
	ORDER BY codigo ASC
	
	
		
--Consulta 5: Contando o número de pedidos com a mesma id--
	
	SELECT item.idpedido, COUNT(*) AS "Pedidos feitos com essa id"
	FROM ecommerce.item item
	LEFT JOIN ecommerce.pedido AS ped ON ped.idpedido = item.idpedido
		  
	GROUP BY item.idpedido
	ORDER BY "Pedidos feitos com essa id" DESC, item.idpedido DESC