CREATE DATABASE sprint3;
USE sprint3;

CREATE TABLE Aluno (
 idAluno INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 email VARCHAR(45)
);

INSERT INTO Aluno (nome, email) VALUES 
('batman','batmail@gmail.com'),
('robin','robin@gmail.com');

CREATE TABLE Curso (
  idCurso INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  cargaHorario time
) auto_increment = 1000;

SELECT * FROM Aluno;
SELECT * FROM Curso;

INSERT INTO Curso (nome) VALUES 
('ingles'),
('Espanhol'),
('Japones');

CREATE TABLE Matricula (
 idMatricula INT AUTO_INCREMENT,
 fkAluno INT,
 fkCurso INT,
 CONSTRAINT pkComposta PRIMARY KEY (idMatricula, fkAluno, fkCurso),
 nivel VARCHAR(45),
 dtMatricula DATE,
 CONSTRAINT fkAlunoMatricula FOREIGN KEY (fkAluno) REFERENCES aluno(idAluno), 
 CONSTRAINT fkCursoMatricula FOREIGN KEY (fkCurso) REFERENCES curso(idCurso)
);

INSERT INTO Matricula VALUES 
(default, 1, 1000, 'Avançado 1', '2024-10-25'),
(default, 1, 1001, 'Intermediario 2', '2024-10-25'),
(default, 1, 1002, 'Basico', '2024-10-25'),
(default, 2, 1000, 'Avançado 2', '2024-10-24');

SELECT aluno.nome AS Aluno,
	   curso.nome AS Curso,
       nivel FROM Aluno JOIN
       Matricula ON 
       idAluno = fkAluno JOIN Curso
       ON idCurso = fkCurso;
