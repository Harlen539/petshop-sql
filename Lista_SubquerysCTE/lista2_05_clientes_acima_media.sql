-- =====================================
-- LISTA 2 - EXERCÍCIO 5
-- CLIENTES QUE GASTARAM ACIMA DA MÉDIA
-- E POSSUEM MAIS DE 1 PET
-- =====================================

WITH GastosPorCliente AS (
    SELECT 
        c.id,
        c.nome,
        SUM(v.valor_total) AS total_gasto
    FROM clientes c
    INNER JOIN vendas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nome
),

MediaGeral AS (
    SELECT AVG(total_gasto) AS media
    FROM GastosPorCliente
),

ClientesComPets AS (
    SELECT 
        cliente_id,
        COUNT(id) AS total_pets
    FROM pets
    GROUP BY cliente_id
)

SELECT 
    g.nome,
    g.total_gasto,
    cp.total_pets
FROM GastosPorCliente g
INNER JOIN ClientesComPets cp ON g.id = cp.cliente_id
CROSS JOIN MediaGeral m
WHERE g.total_gasto > m.media
AND cp.total_pets > 1
ORDER BY g.total_gasto DESC;
