DROP DATABASE IF EXISTS Nom_Base;
CREATE DATABASE Nom_BaseDEFAULT CHARACTER SET utf8;
Use Nom_Base;
--
-- Table  'Categorie'
--

DROP TABLE IF EXISTS 'Categorie';
CREATE TABLE Categorie(
   IdCategorie COUNTER,
   libelleCategorie VARCHAR(50),
   PRIMARY KEY(IdCategorie)
);
ALTER TABLE Categorie ENGINE=InnoDB;



DROP TABLE IF EXISTS 'Table1';
CREATE TABLE Table1(
   IdTable1 COUNTER,
   numeroTable INT,
   nombreCouvert INT,
   idTypeTable INT NOT NULL
   
);
ALTER TABLE Table1 ENGINE=InnoDB;

--
-- Table  'Ticket'
--

DROP TABLE IF EXISTS 'Ticket';
CREATE TABLE Ticket(
   IdTicket COUNTER,
   dateTicket DATE,
   nombreCouvert INT,
   addition INT,
   IdTable1 INT NOT NULL,
   PRIMARY KEY(IdTicket),
   FOREIGN KEY(IdTable1) REFERENCES Table1(IdTable1)
);
ALTER TABLE Ticket ENGINE=InnoDB;

--
-- Table  'Met'
--

DROP TABLE IF EXISTS 'Met';
CREATE TABLE Met(
   IdMet COUNTER,
   nomMet VARCHAR(50),
   prixMet DECIMAL(15,2),
   IdCategorie INT NOT NULL,
   PRIMARY KEY(IdMet),
   FOREIGN KEY(IdCategorie) REFERENCES Categorie(IdCategorie)
);
ALTER TABLE Met ENGINE=InnoDB;

--
-- Table  'Client'
--

DROP TABLE IF EXISTS 'Client';
CREATE TABLE Client(
   IdClient COUNTER,
   nomClient VARCHAR(50),
   premonClient VARCHAR(50),
   dateDeNaissance DATE,
   emailClient VARCHAR(50),
   telephoneClient INT,
   IdTicket INT NOT NULL,
   PRIMARY KEY(IdClient),
   FOREIGN KEY(IdTicket) REFERENCES Ticket(IdTicket)
);
ALTER TABLE Client ENGINE=InnoDB;

--
-- Table  'compose'
--

DROP TABLE IF EXISTS 'compose';
CREATE TABLE compose(
   IdTicket INT,
   IdMet INT,
   PRIMARY KEY(IdTicket, IdMet),
   FOREIGN KEY(IdTicket) REFERENCES Ticket(IdTicket),
   FOREIGN KEY(IdMet) REFERENCES Met(IdMet)
);
ALTER TABLE compose ENGINE=InnoDB;
