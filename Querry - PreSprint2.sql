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













