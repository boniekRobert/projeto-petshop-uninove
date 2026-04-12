-- 1. Criação do banco de dados unificado
CREATE DATABASE db_petshop;

-- 2. Selecionando o banco para criar as tabelas dentro dele
USE db_petshop;

-- 3. Criação da tabela de Usuários (Para cumprir a validação de login do projeto)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT,
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT pk_usuarios PRIMARY KEY (id),
    CONSTRAINT uk_login UNIQUE (login)
);

-- 4. Criação da tabela Pet (Baseada na estrutura do exercício original)
CREATE TABLE pet (
    id INT AUTO_INCREMENT,
    raca VARCHAR(40),
    nome VARCHAR(60) NOT NULL,
    idade INT,
    caracteristicas VARCHAR(100),
    dono VARCHAR(50) NOT NULL,
    CONSTRAINT pk_pet PRIMARY KEY (id)
);

-- 5. Inserindo um usuário administrador padrão para testar o login
INSERT INTO usuarios (login, senha) VALUES ('USUARIO', 'SUA_SENHA');