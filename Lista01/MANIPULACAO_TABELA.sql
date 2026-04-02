# Lista de 20 Exercícios de SQL - Categoria Médio
## Assunto: INSERT, UPDATE, DELETE TABLE
### Baseado no esquema do banco de dados DB_GUFE

---

### Exercício 1: Inserir um cliente
Insira um novo cliente na tabela `TB_CLIENTE` com nome "João Silva", CNPJ "12.345.678/0001-99" e cidade "São Paulo".

**Resposta:**
```sql
INSERT INTO TB_CLIENTE (NOME, CNPJ, CIDADE)
VALUES ('João Silva', '12.345.678/0001-99', 'São Paulo');
```

---

### Exercício 2: Atualizar o endereço de um cliente
Atualize o endereço do cliente com `CODCLI = 1` para "Rua Nova, 123" e o bairro para "Centro".

**Resposta:**
```sql
UPDATE TB_CLIENTE
SET ENDERECO = 'Rua Nova, 123', BAIRRO = 'Centro'
WHERE CODCLI = 1;
```

---

### Exercício 3: Excluir um cliente
Exclua o cliente com `CODCLI = 2` da tabela `TB_CLIENTE`.

**Resposta:**
```sql
DELETE FROM TB_CLIENTE
WHERE CODCLI = 2;
```

---

### Exercício 4: Inserir um vendedor
Insira um novo vendedor na tabela `TB_VENDEDOR` com nome "Maria Oliveira", CPF "123.456.789-00" e percentual de comissão 5.50.

**Resposta:**
```sql
INSERT INTO TB_VENDEDOR (NOME, CPF, PERC_COMISSAO)
VALUES ('Maria Oliveira', '123.456.789-00', 5.50);
```

---

### Exercício 5: Atualizar a comissão de um vendedor
Atualize o percentual de comissão de todos os vendedores para 6.00 onde a comissão atual é menor que 5.00.

**Resposta:**
```sql
UPDATE TB_VENDEDOR
SET PERC_COMISSAO = 6.00
WHERE PERC_COMISSAO < 5.00;
```

---

### Exercício 6: Excluir vendedores sem e-mail
Exclua todos os vendedores da tabela `TB_VENDEDOR` que não possuem e-mail registrado.

**Resposta:**
```sql
DELETE FROM TB_VENDEDOR
WHERE E_MAIL IS NULL;
```

---

### Exercício 7: Inserir um produto
Insira um novo produto na tabela `TB_PRODUTO` com código "ABC123", descrição "Teclado Mecânico", preço de venda 150.00 e quantidade real 50.

**Resposta:**
```sql
INSERT INTO TB_PRODUTO (COD_PRODUTO, DESCRICAO, PRECO_VENDA, QTD_REAL)
VALUES ('ABC123', 'Teclado Mecânico', 150.00, 50);
```

---

### Exercício 8: Atualizar o preço de um produto
Atualize o preço de custo do produto com `ID_PRODUTO = 1` para 80.00 e o preço de venda para 120.00.

**Resposta:**
```sql
UPDATE TB_PRODUTO
SET PRECO_CUSTO = 80.00, PRECO_VENDA = 120.00
WHERE ID_PRODUTO = 1;
```

---

### Exercício 9: Excluir produtos com estoque zero
Exclua todos os produtos da tabela `TB_PRODUTO` onde a quantidade real é zero.

**Resposta:**
```sql
DELETE FROM TB_PRODUTO
WHERE QTD_REAL = 0;
```

---

### Exercício 10: Inserir um pedido
Insira um novo pedido na tabela `TB_PEDIDO` para o cliente com `CODCLI = 1`, vendedor com `CODVEN = 1`, data de emissão atual e valor total 500.00.

**Resposta:**
```sql
INSERT INTO TB_PEDIDO (CODCLI, CODVEN, DATA_EMISSAO, VLR_TOTAL)
VALUES (1, 1, GETDATE(), 500.00);
```

---

### Exercício 11: Atualizar a situação de um pedido
Atualize a situação do pedido com `NUM_PEDIDO = 1` para "C" (concluído).

**Resposta:**
```sql
UPDATE TB_PEDIDO
SET SITUACAO = 'C'
WHERE NUM_PEDIDO = 1;
```

---

### Exercício 12: Excluir pedidos cancelados
Exclua todos os pedidos da tabela `TB_PEDIDO` onde a situação é "X" (cancelado).

**Resposta:**
```sql
DELETE FROM TB_PEDIDO
WHERE SITUACAO = 'X';
```

---

### Exercício 13: Inserir um item de pedido
Insira um item na tabela `TB_ITENSPEDIDO` para o pedido com `NUM_PEDIDO = 1`, item número 1, produto com `ID_PRODUTO = 1`, quantidade 10 e preço unitário 50.00.

**Resposta:**
```sql
INSERT INTO TB_ITENSPEDIDO (NUM_PEDIDO, NUM_ITEM, ID_PRODUTO, QUANTIDADE, PR_UNITARIO)
VALUES (1, 1, 1, 10, 50.00);
```

---

### Exercício 14: Atualizar o desconto de um item de pedido
Atualize o desconto do item com `NUM_PEDIDO = 1` e `NUM_ITEM = 1` para 10.00.

**Resposta:**
```sql
UPDATE TB_ITENSPEDIDO
SET DESCONTO = 10.00
WHERE NUM_PEDIDO = 1 AND NUM_ITEM = 1;
```

---

### Exercício 15: Excluir itens de um pedido
Exclua todos os itens do pedido com `NUM_PEDIDO = 2` da tabela `TB_ITENSPEDIDO`.

**Resposta:**
```sql
DELETE FROM TB_ITENSPEDIDO
WHERE NUM_PEDIDO = 2;
```

---

### Exercício 16: Inserir múltiplos clientes
Insira dois clientes na tabela `TB_CLIENTE` com os dados: 
1. Nome "Ana Costa", cidade "Rio de Janeiro", CNPJ "98.765.432/0001-11"
2. Nome "Lucas Souza", cidade "Belo Horizonte", CNPJ "11.223.344/0001-55".

**Resposta:**
```sql
INSERT INTO TB_CLIENTE (NOME, CIDADE, CNPJ)
VALUES 
    ('Ana Costa', 'Rio de Janeiro', '98.765.432/0001-11'),
    ('Lucas Souza', 'Belo Horizonte', '11.223.344/0001-55');
```

---

### Exercício 17: Atualizar o estoque de produtos
Aumente a quantidade real de todos os produtos na tabela `TB_PRODUTO` em 10 unidades onde a quantidade real é menor que a quantidade mínima.

**Resposta:**
```sql
UPDATE TB_PRODUTO
SET QTD_REAL = QTD_REAL + 10
WHERE QTD_REAL < QTD_MINIMA;
```

---

### Exercício 18: Excluir pedidos antigos
Exclua todos os pedidos da tabela `TB_PEDIDO` com data de emissão anterior a 01/01/2024.

**Resposta:**
```sql
DELETE FROM TB_PEDIDO
WHERE DATA_EMISSAO < '2024-01-01';
```

---

### Exercício 19: Inserir múltiplos itens de pedido
Insira dois itens na tabela `TB_ITENSPEDIDO` para o pedido com `NUM_PEDIDO = 3`:
1. Item 1, produto `ID_PRODUTO = 2`, quantidade 5, preço unitário 100.00
2. Item 2, produto `ID_PRODUTO = 3`, quantidade 8, preço unitário 75.00.

**Resposta:**
```sql
INSERT INTO TB_ITENSPEDIDO (NUM_PEDIDO, NUM_ITEM, ID_PRODUTO, QUANTIDADE, PR_UNITARIO)
VALUES 
    (3, 1, 2, 5, 100.00),
    (3, 2, 3, 8, 75.00);
```

---

### Exercício 20: Atualizar e-mails de clientes
Atualize o e-mail de todos os clientes na tabela `TB_CLIENTE` que estão na cidade "São Paulo" para "contato@empresa.com".

**Resposta:**
```sql
UPDATE TB_CLIENTE
SET E_MAIL = 'contato@empresa.com'
WHERE CIDADE = 'São Paulo';
```

---
