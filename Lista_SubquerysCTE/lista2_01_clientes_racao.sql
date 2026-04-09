-- =====================================
-- LISTA 2 - EXERCÍCIO 1
-- CLIENTES QUE COMPRARAM "RAÇÃO"
-- =====================================

SELECT c.nome
FROM clientes c
WHERE c.id IN (
    SELECT v.cliente_id
    FROM vendas v
    INNER JOIN itens_venda iv ON v.id = iv.venda_id
    INNER JOIN produtos p ON iv.produto_id = p.id
    WHERE LOWER(p.descricao) LIKE '%racao%'
);
