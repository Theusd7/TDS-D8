
-- Rerefencia das aulas: https://www.w3schools.com/mysql/mysql_create_db.asp

-- COMANDOS

-- Lista todas as bases de dados que existem dentro do meu banco SGDB;

	SHOW DATABASES;

-- Criar um banco de dados

	CREATE DATABASE TESTE;

-- Apagando um banco de dados;

	DROP DATABASE TESTE;

-- Acessando um banco de dados

	--MariaDb[none]>

	USE TESTE;

	--MariaDb[TESTE]>

-- Saido de um banco de dados (FICO DEVENDO O COMANDO PARA SAIR DO BANCO DE DADOS ☹️)

-- criando minha primeira tabela no meu banco de dados
	
	CREATE TABLE alunos(
		nome VARCHAR(255)
	);

	CREATE TABLE turmas(
	
	);

	CREATE TABLE alunos( 
		id INT PRIMARY KEY AUTO_INCREMENT,
		nome VARCHAR(255),
		endereco VARCHAR(255),
		telefone VARCHAR(255),
		ra VARCHAR(255),
		idade INT,
		UNIQUE INDEX `alunos_nome_key`(`nome`)
	);

	INSERT INTO alunos(nome, endereco, telefone, ra, idade) VALUES("Guilherme", "teste", "33472974934", "123", 27);


-- Deletar uma tabela;

	DROP TABLE alunos;

-- Listando todas as tabelas;
	
	SHOW TABLES;

-- COMANDOS DML;

--CRIADO MEU PRIEMIRO BANCO DE DADOS

	CREATE DATABASE escola;

-- ACESSANDO AO BANCO DE DADOS escola

	USE escola;

--CRIANDO A TABELA ALUNOS

	CREATE TABLE alunos(
		id INT NOT NULL,
		nome VARCHAR(255) NOT NULL, 
		ra VARCHAR(20) NOT NULL,
		email VARCHAR(255)
	);

-- ALTERANDO A ESTRUTURA DE UMA TABELA

	ALTER TABLE alunos ADD status BOOLEAN;

-- APAGANDO UM CAMPO DE UMA TABLEA

	ALTER TABLE alunos DROP COLUMN status;

-- LISTA ESTRUTURA DE UMA TABLE

	DESC alunos;

-- ADICIONA MAIS DO QUE UMA COLUNA AO MESMO TEMPO

	ALTER TABLE alunos ADD (
		cpf VARCHAR(255), 
		tlefone VARCHAR(255)
	);

-- RENOMEANDO NOME DO CAMPO DE UMA TABELA
	ALTER TABLE alunos RENAME COLUMN tlefone TO telefone;

-- ALTERANDO O TIPO DE UM CAMPO DE UMA TABELA

	ALTER TABLE alunos MODIFY COLUMN telefone VARCHAR(20);


-- COMANDOS SQL (CRUD)

	-- C = CREATE = INSERIR 
	-- R = READER = LEITURA
	-- U = UPDATED = ATUALIZAR
	-- D = DELETE = EXCLUIR

-- COMANDO QUE INSERE REGISTRO EM UMA TABELA

	INSERT INTO alunos (id, nome, ra, email) VALUES(1, "Guilherme", "12345", "guilherme.emanuel@sistemafiep.org.edu");

	INSERT INTO alunos (id, nome, ra, email) 
	VALUES(0, "Guilherme", "12345", ""),
	(1, "Guilherme", "12345", ""),
	(2, "Carmen", "12345", ""),
	(3, "Evelyn", "12345", ""),
	(4, "Glauci", "12345", ""),
	(5, "Marcelo", "12345", ""),
	(6, "Fabiano", "12345", ""),
	(7, "Andre", "12345", ""),
	(8, "Marione", "12345", ""),
	(9, "Matheus 1", "12345", ""),
	(10, "Matheus 2", "12345", ""),
	(11, "Herlan", "12345", "");

-- INSERINDO REGISTRO OBRIGATORIOS DENTRO DA TABELA alunos

	INSERT INTO alunos(id, nome) VALUES(1, "");

-- LENDO REGISTROS DE UMA TABELA

	SELECT * FROM alunos;

-- EXCLUIR TODOS OS REGISTROS DE UMA TABELA

	DELETE FROM alunos;

-- ALTERANDO ESTRUTURA DA TABELA ALUNO PARA CAMPOS OBRIGATORIOS
	ALTER TABLE alunos MODIFY nome VARCHAR(255) NOT NULL;

-- ATUALIZANDO REGISTROS EM UMA TABELA

	UPDATE alunos SET email = "guilherme.emanuel@sistemasfiep.org.br";

-- BUSCADO UM REGISTRO EM UMA TABELE UTILIZADO FILTROS
	SELECT * FROM alunos WHERE nome = "Marcelo";

	= IGUAL
 	< MENOR
 	<= MENOR IGUAL
 	> MAIOR
 	>= MAIOR IGUAL
 	<> DIFERENTE


-- ATUALIZANDO SOMENTE UM REGISTRO

 	UPDATE alunos SET email = "marcelo@gmail.com" WHERE nome = "Marcelo";
	UPDATE alunos SET id = 12 WHERE nome = "Guilherme";

-- EXCLUINDO UM REGISTRO UTILIZANDO FILTRAGEM 

 	DELETE FROM alunos WHERE nome = "guilherme";

-- MODIFICANDO O CAMPO ID DA TABELA ALUNOS PARA PRIMARY KEY

 	ALTER TABLE alunos MODIFY id INT NOT NULL PRIMARY KEY ;

-- BUSCADO REGISTRO UTILIZANDO ELEMENTO DE FILTRAGEM
 	SELECT * FROM alunos WHERE  id = 0;



CREATE TABLE clientes(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(255),
	telefone VARCHAR(10),
	ativo BOOLEAN NOT NULL DEFAULT(TRUE)
	);
INSERT INTO clientes(id, nome, cpf, telefone) VALUES(1, "guilherme",99999999,469997070);

	CREATE TABLE produtos(
     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     nome VARCHAR(255) NOT NULL,
     quantidade INT NOT NULL,
     preco DECIMAL (9,2) NOT NULL,
     ativo BOOLEAN NOT NULL DEFAULT(TRUE)
     );


CREATE TABLE pedidos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO produtos(id,nome,quantidade,preco) VALUES(1, "cafe",2,40);
INSERT INTO pedidos(id,id_cliente, id_produtos, quantidade,total) VALUES(1, "1","1",1,20);


CREATE TABLE pedidos_items(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_pedido INT NOT NULL,
	id_produtos INT NOT NULL,
	quantidade INT NOT NULL,
	total DECIMAL(9,2) NOT NULL,
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
	FOREIGN KEY (id_produtos) REFERENCES produtos(id)
);

INSERT INTO pedidos_items(id_pedido,id_produtos,quantidade,total) VALUES(1,2,1,40);
INSERT INTO pedidos(id_cliente) VALUES(2),(3),(4),(5),(6),(7);
INSERT INTO produtos(id,nome,quantidade,preco) VALUES(2, "lapis",5,3);
INSERT INTO produtos(id,nome,quantidade,preco) VALUES(4, "caderno",5,25);
INSERT INTO clientes(id, nome, cpf, telefone) VALUES(3,"marcelo",99999999,469997070);
INSERT INTO clientes(id, nome, cpf, telefone) VALUES(4,"claudia",99999999,469997070);
INSERT INTO clientes(id, nome, cpf, telefone) VALUES(2,"marcia",99999999,469997070);