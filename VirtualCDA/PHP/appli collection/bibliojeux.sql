DROP DATABASE IF EXISTS BiblioJeux;
CREATE DATABASE  BiblioJeux DEFAULT CHARACTER SET utf8;
Use BiblioJeux;

--
-- Table  'Utilisateur'
--

CREATE TABLE Utilisateurs(
   idUtilisateur INT AUTO_INCREMENT PRIMARY KEY,
   pseudoUtilisateur VARCHAR(50),
   motDePasseUtilisateur VARCHAR(50),
   emailUtilisateur VARCHAR(50),
   role VARCHAR(50)
)ENGINE=InnoDB;

CREATE TABLE Marques(
   idMarque INT AUTO_INCREMENT PRIMARY KEY,
   libelleMarque VARCHAR(50)
)ENGINE=InnoDB;

CREATE TABLE Jeux(
   idJeu INT AUTO_INCREMENT PRIMARY KEY,
   libelleJeu VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Accessoires(
   idAccessoire INT AUTO_INCREMENT PRIMARY KEY,
   libelleAccessoire VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Consoles(
   idConsole INT AUTO_INCREMENT PRIMARY KEY,
   libelleConsole VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE ConsolesJeux(
   idConsoleJeu INT AUTO_INCREMENT PRIMARY KEY,
   idJeu INT,
   idConsole INT
)ENGINE=InnoDB;

CREATE TABLE ConsolesAccessoires(
   idConsoleAccessoire INT AUTO_INCREMENT PRIMARY KEY,
   idAccessoire INT,
   idConsole INT
)ENGINE=InnoDB;

CREATE TABLE Profiles(
   idProfile INT AUTO_INCREMENT PRIMARY KEY,
   idUtilisateur INT,
   idJeu INT,
   idAccessoire INT,
   idConsole INT
)ENGINE=InnoDB;

--
-- Table  'photoCollection'
--

DROP TABLE IF EXISTS PhotoCollections;
CREATE TABLE PhotoCollections(
   IdPhotoCollection INT AUTO_INCREMENT PRIMARY KEY,
   libellePhoto VARCHAR(50),
   commentairePhoto TEXT,
   idUtilisateur INT NOT NULL
  
)ENGINE=InnoDB;





ALTER TABLE Jeux
    ADD CONSTRAINT FK_Jeu_Marque FOREIGN KEY(idMarque) REFERENCES Marques(idMarque);
ALTER TABLE Consoles
    ADD CONSTRAINT FK_Console_Marque FOREIGN KEY(idMarque) REFERENCES Marques(idMarque);
ALTER TABLE Accessoires
    ADD CONSTRAINT FK_Accessoire_Marque FOREIGN KEY(idMarque) REFERENCES Marques(idMarque);
ALTER TABLE ConsolesJeux
    ADD CONSTRAINT FK_ConsoleJeu_Jeu FOREIGN KEY(idJeu) REFERENCES Jeux(idJeu),
    ADD CONSTRAINT FK_ConsoleJeu_Console FOREIGN KEY(idConsole) REFERENCES Consoles(idConsole);
ALTER TABLE ConsolesAccessoirex
    ADD CONSTRAINT FK_ConsoleAccessoire_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoires(idAccessoire),
    ADD CONSTRAINT FK_ConsoleAccessoire_Console FOREIGN KEY(idConsole) REFERENCES Consoles(idConsole);
ALTER TABLE Profiles
    ADD CONSTRAINT FK_Profile_Utilisateur FOREIGN KEY(idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    ADD CONSTRAINT FK_Profile_Jeu FOREIGN KEY(idJeu) REFERENCES Jeux(idJeu),
    ADD CONSTRAINT FK_Profile_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoires(idAccessoire),
    ADD CONSTRAINT FK_Profile_Console FOREIGN KEY(idConsole) REFERENCES Consoles(idConsole);
ALTER TABLE PhotoCollections 
    ADD CONSTRAINT FK_PhotoCollection_Utilisateurs  FOREIGN KEY(idUtilisateur) REFERENCES Utilisateurs(idUtilisateur);

