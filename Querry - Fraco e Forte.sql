CREATE DATABASE aula8;
USE aula8;

/* TIPOS DE ATRIBUTOS 

-- Identificador - PK (Chave Primaria)
-- Simples ou Composto
-- Bairro: Simples
-- Endereço Completo: Composto (Divido em partes difentes)

INSERT INTO Pessoa VALUES (
   ('defaut', 'Aluno' 'Rua Haddock Lobo, 595, 4º Andar, 01414-905, São Paulo')
   
   Endereço = cep, numero, complemento, bairro, nome da rua, cidade, estado, pais;
   Email = username e dominio 
   Telefone = DDI, DDD, prefixo e sufixo
   
   -- Monovalorado ou multivalorado 
   SIMPLES = MONOVALORADO - 1 VALOR (A MESMA COISA)
   
     INSERT INTO Pessoa VALUES 
     ('default', 'Aluno', '11-3435343', '11-425352325')
     SELECT * FROM Pessoa WHERE Telefone LIKE '',
     
     -- Telefone Fixo e Telefone Celular 
     
     
     -- Derivado 
     - Idade é um atrbuto dereviado da data de nascimento 
     
*/

   CREATE TABLE Funcionario (
   idFunc INT PRIMARY KEY AUTO_INCREMENT, -- Identificador
   nome VARCHAR(45), -- SIMPLES
   emailPessoal VARCHAR(45), -- emailPessoal + emailInsitucional = Multivalorado 
   emailInstitucional VARCHAR(45),
   fkSuper INT, CONSTRAINT fkSupervisorFunc 
   FOREIGN KEY (fkSuper) REFERENCES funcionario(idFunc)
   );
   
   INSERT INTO Funcionario (nome, emailPessoal, fkSuper) VALUES 
   ('Fernando', 'fernanado@gmail.com', '1'),
   ('Vivian', 'vivian@gmail.com', '1');
   
   SELECT * FROM Funcionario;

   -- Todo funcionario que tem supervisor pode ser supervisionado por ele mesmo 
   ALTER TABLE Funcionario MODIFY COLUMN fkSuper INT NOT NULL;
   
   SELECT func.nome AS Funcionario, 
   superv.nome AS Supervisor
   FROM Funcionario AS Func
   JOIN Funcionario AS superv
   ON func.fkSuper = superv.idFunc;
   
   
   -- Entidade fraca = dependente de outra tabela para existir, pk composta
   
   CREATE TABLE Depedente (
     idDep INT,
     fkFunc INT, CONSTRAINT pkComposta PRIMARY KEY (idDep, fkFunc),
     -- pode criar um check (idDep <= 2)
     nome VARCHAR(45),
     parentesco VARCHAR(45),
     dtNasc date,
     cep CHAR(9), -- CEP + numEnd + Complemento = COMPOSTO
     numEnd VARCHAR(5),
     complemento VARCHAR(45),
     FOREIGN KEY (fkFunc) REFERENCES funcionario(idFunc)
     );
     
     INSERT INTO Depedente VALUES 
     (1,1,'Fernanda','Esposa','1983-12-30','01414-095','595','11º Anadar'),
     (2,1,'Fernandinho','Filho','2005-01-01','01414-095','595','11º Anadar'),
	 (1,2,'Cintia','Namorada','1988-10-23','01414-095','595','12º Anadar');
	
    SELECT * FROM Depedente;
    
    SELECT func.nome AS Funcionario,
    superv.nome AS Supervisor,
    dep.nome AS Depedente
    FROM Funcionario AS func
    JOIN Funcionario AS superv
    ON func.fkSuper = superv.idFunc
    JOIN depedente as dep 
    ON func.idFunc = dep.fkFunc;
    
    
    
    INSERT INTO funcionario (nome, fkSuper) VALUES
    ('Fernando B', 1);
    
    
    SELECT * FROM Funcionario JOIN depedente ON idFunc = fkFunc;
    SELECT * FROM Funcionario LEFT JOIN depedente ON idFunc = fkFunc;
	SELECT * FROM Funcionario RIGHT JOIN depedente ON idFunc = fkFunc;

    SELECT * FROM depedente RIGHT JOIN funcionario ON idFunc = fkFunc;
    
    
    
    
