--vendas itens--
--select * from compra_venda.carrinhoitem;
update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 1)
where iditem = 1;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 1)
where iditem = 2;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 2)
where iditem = 3;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 3)
where iditem = 4;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 5)
where iditem = 5;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 5)
where iditem = 6;

update compra_venda.carrinhoItem
set subtotal = qtdItem * (select valoruni from cadastroProduto.produto where idproduto = 4)
where iditem = 7;

--vendas no carrinho--
--select * from compra_venda.carrinho;

update compra_venda.carrinho
set 
 qtdvendida = (select sum(qtditem) from compra_venda.carrinhoItem where fk_idcarrinho = 1),
 totalcarrinho = (select sum(subtotal) from compra_venda.carrinhoItem where fk_idcarrinho = 1)
where idcarrinho = 1;

update compra_venda.carrinho
set 
 qtdvendida = (select sum(qtditem) from compra_venda.carrinhoItem where fk_idcarrinho = 2),
 totalcarrinho = (select sum(subtotal) from compra_venda.carrinhoItem where fk_idcarrinho = 2)
where idcarrinho = 2;

update compra_venda.carrinho
set 
 qtdvendida = (select sum(qtditem) from compra_venda.carrinhoItem where fk_idcarrinho = 3),
 totalcarrinho = (select sum(subtotal) from compra_venda.carrinhoItem where fk_idcarrinho = 3)
where idcarrinho = 3;

update compra_venda.carrinho
set 
 qtdvendida = (select sum(qtditem) from compra_venda.carrinhoItem where fk_idcarrinho = 4),
 totalcarrinho = (select sum(subtotal) from compra_venda.carrinhoItem where fk_idcarrinho = 4)
where idcarrinho = 4;

update compra_venda.carrinho
set 
 qtdvendida = (select sum(qtditem) from compra_venda.carrinhoItem where fk_idcarrinho = 5),
 totalcarrinho = (select sum(subtotal) from compra_venda.carrinhoItem where fk_idcarrinho = 5)
where idcarrinho = 5;

--vendedor--
--select * from cadastrousuario.vendedor order by idvendedor asc;

update cadastrousuario.vendedor
set 
 qtdvendida = (select sum(qtdvendida) from compra_venda.carrinho where fk_idvendedor = 1),
 totalvendido = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idvendedor = 1)
where idvendedor = 1;

update cadastrousuario.vendedor
set 
 qtdvendida = (select sum(qtdvendida) from compra_venda.carrinho where fk_idvendedor = 2),
 totalvendido = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idvendedor = 2)
where idvendedor = 2;

update cadastrousuario.vendedor
set 
 qtdvendida = (select sum(qtdvendida) from compra_venda.carrinho where fk_idvendedor = 4),
 totalvendido = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idvendedor = 4)
where idvendedor = 4;

update cadastrousuario.vendedor
set 
 qtdvendida = (select sum(qtdvendida) from compra_venda.carrinho where fk_idvendedor = 5),
 totalvendido = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idvendedor = 5)
where idvendedor = 5;

--cliente--
--select * from cadastrousuario.cliente order by idcliente asc;

update cadastrousuario.cliente
set 
 qtdcomprada = (select sum(qtdvendida) from compra_venda.carrinho where fk_idcliente = 1),
 totalgasto = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idcliente = 1)
where idcliente = 1;

update cadastrousuario.cliente
set 
 qtdcomprada = (select sum(qtdvendida) from compra_venda.carrinho where fk_idcliente = 2),
 totalgasto = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idcliente = 2)
where idcliente = 2;

update cadastrousuario.cliente
set 
 qtdcomprada = (select sum(qtdvendida) from compra_venda.carrinho where fk_idcliente = 2),
 totalgasto = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idcliente = 2)
where idcliente = 3;

update cadastrousuario.cliente
set 
 qtdcomprada = (select sum(qtdvendida) from compra_venda.carrinho where fk_idcliente = 4),
 totalgasto = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idcliente = 4)
where idcliente = 4;

update cadastrousuario.cliente
set 
 qtdcomprada = (select sum(qtdvendida) from compra_venda.carrinho where fk_idcliente = 5),
 totalgasto = (select sum(totalcarrinho) from compra_venda.carrinho where fk_idcliente = 5)
where idcliente = 5;


--nota fiscal--
select 
	cr.codigo,us.nome,cr.datacarrinho,cr.totalcarrinho
from compra_venda.carrinho cr
left join cadastrousuario.cliente clt on cr.fk_idcliente = clt.idcliente
left join cadastrousuario.usuario us on clt.fk_idusuario = us.idusuario where clt.idcliente = 2





