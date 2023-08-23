-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- QUERIES -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

SELECT * FROM projeto.bairro;
SELECT * FROM projeto.cidade;
SELECT * FROM projeto.logradouro;
SELECT * FROM projeto.categoria;
SELECT * FROM projeto.telefone;
SELECT * FROM projeto.endereco;
SELECT * FROM projeto.pedido_produto;
SELECT * FROM projeto.usuario;
SELECT * FROM projeto.pedido;
SELECT * FROM projeto.produto;

--listar pedidos com produtos relacionados
SELECT
	projeto.pedido.codigo AS "Código do Pedido",
	projeto.produto.codigo AS "Código do Produto",
	projeto.produto.nome AS "Nome do Produto",
	projeto.usuario.nome AS "Usuário do Pedido",
	projeto.pedido_produto.quantidade AS "Quantidade no Pedido",
	CONCAT ( 'R$ ', projeto.pedido_produto.valor_unitario) AS "Valor da Unidade",
	CONCAT ( 'R$ ', projeto.pedido_produto.valor_desconto) AS "Valor do Desconto",
	CONCAT ( 'R$ ', projeto.pedido_produto.valor_acrescimo) AS "Valor do Acrescimo",
	CONCAT ( 'R$ ', projeto.pedido_produto.valor_bruto) AS "Valor Total Bruto",
	CONCAT ( 'R$ ', projeto.pedido_produto.valor_liquido) AS "Valor Total Liquido"

FROM projeto.pedido_produto

INNER JOIN projeto.pedido ON projeto.pedido_produto.id_pedido = projeto.pedido.idpedido
INNER JOIN projeto.produto ON projeto.pedido_produto.id_produto = projeto.produto.idproduto
INNER JOIN projeto.usuario ON projeto.pedido.idusuario = projeto.usuario.idusuario
ORDER BY projeto.pedido.codigo
						
--listar usuarios por numero de pedidos
SELECT 	projeto.usuario.codigo AS "Codigo",
		projeto.usuario.nome AS "Nome",
COUNT(projeto.pedido.idpedido) AS "Numero de Pedidos"
FROM projeto.pedido
LEFT JOIN projeto.usuario	
ON projeto.pedido.idusuario = projeto.usuario.idusuario
GROUP BY projeto.usuario.nome, projeto.usuario.codigo
ORDER BY "Numero de Pedidos" DESC

-- Selecionar Endereços
SELECT 	projeto.logradouro.nome AS "Logradouro",
		projeto.bairro.nome AS "Bairro",
		projeto.cidade.nome AS "Cidade",
		projeto.cidade.uf AS "Estado",
		projeto.logradouro.cep AS "CEP",
		projeto.usuario.nome AS "Nome"
FROM projeto.endereco
INNER JOIN projeto.logradouro ON projeto.logradouro.idlogradouro = projeto.endereco.idlogradouro
INNER JOIN projeto.bairro ON projeto.bairro.idbairro = projeto.endereco.idbairro
INNER JOIN projeto.cidade ON projeto.cidade.idcidade = projeto.endereco.idcidade
INNER JOIN projeto.usuario ON projeto.usuario.idusuario = projeto.endereco.idusuario

-- listar produtos no pedido selecionado (ex: 3)
SELECT  projeto.pedido.codigo 										AS "Código da Venda",
        projeto.produto.nome  										AS "Nome", 
        projeto.pedido_produto.quantidade          					AS "Quantidade",
        CONCAT ( 'R$ ', projeto.pedido_produto.valor_unitario)      AS "Valor Unitário",
        CONCAT ( 'R$ ', projeto.pedido_produto.valor_desconto)      AS "Valor Desconto",
        CONCAT ( 'R$ ', projeto.pedido_produto.valor_acrescimo)     AS "Valor Acréscimo",
        CONCAT ( 'R$ ', projeto.pedido_produto.valor_bruto)         AS "Valor Bruto",
        CONCAT ( 'R$ ', projeto.pedido_produto.valor_liquido)       AS "Valor Líquido"
FROM projeto.pedido_produto
INNER JOIN projeto.produto ON projeto.pedido_produto.id_produto = projeto.produto.idproduto
INNER JOIN projeto.pedido  ON projeto.pedido_produto.id_pedido  = projeto.pedido.idpedido
WHERE projeto.pedido_produto.id_pedido = 3 -- TROCAR PEDIDO

-----------------------------------------------------------------------------------------------------------------------------------------------
                                    ----- NOTA FISCAL -----
-----------------------------------------------------------------------------------------------------------------------------------------------														

SELECT  projeto.pedido.codigo AS "Código do Pedido",
		comp.nome AS "Comprador",
        vend.nome AS "Vendedor",
		projeto.pedido.data_pedido AS "Expedição",
		CONCAT ( 'R$ ', ROUND(SUM(projeto.produto.valor_unitario * projeto.pedido_produto.quantidade), 2)) AS "Valor Total",
		STRING_AGG(projeto.produto.nome, ', ') AS "Lista de Compras",
		CONCAT(projeto.logradouro.nome, ', ', 
			  projeto.bairro.nome, ' - ',
			  projeto.cidade.nome, ', ', projeto.cidade.uf, ' - CEP: ', 
			  projeto.logradouro.cep) AS "Endereço de Envio"
FROM projeto.pedido_produto
--INNER JOIN PEDIDOS
INNER JOIN projeto.produto ON projeto.pedido_produto.id_produto = projeto.produto.idproduto
INNER JOIN projeto.pedido ON projeto.pedido_produto.id_pedido = projeto.pedido.idpedido
INNER JOIN projeto.usuario comp ON comp.idusuario = projeto.pedido.idusuario
INNER JOIN projeto.usuario vend ON vend.idusuario = projeto.produto.idusuario
--INNER JOIN ENDERECOS
INNER JOIN projeto.endereco ON comp.idusuario = projeto.endereco.idusuario
INNER JOIN projeto.logradouro ON projeto.logradouro.idlogradouro = projeto.endereco.idlogradouro
INNER JOIN projeto.bairro ON projeto.bairro.idbairro = projeto.endereco.idbairro
INNER JOIN projeto.cidade ON projeto.cidade.idcidade = projeto.endereco.idcidade
--GROUPBY
GROUP BY 	projeto.pedido.codigo, 
			comp.nome,
			vend.nome,
			projeto.pedido.data_pedido,
			projeto.logradouro.nome,
			projeto.bairro.nome,
			projeto.cidade.nome,
			projeto.logradouro.cep,
			projeto.cidade.uf