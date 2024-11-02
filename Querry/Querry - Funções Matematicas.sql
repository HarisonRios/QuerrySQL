-- aula 12
-- correção Revendedora

USE sprint3;

CREATE TABLE cliente (
idCliente int primary key auto_increment,
nome varchar(45),
fkIndicador int,
constraint fkIndicadorCliente foreign key (fkIndicador)
	references cliente(idCliente));
    
INSERT INTO cliente (nome, fkIndicador) VALUES
	('Memphis', null),
	('Yuri', 1),
	('Hugo', 2);
    
SELECT * FROM cliente;

CREATE TABLE venda (
idVenda int auto_increment,
fkCliente int,
primary key (idVenda, fkCliente),
dtVenda date,
totalVenda decimal(5,2),
foreign key (fkCliente) 
	references cliente(idCliente));
    
INSERT INTO venda (fkCliente, dtVenda) VALUES
	(1, '2024-10-13'),
	(2, '2024-10-23'),
	(3, '2024-02-21');
    
SELECT * FROM venda;

SELECT * FROM cliente JOIN cliente as Indicador
	ON cliente.fkIndicador = Indicador.idCliente
    JOIN venda
    ON cliente.idCliente = venda.fkCliente;
    
CREATE TABLE produto (
idProduto int primary key auto_increment,
nome varchar(45),
preco decimal(5,2)
) auto_increment = 1000;

INSERT INTO produto (nome, preco) VALUES
	('212', 500.99),
	('Malbec', 200.99),
	('Kaiak', 125.99),
	('Turma da Mônica', 20.99);
    
CREATE TABLE notaFiscal (
codNF int,
fkClienteVenda int,
fkVenda int,
fkProduto int,
primary key (codNF,fkClienteVenda, fkVenda, fkProduto),
desconto decimal(5,2),
qtdProduto int,
foreign key (fkClienteVenda)
	references venda(fkCliente),
foreign key (fkVenda)
	references venda(idVenda),
foreign key (fkProduto)
	references produto(idProduto));
    
SELECT * FROM venda;

INSERT INTO notaFiscal VALUES
	(12345, 1, 1, 1001, null, 2),
	(12345, 1, 1, 1003, null, 1),
	(23456, 2, 2, 1000, null, 1),
	(34567, 3, 3, 1002, null, 3);
    
SELECT * FROM notaFiscal;

SELECT c.nome as Cliente,
	i.nome as Indicador,
    dtVenda,
    codNF,
    qtdProduto,
    p.nome,
    preco
    FROM cliente as c LEFT JOIN cliente as i
    ON c.fkIndicador = i.idCliente
    JOIN venda as v
    ON fkCliente = c.idCliente
    JOIN notaFiscal
    ON fkClienteVenda = fkCliente and
    idVenda = fkVenda
    JOIN produto as p
    ON idProduto = fkProduto;
    
-- FUNÇÕES MATEMÁTICAS
-- distinct
SELECT distinct preco FROM produto;

INSERT INTO produto (nome, preco) VALUES
	('Perfume XPTO', 500.99);

-- count - quantidade por linha nos campos com valor
SELECT count(nome) FROM produto;
SELECT count(desconto) FROM notaFiscal;

-- sum
SELECT SUM(preco) as TotalProdutos FROM produto;

-- avg
SELECT AVG(preco) FROM produto;

-- round
SELECT round(avg(preco),2) FROM produto;

-- truncate
SELECT truncate(avg(preco), 2) FROM produto;

INSERT INTO produto (nome, preco) VALUES
	('Creme de Barbear', 1.95);

SELECT avg(preco),
	truncate(avg(preco), 2), 
		round(avg(preco),2) FROM produto;
        
SELECT avg(preco),
	truncate(avg(preco), 1), 
		round(avg(preco),1) FROM produto;
        
-- group by
SELECT codNF, avg(preco) FROM produto
JOIN notaFiscal
ON idProduto = fkProduto
GROUP BY codNF;

SELECT codNF, sum(preco) FROM produto
JOIN notaFiscal
ON idProduto = fkProduto
GROUP BY codNF;

SELECT preco * qtdProduto FROM produto
JOIN notaFiscal
ON idProduto = fkProduto;

-- limit
SELECT * FROM produto LIMIT 2;


        
