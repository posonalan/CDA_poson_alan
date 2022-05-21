
--
-- Base de données :  `multicoucheperso`
--
CREATE DATABASE IF NOT EXISTS `multicoucheperso` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `multicoucheperso`;

-- --------------------------------------------------------

--
-- Structure de la table `billeterie`
--

DROP TABLE IF EXISTS `Billeterie`;
CREATE TABLE IF NOT EXISTS `Billeterie` (
  `IdBillet` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `LibelleBilleterie` varchar(50) NOT NULL

) ENGINE=InnoDB;

--
-- Déchargement des données de la table `billeterie`
--

INSERT INTO `Billeterie` (`IdBillet`, `LibelleBillet`) VALUES
(1, 'ticketAide'),
(2, 'ticketQuestion'),
(3, 'ticketStage');

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `Stagiaire`;
CREATE TABLE IF NOT EXISTS `Stagiaire` (
  `IdStagiaire` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `Nom` varchar(50) NOT NULL,
 `Prenom` varchar(50) NOT NULL, 
 `IdBillet` int(11) NOT NULL
) ENGINE=InnoDB ;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `stagiaire` (`IdStagiaire`, `Nom`, `Prenom`,`IdBillet`) VALUES
(1, 'alan','alan', 1),
(2, 'moktar','moktar', 2),
(3, 'nacer','nacer', 1);


--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `villes`
--
ALTER TABLE `Stagiaire`
  ADD CONSTRAINT `fk_Stagiaire_Billeterie` FOREIGN KEY (`IdStagiaire`) REFERENCES `Billeterie` (`IdBillet`);


