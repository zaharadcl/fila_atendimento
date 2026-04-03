# fila_atendimento
# Sistema de Fila de Atendimento

Projeto de banco de dados desenvolvido em PostgreSQL para gerenciamento de filas, pacientes, atendentes e consultas.

## 📌 Descrição

Este projeto tem como objetivo modelar e implementar um sistema de controle de atendimento, permitindo organizar pacientes em filas com prioridades e registrar consultas realizadas.

O modelo foi baseado em um diagrama entidade-relacionamento (DER), representado abaixo:

```mermaid
erDiagram
	direction TB
	PESSOA {
		int id_pessoa PK ""  
		string cpf UK ""  
		string nome  ""  
		date data_nascimento  ""  
		string telefone  ""  
	}

	PACIENTE {
		int id_pessoa PK,FK ""  
	}

	ATENDENTE {
		int id_pessoa PK,FK ""  
		int id_especialidade FK ""  
	}

	ESPECIALIDADE {
		int id_especialidade PK ""  
		string nome  ""  
	}

	PRIORIDADE {
		int id_prioridade PK ""  
		string descricao  ""  
		int nivel  ""  
	}

	FILA {
		int id_fila PK ""  
		string nome  ""  
		int id_especialidade FK ""  
	}

	FILA_ATENDIMENTO {
		int id_fila_atendimento PK ""  
		int id_fila FK ""  
		int id_paciente FK ""  
		int id_prioridade FK ""  
		datetime data_entrada  ""  
		string status  ""  
	}

	CONSULTA {
		int id_consulta PK ""  
		int id_paciente FK ""  
		int id_atendente FK ""  
		date data  ""  
		time hora_inicio  ""  
		time hora_fim  ""  
		string status  ""  
	}

	%% ===== NOVAS TABELAS (GAMIFICAÇÃO) =====

	PONTUACAO_ATENDENTE {
		int id_atendente PK,FK ""  
		int pontos  ""  
	}

	RECOMPENSA {
		int id_recompensa PK ""  
		string descricao  ""  
		int pontos_necessarios  ""  
	}

	ATENDENTE_RECOMPENSA {
		int id_atendente PK,FK ""  
		int id_recompensa PK,FK ""  
		datetime data_resgate  ""  
	}

	%% ===== RELACIONAMENTOS ORIGINAIS =====

	PESSOA||--o|PACIENTE:"é"
	PESSOA||--o|ATENDENTE:"é"
	ESPECIALIDADE||--o{ATENDENTE:"possui"
	ESPECIALIDADE||--o{FILA:"gera"
	FILA||--o{FILA_ATENDIMENTO:"contém"
	PACIENTE||--o{FILA_ATENDIMENTO:"entra"
	PRIORIDADE||--o{FILA_ATENDIMENTO:"define"
	PACIENTE||--o{CONSULTA:"realiza"
	ATENDENTE||--o{CONSULTA:"atende"

	%% ===== RELACIONAMENTOS NOVOS =====

	ATENDENTE||--||PONTUACAO_ATENDENTE:"possui"
	ATENDENTE||--o{ATENDENTE_RECOMPENSA:"resgata"
	RECOMPENSA||--o{ATENDENTE_RECOMPENSA:"é_resgatada"
```

## 📂 Estrutura do Projeto

```
scripts/
│
├── 001_create_tables.sql     → Criação das tabelas (sem chaves estrangeiras)
├── 002_constraints.sql       → Definição de chaves estrangeiras e restrições
├── 003_inserts.sql           → Inserção de dados de teste
```

---

## 🛠 Tecnologias Utilizadas

* PostgreSQL

---

## ▶️ Como Executar

Execute os scripts na seguinte ordem:

1. `001_create_tables.sql`
2. `002_constraints.sql`
3. `003_inserts.sql`

---

## 📊 Funcionalidades do Banco

* Cadastro de pessoas (pacientes e atendentes)
* Controle de especialidades
* Organização de filas de atendimento
* Definição de prioridades
* Registro de consultas

---
## 🚀 Inovação: Gamificação de Atendentes

Foi implementado um sistema de gamificação voltado para os atendentes, com o objetivo de incentivar produtividade e engajamento.

### 🎯 Funcionalidades

* Atendentes acumulam pontos a cada consulta realizada
* Pontos podem ser trocados por recompensas (como horas de folga)
* Histórico de recompensas resgatadas

### 📊 Novas tabelas

* `pontuacao_atendente` → controle de pontos dos atendentes
* `recompensa` → catálogo de recompensas disponíveis
* `atendente_recompensa` → histórico de resgates

### 💡 Objetivo

Incentivar maior produtividade e qualidade no atendimento por meio de recompensas, alinhando o sistema com práticas modernas de gestão.



