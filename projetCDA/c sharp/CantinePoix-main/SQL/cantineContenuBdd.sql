-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 07 déc. 2021 à 09:29
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cantinemartine`
--

-- --------------------------------------------------------

--
-- Structure de la table `categoriesplats`
--

DROP TABLE IF EXISTS `categoriesplats`;
CREATE TABLE IF NOT EXISTS `categoriesplats` (
  `IdCategoriePlat` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleCategoriePlat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdCategoriePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categoriesplats`
--

INSERT INTO `categoriesplats` (`IdCategoriePlat`, `LibelleCategoriePlat`) VALUES
(1, 'Entree'),
(2, 'Plat'),
(3, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `categoriesproduits`
--

DROP TABLE IF EXISTS `categoriesproduits`;
CREATE TABLE IF NOT EXISTS `categoriesproduits` (
  `IdCategorieProduit` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleCategorieProduit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdCategorieProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categoriesproduits`
--

INSERT INTO `categoriesproduits` (`IdCategorieProduit`, `LibelleCategorieProduit`) VALUES
(1, 'Legume'),
(2, 'Fruit'),
(3, 'Viande'),
(4, 'Céréale'),
(5, 'Epice'),
(6, 'Sauce'),
(7, 'Poisson'),
(8, 'Féculent ');

-- --------------------------------------------------------

--
-- Structure de la table `contenumenu`
--

DROP TABLE IF EXISTS `contenumenu`;
CREATE TABLE IF NOT EXISTS `contenumenu` (
  `IdContenuMenu` int(11) NOT NULL AUTO_INCREMENT,
  `IdMenu` int(11) DEFAULT NULL,
  `IdPlat` int(11) DEFAULT NULL,
  `DateJour` date DEFAULT NULL,
  PRIMARY KEY (`IdContenuMenu`),
  KEY `FK_ContenuMenu_Menus` (`IdMenu`),
  KEY `FK_ContenuMenu_Plats` (`IdPlat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenumenu`
--

INSERT INTO `contenumenu` (`IdContenuMenu`, `IdMenu`, `IdPlat`, `DateJour`) VALUES
(1, 1, 13, '2021-12-08'),
(2, 1, 2, '2021-12-08'),
(3, 1, 9, '2021-12-08'),
(4, 2, 12, '2021-12-09'),
(5, 2, 3, '2021-12-09'),
(6, 2, 8, '2021-12-09'),
(7, 3, 14, '2021-12-10'),
(8, 3, 5, '2021-12-09'),
(9, 3, 10, '2021-12-09');

-- --------------------------------------------------------

--
-- Structure de la table `contenuplat`
--

DROP TABLE IF EXISTS `contenuplat`;
CREATE TABLE IF NOT EXISTS `contenuplat` (
  `IdContenuPlat` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduit` int(11) DEFAULT NULL,
  `IdPlat` int(11) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdContenuPlat`),
  KEY `FK_ContenuPlat_Produits` (`IdProduit`),
  KEY `FK_ContenuPlat_Plats` (`IdPlat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenuplat`
--

INSERT INTO `contenuplat` (`IdContenuPlat`, `IdProduit`, `IdPlat`, `Quantite`) VALUES
(1, 20, 5, 1),
(2, 10, 5, 4),
(3, 7, 10, 2),
(4, 19, 12, 3);

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `IdMenu` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroSemaine` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`IdMenu`, `NumeroSemaine`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `plats`
--

DROP TABLE IF EXISTS `plats`;
CREATE TABLE IF NOT EXISTS `plats` (
  `IdPlat` int(11) NOT NULL AUTO_INCREMENT,
  `LibellePlat` varchar(50) DEFAULT NULL,
  `IdCategoriePlat` int(11) NOT NULL,
  PRIMARY KEY (`IdPlat`),
  KEY `FK_Plats_CategoriePlat` (`IdCategoriePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plats`
--

INSERT INTO `plats` (`IdPlat`, `LibellePlat`, `IdCategoriePlat`) VALUES
(1, 'Spaghetti bolognaise', 2),
(2, 'Poulet au maroilles', 2),
(3, 'Purée jambon ', 2),
(4, 'Cassoulet', 2),
(5, 'Frites steak haché ', 2),
(6, 'Fondant aux chocolats', 3),
(7, 'Tarte aux pommes', 3),
(8, 'Profiterole ', 3),
(9, 'Tiramisu', 3),
(10, 'Glace pomme croissant ', 3),
(11, 'Salade', 1),
(12, 'Assiette de charcuterie ', 1),
(13, 'Caviar de russie', 1),
(14, 'Fois gras au croissant', 1),
(15, 'Oeuf mimosa', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `IdProduit` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleProduit` varchar(50) DEFAULT NULL,
  `QuantiteProduit` int(11) DEFAULT NULL,
  `IdCategorieProduit` int(11) NOT NULL,
  PRIMARY KEY (`IdProduit`),
  KEY `FK_Produits_CategorieProduits` (`IdCategorieProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`IdProduit`, `LibelleProduit`, `QuantiteProduit`, `IdCategorieProduit`) VALUES
(1, 'Blé', 10, 4),
(2, 'Riz', 20, 4),
(3, 'Mais', 30, 4),
(4, 'Poivre', 100, 5),
(5, 'Sel', 100, 5),
(6, 'Safran', 50, 5),
(7, 'Pomme', 15, 2),
(8, 'Poire', 52, 2),
(9, 'Abricot', 12, 2),
(10, 'Pomme de terre ', 50, 1),
(11, 'Petit poids ', 30, 1),
(12, 'Topinambour', 3, 1),
(13, 'Carpe', 5, 7),
(14, 'Saumon', 3, 7),
(15, 'Truite', 45, 7),
(16, 'Poivre', 10, 6),
(17, 'Echalotte', 6, 6),
(18, 'Béchamel', 2, 6),
(19, 'Porc', 10, 3),
(20, 'Boeuf', 5, 3),
(21, 'Cheval', 15, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contenumenu`
--
ALTER TABLE `contenumenu`
  ADD CONSTRAINT `FK_ContenuMenu_Menus` FOREIGN KEY (`IdMenu`) REFERENCES `menus` (`IdMenu`),
  ADD CONSTRAINT `FK_ContenuMenu_Plats` FOREIGN KEY (`IdPlat`) REFERENCES `plats` (`IdPlat`);

--
-- Contraintes pour la table `contenuplat`
--
ALTER TABLE `contenuplat`
  ADD CONSTRAINT `FK_ContenuPlat_Plats` FOREIGN KEY (`IdPlat`) REFERENCES `plats` (`IdPlat`),
  ADD CONSTRAINT `FK_ContenuPlat_Produits` FOREIGN KEY (`IdProduit`) REFERENCES `produits` (`IdProduit`);

--
-- Contraintes pour la table `plats`
--
ALTER TABLE `plats`
  ADD CONSTRAINT `FK_Plats_CategoriePlat` FOREIGN KEY (`IdCategoriePlat`) REFERENCES `categoriesplats` (`IdCategoriePlat`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `FK_Produits_CategorieProduits` FOREIGN KEY (`IdCategorieProduit`) REFERENCES `categoriesproduits` (`IdCategorieProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
