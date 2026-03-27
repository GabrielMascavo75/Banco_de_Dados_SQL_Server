# Lista de 20 Exercícios de SQL - Categoria Soft
## Assunto: CREATE, ALTER, DROP, TRUNCATE e RENAME TABLE
### Baseado no esquema do banco de dados DB_GUFE

---

### Exercício 1: Criar uma nova tabela
Crie uma tabela chamada `TB_FORNECEDOR` com os campos `CODFORN` (chave primária, auto-incremento), `NOME` (VARCHAR(50)), `CNPJ` (VARCHAR(18)), e `DATA_CAD` (DATETIME).

**Resposta:**
```sql
CREATE TABLE TB_FORNECEDOR
(
    CODFORN INT IDENTITY(1,1) NOT NULL,
    NOME VARCHAR(50) NULL,
    CNPJ VARCHAR(18) NULL,
    DATA_CAD DATETIME NULL,
    CONSTRAINT PK__FORNECEDOR PRIMARY KEY CLUSTERED (CODFORN ASC) ON [PRIMARY]
);
```

---

### Exercício 2: Alterar uma tabela existente
Adicione uma nova coluna chamada `CONTATO` (VARCHAR(50)) à tabela `TB_CLIENTE`.

**Resposta:**
```sql
ALTER TABLE TB_CLIENTE
ADD CONTATO VARCHAR(50) NULL;
```

---

### Exercício 3: Renomear uma tabela
Renomeie a tabela `TB_VENDEDOR` para `TB_REPRESENTANTE`.

**Resposta:**
```sql
EXEC sp_rename 'TB_VENDEDOR', 'TB_REPRESENTANTE';
```

---

### Exercício 4: Remover uma coluna de uma tabela
Remova a coluna `FAX` da tabela `TB_CLIENTE`.

**Resposta:**
```sql
ALTER TABLE TB_CLIENTE
DROP COLUMN FAX;
```

---

### Exercício 5: Criar uma tabela com chave estrangeira
Crie uma tabela chamada `TB_PAGAMENTO` com os campos `ID_PAGAMENTO` (chave primária, auto-incremento), `NUM_PEDIDO` (chave estrangeira referenciando `TB_PEDIDO`), `VALOR` (NUMERIC(18,2)), e `DATA_PAGTO` (DATETIME).

**Resposta:**
```sql
CREATE TABLE TB_PAGAMENTO
(
    ID_PAGAMENTO INT IDENTITY(1,1) NOT NULL,
    NUM_PEDIDO INT NULL,
    VALOR NUMERIC(18,2) NULL,
    DATA_PAGTO DATETIME NULL,
    CONSTRAINT PK__PAGAMENTO PRIMARY KEY CLUSTERED (ID_PAGAMENTO ASC) ON [PRIMARY],
    CONSTRAINT FK__PAGAMENTO__PEDIDO FOREIGN KEY (NUM_PEDIDO) REFERENCES TB_PEDIDO (NUM_PEDIDO)
);
```

---

### Exercício 6: Truncar uma tabela
Escreva o comando para truncar a tabela `TB_ITENSPEDIDO`, removendo todos os registros, mas mantendo a estrutura da tabela.

**Resposta:**
```sql
TRUNCATE TABLE TB_ITENSPEDIDO;
```

---

### Exercício 7: Alterar o tipo de dado de uma coluna
Altere o tipo de dado da coluna `E_MAIL` na tabela `TB_VENDEDOR` de VARCHAR(35) para VARCHAR(100).

**Resposta:**
```sql
ALTER TABLE TB_VENDEDOR
ALTER COLUMN E_MAIL VARCHAR(100) NULL;
```

---

### Exercício 8: Excluir uma tabela
Escreva o comando para excluir completamente a tabela `TB_PRODUTO` do banco de dados.

**Resposta:**
```sql
DROP TABLE TB_PRODUTO;
```

---

### Exercício 9: Adicionar uma constraint de chave estrangeira
Adicione uma constraint de chave estrangeira na tabela `TB_PEDIDO` para que a coluna `CODCLI` referencie a coluna `CODCLI` da tabela `TB_CLIENTE`.

**Resposta:**
```sql
ALTER TABLE TB_PEDIDO
ADD CONSTRAINT FK__PEDIDO__CLIENTE FOREIGN KEY (CODCLI) REFERENCES TB_CLIENTE (CODCLI);
```

---

### Exercício 10: Renomear uma coluna
Renomeie a coluna `DESCRICAO` da tabela `TB_PRODUTO` para `NOME_PRODUTO`.

**Resposta:**
```sql
EXEC sp_rename 'TB_PRODUTO.DESCRICAO', 'NOME_PRODUTO', 'COLUMN';
```

---

### Exercício 11: Criar uma tabela para histórico
Crie uma tabela chamada `TB_HISTORICO_PRECO` com os campos `ID_HISTORICO` (chave primária, auto-incremento), `ID_PRODUTO` (chave estrangeira referenciando `TB_PRODUTO`), `PRECO_ANTERIOR` (NUMERIC(18,4)), e `DATA_ALTERACAO` (DATETIME).

**Resposta:**
```sql
CREATE TABLE TB_HISTORICO_PRECO
(
    ID_HISTORICO INT IDENTITY(1,1) NOT NULL,
    ID_PRODUTO INT NULL,
    PRECO_ANTERIOR NUMERIC(18,4) NULL,
    DATA_ALTERACAO DATETIME NULL,
    CONSTRAINT PK__HISTORICO_PRECO PRIMARY KEY CLUSTERED (ID_HISTORICO ASC) ON [PRIMARY],
    CONSTRAINT FK__HISTORICO__PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES TB_PRODUTO (ID_PRODUTO)
);
```

---

### Exercício 12: Alterar uma tabela para adicionar constraint
Adicione uma constraint de verificação (CHECK) na tabela `TB_PRODUTO` para garantir que a coluna `PRECO_VENDA` seja maior que zero.

**Resposta:**
```sql
ALTER TABLE TB_PRODUTO
ADD CONSTRAINT CHK__PRECO_VENDA CHECK (PRECO_VENDA > 0);
```

---

### Exercício 13: Renomear uma tabela
Renomeie a tabela `TB_ITENSPEDIDO` para `TB_DETALHES_PEDIDO`.

**Resposta:**
```sql
EXEC sp_rename 'TB_ITENSPEDIDO', 'TB_DETALHES_PEDIDO';
```

---

### Exercício 14: Remover uma constraint
Remova a constraint de chave primária da tabela `TB_PEDIDO` e adicione uma nova chave primária composta pelas colunas `NUM_PEDIDO` e `DATA_EMISSAO`.

**Resposta:**
```sql
ALTER TABLE TB_PEDIDO
DROP CONSTRAINT PK__PEDIDS;

ALTER TABLE TB_PEDIDO
ADD CONSTRAINT PK__PEDIDO_NEW PRIMARY KEY CLUSTERED (NUM_PEDIDO, DATA_EMISSAO);
```

---

### Exercício 15: Criar uma tabela com índices
Crie uma tabela chamada `TB_CATEGORIA` com os campos `COD_CATEGORIA` (chave primária, auto-incremento), `NOME_CATEGORIA` (VARCHAR(30)), e crie um índice não clusterizado na coluna `NOME_CATEGORIA`.

**Resposta:**
```sql
CREATE TABLE TB_CATEGORIA
(
    COD_CATEGORIA INT IDENTITY(1,1) NOT NULL,
    NOME_CATEGORIA VARCHAR(30) NULL,
    CONSTRAINT PK__CATEGORIA PRIMARY KEY CLUSTERED (COD_CATEGORIA ASC) ON [PRIMARY]
);

CREATE NONCLUSTERED INDEX IX__NOME_CATEGORIA
ON TB_CATEGORIA (NOME_CATEGORIA);
```

---

### Exercício 16: Truncar uma tabela
Escreva o comando para truncar a tabela `TB_PEDIDO`, removendo todos os registros, mas preservando a estrutura da tabela.

**Resposta:**
```sql
TRUNCATE TABLE TB_PEDIDO;
```

---

### Exercício 17: Alterar o tamanho de uma coluna
Altere o tamanho da coluna `ENDERECO` na tabela `TB_VENDEDOR` de VARCHAR(60) para VARCHAR(100).

**Resposta:**
```sql
ALTER TABLE TB_VENDEDOR
ALTER COLUMN ENDERECO VARCHAR(100) NULL;
```

---

### Exercício 18: Excluir uma tabela
Escreva o comando para excluir a tabela `TB_CLIENTE` do banco de dados.

**Resposta:**
```sql
DROP TABLE TB_CLIENTE;
```

---

### Exercício 19: Adicionar uma coluna com valor padrão
Adicione uma coluna chamada `STATUS` (VARCHAR(1)) à tabela `TB_PRODUTO` com o valor padrão 'A' (ativo).

**Resposta:**
```sql
ALTER TABLE TB_PRODUTO
ADD STATUS VARCHAR(1) DEFAULT 'A' NULL;
```

---

### Exercício 20: Renomear uma coluna
Renomeie a coluna `VLR_TOTAL` da tabela `TB_PEDIDO` para `VALOR_TOTAL`.

**Resposta:**
```sql
EXEC sp_rename 'TB_PEDIDO.VLR_TOTAL', 'VALOR_TOTAL', 'COLUMN';
```

---
