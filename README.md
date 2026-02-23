# fila_atendimento
Aplicativo para empresa de registro de atendimento (controle de filas, registro de atendentes e pessoas atendidas)

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

	PESSOA||--o|PACIENTE:"é"
	PESSOA||--o|ATENDENTE:"é"
	ESPECIALIDADE||--o{ATENDENTE:"possui"
	ESPECIALIDADE||--o{FILA:"gera"
	FILA||--o{FILA_ATENDIMENTO:"contém"
	PACIENTE||--o{FILA_ATENDIMENTO:"entraa"
	PRIORIDADE||--o{FILA_ATENDIMENTO:"define"
	PACIENTE||--o{CONSULTA:"realiza"
	ATENDENTE||--o{CONSULTA:"atende"
```
