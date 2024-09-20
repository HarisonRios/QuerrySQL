-- Exercício 1

CREATE DATABASE Sprint2;
USE Sprint2;

CREATE TABLE Atleta (
 idAtleta INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(40),
 modalidade VARCHAR(40), 
 qtdMedalha INT
);

INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES 
('Simone','Ginastica','3'),
('Cleiton','Ginastica','5'),
('Albert','Basquete','6'),
('Harison','Futsal','10'),
('Vivian','Futebol','8'),
('Eduardo', 'Futsal', '3');

SELECT * FROM Atleta;

CREATE TABLE Pais  (
  idPais INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  capital VARCHAR(40)
);

INSERT INTO Pais (nome, capital) VALUES
('Brasil', 'Brasilia'),
('Alemanha', 'Berlin'),
('Argentina', 'Buenos Aires'),
('Portugal', 'Lisboa'),
('Inglaterra', 'Londres'),
('Chile', 'Santigo');

SELECT * FROM Pais;

DROP TABLE Atleta;

CREATE TABLE Atleta (
  idAtleta INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  modalidade VARCHAR(40), 
  qtdMedalha INT,
  fkPais INT, FOREIGN KEY (fkPais) REFERENCES Pais(idPais)
);

UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 1;
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 5 WHERE idAtleta = 5;
UPDATE Atleta SET fkPais = 6 WHERE idAtleta = 6;

SELECT * FROM Atleta;
SELECT * FROM  Atleta JOIN Pais ON idPais = fkPais;

SELECT * FROM  Atleta WHERE fkPais = '1'; -- 1 é o Brasil
SELECT atleta.nome, pais.nome FROM Atleta JOIN Pais ON idPais = fkPais;

SELECT Atleta.nome AS NomeAtleta, Pais.nome AS NomePais, Pais.capital FROM Atleta JOIN Pais ON Atleta.fkPais = Pais.idPais WHERE Pais.capital = 'Brasília';


-- Exercício 2

USE Sprint2;

CREATE TABLE Musica (
  idMusica INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(40),
  artista VARCHAR(40),
  genero VARCHAR(40)
);

INSERT INTO Musica (titulo, artista, genero) VALUES
('Plaqtudum', 'Recayd Mob', 'Trap BR'),
('MDS', 'TETO', 'Trap BR'),
('Aquecimento Senta Senta Suave', 'MC Jacaré', 'Trap BR'),
('Groupies', 'Matuê', 'Trap BR'),
('Racks', 'WIU', 'Trap BR'),
('Poesia Acústica #6', 'Pineapple Storm', 'Trap BR'),
('Quer Voar', 'Matuê', 'Trap BR');

CREATE TABLE Album (
 idAlbum INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL,
 tipo VARCHAR(10),
 dtLancamento DATE
);

ALTER TABLE Album ADD CONSTRAINT chk_tipo CHECK (tipo IN ('digital', 'físico'));

INSERT INTO Album (nome, tipo, dtLancamento)
VALUES
('Album 1', 'digital', '2023-05-01'),
('Album 2', 'físico', '2024-01-15');

SELECT * FROM Album;

-- DROP TABLE Musica;

CREATE TABLE Musica (
  idMusica INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(40),
  artista VARCHAR(40),
  genero VARCHAR(40),
  fkAlbum INT
);

SELECT * FROM Musica;

SELECT * FROM Musica JOIN Album ON idAlbum = fkAlbum;

UPDATE Musica SET fkAlbum = 1 WHERE idMusica  = 1;
UPDATE Musica  SET fkAlbum = 2 WHERE idMusica  = 2;
UPDATE Musica SET fkAlbum = 3 WHERE idMusica  = 3;
UPDATE Musica SET fkAlbum = 4 WHERE idMusica  = 4;
UPDATE Musica SET fkAlbum  = 5 WHERE idMusica = 5;
UPDATE Musica SET fkAlbum = 6 WHERE idMusica  = 6;
UPDATE Musica SET fkAlbum = 7 WHERE idMusica  = 7;

SELECT musica.titulo, album.nome FROM Musica JOIN Album ON idAlbum = fkAlbum;

SELECT Musica.*, Album.nome AS nome_album, Album.tipo AS tipo_album, Album.dtLancamento FROM Musica JOIN Album ON Musica.fkAlbum = Album.idAlbum WHERE Album.tipo = 'digital';




















-- •  Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
-- ou físico) e dtLancamento (DATE).
-- • Inserir pelo menos 2 albuns;
-- • Fazer a modelagem lógica conforme a regra de negócio:
-- •  1 album pode ter 1 ou muitas músicas;
-- • 1 música é de 1 e somente 1 album;








