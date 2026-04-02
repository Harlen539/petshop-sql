-- ============================================
-- INSERTS - 50 REGISTROS
-- Base de dados PetShop
-- ============================================

-- ============================================
-- CLIENTES (20 registros)
-- IDs gerados sequencialmente: 1 a 20
-- ============================================

INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Ana Costa', '(83) 98234-5678', 'ana.costa@email.com', 'Av. Cabo Branco, 456, João Pessoa'),
('Carlos Mendes', '(83) 99345-6789', 'carlos.mendes@gmail.com', 'Rua da Praia, 789, Cabedelo'),
('Beatriz Lima', '(83) 98456-7890', 'beatriz.lima@hotmail.com', 'Rua Primeiro de Maio, 234, João Pessoa'),
('Daniel Ferreira', '(83) 99567-8901', 'daniel.ferreira@yahoo.com', 'Av. Epitácio Pessoa, 567, João Pessoa'),
('Eduarda Rocha', '(83) 98678-9012', 'eduarda.rocha@email.com', 'Rua das Acácias, 890, Bayeux'),
('Fernando Alves', '(83) 99789-0123', 'fernando.alves@gmail.com', 'Rua do Comércio, 123, Santa Rita'),
('Gabriela Martins', '(83) 98890-1234', 'gabriela.martins@hotmail.com', 'Av. Dom Pedro II, 456, João Pessoa'),
('Henrique Santos', '(83) 99901-2345', 'henrique.santos@email.com', 'Rua São José, 789, Cabedelo'),
('Isabela Souza', '(83) 98012-3456', 'isabela.souza@yahoo.com', 'Rua da Paz, 234, João Pessoa'),
('Jorge Pereira', '(83) 99123-4567', 'jorge.pereira@gmail.com', 'Av. Beira Mar, 567, João Pessoa'),
('Karina Dias', '(83) 98234-5670', 'karina.dias@email.com', 'Rua das Palmeiras, 890, Cabedelo'),
('Lucas Rodrigues', '(83) 99345-6781', 'lucas.rodrigues@hotmail.com', 'Rua Nova, 123, Bayeux'),
('Mariana Gomes', '(83) 98456-7892', 'mariana.gomes@gmail.com', 'Av. Júlia Freire, 456, João Pessoa'),
('Nicolas Oliveira', '(83) 99567-8903', 'nicolas.oliveira@email.com', 'Rua do Porto, 789, Cabedelo'),
('Olívia Castro', '(83) 98678-9014', 'olivia.castro@yahoo.com', 'Rua das Flores, 234, João Pessoa'),
('Paulo Barbosa', '(83) 99789-0125', 'paulo.barbosa@gmail.com', 'Av. Getúlio Vargas, 567, Santa Rita'),
('Quitéria Ramos', '(83) 98890-1236', 'quiteria.ramos@email.com', 'Rua Principal, 890, Bayeux'),
('Rafael Moreira', '(83) 99901-2347', 'rafael.moreira@hotmail.com', 'Av. Cruz das Armas, 123, João Pessoa'),
('Sabrina Teixeira', '(83) 98012-3458', 'sabrina.teixeira@gmail.com', 'Rua Duque de Caxias, 456, Cabedelo'),
('Thiago Fernandes', '(83) 99123-4569', 'thiago.fernandes@email.com', 'Av. Tabajaras, 789, João Pessoa');

-- ============================================
-- SERVIÇOS (12 registros)
-- IDs gerados sequencialmente: 1 a 12
-- ============================================

INSERT INTO servicos (nome, descricao, preco) VALUES
('Tosa Completa', 'Tosa completa com hidratação e perfume', 120.00),
('Banho Medicamentoso', 'Banho especial para problemas de pele', 95.00),
('Corte de Unhas', 'Corte e limpeza de unhas', 35.00),
('Limpeza de Ouvidos', 'Limpeza e higienização dos ouvidos', 40.00),
('Escovação de Dentes', 'Escovação e limpeza dental', 55.00),
('Adestramento Básico (hora)', 'Aula de adestramento individual', 180.00),
('Banho Simples', 'Banho básico com shampoo e condicionador', 60.00),
('Hidratação de Pelos', 'Tratamento de hidratação profunda', 85.00),
('Consulta Veterinária', 'Consulta clínica geral com veterinário', 150.00),
('Vacinação V8/V10', 'Aplicação de vacinas múltiplas', 120.00),
('Tosa Média', 'Tosa parcial com acabamento', 80.00),
('Hospedagem (diária)', 'Hospedagem completa com alimentação', 100.00);

-- ============================================
-- PRODUTOS (10 registros)
-- IDs gerados sequencialmente: 1 a 10
-- ============================================

INSERT INTO produtos (nome, descricao, preco, quantidade_estoque) VALUES
('Ração Super Premium Filhotes 10kg', 'Ração para filhotes de até 1 ano', 165.00, 40),
('Ração Light Cães 15kg', 'Ração para cães com sobrepeso', 195.00, 25),
('Ração Senior Gatos 7kg', 'Ração para gatos idosos', 135.00, 35),
('Petiscos Naturais (pacote)', 'Petiscos saudáveis e naturais', 28.00, 150),
('Arranhador para Gatos', 'Arranhador de canto com brinquedos', 89.00, 20),
('Cama Ortopédica P', 'Cama ortopédica para pets pequenos', 145.00, 15),
('Cama Ortopédica M', 'Cama ortopédica para pets médios', 185.00, 12),
('Bebedouro Automático', 'Bebedouro com fonte e filtro', 125.00, 30),
('Comedouro Inteligente', 'Comedouro automático programável', 220.00, 18),
('Kit Higiene Dental', 'Kit completo com escova e pasta', 45.00, 60);

-- ============================================
-- PETS (20 registros)
-- IDs gerados sequencialmente: 1 a 20
-- cliente_id 1 a 18 (clientes acima)
-- ============================================

INSERT INTO pets (nome, especie, raca, data_nascimento, cliente_id) VALUES
('Bolinha', 'cachorro', 'Poodle', '2021-05-10', 1),
('Fifi', 'gato', 'Angorá', '2022-03-15', 2),
('Max', 'cachorro', 'Golden Retriever', '2020-08-20', 3),
('Mel', 'gato', 'Vira-lata', '2021-11-05', 4),
('Pipoca', 'passaro', 'Calopsita', '2023-01-15', 5),
('Buddy', 'cachorro', 'Beagle', '2019-06-30', 6),
('Nina', 'gato', 'Maine Coon', '2020-09-12', 7),
('Bob', 'cachorro', 'Bulldog Francês', '2022-02-18', 8),
('Toby', 'cachorro', 'Shih Tzu', '2021-07-22', 9),
('Pandora', 'gato', 'Bengal', '2020-12-10', 10),
('Zeca', 'passaro', 'Papagaio', '2019-04-05', 10),
('Spike', 'cachorro', 'Pit Bull', '2020-10-15', 11),
('Mingau', 'gato', 'Vira-lata', '2022-08-20', 12),
('Duke', 'cachorro', 'Rottweiler', '2019-03-25', 13),
('Lola', 'cachorro', 'Chihuahua', '2023-06-10', 13),
('Lua', 'gato', 'Ragdoll', '2021-09-30', 14),
('Thor', 'cachorro', 'Husky Siberiano', '2020-01-18', 15),
('Mia', 'gato', 'Sphynx', '2022-11-22', 16),
('Rocky', 'cachorro', 'Boxer', '2021-04-14', 17),
('Bella', 'cachorro', 'Yorkshire', '2023-02-28', 18);

-- ============================================
-- AGENDAMENTOS (20 registros)
-- pet_id: 1 a 20 (pets acima)
-- servico_id: 1 a 12 (serviços acima)
-- ============================================

-- Agendamentos futuros (Janeiro 2026)
INSERT INTO agendamentos (pet_id, servico_id, data_agendamento, status, observacoes) VALUES
(1, 1, '2026-01-16 10:00:00', 'agendado', 'Primeira vez no petshop'),
(2, 2, '2026-01-17 14:00:00', 'agendado', NULL),
(3, 7, '2026-01-17 15:30:00', 'agendado', 'Pet muito ativo'),
(4, 1, '2026-01-18 09:00:00', 'agendado', NULL),
(5, 3, '2026-01-18 11:00:00', 'agendado', 'Unhas muito grandes'),
(6, 8, '2026-01-19 10:30:00', 'agendado', NULL),
(7, 1, '2026-01-19 14:00:00', 'agendado', 'Banho e tosa completa'),
(8, 2, '2026-01-20 09:30:00', 'agendado', 'Cliente solicitou consulta veterinária'),
(9, 9, '2026-01-20 16:00:00', 'agendado', NULL),
(10, 1, '2026-01-21 10:00:00', 'agendado', NULL),
(11, 10, '2026-01-21 15:00:00', 'agendado', 'Tosa média'),
(12, 11, '2026-01-22 11:00:00', 'agendado', 'Primeiro banho medicamentoso'),
(13, 12, '2026-01-22 14:30:00', 'agendado', NULL),
(14, 7, '2026-01-23 09:00:00', 'agendado', 'Limpeza completa'),
(15, 8, '2026-01-23 16:00:00', 'agendado', NULL);

-- Agendamentos concluídos/cancelados (passado)
INSERT INTO agendamentos (pet_id, servico_id, data_agendamento, status, observacoes) VALUES
(1, 3, '2026-01-05 10:00:00', 'concluido', 'Serviço realizado com sucesso'),
(6, 1, '2026-01-06 14:00:00', 'concluido', NULL),
(4, 2, '2026-01-07 09:30:00', 'concluido', 'Pet se comportou bem'),
(8, 4, '2026-01-08 15:00:00', 'concluido', NULL),
(7, 1, '2026-01-09 11:00:00', 'cancelado', 'Cliente cancelou por motivos pessoais');

-- ============================================
-- VENDAS (10 registros)
-- cliente_id: 1 a 10 (clientes acima)
-- ============================================

INSERT INTO vendas (cliente_id, data_venda, valor_total) VALUES
(1, '2026-01-05 10:30:00', 165.00),
(2, '2026-01-06 14:20:00', 223.00),
(3, '2026-01-07 11:15:00', 89.00),
(4, '2026-01-08 15:45:00', 340.00),
(5, '2026-01-09 09:30:00', 145.00),
(6, '2026-01-10 16:20:00', 195.00),
(7, '2026-01-11 12:00:00', 278.00),
(8, '2026-01-12 10:45:00', 420.00),
(9, '2026-01-13 14:30:00', 125.00),
(10, '2026-01-14 11:00:00', 573.00);

-- ============================================
-- ITENS_VENDA
-- venda_id: 1 a 10 (vendas acima)
-- produto_id: 1 a 10 (produtos acima)
-- ============================================

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 165.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(2, 1, 1, 165.00),
(2, 4, 2, 29.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(3, 5, 1, 89.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(4, 2, 1, 195.00),
(4, 6, 1, 145.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(5, 6, 1, 145.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(6, 2, 1, 195.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(7, 3, 2, 135.00),
(7, 10, 1, 45.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(8, 1, 2, 165.00),
(8, 5, 1, 89.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(9, 8, 1, 125.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(10, 1, 1, 165.00),
(10, 2, 1, 195.00),
(10, 9, 1, 220.00);