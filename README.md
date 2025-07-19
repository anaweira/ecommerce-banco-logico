# E-commerce - Projeto de Banco de Dados Lógico

Projeto desenvolvido com foco em modelagem e implementação de um banco de dados lógico utilizando **MySQL**. O objetivo foi representar o sistema de um e-commerce, com criação de tabelas, relacionamentos, inserção de dados e consultas SQL avançadas.

---

## Descrição do Projeto

O projeto contempla a construção do modelo lógico relacional baseado no esquema conceitual previamente elaborado. Inclui a criação do banco de dados, inserção de dados de teste e execução de consultas SQL com diferentes cláusulas.

### 🔧 Contexto do Sistema

- Uma conta pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas não pode ser ambas.
- Um cliente pode ter mais de uma forma de pagamento cadastrada.
- Os pedidos possuem status e código de rastreio.
- Relacionamento entre produtos e fornecedores.
- Vendedores podem também ser fornecedores.

## Modelo Lógico

As principais entidades e relacionamentos implementados:

- **clientes**: dados dos clientes (id, nome, tipo, documento)
- **produtos**: catálogo de produtos (id, nome, preço, estoque)
- **fornecedores**: fornecedores dos produtos
- **produtos_fornecedores**: relacionamento N:N entre produtos e fornecedores
- **formas_pagamento**: formas de pagamento dos clientes
- **pedidos**: pedidos realizados pelos clientes
- **itens_pedido**: itens comprados em cada pedido
- **entregas**: status e rastreamento de cada pedido

---

## Scripts

### 🔹 Criação do Banco de Dados
O script para criação do banco está no arquivo:

📄 [`oficina_modelo_logico.sql`](ecommerce_modelo_logico.sql)

### 🔹 Inserção de Dados
Para testes, utilize o script com dados fictícios:

📄 [`oficina_inserts_teste.sql`](ecommerce_inserts_teste.sql)

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
---

## Teste Online

Você pode testar o projeto diretamente no [DB Fiddle (MySQL 8.0)](https://www.db-fiddle.com/):

1. Cole o conteúdo de `ecommerce_modelo_logico.sql` e clique em **"Build Schema"**
2. Depois, cole os `INSERTs` e clique em **"Run"**
3. Por fim, teste as queries!

---

## Resultado Esperado

✅ Criação do modelo lógico relacional  
✅ Scripts SQL (estrutura e inserts)  
✅ Consultas SQL com todas as cláusulas solicitadas  
✅ Repositório pronto para entrega do desafio

---

## Desafio DIO - Banco de Dados Lógico

Este repositório faz parte do desafio proposto no módulo de modelagem lógica e implementação de banco de dados com MySQL na DIO.
