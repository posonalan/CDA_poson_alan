-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 09 déc. 2021 à 10:12
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `filrougebdd`
--
CREATE DATABASE IF NOT EXISTS `filrougebdd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `filrougebdd`;

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `IdAdresse` int(11) NOT NULL AUTO_INCREMENT,
  `emailAdresse` varchar(150) NOT NULL,
  `telMobile` varchar(12) NOT NULL,
  `telFixe` varchar(12) DEFAULT NULL,
  `adresse` varchar(50) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `complementAdresse` varchar(50) DEFAULT NULL,
  `IdVille` int(11) NOT NULL,
  PRIMARY KEY (`IdAdresse`),
  KEY `FK_Adresses_Villes` (`IdVille`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`IdAdresse`, `emailAdresse`, `telMobile`, `telFixe`, `adresse`, `province`, `complementAdresse`, `IdVille`) VALUES
(1, 'Maxance@Bootstrap.com', '0602030203', '0328569569', '58 rue de l\'afpa ', 'Nord', '59240 dunkerque', 1),
(2, 'Martine.Poix@Afpa.fr', '06080502', '0328569565', '96 rue de l\'eglise ', 'Nord', '59380 socx', 1);

-- --------------------------------------------------------

--
-- Structure de la table `approvisionnements`
--

DROP TABLE IF EXISTS `approvisionnements`;
CREATE TABLE IF NOT EXISTS `approvisionnements` (
  `IdApprovisionnement` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduit` int(11) DEFAULT NULL,
  `IdFournisseur` int(11) DEFAULT NULL,
  `refFournisseur` varchar(5) NOT NULL,
  PRIMARY KEY (`IdApprovisionnement`),
  KEY `FK_Approvisionnements_Produits` (`IdProduit`),
  KEY `FK_Approvisionnements_Fournisseurs` (`IdFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `approvisionnements`
--

INSERT INTO `approvisionnements` (`IdApprovisionnement`, `IdProduit`, `IdFournisseur`, `refFournisseur`) VALUES
(1, 3, 2, '15252'),
(2, 2, 1, '15252');

-- --------------------------------------------------------

--
-- Structure de la table `categoriesclient`
--

DROP TABLE IF EXISTS `categoriesclient`;
CREATE TABLE IF NOT EXISTS `categoriesclient` (
  `IdCategorieClient` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCategClient` varchar(150) NOT NULL,
  `infoReglement` varchar(50) NOT NULL,
  `coefCategClient` int(11) NOT NULL,
  PRIMARY KEY (`IdCategorieClient`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categoriesclient`
--

INSERT INTO `categoriesclient` (`IdCategorieClient`, `libelleCategClient`, `infoReglement`, `coefCategClient`) VALUES
(1, 'Particulier', '1', 4),
(2, 'Professionnel', '2', 2);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `IdUser` int(11) NOT NULL,
  `refClient` varchar(5) NOT NULL,
  `coefClient` int(11) NOT NULL,
  `IdCategorieClient` int(11) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE KEY `refClient` (`refClient`),
  KEY `FK_Clients_CategoriesClient` (`IdCategorieClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`IdUser`, `refClient`, `coefClient`, `IdCategorieClient`) VALUES
(1, '1234', 4, 1),
(2, '1325', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `IdCommande` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroCommande` varchar(10) DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `IdUser` int(11) NOT NULL,
  `IdAdresse` int(11) NOT NULL,
  PRIMARY KEY (`IdCommande`),
  UNIQUE KEY `NumeroCommande` (`NumeroCommande`),
  KEY `FK_Commandes_Clients` (`IdUser`),
  KEY `FK_Commandes_Adresses` (`IdAdresse`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`IdCommande`, `NumeroCommande`, `dateCommande`, `IdUser`, `IdAdresse`) VALUES
(11, '12', '2021-12-21', 1, 1),
(12, '36', '2021-12-29', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `etatscommande`
--

DROP TABLE IF EXISTS `etatscommande`;
CREATE TABLE IF NOT EXISTS `etatscommande` (
  `IdEtatCommande` int(11) NOT NULL AUTO_INCREMENT,
  `libelleEtatCommande` varchar(50) NOT NULL,
  PRIMARY KEY (`IdEtatCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etatscommande`
--

INSERT INTO `etatscommande` (`IdEtatCommande`, `libelleEtatCommande`) VALUES
(1, 'En attente '),
(2, 'En cours'),
(3, 'Terminé');

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE IF NOT EXISTS `factures` (
  `IdFacture` int(11) NOT NULL AUTO_INCREMENT,
  `IdReglement` int(11) DEFAULT NULL,
  `IdCommande` int(11) DEFAULT NULL,
  `datePaiement` date NOT NULL,
  `montantPaiement` decimal(19,4) NOT NULL,
  PRIMARY KEY (`IdFacture`),
  KEY `FK_Factures_Reglements` (`IdReglement`),
  KEY `FK_Factures_Commandes` (`IdCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`IdFacture`, `IdReglement`, `IdCommande`, `datePaiement`, `montantPaiement`) VALUES
(1, 2, 11, '2021-12-20', '169.6600'),
(2, 4, 12, '2021-12-13', '125.9900');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `IdFournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nomFournisseur` varchar(150) NOT NULL,
  PRIMARY KEY (`IdFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`IdFournisseur`, `nomFournisseur`) VALUES
(1, 'MenageService AFPA'),
(2, 'Space X ');

-- --------------------------------------------------------

--
-- Structure de la table `historiquetva`
--

DROP TABLE IF EXISTS `historiquetva`;
CREATE TABLE IF NOT EXISTS `historiquetva` (
  `IdHistoriqueTVA` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduit` int(11) DEFAULT NULL,
  `IdTVA` int(11) DEFAULT NULL,
  `dateTVA` date NOT NULL,
  PRIMARY KEY (`IdHistoriqueTVA`),
  KEY `FK_HistoriqueTVA_Produits` (`IdProduit`),
  KEY `FK_HistoriqueTVA_TVA` (`IdTVA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `historiquetva`
--

INSERT INTO `historiquetva` (`IdHistoriqueTVA`, `IdProduit`, `IdTVA`, `dateTVA`) VALUES
(1, 3, 1, '2021-12-15'),
(2, 1, 2, '2021-12-30');

-- --------------------------------------------------------

--
-- Structure de la table `lignescommande`
--

DROP TABLE IF EXISTS `lignescommande`;
CREATE TABLE IF NOT EXISTS `lignescommande` (
  `IdLigneCommande` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduit` int(11) DEFAULT NULL,
  `IdCommande` int(11) DEFAULT NULL,
  `quantiteProduit` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdLigneCommande`),
  KEY `FK_LigneCommande_Produits` (`IdProduit`),
  KEY `FK_LignesCommande_Commandes` (`IdCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lignescommande`
--

INSERT INTO `lignescommande` (`IdLigneCommande`, `IdProduit`, `IdCommande`, `quantiteProduit`) VALUES
(1, 2, 12, 4),
(2, 1, 11, 6);

-- --------------------------------------------------------

--
-- Structure de la table `livraisons`
--

DROP TABLE IF EXISTS `livraisons`;
CREATE TABLE IF NOT EXISTS `livraisons` (
  `IdLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `IdCommande` int(11) DEFAULT NULL,
  `IdAdresse` int(11) DEFAULT NULL,
  `dateLivraison` date DEFAULT NULL,
  `quantiteLivraison` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdLivraison`),
  KEY `FK_Livraisons_Commandes` (`IdCommande`),
  KEY `FK_Livraisons_Adresses` (`IdAdresse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraisons`
--

INSERT INTO `livraisons` (`IdLivraison`, `IdCommande`, `IdAdresse`, `dateLivraison`, `quantiteLivraison`) VALUES
(1, 11, 1, '2021-12-23', 6),
(2, 12, 2, '2021-12-24', 7);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `IdPays` int(11) NOT NULL AUTO_INCREMENT,
  `nomPays` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPays`),
  UNIQUE KEY `nomPays` (`nomPays`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`IdPays`, `nomPays`) VALUES
(3, 'Belgique'),
(1, 'France'),
(2, 'Russie'),
(4, 'Somalie');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `IdProduit` int(11) NOT NULL AUTO_INCREMENT,
  `libelleProduit` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `refProduit` varchar(5) NOT NULL,
  `prixHorsTaxe` decimal(19,4) NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `IdRubrique` int(11) NOT NULL,
  PRIMARY KEY (`IdProduit`),
  UNIQUE KEY `refProduit` (`refProduit`),
  KEY `FK_Produits_Rubriques` (`IdRubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`IdProduit`, `libelleProduit`, `description`, `refProduit`, `prixHorsTaxe`, `photo`, `stock`, `IdRubrique`) VALUES
(1, 'Guitare', 'Une superbe guitare qui fait du bruit quand on la forte ', '12312', '149.9900', 'image de guitare', 10, 1),
(2, 'TamTam', 'Un tamtam antique fait par des vodou africain , fabriqué en chine ', '12521', '8.9900', 'image du tamtam', 9, 3),
(3, 'Trompette', 'La trompette de Louis Armstrong , 100% certifié par louis lui même après sa mort ', '15651', '999.9900', 'image Trompette', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `progressionscommande`
--

DROP TABLE IF EXISTS `progressionscommande`;
CREATE TABLE IF NOT EXISTS `progressionscommande` (
  `IdProgressionsCommande` int(11) NOT NULL AUTO_INCREMENT,
  `IdCommande` int(11) DEFAULT NULL,
  `IdEtatCommande` int(11) DEFAULT NULL,
  `dateEtatCommande` date NOT NULL,
  PRIMARY KEY (`IdProgressionsCommande`),
  KEY `FK_ProgressionsCommande_commandes` (`IdCommande`),
  KEY `FK_ProgressionsCommande_EtatsCommande` (`IdEtatCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `progressionscommande`
--

INSERT INTO `progressionscommande` (`IdProgressionsCommande`, `IdCommande`, `IdEtatCommande`, `dateEtatCommande`) VALUES
(1, 11, 1, '2021-12-22'),
(2, 12, 3, '2021-12-28');

-- --------------------------------------------------------

--
-- Structure de la table `reglements`
--

DROP TABLE IF EXISTS `reglements`;
CREATE TABLE IF NOT EXISTS `reglements` (
  `IdReglement` int(11) NOT NULL AUTO_INCREMENT,
  `typePaiement` varchar(50) NOT NULL,
  PRIMARY KEY (`IdReglement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reglements`
--

INSERT INTO `reglements` (`IdReglement`, `typePaiement`) VALUES
(1, 'Cheque'),
(2, 'Carte Bleu'),
(3, 'Paypal'),
(4, 'Bitcoin');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `IdRole` int(11) NOT NULL AUTO_INCREMENT,
  `libelleRole` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`IdRole`, `libelleRole`) VALUES
(1, 'Admin'),
(2, 'Client');

-- --------------------------------------------------------

--
-- Structure de la table `rubriques`
--

DROP TABLE IF EXISTS `rubriques`;
CREATE TABLE IF NOT EXISTS `rubriques` (
  `IdRubrique` int(11) NOT NULL AUTO_INCREMENT,
  `libelleRubrique` varchar(150) NOT NULL,
  `IdRubriqueMere` int(11) NOT NULL,
  PRIMARY KEY (`IdRubrique`),
  KEY `FK_Rubriques_RubriqueMere` (`IdRubriqueMere`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rubriques`
--

INSERT INTO `rubriques` (`IdRubrique`, `libelleRubrique`, `IdRubriqueMere`) VALUES
(1, 'Corde', 1),
(2, 'Vent ', 2),
(3, 'Percussion', 3);

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

DROP TABLE IF EXISTS `tva`;
CREATE TABLE IF NOT EXISTS `tva` (
  `IdTVA` int(11) NOT NULL AUTO_INCREMENT,
  `tauxTVA` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTVA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`IdTVA`, `tauxTVA`) VALUES
(1, 20),
(2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `nomUser` varchar(150) NOT NULL,
  `prenomUser` varchar(150) NOT NULL,
  `EmailUser` varchar(150) NOT NULL,
  `mdpUser` varchar(50) NOT NULL,
  `IdRole` int(11) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE KEY `EmailUser` (`EmailUser`),
  KEY `FK_User_Roles` (`IdRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`IdUser`, `nomUser`, `prenomUser`, `EmailUser`, `mdpUser`, `IdRole`) VALUES
(1, 'Dhaker', 'Maxance', 'Maxance@Bootstrap.com', '1010', 2),
(2, 'Poix', 'Martine', 'Martine.Poix@Afpa.fr', '1212', 1);

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `IdVille` int(11) NOT NULL AUTO_INCREMENT,
  `libelleVIlle` varchar(150) NOT NULL,
  `codePostal` varchar(6) NOT NULL,
  `IdPays` int(11) NOT NULL,
  PRIMARY KEY (`IdVille`),
  KEY `FK_Villes_Pays` (`IdPays`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`IdVille`, `libelleVIlle`, `codePostal`, `IdPays`) VALUES
(1, 'Dunkerque', '59240', 1),
(2, 'Moscou', '59696', 2),
(3, 'Mogadiscio', '6369', 4),
(4, 'Brussel', '5269', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `FK_Adresses_Villes` FOREIGN KEY (`IdVille`) REFERENCES `villes` (`IdVille`);

--
-- Contraintes pour la table `approvisionnements`
--
ALTER TABLE `approvisionnements`
  ADD CONSTRAINT `FK_Approvisionnements_Fournisseurs` FOREIGN KEY (`IdFournisseur`) REFERENCES `fournisseurs` (`IdFournisseur`),
  ADD CONSTRAINT `FK_Approvisionnements_Produits` FOREIGN KEY (`IdProduit`) REFERENCES `produits` (`IdProduit`);

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `FK_Clients_CategoriesClient` FOREIGN KEY (`IdCategorieClient`) REFERENCES `categoriesclient` (`IdCategorieClient`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `FK_Commandes_Adresses` FOREIGN KEY (`IdAdresse`) REFERENCES `adresses` (`IdAdresse`),
  ADD CONSTRAINT `FK_Commandes_Clients` FOREIGN KEY (`IdUser`) REFERENCES `clients` (`IdUser`);

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `FK_Factures_Commandes` FOREIGN KEY (`IdCommande`) REFERENCES `commandes` (`IdCommande`),
  ADD CONSTRAINT `FK_Factures_Reglements` FOREIGN KEY (`IdReglement`) REFERENCES `reglements` (`IdReglement`);

--
-- Contraintes pour la table `historiquetva`
--
ALTER TABLE `historiquetva`
  ADD CONSTRAINT `FK_HistoriqueTVA_Produits` FOREIGN KEY (`IdProduit`) REFERENCES `produits` (`IdProduit`),
  ADD CONSTRAINT `FK_HistoriqueTVA_TVA` FOREIGN KEY (`IdTVA`) REFERENCES `tva` (`IdTVA`);

--
-- Contraintes pour la table `lignescommande`
--
ALTER TABLE `lignescommande`
  ADD CONSTRAINT `FK_LigneCommande_Produits` FOREIGN KEY (`IdProduit`) REFERENCES `produits` (`IdProduit`),
  ADD CONSTRAINT `FK_LignesCommande_Commandes` FOREIGN KEY (`IdCommande`) REFERENCES `commandes` (`IdCommande`);

--
-- Contraintes pour la table `livraisons`
--
ALTER TABLE `livraisons`
  ADD CONSTRAINT `FK_Livraisons_Adresses` FOREIGN KEY (`IdAdresse`) REFERENCES `adresses` (`IdAdresse`),
  ADD CONSTRAINT `FK_Livraisons_Commandes` FOREIGN KEY (`IdCommande`) REFERENCES `commandes` (`IdCommande`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `FK_Produits_Rubriques` FOREIGN KEY (`IdRubrique`) REFERENCES `rubriques` (`IdRubrique`);

--
-- Contraintes pour la table `progressionscommande`
--
ALTER TABLE `progressionscommande`
  ADD CONSTRAINT `FK_ProgressionsCommande_EtatsCommande` FOREIGN KEY (`IdEtatCommande`) REFERENCES `etatscommande` (`IdEtatCommande`),
  ADD CONSTRAINT `FK_ProgressionsCommande_commandes` FOREIGN KEY (`IdCommande`) REFERENCES `commandes` (`IdCommande`);

--
-- Contraintes pour la table `rubriques`
--
ALTER TABLE `rubriques`
  ADD CONSTRAINT `FK_Rubriques_RubriqueMere` FOREIGN KEY (`IdRubriqueMere`) REFERENCES `rubriques` (`IdRubrique`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_User_Roles` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`);

--
-- Contraintes pour la table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `FK_Villes_Pays` FOREIGN KEY (`IdPays`) REFERENCES `pays` (`IdPays`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
