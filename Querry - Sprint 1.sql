-- Exercício 1

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE Jogo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  diretor VARCHAR(30),
  genero VARCHAR(30),
  dtLancamento DATE,
  nota INT,
  quantidade INT
);

INSERT INTO Jogo (nome, diretor, genero, dtLancamento, nota, quantidade) VALUES
('The Legend of Zelda: Breath of the Wild', 'Hidemaro Fujibayashi', 'Ação/Aventura', '2017-03-03', 9.8, 50),
('God of War', 'Cory Barlog', 'Ação/Aventura', '2018-04-20', 9.5, 30),
('Super Mario Odyssey', 'Kenta Motokura', 'Plataforma', '2017-10-27', 9.6, 40),
('Red Dead Redemption 2', 'Rockstar Games', 'Ação/Aventura', '2018-10-26', 9.7, 20),
('The Witcher 3: Wild Hunt', 'Konrad Tomaszkiewicz', 'RPG', '2015-05-19', 9.9, 25);

ALTER TABLE Jogo ADD COLUMN Midia ENUM('Fisica', 'Digital');

UPDATE Jogo SET Midia = 'digital' WHERE id IN(1,2,3,4,5);
SELECT * FROM Jogo;

SELECT * FROM Jogo WHERE dtLancamento > 2015-06-19;

SELECT * FROM Jogo WHERE nome LIKE 'A%' AND Midia = 'Digital';

SELECT * FROM Jogo WHERE diretor NOT LIKE '%E%';

ALTER TABLE Jogo ADD CONSTRAINT chk_nota CHECK (nota >= 0 AND nota <= 10);

SELECT * FROM Jogo WHERE genero LIKE 'Plataforma' AND Midia = 'Digital';

DELETE FROM Jogo WHERE quantidade = 0;

ALTER TABLE Jogo RENAME COLUMN diretor TO  criador;
SELECT * FROM Jogo;




-- Exercício 2

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE Esporte (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  categoria VARCHAR(20),
  numeroJogadores INT,
  estreia DATE,
  pais VARCHAR(30)
) AUTO_INCREMENT = 1;

ALTER TABLE Esporte ADD CONSTRAINT chk_categoria CHECK (Categoria IN("Individual","Coletivo"));
SELECT * FROM Esporte;

INSERT INTO Esporte (nome, categoria, numeroJogadores, estreia, pais) VALUES 
    ('Futebol', 'Coletivo', 11, '1900-01-01', 'Inglaterra'),
    ('Tênis', 'Individual', 1, '1896-01-01', 'Reino Unido'),
    ('Vôlei', 'Coletivo', 6, '1924-01-01', 'EUA'),
    ('Natação', 'Individual', 1, '1896-01-01', 'Grécia'),
    ('Basquete', 'Coletivo', 5, '1936-01-01', 'EUA');
    
ALTER TABLE Esporte ADD COLUMN popularidade DECIMAL CHECK (popularidade >= 0 AND popularidade <= 10);
SELECT * FROM Esporte;

UPDATE Esporte SET popularidade = '5' WHERE id IN(1,2,3,4,5);

SELECT * FROM Esporte ORDER BY popularidade;

SELECT * FROM Esporte WHERE estreia = 2000-00-00;

ALTER TABLE Esporte ADD CONSTRAINT chk_estreia CHECK (estreia >= '1896-04-06' AND estreia <= CURRENT_DATE);

ALTER TABLE Esporte MODIFY COLUMN categoria VARCHAR(20);

SELECT * FROM Esporte WHERE pais LIKE '_A%';

SELECT * FROM Esporte WHERE numeroJogadores BETWEEN 4 AND 11;

DELETE FROM esporte WHERE id IN (1, 3, 5);




    
-- Exercício 3

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE Catalogo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50),
  dtLancamento DATE,
  emissoraOriginal VARCHAR(50),
  classificacao VARCHAR(20),
  statusFilme VARCHAR(15),
  nota INT
) AUTO_INCREMENT = 10;

ALTER TABLE Catalogo ADD CONSTRAINT chk_nota CHECK (nota BETWEEN 1 AND 5);

INSERT INTO Catalogo (titulo, dtLancamento, emissoraOriginal, classificacao, statusFilme, nota) VALUES
    ('Dragon Ball Z', '1989-04-26', 'Fuji TV', '14', 'Exibindo', 5),
    ('Naruto', '2002-10-03', 'TV Tokyo', '12', 'Finalizado', 4),
    ('One Piece', '1999-10-20', 'Fuji TV', '12', 'Exibindo', 5),
    ('Avatar: The Last Airbender', '2005-02-21', 'Nickelodeon', '10', 'Cancelado', 5),
    ('Rick and Morty', '2013-12-02', 'Adult Swim', '16', 'Exibindo', 4);



SELECT * FROM Catalogo;

SELECT * FROM Catalogo WHERE classificacao >= 14;

SELECT * FROM Catalogo WHERE emissoraOriginal LIKE 'Fuji TV';

DROP TABLE Catalogo;

ALTER TABLE Catalogo ADD CONSTRAINT chk_status CHECK (statusFilme IN ('Exibindo', 'Finalizado', 'Cancelado'));

DELETE FROM Catalogo WHERE id = '12';

SELECT * FROM Catalogo WHERE titulo LIKE 'R%';

ALTER TABLE Catalogo RENAME COLUMN classificacao TO classificacaoIndicativa;

UPDATE Catalogo SET nota = '5', dtLancamento = '2002-10-04' WHERE id = 11;

TRUNCATE TABLE Catalogo;

ALTER TABLE Catalogo DROP CONSTRAINT chk_status;





