DROP DATABASE IF EXISTS BiblioJeux;
CREATE DATABASE  BiblioJeux DEFAULT CHARACTER SET utf8;
Use BiblioJeux;

--
-- Table  'Utilisateur'
--

CREATE TABLE Utilisateur(
   idUtilisateur COUNTER PRIMARY KEY,
   pseudoUtilisateur VARCHAR(50),
   motDePasseUtilisateur VARCHAR(50),
   emailUtilisateur VARCHAR(50),
   statue VARCHAR(50),
   photoCollection VARCHAR(50) 
)ENGINE=InnoDB;

CREATE TABLE Marque(
   idMarque COUNTER PRIMARY KEY,
   libelleMarque VARCHAR(50)
)ENGINE=InnoDB;

CREATE TABLE Jeu(
   idJeu COUNTER PRIMARY KEY,
   libelleJeu VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Accessoire(
   idAccessoire COUNTER PRIMARY KEY,
   libelleAccessoire VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Console(
   idConsole COUNTER PRIMARY KEY,
   libelleConsole VARCHAR(50),
   idMarque INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE ConsoleJeu(
   idConsoleJeu INT PRIMARY KEY,
   idJeu INT,
   idConsole INT
)ENGINE=InnoDB;

CREATE TABLE ConsoleAccessoire(
   idConsoleAccessoire INT PRIMARY KEY,
   idAccessoire INT,
   idConsole INT
)ENGINE=InnoDB;

CREATE TABLE Profile(
   idProfile INT PRIMARY KEY,
   idUtilisateur INT,
   idJeu INT,
   idAccessoire INT,
   idConsole INT
)ENGINE=InnoDB;

ALTER TABLE Jeu
    ADD CONSTRAINT FK_Jeu_Marque FOREIGN KEY(idMarque) REFERENCES Marque(idMarque)
ALTER TABLE Console
    ADD CONSTRAINT FK_Console_Marque FOREIGN KEY(idMarque) REFERENCES Marque(idMarque)
ALTER TABLE Accessoire
    ADD CONSTRAINT FK_Accessoire_Marque FOREIGN KEY(idMarque) REFERENCES Marque(idMarque)
ALTER TABLE ConsoleJeu
    ADD CONSTRAINT FK_ConsoleJeu_Jeu FOREIGN KEY(idJeu) REFERENCES Jeu(idJeu),
    ADD CONSTRAINT FK_ConsoleJeu_Console FOREIGN KEY(idConsole) REFERENCES Console(idConsole)
ALTER TABLE ConsoleAccessoire
    ADD CONSTRAINT FK_ConsoleAccessoire_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoire(idAccessoire),
    ADD CONSTRAINT FK_ConsoleAccessoire_Console FOREIGN KEY(idConsole) REFERENCES Console(idConsole)
ALTER TABLE Profile
    ADD CONSTRAINT FK_Profile_Utilisateur FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
    ADD CONSTRAINT FK_Profile_Jeu FOREIGN KEY(idJeu) REFERENCES Jeu(idJeu),
    ADD CONSTRAINT FK_Profile_Accessoire FOREIGN KEY(idAccessoire) REFERENCES Accessoire(idAccessoire),
    ADD CONSTRAINT FK_Profile_Console FOREIGN KEY(idConsole) REFERENCES Console(idConsole)