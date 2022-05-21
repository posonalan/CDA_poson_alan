DROP DATABASE IF EXISTS CantineMartine;
CREATE DATABASE CantineMartine DEFAULT CHARACTER SET utf8;
Use CantineMartine;
--
-- Table  'CategoriesProduits'
--

DROP TABLE IF EXISTS CategoriesProduits;
CREATE TABLE CategoriesProduits(
   IdCategorieProduit INT AUTO_INCREMENT PRIMARY KEY,
   LibelleCategorieProduit VARCHAR(50)
) ENGINE=InnoDB;


--
-- Table  'CategoriesPlats'
--

DROP TABLE IF EXISTS CategoriesPlats;
CREATE TABLE CategoriesPlats(
   IdCategoriePlat INT AUTO_INCREMENT PRIMARY KEY,
   LibelleCategoriePlat VARCHAR(50)
) ENGINE=InnoDB;


--
-- Table  'Menus'
--

DROP TABLE IF EXISTS Menus;
CREATE TABLE Menus(
   IdMenu INT AUTO_INCREMENT PRIMARY KEY,
   NumeroSemaine INT
) ENGINE=InnoDB;

--
-- Table  'Plats'
--

DROP TABLE IF EXISTS Plats;
CREATE TABLE Plats(
   IdPlat INT AUTO_INCREMENT PRIMARY KEY,
   LibellePlat VARCHAR(50),
   IdCategoriePlat INT NOT NULL
) ENGINE=InnoDB;


--
-- Table  'Produits'
--

DROP TABLE IF EXISTS Produits;
CREATE TABLE Produits(
   IdProduit INT AUTO_INCREMENT PRIMARY KEY,
   LibelleProduit VARCHAR(50),
   QuantiteProduit INT,
   IdCategorieProduit INT NOT NULL
) ENGINE=InnoDB;

--
-- Table  'affiche'
--

DROP TABLE IF EXISTS ContenuMenu;
CREATE TABLE ContenuMenu(
    IdContenuMenu INT AUTO_INCREMENT PRIMARY KEY,
   IdMenu INT,
   IdPlat INT,
   DateJour DATE
) ENGINE=InnoDB;

--
-- Table  'compose'
--

DROP TABLE IF EXISTS ContenuPlat;
CREATE TABLE ContenuPlat(
    IdContenuPlat INT AUTO_INCREMENT PRIMARY KEY,
   IdProduit INT,
   IdPlat INT,
   Quantite INT
) ENGINE=InnoDB;

ALTER TABLE  ContenuPlat  
    ADD CONSTRAINT FK_ContenuPlat_Produits FOREIGN KEY(IdProduit) REFERENCES Produits(IdProduit),
    ADD CONSTRAINT FK_ContenuPlat_Plats  FOREIGN KEY(IdPlat) REFERENCES Plats(IdPlat);

ALTER TABLE ContenuMenu
    ADD CONSTRAINT FK_ContenuMenu_Menus FOREIGN KEY(IdMenu) REFERENCES Menus(IdMenu),
    ADD CONSTRAINT FK_ContenuMenu_Plats FOREIGN KEY(IdPlat) REFERENCES Plats(IdPlat);

ALTER TABLE Plats 
        ADD CONSTRAINT FK_Plats_CategoriePlat FOREIGN KEY(IdCategoriePlat) REFERENCES CategoriesPlats(IdCategoriePlat);

ALTER TABLE Produits 
  ADD CONSTRAINT FK_Produits_CategorieProduits FOREIGN KEY(IdCategorieProduit) REFERENCES CategoriesProduits(IdCategorieProduit);

