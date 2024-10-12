CREATE DATABASE aula3;
USE aula3;

CREATE TABLE Funcionarios (
   id int primary key auto_increment,
   nome varchar(45) not null,
   peso float,
   altura float,
   salario decimal(10,2),
   dtNasc date
);

DESCRIBE Funcionarios;

INSERT INTO Funcionarios VALUES 
  (default, 'Batman', 94.400, 1.95, 1952492, '1960-01-01');

INSERT INTO Funcionarios (nome) VALUES 
  ('Superman'); 

UPDATE Funcionarios SET salario = 19.99 WHERE id = 2;

SELECT * FROM Funcionarios;

INSERT INTO Funcionarios (nome) VALUE 
('Arlequina');

SELECT * FROM Funcionarios;

ALTER TABLE Funcionarios ADD COLUMN tipo varchar(45), 
  ADD CONSTRAINT chkTipo CHECK(tipo in ('Heroi', 'Vilão')); 

UPDATE Funcionarios SET tipo = 'Heroi' WHERE id in (1,2,3);
UPDATE Funcionarios SET tipo = 'Vilão' WHERE id in (4);

SELECT nome, dtNasc from Funcionarios WHERE nome = 'Batman';

SELECT nome, TIMESTAMPDIFF(YEAR, dtNasc, now()) FROM Funcionarios WHERE nome = 'Batman';


-- APELIDAR - ALIASES

SELECT nome AS 'Nome Funcionario', TIMESTAMPDIFF(YEAR, dtNasc, now()) FROM Funcionarios WHERE nome = 'Batman';

-- CONCATENAR CONCAT()
-- EXBIR A SEGUINTE FRASE : O XPTO TEM Y ANOS.

SELECT concat('O ', nome, ' tem ', TIMESTAMPDIFF(YEAR, dtNasc, now()), ' anos.') AS frase  FROM Funcionarios WHERE nome = 'Batman';

SELECT CASE 
 WHEN tipo = 'Vilão' THEN 'Eu sou mal!'
 WHEN tipo = 'Heroi' THEN 'Eu sou o cara!'
 END AS 'Frases de Efeito' FROM Funcionarios;
 
 SELECT * FROM Funcionarios;
 SELECT nome, ifnull(peso, 'Está faltando o peso!') as peso FROM Funcionarios;





/* 
 INTEIROS - INT 
 TINYINT DE -127 a 127
 
 DECIMAIS
 FLOAT = 7 CARACTERES
 DOUBLE = 15 CARACTERES
 DECIMAL() = 32 CARACTERES
   DECIMAL(5,2) = 245,55 <--- VOLTOU 2 CASAS 
   DECIMAL(6,3) = 543,323 <---- VOLTOU 3 CASAS
*/


