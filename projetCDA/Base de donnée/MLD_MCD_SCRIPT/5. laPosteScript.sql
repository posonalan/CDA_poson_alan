

DROP DATABASE IF EXISTS LaPoste;
CREATE DATABASE LaPoste DEFAULT CARACTER SET utf8;
Use LaPoste; 

--
-- table Courrier
--

CREATE TABLE courrier(
   idcourrier INT AUTO_INCREMENT PRIMARY KEY,
   rueDestinataire VARCHAR(50),
   numeroDestinataire INT,
   rueEmetteur VARCHAR(50),
   numeroEmetteur INT
)ENGINE=InnoDB;

-- 
-- table Bureau Postal
-- 

CREATE TABLE bureauPostal(
   idBureauPostal INT AUTO_INCREMENT PRIMARY KEY,
   codePostalBureauPostal INT
)ENGINE=InnoDB;

--
-- table Centre De Tri
--

CREATE TABLE centreDeTri(
   idCentreDeTri INT AUTO_INCREMENT PRIMARY KEY,
   nomCentreDeTri VARCHAR(50)
)ENGINE=InnoDB;

--
-- table transporteur
--

CREATE TABLE transporteur(
   idTransporteur INT AUTO_INCREMENT PRIMARY KEY,
   libelleTransporteur VARCHAR(50),
   taxeCarbone INT
)ENGINE=InnoDB;

--
-- table Type
--

CREATE TABLE type(
   idType INT AUTO_INCREMENT PRIMARY KEY,
   libelleType VARCHAR(50),
)ENGINE=InnoDB;

--
-- table achemine
-- 

CREATE TABLE achemine(
   idAchemine INT AUTO_INCREMENT PRIMARY KEY,
   idBureauPostal INT ,
   idCentreDeTrie INT ,
   idTransporteur INT ,
)ENGINE=InnoDB;



CREATE TABLE gere(
   idGere INT AUTO_INCREMENT PRIMARY KEY,
   idBureauPostal VARCHAR(50),
   dateEnvoi DATE,
   dateReception VARCHAR(50), 
)ENGINE=InnoDB;




CREATE TABLE definit(
   idDefinite INT AUTO_INCREMENT PRIMARY KEY,
   idType VARCHAR(50),
  
)ENGINE=InnoDB;

ALTER TABLE achemine 

ADD CONSTRAINT FK_achemine_bureauPostal 
   FOREIGN KEY(idBureauPostal) REFERENCES bureauPostal(idBureauPostal),
   ADD CONSTRAINT FK_achemine_centreDeTri
   FOREIGN KEY(idCentreDeTrie) REFERENCES centreDeTri(idCentreDeTrie),
   ADD CONSTRAINT FK_achemine_transporteur
   FOREIGN KEY(idTransporteur) REFERENCES transporteur(idTransporteur); 

ALTER TABLE gere
ADD CONSTRAINT FK_gere_courrier
   FOREIGN KEY (idGere) REFERENCES courrier(idGere),
   ADD CONSTRAINT FK_gere_bureauPostal
   FOREIGN KEY(idBureauPostal) REFERENCES bureauPostal(idBureauPostal);

ALTER TABLE definit
ADD CONSTRAINT FK_definit_courrier
   FOREIGN KEY(idDefinit) REFERENCES courrier(idDefinit),
   ADD CONSTRAINT FK_definit_type 
   FOREIGN KEY(idType) REFERENCES type(idType);