# 🐾 PetShop — Banco de Dados SQL

Projeto prático de banco de dados relacional com temática de petshop. Cobre desde a criação do schema até consultas avançadas com CTEs, JOINs e agregações.

---

## 📁 Estrutura do Repositório

```
petshop/
├── CTE/
│   └── petshop_praticazinha_cte.sql   # Exercícios com Common Table Expressions
└── Roteiros/
    ├── Criar_petshop.sql              # Criação do banco de dados
    ├── petshop_create_tables.sql      # Criação das tabelas
    ├── petshop_inserts.sql            # Dados de exemplo (50+ registros)
    └── petshop_consultas.sql          # Consultas do básico ao avançado
```

---

## 🗄️ Modelo de Dados

O banco é composto por **7 tabelas**:

| Tabela | Descrição |
|---|---|
| `clientes` | Cadastro de clientes do petshop |
| `pets` | Animais vinculados aos clientes |
| `servicos` | Serviços oferecidos (banho, tosa, consulta…) |
| `agendamentos` | Agendamentos de serviços para os pets |
| `produtos` | Produtos disponíveis para venda |
| `vendas` | Cabeçalho das vendas realizadas |
| `itens_venda` | Itens de cada venda (produto, quantidade, preço) |

### Relacionamentos

```
clientes ──< pets
clientes ──< vendas
pets     ──< agendamentos
servicos ──< agendamentos
vendas   ──< itens_venda
produtos ──< itens_venda
```

### Tipos ENUM

- `especie_pet`: `cachorro`, `gato`, `passaro`, `peixe`, `reptil`, `outro`
- `status_agendamento`: `agendado`, `concluido`, `cancelado`, `reagendado`

---

## 🚀 Como Usar

### 1. Criar o banco

```sql
CREATE DATABASE petshop;
\c petshop
```

### 2. Criar as tabelas

```bash
psql -d petshop -f Roteiros/petshop_create_tables.sql
```

### 3. Popular com dados de exemplo

```bash
psql -d petshop -f Roteiros/petshop_inserts.sql
```

### 4. Explorar as consultas

```bash
psql -d petshop -f Roteiros/petshop_consultas.sql
```

---

## 📊 Dados de Exemplo

| Entidade | Quantidade |
|---|---|
| Clientes | 20 |
| Pets | 20 |
| Serviços | 12 |
| Agendamentos | 35 |
| Produtos | 10 |
| Vendas | 10 |
| Itens de venda | 16 |

---

## 📝 Consultas Cobertas

### Básico
- `SELECT` com colunas específicas e aliases
- Filtros com `WHERE`, `LIKE`, `BETWEEN`, `IN`
- Operadores de comparação e lógicos (`AND`, `OR`)
- Ordenação com `ORDER BY` e paginação com `LIMIT`
- Valores únicos com `DISTINCT`

### Intermediário
- `INNER JOIN`, `LEFT JOIN` com 2, 3 e 4 tabelas
- Agregações: `COUNT`, `SUM`, `AVG`, `ROUND`
- Agrupamento com `GROUP BY`
- Filtragem de nulos com `IS NULL`

### Avançado — CTEs
- Produtos acima da média de preço
- Clientes com pets **e** compras registradas
- Clientes que gastaram acima da média geral

---

## 💡 Exemplo de CTE

```sql
-- Clientes que gastaram mais que a média
WITH GastosPorCliente AS (
    SELECT
        clientes.id,
        clientes.nome,
        SUM(vendas.valor_total) AS total_gasto
    FROM clientes
    INNER JOIN vendas ON clientes.id = vendas.cliente_id
    GROUP BY clientes.id, clientes.nome
),
MediaGastos AS (
    SELECT ROUND(AVG(total_gasto), 2) AS media
    FROM GastosPorCliente
)
SELECT
    g.nome,
    g.total_gasto,
    m.media AS media_geral
FROM GastosPorCliente g, MediaGastos m
WHERE g.total_gasto > m.media
ORDER BY g.total_gasto DESC;
```

---

## 🛠️ Requisitos

- **PostgreSQL** 13 ou superior
- **psql** (client de linha de comando)

---

## 📌 Observações

- Todas as tabelas usam `SERIAL PRIMARY KEY` para IDs auto-incrementados.
- Exclusões em cascata (`ON DELETE CASCADE`) estão configuradas nas chaves estrangeiras.
- Os campos `criado_em` e `atualizado_em` usam `DEFAULT CURRENT_TIMESTAMP`.
- Os dados de exemplo são fictícios, baseados em cidades da Paraíba (João Pessoa, Cabedelo, Bayeux, Santa Rita).
