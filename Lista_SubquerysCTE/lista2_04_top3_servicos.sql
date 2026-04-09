-- =====================================
-- LISTA 2 - EXERCÍCIO 4
-- TOP 3 SERVIÇOS MAIS AGENDADOS
-- =====================================

WITH TotalAgendamentos AS (
    SELECT 
        s.nome,
        COUNT(a.id) AS total
    FROM servicos s
    INNER JOIN agendamentos a ON s.id = a.servico_id
    GROUP BY s.id, s.nome
)

SELECT *
FROM TotalAgendamentos
ORDER BY total DESC
LIMIT 3;
