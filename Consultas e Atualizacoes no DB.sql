--Consultas:
--1- Mostrar um documento com seus produtos (através de join)
SELECT doc.iddocumento, prod.nome_prod, prod_doc.qtd, prod_doc.val_un, prod_doc.val_desc, prod_doc.val_acr, prod_doc.val_liquido_proddoc

FROM exercicio_gustavomonerat.prod_doc AS prod_doc
LEFT JOIN exercicio_gustavomonerat.documento AS doc on doc.iddocumento = prod_doc.iddocumento
LEFT JOIN exercicio_gustavomonerat.produto AS prod on prod.idproduto = prod_doc.idproduto
WHERE doc.iddocumento = 1;

--2- Mostrar lista de produtos com valor maior que 100,00
SELECT prod.nome_prod, prod.val_venda_prod

FROM exercicio_gustavomonerat.produto AS prod
WHERE prod.val_venda_prod >100;

--3- Mostrar um documento com o nome de cliente e o nome dos produtos
SELECT cli.nome_cli, doc.iddocumento, prod.nome_prod

FROM exercicio_gustavomonerat.prod_doc AS prod_doc
LEFT JOIN exercicio_gustavomonerat.documento AS doc on doc.iddocumento = prod_doc.iddocumento
LEFT JOIN exercicio_gustavomonerat.produto AS prod on prod.idproduto = prod_doc.idproduto
LEFT JOIN exercicio_gustavomonerat.cliente AS cli on cli.idcliente = doc.idcliente
WHERE doc.iddocumento = 1;

--Atualizações:
--1- Alterar o nome do produto
UPDATE exercicio_gustavomonerat.produto
SET nome_prod = 'Bermuda'	
WHERE idproduto = 1;

SELECT*FROM exercicio_gustavomonerat.produto;

--2- Alterar o valor do produto
UPDATE exercicio_gustavomonerat.produto
SET val_custo_prod = 80
WHERE idproduto = 1;

SELECT * FROM exercicio_gustavomonerat.produto;

--3- Reajustar em 10% o valor de venda dos produtos
UPDATE exercicio_gustavomonerat.produto
SET val_venda_prod = val_venda_prod+(val_venda_prod*0.1);

SELECT * FROM exercicio_gustavomonerat.produto;

