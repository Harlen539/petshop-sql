SELECT 
    c.nome,
    v.data_venda,
    pr.nome,
    iv.quantidade,
    iv.preco_unitario,
    (iv.quantidade * iv.preco_unitario) AS subtotal
FROM vendas v
INNER JOIN clientes c ON v.cliente_id = c.id
INNER JOIN itens_venda iv ON v.id = iv.venda_id
INNER JOIN produtos pr ON iv.produto_id = pr.id
ORDER BY v.data_venda DESC;
