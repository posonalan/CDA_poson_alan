
DROP DATABASE IF EXISTS Noel;
CREATE DATABASE Noel DEFAULT CHARACTER SET utf8;
Use Noel;

--
-- Table  'Enfant'
--

CREATE TABLE Enfant(
   idEnfant INT AUTO_INCREMENT PRIMARY KEY,
   matriculeEnfant INT,
   nomEnfant VARCHAR(50),
   prenomEnfant VARCHAR(50),
   adresseEnfant VARCHAR(50),
   sexeEnfant VARCHAR(50),
   sagesse DECIMAL(25,0)
)ENGINE=InnoDB;

--
-- Table  'Lutin'
--

CREATE TABLE Lutin(
   idLutin INT AUTO_INCREMENT PRIMARY KEY,
   matriculeLutin INT,
   nomLutin VARCHAR(50),
   prenomLutin VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Voeux'
--

CREATE TABLE Voeux(
   idVoeux INT AUTO_INCREMENT PRIMARY KEY,
   libelleVoeux VARCHAR(50),
   descriptionVoeux VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Traineau'
--

CREATE TABLE Traineau(
   idTraineau INT AUTO_INCREMENT PRIMARY KEY,
   matriculeTraineau INT,
   tailleTraineau INT,
   dateMiseEnService DATE,
   dateDerniereRevision DATE
)ENGINE=InnoDB;

--
-- Table  'Renne'
--

CREATE TABLE Renne(
   idRenne INT AUTO_INCREMENT PRIMARY KEY,
   nomRenne VARCHAR(50),
   sexeRenne VARCHAR(50),
   dateDeNaissanceRenne DATE,
   idTraineau INT NOT NULL
)ENGINE=InnoDB;

--
-- Table  'Cadeau'
--

CREATE TABLE Cadeau(
   idCadeau INT AUTO_INCREMENT PRIMARY KEY,
   matriculeCadeau INT,
   designationCadeau VARCHAR(50),
   idLutin INT NOT NULL,
   idEnfant INT NOT NULL
)ENGINE=InnoDB;

--
-- Table  'Tourne'
--

CREATE TABLE Tourne(
   idTourne INT AUTO_INCREMENT PRIMARY KEY,
   matriculeTourne INT,
   heureDepartTourne TIME,
   idLutin INT NOT NULL,
   idTraineau INT NOT NULL
)ENGINE=InnoDB;

--
-- Table  'souhait'
--

CREATE TABLE Souhait(
   idSouhait INT AUTO_INCREMENT PRIMARY KEY,
   idEnfant INT,
   idVoeux INT
)ENGINE=InnoDB;

--
-- Table  'livraison'
--

CREATE TABLE Livraison(
    idLivraison INT AUTO_INCREMENT PRIMARY KEY,
   idCadeau INT,
   idTourne INT,
   dateLivraison DATE
)ENGINE=InnoDB;

--
-- Table  'distribution'
--

CREATE TABLE Distribution (
    idDistribution INT AUTO_INCREMENT PRIMARY KEY,
   idTourne INT, 
   idRenne INT
)ENGINE=InnoDB;

--
-- Table  'GestionTraineau'
--

CREATE TABLE GestionTraineau(
idGestionTraineau INT AUTO_INCREMENT PRIMARY KEY,
   idLutin INT,
   idTraineau INT,
   historiqueResponssabilite VARCHAR(50)
)ENGINE=InnoDB;

ALTER TABLE Renne 
   ADD CONSTRAINT FK_Renne_Traineau FOREIGN KEY(idTraineau) REFERENCES Traineau(idTraineau);
ALTER TABLE Cadeau 
   ADD CONSTRAINT FK_Cadeau_Lutin FOREIGN KEY(idLutin) REFERENCES Lutin(idLutin),
   ADD CONSTRAINT FK_Cadeau_Enfant FOREIGN KEY(idEnfant) REFERENCES Enfant(idEnfant);
ALTER TABLE Tourne 
   ADD CONSTRAINT FK_Tourne_Lutin  FOREIGN KEY(idLutin) REFERENCES Lutin(idLutin),
   ADD CONSTRAINT FK_Tourne_Traineau FOREIGN KEY(idTraineau) REFERENCES Traineau(idTraineau);
ALTER TABLE Souhait
   ADD CONSTRAINT FK_Souhait_Enfant FOREIGN KEY(idEnfant) REFERENCES Enfant(idEnfant),
   ADD CONSTRAINT FK_Souhait_Voeux FOREIGN KEY(idVoeux) REFERENCES Voeux(idVoeux);
 ALTER TABLE Livraison
   ADD CONSTRAINT FK_Livraison_Cadeau FOREIGN KEY(idCadeau) REFERENCES Cadeau(idCadeau),
   ADD CONSTRAINT FK_Livraison_Tourne FOREIGN KEY(idTourne) REFERENCES Tourne(idTourne);
ALTER TABLE Distribution
   ADD CONSTRAINT FK_Distribution_Tourne FOREIGN KEY(idTourne) REFERENCES Tourne(idTourne),
   ADD CONSTRAINT FK_Distribution_Renne FOREIGN KEY(idRenne) REFERENCES Renne(idRenne);
ALTER TABLE GestionTraineau
   ADD CONSTRAINT FK_GestionTraineau_Lutin FOREIGN KEY(idLutin) REFERENCES Lutin(idLutin),
   ADD CONSTRAINT FK_GestionTraineau_Traineau FOREIGN KEY(idTraineau) REFERENCES Traineau(idTraineau);