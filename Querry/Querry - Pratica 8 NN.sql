CREATE DATABASE Venda;
USE Venda;

CREATE TABLE Cliente (
 idCliente INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 email VARCHAR(45),
 endereco VARCHAR(45),
 fkIndicador INT, CONSTRAINT fkIndicador foreign key (fkIndicador)
references Cliente(idCliente)
);

CREATE TABLE Produto (
 idProduto INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 descricao VARCHAR(45),
 preco VARCHAR(45)
);

CREATE TABLE Venda (
 idVenda INT AUTO_INCREMENT,
 fkCliente INT,
 fkProduto INT,
 constraint pkcomposta primary key (idVenda, fkCliente, fkProduto), 
 totalVendas VARCHAR(45),
 dataVendas DATE,
 quantidade VARCHAR(45),
 valorDesconto DECIMAL,
 CONSTRAINT fkCliente foreign key (fkCliente)
 references Cliente(idCliente),
 CONSTRAINT fkProduto foreign key (fkProduto)
 references Produto(idProduto)
);

INSERT INTO Cliente (nome, email, endereco, fkIndicador) VALUES
('João Silva', 'joao@example.com', 'Rua A, 123', NULL),
('Maria Oliveira', 'maria@example.com', 'Rua B, 456', 1),
('Carlos Santos', 'carlos@example.com', 'Rua C, 789', 2),
('Ana Costa', 'ana@example.com', 'Rua D, 321', 1),
('Lucas Pereira', 'lucas@example.com', 'Rua E, 654', NULL),
('Fernanda Lima', 'fernanda@example.com', 'Rua F, 987', 3),
('Gabriel Almeida', 'gabriel@example.com', 'Rua G, 159', 2),
('Juliana Rocha', 'juliana@example.com', 'Rua H, 753', 1),
('Renato Ferreira', 'renato@example.com', 'Rua I, 246', 3),
('Paula Martins', 'paula@example.com', 'Rua J, 135', 4);

INSERT INTO Produto (nome, descricao, preco) VALUES
('Avon - Batom Ultra Color', 'Batom cremoso com alta cobertura', '25.00'),
('Avon - Máscara de Cílios SuperShock', 'Máscara para cílios com efeito volumoso', '35.00'),
('Avon - Hidratante Corporal Naturals', 'Hidratante corporal com fragrância suave', '30.00'),
('Natura - Perfume Essencial', 'Perfume floral e sofisticado', '120.00'),
('Natura - Creme Hidratante Todo Dia', 'Creme hidratante para o corpo', '45.00'),
('Natura - Sabonete Líquido', 'Sabonete líquido com ingredientes naturais', '25.00'),
('Hinode - Perfume Masculino Elysium', 'Perfume masculino com notas amadeiradas', '150.00'),
('Hinode - Kit de Maquiagem', 'Kit com diversos produtos de maquiagem', '200.00'),
('Hinode - Creme Anti-Idade', 'Creme facial com ação anti-idade', '100.00'),
('Avon - Loção Hidratante para as Mãos', 'Loção para hidratação intensiva das mãos', '20.00');

INSERT INTO Venda (fkCliente, fkProduto, totalVendas, dataVendas, quantidade, valorDesconto) VALUES
(1, 1, '2000', '2024-10-01', '10', 5),
(2, 2, '7000', '2024-10-02', '20', 10),
(3, 3, '1500', '2024-10-03', '15', 5),
(4, 4, '5000', '2024-10-04', '8', 0),
(5, 5, '900', '2024-10-05', '5', 15),
(6, 6, '3500', '2024-10-06', '3', 20),
(7, 7, '4000', '2024-10-07', '1', 10),
(8, 8, '6000', '2024-10-08', '4', 25),
(9, 9, '3000', '2024-10-09', '2', 0),
(10, 10, '8500', '2024-10-10', '6', 30),
(1, 4, '1000', '2024-10-11', '3', 0),
(2, 5, '2500', '2024-10-12', '1', 10),
(3, 6, '1200', '2024-10-13', '4', 15),
(4, 7, '4000', '2024-10-14', '2', 5),
(5, 8, '5000', '2024-10-15', '8', 10),
(6, 9, '2000', '2024-10-16', '2', 5),
(7, 10, '1500', '2024-10-17', '1', 10),
(8, 1, '3000', '2024-10-18', '3', 15),
(9, 2, '2500', '2024-10-19', '2', 0),
(10, 3, '1200', '2024-10-20', '4', 20);


SELECT * FROM Cliente;
SELECT * FROM Produto;
SELECT * FROM Venda;


SELECT * FROM Cliente
       JOIN Venda ON 
       Cliente.idCliente = Venda.fkCliente;


SELECT * FROM Cliente
       JOIN Venda ON
       Cliente.idCliente = Venda.fkCliente 
       WHERE idCliente = 5;
       
SELECT 
    c1.idCliente AS ClienteID,
    c1.nome AS NomeCliente,
    c1.email AS EmailCliente,
    c1.endereco AS EnderecoCliente,
    c2.idCliente AS IndicadorID,
    c2.nome AS NomeIndicador
FROM 
    Cliente AS c1
LEFT JOIN 
    Cliente AS c2 ON c1.fkIndicador = c2.idCliente;
    
    
SELECT 
    c1.idCliente AS ClienteID,
    c1.nome AS NomeCliente,
    c1.email AS EmailCliente,
    c1.endereco AS EnderecoCliente,
    c2.idCliente AS IndicadorID,
    c2.nome AS NomeIndicador
FROM 
    Cliente AS c1
LEFT JOIN 
    Cliente AS c2 ON c1.fkIndicador = c2.idCliente WHERE c2.nome LIKE 'Ana Costa';
    

SELECT * FROM 
    Cliente AS c1
LEFT JOIN 
    Cliente AS c2 ON c1.fkIndicador = c2.idCliente
LEFT JOIN 
    Venda AS v ON v.fkCliente = c1.idCliente
LEFT JOIN 
    Produto AS p ON p.idProduto = v.fkProduto;
    
select v.datavendas as datavendas,
p.nome as nomeproduto,
v.quantidade as quantidade from Venda as v
 join Produto AS p ON p.idProduto = v.fkProduto;
 
  


       
    
    

    
    
       
       

