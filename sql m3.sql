/* colocar 14 dígitos no CNPJ e 11 dígitos no CPF*/

CREATE DATABASE  SolNascente;

USE solnascente;

CREATE TABLE condominio(
idCondominio TINYINT(2) PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
cnpj INT(13),
bairro VARCHAR(100),
rua VARCHAR(100),
cep INT(8),
numero INT(8)
);

CREATE TABLE condominos(
idCondominos TINYINT(2) PRIMARY KEY AUTO_INCREMENT,
idCondominio TINYINT(2) NOT NULL,
nome VARCHAR(50),
cpf INT(13),
email VARCHAR(60),
senha VARCHAR(8),
telefone_celular INT(14),
telefone_fixo INT(14),
endereco VARCHAR(100),
bloco VARCHAR(5),
apt INT(4),

CONSTRAINT fk_condominos_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio)
);

CREATE TABLE salao(
idSalao TINYINT(2) PRIMARY KEY AUTO_INCREMENT,
idCondominio TINYINT(3),
numero INT(2),

CONSTRAINT fk_sala_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio)
);

CREATE TABLE locacao_salao(
idLocacao_salao TINYINT(2) PRIMARY KEY AUTO_INCREMENT,
idCondominio TINYINT(3),
idSalao TINYINT(2),
idCondominos TINYINT(2),

CONSTRAINT fk_locacao_salao_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio),
CONSTRAINT fk_locacao_salao_salao FOREIGN KEY (idSalao) REFERENCES salao (idSalao),
CONSTRAINT fk_locacao_salao_condominos FOREIGN KEY (idCondominos) REFERENCES condominos (idCondominos)
);

CREATE TABLE funcionarios(
idFuncionarios TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
cpf INT(13),
turno CHAR(1),
funcao VARCHAR(15),
salario FLOAT(9),
endereco VARCHAR(100),
idCondominio TINYINT(3),

CONSTRAINT fk_funcionarios_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio)
);

CREATE TABLE achados_perdidos(
idAchados_perdidos TINYINT(2) PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(255),
idCondominio TINYINT(3),
idFuncionarios TINYINT(3),

CONSTRAINT fk_achados_perdidos_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio),
CONSTRAINT fk_achados_perdidos_funcionarios FOREIGN KEY (idCondominio) REFERENCES funcionarios (idFuncionarios)
);

CREATE TABLE categoria_ocorrencia(
idCategoria_ocorrencia TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
severidade VARCHAR(10)
);

CREATE TABLE ocorrencia(
idOcorrencia TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
idCategoria_ocorrencia TINYINT(4),
idCondominio TINYINT(3),
descricao VARCHAR(100),

CONSTRAINT fk_ocorrencia_categoria_ocorrencia FOREIGN KEY (idCategoria_ocorrencia) REFERENCES categoria_ocorrencia (idCategoria_ocorrencia),
CONSTRAINT fk_ocorrencia_condominio FOREIGN KEY (idCondominio) REFERENCES condominio (idCondominio)
);

INSERT INTO condominio (nome, cnpj, bairro, rua, cep, numero) VALUES
('Acácia Imperial',0000147852369, 'Esperança', 'agustin24', 12548725,38),
('Alto Boa Vista',0000321546874, 'Coliseu', 'augustin26', 12547843, 39);

INSERT INTO condominos (idCondominio, nome, cpf, email, senha, telefone_celular, telefone_fixo, endereco, bloco, apt) VALUES
(1, 'Marcelo', 00123514852, 'marcelo.albert.reis@hotmail.com', 3128, 01984835997,01984835997, 'Esperanca', 'A', 01),
(2, 'Gabriel', 00518717671, 'gabriel@hotmail.com', 2831, 01984838727,0198483217, 'Coliseu', 'A', 02);

INSERT INTO salao (idCondominio, numero) VALUES
(1,001),(1,002),(1,003);

INSERT INTO locacao_salao (idCondominio, idSalao, idCondominos) VALUES
(2,1,2),(1,2,1);

INSERT INTO funcionarios (nome, cpf, turno, funcao, salario, endereco, idCondominio) VALUES
('Celso',00012354524,'M','diretor',40000.00, 'Esperanca', 1),
('Marcos',00054787821,'V','diretor',40000.00, 'Coliseu', 2),
('Dante',00059877821,'V','diretor geral',400000.00, 'Esperanca', 1),
('Zeca',00054787351,'N','Zelador',1200.00, 'Esperanca', 1),
('Matheus',00054788791,'M','organizador',500.00, 'Coliseu', 2);

INSERT INTO achados_perdidos (descricao, idCondominio, idFuncionarios) VALUES
('Iphone X esquecido no dia 01/07/21',1,1),
('Notebook com Windows 11 esquecido no dia 02/07/21',1,2);

INSERT INTO categoria_ocorrencia (severidade) VALUES
('Baixa'),
('Media'),
('Alta');

INSERT INTO ocorrencia (idCategoria_ocorrencia, idCondominio, descricao) VALUES
(2,1, 'O morador Marcelo está incomodando pra caramba aqui, muita havy, muito som alto!'),
(2,1, 'O morador Gabriel está incomodando pra caramba aqui, ele é muito quieto, é preocupante'),
(3,1, 'O Diretor não se mexe para sanar o problema da falta de água às 14 horas da tarde..'),
(1,2, 'O Diretor ainda não cobrou os tributos do condomínio.. Estranho, como proceder?');

/*Consulta as reclamações*/
SELECT cat.severidade, descricao FROM ocorrencia oc
INNER JOIN categoria_ocorrencia cat ON cat.idCategoria_ocorrencia = oc.idCategoria_ocorrencia;

/*Consulta a quantidade total de reclamações*/
SELECT COUNT(cat.idCategoria_ocorrencia) AS Quantidade_Reclamacoes FROM ocorrencia oc
INNER JOIN categoria_ocorrencia cat ON cat.idCategoria_ocorrencia = oc.idCategoria_ocorrencia;

/*Consulta a quantidade de reclamações com severidade media*/
SELECT COUNT(cat.idCategoria_ocorrencia) AS Quantidade_Reclamacoes FROM ocorrencia oc
INNER JOIN categoria_ocorrencia cat ON cat.idCategoria_ocorrencia = oc.idCategoria_ocorrencia
WHERE cat.severidade ="Media" ;

/*Consulta a quantidade de reclamações com severidade media*/
SELECT COUNT(cat.idCategoria_ocorrencia) AS Quantidade_Reclamacoes FROM ocorrencia oc
INNER JOIN categoria_ocorrencia cat ON cat.idCategoria_ocorrencia = oc.idCategoria_ocorrencia
WHERE cat.severidade ="Baixa" ;

/*Consulta os condomínios que tem produtos perdidos*/
SELECT co.nome, ap.descricao FROM achados_perdidos ap
INNER JOIN  Condominio co ON co.idCondominio = ap.idAchados_perdidos;

/*Consulta as locações em determinados condomínios*/
SELECT co.nome AS Nome_Condominio, sa.numero AS numero_salao, conds.nome AS Nome_condomino FROM locacao_salao ls
INNER JOIN condominio co ON co.idCondominio = ls.idCondominio
INNER JOIN salao sa ON sa.idSalao = ls.idSalao
INNER JOIN condominos conds ON conds.idCondominos = ls.idCondominos;

/*Consulta maior salário dos funcionários */
SELECT  MAX(salario) AS maior_salario, nome from funcionarios;

/*Consulta menor salário dos funcionários */
SELECT  MIN(salario) AS menor_salario, nome from funcionarios;

/*Consulta a quantidade de condominos independendo de seus condominios*/
SELECT COUNT(idCondominos) AS Quantidade_Condominos FROM condominos;

/*Consulta a tabela condominio*/
SELECT idCondominio AS identificador, nome, cnpj, bairro, rua, numero,cep FROM condominio;

/*UPDATE com WHERE*/
UPDATE funcionarios SET salario = 1000000 WHERE idFuncionarios = 1;
UPDATE locacao_salao SET idCondominio=1 WHERE idLocacao_salao = 2;
UPDATE ocorrencia SET idCategoria_ocorrencia = 3 WHERE idOcorrencia = 1;
UPDATE funcionarios SET salario = 500 WHERE idFuncionarios = 3;
UPDATE achados_perdidos SET descricao = "Não lembro" WHERE idAchados_perdidos = 2;

/*DELETE com WHERE*/
DELETE FROM funcionarios WHERE idFuncionarios = 3;
DELETE FROM achados_perdidos WHERE idAchados_perdidos = 1;
DELETE FROM locacao_salao WHERE idLocacao_salao = 2;
DELETE FROM ocorrencia WHERE idOcorrencia = 1;
DELETE FROM achados_perdidos WHERE idAchados_perdidos = 2;





