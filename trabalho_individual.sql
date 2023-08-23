-- Passo 1: Criar o esquema "trabalho"
CREATE SCHEMA trabalho;

-- Passo 2: Criar a tabela "documentos"
CREATE TABLE trabalho.documentos (
    id_documentos SERIAL PRIMARY KEY,
    numero_do_documento VARCHAR(10) UNIQUE NOT NULL,
    data_do_documento DATE NOT NULL,
    valor_total DOUBLE PRECISION NOT NULL,
    valor_liquido DOUBLE PRECISION NOT NULL
);

-- Passo 3: Criar a tabela "produtos"
CREATE TABLE trabalho.produtos (
    id_produtos SERIAL PRIMARY KEY,
    codigo_do_produto VARCHAR(10) UNIQUE NOT NULL,
    nome_do_produto VARCHAR(100) NOT NULL,
    valor_do_custo DOUBLE PRECISION NOT NULL,
    valor_de_venda DOUBLE PRECISION NOT NULL
);

-- Passo 4: Criar a tabela "venda"
CREATE TABLE trabalho.venda (
    id_venda SERIAL PRIMARY KEY,
    id_documentos INT REFERENCES trabalho.documentos (id_documentos),
    id_produtos INT REFERENCES trabalho.produtos (id_produtos),
    valor_unit DOUBLE PRECISION NOT NULL,
    valor_desconto DOUBLE PRECISION,
    valor_acrescimo DOUBLE PRECISION,
    valor_bruto DOUBLE PRECISION,
    valor_liquido DOUBLE PRECISION
);

-- Passo 5: Inserir dados nas tabelas
INSERT INTO trabalho.documentos
    (numero_do_documento, data_do_documento, valor_total, valor_liquido)
VALUES
    ('01', '2023-08-21', 11, 16),
    ('02', '2023-08-22', 12, 17),
    ('03', '2023-08-23', 13, 18),
    ('04', '2023-08-24', 14, 19),
    ('05', '2023-08-25', 15, 20);

INSERT INTO trabalho.produtos
    (codigo_do_produto, nome_do_produto, valor_do_custo, valor_de_venda)
VALUES
    ('100', 'Lápis', 0.5, 1),
    ('101', 'Fichário', 51, 102),
    ('102', 'Apontador', 0.7, 3),
    ('103', 'Caneta', 0.8, 4),
    ('104', 'Papel', 0.9, 5);

INSERT INTO trabalho.venda
    (id_documentos, id_produtos, valor_unit, valor_desconto, valor_acrescimo, valor_bruto)
VALUES
    (6, 1, 10, 3, 1, 50),
    (7, 2, 10, 5, 0, 60),
    (8, 3, 10, 30, 0, 500),
    (9, 4, 10, 0, 10, 70),
    (10, 5, 10, 12, 3, 40);

-- Passo 6: Atualizar valores na tabela "venda"
UPDATE trabalho.venda
SET valor_liquido = (valor_bruto + valor_acrescimo - valor_desconto);

-- Consultas:
-- Consulta 1: Mostrar os números de documento, datas e nomes dos produtos das vendas
SELECT doc.numero_do_documento, doc.data_do_documento, pr.nome_do_produto
FROM trabalho.venda v
JOIN trabalho.documentos doc ON doc.id_documentos = v.id_documentos
JOIN trabalho.produtos pr ON pr.id_produtos = v.id_produtos;

-- Consulta 2: Mostrar todos os produtos com valor de venda maior ou igual a 100
SELECT * FROM trabalho.produtos WHERE valor_de_venda >= 100;

-- Consulta 3: Mostrar os números de documento, datas e nomes dos produtos das vendas novamente
SELECT doc.numero_do_documento, doc.data_do_documento, pr.nome_do_produto
FROM trabalho.venda v
JOIN trabalho.documentos doc ON doc.id_documentos = v.id_documentos
JOIN trabalho.produtos pr ON pr.id_produtos = v.id_produtos;

-- Atualizações:
-- Atualização 1: Alterar o nome do produto com id_produtos igual a 1
UPDATE trabalho.produtos
SET nome_do_produto = 'Novo Produto'
WHERE id_produtos = 1;

-- Atualização 2: Alterar o valor de venda do produto com id_produtos igual a 5
UPDATE trabalho.produtos
SET valor_de_venda = 30
WHERE id_produtos = 5;

-- Atualização 3: Aumentar em 10% o valor de venda de todos os produtos
UPDATE trabalho.produtos
SET valor_de_venda = valor_de_venda * 1.10;
