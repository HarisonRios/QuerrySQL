-- AULA 5 -- Insert de data automaticamente

USE adsa;

CREATE TABLE Cadastro (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 dtHora DATETIME default current_timestamp
 );
 
INSERT INTO Cadastro (nome) VALUES 
('Harison');

SELECT * FROM Cadastro;

UPDATE Cadastro SET dtHora = '2024-09-12 11:45:00' 
WHERE id = 1;
 
 -- ASSIM QUE INSERE COM O DATETIME = '1983-10-13 11:44:00'


 
 -- Primeiro Join

 CREATE DATABASE AulaJoin;
 USE AulaJoin;
 
 CREATE TABLE Empresa (
   idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
   nomeEmpresa VARCHAR(45),
   responsavel VARCHAR(45)
 ) auto_increment = 100;
 
 INSERT INTO Empresa (nomeEmpresa) VALUES 
 ('C6 BANK'),
 ('Bradesco');
 
 SELECT * FROM Empresa;
 
 CREATE TABLE Aluno (
  ra CHAR(8) PRIMARY KEY,
  nome VARCHAR(45),
  telefone CHAR(12),
  fkEmpresa INT,
  CONSTRAINT fkAlunoEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
 );

INSERT INTO Aluno (ra, nome, telefone, fkEmpresa) VALUES
('0124299', 'Cadu', '119234523456', '100'),
('0124292', 'Aladin', '119263523456', '101'),
('0124295', 'Genio', '119234523498', '100');

-- Exibir os alunos e as suas respecivas empresas de interesse
-- lá vem o join

-- Todo join tem ON
SELECT * FROM Aluno JOIN Empresa ON idEmpresa = fkEmpresa;

SELECT ra, idEmpresa FROM aluno JOIN empresa ON idEmpresa = fkEmpresa;

SELECT aluno.nome, empresa.nomeEmpresa FROM Aluno JOIN Empresa ON idEmpresa = fkEmpresa;

SELECT nome, nomeEmpresa FROM Aluno JOIN Empresa ON idEmpresa = fkEmpresa WHERE nomeEmpresa = 'Bradesco';



 

