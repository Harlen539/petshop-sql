-- ============================================================
-- 1. TRIGGER: impede cancelamento de agendamento ja concluido
--    Tabela: agendamentos
--    Enum:   status_agendamento ('agendado','concluido','cancelado','reagendado')
-- ============================================================

CREATE OR REPLACE FUNCTION fn_impede_cancelamento_concluido()
RETURNS TRIGGER AS $$
BEGIN
    -- Se o registro atual ja tem status 'concluido', bloqueia a tentativa de cancelar.
    IF OLD.status = 'concluido' THEN
        RAISE EXCEPTION
            'Nao e possivel cancelar o agendamento de ID %, pois ele ja foi concluido.',
            OLD.id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- So dispara quando a intencao for mudar o status para 'cancelado'.
CREATE OR REPLACE TRIGGER trg_impede_cancelamento_concluido
BEFORE UPDATE ON agendamentos
FOR EACH ROW
WHEN (NEW.status = 'cancelado')
EXECUTE FUNCTION fn_impede_cancelamento_concluido();


-- ============================================================
-- 2. TRIGGER: log de transferencia de pet entre clientes
--    Tabela monitorada: pets (coluna cliente_id)
--    Tabela de log:     log_transferencias_pets
-- ============================================================

CREATE TABLE IF NOT EXISTS log_transferencias_pets (
    id                 SERIAL    PRIMARY KEY,
    pet_id             INTEGER   NOT NULL,
    cliente_anterior   INTEGER   NOT NULL,
    cliente_novo       INTEGER   NOT NULL,
    data_transferencia TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_transferencia_pet()
RETURNS TRIGGER AS $$
BEGIN
    -- So registra se o cliente_id realmente mudou.
    IF OLD.cliente_id IS DISTINCT FROM NEW.cliente_id THEN
        INSERT INTO log_transferencias_pets
            (pet_id, cliente_anterior, cliente_novo, data_transferencia)
        VALUES
            (OLD.id, OLD.cliente_id, NEW.cliente_id, NOW());
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_log_transferencia_pet
AFTER UPDATE ON pets
FOR EACH ROW
EXECUTE FUNCTION fn_log_transferencia_pet();


-- ============================================================
-- 3. TRIGGER: log de produto deletado
--    Tabela monitorada: produtos (preco e DECIMAL(10,2))
--    Tabela de log:     log_produtos_deletados
-- ============================================================

CREATE TABLE IF NOT EXISTS log_produtos_deletados (
    id          SERIAL         PRIMARY KEY,
    produto_id  INTEGER        NOT NULL,
    nome        VARCHAR(255)   NOT NULL,
    preco       DECIMAL(10,2)  NOT NULL,
    deletado_em TIMESTAMP      NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_produto_deletado()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_produtos_deletados
        (produto_id, nome, preco, deletado_em)
    VALUES
        (OLD.id, OLD.nome, OLD.preco, NOW());

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_log_produto_deletado
AFTER DELETE ON produtos
FOR EACH ROW
EXECUTE FUNCTION fn_log_produto_deletado();
