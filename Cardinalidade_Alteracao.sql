/*CARDINALIDADE*/

/*QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGÓCIO*/

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE
0 - NÃO OBRIGATÓRIO
1 - OBRIGATÓRIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;


/*REGRAS DE NEGÓCIO

ENDERECO -> (OBRIGATORIO, CADASTRO SOMENTE 1)

TELEFONE ->(NÃO OBRIGATORIO, CADASTRO DE VARIOS)

 */

CREATE TABLE CLIENTE(
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(100) NOT NULL,
SEXO ENUM('M', 'F') NOT NULL,
EMAIL VARCHAR(50) UNIQUE,
CPF VARCHAR(20) UNIQUE
);

CREATE TABLE ENDERECO(
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
RUA VARCHAR(50) NOT NULL,
BAIRRO VARCHAR(50) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
ESTADO CHAR(2) NOT NULL,
ID_CLIENTE INT UNIQUE, /*UNIQUE SIGNIFICA 1 pra 1 */
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
TIPO ENUM('RES', 'COMER', 'CEL') NOT NULL,
NUMERO VARCHAR(10) NOT NULL,
ID_CLIENTE INT,
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL, 'MARCELLO', 'M', 'CELLOLIM4JPA@GMAIL.COM', '13592473786');
INSERT INTO CLIENTE VALUES(NULL, 'MARIA', 'F', 'MARIAJPA@GMAIL.COM', '6263232363');
INSERT INTO CLIENTE VALUES(NULL, 'CARLA', 'F', '@GMAIL.COM', '65213131313');
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAOLIMA@GMAIL.COM', '85161816');
INSERT INTO CLIENTE VALUES(NULL, 'BIANCA', 'F', 'BIANCA@GMAIL.COM', '8618618616');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', NULL, NULL);
INSERT INTO CLIENTE VALUES(NULL, 'PEPET', 'M', NULL, '13592473786');


/*INSERINDO ENDERECOS*/
+-----------+----------+------+------------------------+-------------+
| IDCLIENTE | NOME     | SEXO | EMAIL                  | CPF         |
+-----------+----------+------+------------------------+-------------+
|         1 | MARCELLO | M    | CELLOLIM4JPA@GMAIL.COM | 13592473786 |
|         2 | MARIA    | F    | MARIAJPA@GMAIL.COM     | 6263232363  |
|         4 | JOAO     | M    | JOAOLIMA@GMAIL.COM     | 85161816    |
|         5 | BIANCA   | F    | BIANCA@GMAIL.COM       | 8618618616  |
|         6 | CARLOS   | M    | NULL                   | NULL        |
+-----------+----------+------+------------------------+-------------+
INSERT INTO ENDERECO VALUES(NULL, 'ESTRADA DO CATONHO', 'SULACAP', 'RIO DE JANEIRO', 'RJ', 1);
INSERT INTO ENDERECO VALUES(NULL, 'ESTRADA DO CAFUNDÁ', 'TAQUARA', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ARIPERANA', 'TAQUARA', 'RIO DE JANEIRO', 'RJ', 6);
INSERT INTO ENDERECO VALUES(NULL, 'PRAIA POSTO 9 ', 'BARRA DA TIJUCA', 'RIO DE JANEIRO', 'RJ', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA COPACABANA', 'COPACABANA', 'RIO DE JANEIRO', 'RJ', 4);
INSERT INTO ENDERECO VALUES(NULL, 'ALVORADA', 'BARRA DA TIJUCA', 'RIO DE JANEIRO', 'RJ', 5);
/*INSERINDO TELEFONES*/
+------------+---------------------------+------+-----+---------+----------------+
| Field      | Type                      | Null | Key | Default | Extra          |
+------------+---------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                   | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COMER','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)               | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                   | YES  | MUL | NULL    |                |
+------------+---------------------------+------+-----+---------+----------------+
INSERT INTO telefone VALUES(NULL, 'CEL', '967733180', 1);
INSERT INTO telefone VALUES(NULL, 'RES', '981044056', 1);
INSERT INTO telefone VALUES(NULL, 'RES', '24564858', 2);
INSERT INTO telefone VALUES(NULL, 'CEL', '99999999', 5);
INSERT INTO telefone VALUES(NULL, 'COMER', '21044056', 1);
INSERT INTO telefone VALUES(NULL, 'CEL', '22222222', 3);
INSERT INTO telefone VALUES(NULL, 'RES', '33333333', 4);
INSERT INTO telefone VALUES(NULL, 'CEL', '967755515', 6);


/*UTILIZANDO O INNER JOIN*/
SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'm' or sexo='f';

SELECT NOME,SEXO,EMAIL,TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
WHERE IDCLIENTE = ID_CLIENTE;

SELECT NOME,SEXO,BAIRRO,CIDADE,TIPO,NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO, TELEFONE
ON IDCLIENTE = ID_CLIENTE;

/* JUNTANDO 3 TABELAS*/
SELECT NOME,SEXO,BAIRRO,CIDADE,TIPO,NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

/*APELIDANDO TABELAS(PONTEIRAMENTO)*/
SELECT C.NOME,C.SEXO,E.BAIRRO,E.CIDADE,T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

/*DDL - DATA DEFINITION LANGUAGE*/
CREATE TABLE PRODUTO(
IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
NOME_PRODUTO VARCHAR(30) NOT NULL,
PRECO INT,
FRETE FLOAT(10,2) NOT NULL 
);
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| PRECO        | int(11)     | YES  |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/*ALTER TABLE */
/* ALTERANDO O NOME DE UMA COLUNA - CHANGE*/

ALTER TABLE PRODUTO
CHANGE PRECO PRECO_UNITARIO INT NOT NULL;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO*/

ALTER TABLE PRODUTO
MODIFY PRECO_UNITARIO INT(50);
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(50)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS*/
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(50)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*APAGANDO UMA COLUNA*/
ALTER TABLE PRODUTO
DROP COLUMN PESO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(50)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*ADICIONANDO UMA COLUNA NA ORDEM ESPECÍFICA */
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL 
AFTER NOME_PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(50)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/*POSIÇÃO 1*/
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PRECO_UNITARIO | int(50)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+



