WITH Gastos AS (
    SELECT 
        c.id,
        c.nome,
        SUM(v.valor_total) AS total
    FROM clientes c
    INNER JOIN vendas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nome
),
Media AS (
    SELECT AVG(total) AS media FROM Gastos
),
Pets AS (
    SELECT cliente_id, COUNT(*) AS total_pets
    FROM pets
    GROUP BY cliente_id
)

SELECT 
    g.nome,
    g.total,
    p.total_pets
FROM Gastos g
INNER JOIN Pets p ON g.id = p.cliente_id
CROSS JOIN Media m
WHERE g.total > m.media
AND p.total_pets > 1;
