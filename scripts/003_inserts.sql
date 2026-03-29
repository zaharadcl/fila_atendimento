-- dados de teste

INSERT INTO especialidade (nome)
VALUES ('Clínico Geral'), ('Pediatria');

INSERT INTO pessoa (nome, data_nascimento, telefone)
VALUES 
('João Silva', '1990-05-10', '99999-1111'),
('Maria Souza', '1985-03-20', '99999-2222');

INSERT INTO paciente (id_pessoa) VALUES (1);

INSERT INTO atendente (id_pessoa, id_especialidade)
VALUES (2, 1);

INSERT INTO prioridade (descricao, nivel)
VALUES ('Normal', 1), ('Urgente', 2);

INSERT INTO fila (nome, id_especialidade)
VALUES ('Fila Geral', 1);

INSERT INTO fila_atendimento (id_fila, id_paciente, id_prioridade, status)
VALUES (1, 1, 1, 'Aguardando');

INSERT INTO consulta (id_paciente, id_atendente, data, hora_inicio, hora_fim, status)
VALUES (1, 2, '2026-03-28', '10:00', '10:30', 'Finalizada');
