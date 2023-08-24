select dc.iddocs, dc.numero_doc, pdt.nome_prod 
from trabalho_bd.produtos pdt
left join trabalho_bd.prod_doc pd on pdt.idprodutos = pd.idprodutos
left join trabalho_bd.docs dc on  pd.iddocs = dc.iddocs
where dc.iddocs = 1

select vlvenda
from trabalho_bd.produtos 
where vlvenda>100

Select cl.nome_cliente, pdt.nome_prod
from trabalho_bd.clientes cl
left join trabalho_bd.prod_doc pd on cl.idclientes = pd.idclientes
left join trabalho_bd.produtos pdt on  pd.idprodutos = pdt.idprodutos
where pdt.produtos = 1