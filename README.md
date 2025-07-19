# Projeto Lógico de Banco de Dados – E-commerce

Este projeto tem como objetivo representar a modelagem lógica de um banco de dados para um sistema de e-commerce, usando MySQL. A modelagem inclui a criação do esquema relacional, inserção de dados e consultas SQL que exploram aspectos fundamentais como `SELECT`, `JOIN`, `WHERE`, `ORDER BY`, `HAVING`, entre outros.

## Cenário

Criei uma base de dados para um sistema de e-commerce com os seguintes requisitos:

- **Cliente PJ e PF**: Uma conta pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas não pode ser ambas.
- **Formas de Pagamento**: Um cliente pode ter mais de uma forma de pagamento cadastrada.
- **Entrega**: Os pedidos possuem status e código de rastreio.
- **Relacionamento entre produtos e fornecedores.**
- **Vendedores podem ser também fornecedores.**

---

## Modelagem Lógica (Tabelas)

- `clientes (id, nome, tipo, documento)`
- `produtos (id, nome, preco, estoque)`
- `fornecedores (id, nome)`
- `produtos_fornecedores (produto_id, fornecedor_id)`
- `formas_pagamento (id, cliente_id, forma_pagamento)`
- `entregas (id, pedido_id, status, codigo_rastreio)`
- `pedidos (id, cliente_id, data_pedido)`
- `itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)`

---

## Script SQL

O script com **criação de tabelas e inserção de dados de exemplo** está disponível no arquivo [`ecommerce_modelo_logico.sql`](./ecommerce_modelo_logico.sql).

---

## Consultas SQL

### 1. Recuperação simples

```sql
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
```

### 2. Filtros com WHERE

```sql
SELECT nome FROM produtos WHERE preco > 1000;
```

### 3. Atributo derivado (ex: 10% de desconto)

```sql
SELECT nome, preco, preco * 0.9 AS preco_com_desconto FROM produtos;
```

### 4. Ordenação dos dados

```sql
SELECT * FROM pedidos ORDER BY data_pedido DESC;
```

### 5. HAVING (condição sobre grupos)

```sql
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id
HAVING total_pedidos > 1;
```

### 6. JOIN entre tabelas

```sql
SELECT p.id, c.nome AS cliente, p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;
```
