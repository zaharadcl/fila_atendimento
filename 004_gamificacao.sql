-- pontuação do atendente
CREATE TABLE pontuacao_atendente (
    id_atendente INT PRIMARY KEY,
    pontos INT DEFAULT 0,

    CONSTRAINT fk_pontuacao_atendente
    FOREIGN KEY (id_atendente)
    REFERENCES atendente(id_pessoa)
    ON DELETE CASCADE
);

-- registro de recompensas (folgas)
CREATE TABLE recompensa (
    id_recompensa SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    pontos_necessarios INT NOT NULL
);

-- histórico de recompensas resgatadas
CREATE TABLE atendente_recompensa (
    id_atendente INT,
    id_recompensa INT,
    data_resgate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_atendente, id_recompensa, data_resgate),

    FOREIGN KEY (id_atendente) REFERENCES atendente(id_pessoa),
    FOREIGN KEY (id_recompensa) REFERENCES recompensa(id_recompensa)
);
