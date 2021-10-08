DROP DATABASE IF EXISTS Usine;
CREATE DATABASE Usine DEFAULT CHARACTER SET utf8;
Use Usine;
--
-- Table  'categorie'
--

CREATE TABLE categorie(
   idCategorie INT AUTO_INCREMENT PRIMARY KEY,
   nomCategorie VARCHAR(50),
   descriptionCategorie VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'modele'
--

CREATE TABLE modele(
   idModele INT AUTO_INCREMENT PRIMARY KEY,
   codeModele INT,
   nomModele VARCHAR(50),
   dateMiseSurMarche DATE
)ENGINE=InnoDB;

--
-- Table  'faute'
--

CREATE TABLE faute(
   idFaute INT AUTO_INCREMENT PRIMARY KEY,
   codeUniqueFaute INT,
   titreFaute VARCHAR(50),
   dateDetection DATE,
   commentaire VARCHAR(50),
   dateReparation DATE,
   idCategorie VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

--
-- Table  'produit'
--

CREATE TABLE produit(
   idProduit INT AUTO_INCREMENT PRIMARY KEY,
   numeroDeSerie INT,
   numeroDeProduit INT,
   anneeProduction DATE,
   idModele VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

--
-- Table  'maintenence'
--

CREATE TABLE maintenence(
   idMaintenence INT AUTO_INCREMENT PRIMARY KEY, 
   idFaute VARCHAR(50),
   idProduit VARCHAR(50)
)ENGINE=InnoDB;


ALTER TABLE faute 
   ADD CONSTRAINT FK_faute_categorie FOREIGN KEY(idCategorie) REFERENCES categorie(idCategorie);
ALTER TABLE produit 
   ADD CONSTRAINT FK_produit_modele FOREIGN KEY(idModele) REFERENCES modele(idModele);
ALTER TABLE detient 
   ADD CONSTRAINT FK_maintenence_faute FOREIGN KEY(idFaute) REFERENCES faute(idFaute),
   ADD CONSTRAINT FK_maintenence_produit FOREIGN KEY(idProduit) REFERENCES produit(idProduit);

