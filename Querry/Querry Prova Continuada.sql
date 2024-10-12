CREATE DATABASE continuada1;

USE continuada1;

CREATE TABLE historico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataHora DATETIME DEFAULT current_timestamp,
url VARCHAR(250) NOT NULL,
navegador VARCHAR(100)
);

INSERT INTO historico (nome, url, navegador) VALUES
	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),
	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),
	('Ofertas e Promoções | Amazon.com.br', 'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),
	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),
	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),
	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),
	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),
	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),
	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');
    
    SELECT * FROM historico;

CREATE DATABASE continuada1;

USE continuada1;

CREATE TABLE historico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataHora DATETIME DEFAULT current_timestamp,
url VARCHAR(250) NOT NULL,
navegador VARCHAR(100)
);

INSERT INTO historico (nome, url, navegador) VALUES
	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),
	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),
	('Ofertas e Promoções | Amazon.com.br', 'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),
	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),
	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),
	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),
	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),
	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),
	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');
        
    SELECT nome FROM historico WHERE navegador = 'Microsoft Edge';    
    SELECT * FROM historico WHERE navegador = 'Microsoft Edge';
    SELECT * FROM historico WHERE navegador != 'Microsoft Edge ';
    
	SELECT navegador FROM historico WHERE navegador != 'Microsoft Edge';

	INSERT INTO historico (nome, url, navegador) VALUES
	('Fazer login no Canvas (instructure.com)' ,'https://awsacademy.instructure.com/login/canvas', '2023-02-16 10:36:00');
    
     SELECT * FROM Historico;
     
     SELECT * FROM Historico WHERE url LIKE '%/';
     SELECT * FROM Historico WHERE nome LIKE 'M%';

     
INSERT INTO historico (nome, url, navegador) VALUES 
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Google Chrome');
    
    SELECT * FROM Historico WHERE nome OR navegador LIKE '404 Not Found' OR 'Google Chrome';
    
		SELECT * FROM Historico WHERE id = url LIKE 'amazon';
        
        ALTER TABLE Historico modify column url varchar(500);
        
        
   SELECT id FROM historico WHERE nome = 'Página Inicial - Microsoft Azure';
   UPDATE historico SET dataHora = 2023-02-31 WHERE id = 2;

   SELECT * FROM historico WHERE nome LIKE '%Download%';
   DROP TABLE historico;

   SELECT * FROM Historico;

   SELECT * FROM historico WHERE url LIKE '%t_';
   SELECT * FROM historico WHERE url = '%t_';

-- EXCLUIR TABELA
   DROP TABLE historico;

-- LIMPAR TABELA 
   TRUNCATE TABLE historico;

SELECT * FROM Historico;
ALTER TABLE historico RENAME COLUMN nome TO titulo;


ALTER TABLE historico ADD COLUMN sistOp VARCHAR(30);

SELECT * FROM Historico;

UPDATE historico SET navegador = 'Google Chrome' WHERE id = 5;
SELECT id FROM historico WHERE nome = 'Working...';


SELECT id FROM historico WHERE nome = 'Working...';
UPDATE historico SET nome = 'Working...' WHERE id = 2;
