--1- Mostrar um documento com seus produtos (através de join)
select doc.iddocumento, doc.data_documento , pd.nome_produto

from exe_individual.produtodocumento pdd
left join exe_individual.documento doc on doc.iddocumento = pdd.iddocumento
left join exe_individual.produto pd on pd.idproduto = pdd.idproduto


--2- Mostrar lista de produtos com valor maior que 100,00

select nome_produto,vlvenda
from exe_individual.produto
where vlvenda > 100


--3- Mostrar um documento com o nome de cliente e o nome dos produtos

select cli.nome_cliente , pd.nome_produto

from exe_individual.produtodocumento pdd
left join exe_individual.cliente cli on cli.idcliente = pdd.idcliente
left join exe_individual.produto pd on pd.idproduto = pdd.idproduto