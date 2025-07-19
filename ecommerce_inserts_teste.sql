-- 1. Recuperação simples
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;

-- 2. Filtros com WHERE
SELECT nome FROM produtos WHERE preco > 1000;

-- 3. Atributo derivado (ex: 10% de desconto)
SELECT nome, preco, preco * 0.9 AS preco_com_desconto FROM produtos;

-- 4. Ordenação dos dados
SELECT * FROM pedidos ORDER BY data_pedido DESC;

-- 5. HAVING (condição sobre grupos)
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id
HAVING total_pedidos > 1;

-- 6. JOIN entre tabelas
SELECT p.id, c.nome AS cliente, p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;
