
-- Criação das tabelas

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  tipo ENUM('PF', 'PJ') NOT NULL,
  documento VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE produtos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL
);

CREATE TABLE fornecedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos_fornecedores (
  produto_id INT,
  fornecedor_id INT,
  PRIMARY KEY (produto_id, fornecedor_id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id),
  FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  data_pedido DATE,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
  pedido_id INT,
  produto_id INT,
  quantidade INT,
  PRIMARY KEY (pedido_id, produto_id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE pagamentos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  forma_pagamento VARCHAR(50),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

CREATE TABLE entregas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  status VARCHAR(50),
  codigo_rastreio VARCHAR(50),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

-- Inserção de dados exemplo

INSERT INTO clientes (nome, tipo, documento) VALUES
('Ana Paula', 'PF', '123.456.789-00'),
('Empresa XYZ', 'PJ', '12.345.678/0001-00');

INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook', 3500.00, 10),
('Teclado', 150.00, 50);

INSERT INTO fornecedores (nome) VALUES
('Fornecedor A'),
('Fornecedor B');

INSERT INTO produtos_fornecedores (produto_id, fornecedor_id) VALUES
(1, 1),
(2, 2);

INSERT INTO pedidos (cliente_id, data_pedido) VALUES
(1, '2024-06-01'),
(2, '2024-06-02');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3);

INSERT INTO pagamentos (pedido_id, forma_pagamento) VALUES
(1, 'Cartão de Crédito'),
(2, 'Boleto');

INSERT INTO entregas (pedido_id, status, codigo_rastreio) VALUES
(1, 'Em trânsito', 'BR123456789'),
(2, 'Entregue', 'BR987654321');
