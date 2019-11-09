CREATE DATABASE evaluation;
USE evaluation;
 
 CREATE TABLE Client(
 cli_num INT PRIMARY KEY,
 cli_nom VARCHAR(50),
 CLI_adresse VARCHAR (50),
 cli_tel VARCHAR (50));
 
 CREATE  TABLE Produit(
 pro_num INT PRIMARY KEY,
 pro_libelle VARCHAR(50),
 pro_description VARCHAR(50));
 
CREATE TABLE Commande(
 com_num INT PRIMARY KEY,
 cli_num INT ,
 com_date DATETIME,
 com_obs VARCHAR(50),
 FOREIGN KEY(cli_num) REFERENCES Client(cli_num));


 CREATE TABLE est_compose( 
 com_num INT,
 pro_num INT,
 est_qte INT,
 FOREIGN KEY(com_num) REFERENCES Produit(pro_num),
 FOREIGN KEY(pro_num) REFERENCES Commande(com_num),
 PRIMARY KEY(com_num,pro_num));