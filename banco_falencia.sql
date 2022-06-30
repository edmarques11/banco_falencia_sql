CREATE DATABASE IF NOT EXISTS banco_falencia;

USE banco_falencia;

CREATE TABLE IF NOT EXISTS endereco (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    estado VARCHAR(100),
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cliente (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf_cnpj VARCHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(255),
    apelido VARCHAR(100),
    endereco_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES endereco (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cartao (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_cartao CHAR(16) NOT NULL UNIQUE,
    codigo_seguranca CHAR(3) NOT NULL,
    data_validade DATE NOT NULL,
    tipo_cartao ENUM('debito', 'credito', 'multiplo') NOT NULL,
    cartao_virtual ENUM('sim','nao') NOT NULL,
    limite NUMERIC(5,2),
    cliente_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compras_credito (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    valor_total FLOAT NOT NULL,
    parcela INT NOT NULL,
    juros_porcentagem NUMERIC(2,2),
    estabelecimento VARCHAR(100) NOT NULL,
    data_compra DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS fatura (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    valor FLOAT NOT NULL,
    parcela INT NOT NULL,
    data_vencimento DATE NOT NULL,
    cartao_id INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (cartao_id) REFERENCES cartao (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compras_fatura (
    id_compra INT UNSIGNED NOT NULL,
    id_fatura INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compras_credito (id),
    FOREIGN KEY (id_fatura) REFERENCES fatura (id),
    PRIMARY KEY (id_compra, id_fatura)
);

CREATE TABLE IF NOT EXISTS conta (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo_pessoa ENUM('pf', 'pj') NOT NULL,
    tipo_conta ENUM('cp', 'cc'),
    agencia_com_digito VARCHAR(6) NOT NULL UNIQUE,
    numero_com_digito VARCHAR(11) NOT NULL UNIQUE,
    cliente_id INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transacoes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo_transacao ENUM('saque', 'deposito') NOT NULL,
    valor_transacao FLOAT,
    conta_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES conta (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transacoes_conta (
    id_transacao INT UNSIGNED NOT NULL,
    id_conta INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_transacao) REFERENCES transacoes (id),
    FOREIGN KEY (id_conta) REFERENCES conta (id),
    PRIMARY KEY (id_transacao, id_conta)
);
