CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;
DROP DATABASE AlunoProjeto;

CREATE TABLE Aluno (
   ra INT PRIMARY KEY AUTO_INCREMENT, 
   nome VARCHAR(45), 
   telefone VARCHAR(45),
   fkRepresentante INT, CONSTRAINT fkRepresentante 
   FOREIGN KEY (fkRepresentante) REFERENCES Aluno(ra)
);

INSERT INTO Aluno (nome, telefone, fkRepresentante) VALUES 
('Maria Silva', '1234-5678', NULL),
('João Santos', '9876-5432', NULL),
('Pedro Oliveira', '5555-1234', 1),
('Ana Pereira', '4444-5678', 2);

 CREATE TABLE Projeto (
     idProjeto INT AUTO_INCREMENT,
     fkAluno INT, 
     CONSTRAINT pkComposta PRIMARY KEY (idProjeto, fkAluno),
     nome VARCHAR(45),
     descricao VARCHAR(45),
     FOREIGN KEY (fkAluno) REFERENCES aluno(ra)
);

INSERT INTO Projeto (fkAluno, nome, descricao) VALUES 
(1, 'Projeto A', 'Descrição do Projeto A'),
(2, 'Projeto B', 'Descrição do Projeto B'),
(3, 'Projeto C', 'Descrição do Projeto C'),
(4, 'Projeto D', 'Descrição do Projeto D');

SELECT * FROM Aluno;
SELECT * FROM Projeto;

SELECT 
Alunos.nome AS Aluno,
Projeto.nome AS Projeto
FROM Aluno AS Alunos
JOIN Aluno AS Representantes ON Alunos.fkRepresentante = Representantes.ra
JOIN Projeto ON Alunos.ra = Projeto.fkAluno;

SELECT 
Alunos.ra AS RA,
Alunos.nome AS Aluno,
Alunos.telefone AS Telefone,
Representantes.ra AS RA_Representante,
Representantes.nome AS Representante,
Representantes.telefone AS Telefone_Representante
FROM Aluno AS Alunos
LEFT JOIN 
Aluno AS Representantes ON Alunos.fkRepresentante = Representantes.ra;

SELECT 
Alunos.nome AS Aluno,
Projeto.nome AS Projeto
FROM Aluno AS Alunos
JOIN Aluno AS Representantes ON Alunos.fkRepresentante = Representantes.ra
JOIN Projeto ON Alunos.ra = Projeto.fkAluno 
WHERE Projeto.nome LIKE 'Projeto C';



-- Exercicio 2

CREATE DATABASE Campanha;
USE Campanha;

CREATE TABLE Organizador (
 idOrganizador INT PRIMARY KEY AUTO_INCREMENT, 
 nome VARCHAR(45),
 endereco VARCHAR(45),
 email VARCHAR(45),
 fkOrientador INT, CONSTRAINT fkOrientador 
 FOREIGN KEY (fkOrientador) REFERENCES Organizador(idOrganizador)
);

INSERT INTO Organizador (nome, endereco, email, fkOrientador) VALUES
('Maria da Silva', 'Rua das Flores, Centro', 'maria.silva@example.com', NULL),
('João Pereira', 'Avenida Brasil, Jardim', 'joao.pereira@example.com', 1),
('Ana Santos', 'Rua da Paz, Vila Nova', 'ana.santos@example.com', 1),
('Carlos Oliveira', 'Praça da Liberdade, Centro', 'carlos.oliveira@example.com', 2),
('Fernanda Lima', 'Avenida das Américas, Jardim', 'fernanda.lima@example.com', 2);

CREATE TABLE Campanha (
idCampanha INT AUTO_INCREMENT,
fkOrganizador INT, 
CONSTRAINT pkComposta PRIMARY KEY (idCampanha, fkOrganizador),
categoria VARCHAR(45),
instituicao VARCHAR(45),
dataCampanha DATE,
FOREIGN KEY (fkOrganizador) REFERENCES Organizador(idOrganizador)
);

ALTER TABLE Campanha AUTO_INCREMENT = 500;

INSERT INTO Campanha (fkOrganizador, categoria, instituicao, dataCampanha) VALUES
(1, 'Alimento', 'Instituição A', '2024-12-01'),
(1, 'Máscaras de proteção', 'Instituição B', '2024-11-15'),
(2, 'Produto de higiene', 'Instituição C', '2024-10-20'),
(3, 'Alimento', 'Instituição D', '2024-11-30'),
(2, 'Roupas', 'Instituição E', '2024-12-05');

SELECT * FROM Organizador;

SELECT * FROM Campanha;

SELECT 
    o.idOrganizador,
    o.nome AS nome_organizador
FROM Organizador o
JOIN Campanha c ON o.idOrganizador = c.fkOrganizador
WHERE o.nome = 'Ana Santos';


SELECT 
    orientador.nome AS nome_orientador
FROM Organizador novato
JOIN Organizador orientador ON novato.fkOrientador = orientador.idOrganizador
WHERE orientador.nome = 'João Pereira';  

SELECT 
    novato.idOrganizador AS id_novato,
    novato.nome AS nome_novato,
    novato.endereco AS endereco_novato,
    campanha.idCampanha AS id_campanha,
    campanha.categoria AS categoria_campanha,
    campanha.instituicao AS instituicao_campanha,
    campanha.dataCampanha AS data_campanha,
    orientador.idOrganizador AS id_orientador,
    orientador.nome AS nome_orientador
FROM Organizador novato
JOIN Campanha campanha ON novato.idOrganizador = campanha.fkOrganizador
JOIN Organizador orientador ON novato.fkOrientador = orientador.idOrganizador;


SELECT 
    novato.idOrganizador AS id_novato,
    novato.nome AS nome_novato,
    novato.endereco AS endereco_novato,
    novato.email AS email_novato,
    campanha.idCampanha AS id_campanha,
    campanha.categoria AS categoria_campanha,
    campanha.instituicao AS instituicao_campanha,
    orientador.idOrganizador AS id_orientador,
    orientador.nome AS nome_orientador
FROM Organizador novato
JOIN Campanha campanha ON novato.idOrganizador = campanha.fkOrganizador
JOIN Organizador orientador ON novato.fkOrientador = orientador.idOrganizador
WHERE novato.nome = 'João Pereira';  










