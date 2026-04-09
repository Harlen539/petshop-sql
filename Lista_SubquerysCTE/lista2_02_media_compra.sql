-- =====================================
-- LISTA 2 - EXERCÍCIO 2
-- MÉDIA DE COMPRA POR CLIENTE > 200
-- =====================================

WITH MediaPorCliente AS (
    SELECT 
        c.id,
        c.nome,
        AVG(v.valor_total) AS media_compra
    FROM clientes c
    INNER JOIN vendas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nome
)

SELECT *
FROM MediaPorCliente
WHERE media_compra > 200
ORDER BY media_compra DESC;
