CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    status VARCHAR(50)
);

CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cliente_id INT
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE log_transferencias_pets (
    id SERIAL PRIMARY KEY,
    pet_id INT,
    cliente_anterior INT,
    cliente_novo INT,
    data_transferencia TIMESTAMP
);

CREATE TABLE log_produtos_deletados (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    nome VARCHAR(255),
    preco DECIMAL(10,2),
    data_exclusao TIMESTAMP
);

CREATE OR REPLACE FUNCTION impedir_cancelamento()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status = 'concluido' AND NEW.status = 'cancelado' THEN
        RAISE EXCEPTION 'Não é possível cancelar um agendamento já concluído.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_impedir_cancelamento
BEFORE UPDATE ON agendamentos
FOR EACH ROW
EXECUTE FUNCTION impedir_cancelamento();

CREATE OR REPLACE FUNCTION registrar_transferencia_pet()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.cliente_id <> NEW.cliente_id THEN
        INSERT INTO log_transferencias_pets
        (pet_id, cliente_anterior, cliente_novo, data_transferencia)
        VALUES
        (OLD.id, OLD.cliente_id, NEW.cliente_id, NOW());
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_transferencia_pet
AFTER UPDATE ON pets
FOR EACH ROW
EXECUTE FUNCTION registrar_transferencia_pet();

CREATE OR REPLACE FUNCTION registrar_produto_deletado()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_produtos_deletados
    (produto_id, nome, preco, data_exclusao)
    VALUES
    (OLD.id, OLD.nome, OLD.preco, NOW());

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_produto_deletado
BEFORE DELETE ON produtos
FOR EACH ROW
EXECUTE FUNCTION registrar_produto_deletado();