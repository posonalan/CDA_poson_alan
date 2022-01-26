DROP DATABASE IF EXISTS AgenceVoyage;
CREATE DATABASE  AgenceVoyage DEFAULT CHARACTER SET utf8;
Use AgenceVoyage;
--
-- Table  'Client'
--

CREATE TABLE Client(
   idClient INT AUTO_INCREMENT PRIMARY KEY,
   nomClient VARCHAR(50),
   prenomClient VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Logement'
--

CREATE TABLE Logement(
   idLogement INT AUTO_INCREMENT PRIMARY KEY,
   typeDeLogement VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Prestation'
--

CREATE TABLE Prestation(
   idPrestation INT AUTO_INCREMENT PRIMARY KEY,
   intitule VARCHAR(50),
   description VARCHAR(50),
   lieu VARCHAR(50),
   niveauPrestation INT,
   prixPublic DECIMAL(15,2),
   photo VARCHAR(50),
   idLogement INT NOT NULL
) ENGINE=InnoDB;

--
-- Table  'Catalogue'
--

CREATE TABLE Catalogue(
   idCatalogue INT AUTO_INCREMENT PRIMARY KEY,
   idPrestation INT NOT NULL
) ENGINE=InnoDB;

--
-- Table  'Facture'
--

CREATE TABLE Facture(
    idFacture INT AUTO_INCREMENT PRIMARY KEY,
   idPrestation INT,
   idClient INT,
   prixPaye DECIMAL(15,2)
)ENGINE=InnoDB;


ALTER TABLE Prestation
    ADD CONSTRAINT FK_Presentation_Logement FOREIGN KEY(idLogement) REFERENCES Logement(idLogement);
ALTER TABLE Catalogue
  ADD CONSTRAINT FK_Catalogue_Prestation FOREIGN KEY(idPrestation) REFERENCES Prestation(idPrestation);
ALTER TABLE Facture
    ADD CONSTRAINT FK_Facture_Prestation FOREIGN KEY(idPrestation) REFERENCES Prestation(idPrestation),
    ADD CONSTRAINT FK_Facture_Client  FOREIGN KEY(idClient) REFERENCES Client(idClient);