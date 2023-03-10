DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS funcao CASCADE;

CREATE TABLE usuario (
	id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(12) NOT NULL,
	email VARCHAR(255) NOT NULL,
	senha VARCHAR(128) NOT NULL,
	foto VARCHAR(512) NOT NULL,
	ativo boolean,
	criado_em TIMESTAMP,
	atualizado_em TIMESTAMP,
	CONSTRAINT pk_usuario PRIMARY KEY (id),
	CONSTRAINT uk_usuario_email UNIQUE (email)
);

CREATE TABLE permissao (
	id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	funcao VARCHAR(100) NOT NULL,
	usuario_id BIGINT NOT NULL,
	CONSTRAINT pk_funcao PRIMARY KEY (id),
	CONSTRAINT uk_funcao UNIQUE (nome, usuario_id),
	CONSTRAINT fk_funcao_usuario FOREIGN KEY (usuario_id) REFERENCES usuario
);
