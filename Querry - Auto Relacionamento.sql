CREATE DATABASE Familia;
USE Familia;

CREATE TABLE Pessoa (
 idPessoa INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtNasc DATE,
 fkMae INT,
 fkPai INT,
 CONSTRAINT fkFilhoMae FOREIGN KEY (fkMae) REFERENCES Pessoa(idPessoa),
 CONSTRAINT fkFilhoPai FOREIGN KEY (fkPai) REFERENCES Pessoa(idPessoa)
);


DROP TABLE Pessoa;

INSERT INTO Pessoa (nome, dtNasc) VALUES 
('Harison', '2005-10-27'),
('Edna', '1978-11-19'),
('Eluizio','1977-09-21');


SELECT * FROM Pessoa;

UPDATE Pessoa SET fkMae = 2, fkPai = 3 WHERE idPessoa = 1;

SELECT filho.nome AS Filho, 
 mae.nome AS Mãe,
 pai.nome AS Pai
 FROM Pessoa AS Filho
 JOIN Pessoa as Mae 
 ON filho.fkMae = mae.idPessoa
 JOIN Pessoa AS Pai
 ON filho.fkPai = pai.idPessoa;
 
 
 INSERT INTO Pessoa (nome, fkMae) VALUES 
 ('Arielly', '2');
 
UPDATE Pessoa SET fkPai = 3 WHERE idPessoa = 1;

SELECT filho.nome AS Filho,
 mae.nome AS Mãe,
 avó.nome as Vovó
 FROM Pessoa AS Filho
 JOIN Pessoa as Mae
 ON filho.fkMae = mae.idPessoa
 JOIN pessoa as avó
 ON mae.fkMae = avó.idPessoa;
 

 
 