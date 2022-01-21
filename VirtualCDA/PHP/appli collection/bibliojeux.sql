DROP DATABASE IF EXISTS BiblioJeux;
CREATE DATABASE  BiblioJeux DEFAULT CHARACTER SET utf8;
Use BiblioJeux;

--
-- Table  'Utilisateur'a
--

CREATE TABLE Utilisateurs(
   idUtilisateur INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50),
  prenom VARCHAR(50),
    adresseMail VARCHAR(50),
   motDePasse VARCHAR(50),
  role INT 
   
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

ALTER TABLE ConsolesAccessoires
    ADD CONSTRAINT FK_ConsoleAccessoire_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoires(idAccessoire),
    ADD CONSTRAINT FK_ConsoleAccessoire_Console FOREIGN KEY(idConsole) REFERENCES Consoles(idConsole);

ALTER TABLE Profiles
    ADD CONSTRAINT FK_Profile_Utilisateur FOREIGN KEY(idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    ADD CONSTRAINT FK_Profile_Jeu FOREIGN KEY(idJeu) REFERENCES Jeux(idJeu),
    ADD CONSTRAINT FK_Profile_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoires(idAccessoire),
    ADD CONSTRAINT FK_Profile_Console FOREIGN KEY(idConsole) REFERENCES Consoles(idConsole);

ALTER TABLE PhotoCollections 
    ADD CONSTRAINT FK_PhotoCollection_Utilisateurs  FOREIGN KEY(idUtilisateur) REFERENCES Utilisateurs(idUtilisateur);

INSERT INTO
    Marques (idMarque, libelleMarque)
VALUES   (1, 'Nintendo'),(2, 'Sega'),(3,'Sony');

INSERT INTO
    Jeux (idJeu, libelleJeu,idMarque)
VALUES   (1,'Mario',1),(2,'Sonic',1),(3,'Spyro',1);

INSERT INTO
    Consoles (idConsole, libelleConsole,idMarque)
VALUES   (1,'Playstation',1),(2,'Super Nintendo',1),(3,'Megadrive',1);

INSERT INTO
    Accessoires (idAccessoire, libelleAccessoire,idMarque)
VALUES   (1,'Manette',1),(2,'CarteMemoire',1),(3,'Volant',1);



INSERT INTO
    ConsolesAccessoires (idConsoleAccessoire, idAccessoire,idConsole)
VALUES   (1,1,1),(2,2,1),(3,3,1);

INSERT INTO
    ConsolesJeux (idConsoleJeu, idJeu,idConsole)
VALUES   (1,1,1),(2,2,1),(3,3,1);

INSERT INTO
    PhotoCollections (idPhotoCollection, libellePhoto, commentairePhoto ,idUtilisateur)
VALUES   (1,'photo1','commentaire1',1),(2,'photo2','commentaire2',1),(3,'photo3','commentaire3',1);

INSERT INTO
    Profiles (idProfile, idUtilisateur, idJeu, idAccessoire, idConsole)
VALUES   (1,1,1,1,1),(1,2,2,1,1),(1,3,3,1,1);