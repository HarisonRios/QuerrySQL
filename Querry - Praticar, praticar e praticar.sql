CREATE DATABASE PraticarPraticar;
USE PraticarPraticar;

CREATE TABLE Dono (
 idDono INT PRIMARY KEY AUTO_INCREMENT, 
 nome VARCHAR(45)
);

CREATE TABLE Pet (
  idPet INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  idDono INT,
  idMaePet INT,
  CONSTRAINT fk_dono FOREIGN KEY (idDono) REFERENCES Dono(idDono),
  CONSTRAINT fk_maePet FOREIGN KEY (idMaePet) REFERENCES Pet(idPet)
);

INSERT INTO Dono (nome) VALUES 
('João'), 
('Maria'), 
('Pedro');

INSERT INTO Pet (nome, idDono, idMaePet) VALUES 
('Rex', 1, NULL), 
('Bela', 2, 1), 
('Max', 3, 2);

SELECT 
  Dono.nome AS NomeDono, 
  Pet.nome AS NomePet, 
  Mae.nome AS NomeMaePet
FROM 
  Pet
JOIN 
  Dono ON Pet.idDono = Dono.idDono
LEFT JOIN 
  Pet AS Mae ON Pet.idMaePet = Mae.idPet;


CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY,
    nome VARCHAR(45)
);


CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY,
    nome VARCHAR(45),
    idEmpresa INT,
    idSupervisor INT,
    CONSTRAINT fk_empresa FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa),
    CONSTRAINT fk_supervisor FOREIGN KEY (idSupervisor) REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Empresa (idEmpresa, nome) VALUES 
(1, 'TechCorp'), (2, 'InnovateX');

INSERT INTO Funcionario (idFuncionario, nome, idEmpresa, idSupervisor) VALUES 
(1, 'Carlos', 1, NULL), 
(2, 'Ana', 1, 1), 
(3, 'João', 2, NULL);


SELECT 
  Funcionario.nome AS NomeFuncionario, 
  Empresa.nome AS NomeEmpresa, 
  Supervisor.nome AS NomeSupervisor
FROM 
  Funcionario
JOIN 
  Empresa ON Funcionario.idEmpresa = Empresa.idEmpresa
LEFT JOIN 
  Funcionario AS Supervisor ON Funcionario.idSupervisor = Supervisor.idFuncionario;



CREATE TABLE Pessoa (
    idPessoa INT PRIMARY KEY,
    nome VARCHAR(45),
    idSombra INT,
    CONSTRAINT fk_sombra FOREIGN KEY (idSombra) REFERENCES Pessoa(idPessoa)
);


CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    logradouro VARCHAR(45),
    numero VARCHAR(45),
    cidade VARCHAR(45),
    idPessoa INT,
    CONSTRAINT fk_pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO Pessoa (idPessoa, nome, idSombra) VALUES 
(1, 'Alice', 1), 
(2, 'Bob', 1);

INSERT INTO Endereco (idEndereco, logradouro, numero, cidade, idPessoa) 
VALUES (1, 'Rua A', '123', 'São Paulo', 1), 
       (2, 'Rua B', '456', 'Rio de Janeiro', 2);


SELECT 
  Pessoa.nome AS NomePessoa, 
  Endereco.logradouro AS Logradouro, 
  Endereco.numero AS Numero, 
  Endereco.cidade AS Cidade
FROM 
  Pessoa
JOIN 
  Endereco ON Pessoa.idPessoa = Endereco.idPessoa;






-- DESAFIO 2

CREATE TABLE veiculo (
    id INT PRIMARY KEY,
    placa VARCHAR(45),
    modelo VARCHAR(45),
    cor VARCHAR(45),
    ano INT,
    motorista_id INT,
    FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

CREATE TABLE motorista (
    id INT PRIMARY KEY,
    nome VARCHAR(45),
    fone VARCHAR(45)
);

CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(45),
    fone VARCHAR(45),
    endereco VARCHAR(45)
);

CREATE TABLE viagem (
    id INT PRIMARY KEY,
    data DATE,
    time TIME,
    valor FLOAT,
    origem VARCHAR(45),
    destino VARCHAR(45),
    cliente_id INT,
    motorista_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

INSERT INTO motorista (id, nome, fone)
VALUES
    (1, 'João Silva', '(11) 98765-4321'),
    (2, 'Maria Santos', '(21) 12345-6789');

INSERT INTO cliente (id, nome, fone, endereco)
VALUES
    (1, 'Pedro Almeida', '(11) 55555-5555', 'Rua A, 123'),
    (2, 'Ana Oliveira', '(21) 44444-4444', 'Rua B, 456');

INSERT INTO veiculo (id, placa, modelo, cor, ano, motorista_id)
VALUES
    (1, 'ABC-1234', 'Gol', 'Prata', 2020, 1),
    (2, 'DEF-5678', 'Corolla', 'Branco', 2022, 2);

INSERT INTO viagem (id, data, time, valor, origem, destino, cliente_id, motorista_id)
VALUES
    (1, '2023-11-20', '10:00:00', 50.00, 'São Paulo', 'Rio de Janeiro', 1, 1),
    (2, '2023-11-21', '15:30:00', 80.00, 'Belo Horizonte', 'Brasília', 2, 2);
    
SELECT v.id, c.nome AS cliente, m.nome AS motorista, v.origem, v.destino
FROM viagem v
JOIN cliente c ON v.cliente_id = c.id
JOIN motorista m ON v.motorista_id = m.id;

-- Essa é so praticar

CREATE DATABASE essapraticar;
USE essapraticar;

CREATE TABLE cliente (
    Codigo INT(10) PRIMARY KEY,
    Nome VARCHAR(45),
    Endereco VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    UF VARCHAR(2),
    Telefone VARCHAR(45)
);

CREATE TABLE titulo (
    Codigo INT(10) PRIMARY KEY,
    Nome VARCHAR(45),
    Tipo VARCHAR(45),
    Locado BIT(1)
);

CREATE TABLE locacoes (
    Codigo INT(10) PRIMARY KEY,
    CodigoCliente INT(10),
    CodigoTitulo INT(10),
    DataSaida DATETIME,
    DataRetorno DATETIME,
    FOREIGN KEY (CodigoCliente) REFERENCES cliente(Codigo),
    FOREIGN KEY (CodigoTitulo) REFERENCES titulo(Codigo)
);

INSERT INTO cliente (Codigo, Nome, Telefone)
VALUES
    (1, 'João da Silva', '(11) 98765-4321'),
    (2, 'Maria Santos', '(21) 12345-6789');

INSERT INTO titulo (Codigo, Nome, Tipo, Locado)
VALUES
    (1, 'O Senhor dos Anéis', 'Livro', 0),
    (2, 'O Poderoso Chefão', 'Filme', 1);

INSERT INTO locacoes (Codigo, CodigoCliente, CodigoTitulo, DataSaida, DataRetorno)
VALUES
    (1, 1, 1, '2023-11-20', '2023-11-27');
    
    
    SELECT l.Codigo, c.Nome AS Cliente, t.Nome AS Titulo, l.DataSaida
FROM locacoes l
JOIN cliente c ON l.CodigoCliente = c.Codigo
JOIN titulo t ON l.CodigoTitulo = t.Codigo;


-- FATLOU O RELACIONAMENTO N-N
    
    

