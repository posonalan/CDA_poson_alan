DROP DATABASE IF EXISTS GestionStocks; 
CREATE DATABASE GestionStocks DEFAULT CHARACTER SET utf8;
USE GestionStocks;

#========================================
# Table : TypesProduits
#========================================

CREATE TABLE TypesProduits(
   IdTypeProduit INT AUTO_INCREMENT PRIMARY KEY,
   LibelleTypeProduit VARCHAR(100) 
)ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


#========================================
# Table : Categories
#========================================

CREATE TABLE Categories(
   IdCategorie INT AUTO_INCREMENT PRIMARY KEY,
   LibelleCategorie VARCHAR(100) ,
   IdTypeProduit INT NOT NULL
)ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


#========================================
# Table : Articles
#========================================

CREATE TABLE Articles(
   IdArticle INT AUTO_INCREMENT PRIMARY KEY,
   LibelleArticle VARCHAR(100) ,
   QuantiteStockee INT,
   IdCategorie INT NOT NULL
)ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE
   Categories
ADD
   CONSTRAINT FK_Categories_TypesProduits FOREIGN KEY(IdTypeProduit) REFERENCES TypesProduits(IdTypeProduit);

ALTER TABLE
   Articles
ADD
   CONSTRAINT FK_Articles_Categories FOREIGN KEY(IdCategorie) REFERENCES Categories(IdCategorie);
