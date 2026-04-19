-- 1. Criação do banco de dados unificado
CREATE DATABASE IF NOT EXISTS db_petshop;

-- 2. Selecionando o banco para uso
USE db_petshop;

-- 3. Criação da tabela de Usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT,
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT pk_usuarios PRIMARY KEY (id),
    CONSTRAINT uk_login UNIQUE (login)
);

-- 4. Criação da tabela Pet
CREATE TABLE IF NOT EXISTS pet (
    id INT AUTO_INCREMENT,
    raca VARCHAR(40),
    nome VARCHAR(60) NOT NULL,
    idade INT,
    caracteristicas VARCHAR(100),
    dono VARCHAR(50) NOT NULL,
    CONSTRAINT pk_pet PRIMARY KEY (id)
);

-- 5. Inserindo dados iniciais para teste
-- Lembre-se de trocar 'SUA_SENHA' pela senha que você usa para testar o login
INSERT IGNORE INTO usuarios (login, senha) VALUES ('USUARIO', 'SUA_SENHA');