DROP DATABASE IF EXISTS cuisine;
CREATE DATABASE cuisine DEFAULT CHARACTER SET utf8;
Use cuisine;

--
-- Table  'Table1'
--

CREATE TABLE Table1(
   idTable1 INT AUTO_INCREMENT PRIMARY KEY,
   numeroTable INT,
   nombreCouvert INT,
   type VARCHAR(50),
   supplement VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Categorie'
--

CREATE TABLE Categorie(
   idCategorie INT AUTO_INCREMENT PRIMARY KEY,
   libelleCategorie VARCHAR(50)
)ENGINE=InnoDB;

--
-- Table  'Met'
--

CREATE TABLE Met(
   idMet INT AUTO_INCREMENT PRIMARY KEY,
   nomMet VARCHAR(50),
   prixMet DECIMAL(15,2),
   IdCategorie INT NOT NULL
)ENGINE=InnoDB;

--
-- Table  'Ticket'
--

CREATE TABLE Ticket(
   idTicket INT AUTO_INCREMENT PRIMARY KEY,
   dateTicket DATE,
   nombreCouvert INT,
   addition INT,
   IdTable1 INT NOT NULL,
   IdMet INT NOT NULL
)ENGINE=InnoDB;

--
-- Table  'Client'
--

CREATE TABLE Client(
   idClient INT AUTO_INCREMENT PRIMARY KEY,
   nomClient VARCHAR(50),
   premonClient VARCHAR(50),
   dateDeNaissance DATE,
   emailClient VARCHAR(50),
   telephoneClient INT,
   IdTicket INT NOT NULL
)ENGINE=InnoDB;


ALTER TABLE Met
   ADD CONSTRAINT FK_Met_Categorie FOREIGN KEY(IdCategorie) REFERENCES Categorie(IdCategorie);
ALTER TABLE Ticket
   ADD CONSTRAINT FK_Ticket_Table1 FOREIGN KEY(IdTable1) REFERENCES Table1(IdTable1),
   ADD CONSTRAINT FK_Ticket_Met FOREIGN KEY(IdMet) REFERENCES Met(IdMet);
ALTER TABLE Client
   ADD CONSTRAINT FK_Client_Ticket FOREIGN KEY(IdTicket) REFERENCES Ticket(IdTicket);