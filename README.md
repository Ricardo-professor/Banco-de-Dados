## Tarefa de Banco de Dados 02 - Lucas Caldas - lucas.m.caldas@aluno.senai.br
<hr>

#### Criar uma tabela de documentos com os seguintes campos
* id sequencial
* número do documento
* data do documento
* valor total
* valor liquido

#### Criar uma tabela de Clientes com os seguintes campos:
* id sequencial
* Nome
  
#### Criar uma tabela de produtos com os seguintes campos:
* id sequencial
* codigo do produto
* nome do produto
* valor do custo do produto
* valor de venda do produto

#### Criar uma tabela de produtos do documento com os seguintes campos:
* id sequencial
* documento (relacionado à tabela de documentos - chave estrangeira)
* produto (relacionado à tabela de produtos - chave estrangeira)
* valor unitário
* valor de desconto
* valor de acréscimo
* valor bruto
* valor liquido

<hr>

### Inserir 5 registros em cada tabela pelo menos

#### Consultas:
* Mostrar um documento com seus produtos (através de join)
* Mostrar lista de produtos com valor maior que 1000,00 (modifiquei porque so coloquei produto acima de 100)
* Mostrar um documento com o nome de cliente e o nome dos produtos

#### Atualizações:
* Alterar o nome do produto
* Alterar o valor do produto
* Reajustar em 10% o valor de venda dos produtos

### Diagrama ER
![ERD](/DiagramaER.png)