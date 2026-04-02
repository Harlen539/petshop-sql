-- ============================================
-- PRATICAZINHA - CTE 
-- ============================================

-- 1. Produtos que custam mais que o preço médio
WITH MediaProdutos AS (
    SELECT AVG(preco) AS media
    FROM produtos
)
SELECT 
    p.nome,
    p.preco,
    ROUND(m.media, 2) AS media_geral,
    ROUND(p.preco - m.media, 2) AS diferenca_da_media
FROM produtos p, MediaProdutos m
WHERE p.preco > m.media
ORDER BY p.preco DESC;

-- 2. Clientes que TÊM pets E já fizeram pelo menos uma compra
WITH ClientesComPets AS (
    SELECT DISTINCT clientes.id, clientes.nome
    FROM clientes
    INNER JOIN pets ON clientes.id = pets.cliente_id
),
ClientesComCompras AS (
    SELECT DISTINCT clientes.id,
           COUNT(DISTINCT pets.id) AS total_pets,
           COUNT(DISTINCT vendas.id) AS total_compras
    FROM clientes
    INNER JOIN pets ON clientes.id = pets.cliente_id
    INNER JOIN vendas ON clientes.id = vendas.cliente_id
    GROUP BY clientes.id
)
SELECT 
    cp.nome,
    cc.total_pets,
    cc.total_compras
FROM ClientesComPets cp
INNER JOIN ClientesComCompras cc ON cp.id = cc.id
ORDER BY cc.total_compras DESC;

-- 3. Clientes que gastaram MAIS que a média de gastos por cliente
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