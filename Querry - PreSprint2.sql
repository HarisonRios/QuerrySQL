
-- Exercício 1

CREATE DATABASE PetShop;
USE PetShop;

CREATE TABLE Cliente (
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  telefoneFixo VARCHAR(15),
  telefoneCelular VARCHAR(15),
  endereco VARCHAR(100)
);

CREATE TABLE Pet (
  idPet INT PRIMARY KEY AUTO_INCREMENT,
  tipo_animal VARCHAR(50),
  nome VARCHAR(100),
  raca VARCHAR(50),
  dataNascimento DATE,
  fkCliente INT, FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente)
);

INSERT INTO Cliente (nome, telefoneFixo, telefoneCelular, endereco)
VALUES 
('Ana Silva', '1122334455', '11999887766', 'Rua das Flores, 123'),
('Carlos Silva', '1133445566', '11988776655', 'Rua das Acácias, 456'),
('Beatriz Santos', '1144556677', '11977665544', 'Avenida Paulista, 789');

INSERT INTO Pet (tipo_animal, nome, raca, dataNascimento, fkCliente)
VALUES
('Cachorro', 'Rex', 'Labrador', '2020-01-15', 1),
('Gato', 'Mimi', 'Persa', '2019-06-10', 2),
('Cachorro', 'Bolt', 'Bulldog', '2021-05-22', 1),
('Pássaro', 'Lola', 'Calopsita', '2020-12-18', 3);


SELECT * FROM Cliente;
SELECT * FROM Pet;

ALTER TABLE Cliente MODIFY COLUMN Nome VARCHAR(100);
DESCRIBE Cliente;

SELECT * FROM Pet WHERE tipo_Animal = 'Cachorro'; 

SELECT nome, dataNascimento FROM Pet;

SELECT * FROM Pet ORDER BY nome;

SELECT * FROM Cliente ORDER BY endereco DESC;

SELECT * FROM Pet WHERE nome LIKE 'Rex';

SELECT * FROM Cliente WHERE nome LIKE '%Silva';

UPDATE Cliente SET telefoneCelular = '1140028922' WHERE idCliente = 2;

SELECT * FROM Cliente;

SELECT Pet.nome AS Pet, Cliente.nome AS Dono
FROM Pet
JOIN Cliente ON Pet.fkCliente = Cliente.idCliente;

SELECT Pet.nome AS Pet, Cliente.nome AS Dono
FROM Pet
JOIN Cliente ON Pet.fkCliente = Cliente.idCliente WHERE idCliente = 2;

DELETE FROM Pet WHERE idPet = 3;

SELECT * FROM Pet;

DROP TABLE Pet;
DROP TABLE Cliente;



-- Exercício 2

CREATE DATABASE FamiliaGastos;
USE FamiliaGastos;

CREATE TABLE Pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    dtNasc DATE,
    profissao VARCHAR(100)
);

CREATE TABLE Gasto (
    idGasto INT AUTO_INCREMENT PRIMARY KEY,
    dataGasto DATE,
    valor DECIMAL(10, 2),
    descricao VARCHAR(255),
    idPessoa INT, FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO Pessoa (nome, dtNasc, profissao)
VALUES 
('João Silva', '1985-06-15', 'Engenheiro'),
('Maria Oliveira', '1990-03-10', 'Médica'),
('Pedro Santos', '2000-12-25', 'Estudante'),
('Ana Santos', '1995-08-30', 'Professora');

INSERT INTO Gasto (dataGasto, valor, descricao, idPessoa)
VALUES
('2024-01-10', 200.50, 'Compra de livros', 1),
('2024-02-15', 150.00, 'Pagamento de academia', 2),
('2024-03-20', 300.75, 'Compra de roupa', 3),
('2024-04-05', 100.00, 'Cinema', 4),
('2024-04-10', 50.00, 'Almoço', 1);

SELECT * FROM Pessoa;

SELECT * FROM Gasto;

SELECT * FROM Pessoa WHERE nome LIKE '%Silva';
SELECT * FROM Gasto WHERE valor > 100.00;

SELECT Pessoa.nome, Gasto.descricao, Gasto.valor, Gasto.dataGasto
FROM Pessoa
JOIN Gasto ON Pessoa.idPessoa = Gasto.idPessoa;

SELECT Pessoa.nome, Gasto.descricao, Gasto.valor, Gasto.dataGasto
FROM Pessoa
JOIN Gasto ON Pessoa.idPessoa = Gasto.idPessoa WHERE pessoa.nome = 'João Silva';

UPDATE Gasto SET valor = 120.00 WHERE idGasto = 4;

SELECT * FROM Gasto WHERE idGasto = 4;

DELETE FROM Gasto WHERE idGasto = 3;

SELECT * FROM Gasto;


-- Exercício 3

CREATE DATABASE Treinador;
USE Treinador;

CREATE TABLE Treinador (
    idTreinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    idTreinadorOrientador INT,FOREIGN KEY (idTreinadorOrientador) REFERENCES Treinador(idTreinador)
);

CREATE TABLE Nadador (
    idNadador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    estado VARCHAR(50),
    dtNasc DATE,
    idTreinador INT, FOREIGN KEY (idTreinador) REFERENCES Treinador(idTreinador)
);


INSERT INTO Treinador (nome, telefone, email, idTreinadorOrientador) VALUES 
('Carlos Mendes', '99999-1111', 'carlos.mendes@exemplo.com', NULL), 
('João Silva', '99999-2222', 'joao.silva@exemplo.com', NULL),
('Marcos Lima', '99999-3333', 'marcos.lima@exemplo.com', 1), 
('Lucas Souza', '99999-4444', 'lucas.souza@exemplo.com', 2); 

INSERT INTO Nadador (nome, estado, dtNasc, idTreinador) VALUES 
('Pedro Santos', 'SP', '2001-05-10', 1),  
('Maria Oliveira', 'RJ', '1998-07-25', 2), 
('Ana Pereira', 'MG', '2003-09-12', 1); 


SELECT * FROM Treinador;
SELECT * FROM Nadador;

SELECT Treinador.nome AS Treinador, Nadador.nome AS Nadador, Nadador.estado, Nadador.dtNasc
FROM Treinador
JOIN Nadador ON Treinador.idTreinador = Nadador.idTreinador;


SELECT Treinador.nome AS Treinador, Nadador.nome AS Nadador, Nadador.estado, Nadador.dtNasc
FROM Treinador
JOIN Nadador ON Treinador.idTreinador = Nadador.idTreinador
WHERE Treinador.nome = 'Carlos Mendes';


SELECT T1.nome AS Treinador, T2.nome AS Orientador
FROM Treinador T1
LEFT JOIN Treinador T2 ON T1.idTreinadorOrientador = T2.idTreinador;

SELECT T1.nome AS Treinador, T2.nome AS Orientador
FROM Treinador T1
LEFT JOIN Treinador T2 ON T1.idTreinadorOrientador = T2.idTreinador
WHERE T2.nome = 'Carlos Mendes';


SELECT T1.nome AS Treinador, T2.nome AS Orientador, Nadador.nome AS Nadador
FROM Treinador T1
LEFT JOIN Treinador T2 ON T1.idTreinadorOrientador = T2.idTreinador
JOIN Nadador ON T1.idTreinador = Nadador.idTreinador;


SELECT T1.nome AS Treinador, T2.nome AS Orientador, Nadador.nome AS Nadador
FROM Treinador T1
LEFT JOIN Treinador T2 ON T1.idTreinadorOrientador = T2.idTreinador
JOIN Nadador ON T1.idTreinador = Nadador.idTreinador
WHERE T1.nome = 'João Silva';
































 





-- Exercício 4
 
CREATE DATABASE Locadora;
USE Locadora;

CREATE TABLE Cliente (
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  rua VARCHAR(45),
  complemento VARCHAR(45),
  bairro VARCHAR(45),
  cidade VARCHAR(45),
  uf CHAR(2),
  telefone VARCHAR(45),
  email VARCHAR(45)
);

CREATE TABLE Produto (
  idProduto INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(45),
  anoLancamento CHAR(4),
  tipo VARCHAR(45),
  genero VARCHAR(45),
  plataforma VARCHAR(45),
  preco VARCHAR(45),
  condicao VARCHAR(45)
);

ALTER TABLE Produto ADD CONSTRAINT chk_tipo CHECK (tipo IN("Jogo","Filme"));

ALTER TABLE Produto ADD CONSTRAINT chk_condicao CHECK (condicao IN("Original","Premium","Usado","Recondicionado"));

CREATE TABLE Aluguel (
  idAluguel INT AUTO_INCREMENT,
  idCliente INT,
  idProduto INT,
  dataRetirada DATE,
  dataDevolucao DATE,
  PRIMARY KEY (idAluguel, idCliente, idProduto),
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

INSERT INTO Cliente (nome, rua, complemento, bairro, cidade, uf, telefone, email) VALUES
('João Silva', 'Rua A', 'Apt 101', 'Centro', 'São Paulo', 'SP', '1111-1111', 'joao@email.com'),
('Maria Souza', 'Rua B', 'Casa', 'Jardim', 'Rio de Janeiro', 'RJ', '2222-2222', 'maria@email.com'),
('Carlos Pereira', 'Rua C', 'Apt 202', 'Bela Vista', 'Belo Horizonte', 'MG', '3333-3333', 'carlos@email.com'),
('Ana Costa', 'Rua D', 'Apt 303', 'Pinheiros', 'São Paulo', 'SP', '4444-4444', 'ana@email.com'),
('Lucas Lima', 'Rua E', 'Casa', 'Lagoa', 'Brasília', 'DF', '5555-5555', 'lucas@email.com'),
('Fernanda Oliveira', 'Rua F', 'Apt 404', 'Vila Nova', 'Curitiba', 'PR', '6666-6666', 'fernanda@email.com'),
('Pedro Santos', 'Rua G', 'Casa', 'Santa Teresa', 'Salvador', 'BA', '7777-7777', 'pedro@email.com');

INSERT INTO Produto (titulo, anoLancamento, tipo, genero, plataforma, preco, condicao) VALUES
('The Last of Us Part II', '2020', 'Jogo', 'Ação/Aventura', 'PS4', 'R$ 250,00', 'Original'),
('Avengers: Endgame', '2019', 'Filme', 'Ação/Sci-Fi', 'Blu-ray', 'R$ 70,00', 'Usado'),
('God of War', '2018', 'Jogo', 'Ação/Aventura', 'PS4', 'R$ 200,00', 'Premium'),
('Inception', '2010', 'Filme', 'Ficção Científica', 'DVD', 'R$ 30,00', 'Recondicionado'),
('FIFA 21', '2020', 'Jogo', 'Esportes', 'Xbox One', 'R$ 150,00', 'Original'),
('Parasite', '2019', 'Filme', 'Drama', 'Digital', 'R$ 25,00', 'Usado'),
('Spider-Man: Miles Morales', '2020', 'Jogo', 'Ação/Aventura', 'PS5', 'R$ 300,00', 'Premium');

INSERT INTO Aluguel (idCliente, idProduto, dataRetirada, dataDevolucao) VALUES
(1, 1, '2023-10-01', '2023-10-10'),
(2, 2, '2023-10-02', '2023-10-12'),
(3, 3, '2023-10-03', '2023-10-13'),
(4, 4, '2023-10-04', '2023-10-14'),
(5, 5, '2023-10-05', '2023-10-15'),
(6, 6, '2023-10-06', '2023-10-16'),
(7, 7, '2023-10-07', '2023-10-17');

SELECT cliente.nome AS Nome, 
	produto.titulo AS NomeProduto
	FROM Cliente AS cliente
	JOIN Produto AS produto
ON cliente.idCliente = produto.idProduto;

UPDATE Aluguel SET dataDevolucao = NULL WHERE idCliente = 2;
UPDATE Aluguel SET dataDevolucao = NULL WHERE idCliente = 1;

SELECT * FROM Aluguel;

SELECT c.nome AS Nome,
       p.titulo AS Jogos,
       p.preco AS Preco 
FROM Cliente AS c
JOIN Aluguel AS a ON c.idCliente = a.idCliente
JOIN Produto AS p ON a.idProduto = p.idProduto
WHERE p.preco > 'R$ 15,00' AND p.tipo = 'Jogo';


SELECT c.nome AS Nome,
       a.dataDevolucao AS DataDevolução
FROM Cliente AS c
JOIN Aluguel AS a ON c.idCliente = a.idCliente
WHERE a.dataDevolucao = NULL; SELECT c.nome AS Nome,
       a.dataDevolucao AS DataDevolução
FROM Cliente AS c
JOIN Aluguel AS a ON c.idCliente = a.idCliente
WHERE a.dataDevolucao IS NULL; 

SELECT c.nome AS Nome,
       p.titulo AS Titulo,
       CASE 
           WHEN a.dataDevolucao IS NULL THEN 'Em Aberto'
           ELSE 'Concluído'
       END AS Situacao
FROM Cliente AS c
JOIN Aluguel AS a ON c.idCliente = a.idCliente
JOIN Produto AS p ON a.idProduto = p.idProduto;

-- 8
-- 9

ALTER TABLE produto RENAME COLUMN condicaoProduto TO condicao;

SELECT cliente.nome AS Nome, 
	produto.titulo AS NomeProduto
	FROM Cliente AS cliente
	JOIN Produto AS produto
ON cliente.idCliente = produto.idProduto;


SELECT c.nome AS Nome,
       p.titulo AS Jogos
FROM Cliente AS c
JOIN Aluguel AS a ON c.idCliente = a.idCliente
JOIN Produto AS p ON a.idProduto = p.idProduto
WHERE c.nome LIKE 'm%' OR p.titulo LIKE 'm%';

SELECT c.nome AS Nome, 
	p.titulo AS NomeProduto
	FROM Cliente AS c
	JOIN Produto AS p
ON c.idCliente = p.idProduto ORDER BY c.nome;

SELECT c.nome AS Nome, 
	p.titulo AS NomeProduto
	FROM Cliente AS c
	JOIN Produto AS p
ON c.idCliente = p.idProduto LIMIT 3;

-- ESSE LIMITE SERVE PARA DELIMITAR A QUANTIDADE DE "CLIENTES" QUE DESEJA

SELECT c.nome AS NomeCliente, 
       p.titulo AS NomeProduto
FROM Cliente AS c
LEFT JOIN Aluguel AS a ON c.idCliente = a.idCliente
LEFT JOIN Produto AS P ON a.idProduto = p.idProduto;

ALTER TABLE Alugel DROP FOREIGN KEY idProduto;
ALTER TABLE Alugel DROP FOREIGN KEY idCliente;













