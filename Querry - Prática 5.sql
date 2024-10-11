CREATE DATABASE Pratica05;
USE Pratica05;

CREATE TABLE Cliente (
 idCliente INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 telefone VARCHAR(45),
 endereco VARCHAR(45)
);

CREATE TABLE Pet (
 idPet INT PRIMARY KEY AUTO_INCREMENT,
 especie VARCHAR(45),
 raca VARCHAR(45),
 idade VARCHAR(45),
 idCliente INT, CONSTRAINT idCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

ALTER TABLE Pet AUTO_INCREMENT = 101;

INSERT INTO Cliente (nome, telefone, endereco) 
VALUES 
('João Silva', '99999-1111', 'Rua A, 123'),
('Maria Silva', '99999-2222', 'Rua B, 456'),
('Carlos Souza', '99999-3333', 'Rua C, 789');

INSERT INTO Pet (especie, raca, idade, idCliente) 
VALUES 
('Cachorro', 'Labrador', '5', 1),
('Gato', 'Siamês', '3', 1),
('Cachorro', 'Poodle', '2', 2),
('Cachorro', 'Bulldog', '4', 3);

INSERT INTO Pet (especie, raca, idade, idCliente) 
VALUES 
('Gato', 'Persa', '2', 2),
('Cachorro', 'Beagle', '3', 3),
('Pássaro', 'Canário', '1', 1),
('Cachorro', 'Golden Retriever', '6', 2),
('Hamster', 'Sírio', '1', 3);


SELECT * FROM Cliente;
SELECT * FROM Pet;


ALTER TABLE Cliente MODIFY nome VARCHAR(50);

SELECT * FROM Pet WHERE especie LIKE 'Cachorro';

SELECT especie, idade fROM Pet;

SELECT especie FROM Pet ORDER BY especie;

SELECT * FROM Cliente ORDER BY endereco DESC;

SELECT * FROM Pet WHERE especie LIKE "c%";

SELECT * FROM Cliente WHERE nome LIKE '%Silva';

UPDATE Cliente SET telefone = '4002-8922' WHERE idCliente = 1;

SELECT * FROM Cliente;

SELECT Pet.especie, Pet.raca, Pet.idade, Cliente.nome AS dono_nome, Cliente.telefone
FROM Pet
JOIN Cliente ON Pet.idCliente = Cliente.idCliente;

SELECT Pet.especie, Pet.raca, Pet.idade, Cliente.nome AS dono_nome, Cliente.telefone
FROM Pet
JOIN Cliente ON Pet.idCliente = Cliente.idCliente
WHERE Cliente.nome = 'Maria Silva'; 

DELETE FROM Pet WHERE idPet = 1;  

SELECT * FROM Pet;

DROP TABLE Pet;
DROP TABLE Cliente;





-- exercicio 2

CREATE TABLE Pessoa (
    idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    dataNascimento DATE,
    profissao VARCHAR(100)
);

CREATE TABLE Gasto (
    idGasto INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    valor DECIMAL(10, 2),
    descricao VARCHAR(255),
    idPessoa INT,
    CONSTRAINT fk_pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);


INSERT INTO Pessoa (nome, dataNascimento, profissao) 
VALUES 
('João Silva', '1980-05-15', 'Engenheiro'),
('Maria Santos', '1990-03-22', 'Professora'),
('Carlos Oliveira', '1975-08-30', 'Advogado');


INSERT INTO Gasto (data, valor, descricao, idPessoa) 
VALUES 
('2024-10-01', 150.00, 'Compra de roupas', 1),
('2024-10-03', 75.50, 'Supermercado', 2),
('2024-10-05', 200.00, 'Pagamento de conta de luz', 1),
('2024-10-07', 300.00, 'Consultoria jurídica', 3);

SELECT * FROM Pessoa;
SELECT * FROM Gasto;

SELECT * FROM Pessoa WHERE profissao = 'Professora';
SELECT * FROM Gasto WHERE valor > 100;

SELECT Pessoa.nome, Gasto.data, Gasto.valor, Gasto.descricao 
FROM Pessoa 
JOIN Gasto ON Pessoa.idPessoa = Gasto.idPessoa;

SELECT Pessoa.nome, Gasto.data, Gasto.valor, Gasto.descricao 
FROM Pessoa 
JOIN Gasto ON Pessoa.idPessoa = Gasto.idPessoa 
WHERE Pessoa.nome = 'João Silva';

UPDATE Pessoa SET profissao = 'Diretora' WHERE nome = 'Maria Santos';

UPDATE Gasto SET valor = 250.00 WHERE idGasto = 1;

DELETE FROM Pessoa WHERE idPessoa = 3;

DELETE FROM Gasto WHERE idGasto = 2;



-- EXERCICIO 3

CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;
SHOW TABLES;

CREATE TABLE Setor (
    idSetor INT PRIMARY KEY,
    nome VARCHAR(45),
    andar VARCHAR(45)
);

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY,
    nome VARCHAR(45),
    telefone VARCHAR(45),
    dtNasc DATE,
    salario INT,
    idSetor INT,
    FOREIGN KEY (idSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE Acompanhante (
    idAcompanhante INT PRIMARY KEY,
    nome VARCHAR(45),
    relacao VARCHAR(45),
    dtNasc DATE,
    idFuncionario INT,
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Setor (idSetor, nome, andar)
VALUES
    (3, 'Neurologia', '3'),
    (4, 'Ortopedia', '2');

INSERT INTO Funcionario (idFuncionario, nome, telefone, dtNasc, salario, idSetor)
VALUES
    (3, 'Ana Oliveira', '(21) 9876-5432', '1990-11-25', 4500, 3),
    (4, 'Pedro Santos', '(11) 1234-5678', '1975-08-10', 6500, 4);


INSERT INTO Acompanhante (idAcompanhante, nome, relacao, dtNasc, idFuncionario) VALUES 
(1, 'João Silva', 'Amigo', '1990-05-15', 1),
(2, 'Maria Oliveira', 'Esposa', '1988-08-22', 2),
(3, 'Carlos Santos', 'Irmão', '1992-03-10', 1),
(4, 'Ana Costa', 'Filha', '2010-11-05', 3);


SELECT * FROM Acompanhante;
SELECT * FROM Funcionario;
SELECT * FROM Setor;

SELECT Setor.nome AS setor_nome, Funcionario.nome AS funcionario_nome
FROM Setor
JOIN Funcionario ON Setor.idSetor = Funcionario.idSetor;

SELECT Funcionario.nome AS funcionario_nome
FROM Setor
JOIN Funcionario ON Setor.idSetor = Funcionario.idSetor
WHERE Setor.nome = 'Neurologia';  

SELECT Funcionario.nome AS funcionario_nome, Acompanhante.nome AS acompanhante_nome
FROM Funcionario
LEFT JOIN Acompanhante ON Funcionario.idFuncionario = Acompanhante.idFuncionario;

SELECT Funcionario.nome AS funcionario_nome, Acompanhante.nome AS acompanhante_nome
FROM Funcionario
LEFT JOIN Acompanhante ON Funcionario.idFuncionario = Acompanhante.idFuncionario
WHERE Funcionario.nome = 'Ana Oliveira';  


SELECT Funcionario.nome AS funcionario_nome, Setor.nome AS setor_nome, Acompanhante.nome AS acompanhante_nome
FROM Funcionario
JOIN Setor ON Funcionario.idSetor = Setor.idSetor
LEFT JOIN Acompanhante ON Funcionario.idFuncionario = Acompanhante.idFuncionario;


-- EXERCICIO 4 - Não TERMINEI

CREATE TABLE Consulta (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT,
    crmMedico INT,
    idPaciente INT,
    dataHora DATETIME,
    FOREIGN KEY (crmMedico) REFERENCES Medico(crm),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
);


CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    telefone VARCHAR(45)
);

CREATE TABLE Medico (
    crm INT PRIMARY KEY,
    nome VARCHAR(45),
    especialidade VARCHAR(45)
);

