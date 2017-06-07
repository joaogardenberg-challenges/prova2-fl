# Prova 2 de Estário para a Fulllab

## Informações

Versão do Ruby: 2.4.1

Versão do AngularJS: **soon...**

Feito no OS: Ubuntu 16.04.2 LTS (64-bit)

Feito com: Sublime Text 3 Build 3126

## Heroku

Heroku url: **soon...**

## MySQL

**SQL para popular a tabela:**

LOAD DATA LOCAL INFILE 'tickets.csv'
INTO TABLE tickets
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
