WITH Total AS (
    SELECT 
        s.nome,
        COUNT(a.id) AS total
    FROM servicos s
    INNER JOIN agendamentos a ON s.id = a.servico_id
    GROUP BY s.id, s.nome
)

SELECT *
FROM Total
ORDER BY total DESC
LIMIT 3;
