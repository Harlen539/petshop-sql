SELECT 
    p.nome,
    COALESCE(SUM(iv.quantidade), 0) AS total_vendido
FROM produtos p
LEFT JOIN itens_venda iv ON p.id = iv.produto_id
GROUP BY p.id, p.nome
ORDER BY total_vendido DESC;
