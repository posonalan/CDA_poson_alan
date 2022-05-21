
--
-- Base de données :  `animauxapi`
--
CREATE DATABASE animauxapi;
USE animauxapi;
-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `idAnimal` int(10)NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `libelleAnimal` varchar(45) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`idAnimal`, `libelleAnimal`, `dateNaissance`) VALUES
(1, 'lion', '2000-12-05'),
(2, 'autruche', '2000-12-23'),
(3, 'serpent ', '2000-12-02'),
(4, 'loire', '2000-12-16');
