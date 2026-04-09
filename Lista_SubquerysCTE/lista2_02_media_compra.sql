WITH MediaPorCliente AS (
    SELECT 
        c.id,
        c.nome,
        AVG(v.valor_total) AS media
    FROM clientes c
    INNER JOIN vendas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nome
)

SELECT *
FROM MediaPorCliente
WHERE media > 200;
