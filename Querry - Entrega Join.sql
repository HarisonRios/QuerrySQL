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











