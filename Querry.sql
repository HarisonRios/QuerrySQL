CREATE DATABASE Exercicios;
USE Exercicios;

CREATE TABLE Funcionario (
 idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45),
 cargo VARCHAR(45),
 fkSupervisor INT,
 fkArea INT,
 CONSTRAINT fkSupervisor FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFuncionario),
 CONSTRAINT fkArea FOREIGN KEY (fkArea) REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Funcionario (nome, cargo, fkSupervisor, fkArea) VALUES
('Alice Silva', 'Gerente', NULL, 1),
('Bruno Santos', 'Analista', 1, 1),
('Carlos Oliveira', 'Desenvolvedor', 2, 1),
('Daniela Costa', 'Assistente', 2, 1),
('Eva Lima', 'Gerente de Projetos', NULL, 2);

SELECT * FROM Funcionario;

-- SELECT funcionario.nome AS Nome_Funcionario, 
-- mae.nome AS Mãe,
-- pai.nome AS Pai
-- FROM Pessoa AS Filho
-- JOIN Pessoa as Mae 
-- ON filho.fkMae = mae.idPessoa
-- JOIN Pessoa AS Pai
-- ON filho.fkPai = pai.idPessoa;








