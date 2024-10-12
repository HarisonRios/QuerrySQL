-- COMENTARIO É FEITO COM --
-- COMANDOS PRECISAM DE ; NO FINAL

-- CRIAR UMA BANCO DE DADOS
CREATE DATABASE adsa;

-- SELECIONAR BANCO 
USE adsa;

-- CRIAR TABELA
CREATE TABLE aluno (
  ra char(8) primary key,
  nome varchar(50),
  email varchar(30)  
);

-- DESCREVER OS CAMPOS DA TABELA
DESCRIBE aluno;
DESC aluno;

-- INSERIR DADOS
INSERT INTO aluno VALUES
   ('01234567', 'Hari', 'hari@sptech.school');
   
   
-- EXBIR OS DADOS
 SELECT ra, nome, email FROM aluno;
 SELECT ra FROM aluno;
 SELECT * FROM aluno;
 
 -- EXBIR APENAS O ALUNO QUE DESEJA
 SELECT nome FROM aluno
    WHERE nome = 'João';
    
-- EXBIR NOME QUE COMEÇA COM ALGUMA LETRA
 SELECT nome FROM aluno
  WHERE nome LIKE 'J%';
  
-- EXBIR O ALUNO QUE TERMINA COM N
  SELECT nome FROM aluno
   WHERE nome LIKE '%O';
   
-- EXBIR O ALUNO QUE A SEGUNDA LETRA É ""
   SELECT nome from aluno
      WHERE nome LIKE '_o%';
      
-- EXBIR O NOME QUE TEM A
   SELECT nome from aluno
     WHERE nome LIKE '%a%';
   
-- NOME QUE É DIFERENTE DE "João"
  SELECT nome FROM aluno
    WHERE nome != 'João';
  
-- EXBIR OS ALUNOS EM ORDEM ALFABETICA 
   SELECT nome FROM aluno
     ORDER BY nome;

-- EXBIR OS ALUNOS EM ORDEM DESCRECENTE 
   SELECT nome FROM aluno
     ORDER BY nome desc;




 
 -- INSERINDO OS OUTROS ALUNOS
 INSERT INTO aluno VALUES
   ('02345671', 'João', 'joao@sptech.school'),
   ('02345672', 'Edu', 'edu@sptech.school'),
   ('02345673', 'Gustavo', 'gustavo@sptech.school'),
   ('02345674', 'Dourado', 'dourado@sptech.school');
   