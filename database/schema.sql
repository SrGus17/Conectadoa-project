SET NAMES utf8mb4;

DROP DATABASE IF EXISTS conectadoa;

CREATE DATABASE conectadoa
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE conectadoa;

CREATE TABLE doador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    categoria_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (quantidade >= 0),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE doacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doador_id INT NOT NULL,
    data_doacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT 'pendente',
    FOREIGN KEY (doador_id) REFERENCES doador(id)
);

CREATE TABLE doacao_item (
    doacao_id INT NOT NULL,
    item_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (doacao_id, item_id),
    CHECK (quantidade > 0),
    FOREIGN KEY (doacao_id) REFERENCES doacao(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES item(id)
);
