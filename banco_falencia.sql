CREATE DATABASE IF NOT EXISTS banco_falencia;

USE banco_falencia;

CREATE TABLE IF NOT EXISTS endereco (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    estado CHAR(2),
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
    limite DECIMAL(7,2),
    cliente_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compras (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    valor_total FLOAT NOT NULL,
    parcelas INT NOT NULL,
    juros_porcentagem DECIMAL(5,4),
    estabelecimento VARCHAR(100) NOT NULL,
    data_compra DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS fatura (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    valor FLOAT NOT NULL,
    parcelas INT NOT NULL,
    data_vencimento DATE NOT NULL,
    cartao_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (cartao_id) REFERENCES cartao (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compras_fatura (
    id_compra INT UNSIGNED NOT NULL,
    id_fatura INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compras (id),
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

CREATE TABLE IF NOT EXISTS conta_externa_transacao (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    banco VARCHAR(100) NOT NULL,
    tipo_pessoa ENUM('pf', 'pj') NOT NULL,
    tipo_conta ENUM('cp', 'cc'),
    cpf_cnpj VARCHAR(14) NOT NULL,
    nome_titular VARCHAR(150) NOT NULL,
    agencia_com_digito VARCHAR(30) NOT NULL UNIQUE,
    numero_com_digito VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transacoes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo_transacao ENUM('saque', 'deposito', 'transferencia') NOT NULL,
    valor_transacao FLOAT NOT NULL,
    transacao_interna ENUM('sim', 'nao') DEFAULT 'sim',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transacoes_conta (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_transacao INT UNSIGNED NOT NULL,
    id_conta_interna_saida INT UNSIGNED,
    id_conta_interna_entrada INT UNSIGNED,
    id_conta_externa_saida INT UNSIGNED,
    id_conta_externa_entrada INT UNSIGNED,
    FOREIGN KEY (id_transacao) REFERENCES transacoes (id),
    FOREIGN KEY (id_conta_interna_saida) REFERENCES conta (id),
    FOREIGN KEY (id_conta_interna_entrada) REFERENCES conta (id),
    FOREIGN KEY (id_conta_externa_saida) REFERENCES conta_externa_transacao (id),
    FOREIGN KEY (id_conta_externa_entrada) REFERENCES conta_externa_transacao (id),
    PRIMARY KEY (id)
);
