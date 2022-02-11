-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 31 jan. 2022 à 11:12
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
-- Base de données : `ecf_php`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `IdArticle` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleArticle` varchar(20) DEFAULT NULL,
  `DescriptionArticle` varchar(200) DEFAULT NULL,
  `PrixArticle` double DEFAULT NULL,
  `Photos` varchar(100) DEFAULT NULL,
  `IdTypeArticle` int(11) NOT NULL,
  PRIMARY KEY (`IdArticle`),
  KEY `IdTypeArticle` (`IdTypeArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`IdArticle`, `LibelleArticle`, `DescriptionArticle`, `PrixArticle`, `Photos`, `IdTypeArticle`) VALUES
(1, 'gomme', 'gomme', 3, 'jpg_61f26b02c735c.jpg', 2),
(2, 'eau', 'bouteille eau 1l', 2, 'jpg_61f01bbb44d73.jpg', 1),
(3, 'coca', 'Coca 50cl', 2, 'jpg_61f01bc85f949.jpg', 1),
(4, 'papier', 'rame de papier imprimante', 2, 'jpg_61f01bb34ef8b.jpg', 2);

-- --------------------------------------------------------

--
-- Structure de la table `lignespaniers`
--

DROP TABLE IF EXISTS `lignespaniers`;
CREATE TABLE IF NOT EXISTS `lignespaniers` (
  `IdLignePanier` int(11) NOT NULL AUTO_INCREMENT,
  `IdArticle` int(11) DEFAULT NULL,
  `IdPanier` int(11) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdLignePanier`),
  KEY `IdArticle` (`IdArticle`),
  KEY `IdPanier` (`IdPanier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

DROP TABLE IF EXISTS `paniers`;
CREATE TABLE IF NOT EXISTS `paniers` (
  `IdPanier` int(11) NOT NULL AUTO_INCREMENT,
  `IdClient` int(11) DEFAULT NULL,
  `DatePanier` date DEFAULT NULL,
  `AdresseLivraison` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdPanier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
(19, 'Envoyer', 'Envoyer', 'Send'),
(20, 'LibelleArticle', 'LibelleArticle', 'articleWording'),
(21, 'DescriptionArticle', 'DescriptionArticle', 'DescriptionArticle'),
(22, 'PrixArticle', 'PrixArticle', 'PriceArticle'),
(23, 'IdTypeArticle', 'IdTypeArticle', 'IdTypeArticle'),
(24, 'Photos', 'Photos', 'Photo'),
(25, 'LibelleTypeArticle', 'LibelleTypeArticle', 'LibelleTypeArticle');

-- --------------------------------------------------------

--
-- Structure de la table `typesarticles`
--

DROP TABLE IF EXISTS `typesarticles`;
CREATE TABLE IF NOT EXISTS `typesarticles` (
  `IdTypeArticle` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleTypeArticle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTypeArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typesarticles`
--

INSERT INTO `typesarticles` (`IdTypeArticle`, `LibelleTypeArticle`) VALUES
(1, 'Alimentaire'),
(2, 'Bureautique');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `adresseMail`, `motDePasse`, `role`) VALUES
(1, 'admin', 'admin', 'admin1@gmail.com', 'c91e2fb9a6b5c4544966351789a17129', 2),
(2, 'client1', 'client1', 'client1@gmail.com', '7ae62dab0a99e070fb2af11a0387339a', 1),
(3, 'client2', 'Client2', 'client2@gmail.com', 'd7cb3e747bd9684419b92bade7c34759', 1),
(4, 'Alan', 'Alan', 'Alan@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`IdTypeArticle`) REFERENCES `typesarticles` (`IdTypeArticle`);

--
-- Contraintes pour la table `lignespaniers`
--
ALTER TABLE `lignespaniers`
  ADD CONSTRAINT `lignespaniers_ibfk_1` FOREIGN KEY (`IdArticle`) REFERENCES `articles` (`IdArticle`),
  ADD CONSTRAINT `lignespaniers_ibfk_2` FOREIGN KEY (`IdPanier`) REFERENCES `paniers` (`IdPanier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
