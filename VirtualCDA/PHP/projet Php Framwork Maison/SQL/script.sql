DROP DATABASE IF EXISTS animalerie;

CREATE DATABASE IF NOT EXISTS animalerie DEFAULT CHARACTER
SET latin1 COLLATE latin1_swedish_ci;

USE animalerie;

DROP TABLE IF EXISTS animaux;

CREATE TABLE IF NOT EXISTS alimentations (
  idAliment int (11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  libelleAliment varchar (50) NOT NULL

) ENGINE = InnoDB DEFAULT CHARSET = latin1;

DROP TABLE IF EXISTS animaux;

CREATE TABLE IF NOT EXISTS  animaux (
  idAnimal  int (11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  libelleAnimal varchar (50) NOT NULL,
  prix int (11) NOT NULL,
  dateDeNaissance date NOT NULL,
  idAliment int (11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

DROP TABLE IF EXISTS utilisateurs;

CREATE TABLE IF NOT EXISTS utilisateurs (
  idUtilisateur int(11) NOT NULL AUTO_INCREMENT,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  motDePasse varchar(50) NOT NULL,
  adresseMail varchar(50) NOT NULL,
  role int(11) NOT NULL COMMENT '2 Admin 1 User',
  pseudo varchar(50) NOT NULL,
  PRIMARY KEY (idUtilisateur)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

ALTER TABLE animaux
ADD CONSTRAINT FK_animaux_alimentations FOREIGN KEY (idAliment) REFERENCES alimentations (idAliment);

INSERT INTO
    alimentations (idAliment, LibelleAliment)
VALUES   (1, 'vegetaux'),(2, 'viandes');

INSERT INTO   animaux (idAnimal, libelleAnimal, prix, dateDeNaissance, idAliment  )
VALUES (1, 'lion', 2, '1899-11-30', 1);

INSERT INTO   Animaux (idAnimal, libelleAnimal, prix, dateDeNaissance, idAliment  )
VALUES(2, 'vache', 1, '1958-11-30', 2);

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `motDePasse`, `adresseMail`, `role`, `pseudo`) VALUES
(7, 'ad', 'ad', '11d437a3e6695447bd1bf2331651049e', 'ad', 2, 'ad'),
(8, 'u', 'u', '1d0a5a28d53430e7f2293a1f36682f23', 'u', 1, 'u');