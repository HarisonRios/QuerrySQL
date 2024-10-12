CREATE DATABASE Familia;
USE Familia;

CREATE TABLE AvoPaterno (
 idAvoPaterno INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45)
);

CREATE TABLE AvoPaterna (
 idAvoPaterna INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45)
);

CREATE TABLE AvoMaterno (
 idAvoMaterno INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45)
);

CREATE TABLE AvoMaterna (
 idAvoMaterna INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45)
);

CREATE TABLE Pai (
 idPai INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45),
 fkAvoPaterno INT, CONSTRAINT fkAvoPaterno FOREIGN KEY (fkAvoPaterno) REFERENCES AvoPaterno(idAvoPaterno),
 fkAvoPaterna INT, CONSTRAINT fkAvoPaterna FOREIGN KEY (fkAvoPaterna) REFERENCES AvoPaterna(idAvoPaterna)
);

CREATE TABLE Mae (
 idMae INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45),
 fkAvoMaterno INT, CONSTRAINT fkAvoMaterno FOREIGN KEY (fkAvoMaterno) REFERENCES AvoMaterno(idAvoMaterno),
 fkAvoMaterna INT, CONSTRAINT fkAvoMaterna FOREIGN KEY (fkAvoMaterna) REFERENCES AvoMaterna(idAvoMaterna)
);

CREATE TABLE Filho(
 idFilho INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNascimento DATE,
 estado VARCHAR(45),
 fkPai INT, CONSTRAINT fkPai FOREIGN KEY (fkPai) REFERENCES Pai(idPai),
 fkMae INT, CONSTRAINT fkMae FOREIGN KEY (fkMae) REFERENCES Mae(idMae)
);


INSERT INTO AvoPaterno VALUES
(default, 'Zezo', '1957-12-12', 'Bahia'),
(default, 'João', '1956-11-25', 'Pernanbuco'),
(default, 'João F', '1920-10-12', 'Parana'),
(default, 'Antonio', '1967-11-24', 'São Paulo')
;
INSERT INTO AvoPaterna VALUES
(DEFAULT, 'Ezelvir', '1961-02-12','Bahia'),
(DEFAULT, 'Josefa', '1962-02-25','Pernanbuco'),
(DEFAULT, 'Joana', '1952-08-15','Ceara'),
(DEFAULT, 'Antonia', '1961-02-12','São Paulo');

INSERT INTO AvoMaterno VALUES 
(DEFAULT, 'Raimundo', '1978-02-06', 'Bahia'),
(DEFAULT, 'João', '1945-05-30', 'Bahia'),
(DEFAULT, 'Gabriel', '1975-10-23', 'São Paulo'),
(DEFAULT, 'Aldalto', '1982-03-10', 'Pernanbuco');

INSERT INTO AvoMaterna  VALUES
(DEFAULT, 'Josefa', '1961-05-12','Bahia'),
(DEFAULT, 'Odete', '1935-05-25','Pernanbuco'),
(DEFAULT, 'Dejanira', '1921-08-20','São Paulo'),
(DEFAULT, 'Maria', '1966-02-12','São Paulo');



SELECT * FROM AvoPaterna;






