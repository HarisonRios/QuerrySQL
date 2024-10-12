CREATE DATABASE Exercicios;
USE Exercicios;

-- EXERCICIO 1

CREATE TABLE Funcionario (
  idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  cargo VARCHAR(45),
  areaF VARCHAR(45),
  fkSupervisor INT,
  CONSTRAINT fkSupervisor FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Funcionario (nome, cargo, fkSupervisor, areaF) VALUES
('Alice Silva', 'Gerente', NULL, 'TI'),
('Bruno Santos', 'Analista', 1, 'TI'),
('Carlos Oliveira', 'Desenvolvedor', 2, 'TI'),
('Daniela Costa', 'Assistente', 2, 'TI'),
('Eva Lima', 'Gerente de Projetos', NULL, 'Financeiro');

SELECT * FROM Funcionario;


-- SELECT com JOIN

SELECT f.nome AS Funcionario, f.cargo, f.areaF AS areaF, s.nome AS Supervisor
FROM Funcionario f JOIN Funcionario s ON f.fkSupervisor = s.idFuncionario;



-- SELECT com JOIN e WHERE

 SELECT f.nome AS Funcionario, f.Cargo, f.areaF AS Area, s.nome AS Supervisor
FROM Funcionario f
JOIN Funcionario s ON f.fkSupervisor = s.idFuncionario
WHERE f.areaF = 'TI';


-- SELECT com JOIN e CASE

SELECT f.nome, 
  CASE 
    WHEN s.nome IS NOT NULL THEN s.nome
    WHEN s.nome IS NULL THEN 'Sem Supervisor'
  END AS 'SupervisorStatus'
FROM Funcionario f 
JOIN Funcionario s ON f.fkSupervisor = s.idFuncionario;



-- EXERCICIO 2

CREATE TABLE Usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  email VARCHAR(45),
  fkGerente INT,
  CONSTRAINT fkGerente FOREIGN KEY (fkGerente) REFERENCES Usuario(idUsuario)
);

INSERT INTO Usuario (nome, email, fkGerente) VALUES
('Alice Silva', 'alice@empresa.com', NULL),
('Bruno Santos', 'bruno@empresa.com', 1),
('Carlos Oliveira', 'carlos@empresa.com', 1),
('Daniela Costa', 'daniela@empresa.com', 2),
('Eva Lima', 'eva@empresa.com', 2);

SELECT * FROM Usuario;


-- SELECT com JOIN

SELECT u.nome AS Usuario, u.email AS Email, g.nome AS Gerente 
FROM Usuario u JOIN Usuario g ON u.fkGerente = g.idUsuario;


-- SELECT com JOIN e WHERE

SELECT u.nome AS Usuario, u.email AS Email, g.nome AS Gerente 
FROM Usuario u 
JOIN Usuario g ON u.fkGerente = g.idUsuario 
WHERE u.nome LIKE "%a";


-- SELECT com JOIN e CASE

SELECT 
    u.nome AS Usuario, 
    u.email AS Email, 
    g.nome AS Gerente,
    CASE 
        WHEN u.email LIKE '%@empresa.com' THEN 'Email corporativo'
        WHEN u.email LIKE '%@gmail.com' THEN 'Email pessoal'
    END AS Tipo_Email
FROM Usuario u 
JOIN Usuario g ON u.fkGerente = g.idUsuario;







