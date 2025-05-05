CREATE DATABASE iot_monitoramento;

\c iot_monitoramento;

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

CREATE TABLE medicoes (
    id SERIAL PRIMARY KEY,
    dispositivo_id VARCHAR(50),
    timestamp TIMESTAMPTZ NOT NULL,
    temperatura FLOAT,
    umidade FLOAT
);

SELECT create_hypertable('medicoes', 'timestamp');

CREATE TABLE alertas (
    id SERIAL PRIMARY KEY,
    dispositivo_id VARCHAR(50),
    timestamp TIMESTAMPTZ NOT NULL,
    tipo_alerta VARCHAR(50),
    valor FLOAT,
    mensagem TEXT
);
