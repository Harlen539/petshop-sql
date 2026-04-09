-- =====================================
-- LISTA 2 - EXERCÍCIO 3
-- PRODUTOS COM MAIS DE 2 UNIDADES VENDIDAS
-- =====================================

SELECT p.nome
FROM produtos p
WHERE p.id IN (
    SELECT iv.produto_id
    FROM itens_venda iv
    GROUP BY iv.produto_id
    HAVING SUM(iv.quantidade) > 2
);
