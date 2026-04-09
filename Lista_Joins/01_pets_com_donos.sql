SELECT 
    p.nome AS nome_pet,
    p.especie,
    p.raca,
    c.nome AS dono,
    c.telefone
FROM pets p
INNER JOIN clientes c ON p.cliente_id = c.id;
