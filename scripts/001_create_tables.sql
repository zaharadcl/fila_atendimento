-- criação das tabelas (sem chaves estrangeiras)

CREATE TABLE pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE paciente (
    id_pessoa INT PRIMARY KEY
);

CREATE TABLE atendente (
    id_pessoa INT PRIMARY KEY,
    id_especialidade INT NOT NULL
);

CREATE TABLE fila (
    id_fila SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_especialidade INT NOT NULL
);

CREATE TABLE prioridade (
    id_prioridade SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    nivel INT NOT NULL UNIQUE
);

CREATE TABLE fila_atendimento (
    id_fila_atendimento SERIAL PRIMARY KEY,
    id_fila INT NOT NULL,
    id_paciente INT NOT NULL,
    id_prioridade INT NOT NULL,
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_atendente INT NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME,
    status VARCHAR(50) NOT NULL
);
