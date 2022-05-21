-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : ven. 11 fév. 2022 à 08:10
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
-- Base de données : `ecf2`
--
CREATE DATABASE IF NOT EXISTS `ecf2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecf2`;

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

DROP TABLE IF EXISTS `chambres`;
CREATE TABLE IF NOT EXISTS `chambres` (
  `idChambre` int(11) NOT NULL AUTO_INCREMENT,
  `typeChambre` int(11) NOT NULL,
  `capaciteChambre` int(11) NOT NULL,
  `numChambre` int(11) NOT NULL,
  `idHotel` int(11) NOT NULL,
  PRIMARY KEY (`idChambre`),
  KEY `FK_chambres_hotels` (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`idChambre`, `typeChambre`, `capaciteChambre`, `numChambre`, `idHotel`) VALUES
(1, 1, 1, 101, 1),
(2, 1, 2, 102, 1),
(3, 1, 1, 103, 1),
(4, 1, 2, 104, 2),
(5, 1, 2, 105, 2),
(6, 1, 1, 106, 2),
(7, 1, 3, 107, 3),
(8, 1, 1, 108, 3),
(9, 1, 3, 109, 2);

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `idHotel` int(11) NOT NULL AUTO_INCREMENT,
  `nomHotel` varchar(50) NOT NULL,
  `categorieHotel` int(11) NOT NULL,
  `adresseHotel` varchar(50) NOT NULL,
  `villeHotel` varchar(50) NOT NULL,
  PRIMARY KEY (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`idHotel`, `nomHotel`, `categorieHotel`, `adresseHotel`, `villeHotel`) VALUES
(1, 'Le Magnifique', 3, 'rue du bas', 'Pralo'),
(2, 'Hotel du haut', 1, 'rue du haut', 'Pralo'),
(3, 'Le Narval', 3, 'place de la liberation', 'Vonten'),
(4, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD CONSTRAINT `FK_chambres_hotels` FOREIGN KEY (`idHotel`) REFERENCES `hotels` (`idHotel`);
--
-- Base de données : `multicouche`
--
CREATE DATABASE IF NOT EXISTS `multicouche` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `multicouche`;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `IdDepartement` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`IdDepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`IdDepartement`, `Libelle`) VALUES
(1, 'nord'),
(2, 'dep2'),
(3, 'dep4'),
(4, 'string'),
(6, 'string'),
(7, 'string');

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `IdVille` int(11) NOT NULL AUTO_INCREMENT,
  `NomVille` varchar(50) NOT NULL,
  `IdDepartement` int(11) NOT NULL,
  PRIMARY KEY (`IdVille`),
  KEY `fk` (`IdDepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`IdVille`, `NomVille`, `IdDepartement`) VALUES
(1, 'paris', 2),
(2, 'dunkerque', 7),
(3, 'vil3', 1),
(4, 'string', 4),
(5, 'string', 6);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `fk` FOREIGN KEY (`IdDepartement`) REFERENCES `departements` (`IdDepartement`);
--
-- Base de données : `multicoucheperso`
--
CREATE DATABASE IF NOT EXISTS `multicoucheperso` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `multicoucheperso`;

-- --------------------------------------------------------

--
-- Structure de la table `billeterie`
--

DROP TABLE IF EXISTS `billeterie`;
CREATE TABLE IF NOT EXISTS `billeterie` (
  `IdBillet` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleBillet` varchar(50) NOT NULL,
  PRIMARY KEY (`IdBillet`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `billeterie`
--

INSERT INTO `billeterie` (`IdBillet`, `LibelleBillet`) VALUES
(1, 'TicketAide'),
(2, 'ticketQuestion'),
(3, 'ticketStage'),
(5, 'string'),
(6, 'string'),
(7, 'string'),
(8, 'string'),
(9, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

DROP TABLE IF EXISTS `stagiaire`;
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `IdStagiaire` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `IdBillet` int(11) NOT NULL,
  PRIMARY KEY (`IdStagiaire`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stagiaire`
--

INSERT INTO `stagiaire` (`IdStagiaire`, `Nom`, `Prenom`, `IdBillet`) VALUES
(1, 'alan', 'alan', 1),
(2, 'moktar', 'moktar', 2),
(3, 'nacer', 'nacer', 1),
(6, 'string', 'string', 0);

-- --------------------------------------------------------

--
-- Structure de la table `textes`
--

DROP TABLE IF EXISTS `textes`;
CREATE TABLE IF NOT EXISTS `textes` (
  `idTexte` int(11) NOT NULL AUTO_INCREMENT,
  `codeTexte` varchar(50) NOT NULL,
  `fr` longtext NOT NULL,
  `en` longtext NOT NULL,
  PRIMARY KEY (`idTexte`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `textes`
--

INSERT INTO `textes` (`idTexte`, `codeTexte`, `fr`, `en`) VALUES
(1, 'Bonjour', 'Bonjour', 'Hello'),
(2, 'Connexion', 'Connexion', 'Log in'),
(3, 'Deconnexion', 'Deconnexion', 'Log out'),
(4, 'Accueil', 'Accueil', 'Home'),
(5, 'AdresseEmail', 'Adresse email', 'Email address'),
(6, 'Mdp', 'Mot de passe', 'Password'),
(7, 'Inscription', 'Inscription', 'Registration'),
(8, 'Nom', 'Nom', 'Surname'),
(9, 'Prenom', 'Prenom', 'Name'),
(10, 'InfoMdpLegend', 'Veuillez saisir au moins', 'Please enter at least'),
(11, 'UneMajuscule', '1 majuscule', '1 uppercase'),
(12, 'UneMinuscule', '1 minuscule', '1 lowercase'),
(13, 'UnChiffre', '1 chiffre', '1 number'),
(14, 'UnCaractereSpecial', '1 caractère spécial ( ! @ & # * ^ $ % +)', '1 special character ( ! @ & # * ^ $ % +)'),
(15, 'MinimumCaractere', '8 caractères', '8 character'),
(16, 'Confirmation', 'Confirmation', 'Confirmation'),
(17, 'Reset', 'Réinitialisation', 'Reset'),
(18, 'inputDefault', 'Choisir une valeur', 'Choose a value'),
(19, 'Envoyer', 'Envoyer', 'Send');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresseMail` varchar(50) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `role` int(11) NOT NULL COMMENT '2 Admin 1 User',
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `adresseMail` (`adresseMail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `adresseMail`, `motDePasse`, `role`) VALUES
(1, 'alan', 'alan', 'alan@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `fk_Stagiaire_Billeterie` FOREIGN KEY (`IdStagiaire`) REFERENCES `billeterie` (`IdBillet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
