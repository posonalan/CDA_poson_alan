DROP DATABASE IF EXISTS animaleriedao;


CREATE DATABASE animaleriedao DEFAULT CHARACTER SET utf8;
Use animaleriedao;

USE animaleriedao;

DROP TABLE IF EXISTS alimentations;

CREATE TABLE IF NOT EXISTS alimentations (
  idAliment int  AUTO_INCREMENT PRIMARY KEY ,
  libelleAliment varchar (50) NOT NULL
)ENGINE=InnoDB;

DROP TABLE IF EXISTS animaux;

CREATE TABLE IF NOT EXISTS  animaux (
  idAnimal  int  AUTO_INCREMENT PRIMARY KEY ,
  libelleAnimal varchar (50) NOT NULL,
  prix int (11) NOT NULL,
  dateDeNaissance date NOT NULL,
  idAliment int NOT NULL,
  idMilieuVie int NOT NULL
)ENGINE=InnoDB;

DROP TABLE IF EXISTS milieuvie;

CREATE TABLE IF NOT EXISTS  milieuvies (
  idMilieuVie  int AUTO_INCREMENT PRIMARY KEY ,
  libelleMilieuVie varchar (50) NOT NULL,
situationGeographique varchar (50) NOT NULL,
climat varchar (50) NOT NULL
)ENGINE=InnoDB;


DROP TABLE IF EXISTS utilisateurs;

CREATE TABLE IF NOT EXISTS utilisateurs (
  idUtilisateur int(11) AUTO_INCREMENT PRIMARY KEY ,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  motDePasse varchar(50) NOT NULL,
  adresseMail varchar(50) NOT NULL,
  role int(11) NOT NULL COMMENT '2 Admin 1 User',
  pseudo varchar(50) NOT NULL
)ENGINE=InnoDB;

ALTER TABLE animaux
ADD CONSTRAINT FK_animaux_alimentations FOREIGN KEY (idAliment) REFERENCES alimentations (idAliment),
ADD CONSTRAINT FK_animaux_milieuvies FOREIGN KEY (idMilieuVie) REFERENCES milieuvies (idMilieuVie);

INSERT INTO
    alimentations (idAliment, LibelleAliment)
VALUES   (1, 'vegetaux'),(2, 'viandes');

INSERT INTO
    milieuvies (idMilieuVie, libelleMilieuVie, situationGeographique, climat)
VALUES   (1, 'montagne',"Asie","Chaud");


INSERT INTO   animaux (idAnimal, libelleAnimal, prix, dateDeNaissance, idAliment ,idMilieuVie )
VALUES (1, 'lion', 2, '1899-11-30', 1, 1);

INSERT INTO   Animaux (idAnimal, libelleAnimal, prix, dateDeNaissance, idAliment ,idMilieuVie )
VALUES(2, 'vache', 1, '1958-11-30', 2, 1);

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `motDePasse`, `adresseMail`, `role`, `pseudo`) VALUES
(7, 'ad', 'ad', '11d437a3e6695447bd1bf2331651049e', 'ad', 2, 'ad'),
(8, 'u', 'u', '1d0a5a28d53430e7f2293a1f36682f23', 'u', 1, 'u');