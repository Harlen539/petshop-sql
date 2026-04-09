SELECT 
    c.nome,
    COALESCE(COUNT(v.id), 0) AS total_compras
FROM clientes c
LEFT JOIN vendas v ON c.id = v.cliente_id
GROUP BY c.id, c.nome;
