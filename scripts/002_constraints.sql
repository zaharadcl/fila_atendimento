-- chaves estrangeiras e restrições

-- paciente → pessoa
ALTER TABLE paciente
ADD CONSTRAINT fk_paciente_pessoa
FOREIGN KEY (id_pessoa)
REFERENCES pessoa(id_pessoa)
ON DELETE CASCADE;

-- atendente → pessoa
ALTER TABLE atendente
ADD CONSTRAINT fk_atendente_pessoa
FOREIGN KEY (id_pessoa)
REFERENCES pessoa(id_pessoa)
ON DELETE CASCADE;

-- atendente → especialidade
ALTER TABLE atendente
ADD CONSTRAINT fk_atendente_especialidade
FOREIGN KEY (id_especialidade)
REFERENCES especialidade(id_especialidade);

-- fila → especialidade
ALTER TABLE fila
ADD CONSTRAINT fk_fila_especialidade
FOREIGN KEY (id_especialidade)
REFERENCES especialidade(id_especialidade);

-- fila_atendimento → fila
ALTER TABLE fila_atendimento
ADD CONSTRAINT fk_fila_atendimento_fila
FOREIGN KEY (id_fila)
REFERENCES fila(id_fila);

-- fila_atendimento → paciente
ALTER TABLE fila_atendimento
ADD CONSTRAINT fk_fila_atendimento_paciente
FOREIGN KEY (id_paciente)
REFERENCES paciente(id_pessoa);

-- fila_atendimento → prioridade
ALTER TABLE fila_atendimento
ADD CONSTRAINT fk_fila_atendimento_prioridade
FOREIGN KEY (id_prioridade)
REFERENCES prioridade(id_prioridade);

-- consulta → paciente
ALTER TABLE consulta
ADD CONSTRAINT fk_consulta_paciente
FOREIGN KEY (id_paciente)
REFERENCES paciente(id_pessoa);

-- consulta → atendente
ALTER TABLE consulta
ADD CONSTRAINT fk_consulta_atendente
FOREIGN KEY (id_atendente)
REFERENCES atendente(id_pessoa);
