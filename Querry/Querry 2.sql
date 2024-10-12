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


SELECT * FROM Atleta;
UPDATE Atleta SET  qtdMedalha = 4 WHERE idAtleta = 1;
UPDATE Atleta SET qtdMedalha = 5 WHERE idAtleta IN (2, 3);
UPDATE Atleta SET nome = "harisin" WHERE idAtleta = 4;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

UPDATE Atleta SET dtNasc = '1990-05-15' WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '1988-11-22' WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '1992-03-30' WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '1991-07-19' WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '1989-09-05' WHERE idAtleta = 5;
UPDATE Atleta SET dtNasc = '1987-04-11' WHERE idAtleta = 6;
UPDATE Atleta SET dtNasc = '1993-12-25' WHERE idAtleta = 7;
UPDATE Atleta SET dtNasc = '1994-01-14' WHERE idAtleta = 8;
UPDATE Atleta SET dtNasc = '1995-08-07' WHERE idAtleta = 9;
UPDATE Atleta SET dtNasc = '1986-06-23' WHERE idAtleta = 10;
DELETE FROM Atleta WHERE idAtleta = 5;
SELECT * FROM Atleta WHERE modalidade <> 'Natação';
SELECT * FROM Atleta WHERE qtdMedalha >= 3;
ALTER TABLE Atleta MODIFY modalidade VARCHAR(60);
DESCRIBE Atleta;
-- TRUNCATE TABLE Atleta;







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

SELECT * FROM Musica;
ALTER TABLE Musica ADD COLUMN curtida INT;
UPDATE Musica SET curtida = 631122 WHERE idMusica = 1;
UPDATE Musica SET curtida = 434345 WHERE idMusica = 2;
UPDATE Musica SET curtida = 535124 WHERE idMusica = 3;
UPDATE Musica SET curtida = 5135253 WHERE idMusica = 4;
UPDATE Musica SET curtida = 2523525 WHERE idMusica = 5;
UPDATE Musica SET curtida = 151221 WHERE idMusica = 6;
UPDATE Musica SET curtida = 14242 WHERE idMusica = 7;

ALTER TABLE Musica MODIFY artista VARCHAR(80);
UPDATE Musica SET curtida = 4212314 WHERE idMusica = 1;
UPDATE Musica SET curtida = 5898992 WHERE idMusica IN (2, 3);
UPDATE Musica SET titulo = "Teste" WHERE idMusica = 5;
DELETE FROM Musica WHERE idMusica = 4;
SELECT * FROM Musica WHERE genero <> 'Funk';
SELECT * FROM Musica WHERE curtida >= 20;
DESCRIBE Musica;
-- TRUNCATE TABLE Musica;



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

SELECT * FROM Filme;
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);
UPDATE Filme SET protagonista = "Não sei 1" WHERE idFilme = 1;
UPDATE Filme SET protagonista = "Não sei 2" WHERE idFilme = 2;
UPDATE Filme SET protagonista = "Não sei 3" WHERE idFilme = 3;
UPDATE Filme SET protagonista = "Não sei 4" WHERE idFilme = 4;
UPDATE Filme SET protagonista = "Não sei 5" WHERE idFilme = 5;
UPDATE Filme SET protagonista = "Não sei 6" WHERE idFilme = 6;
UPDATE Filme SET protagonista = "Não sei 7" WHERE idFilme = 7;

ALTER TABLE Filme MODIFY diretor VARCHAR(150);
UPDATE Filme SET diretor = "Diretor monstro ai" WHERE idFilme = 5;
UPDATE Filme SET diretor = "O brabo" WHERE idFilme IN (2, 7);
UPDATE Filme SET titulo = "Teste" WHERE idFilme = 6;
DELETE FROM Filme WHERE idFilme = 3;
SELECT * FROM Filme WHERE genero <> 'Drama';
SELECT * FROM Filme WHERE genero > 'Suspense';
DESCRIBE Filme;
-- TRUNCATE TABLE Filme;



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

SELECT * FROM Professor;
ALTER TABLE Professor ADD funcao VARCHAR(50);
ALTER TABLE Professor ADD CONSTRAINT chk_funcao CHECK (funcao IN ('monitor', 'assistente', 'titular'));
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 1;
INSERT INTO Professor VALUES
(7, 'Eduardo', 'Tecnologia', '1999-04-20', 'titular');
SELECT * FROM Professor;
DELETE FROM Professor WHERE idProfessor = 5;
SELECT * FROM Professor WHERE funcao = "titular";
SELECT especialidade, dtNasc FROM Professor WHERE funcao = "monitor";
UPDATE Professor SET dtNasc = "2005-10-27" WHERE idProfessor = 3;
-- TRUNCATE TABLE Professor;


  







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
	



