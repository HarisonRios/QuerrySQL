
CREATE DATABASE sprint1;
USE sprint1;


-- Exercício 1

CREATE TABLE Atleta (
  idAtleta int primary key,
  nome varchar(40),
  modalidade varchar(40),
  qtdMedalha int
);

INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha)
VALUES
(1, 'Ana Silva', 'Natação', 5),
(2, 'Carlos Pereira', 'Natação', 3),
(3, 'Mariana Costa', 'Atletismo', 4),
(4, 'João Souza', 'Atletismo', 2),
(5, 'Roberta Lima', 'Ginástica', 6),
(6, 'Ricardo Mendes', 'Ginástica', 4),
(7, 'Harison Rios', 'Futebol', 2),
(8, 'Samantha Alves', 'Basquete', 3),
(9, 'Paulo Junior', 'Salto', 2),
(10, 'Alesandro Carvalho', 'Volei', 5);


SELECT * FROM Atleta;
SELECT nome, qtdMedalha FROM Atleta;
SELECT * FROM atleta WHERE modalidade = 'Natação';
SELECT * FROM atleta ORDER BY modalidade;	
SELECT * FROM Atleta ORDER BY qtdMedalha desc;
SELECT nome FROM Atleta WHERE nome LIKE 'S%';
SELECT nome FROM Atleta WHERE nome LIKE 'H%';
SELECT nome FROM Atleta WHERE nome LIKE '%O';
SELECT *FROM Atleta WHERE nome LIKE '%r_';
-- DROP TABLE Atleta;


-- Exercício 2

CREATE TABLE Musica ( 
  idMusica int primary key,
  titulo varchar(40),
  artista varchar(40),
  genero varchar(40)
);

INSERT INTO Musica (idMusica, titulo, artista, genero) 
VALUES
(1, 'Sicko Mode', 'Travis Scott', 'Trap'),
(2, 'Goosebumps', 'Travis Scott', 'Trap'),
(3, 'SAD!', 'XXXTentacion', 'Trap'),
(4, 'XO TOUR Llif3', 'Lil Uzi Vert', 'Trap'),
(5, 'Juicy', 'The Notorious B.I.G.', 'Boom Bap'),
(6, 'N.Y. State of Mind', 'Nas', 'Boom Bap'),
(7, 'HUMBLE.', 'Kendrick Lamar', 'Rap');

SELECT * FROM Musica;
SELECT titulo, artista from Musica;
SELECT * FROM Musica WHERE genero = 'Trap';
SELECT * FROM Musica WHERE artista = 'Travis Scott';
SELECT * FROM Musica ORDER BY titulo;
SELECT * FROM Musica ORDER BY artista desc;
SELECT * FROM Musica WHERE titulo LIKE 'S%';
SELECT * FROM Musica WHERE artista LIKE 'T%';
SELECT * FROM Musica WHERE genero LIKE '_R%';
SELECT * FROM Musica WHERE titulo LIKE '%P_';
-- DROP TABLE Musica;



-- Exercício 3

CREATE TABLE Filme (
    idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO Filme (idFilme, titulo, genero, diretor) VALUES
(1, 'Ação Total', 'Ação', 'John Doe'),
(2, 'Comédia em Dobro', 'Comédia', 'Jane Smith'),
(3, 'Ação Explosiva', 'Ação', 'John Doe'),
(4, 'Drama Intenso', 'Drama', 'Emily Johnson'),
(5, 'Comédia sem Limites', 'Comédia', 'Jane Smith'),
(6, 'Suspense Noturno', 'Suspense', 'Robert Brown'),
(7, 'O Grande Drama', 'Drama', 'Emily Johnson');


SELECT * FROM Filme;
SELECT titulo, diretor from Filme;
SELECT * FROM Filme WHERE genero = 'Ação';
SELECT * FROM Filme WHERE diretor = 'John Doe';
SELECT * FROM Filme ORDER BY titulo;
SELECT * FROM Filme ORDER BY diretor desc;
SELECT * FROM Filme WHERE titulo LIKE 'S%';
SELECT * FROM Filme WHERE diretor LIKE 'J%';
SELECT * FROM Filme WHERE genero LIKE '_R%';
SELECT * FROM Filme WHERE titulo LIKE '%E_';
-- DROP TABLE Filme;




-- Exercício 4

CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor (idProfessor, nome, especialidade, dtNasc) 
VALUES
(1, 'Ana Silva', 'Matemática', '1980-05-15'),
(2, 'Carlos Oliveira', 'Física', '1975-09-23'),
(3, 'Beatriz Souza', 'Matemática', '1983-11-30'),
(4, 'José Santos', 'Química', '1978-07-14'),
(5, 'Mariana Costa', 'Física', '1982-02-20'),
(6, 'Lucas Pereira', 'Biologia', '1990-12-05');

SELECT * FROM Professor;
SELECT especialidade from Professor;
SELECT * FROM Professor WHERE especialidade = 'Matemática';
SELECT * FROM Professor ORDER BY nome;
SELECT * FROM Professor ORDER BY dtNasc desc;
SELECT * FROM Professor WHERE nome LIKE 'C%';
SELECT * FROM Professor WHERE nome LIKE 'A%';
SELECT * FROM Professor WHERE nome LIKE '_O%';
SELECT * FROM Professor WHERE nome LIKE '%R_';
-- DROP TABLE Professor;



-- Exercício 5

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO Curso (idCurso, nome, sigla, coordenador)
VALUES
(1, 'Engenharia de Computação', 'EC', 'Carlos Oliveira'),
(2, 'Administração', 'ADM', 'Ana Silva'),
(3, 'Design Gráfico', 'DG', 'Beatriz Souza'),
(4, 'Física', 'FIS', 'José Santos'),
(5, 'Química', 'QUI', 'Mariana Costa');

SELECT * FROM Curso;
SELECT coordenador from Curso;
SELECT * FROM Curso WHERE sigla = 'EC';
SELECT * FROM Curso ORDER BY nome = 'Física';
SELECT * FROM Curso ORDER BY coordenador desc;
SELECT * FROM Curso WHERE nome LIKE 'E%';
SELECT * FROM Curso WHERE nome LIKE '%A';
SELECT * FROM Curso WHERE nome LIKE '_I%';
SELECT * FROM Curso WHERE nome LIKE '%A_';
-- DROP TABLE Curso;




	
-- Exercício 6

CREATE TABLE Revista (
    idRevista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista (nome) 
VALUES
('Veja'),
('Isto é'),
('Epoca'),
('Quatro Rodas');

SELECT * FROM Revista;
UPDATE Revista SET categoria = CASE
    WHEN idRevista = 1 THEN 'Política'
    WHEN idRevista = 2 THEN 'Atualidades'
    WHEN idRevista = 3 THEN 'Economia'
END WHERE idRevista IN (1, 2, 3);
SELECT * FROM Revista;
INSERT INTO Revista (nome, categoria) VALUES
('Claudia', 'Moda'),
('Super Interessante', 'Ciência'),
('Veja Saúde', 'Saúde');
SELECT * FROM Revista;
DESCRIBE Revista;
ALTER TABLE Revista
MODIFY COLUMN categoria VARCHAR(40);
DESCRIBE Revista;
ALTER TABLE Revista
ADD COLUMN periodicidade VARCHAR(15);
SELECT * FROM Revista;
ALTER TABLE Revista
-- DROP COLUMN periodicidade;
	



