CREATE DATABASE Exercicios;
USE Exercicios;

-- Exercicio 1

CREATE TABLE Pessoa ( 
  idPessoa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  cpf CHAR(11)
);

CREATE TABLE Reserva (
  idReserva INT PRIMARY KEY AUTO_INCREMENT,
  dtReserva DATETIME,
  dtRetirada DATETIME,
  dtDevolucao DATETIME,
  fkPessoa INT, CONSTRAINT fkPessoa FOREIGN KEY (fkPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO Pessoa (nome, cpf) VALUES 
('João Silva', '12345678901'),
('Maria Oliveira', '23456789012'),
('Carlos Santos', '34567890123'),
('Ana Lima', '45678901234'),
('Fernanda Costa', '56789012345');

INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES 
('2024-09-01 10:00:00', '2024-09-02 10:00:00', '2024-09-10 10:00:00', 1), 
('2024-09-05 11:00:00', '2024-09-06 11:00:00', '2024-09-12 11:00:00', 2), 
('2024-09-10 12:00:00', '2024-09-11 12:00:00', '2024-09-15 12:00:00', 3), 
('2024-09-15 13:00:00', '2024-09-16 13:00:00', '2024-09-20 13:00:00', 4), 
('2024-09-20 14:00:00', '2024-09-21 14:00:00', '2024-09-25 14:00:00', 5); 

SELECT * FROM Pessoa JOIN Reserva on idPessoa = fkPessoa;

SELECT pessoa.nome AS 'Nome Pessoa' FROM Pessoa JOIN Reserva ON idPessoa = fkPessoa;

SELECT nome, CASE 
 WHEN nome LIKE '%a' THEN 'Seu nome termina com A'
 WHEN nome LIKE 'a%' THEN 'Seu nome começa com A'
  WHEN nome LIKE '%s' THEN 'Seu termina com S'
 END AS 'Nome das Pessoas com A' FROM Pessoa JOIN Reserva ON idPessoa = fkPessoa;
 
 SELECT nome, ifnull(nome, 'O campo nome está vazio') as Nome_Clientes FROM Pessoa JOIN Reserva ON idPessoa = fkPessoa;


-- Exercicio 2

CREATE DATABASE Exercicio2;
USE Exercicio2;

CREATE TABLE Pessoa1 ( 
  idPessoa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  dtNascimento DATE
);

CREATE TABLE Pessoa2 ( 
   idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(45),
   dtNascimento DATE,
   fkPessoa1 INT UNIQUE, CONSTRAINT fkPessoa1 FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa)
);

INSERT INTO Pessoa1 (nome, dtNascimento) VALUES 
('João Silva', '1990-01-15'),
('Maria Oliveira', '1985-05-23'),
('Carlos Santos', '1992-03-10'),
('Ana Lima', '1988-07-30'),
('Fernanda Costa', '1995-12-05'),
(NOT NULL, '1980-05-22');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES 
('Lucas Ferreira', '1993-02-18', 1),  
('Patrícia Almeida', '1991-04-25', 2),
('Ricardo Mendes', '1989-08-09', 3),  
('Juliana Rocha', '1994-11-14', 4),  
('Rafael Pinto', '1990-06-07', 5);    

SELECT * FROM Pessoa1 JOIN Pessoa2 on idPessoa = fkPessoa1;

SELECT Pessoa1.nome AS Nome_Pessoa1, Pessoa2.nome AS Nome_Pessoa2,
    CASE 
        WHEN Pessoa1.nome LIKE '%a' THEN 'Seu nome termina com A'
        WHEN Pessoa1.nome LIKE 'a%' THEN 'Seu nome começa com A'
		WHEN Pessoa1.nome LIKE '%s' THEN 'Seu termina com S'
    END 
AS Descricao_Nome FROM Pessoa1 JOIN Pessoa2 ON idPessoa = fkPessoa1;
  
 SELECT * FROM Pessoa1;
 
 SELECT p1.nome, IFNULL(p2.nome, 'O campo nome está vazio') 
 AS Nome_das_Pessoas 
 FROM Pessoa1 p1 
 JOIN Pessoa2 p2 ON p1.idPessoa = p2.fkPessoa1;

-- Exercicio 3

CREATE DATABASE Exercicio3;
USE Exercicio3;

CREATE TABLE Usuario (
 idUsuario INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 cpf VARCHAR(11)
);

CREATE TABLE Cnh (
  idChn INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(3),
  dataVencimento DATE,
  dataEmissao DATETIME,
  fkUsuario INT UNIQUE, CONSTRAINT fkUsuario FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);

INSERT INTO Usuario (nome, cpf) VALUES 
('Neymar Jr.', '12345678901'),
('Cristiano Ronaldo', '23456789012'),
('Lionel Messi', '34567890123'),
('Kaká', '45678901234'),
('Ronaldinho Gaúcho', '56789012345'),
('', '56789012345');

INSERT INTO Cnh (tipo, dataVencimento, dataEmissao, fkUsuario) VALUES 
('A', '2025-05-15', '2023-05-15', 1),  
('B', '2026-06-20', '2023-06-20', 2), 
('AB', '2024-07-30', '2023-07-30', 3), 
('ACC', '2027-08-10', '2023-08-10', 4), 
('B', '2025-09-25', '2023-09-25', 5);  


SELECT * FROM Usuario JOIN Cnh on idUsuario = fkUsuario;

SELECT Usuario.nome AS Nome_do_Piloto,
    CASE 
        WHEN Usuario.nome LIKE '%o' THEN 'Seu nome termina com O'
        WHEN Usuario.nome LIKE 'N%' THEN 'Seu nome começa com N'
		WHEN Usuario.nome LIKE '%i' THEN 'Seu termina com I'
        WHEN Usuario.nome LIKE '%a' THEN 'Seu termina com A'
    END 
AS Descricao_Nome FROM Usuario JOIN Cnh on idUsuario = fkUsuario;
  
 
 SELECT Usuario.nome, Cnh.dataEmissao, IFNULL(Usuario.nome, 'O campo nome está vazio') 
 AS Nome_das_Pessoas 
FROM Usuario JOIN Cnh on idUsuario = fkUsuario;



-- Exercicio 4 

CREATE DATABASE Exercicio4;
USE Exercicio4;

CREATE TABLE Endereco (
  idEndereco INT PRIMARY KEY AUTO_INCREMENT,
  rua VARCHAR(45),
  cep VARCHAR(8)
);

CREATE TABLE Farmacia (
  idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  fkEndereco INT UNIQUE, CONSTRAINT fkEndereco FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco),
  fkFarmaceutico INT, CONSTRAINT fkFarmaceutico FOREIGN KEY (fkFarmaceutico) REFERENCES Farmaceutico(idFarmaceutico)
);

CREATE TABLE Farmaceutico (
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
funcao VARCHAR(45)
);

INSERT INTO Endereco (rua, cep) VALUES 
('Avenida Brasil', '12345678'),
('Rua das Flores', '23456789'),
('Travessa do Comércio', '34567890'),
('Rua dos Pinheiros', '45678901'),
('Avenida São João', '56789012');

INSERT INTO Farmaceutico (nome, funcao) VALUES 
('Dr. João Silva', 'Farmacêutico Responsável'),
('Dra. Maria Oliveira', 'Assistente Farmacêutico'),
('Dr. Carlos Santos', 'Farmacêutico Clinico'),
('Dra. Ana Lima', 'Farmacêutica de Vigilância'),
('Dr. Pedro Costa', 'Farmacêutico de Manipulação');

INSERT INTO Farmacia (nome, fkEndereco, fkFarmaceutico) VALUES 
('Farmácia São Paulo', 1, 1), 
('Farmácia da Saúde', 2, 2), 
('Farmácia Vida Nova', 3, 3),   
('Farmácia Bem Estar', 4, 4),  
('Farmácia Esperança', 5, 5); 

 SELECT * FROM Endereco JOIN Farmacia
 ON idEndereco = fkEndereco 
 JOIN Farmaceutico
 ON idFarmaceutico = fkFarmaceutico;
 
 
SELECT Farmacia.nome AS NomedaFamacia, Endereco.rua AS NomedaRua,
    CASE 
        WHEN Farmacia.nome LIKE '%o' THEN 'O nome da sua farmacia termina com O'
        WHEN Endereco.rua LIKE 's%' THEN 'O nome da rua sua farmacia começa com S'
		WHEN Farmacia.nome LIKE '%i' THEN 'O nome da sua farmacia termina com I'
        WHEN Endereco.rua LIKE '%o' THEN 'O nome da rua sua farmacia termina com O'
		WHEN Endereco.rua LIKE '%s' THEN 'O nome da rua sua farmacia termina com S'
    END 
AS Descricao_Nome FROM Endereco JOIN Farmacia ON idEndereco = fkEndereco JOIN Farmaceutico ON idFarmaceutico = fkFarmaceutico;
  
 
SELECT f.nome AS Nome_da_Farmacia, e.rua AS Nome_da_Rua,
    IFNULL(f.nome, 'O campo nome da farmácia está vazio') AS Descricao_Farmacia,
    IFNULL(fa.nome, 'O campo nome do farmacêutico está vazio') AS Descricao_Farmaceutico
FROM Endereco e 
JOIN Farmacia f ON e.idEndereco = f.fkEndereco 
JOIN Farmaceutico fa ON f.fkFarmaceutico = fa.idFarmaceutico;


















   