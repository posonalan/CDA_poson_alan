-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 11 fév. 2022 à 07:59
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
-- Base de données : `animaleriedao`
--
CREATE DATABASE IF NOT EXISTS `animaleriedao` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `animaleriedao`;

-- --------------------------------------------------------

--
-- Structure de la table `alimentations`
--

DROP TABLE IF EXISTS `alimentations`;
CREATE TABLE IF NOT EXISTS `alimentations` (
  `idAliment` int(11) NOT NULL AUTO_INCREMENT,
  `libelleAliment` varchar(50) NOT NULL,
  PRIMARY KEY (`idAliment`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `alimentations`
--

INSERT INTO `alimentations` (`idAliment`, `libelleAliment`) VALUES
(1, 'vegetaux'),
(2, 'viandes');

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `idAnimal` int(11) NOT NULL AUTO_INCREMENT,
  `libelleAnimal` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `dateDeNaissance` date NOT NULL,
  `idAliment` int(11) NOT NULL,
  `idMilieuVie` int(11) NOT NULL,
  PRIMARY KEY (`idAnimal`),
  KEY `FK_animaux_alimentations` (`idAliment`),
  KEY `FK_animaux_milieuvies` (`idMilieuVie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`idAnimal`, `libelleAnimal`, `prix`, `dateDeNaissance`, `idAliment`, `idMilieuVie`) VALUES
(1, 'lion', 2, '1899-11-30', 1, 1),
(2, 'vache', 1, '1958-11-30', 2, 1),
(3, 'carpe', 6, '2022-01-13', 1, 3),
(4, 'limace', 8, '2022-01-21', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `milieuvies`
--

DROP TABLE IF EXISTS `milieuvies`;
CREATE TABLE IF NOT EXISTS `milieuvies` (
  `idMilieuVie` int(11) NOT NULL AUTO_INCREMENT,
  `libelleMilieuVie` varchar(50) NOT NULL,
  `situationGeographique` varchar(50) NOT NULL,
  `climat` varchar(50) NOT NULL,
  PRIMARY KEY (`idMilieuVie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `milieuvies`
--

INSERT INTO `milieuvies` (`idMilieuVie`, `libelleMilieuVie`, `situationGeographique`, `climat`) VALUES
(1, 'montagne', 'Asie', 'Chaud'),
(2, 'Foret', 'Amerique', 'tempérer'),
(3, 'Oceanique', 'ocean indien', 'froid');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
(18, 'Envoyer', 'Envoyer', 'Send');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `adresseMail` varchar(50) NOT NULL,
  `role` int(11) NOT NULL COMMENT '2 Admin 1 User',
  `pseudo` varchar(50) NOT NULL,
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `motDePasse`, `adresseMail`, `role`, `pseudo`) VALUES
(7, 'ad', 'ad', '11d437a3e6695447bd1bf2331651049e', 'ad', 2, 'ad'),
(8, 'u', 'u', '1d0a5a28d53430e7f2293a1f36682f23', 'u', 1, 'u');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `FK_animaux_alimentations` FOREIGN KEY (`idAliment`) REFERENCES `alimentations` (`idAliment`),
  ADD CONSTRAINT `FK_animaux_milieuvies` FOREIGN KEY (`idMilieuVie`) REFERENCES `milieuvies` (`idMilieuVie`);
--
-- Base de données : `animalsynfony`
--
CREATE DATABASE IF NOT EXISTS `animalsynfony` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `animalsynfony`;

-- --------------------------------------------------------

--
-- Structure de la table `alimentations`
--

DROP TABLE IF EXISTS `alimentations`;
CREATE TABLE IF NOT EXISTS `alimentations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_aliment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_aliment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `alimentations`
--

INSERT INTO `alimentations` (`id`, `libelle_aliment`, `type_aliment`) VALUES
(1, 'herbe', 'vegetaux');

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alimentation_id` int(11) NOT NULL,
  `libelle_animal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_naissance` datetime NOT NULL,
  `prix` int(11) NOT NULL,
  `alimentations` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9ABE194D6D1F1751` (`id_alimentation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id`, `id_alimentation_id`, `libelle_animal`, `sexe`, `date_de_naissance`, `prix`, `alimentations`) VALUES
(1, 1, 'vache', 'F', '2022-02-03 16:15:00', 6, 'aime la belgique');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` varchar(5) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CompanyName`, `ContactName`, `ContactTitle`, `Address`, `City`, `Region`, `PostalCode`, `Country`, `Phone`, `Fax`) VALUES
('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745'),
('ANTON', 'Antonio Moreno Taquera', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'Mxico D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL),
('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750'),
('BERGS', 'Berglunds snabbkp', 'Christina Berglund', 'Order Administrator', 'Berguvsvgen  8', 'Lule', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67'),
('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924'),
('BLONP', 'Blondesddsl pre et fils', 'Frdrique Citeaux', 'Marketing Manager', '24, place Klber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32'),
('BOLID', 'Blido Comidas preparadas', 'Martn Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99'),
('BONAP', 'Bon app\'', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41'),
('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745'),
('BSBEV', 'B\'s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL),
('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892'),
('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'Mxico D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293'),
('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL),
('COMMI', 'Comrcio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL),
('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199'),
('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428'),
('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89'),
('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373'),
('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426'),
('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL),
('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93'),
('FOLIG', 'Folies gourmandes', 'Martine Ranc', 'Assistant Sales Agent', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17'),
('FOLKO', 'Folk och f HB', 'Maria Larsson', 'Owner', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL),
('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany', '089-0877310', '089-0877451'),
('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20'),
('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261'),
('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
('GALED', 'Galera del gastrnomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Catalua, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561'),
('GODOS', 'Godos Cocina Tpica', 'Jos Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL),
('GOURL', 'Gourmet Lanchonetes', 'Andr Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL),
('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL),
('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5 Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397'),
('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765'),
('HILAA', 'HILARION-Abastos', 'Carlos Hernndez', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),
('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376'),
('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333'),
('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL),
('KOENE', 'Kniglich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL),
('LACOR', 'La corne d\'abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11'),
('LAMAI', 'La maison d\'Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11'),
('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293'),
('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221'),
('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874'),
('LETSS', 'Let\'s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL),
('LILAS', 'LILA-Supermercado', 'Carlos Gonzlez', 'Accounting Manager', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256'),
('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93'),
('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646'),
('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231'),
('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68'),
('MEREP', 'Mre Paillarde', 'Jean Fresnire', 'Marketing Assistant', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055'),
('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL),
('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530'),
('OCEAN', 'Ocano Atlntico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535'),
('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880'),
('OTTIK', 'Ottilies Kseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721'),
('PARIS', 'Paris spcialits', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77'),
('PERIC', 'Pericles Comidas clsicas', 'Guillermo Fernndez', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745'),
('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723'),
('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL),
('QUEDE', 'Que Delcia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545'),
('QUEEN', 'Queen Cozinha', 'Lcia Carvalho', 'Marketing Assistant', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL),
('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstrae 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL),
('RANCH', 'Rancho grande', 'Sergio Gutirrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556'),
('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620'),
('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722'),
('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL),
('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genve', NULL, '1203', 'Switzerland', '0897-034214', NULL),
('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210'),
('SANTG', 'Sant Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47'),
('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL),
('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646'),
('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57'),
('SPECD', 'Spcialits du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20'),
('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525'),
('SUPRD', 'Suprmes dlices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21'),
('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL),
('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083'),
('TOMSP', 'Toms Spezialitten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany', '0251-031259', '0251-035695'),
('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL),
('TRADH', 'Tradio Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168'),
('TRAIH', 'Trail\'s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174'),
('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44'),
('Val2 ', 'IT', 'Val2', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('VALON', 'IT', 'Valon Hoti', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87'),
('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11'),
('WANDK', 'Die Wandernde Kuh', 'Rita Mller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428'),
('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655'),
('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL),
('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115'),
('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858'),
('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220207141517', '2022-02-07 14:16:23', 97);

-- --------------------------------------------------------

--
-- Structure de la table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Quantity` smallint(2) NOT NULL DEFAULT '1',
  `Discount` double(8,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) VALUES
(10248, 11, '14.0000', 12, 0),
(10248, 42, '9.8000', 10, 0),
(10248, 72, '34.8000', 5, 0),
(10249, 14, '18.6000', 9, 0),
(10249, 51, '42.4000', 40, 0),
(10250, 41, '7.7000', 10, 0),
(10250, 51, '42.4000', 35, 0),
(10250, 65, '16.8000', 15, 0),
(10251, 22, '16.8000', 6, 0),
(10251, 57, '15.6000', 15, 0),
(10251, 65, '16.8000', 20, 0),
(10252, 20, '64.8000', 40, 0),
(10252, 33, '2.0000', 25, 0),
(10252, 60, '27.2000', 40, 0),
(10253, 31, '10.0000', 20, 0),
(10253, 39, '14.4000', 42, 0),
(10253, 49, '16.0000', 40, 0),
(10254, 24, '3.6000', 15, 0),
(10254, 55, '19.2000', 21, 0),
(10254, 74, '8.0000', 21, 0),
(10255, 2, '15.2000', 20, 0),
(10255, 16, '13.9000', 35, 0),
(10255, 36, '15.2000', 25, 0),
(10255, 59, '44.0000', 30, 0),
(10256, 53, '26.2000', 15, 0),
(10256, 77, '10.4000', 12, 0),
(10257, 27, '35.1000', 25, 0),
(10257, 39, '14.4000', 6, 0),
(10257, 77, '10.4000', 15, 0),
(10258, 2, '15.2000', 50, 0),
(10258, 5, '17.0000', 65, 0),
(10258, 32, '25.6000', 6, 0),
(10259, 21, '8.0000', 10, 0),
(10259, 37, '20.8000', 1, 0),
(10260, 41, '7.7000', 16, 0),
(10260, 57, '15.6000', 50, 0),
(10260, 62, '39.4000', 15, 0),
(10260, 70, '12.0000', 21, 0),
(10261, 21, '8.0000', 20, 0),
(10261, 35, '14.4000', 20, 0),
(10262, 5, '17.0000', 12, 0),
(10262, 7, '24.0000', 15, 0),
(10262, 56, '30.4000', 2, 0),
(10263, 16, '13.9000', 60, 0),
(10263, 24, '3.6000', 28, 0),
(10263, 30, '20.7000', 60, 0),
(10263, 74, '8.0000', 36, 0),
(10264, 2, '15.2000', 35, 0),
(10264, 41, '7.7000', 25, 0),
(10265, 17, '31.2000', 30, 0),
(10265, 70, '12.0000', 20, 0),
(10266, 12, '30.4000', 12, 0),
(10267, 40, '14.7000', 50, 0),
(10267, 59, '44.0000', 70, 0),
(10267, 76, '14.4000', 15, 0),
(10268, 29, '99.0000', 10, 0),
(10268, 72, '27.8000', 4, 0),
(10269, 33, '2.0000', 60, 0),
(10269, 72, '27.8000', 20, 0),
(10270, 36, '15.2000', 30, 0),
(10270, 43, '36.8000', 25, 0),
(10271, 33, '2.0000', 24, 0),
(10272, 20, '64.8000', 6, 0),
(10272, 31, '10.0000', 40, 0),
(10272, 72, '27.8000', 24, 0),
(10273, 10, '24.8000', 24, 0),
(10273, 31, '10.0000', 15, 0),
(10273, 33, '2.0000', 20, 0),
(10273, 40, '14.7000', 60, 0),
(10273, 76, '14.4000', 33, 0),
(10274, 71, '17.2000', 20, 0),
(10274, 72, '27.8000', 7, 0),
(10275, 24, '3.6000', 12, 0),
(10275, 59, '44.0000', 6, 0),
(10276, 10, '24.8000', 15, 0),
(10276, 13, '4.8000', 10, 0),
(10277, 28, '36.4000', 20, 0),
(10277, 62, '39.4000', 12, 0),
(10278, 44, '15.5000', 16, 0),
(10278, 59, '44.0000', 15, 0),
(10278, 63, '35.1000', 8, 0),
(10278, 73, '12.0000', 25, 0),
(10279, 17, '31.2000', 15, 0),
(10280, 24, '3.6000', 12, 0),
(10280, 55, '19.2000', 20, 0),
(10280, 75, '6.2000', 30, 0),
(10281, 19, '7.3000', 1, 0),
(10281, 24, '3.6000', 6, 0),
(10281, 35, '14.4000', 4, 0),
(10282, 30, '20.7000', 6, 0),
(10282, 57, '15.6000', 2, 0),
(10283, 15, '12.4000', 20, 0),
(10283, 19, '7.3000', 18, 0),
(10283, 60, '27.2000', 35, 0),
(10283, 72, '27.8000', 3, 0),
(10284, 27, '35.1000', 15, 0),
(10284, 44, '15.5000', 21, 0),
(10284, 60, '27.2000', 20, 0),
(10284, 67, '11.2000', 5, 0),
(10285, 1, '14.4000', 45, 0),
(10285, 40, '14.7000', 40, 0),
(10285, 53, '26.2000', 36, 0),
(10286, 35, '14.4000', 100, 0),
(10286, 62, '39.4000', 40, 0),
(10287, 16, '13.9000', 40, 0),
(10287, 34, '11.2000', 20, 0),
(10287, 46, '9.6000', 15, 0),
(10288, 54, '5.9000', 10, 0),
(10288, 68, '10.0000', 3, 0),
(10289, 3, '8.0000', 30, 0),
(10289, 64, '26.6000', 9, 0),
(10290, 5, '17.0000', 20, 0),
(10290, 29, '99.0000', 15, 0),
(10290, 49, '16.0000', 15, 0),
(10290, 77, '10.4000', 10, 0),
(10291, 13, '4.8000', 20, 0),
(10291, 44, '15.5000', 24, 0),
(10291, 51, '42.4000', 2, 0),
(10292, 20, '64.8000', 20, 0),
(10293, 18, '50.0000', 12, 0),
(10293, 24, '3.6000', 10, 0),
(10293, 63, '35.1000', 5, 0),
(10293, 75, '6.2000', 6, 0),
(10294, 1, '14.4000', 18, 0),
(10294, 17, '31.2000', 15, 0),
(10294, 43, '36.8000', 15, 0),
(10294, 60, '27.2000', 21, 0),
(10294, 75, '6.2000', 6, 0),
(10295, 56, '30.4000', 4, 0),
(10296, 11, '16.8000', 12, 0),
(10296, 16, '13.9000', 30, 0),
(10296, 69, '28.8000', 15, 0),
(10297, 39, '14.4000', 60, 0),
(10297, 72, '27.8000', 20, 0),
(10298, 2, '15.2000', 40, 0),
(10298, 36, '15.2000', 40, 0),
(10298, 59, '44.0000', 30, 0),
(10298, 62, '39.4000', 15, 0),
(10299, 19, '7.3000', 15, 0),
(10299, 70, '12.0000', 20, 0),
(10300, 66, '13.6000', 30, 0),
(10300, 68, '10.0000', 20, 0),
(10301, 40, '14.7000', 10, 0),
(10301, 56, '30.4000', 20, 0),
(10302, 17, '31.2000', 40, 0),
(10302, 28, '36.4000', 28, 0),
(10302, 43, '36.8000', 12, 0),
(10303, 40, '14.7000', 40, 0),
(10303, 65, '16.8000', 30, 0),
(10303, 68, '10.0000', 15, 0),
(10304, 49, '16.0000', 30, 0),
(10304, 59, '44.0000', 10, 0),
(10304, 71, '17.2000', 2, 0),
(10305, 18, '50.0000', 25, 0),
(10305, 29, '99.0000', 25, 0),
(10305, 39, '14.4000', 30, 0),
(10306, 30, '20.7000', 10, 0),
(10306, 53, '26.2000', 10, 0),
(10306, 54, '5.9000', 5, 0),
(10307, 62, '39.4000', 10, 0),
(10307, 68, '10.0000', 3, 0),
(10308, 69, '28.8000', 1, 0),
(10308, 70, '12.0000', 5, 0),
(10309, 4, '17.6000', 20, 0),
(10309, 6, '20.0000', 30, 0),
(10309, 42, '11.2000', 2, 0),
(10309, 43, '36.8000', 20, 0),
(10309, 71, '17.2000', 3, 0),
(10310, 16, '13.9000', 10, 0),
(10310, 62, '39.4000', 5, 0),
(10311, 42, '11.2000', 6, 0),
(10311, 69, '28.8000', 7, 0),
(10312, 28, '36.4000', 4, 0),
(10312, 43, '36.8000', 24, 0),
(10312, 53, '26.2000', 20, 0),
(10312, 75, '6.2000', 10, 0),
(10313, 36, '15.2000', 12, 0),
(10314, 32, '25.6000', 40, 0),
(10314, 58, '10.6000', 30, 0),
(10314, 62, '39.4000', 25, 0),
(10315, 34, '11.2000', 14, 0),
(10315, 70, '12.0000', 30, 0),
(10316, 41, '7.7000', 10, 0),
(10316, 62, '39.4000', 70, 0),
(10317, 1, '14.4000', 20, 0),
(10318, 41, '7.7000', 20, 0),
(10318, 76, '14.4000', 6, 0),
(10319, 17, '31.2000', 8, 0),
(10319, 28, '36.4000', 14, 0),
(10319, 76, '14.4000', 30, 0),
(10320, 71, '17.2000', 30, 0),
(10321, 35, '14.4000', 10, 0),
(10322, 52, '5.6000', 20, 0),
(10323, 15, '12.4000', 5, 0),
(10323, 25, '11.2000', 4, 0),
(10323, 39, '14.4000', 4, 0),
(10324, 16, '13.9000', 21, 0),
(10324, 35, '14.4000', 70, 0),
(10324, 46, '9.6000', 30, 0),
(10324, 59, '44.0000', 40, 0),
(10324, 63, '35.1000', 80, 0),
(10325, 6, '20.0000', 6, 0),
(10325, 13, '4.8000', 12, 0),
(10325, 14, '18.6000', 9, 0),
(10325, 31, '10.0000', 4, 0),
(10325, 72, '27.8000', 40, 0),
(10326, 4, '17.6000', 24, 0),
(10326, 57, '15.6000', 16, 0),
(10326, 75, '6.2000', 50, 0),
(10327, 2, '15.2000', 25, 0),
(10327, 11, '16.8000', 50, 0),
(10327, 30, '20.7000', 35, 0),
(10327, 58, '10.6000', 30, 0),
(10328, 59, '44.0000', 9, 0),
(10328, 65, '16.8000', 40, 0),
(10328, 68, '10.0000', 10, 0),
(10329, 19, '7.3000', 10, 0),
(10329, 30, '20.7000', 8, 0),
(10329, 38, '210.8000', 20, 0),
(10329, 56, '30.4000', 12, 0),
(10330, 26, '24.9000', 50, 0),
(10330, 72, '27.8000', 25, 0),
(10331, 54, '5.9000', 15, 0),
(10332, 18, '50.0000', 40, 0),
(10332, 42, '11.2000', 10, 0),
(10332, 47, '7.6000', 16, 0),
(10333, 14, '18.6000', 10, 0),
(10333, 21, '8.0000', 10, 0),
(10333, 71, '17.2000', 40, 0),
(10334, 52, '5.6000', 8, 0),
(10334, 68, '10.0000', 10, 0),
(10335, 2, '15.2000', 7, 0),
(10335, 31, '10.0000', 25, 0),
(10335, 32, '25.6000', 6, 0),
(10335, 51, '42.4000', 48, 0),
(10336, 4, '17.6000', 18, 0),
(10337, 23, '7.2000', 40, 0),
(10337, 26, '24.9000', 24, 0),
(10337, 36, '15.2000', 20, 0),
(10337, 37, '20.8000', 28, 0),
(10337, 72, '27.8000', 25, 0),
(10338, 17, '31.2000', 20, 0),
(10338, 30, '20.7000', 15, 0),
(10339, 4, '17.6000', 10, 0),
(10339, 17, '31.2000', 70, 0),
(10339, 62, '39.4000', 28, 0),
(10340, 18, '50.0000', 20, 0),
(10340, 41, '7.7000', 12, 0),
(10340, 43, '36.8000', 40, 0),
(10341, 33, '2.0000', 8, 0),
(10341, 59, '44.0000', 9, 0),
(10342, 2, '15.2000', 24, 0),
(10342, 31, '10.0000', 56, 0),
(10342, 36, '15.2000', 40, 0),
(10342, 55, '19.2000', 40, 0),
(10343, 64, '26.6000', 50, 0),
(10343, 68, '10.0000', 4, 0),
(10343, 76, '14.4000', 15, 0),
(10344, 4, '17.6000', 35, 0),
(10344, 8, '32.0000', 70, 0),
(10345, 8, '32.0000', 70, 0),
(10345, 19, '7.3000', 80, 0),
(10345, 42, '11.2000', 9, 0),
(10346, 17, '31.2000', 36, 0),
(10346, 56, '30.4000', 20, 0),
(10347, 25, '11.2000', 10, 0),
(10347, 39, '14.4000', 50, 0),
(10347, 40, '14.7000', 4, 0),
(10347, 75, '6.2000', 6, 0),
(10348, 1, '14.4000', 15, 0),
(10348, 23, '7.2000', 25, 0),
(10349, 54, '5.9000', 24, 0),
(10350, 50, '13.0000', 15, 0),
(10350, 69, '28.8000', 18, 0),
(10351, 38, '210.8000', 20, 0),
(10351, 41, '7.7000', 13, 0),
(10351, 44, '15.5000', 77, 0),
(10351, 65, '16.8000', 10, 0),
(10352, 24, '3.6000', 10, 0),
(10352, 54, '5.9000', 20, 0),
(10353, 11, '16.8000', 12, 0),
(10353, 38, '210.8000', 50, 0),
(10354, 1, '14.4000', 12, 0),
(10354, 29, '99.0000', 4, 0),
(10355, 24, '3.6000', 25, 0),
(10355, 57, '15.6000', 25, 0),
(10356, 31, '10.0000', 30, 0),
(10356, 55, '19.2000', 12, 0),
(10356, 69, '28.8000', 20, 0),
(10357, 10, '24.8000', 30, 0),
(10357, 26, '24.9000', 16, 0),
(10357, 60, '27.2000', 8, 0),
(10358, 24, '3.6000', 10, 0),
(10358, 34, '11.2000', 10, 0),
(10358, 36, '15.2000', 20, 0),
(10359, 16, '13.9000', 56, 0),
(10359, 31, '10.0000', 70, 0),
(10359, 60, '27.2000', 80, 0),
(10360, 28, '36.4000', 30, 0),
(10360, 29, '99.0000', 35, 0),
(10360, 38, '210.8000', 10, 0),
(10360, 49, '16.0000', 35, 0),
(10360, 54, '5.9000', 28, 0),
(10361, 39, '14.4000', 54, 0),
(10361, 60, '27.2000', 55, 0),
(10362, 25, '11.2000', 50, 0),
(10362, 51, '42.4000', 20, 0),
(10362, 54, '5.9000', 24, 0),
(10363, 31, '10.0000', 20, 0),
(10363, 75, '6.2000', 12, 0),
(10363, 76, '14.4000', 12, 0),
(10364, 69, '28.8000', 30, 0),
(10364, 71, '17.2000', 5, 0),
(10365, 11, '16.8000', 24, 0),
(10366, 65, '16.8000', 5, 0),
(10366, 77, '10.4000', 5, 0),
(10367, 34, '11.2000', 36, 0),
(10367, 54, '5.9000', 18, 0),
(10367, 65, '16.8000', 15, 0),
(10367, 77, '10.4000', 7, 0),
(10368, 21, '8.0000', 5, 0),
(10368, 28, '36.4000', 13, 0),
(10368, 57, '15.6000', 25, 0),
(10368, 64, '26.6000', 35, 0),
(10369, 29, '99.0000', 20, 0),
(10369, 56, '30.4000', 18, 0),
(10370, 1, '14.4000', 15, 0),
(10370, 64, '26.6000', 30, 0),
(10370, 74, '8.0000', 20, 0),
(10371, 36, '15.2000', 6, 0),
(10372, 20, '64.8000', 12, 0),
(10372, 38, '210.8000', 40, 0),
(10372, 60, '27.2000', 70, 0),
(10372, 72, '27.8000', 42, 0),
(10373, 58, '10.6000', 80, 0),
(10373, 71, '17.2000', 50, 0),
(10374, 31, '10.0000', 30, 0),
(10374, 58, '10.6000', 15, 0),
(10375, 14, '18.6000', 15, 0),
(10375, 54, '5.9000', 10, 0),
(10376, 31, '10.0000', 42, 0),
(10377, 28, '36.4000', 20, 0),
(10377, 39, '14.4000', 20, 0),
(10378, 71, '17.2000', 6, 0),
(10379, 41, '7.7000', 8, 0),
(10379, 63, '35.1000', 16, 0),
(10379, 65, '16.8000', 20, 0),
(10380, 30, '20.7000', 18, 0),
(10380, 53, '26.2000', 20, 0),
(10380, 60, '27.2000', 6, 0),
(10380, 70, '12.0000', 30, 0),
(10381, 74, '8.0000', 14, 0),
(10382, 5, '17.0000', 32, 0),
(10382, 18, '50.0000', 9, 0),
(10382, 29, '99.0000', 14, 0),
(10382, 33, '2.0000', 60, 0),
(10382, 74, '8.0000', 50, 0),
(10383, 13, '4.8000', 20, 0),
(10383, 50, '13.0000', 15, 0),
(10383, 56, '30.4000', 20, 0),
(10384, 20, '64.8000', 28, 0),
(10384, 60, '27.2000', 15, 0),
(10385, 7, '24.0000', 10, 0),
(10385, 60, '27.2000', 20, 0),
(10385, 68, '10.0000', 8, 0),
(10386, 24, '3.6000', 15, 0),
(10386, 34, '11.2000', 10, 0),
(10387, 24, '3.6000', 15, 0),
(10387, 28, '36.4000', 6, 0),
(10387, 59, '44.0000', 12, 0),
(10387, 71, '17.2000', 15, 0),
(10388, 45, '7.6000', 15, 0),
(10388, 52, '5.6000', 20, 0),
(10388, 53, '26.2000', 40, 0),
(10389, 10, '24.8000', 16, 0),
(10389, 55, '19.2000', 15, 0),
(10389, 62, '39.4000', 20, 0),
(10389, 70, '12.0000', 30, 0),
(10390, 31, '10.0000', 60, 0),
(10390, 35, '14.4000', 40, 0),
(10390, 46, '9.6000', 45, 0),
(10390, 72, '27.8000', 24, 0),
(10391, 13, '4.8000', 18, 0),
(10392, 69, '28.8000', 50, 0),
(10393, 2, '15.2000', 25, 0),
(10393, 14, '18.6000', 42, 0),
(10393, 25, '11.2000', 7, 0),
(10393, 26, '24.9000', 70, 0),
(10393, 31, '10.0000', 32, 0),
(10394, 13, '4.8000', 10, 0),
(10394, 62, '39.4000', 10, 0),
(10395, 46, '9.6000', 28, 0),
(10395, 53, '26.2000', 70, 0),
(10395, 69, '28.8000', 8, 0),
(10396, 23, '7.2000', 40, 0),
(10396, 71, '17.2000', 60, 0),
(10396, 72, '27.8000', 21, 0),
(10397, 21, '8.0000', 10, 0),
(10397, 51, '42.4000', 18, 0),
(10398, 35, '14.4000', 30, 0),
(10398, 55, '19.2000', 120, 0),
(10399, 68, '10.0000', 60, 0),
(10399, 71, '17.2000', 30, 0),
(10399, 76, '14.4000', 35, 0),
(10399, 77, '10.4000', 14, 0),
(10400, 29, '99.0000', 21, 0),
(10400, 35, '14.4000', 35, 0),
(10400, 49, '16.0000', 30, 0),
(10401, 30, '20.7000', 18, 0),
(10401, 56, '30.4000', 70, 0),
(10401, 65, '16.8000', 20, 0),
(10401, 71, '17.2000', 60, 0),
(10402, 23, '7.2000', 60, 0),
(10402, 63, '35.1000', 65, 0),
(10403, 16, '13.9000', 21, 0),
(10403, 48, '10.2000', 70, 0),
(10404, 26, '24.9000', 30, 0),
(10404, 42, '11.2000', 40, 0),
(10404, 49, '16.0000', 30, 0),
(10405, 3, '8.0000', 50, 0),
(10406, 1, '14.4000', 10, 0),
(10406, 21, '8.0000', 30, 0),
(10406, 28, '36.4000', 42, 0),
(10406, 36, '15.2000', 5, 0),
(10406, 40, '14.7000', 2, 0),
(10407, 11, '16.8000', 30, 0),
(10407, 69, '28.8000', 15, 0),
(10407, 71, '17.2000', 15, 0),
(10408, 37, '20.8000', 10, 0),
(10408, 54, '5.9000', 6, 0),
(10408, 62, '39.4000', 35, 0),
(10409, 14, '18.6000', 12, 0),
(10409, 21, '8.0000', 12, 0),
(10410, 33, '2.0000', 49, 0),
(10410, 59, '44.0000', 16, 0),
(10411, 41, '7.7000', 25, 0),
(10411, 44, '15.5000', 40, 0),
(10411, 59, '44.0000', 9, 0),
(10412, 14, '18.6000', 20, 0),
(10413, 1, '14.4000', 24, 0),
(10413, 62, '39.4000', 40, 0),
(10413, 76, '14.4000', 14, 0),
(10414, 19, '7.3000', 18, 0),
(10414, 33, '2.0000', 50, 0),
(10415, 17, '31.2000', 2, 0),
(10415, 33, '2.0000', 20, 0),
(10416, 19, '7.3000', 20, 0),
(10416, 53, '26.2000', 10, 0),
(10416, 57, '15.6000', 20, 0),
(10417, 38, '210.8000', 50, 0),
(10417, 46, '9.6000', 2, 0),
(10417, 68, '10.0000', 36, 0),
(10417, 77, '10.4000', 35, 0),
(10418, 2, '15.2000', 60, 0),
(10418, 47, '7.6000', 55, 0),
(10418, 61, '22.8000', 16, 0),
(10418, 74, '8.0000', 15, 0),
(10419, 60, '27.2000', 60, 0),
(10419, 69, '28.8000', 20, 0),
(10420, 9, '77.6000', 20, 0),
(10420, 13, '4.8000', 2, 0),
(10420, 70, '12.0000', 8, 0),
(10420, 73, '12.0000', 20, 0),
(10421, 19, '7.3000', 4, 0),
(10421, 26, '24.9000', 30, 0),
(10421, 53, '26.2000', 15, 0),
(10421, 77, '10.4000', 10, 0),
(10422, 26, '24.9000', 2, 0),
(10423, 31, '10.0000', 14, 0),
(10423, 59, '44.0000', 20, 0),
(10424, 35, '14.4000', 60, 0),
(10424, 38, '210.8000', 49, 0),
(10424, 68, '10.0000', 30, 0),
(10425, 55, '19.2000', 10, 0),
(10425, 76, '14.4000', 20, 0),
(10426, 56, '30.4000', 5, 0),
(10426, 64, '26.6000', 7, 0),
(10427, 14, '18.6000', 35, 0),
(10428, 46, '9.6000', 20, 0),
(10429, 50, '13.0000', 40, 0),
(10429, 63, '35.1000', 35, 0),
(10430, 17, '31.2000', 45, 0),
(10430, 21, '8.0000', 50, 0),
(10430, 56, '30.4000', 30, 0),
(10430, 59, '44.0000', 70, 0),
(10431, 17, '31.2000', 50, 0),
(10431, 40, '14.7000', 50, 0),
(10431, 47, '7.6000', 30, 0),
(10432, 26, '24.9000', 10, 0),
(10432, 54, '5.9000', 40, 0),
(10433, 56, '30.4000', 28, 0),
(10434, 11, '16.8000', 6, 0),
(10434, 76, '14.4000', 18, 0),
(10435, 2, '15.2000', 10, 0),
(10435, 22, '16.8000', 12, 0),
(10435, 72, '27.8000', 10, 0),
(10436, 46, '9.6000', 5, 0),
(10436, 56, '30.4000', 40, 0),
(10436, 64, '26.6000', 30, 0),
(10436, 75, '6.2000', 24, 0),
(10437, 53, '26.2000', 15, 0),
(10438, 19, '7.3000', 15, 0),
(10438, 34, '11.2000', 20, 0),
(10438, 57, '15.6000', 15, 0),
(10439, 12, '30.4000', 15, 0),
(10439, 16, '13.9000', 16, 0),
(10439, 64, '26.6000', 6, 0),
(10439, 74, '8.0000', 30, 0),
(10440, 2, '15.2000', 45, 0),
(10440, 16, '13.9000', 49, 0),
(10440, 29, '99.0000', 24, 0),
(10440, 61, '22.8000', 90, 0),
(10441, 27, '35.1000', 50, 0),
(10442, 11, '16.8000', 30, 0),
(10442, 54, '5.9000', 80, 0),
(10442, 66, '13.6000', 60, 0),
(10443, 11, '16.8000', 6, 0),
(10443, 28, '36.4000', 12, 0),
(10444, 17, '31.2000', 10, 0),
(10444, 26, '24.9000', 15, 0),
(10444, 35, '14.4000', 8, 0),
(10444, 41, '7.7000', 30, 0),
(10445, 39, '14.4000', 6, 0),
(10445, 54, '5.9000', 15, 0),
(10446, 19, '7.3000', 12, 0),
(10446, 24, '3.6000', 20, 0),
(10446, 31, '10.0000', 3, 0),
(10446, 52, '5.6000', 15, 0),
(10447, 19, '7.3000', 40, 0),
(10447, 65, '16.8000', 35, 0),
(10447, 71, '17.2000', 2, 0),
(10448, 26, '24.9000', 6, 0),
(10448, 40, '14.7000', 20, 0),
(10449, 10, '24.8000', 14, 0),
(10449, 52, '5.6000', 20, 0),
(10449, 62, '39.4000', 35, 0),
(10450, 10, '24.8000', 20, 0),
(10450, 54, '5.9000', 6, 0),
(10451, 55, '19.2000', 120, 0),
(10451, 64, '26.6000', 35, 0),
(10451, 65, '16.8000', 28, 0),
(10451, 77, '10.4000', 55, 0),
(10452, 28, '36.4000', 15, 0),
(10452, 44, '15.5000', 100, 0),
(10453, 48, '10.2000', 15, 0),
(10453, 70, '12.0000', 25, 0),
(10454, 16, '13.9000', 20, 0),
(10454, 33, '2.0000', 20, 0),
(10454, 46, '9.6000', 10, 0),
(10455, 39, '14.4000', 20, 0),
(10455, 53, '26.2000', 50, 0),
(10455, 61, '22.8000', 25, 0),
(10455, 71, '17.2000', 30, 0),
(10456, 21, '8.0000', 40, 0),
(10456, 49, '16.0000', 21, 0),
(10457, 59, '44.0000', 36, 0),
(10458, 26, '24.9000', 30, 0),
(10458, 28, '36.4000', 30, 0),
(10458, 43, '36.8000', 20, 0),
(10458, 56, '30.4000', 15, 0),
(10458, 71, '17.2000', 50, 0),
(10459, 7, '24.0000', 16, 0),
(10459, 46, '9.6000', 20, 0),
(10459, 72, '27.8000', 40, 0),
(10460, 68, '10.0000', 21, 0),
(10460, 75, '6.2000', 4, 0),
(10461, 21, '8.0000', 40, 0),
(10461, 30, '20.7000', 28, 0),
(10461, 55, '19.2000', 60, 0),
(10462, 13, '4.8000', 1, 0),
(10462, 23, '7.2000', 21, 0),
(10463, 19, '7.3000', 21, 0),
(10463, 42, '11.2000', 50, 0),
(10464, 4, '17.6000', 16, 0),
(10464, 43, '36.8000', 3, 0),
(10464, 56, '30.4000', 30, 0),
(10464, 60, '27.2000', 20, 0),
(10465, 24, '3.6000', 25, 0),
(10465, 29, '99.0000', 18, 0),
(10465, 40, '14.7000', 20, 0),
(10465, 45, '7.6000', 30, 0),
(10465, 50, '13.0000', 25, 0),
(10466, 11, '16.8000', 10, 0),
(10466, 46, '9.6000', 5, 0),
(10467, 24, '3.6000', 28, 0),
(10467, 25, '11.2000', 12, 0),
(10468, 30, '20.7000', 8, 0),
(10468, 43, '36.8000', 15, 0),
(10469, 2, '15.2000', 40, 0),
(10469, 16, '13.9000', 35, 0),
(10469, 44, '15.5000', 2, 0),
(10470, 18, '50.0000', 30, 0),
(10470, 23, '7.2000', 15, 0),
(10470, 64, '26.6000', 8, 0),
(10471, 7, '24.0000', 30, 0),
(10471, 56, '30.4000', 20, 0),
(10472, 24, '3.6000', 80, 0),
(10472, 51, '42.4000', 18, 0),
(10473, 33, '2.0000', 12, 0),
(10473, 71, '17.2000', 12, 0),
(10474, 14, '18.6000', 12, 0),
(10474, 28, '36.4000', 18, 0),
(10474, 40, '14.7000', 21, 0),
(10474, 75, '6.2000', 10, 0),
(10475, 31, '10.0000', 35, 0),
(10475, 66, '13.6000', 60, 0),
(10475, 76, '14.4000', 42, 0),
(10476, 55, '19.2000', 2, 0),
(10476, 70, '12.0000', 12, 0),
(10477, 1, '14.4000', 15, 0),
(10477, 21, '8.0000', 21, 0),
(10477, 39, '14.4000', 20, 0),
(10478, 10, '24.8000', 20, 0),
(10479, 38, '210.8000', 30, 0),
(10479, 53, '26.2000', 28, 0),
(10479, 59, '44.0000', 60, 0),
(10479, 64, '26.6000', 30, 0),
(10480, 47, '7.6000', 30, 0),
(10480, 59, '44.0000', 12, 0),
(10481, 49, '16.0000', 24, 0),
(10481, 60, '27.2000', 40, 0),
(10482, 40, '14.7000', 10, 0),
(10483, 34, '11.2000', 35, 0),
(10483, 77, '10.4000', 30, 0),
(10484, 21, '8.0000', 14, 0),
(10484, 40, '14.7000', 10, 0),
(10484, 51, '42.4000', 3, 0),
(10485, 2, '15.2000', 20, 0),
(10485, 3, '8.0000', 20, 0),
(10485, 55, '19.2000', 30, 0),
(10485, 70, '12.0000', 60, 0),
(10486, 11, '16.8000', 5, 0),
(10486, 51, '42.4000', 25, 0),
(10486, 74, '8.0000', 16, 0),
(10487, 19, '7.3000', 5, 0),
(10487, 26, '24.9000', 30, 0),
(10487, 54, '5.9000', 24, 0),
(10488, 59, '44.0000', 30, 0),
(10488, 73, '12.0000', 20, 0),
(10489, 11, '16.8000', 15, 0),
(10489, 16, '13.9000', 18, 0),
(10490, 59, '44.0000', 60, 0),
(10490, 68, '10.0000', 30, 0),
(10490, 75, '6.2000', 36, 0),
(10491, 44, '15.5000', 15, 0),
(10491, 77, '10.4000', 7, 0),
(10492, 25, '11.2000', 60, 0),
(10492, 42, '11.2000', 20, 0),
(10493, 65, '16.8000', 15, 0),
(10493, 66, '13.6000', 10, 0),
(10493, 69, '28.8000', 10, 0),
(10494, 56, '30.4000', 30, 0),
(10495, 23, '7.2000', 10, 0),
(10495, 41, '7.7000', 20, 0),
(10495, 77, '10.4000', 5, 0),
(10496, 31, '10.0000', 20, 0),
(10497, 56, '30.4000', 14, 0),
(10497, 72, '27.8000', 25, 0),
(10497, 77, '10.4000', 25, 0),
(10498, 24, '4.5000', 14, 0),
(10498, 40, '18.4000', 5, 0),
(10498, 42, '14.0000', 30, 0),
(10499, 28, '45.6000', 20, 0),
(10499, 49, '20.0000', 25, 0),
(10500, 15, '15.5000', 12, 0),
(10500, 28, '45.6000', 8, 0),
(10501, 54, '7.4500', 20, 0),
(10502, 45, '9.5000', 21, 0),
(10502, 53, '32.8000', 6, 0),
(10502, 67, '14.0000', 30, 0),
(10503, 14, '23.2500', 70, 0),
(10503, 65, '21.0500', 20, 0),
(10504, 2, '19.0000', 12, 0),
(10504, 21, '10.0000', 12, 0),
(10504, 53, '32.8000', 10, 0),
(10504, 61, '28.5000', 25, 0),
(10505, 62, '49.3000', 3, 0),
(10506, 25, '14.0000', 18, 0),
(10506, 70, '15.0000', 14, 0),
(10507, 43, '46.0000', 15, 0),
(10507, 48, '12.7500', 15, 0),
(10508, 13, '6.0000', 10, 0),
(10508, 39, '18.0000', 10, 0),
(10509, 28, '45.6000', 3, 0),
(10510, 29, '123.7900', 36, 0),
(10510, 75, '7.7500', 36, 0),
(10511, 4, '22.0000', 50, 0),
(10511, 7, '30.0000', 50, 0),
(10511, 8, '40.0000', 10, 0),
(10512, 24, '4.5000', 10, 0),
(10512, 46, '12.0000', 9, 0),
(10512, 47, '9.5000', 6, 0),
(10512, 60, '34.0000', 12, 0),
(10513, 21, '10.0000', 40, 0),
(10513, 32, '32.0000', 50, 0),
(10513, 61, '28.5000', 15, 0),
(10514, 20, '81.0000', 39, 0),
(10514, 28, '45.6000', 35, 0),
(10514, 56, '38.0000', 70, 0),
(10514, 65, '21.0500', 39, 0),
(10514, 75, '7.7500', 50, 0),
(10515, 9, '97.0000', 16, 0),
(10515, 16, '17.4500', 50, 0),
(10515, 27, '43.9000', 120, 0),
(10515, 33, '2.5000', 16, 0),
(10515, 60, '34.0000', 84, 0),
(10516, 18, '62.5000', 25, 0),
(10516, 41, '9.6500', 80, 0),
(10516, 42, '14.0000', 20, 0),
(10517, 52, '7.0000', 6, 0),
(10517, 59, '55.0000', 4, 0),
(10517, 70, '15.0000', 6, 0),
(10518, 24, '4.5000', 5, 0),
(10518, 38, '263.5000', 15, 0),
(10518, 44, '19.4500', 9, 0),
(10519, 10, '31.0000', 16, 0),
(10519, 56, '38.0000', 40, 0),
(10519, 60, '34.0000', 10, 0),
(10520, 24, '4.5000', 8, 0),
(10520, 53, '32.8000', 5, 0),
(10521, 35, '18.0000', 3, 0),
(10521, 41, '9.6500', 10, 0),
(10521, 68, '12.5000', 6, 0),
(10522, 1, '18.0000', 40, 0),
(10522, 8, '40.0000', 24, 0),
(10522, 30, '25.8900', 20, 0),
(10522, 40, '18.4000', 25, 0),
(10523, 17, '39.0000', 25, 0),
(10523, 20, '81.0000', 15, 0),
(10523, 37, '26.0000', 18, 0),
(10523, 41, '9.6500', 6, 0),
(10524, 10, '31.0000', 2, 0),
(10524, 30, '25.8900', 10, 0),
(10524, 43, '46.0000', 60, 0),
(10524, 54, '7.4500', 15, 0),
(10525, 36, '19.0000', 30, 0),
(10525, 40, '18.4000', 15, 0),
(10526, 1, '18.0000', 8, 0),
(10526, 13, '6.0000', 10, 0),
(10526, 56, '38.0000', 30, 0),
(10527, 4, '22.0000', 50, 0),
(10527, 36, '19.0000', 30, 0),
(10528, 11, '21.0000', 3, 0),
(10528, 33, '2.5000', 8, 0),
(10528, 72, '34.8000', 9, 0),
(10529, 55, '24.0000', 14, 0),
(10529, 68, '12.5000', 20, 0),
(10529, 69, '36.0000', 10, 0),
(10530, 17, '39.0000', 40, 0),
(10530, 43, '46.0000', 25, 0),
(10530, 61, '28.5000', 20, 0),
(10530, 76, '18.0000', 50, 0),
(10531, 59, '55.0000', 2, 0),
(10532, 30, '25.8900', 15, 0),
(10532, 66, '17.0000', 24, 0),
(10533, 4, '22.0000', 50, 0),
(10533, 72, '34.8000', 24, 0),
(10533, 73, '15.0000', 24, 0),
(10534, 30, '25.8900', 10, 0),
(10534, 40, '18.4000', 10, 0),
(10534, 54, '7.4500', 10, 0),
(10535, 11, '21.0000', 50, 0),
(10535, 40, '18.4000', 10, 0),
(10535, 57, '19.5000', 5, 0),
(10535, 59, '55.0000', 15, 0),
(10536, 12, '38.0000', 15, 0),
(10536, 31, '12.5000', 20, 0),
(10536, 33, '2.5000', 30, 0),
(10536, 60, '34.0000', 35, 0),
(10537, 31, '12.5000', 30, 0),
(10537, 51, '53.0000', 6, 0),
(10537, 58, '13.2500', 20, 0),
(10537, 72, '34.8000', 21, 0),
(10537, 73, '15.0000', 9, 0),
(10538, 70, '15.0000', 7, 0),
(10538, 72, '34.8000', 1, 0),
(10539, 13, '6.0000', 8, 0),
(10539, 21, '10.0000', 15, 0),
(10539, 33, '2.5000', 15, 0),
(10539, 49, '20.0000', 6, 0),
(10540, 3, '10.0000', 60, 0),
(10540, 26, '31.2300', 40, 0),
(10540, 38, '263.5000', 30, 0),
(10540, 68, '12.5000', 35, 0),
(10541, 24, '4.5000', 35, 0),
(10541, 38, '263.5000', 4, 0),
(10541, 65, '21.0500', 36, 0),
(10541, 71, '21.5000', 9, 0),
(10542, 11, '21.0000', 15, 0),
(10542, 54, '7.4500', 24, 0),
(10543, 12, '38.0000', 30, 0),
(10543, 23, '9.0000', 70, 0),
(10544, 28, '45.6000', 7, 0),
(10544, 67, '14.0000', 7, 0),
(10545, 11, '21.0000', 10, 0),
(10546, 7, '30.0000', 10, 0),
(10546, 35, '18.0000', 30, 0),
(10546, 62, '49.3000', 40, 0),
(10547, 32, '32.0000', 24, 0),
(10547, 36, '19.0000', 60, 0),
(10548, 34, '14.0000', 10, 0),
(10548, 41, '9.6500', 14, 0),
(10549, 31, '12.5000', 55, 0),
(10549, 45, '9.5000', 100, 0),
(10549, 51, '53.0000', 48, 0),
(10550, 17, '39.0000', 8, 0),
(10550, 19, '9.2000', 10, 0),
(10550, 21, '10.0000', 6, 0),
(10550, 61, '28.5000', 10, 0),
(10551, 16, '17.4500', 40, 0),
(10551, 35, '18.0000', 20, 0),
(10551, 44, '19.4500', 40, 0),
(10552, 69, '36.0000', 18, 0),
(10552, 75, '7.7500', 30, 0),
(10553, 11, '21.0000', 15, 0),
(10553, 16, '17.4500', 14, 0),
(10553, 22, '21.0000', 24, 0),
(10553, 31, '12.5000', 30, 0),
(10553, 35, '18.0000', 6, 0),
(10554, 16, '17.4500', 30, 0),
(10554, 23, '9.0000', 20, 0),
(10554, 62, '49.3000', 20, 0),
(10554, 77, '13.0000', 10, 0),
(10555, 14, '23.2500', 30, 0),
(10555, 19, '9.2000', 35, 0),
(10555, 24, '4.5000', 18, 0),
(10555, 51, '53.0000', 20, 0),
(10555, 56, '38.0000', 40, 0),
(10556, 72, '34.8000', 24, 0),
(10557, 64, '33.2500', 30, 0),
(10557, 75, '7.7500', 20, 0),
(10558, 47, '9.5000', 25, 0),
(10558, 51, '53.0000', 20, 0),
(10558, 52, '7.0000', 30, 0),
(10558, 53, '32.8000', 18, 0),
(10558, 73, '15.0000', 3, 0),
(10559, 41, '9.6500', 12, 0),
(10559, 55, '24.0000', 18, 0),
(10560, 30, '25.8900', 20, 0),
(10560, 62, '49.3000', 15, 0),
(10561, 44, '19.4500', 10, 0),
(10561, 51, '53.0000', 50, 0),
(10562, 33, '2.5000', 20, 0),
(10562, 62, '49.3000', 10, 0),
(10563, 36, '19.0000', 25, 0),
(10563, 52, '7.0000', 70, 0),
(10564, 17, '39.0000', 16, 0),
(10564, 31, '12.5000', 6, 0),
(10564, 55, '24.0000', 25, 0),
(10565, 24, '4.5000', 25, 0),
(10565, 64, '33.2500', 18, 0),
(10566, 11, '21.0000', 35, 0),
(10566, 18, '62.5000', 18, 0),
(10566, 76, '18.0000', 10, 0),
(10567, 31, '12.5000', 60, 0),
(10567, 51, '53.0000', 3, 0),
(10567, 59, '55.0000', 40, 0),
(10568, 10, '31.0000', 5, 0),
(10569, 31, '12.5000', 35, 0),
(10569, 76, '18.0000', 30, 0),
(10570, 11, '21.0000', 15, 0),
(10570, 56, '38.0000', 60, 0),
(10571, 14, '23.2500', 11, 0),
(10571, 42, '14.0000', 28, 0),
(10572, 16, '17.4500', 12, 0),
(10572, 32, '32.0000', 10, 0),
(10572, 40, '18.4000', 50, 0),
(10572, 75, '7.7500', 15, 0),
(10573, 17, '39.0000', 18, 0),
(10573, 34, '14.0000', 40, 0),
(10573, 53, '32.8000', 25, 0),
(10574, 33, '2.5000', 14, 0),
(10574, 40, '18.4000', 2, 0),
(10574, 62, '49.3000', 10, 0),
(10574, 64, '33.2500', 6, 0),
(10575, 59, '55.0000', 12, 0),
(10575, 63, '43.9000', 6, 0),
(10575, 72, '34.8000', 30, 0),
(10575, 76, '18.0000', 10, 0),
(10576, 1, '18.0000', 10, 0),
(10576, 31, '12.5000', 20, 0),
(10576, 44, '19.4500', 21, 0),
(10577, 39, '18.0000', 10, 0),
(10577, 75, '7.7500', 20, 0),
(10577, 77, '13.0000', 18, 0),
(10578, 35, '18.0000', 20, 0),
(10578, 57, '19.5000', 6, 0),
(10579, 15, '15.5000', 10, 0),
(10579, 75, '7.7500', 21, 0),
(10580, 14, '23.2500', 15, 0),
(10580, 41, '9.6500', 9, 0),
(10580, 65, '21.0500', 30, 0),
(10581, 75, '7.7500', 50, 0),
(10582, 57, '19.5000', 4, 0),
(10582, 76, '18.0000', 14, 0),
(10583, 29, '123.7900', 10, 0),
(10583, 60, '34.0000', 24, 0),
(10583, 69, '36.0000', 10, 0),
(10584, 31, '12.5000', 50, 0),
(10585, 47, '9.5000', 15, 0),
(10586, 52, '7.0000', 4, 0),
(10587, 26, '31.2300', 6, 0),
(10587, 35, '18.0000', 20, 0),
(10587, 77, '13.0000', 20, 0),
(10588, 18, '62.5000', 40, 0),
(10588, 42, '14.0000', 100, 0),
(10589, 35, '18.0000', 4, 0),
(10590, 1, '18.0000', 20, 0),
(10590, 77, '13.0000', 60, 0),
(10591, 3, '10.0000', 14, 0),
(10591, 7, '30.0000', 10, 0),
(10591, 54, '7.4500', 50, 0),
(10592, 15, '15.5000', 25, 0),
(10592, 26, '31.2300', 5, 0),
(10593, 20, '81.0000', 21, 0),
(10593, 69, '36.0000', 20, 0),
(10593, 76, '18.0000', 4, 0),
(10594, 52, '7.0000', 24, 0),
(10594, 58, '13.2500', 30, 0),
(10595, 35, '18.0000', 30, 0),
(10595, 61, '28.5000', 120, 0),
(10595, 69, '36.0000', 65, 0),
(10596, 56, '38.0000', 5, 0),
(10596, 63, '43.9000', 24, 0),
(10596, 75, '7.7500', 30, 0),
(10597, 24, '4.5000', 35, 0),
(10597, 57, '19.5000', 20, 0),
(10597, 65, '21.0500', 12, 0),
(10598, 27, '43.9000', 50, 0),
(10598, 71, '21.5000', 9, 0),
(10599, 62, '49.3000', 10, 0),
(10600, 54, '7.4500', 4, 0),
(10600, 73, '15.0000', 30, 0),
(10601, 13, '6.0000', 60, 0),
(10601, 59, '55.0000', 35, 0),
(10602, 77, '13.0000', 5, 0),
(10603, 22, '21.0000', 48, 0),
(10603, 49, '20.0000', 25, 0),
(10604, 48, '12.7500', 6, 0),
(10604, 76, '18.0000', 10, 0),
(10605, 16, '17.4500', 30, 0),
(10605, 59, '55.0000', 20, 0),
(10605, 60, '34.0000', 70, 0),
(10605, 71, '21.5000', 15, 0),
(10606, 4, '22.0000', 20, 0),
(10606, 55, '24.0000', 20, 0),
(10606, 62, '49.3000', 10, 0),
(10607, 7, '30.0000', 45, 0),
(10607, 17, '39.0000', 100, 0),
(10607, 33, '2.5000', 14, 0),
(10607, 40, '18.4000', 42, 0),
(10607, 72, '34.8000', 12, 0),
(10608, 56, '38.0000', 28, 0),
(10609, 1, '18.0000', 3, 0),
(10609, 10, '31.0000', 10, 0),
(10609, 21, '10.0000', 6, 0),
(10610, 36, '19.0000', 21, 0),
(10611, 1, '18.0000', 6, 0),
(10611, 2, '19.0000', 10, 0),
(10611, 60, '34.0000', 15, 0),
(10612, 10, '31.0000', 70, 0),
(10612, 36, '19.0000', 55, 0),
(10612, 49, '20.0000', 18, 0),
(10612, 60, '34.0000', 40, 0),
(10612, 76, '18.0000', 80, 0),
(10613, 13, '6.0000', 8, 0),
(10613, 75, '7.7500', 40, 0),
(10614, 11, '21.0000', 14, 0),
(10614, 21, '10.0000', 8, 0),
(10614, 39, '18.0000', 5, 0),
(10615, 55, '24.0000', 5, 0),
(10616, 38, '263.5000', 15, 0),
(10616, 56, '38.0000', 14, 0),
(10616, 70, '15.0000', 15, 0),
(10616, 71, '21.5000', 15, 0),
(10617, 59, '55.0000', 30, 0),
(10618, 6, '25.0000', 70, 0),
(10618, 56, '38.0000', 20, 0),
(10618, 68, '12.5000', 15, 0),
(10619, 21, '10.0000', 42, 0),
(10619, 22, '21.0000', 40, 0),
(10620, 24, '4.5000', 5, 0),
(10620, 52, '7.0000', 5, 0),
(10621, 19, '9.2000', 5, 0),
(10621, 23, '9.0000', 10, 0),
(10621, 70, '15.0000', 20, 0),
(10621, 71, '21.5000', 15, 0),
(10622, 2, '19.0000', 20, 0),
(10622, 68, '12.5000', 18, 0),
(10623, 14, '23.2500', 21, 0),
(10623, 19, '9.2000', 15, 0),
(10623, 21, '10.0000', 25, 0),
(10623, 24, '4.5000', 3, 0),
(10623, 35, '18.0000', 30, 0),
(10624, 28, '45.6000', 10, 0),
(10624, 29, '123.7900', 6, 0),
(10624, 44, '19.4500', 10, 0),
(10625, 14, '23.2500', 3, 0),
(10625, 42, '14.0000', 5, 0),
(10625, 60, '34.0000', 10, 0),
(10626, 53, '32.8000', 12, 0),
(10626, 60, '34.0000', 20, 0),
(10626, 71, '21.5000', 20, 0),
(10627, 62, '49.3000', 15, 0),
(10627, 73, '15.0000', 35, 0),
(10628, 1, '18.0000', 25, 0),
(10629, 29, '123.7900', 20, 0),
(10629, 64, '33.2500', 9, 0),
(10630, 55, '24.0000', 12, 0),
(10630, 76, '18.0000', 35, 0),
(10631, 75, '7.7500', 8, 0),
(10632, 2, '19.0000', 30, 0),
(10632, 33, '2.5000', 20, 0),
(10633, 12, '38.0000', 36, 0),
(10633, 13, '6.0000', 13, 0),
(10633, 26, '31.2300', 35, 0),
(10633, 62, '49.3000', 80, 0),
(10634, 7, '30.0000', 35, 0),
(10634, 18, '62.5000', 50, 0),
(10634, 51, '53.0000', 15, 0),
(10634, 75, '7.7500', 2, 0),
(10635, 4, '22.0000', 10, 0),
(10635, 5, '21.3500', 15, 0),
(10635, 22, '21.0000', 40, 0),
(10636, 4, '22.0000', 25, 0),
(10636, 58, '13.2500', 6, 0),
(10637, 11, '21.0000', 10, 0),
(10637, 50, '16.2500', 25, 0),
(10637, 56, '38.0000', 60, 0),
(10638, 45, '9.5000', 20, 0),
(10638, 65, '21.0500', 21, 0),
(10638, 72, '34.8000', 60, 0),
(10639, 18, '62.5000', 8, 0),
(10640, 69, '36.0000', 20, 0),
(10640, 70, '15.0000', 15, 0),
(10641, 2, '19.0000', 50, 0),
(10641, 40, '18.4000', 60, 0),
(10642, 21, '10.0000', 30, 0),
(10642, 61, '28.5000', 20, 0),
(10643, 28, '45.6000', 15, 0),
(10643, 39, '18.0000', 21, 0),
(10643, 46, '12.0000', 2, 0),
(10644, 18, '62.5000', 4, 0),
(10644, 43, '46.0000', 20, 0),
(10644, 46, '12.0000', 21, 0),
(10645, 18, '62.5000', 20, 0),
(10645, 36, '19.0000', 15, 0),
(10646, 1, '18.0000', 15, 0),
(10646, 10, '31.0000', 18, 0),
(10646, 71, '21.5000', 30, 0),
(10646, 77, '13.0000', 35, 0),
(10647, 19, '9.2000', 30, 0),
(10647, 39, '18.0000', 20, 0),
(10648, 22, '21.0000', 15, 0),
(10648, 24, '4.5000', 15, 0),
(10649, 28, '45.6000', 20, 0),
(10649, 72, '34.8000', 15, 0),
(10650, 30, '25.8900', 30, 0),
(10650, 53, '32.8000', 25, 0),
(10650, 54, '7.4500', 30, 0),
(10651, 19, '9.2000', 12, 0),
(10651, 22, '21.0000', 20, 0),
(10652, 30, '25.8900', 2, 0),
(10652, 42, '14.0000', 20, 0),
(10653, 16, '17.4500', 30, 0),
(10653, 60, '34.0000', 20, 0),
(10654, 4, '22.0000', 12, 0),
(10654, 39, '18.0000', 20, 0),
(10654, 54, '7.4500', 6, 0),
(10655, 41, '9.6500', 20, 0),
(10656, 14, '23.2500', 3, 0),
(10656, 44, '19.4500', 28, 0),
(10656, 47, '9.5000', 6, 0),
(10657, 15, '15.5000', 50, 0),
(10657, 41, '9.6500', 24, 0),
(10657, 46, '12.0000', 45, 0),
(10657, 47, '9.5000', 10, 0),
(10657, 56, '38.0000', 45, 0),
(10657, 60, '34.0000', 30, 0),
(10658, 21, '10.0000', 60, 0),
(10658, 40, '18.4000', 70, 0),
(10658, 60, '34.0000', 55, 0),
(10658, 77, '13.0000', 70, 0),
(10659, 31, '12.5000', 20, 0),
(10659, 40, '18.4000', 24, 0),
(10659, 70, '15.0000', 40, 0),
(10660, 20, '81.0000', 21, 0),
(10661, 39, '18.0000', 3, 0),
(10661, 58, '13.2500', 49, 0),
(10662, 68, '12.5000', 10, 0),
(10663, 40, '18.4000', 30, 0),
(10663, 42, '14.0000', 30, 0),
(10663, 51, '53.0000', 20, 0),
(10664, 10, '31.0000', 24, 0),
(10664, 56, '38.0000', 12, 0),
(10664, 65, '21.0500', 15, 0),
(10665, 51, '53.0000', 20, 0),
(10665, 59, '55.0000', 1, 0),
(10665, 76, '18.0000', 10, 0),
(10666, 29, '123.7900', 36, 0),
(10666, 65, '21.0500', 10, 0),
(10667, 69, '36.0000', 45, 0),
(10667, 71, '21.5000', 14, 0),
(10668, 31, '12.5000', 8, 0),
(10668, 55, '24.0000', 4, 0),
(10668, 64, '33.2500', 15, 0),
(10669, 36, '19.0000', 30, 0),
(10670, 23, '9.0000', 32, 0),
(10670, 46, '12.0000', 60, 0),
(10670, 67, '14.0000', 25, 0),
(10670, 73, '15.0000', 50, 0),
(10670, 75, '7.7500', 25, 0),
(10671, 16, '17.4500', 10, 0),
(10671, 62, '49.3000', 10, 0),
(10671, 65, '21.0500', 12, 0),
(10672, 38, '263.5000', 15, 0),
(10672, 71, '21.5000', 12, 0),
(10673, 16, '17.4500', 3, 0),
(10673, 42, '14.0000', 6, 0),
(10673, 43, '46.0000', 6, 0),
(10674, 23, '9.0000', 5, 0),
(10675, 14, '23.2500', 30, 0),
(10675, 53, '32.8000', 10, 0),
(10675, 58, '13.2500', 30, 0),
(10676, 10, '31.0000', 2, 0),
(10676, 19, '9.2000', 7, 0),
(10676, 44, '19.4500', 21, 0),
(10677, 26, '31.2300', 30, 0),
(10677, 33, '2.5000', 8, 0),
(10678, 12, '38.0000', 100, 0),
(10678, 33, '2.5000', 30, 0),
(10678, 41, '9.6500', 120, 0),
(10678, 54, '7.4500', 30, 0),
(10679, 59, '55.0000', 12, 0),
(10680, 16, '17.4500', 50, 0),
(10680, 31, '12.5000', 20, 0),
(10680, 42, '14.0000', 40, 0),
(10681, 19, '9.2000', 30, 0),
(10681, 21, '10.0000', 12, 0),
(10681, 64, '33.2500', 28, 0),
(10682, 33, '2.5000', 30, 0),
(10682, 66, '17.0000', 4, 0),
(10682, 75, '7.7500', 30, 0),
(10683, 52, '7.0000', 9, 0),
(10684, 40, '18.4000', 20, 0),
(10684, 47, '9.5000', 40, 0),
(10684, 60, '34.0000', 30, 0),
(10685, 10, '31.0000', 20, 0),
(10685, 41, '9.6500', 4, 0),
(10685, 47, '9.5000', 15, 0),
(10686, 17, '39.0000', 30, 0),
(10686, 26, '31.2300', 15, 0),
(10687, 9, '97.0000', 50, 0),
(10687, 29, '123.7900', 10, 0),
(10687, 36, '19.0000', 6, 0),
(10688, 10, '31.0000', 18, 0),
(10688, 28, '45.6000', 60, 0),
(10688, 34, '14.0000', 14, 0),
(10689, 1, '18.0000', 35, 0),
(10690, 56, '38.0000', 20, 0),
(10690, 77, '13.0000', 30, 0),
(10691, 1, '18.0000', 30, 0),
(10691, 29, '123.7900', 40, 0),
(10691, 43, '46.0000', 40, 0),
(10691, 44, '19.4500', 24, 0),
(10691, 62, '49.3000', 48, 0),
(10692, 63, '43.9000', 20, 0),
(10693, 9, '97.0000', 6, 0),
(10693, 54, '7.4500', 60, 0),
(10693, 69, '36.0000', 30, 0),
(10693, 73, '15.0000', 15, 0),
(10694, 7, '30.0000', 90, 0),
(10694, 59, '55.0000', 25, 0),
(10694, 70, '15.0000', 50, 0),
(10695, 8, '40.0000', 10, 0),
(10695, 12, '38.0000', 4, 0),
(10695, 24, '4.5000', 20, 0),
(10696, 17, '39.0000', 20, 0),
(10696, 46, '12.0000', 18, 0),
(10697, 19, '9.2000', 7, 0),
(10697, 35, '18.0000', 9, 0),
(10697, 58, '13.2500', 30, 0),
(10697, 70, '15.0000', 30, 0),
(10698, 11, '21.0000', 15, 0),
(10698, 17, '39.0000', 8, 0),
(10698, 29, '123.7900', 12, 0),
(10698, 65, '21.0500', 65, 0),
(10698, 70, '15.0000', 8, 0),
(10699, 47, '9.5000', 12, 0),
(10700, 1, '18.0000', 5, 0),
(10700, 34, '14.0000', 12, 0),
(10700, 68, '12.5000', 40, 0),
(10700, 71, '21.5000', 60, 0),
(10701, 59, '55.0000', 42, 0),
(10701, 71, '21.5000', 20, 0),
(10701, 76, '18.0000', 35, 0),
(10702, 3, '10.0000', 6, 0),
(10702, 76, '18.0000', 15, 0),
(10703, 2, '19.0000', 5, 0),
(10703, 59, '55.0000', 35, 0),
(10703, 73, '15.0000', 35, 0),
(10704, 4, '22.0000', 6, 0),
(10704, 24, '4.5000', 35, 0),
(10704, 48, '12.7500', 24, 0),
(10705, 31, '12.5000', 20, 0),
(10705, 32, '32.0000', 4, 0),
(10706, 16, '17.4500', 20, 0),
(10706, 43, '46.0000', 24, 0),
(10706, 59, '55.0000', 8, 0),
(10707, 55, '24.0000', 21, 0),
(10707, 57, '19.5000', 40, 0),
(10707, 70, '15.0000', 28, 0),
(10708, 5, '21.3500', 4, 0),
(10708, 36, '19.0000', 5, 0),
(10709, 8, '40.0000', 40, 0),
(10709, 51, '53.0000', 28, 0),
(10709, 60, '34.0000', 10, 0),
(10710, 19, '9.2000', 5, 0),
(10710, 47, '9.5000', 5, 0),
(10711, 19, '9.2000', 12, 0),
(10711, 41, '9.6500', 42, 0),
(10711, 53, '32.8000', 120, 0),
(10712, 53, '32.8000', 3, 0),
(10712, 56, '38.0000', 30, 0),
(10713, 10, '31.0000', 18, 0),
(10713, 26, '31.2300', 30, 0),
(10713, 45, '9.5000', 110, 0),
(10713, 46, '12.0000', 24, 0),
(10714, 2, '19.0000', 30, 0),
(10714, 17, '39.0000', 27, 0),
(10714, 47, '9.5000', 50, 0),
(10714, 56, '38.0000', 18, 0),
(10714, 58, '13.2500', 12, 0),
(10715, 10, '31.0000', 21, 0),
(10715, 71, '21.5000', 30, 0),
(10716, 21, '10.0000', 5, 0),
(10716, 51, '53.0000', 7, 0),
(10716, 61, '28.5000', 10, 0),
(10717, 21, '10.0000', 32, 0),
(10717, 54, '7.4500', 15, 0),
(10717, 69, '36.0000', 25, 0),
(10718, 12, '38.0000', 36, 0),
(10718, 16, '17.4500', 20, 0),
(10718, 36, '19.0000', 40, 0),
(10718, 62, '49.3000', 20, 0),
(10719, 18, '62.5000', 12, 0),
(10719, 30, '25.8900', 3, 0),
(10719, 54, '7.4500', 40, 0),
(10720, 35, '18.0000', 21, 0),
(10720, 71, '21.5000', 8, 0),
(10721, 44, '19.4500', 50, 0),
(10722, 2, '19.0000', 3, 0),
(10722, 31, '12.5000', 50, 0),
(10722, 68, '12.5000', 45, 0),
(10722, 75, '7.7500', 42, 0),
(10723, 26, '31.2300', 15, 0),
(10724, 10, '31.0000', 16, 0),
(10724, 61, '28.5000', 5, 0),
(10725, 41, '9.6500', 12, 0),
(10725, 52, '7.0000', 4, 0),
(10725, 55, '24.0000', 6, 0),
(10726, 4, '22.0000', 25, 0),
(10726, 11, '21.0000', 5, 0),
(10727, 17, '39.0000', 20, 0),
(10727, 56, '38.0000', 10, 0),
(10727, 59, '55.0000', 10, 0),
(10728, 30, '25.8900', 15, 0),
(10728, 40, '18.4000', 6, 0),
(10728, 55, '24.0000', 12, 0),
(10728, 60, '34.0000', 15, 0),
(10729, 1, '18.0000', 50, 0),
(10729, 21, '10.0000', 30, 0),
(10729, 50, '16.2500', 40, 0),
(10730, 16, '17.4500', 15, 0),
(10730, 31, '12.5000', 3, 0),
(10730, 65, '21.0500', 10, 0),
(10731, 21, '10.0000', 40, 0),
(10731, 51, '53.0000', 30, 0),
(10732, 76, '18.0000', 20, 0),
(10733, 14, '23.2500', 16, 0),
(10733, 28, '45.6000', 20, 0),
(10733, 52, '7.0000', 25, 0),
(10734, 6, '25.0000', 30, 0),
(10734, 30, '25.8900', 15, 0),
(10734, 76, '18.0000', 20, 0),
(10735, 61, '28.5000', 20, 0),
(10735, 77, '13.0000', 2, 0),
(10736, 65, '21.0500', 40, 0),
(10736, 75, '7.7500', 20, 0),
(10737, 13, '6.0000', 4, 0),
(10737, 41, '9.6500', 12, 0),
(10738, 16, '17.4500', 3, 0),
(10739, 36, '19.0000', 6, 0),
(10739, 52, '7.0000', 18, 0),
(10740, 28, '45.6000', 5, 0),
(10740, 35, '18.0000', 35, 0),
(10740, 45, '9.5000', 40, 0),
(10740, 56, '38.0000', 14, 0),
(10741, 2, '19.0000', 15, 0),
(10742, 3, '10.0000', 20, 0),
(10742, 60, '34.0000', 50, 0),
(10742, 72, '34.8000', 35, 0),
(10743, 46, '12.0000', 28, 0),
(10744, 40, '18.4000', 50, 0),
(10745, 18, '62.5000', 24, 0),
(10745, 44, '19.4500', 16, 0),
(10745, 59, '55.0000', 45, 0),
(10745, 72, '34.8000', 7, 0),
(10746, 13, '6.0000', 6, 0),
(10746, 42, '14.0000', 28, 0),
(10746, 62, '49.3000', 9, 0),
(10746, 69, '36.0000', 40, 0),
(10747, 31, '12.5000', 8, 0),
(10747, 41, '9.6500', 35, 0),
(10747, 63, '43.9000', 9, 0),
(10747, 69, '36.0000', 30, 0),
(10748, 23, '9.0000', 44, 0),
(10748, 40, '18.4000', 40, 0),
(10748, 56, '38.0000', 28, 0),
(10749, 56, '38.0000', 15, 0),
(10749, 59, '55.0000', 6, 0),
(10749, 76, '18.0000', 10, 0),
(10750, 14, '23.2500', 5, 0),
(10750, 45, '9.5000', 40, 0),
(10750, 59, '55.0000', 25, 0),
(10751, 26, '31.2300', 12, 0),
(10751, 30, '25.8900', 30, 0),
(10751, 50, '16.2500', 20, 0),
(10751, 73, '15.0000', 15, 0),
(10752, 1, '18.0000', 8, 0),
(10752, 69, '36.0000', 3, 0),
(10753, 45, '9.5000', 4, 0),
(10753, 74, '10.0000', 5, 0),
(10754, 40, '18.4000', 3, 0),
(10755, 47, '9.5000', 30, 0),
(10755, 56, '38.0000', 30, 0),
(10755, 57, '19.5000', 14, 0),
(10755, 69, '36.0000', 25, 0),
(10756, 18, '62.5000', 21, 0),
(10756, 36, '19.0000', 20, 0),
(10756, 68, '12.5000', 6, 0),
(10756, 69, '36.0000', 20, 0),
(10757, 34, '14.0000', 30, 0),
(10757, 59, '55.0000', 7, 0),
(10757, 62, '49.3000', 30, 0),
(10757, 64, '33.2500', 24, 0),
(10758, 26, '31.2300', 20, 0),
(10758, 52, '7.0000', 60, 0),
(10758, 70, '15.0000', 40, 0),
(10759, 32, '32.0000', 10, 0),
(10760, 25, '14.0000', 12, 0),
(10760, 27, '43.9000', 40, 0),
(10760, 43, '46.0000', 30, 0),
(10761, 25, '14.0000', 35, 0),
(10761, 75, '7.7500', 18, 0),
(10762, 39, '18.0000', 16, 0),
(10762, 47, '9.5000', 30, 0),
(10762, 51, '53.0000', 28, 0),
(10762, 56, '38.0000', 60, 0),
(10763, 21, '10.0000', 40, 0),
(10763, 22, '21.0000', 6, 0),
(10763, 24, '4.5000', 20, 0),
(10764, 3, '10.0000', 20, 0),
(10764, 39, '18.0000', 130, 0),
(10765, 65, '21.0500', 80, 0),
(10766, 2, '19.0000', 40, 0),
(10766, 7, '30.0000', 35, 0),
(10766, 68, '12.5000', 40, 0),
(10767, 42, '14.0000', 2, 0),
(10768, 22, '21.0000', 4, 0),
(10768, 31, '12.5000', 50, 0),
(10768, 60, '34.0000', 15, 0),
(10768, 71, '21.5000', 12, 0),
(10769, 41, '9.6500', 30, 0),
(10769, 52, '7.0000', 15, 0),
(10769, 61, '28.5000', 20, 0),
(10769, 62, '49.3000', 15, 0),
(10770, 11, '21.0000', 15, 0),
(10771, 71, '21.5000', 16, 0),
(10772, 29, '123.7900', 18, 0),
(10772, 59, '55.0000', 25, 0),
(10773, 17, '39.0000', 33, 0),
(10773, 31, '12.5000', 70, 0),
(10773, 75, '7.7500', 7, 0),
(10774, 31, '12.5000', 2, 0),
(10774, 66, '17.0000', 50, 0),
(10775, 10, '31.0000', 6, 0),
(10775, 67, '14.0000', 3, 0),
(10776, 31, '12.5000', 16, 0),
(10776, 42, '14.0000', 12, 0),
(10776, 45, '9.5000', 27, 0),
(10776, 51, '53.0000', 120, 0),
(10777, 42, '14.0000', 20, 0),
(10778, 41, '9.6500', 10, 0),
(10779, 16, '17.4500', 20, 0),
(10779, 62, '49.3000', 20, 0),
(10780, 70, '15.0000', 35, 0),
(10780, 77, '13.0000', 15, 0),
(10781, 54, '7.4500', 3, 0),
(10781, 56, '38.0000', 20, 0),
(10781, 74, '10.0000', 35, 0),
(10782, 31, '12.5000', 1, 0),
(10783, 31, '12.5000', 10, 0),
(10783, 38, '263.5000', 5, 0),
(10784, 36, '19.0000', 30, 0),
(10784, 39, '18.0000', 2, 0),
(10784, 72, '34.8000', 30, 0),
(10785, 10, '31.0000', 10, 0),
(10785, 75, '7.7500', 10, 0),
(10786, 8, '40.0000', 30, 0),
(10786, 30, '25.8900', 15, 0),
(10786, 75, '7.7500', 42, 0),
(10787, 2, '19.0000', 15, 0),
(10787, 29, '123.7900', 20, 0),
(10788, 19, '9.2000', 50, 0),
(10788, 75, '7.7500', 40, 0),
(10789, 18, '62.5000', 30, 0),
(10789, 35, '18.0000', 15, 0),
(10789, 63, '43.9000', 30, 0),
(10789, 68, '12.5000', 18, 0),
(10790, 7, '30.0000', 3, 0),
(10790, 56, '38.0000', 20, 0),
(10791, 29, '123.7900', 14, 0),
(10791, 41, '9.6500', 20, 0),
(10792, 2, '19.0000', 10, 0),
(10792, 54, '7.4500', 3, 0),
(10792, 68, '12.5000', 15, 0),
(10793, 41, '9.6500', 14, 0),
(10793, 52, '7.0000', 8, 0),
(10794, 14, '23.2500', 15, 0),
(10794, 54, '7.4500', 6, 0),
(10795, 16, '17.4500', 65, 0),
(10795, 17, '39.0000', 35, 0),
(10796, 26, '31.2300', 21, 0),
(10796, 44, '19.4500', 10, 0),
(10796, 64, '33.2500', 35, 0),
(10796, 69, '36.0000', 24, 0),
(10797, 11, '21.0000', 20, 0),
(10798, 62, '49.3000', 2, 0),
(10798, 72, '34.8000', 10, 0),
(10799, 13, '6.0000', 20, 0),
(10799, 24, '4.5000', 20, 0),
(10799, 59, '55.0000', 25, 0),
(10800, 11, '21.0000', 50, 0),
(10800, 51, '53.0000', 10, 0),
(10800, 54, '7.4500', 7, 0),
(10801, 17, '39.0000', 40, 0),
(10801, 29, '123.7900', 20, 0),
(10802, 30, '25.8900', 25, 0),
(10802, 51, '53.0000', 30, 0),
(10802, 55, '24.0000', 60, 0),
(10802, 62, '49.3000', 5, 0),
(10803, 19, '9.2000', 24, 0),
(10803, 25, '14.0000', 15, 0),
(10803, 59, '55.0000', 15, 0),
(10804, 10, '31.0000', 36, 0),
(10804, 28, '45.6000', 24, 0),
(10804, 49, '20.0000', 4, 0),
(10805, 34, '14.0000', 10, 0),
(10805, 38, '263.5000', 10, 0),
(10806, 2, '19.0000', 20, 0),
(10806, 65, '21.0500', 2, 0),
(10806, 74, '10.0000', 15, 0),
(10807, 40, '18.4000', 1, 0),
(10808, 56, '38.0000', 20, 0),
(10808, 76, '18.0000', 50, 0),
(10809, 52, '7.0000', 20, 0),
(10810, 13, '6.0000', 7, 0),
(10810, 25, '14.0000', 5, 0),
(10810, 70, '15.0000', 5, 0),
(10811, 19, '9.2000', 15, 0),
(10811, 23, '9.0000', 18, 0),
(10811, 40, '18.4000', 30, 0),
(10812, 31, '12.5000', 16, 0),
(10812, 72, '34.8000', 40, 0),
(10812, 77, '13.0000', 20, 0),
(10813, 2, '19.0000', 12, 0),
(10813, 46, '12.0000', 35, 0),
(10814, 41, '9.6500', 20, 0),
(10814, 43, '46.0000', 20, 0),
(10814, 48, '12.7500', 8, 0),
(10814, 61, '28.5000', 30, 0),
(10815, 33, '2.5000', 16, 0),
(10816, 38, '263.5000', 30, 0),
(10816, 62, '49.3000', 20, 0),
(10817, 26, '31.2300', 40, 0),
(10817, 38, '263.5000', 30, 0),
(10817, 40, '18.4000', 60, 0),
(10817, 62, '49.3000', 25, 0),
(10818, 32, '32.0000', 20, 0),
(10818, 41, '9.6500', 20, 0),
(10819, 43, '46.0000', 7, 0),
(10819, 75, '7.7500', 20, 0),
(10820, 56, '38.0000', 30, 0),
(10821, 35, '18.0000', 20, 0),
(10821, 51, '53.0000', 6, 0),
(10822, 62, '49.3000', 3, 0),
(10822, 70, '15.0000', 6, 0),
(10823, 11, '21.0000', 20, 0),
(10823, 57, '19.5000', 15, 0),
(10823, 59, '55.0000', 40, 0),
(10823, 77, '13.0000', 15, 0),
(10824, 41, '9.6500', 12, 0),
(10824, 70, '15.0000', 9, 0),
(10825, 26, '31.2300', 12, 0),
(10825, 53, '32.8000', 20, 0),
(10826, 31, '12.5000', 35, 0),
(10826, 57, '19.5000', 15, 0),
(10827, 10, '31.0000', 15, 0),
(10827, 39, '18.0000', 21, 0),
(10828, 20, '81.0000', 5, 0),
(10828, 38, '263.5000', 2, 0),
(10829, 2, '19.0000', 10, 0),
(10829, 8, '40.0000', 20, 0),
(10829, 13, '6.0000', 10, 0),
(10829, 60, '34.0000', 21, 0),
(10830, 6, '25.0000', 6, 0),
(10830, 39, '18.0000', 28, 0),
(10830, 60, '34.0000', 30, 0),
(10830, 68, '12.5000', 24, 0),
(10831, 19, '9.2000', 2, 0),
(10831, 35, '18.0000', 8, 0),
(10831, 38, '263.5000', 8, 0),
(10831, 43, '46.0000', 9, 0),
(10832, 13, '6.0000', 3, 0),
(10832, 25, '14.0000', 10, 0),
(10832, 44, '19.4500', 16, 0),
(10832, 64, '33.2500', 3, 0),
(10833, 7, '30.0000', 20, 0),
(10833, 31, '12.5000', 9, 0),
(10833, 53, '32.8000', 9, 0),
(10834, 29, '123.7900', 8, 0),
(10834, 30, '25.8900', 20, 0),
(10835, 59, '55.0000', 15, 0),
(10835, 77, '13.0000', 2, 0),
(10836, 22, '21.0000', 52, 0),
(10836, 35, '18.0000', 6, 0),
(10836, 57, '19.5000', 24, 0),
(10836, 60, '34.0000', 60, 0),
(10836, 64, '33.2500', 30, 0),
(10837, 13, '6.0000', 6, 0),
(10837, 40, '18.4000', 25, 0),
(10837, 47, '9.5000', 40, 0),
(10837, 76, '18.0000', 21, 0),
(10838, 1, '18.0000', 4, 0),
(10838, 18, '62.5000', 25, 0),
(10838, 36, '19.0000', 50, 0),
(10839, 58, '13.2500', 30, 0),
(10839, 72, '34.8000', 15, 0),
(10840, 25, '14.0000', 6, 0),
(10840, 39, '18.0000', 10, 0),
(10841, 10, '31.0000', 16, 0),
(10841, 56, '38.0000', 30, 0),
(10841, 59, '55.0000', 50, 0),
(10841, 77, '13.0000', 15, 0),
(10842, 11, '21.0000', 15, 0),
(10842, 43, '46.0000', 5, 0),
(10842, 68, '12.5000', 20, 0),
(10842, 70, '15.0000', 12, 0),
(10843, 51, '53.0000', 4, 0),
(10844, 22, '21.0000', 35, 0),
(10845, 23, '9.0000', 70, 0),
(10845, 35, '18.0000', 25, 0),
(10845, 42, '14.0000', 42, 0),
(10845, 58, '13.2500', 60, 0),
(10845, 64, '33.2500', 48, 0),
(10846, 4, '22.0000', 21, 0),
(10846, 70, '15.0000', 30, 0),
(10846, 74, '10.0000', 20, 0),
(10847, 1, '18.0000', 80, 0),
(10847, 19, '9.2000', 12, 0),
(10847, 37, '26.0000', 60, 0),
(10847, 45, '9.5000', 36, 0),
(10847, 60, '34.0000', 45, 0),
(10847, 71, '21.5000', 55, 0),
(10848, 5, '21.3500', 30, 0),
(10848, 9, '97.0000', 3, 0),
(10849, 3, '10.0000', 49, 0),
(10849, 26, '31.2300', 18, 0),
(10850, 25, '14.0000', 20, 0),
(10850, 33, '2.5000', 4, 0),
(10850, 70, '15.0000', 30, 0),
(10851, 2, '19.0000', 5, 0),
(10851, 25, '14.0000', 10, 0),
(10851, 57, '19.5000', 10, 0),
(10851, 59, '55.0000', 42, 0),
(10852, 2, '19.0000', 15, 0),
(10852, 17, '39.0000', 6, 0),
(10852, 62, '49.3000', 50, 0),
(10853, 18, '62.5000', 10, 0),
(10854, 10, '31.0000', 100, 0),
(10854, 13, '6.0000', 65, 0),
(10855, 16, '17.4500', 50, 0),
(10855, 31, '12.5000', 14, 0),
(10855, 56, '38.0000', 24, 0),
(10855, 65, '21.0500', 15, 0),
(10856, 2, '19.0000', 20, 0),
(10856, 42, '14.0000', 20, 0),
(10857, 3, '10.0000', 30, 0),
(10857, 26, '31.2300', 35, 0),
(10857, 29, '123.7900', 10, 0),
(10858, 7, '30.0000', 5, 0),
(10858, 27, '43.9000', 10, 0),
(10858, 70, '15.0000', 4, 0),
(10859, 24, '4.5000', 40, 0),
(10859, 54, '7.4500', 35, 0),
(10859, 64, '33.2500', 30, 0),
(10860, 51, '53.0000', 3, 0),
(10860, 76, '18.0000', 20, 0),
(10861, 17, '39.0000', 42, 0),
(10861, 18, '62.5000', 20, 0),
(10861, 21, '10.0000', 40, 0),
(10861, 33, '2.5000', 35, 0),
(10861, 62, '49.3000', 3, 0),
(10862, 11, '21.0000', 25, 0),
(10862, 52, '7.0000', 8, 0),
(10863, 1, '18.0000', 20, 0),
(10863, 58, '13.2500', 12, 0),
(10864, 35, '18.0000', 4, 0),
(10864, 67, '14.0000', 15, 0),
(10865, 38, '263.5000', 60, 0),
(10865, 39, '18.0000', 80, 0),
(10866, 2, '19.0000', 21, 0),
(10866, 24, '4.5000', 6, 0),
(10866, 30, '25.8900', 40, 0),
(10867, 53, '32.8000', 3, 0),
(10868, 26, '31.2300', 20, 0),
(10868, 35, '18.0000', 30, 0),
(10868, 49, '20.0000', 42, 0),
(10869, 1, '18.0000', 40, 0),
(10869, 11, '21.0000', 10, 0),
(10869, 23, '9.0000', 50, 0),
(10869, 68, '12.5000', 20, 0),
(10870, 35, '18.0000', 3, 0),
(10870, 51, '53.0000', 2, 0),
(10871, 6, '25.0000', 50, 0),
(10871, 16, '17.4500', 12, 0),
(10871, 17, '39.0000', 16, 0),
(10872, 55, '24.0000', 10, 0),
(10872, 62, '49.3000', 20, 0),
(10872, 64, '33.2500', 15, 0),
(10872, 65, '21.0500', 21, 0),
(10873, 21, '10.0000', 20, 0),
(10873, 28, '45.6000', 3, 0),
(10874, 10, '31.0000', 10, 0),
(10875, 19, '9.2000', 25, 0),
(10875, 47, '9.5000', 21, 0),
(10875, 49, '20.0000', 15, 0),
(10876, 46, '12.0000', 21, 0),
(10876, 64, '33.2500', 20, 0),
(10877, 16, '17.4500', 30, 0),
(10877, 18, '62.5000', 25, 0),
(10878, 20, '81.0000', 20, 0),
(10879, 40, '18.4000', 12, 0),
(10879, 65, '21.0500', 10, 0),
(10879, 76, '18.0000', 10, 0),
(10880, 23, '9.0000', 30, 0),
(10880, 61, '28.5000', 30, 0),
(10880, 70, '15.0000', 50, 0),
(10881, 73, '15.0000', 10, 0),
(10882, 42, '14.0000', 25, 0),
(10882, 49, '20.0000', 20, 0),
(10882, 54, '7.4500', 32, 0),
(10883, 24, '4.5000', 8, 0),
(10884, 21, '10.0000', 40, 0),
(10884, 56, '38.0000', 21, 0),
(10884, 65, '21.0500', 12, 0),
(10885, 2, '19.0000', 20, 0),
(10885, 24, '4.5000', 12, 0),
(10885, 70, '15.0000', 30, 0),
(10885, 77, '13.0000', 25, 0),
(10886, 10, '31.0000', 70, 0),
(10886, 31, '12.5000', 35, 0),
(10886, 77, '13.0000', 40, 0),
(10887, 25, '14.0000', 5, 0),
(10888, 2, '19.0000', 20, 0),
(10888, 68, '12.5000', 18, 0),
(10889, 11, '21.0000', 40, 0),
(10889, 38, '263.5000', 40, 0),
(10890, 17, '39.0000', 15, 0),
(10890, 34, '14.0000', 10, 0),
(10890, 41, '9.6500', 14, 0),
(10891, 30, '25.8900', 15, 0),
(10892, 59, '55.0000', 40, 0),
(10893, 8, '40.0000', 30, 0),
(10893, 24, '4.5000', 10, 0),
(10893, 29, '123.7900', 24, 0),
(10893, 30, '25.8900', 35, 0),
(10893, 36, '19.0000', 20, 0),
(10894, 13, '6.0000', 28, 0),
(10894, 69, '36.0000', 50, 0),
(10894, 75, '7.7500', 120, 0),
(10895, 24, '4.5000', 110, 0),
(10895, 39, '18.0000', 45, 0),
(10895, 40, '18.4000', 91, 0),
(10895, 60, '34.0000', 100, 0),
(10896, 45, '9.5000', 15, 0),
(10896, 56, '38.0000', 16, 0),
(10897, 29, '123.7900', 80, 0),
(10897, 30, '25.8900', 36, 0),
(10898, 13, '6.0000', 5, 0),
(10899, 39, '18.0000', 8, 0),
(10900, 70, '15.0000', 3, 0),
(10901, 41, '9.6500', 30, 0),
(10901, 71, '21.5000', 30, 0),
(10902, 55, '24.0000', 30, 0),
(10902, 62, '49.3000', 6, 0),
(10903, 13, '6.0000', 40, 0),
(10903, 65, '21.0500', 21, 0),
(10903, 68, '12.5000', 20, 0),
(10904, 58, '13.2500', 15, 0),
(10904, 62, '49.3000', 35, 0),
(10905, 1, '18.0000', 20, 0),
(10906, 61, '28.5000', 15, 0),
(10907, 75, '7.7500', 14, 0),
(10908, 7, '30.0000', 20, 0),
(10908, 52, '7.0000', 14, 0),
(10909, 7, '30.0000', 12, 0),
(10909, 16, '17.4500', 15, 0),
(10909, 41, '9.6500', 5, 0),
(10910, 19, '9.2000', 12, 0),
(10910, 49, '20.0000', 10, 0),
(10910, 61, '28.5000', 5, 0),
(10911, 1, '18.0000', 10, 0),
(10911, 17, '39.0000', 12, 0),
(10911, 67, '14.0000', 15, 0),
(10912, 11, '21.0000', 40, 0),
(10912, 29, '123.7900', 60, 0),
(10913, 4, '22.0000', 30, 0),
(10913, 33, '2.5000', 40, 0),
(10913, 58, '13.2500', 15, 0),
(10914, 71, '21.5000', 25, 0),
(10915, 17, '39.0000', 10, 0),
(10915, 33, '2.5000', 30, 0),
(10915, 54, '7.4500', 10, 0),
(10916, 16, '17.4500', 6, 0),
(10916, 32, '32.0000', 6, 0),
(10916, 57, '19.5000', 20, 0),
(10917, 30, '25.8900', 1, 0),
(10917, 60, '34.0000', 10, 0),
(10918, 1, '18.0000', 60, 0),
(10918, 60, '34.0000', 25, 0),
(10919, 16, '17.4500', 24, 0),
(10919, 25, '14.0000', 24, 0),
(10919, 40, '18.4000', 20, 0);
INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) VALUES
(10920, 50, '16.2500', 24, 0),
(10921, 35, '18.0000', 10, 0),
(10921, 63, '43.9000', 40, 0),
(10922, 17, '39.0000', 15, 0),
(10922, 24, '4.5000', 35, 0),
(10923, 42, '14.0000', 10, 0),
(10923, 43, '46.0000', 10, 0),
(10923, 67, '14.0000', 24, 0),
(10924, 10, '31.0000', 20, 0),
(10924, 28, '45.6000', 30, 0),
(10924, 75, '7.7500', 6, 0),
(10925, 36, '19.0000', 25, 0),
(10925, 52, '7.0000', 12, 0),
(10926, 11, '21.0000', 2, 0),
(10926, 13, '6.0000', 10, 0),
(10926, 19, '9.2000', 7, 0),
(10926, 72, '34.8000', 10, 0),
(10927, 20, '81.0000', 5, 0),
(10927, 52, '7.0000', 5, 0),
(10927, 76, '18.0000', 20, 0),
(10928, 47, '9.5000', 5, 0),
(10928, 76, '18.0000', 5, 0),
(10929, 21, '10.0000', 60, 0),
(10929, 75, '7.7500', 49, 0),
(10929, 77, '13.0000', 15, 0),
(10930, 21, '10.0000', 36, 0),
(10930, 27, '43.9000', 25, 0),
(10930, 55, '24.0000', 25, 0),
(10930, 58, '13.2500', 30, 0),
(10931, 13, '6.0000', 42, 0),
(10931, 57, '19.5000', 30, 0),
(10932, 16, '17.4500', 30, 0),
(10932, 62, '49.3000', 14, 0),
(10932, 72, '34.8000', 16, 0),
(10932, 75, '7.7500', 20, 0),
(10933, 53, '32.8000', 2, 0),
(10933, 61, '28.5000', 30, 0),
(10934, 6, '25.0000', 20, 0),
(10935, 1, '18.0000', 21, 0),
(10935, 18, '62.5000', 4, 0),
(10935, 23, '9.0000', 8, 0),
(10936, 36, '19.0000', 30, 0),
(10937, 28, '45.6000', 8, 0),
(10937, 34, '14.0000', 20, 0),
(10938, 13, '6.0000', 20, 0),
(10938, 43, '46.0000', 24, 0),
(10938, 60, '34.0000', 49, 0),
(10938, 71, '21.5000', 35, 0),
(10939, 2, '19.0000', 10, 0),
(10939, 67, '14.0000', 40, 0),
(10940, 7, '30.0000', 8, 0),
(10940, 13, '6.0000', 20, 0),
(10941, 31, '12.5000', 44, 0),
(10941, 62, '49.3000', 30, 0),
(10941, 68, '12.5000', 80, 0),
(10941, 72, '34.8000', 50, 0),
(10942, 49, '20.0000', 28, 0),
(10943, 13, '6.0000', 15, 0),
(10943, 22, '21.0000', 21, 0),
(10943, 46, '12.0000', 15, 0),
(10944, 11, '21.0000', 5, 0),
(10944, 44, '19.4500', 18, 0),
(10944, 56, '38.0000', 18, 0),
(10945, 13, '6.0000', 20, 0),
(10945, 31, '12.5000', 10, 0),
(10946, 10, '31.0000', 25, 0),
(10946, 24, '4.5000', 25, 0),
(10946, 77, '13.0000', 40, 0),
(10947, 59, '55.0000', 4, 0),
(10948, 50, '16.2500', 9, 0),
(10948, 51, '53.0000', 40, 0),
(10948, 55, '24.0000', 4, 0),
(10949, 6, '25.0000', 12, 0),
(10949, 10, '31.0000', 30, 0),
(10949, 17, '39.0000', 6, 0),
(10949, 62, '49.3000', 60, 0),
(10950, 4, '22.0000', 5, 0),
(10951, 33, '2.5000', 15, 0),
(10951, 41, '9.6500', 6, 0),
(10951, 75, '7.7500', 50, 0),
(10952, 6, '25.0000', 16, 0),
(10952, 28, '45.6000', 2, 0),
(10953, 20, '81.0000', 50, 0),
(10953, 31, '12.5000', 50, 0),
(10954, 16, '17.4500', 28, 0),
(10954, 31, '12.5000', 25, 0),
(10954, 45, '9.5000', 30, 0),
(10954, 60, '34.0000', 24, 0),
(10955, 75, '7.7500', 12, 0),
(10956, 21, '10.0000', 12, 0),
(10956, 47, '9.5000', 14, 0),
(10956, 51, '53.0000', 8, 0),
(10957, 30, '25.8900', 30, 0),
(10957, 35, '18.0000', 40, 0),
(10957, 64, '33.2500', 8, 0),
(10958, 5, '21.3500', 20, 0),
(10958, 7, '30.0000', 6, 0),
(10958, 72, '34.8000', 5, 0),
(10959, 75, '7.7500', 20, 0),
(10960, 24, '4.5000', 10, 0),
(10960, 41, '9.6500', 24, 0),
(10961, 52, '7.0000', 6, 0),
(10961, 76, '18.0000', 60, 0),
(10962, 7, '30.0000', 45, 0),
(10962, 13, '6.0000', 77, 0),
(10962, 53, '32.8000', 20, 0),
(10962, 69, '36.0000', 9, 0),
(10962, 76, '18.0000', 44, 0),
(10963, 60, '34.0000', 2, 0),
(10964, 18, '62.5000', 6, 0),
(10964, 38, '263.5000', 5, 0),
(10964, 69, '36.0000', 10, 0),
(10965, 51, '53.0000', 16, 0),
(10966, 37, '26.0000', 8, 0),
(10966, 56, '38.0000', 12, 0),
(10966, 62, '49.3000', 12, 0),
(10967, 19, '9.2000', 12, 0),
(10967, 49, '20.0000', 40, 0),
(10968, 12, '38.0000', 30, 0),
(10968, 24, '4.5000', 30, 0),
(10968, 64, '33.2500', 4, 0),
(10969, 46, '12.0000', 9, 0),
(10970, 52, '7.0000', 40, 0),
(10971, 29, '123.7900', 14, 0),
(10972, 17, '39.0000', 6, 0),
(10972, 33, '2.5000', 7, 0),
(10973, 26, '31.2300', 5, 0),
(10973, 41, '9.6500', 6, 0),
(10973, 75, '7.7500', 10, 0),
(10974, 63, '43.9000', 10, 0),
(10975, 8, '40.0000', 16, 0),
(10975, 75, '7.7500', 10, 0),
(10976, 28, '45.6000', 20, 0),
(10977, 39, '18.0000', 30, 0),
(10977, 47, '9.5000', 30, 0),
(10977, 51, '53.0000', 10, 0),
(10977, 63, '43.9000', 20, 0),
(10978, 8, '40.0000', 20, 0),
(10978, 21, '10.0000', 40, 0),
(10978, 40, '18.4000', 10, 0),
(10978, 44, '19.4500', 6, 0),
(10979, 7, '30.0000', 18, 0),
(10979, 12, '38.0000', 20, 0),
(10979, 24, '4.5000', 80, 0),
(10979, 27, '43.9000', 30, 0),
(10979, 31, '12.5000', 24, 0),
(10979, 63, '43.9000', 35, 0),
(10980, 75, '7.7500', 40, 0),
(10981, 38, '263.5000', 60, 0),
(10982, 7, '30.0000', 20, 0),
(10982, 43, '46.0000', 9, 0),
(10983, 13, '6.0000', 84, 0),
(10983, 57, '19.5000', 15, 0),
(10984, 16, '17.4500', 55, 0),
(10984, 24, '4.5000', 20, 0),
(10984, 36, '19.0000', 40, 0),
(10985, 16, '17.4500', 36, 0),
(10985, 18, '62.5000', 8, 0),
(10985, 32, '32.0000', 35, 0),
(10986, 11, '21.0000', 30, 0),
(10986, 20, '81.0000', 15, 0),
(10986, 76, '18.0000', 10, 0),
(10986, 77, '13.0000', 15, 0),
(10987, 7, '30.0000', 60, 0),
(10987, 43, '46.0000', 6, 0),
(10987, 72, '34.8000', 20, 0),
(10988, 7, '30.0000', 60, 0),
(10988, 62, '49.3000', 40, 0),
(10989, 6, '25.0000', 40, 0),
(10989, 11, '21.0000', 15, 0),
(10989, 41, '9.6500', 4, 0),
(10990, 21, '10.0000', 65, 0),
(10990, 34, '14.0000', 60, 0),
(10990, 55, '24.0000', 65, 0),
(10990, 61, '28.5000', 66, 0),
(10991, 2, '19.0000', 50, 0),
(10991, 70, '15.0000', 20, 0),
(10991, 76, '18.0000', 90, 0),
(10992, 72, '34.8000', 2, 0),
(10993, 29, '123.7900', 50, 0),
(10993, 41, '9.6500', 35, 0),
(10994, 59, '55.0000', 18, 0),
(10995, 51, '53.0000', 20, 0),
(10995, 60, '34.0000', 4, 0),
(10996, 42, '14.0000', 40, 0),
(10997, 32, '32.0000', 50, 0),
(10997, 46, '12.0000', 20, 0),
(10997, 52, '7.0000', 20, 0),
(10998, 24, '4.5000', 12, 0),
(10998, 61, '28.5000', 7, 0),
(10998, 74, '10.0000', 20, 0),
(10998, 75, '7.7500', 30, 0),
(10999, 41, '9.6500', 20, 0),
(10999, 51, '53.0000', 15, 0),
(10999, 77, '13.0000', 21, 0),
(11000, 4, '22.0000', 25, 0),
(11000, 24, '4.5000', 30, 0),
(11000, 77, '13.0000', 30, 0),
(11001, 7, '30.0000', 60, 0),
(11001, 22, '21.0000', 25, 0),
(11001, 46, '12.0000', 25, 0),
(11001, 55, '24.0000', 6, 0),
(11002, 13, '6.0000', 56, 0),
(11002, 35, '18.0000', 15, 0),
(11002, 42, '14.0000', 24, 0),
(11002, 55, '24.0000', 40, 0),
(11003, 1, '18.0000', 4, 0),
(11003, 40, '18.4000', 10, 0),
(11003, 52, '7.0000', 10, 0),
(11004, 26, '31.2300', 6, 0),
(11004, 76, '18.0000', 6, 0),
(11005, 1, '18.0000', 2, 0),
(11005, 59, '55.0000', 10, 0),
(11006, 1, '18.0000', 8, 0),
(11006, 29, '123.7900', 2, 0),
(11007, 8, '40.0000', 30, 0),
(11007, 29, '123.7900', 10, 0),
(11007, 42, '14.0000', 14, 0),
(11008, 28, '45.6000', 70, 0),
(11008, 34, '14.0000', 90, 0),
(11008, 71, '21.5000', 21, 0),
(11009, 24, '4.5000', 12, 0),
(11009, 36, '19.0000', 18, 0),
(11009, 60, '34.0000', 9, 0),
(11010, 7, '30.0000', 20, 0),
(11010, 24, '4.5000', 10, 0),
(11011, 58, '13.2500', 40, 0),
(11011, 71, '21.5000', 20, 0),
(11012, 19, '9.2000', 50, 0),
(11012, 60, '34.0000', 36, 0),
(11012, 71, '21.5000', 60, 0),
(11013, 23, '9.0000', 10, 0),
(11013, 42, '14.0000', 4, 0),
(11013, 45, '9.5000', 20, 0),
(11013, 68, '12.5000', 2, 0),
(11014, 41, '9.6500', 28, 0),
(11015, 30, '25.8900', 15, 0),
(11015, 77, '13.0000', 18, 0),
(11016, 31, '12.5000', 15, 0),
(11016, 36, '19.0000', 16, 0),
(11017, 3, '10.0000', 25, 0),
(11017, 59, '55.0000', 110, 0),
(11017, 70, '15.0000', 30, 0),
(11018, 12, '38.0000', 20, 0),
(11018, 18, '62.5000', 10, 0),
(11018, 56, '38.0000', 5, 0),
(11019, 46, '12.0000', 3, 0),
(11019, 49, '20.0000', 2, 0),
(11020, 10, '31.0000', 24, 0),
(11021, 2, '19.0000', 11, 0),
(11021, 20, '81.0000', 15, 0),
(11021, 26, '31.2300', 63, 0),
(11021, 51, '53.0000', 44, 0),
(11021, 72, '34.8000', 35, 0),
(11022, 19, '9.2000', 35, 0),
(11022, 69, '36.0000', 30, 0),
(11023, 7, '30.0000', 4, 0),
(11023, 43, '46.0000', 30, 0),
(11024, 26, '31.2300', 12, 0),
(11024, 33, '2.5000', 30, 0),
(11024, 65, '21.0500', 21, 0),
(11024, 71, '21.5000', 50, 0),
(11025, 1, '18.0000', 10, 0),
(11025, 13, '6.0000', 20, 0),
(11026, 18, '62.5000', 8, 0),
(11026, 51, '53.0000', 10, 0),
(11027, 24, '4.5000', 30, 0),
(11027, 62, '49.3000', 21, 0),
(11028, 55, '24.0000', 35, 0),
(11028, 59, '55.0000', 24, 0),
(11029, 56, '38.0000', 20, 0),
(11029, 63, '43.9000', 12, 0),
(11030, 2, '19.0000', 100, 0),
(11030, 5, '21.3500', 70, 0),
(11030, 29, '123.7900', 60, 0),
(11030, 59, '55.0000', 100, 0),
(11031, 1, '18.0000', 45, 0),
(11031, 13, '6.0000', 80, 0),
(11031, 24, '4.5000', 21, 0),
(11031, 64, '33.2500', 20, 0),
(11031, 71, '21.5000', 16, 0),
(11032, 36, '19.0000', 35, 0),
(11032, 38, '263.5000', 25, 0),
(11032, 59, '55.0000', 30, 0),
(11033, 53, '32.8000', 70, 0),
(11033, 69, '36.0000', 36, 0),
(11034, 21, '10.0000', 15, 0),
(11034, 44, '19.4500', 12, 0),
(11034, 61, '28.5000', 6, 0),
(11035, 1, '18.0000', 10, 0),
(11035, 35, '18.0000', 60, 0),
(11035, 42, '14.0000', 30, 0),
(11035, 54, '7.4500', 10, 0),
(11036, 13, '6.0000', 7, 0),
(11036, 59, '55.0000', 30, 0),
(11037, 70, '15.0000', 4, 0),
(11038, 40, '18.4000', 5, 0),
(11038, 52, '7.0000', 2, 0),
(11038, 71, '21.5000', 30, 0),
(11039, 28, '45.6000', 20, 0),
(11039, 35, '18.0000', 24, 0),
(11039, 49, '20.0000', 60, 0),
(11039, 57, '19.5000', 28, 0),
(11040, 21, '10.0000', 20, 0),
(11041, 2, '19.0000', 30, 0),
(11041, 63, '43.9000', 30, 0),
(11042, 44, '19.4500', 15, 0),
(11042, 61, '28.5000', 4, 0),
(11043, 11, '21.0000', 10, 0),
(11044, 62, '49.3000', 12, 0),
(11045, 33, '2.5000', 15, 0),
(11045, 51, '53.0000', 24, 0),
(11046, 12, '38.0000', 20, 0),
(11046, 32, '32.0000', 15, 0),
(11046, 35, '18.0000', 18, 0),
(11047, 1, '18.0000', 25, 0),
(11047, 5, '21.3500', 30, 0),
(11048, 68, '12.5000', 42, 0),
(11049, 2, '19.0000', 10, 0),
(11049, 12, '38.0000', 4, 0),
(11050, 76, '18.0000', 50, 0),
(11051, 24, '4.5000', 10, 0),
(11052, 43, '46.0000', 30, 0),
(11052, 61, '28.5000', 10, 0),
(11053, 18, '62.5000', 35, 0),
(11053, 32, '32.0000', 20, 0),
(11053, 64, '33.2500', 25, 0),
(11054, 33, '2.5000', 10, 0),
(11054, 67, '14.0000', 20, 0),
(11055, 24, '4.5000', 15, 0),
(11055, 25, '14.0000', 15, 0),
(11055, 51, '53.0000', 20, 0),
(11055, 57, '19.5000', 20, 0),
(11056, 7, '30.0000', 40, 0),
(11056, 55, '24.0000', 35, 0),
(11056, 60, '34.0000', 50, 0),
(11057, 70, '15.0000', 3, 0),
(11058, 21, '10.0000', 3, 0),
(11058, 60, '34.0000', 21, 0),
(11058, 61, '28.5000', 4, 0),
(11059, 13, '6.0000', 30, 0),
(11059, 17, '39.0000', 12, 0),
(11059, 60, '34.0000', 35, 0),
(11060, 60, '34.0000', 4, 0),
(11060, 77, '13.0000', 10, 0),
(11061, 60, '34.0000', 15, 0),
(11062, 53, '32.8000', 10, 0),
(11062, 70, '15.0000', 12, 0),
(11063, 34, '14.0000', 30, 0),
(11063, 40, '18.4000', 40, 0),
(11063, 41, '9.6500', 30, 0),
(11064, 17, '39.0000', 77, 0),
(11064, 41, '9.6500', 12, 0),
(11064, 53, '32.8000', 25, 0),
(11064, 55, '24.0000', 4, 0),
(11064, 68, '12.5000', 55, 0),
(11065, 30, '25.8900', 4, 0),
(11065, 54, '7.4500', 20, 0),
(11066, 16, '17.4500', 3, 0),
(11066, 19, '9.2000', 42, 0),
(11066, 34, '14.0000', 35, 0),
(11067, 41, '9.6500', 9, 0),
(11068, 28, '45.6000', 8, 0),
(11068, 43, '46.0000', 36, 0),
(11068, 77, '13.0000', 28, 0),
(11069, 39, '18.0000', 20, 0),
(11070, 1, '18.0000', 40, 0),
(11070, 2, '19.0000', 20, 0),
(11070, 16, '17.4500', 30, 0),
(11070, 31, '12.5000', 20, 0),
(11071, 7, '30.0000', 15, 0),
(11071, 13, '6.0000', 10, 0),
(11072, 2, '19.0000', 8, 0),
(11072, 41, '9.6500', 40, 0),
(11072, 50, '16.2500', 22, 0),
(11072, 64, '33.2500', 130, 0),
(11073, 11, '21.0000', 10, 0),
(11073, 24, '4.5000', 20, 0),
(11074, 16, '17.4500', 14, 0),
(11075, 2, '19.0000', 10, 0),
(11075, 46, '12.0000', 30, 0),
(11075, 76, '18.0000', 2, 0),
(11076, 6, '25.0000', 20, 0),
(11076, 14, '23.2500', 20, 0),
(11076, 19, '9.2000', 10, 0),
(11077, 2, '19.0000', 24, 0),
(11077, 3, '10.0000', 4, 0),
(11077, 4, '22.0000', 1, 0),
(11077, 6, '25.0000', 1, 0),
(11077, 7, '30.0000', 1, 0),
(11077, 8, '40.0000', 2, 0),
(11077, 10, '31.0000', 1, 0),
(11077, 12, '38.0000', 2, 0),
(11077, 13, '6.0000', 4, 0),
(11077, 14, '23.2500', 1, 0),
(11077, 16, '17.4500', 2, 0),
(11077, 20, '81.0000', 1, 0),
(11077, 23, '9.0000', 2, 0),
(11077, 32, '32.0000', 1, 0),
(11077, 39, '18.0000', 2, 0),
(11077, 41, '9.6500', 3, 0),
(11077, 46, '12.0000', 3, 0),
(11077, 52, '7.0000', 2, 0),
(11077, 55, '24.0000', 2, 0),
(11077, 60, '34.0000', 2, 0),
(11077, 64, '33.2500', 2, 0),
(11077, 66, '17.0000', 1, 0),
(11077, 73, '15.0000', 2, 0),
(11077, 75, '7.7500', 4, 0),
(11077, 77, '13.0000', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(5) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `RequiredDate` datetime DEFAULT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `ShipVia` int(11) DEFAULT NULL,
  `Freight` decimal(10,4) DEFAULT '0.0000',
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAddress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipRegion` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=11078 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES
(10248, 'VINET', 5, '1996-07-04 00:00:00', '1996-08-01 00:00:00', '1996-07-16 00:00:00', 3, '32.3800', 'Vins et alcools Chevalier', '59 rue de l-Abbaye', 'Reims', NULL, '51100', 'France'),
(10249, 'TOMSP', 6, '1996-07-05 00:00:00', '1996-08-16 00:00:00', '1996-07-10 00:00:00', 1, '11.6100', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10250, 'HANAR', 4, '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-12 00:00:00', 2, '65.8300', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10251, 'VICTE', 3, '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-15 00:00:00', 1, '41.3400', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10252, 'SUPRD', 4, '1996-07-09 00:00:00', '1996-08-06 00:00:00', '1996-07-11 00:00:00', 2, '51.3000', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10253, 'HANAR', 3, '1996-07-10 00:00:00', '1996-07-24 00:00:00', '1996-07-16 00:00:00', 2, '58.1700', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10254, 'CHOPS', 5, '1996-07-11 00:00:00', '1996-08-08 00:00:00', '1996-07-23 00:00:00', 2, '22.9800', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10255, 'RICSU', 9, '1996-07-12 00:00:00', '1996-08-09 00:00:00', '1996-07-15 00:00:00', 3, '148.3300', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10256, 'WELLI', 3, '1996-07-15 00:00:00', '1996-08-12 00:00:00', '1996-07-17 00:00:00', 2, '13.9700', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10257, 'HILAA', 4, '1996-07-16 00:00:00', '1996-08-13 00:00:00', '1996-07-22 00:00:00', 3, '81.9100', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10258, 'ERNSH', 1, '1996-07-17 00:00:00', '1996-08-14 00:00:00', '1996-07-23 00:00:00', 1, '140.5100', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10259, 'CENTC', 4, '1996-07-18 00:00:00', '1996-08-15 00:00:00', '1996-07-25 00:00:00', 3, '3.2500', 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'Mxico D.F.', NULL, '5022', 'Mexico'),
(10260, 'OTTIK', 4, '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-29 00:00:00', 1, '55.0900', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10261, 'QUEDE', 4, '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-30 00:00:00', 2, '3.0500', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10262, 'RATTC', 8, '1996-07-22 00:00:00', '1996-08-19 00:00:00', '1996-07-25 00:00:00', 3, '48.2900', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10263, 'ERNSH', 9, '1996-07-23 00:00:00', '1996-08-20 00:00:00', '1996-07-31 00:00:00', 3, '146.0600', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10264, 'FOLKO', 6, '1996-07-24 00:00:00', '1996-08-21 00:00:00', '1996-08-23 00:00:00', 3, '3.6700', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10265, 'BLONP', 2, '1996-07-25 00:00:00', '1996-08-22 00:00:00', '1996-08-12 00:00:00', 1, '55.2800', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10266, 'WARTH', 3, '1996-07-26 00:00:00', '1996-09-06 00:00:00', '1996-07-31 00:00:00', 3, '25.7300', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10267, 'FRANK', 4, '1996-07-29 00:00:00', '1996-08-26 00:00:00', '1996-08-06 00:00:00', 1, '208.5800', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10268, 'GROSR', 8, '1996-07-30 00:00:00', '1996-08-27 00:00:00', '1996-08-02 00:00:00', 3, '66.2900', 'GROSELLA-Restaurante', '5 Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela'),
(10269, 'WHITC', 5, '1996-07-31 00:00:00', '1996-08-14 00:00:00', '1996-08-09 00:00:00', 1, '4.5600', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10270, 'WARTH', 1, '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-02 00:00:00', 1, '136.5400', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10271, 'SPLIR', 6, '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-30 00:00:00', 2, '4.5400', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10272, 'RATTC', 6, '1996-08-02 00:00:00', '1996-08-30 00:00:00', '1996-08-06 00:00:00', 2, '98.0300', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10273, 'QUICK', 3, '1996-08-05 00:00:00', '1996-09-02 00:00:00', '1996-08-12 00:00:00', 3, '76.0700', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10274, 'VINET', 6, '1996-08-06 00:00:00', '1996-09-03 00:00:00', '1996-08-16 00:00:00', 1, '6.0100', 'Vins et alcools Chevalier', '59 rue de l-Abbaye', 'Reims', NULL, '51100', 'France'),
(10275, 'MAGAA', 1, '1996-08-07 00:00:00', '1996-09-04 00:00:00', '1996-08-09 00:00:00', 1, '26.9300', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10276, 'TORTU', 8, '1996-08-08 00:00:00', '1996-08-22 00:00:00', '1996-08-14 00:00:00', 3, '13.8400', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10277, 'MORGK', 2, '1996-08-09 00:00:00', '1996-09-06 00:00:00', '1996-08-13 00:00:00', 3, '125.7700', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '4179', 'Germany'),
(10278, 'BERGS', 8, '1996-08-12 00:00:00', '1996-09-09 00:00:00', '1996-08-16 00:00:00', 2, '92.6900', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10279, 'LEHMS', 8, '1996-08-13 00:00:00', '1996-09-10 00:00:00', '1996-08-16 00:00:00', 2, '25.8300', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10280, 'BERGS', 2, '1996-08-14 00:00:00', '1996-09-11 00:00:00', '1996-09-12 00:00:00', 1, '8.9800', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10281, 'ROMEY', 4, '1996-08-14 00:00:00', '1996-08-28 00:00:00', '1996-08-21 00:00:00', 1, '2.9400', 'Romero y tomillo', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain'),
(10282, 'ROMEY', 4, '1996-08-15 00:00:00', '1996-09-12 00:00:00', '1996-08-21 00:00:00', 1, '12.6900', 'Romero y tomillo', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain'),
(10283, 'LILAS', 3, '1996-08-16 00:00:00', '1996-09-13 00:00:00', '1996-08-23 00:00:00', 3, '84.8100', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10284, 'LEHMS', 4, '1996-08-19 00:00:00', '1996-09-16 00:00:00', '1996-08-27 00:00:00', 1, '76.5600', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10285, 'QUICK', 1, '1996-08-20 00:00:00', '1996-09-17 00:00:00', '1996-08-26 00:00:00', 2, '76.8300', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10286, 'QUICK', 8, '1996-08-21 00:00:00', '1996-09-18 00:00:00', '1996-08-30 00:00:00', 3, '229.2400', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10287, 'RICAR', 8, '1996-08-22 00:00:00', '1996-09-19 00:00:00', '1996-08-28 00:00:00', 3, '12.7600', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10288, 'REGGC', 4, '1996-08-23 00:00:00', '1996-09-20 00:00:00', '1996-09-03 00:00:00', 1, '7.4500', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10289, 'BSBEV', 7, '1996-08-26 00:00:00', '1996-09-23 00:00:00', '1996-08-28 00:00:00', 3, '22.7700', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10290, 'COMMI', 8, '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-03 00:00:00', 1, '79.7000', 'Comrcio Mineiro', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil'),
(10291, 'QUEDE', 6, '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-04 00:00:00', 2, '6.4000', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10292, 'TRADH', 1, '1996-08-28 00:00:00', '1996-09-25 00:00:00', '1996-09-02 00:00:00', 2, '1.3500', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10293, 'TORTU', 1, '1996-08-29 00:00:00', '1996-09-26 00:00:00', '1996-09-11 00:00:00', 3, '21.1800', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10294, 'RATTC', 4, '1996-08-30 00:00:00', '1996-09-27 00:00:00', '1996-09-05 00:00:00', 2, '147.2600', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10295, 'VINET', 2, '1996-09-02 00:00:00', '1996-09-30 00:00:00', '1996-09-10 00:00:00', 2, '1.1500', 'Vins et alcools Chevalier', '59 rue de l-Abbaye', 'Reims', NULL, '51100', 'France'),
(10296, 'LILAS', 6, '1996-09-03 00:00:00', '1996-10-01 00:00:00', '1996-09-11 00:00:00', 1, '0.1200', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10297, 'BLONP', 5, '1996-09-04 00:00:00', '1996-10-16 00:00:00', '1996-09-10 00:00:00', 2, '5.7400', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10298, 'HUNGO', 6, '1996-09-05 00:00:00', '1996-10-03 00:00:00', '1996-09-11 00:00:00', 2, '168.2200', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10299, 'RICAR', 4, '1996-09-06 00:00:00', '1996-10-04 00:00:00', '1996-09-13 00:00:00', 2, '29.7600', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10300, 'MAGAA', 2, '1996-09-09 00:00:00', '1996-10-07 00:00:00', '1996-09-18 00:00:00', 2, '17.6800', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10301, 'WANDK', 8, '1996-09-09 00:00:00', '1996-10-07 00:00:00', '1996-09-17 00:00:00', 2, '45.0800', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10302, 'SUPRD', 4, '1996-09-10 00:00:00', '1996-10-08 00:00:00', '1996-10-09 00:00:00', 2, '6.2700', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10303, 'GODOS', 7, '1996-09-11 00:00:00', '1996-10-09 00:00:00', '1996-09-18 00:00:00', 2, '107.8300', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10304, 'TORTU', 1, '1996-09-12 00:00:00', '1996-10-10 00:00:00', '1996-09-17 00:00:00', 2, '63.7900', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10305, 'OLDWO', 8, '1996-09-13 00:00:00', '1996-10-11 00:00:00', '1996-10-09 00:00:00', 3, '257.6200', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10306, 'ROMEY', 1, '1996-09-16 00:00:00', '1996-10-14 00:00:00', '1996-09-23 00:00:00', 3, '7.5600', 'Romero y tomillo', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain'),
(10307, 'LONEP', 2, '1996-09-17 00:00:00', '1996-10-15 00:00:00', '1996-09-25 00:00:00', 2, '0.5600', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10308, 'ANATR', 7, '1996-09-18 00:00:00', '1996-10-16 00:00:00', '1996-09-24 00:00:00', 3, '1.6100', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '5021', 'Mexico'),
(10309, 'HUNGO', 3, '1996-09-19 00:00:00', '1996-10-17 00:00:00', '1996-10-23 00:00:00', 1, '47.3000', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10310, 'THEBI', 8, '1996-09-20 00:00:00', '1996-10-18 00:00:00', '1996-09-27 00:00:00', 2, '17.5200', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA'),
(10311, 'DUMON', 1, '1996-09-20 00:00:00', '1996-10-04 00:00:00', '1996-09-26 00:00:00', 3, '24.6900', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France'),
(10312, 'WANDK', 2, '1996-09-23 00:00:00', '1996-10-21 00:00:00', '1996-10-03 00:00:00', 2, '40.2600', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10313, 'QUICK', 2, '1996-09-24 00:00:00', '1996-10-22 00:00:00', '1996-10-04 00:00:00', 2, '1.9600', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10314, 'RATTC', 1, '1996-09-25 00:00:00', '1996-10-23 00:00:00', '1996-10-04 00:00:00', 2, '74.1600', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10315, 'ISLAT', 4, '1996-09-26 00:00:00', '1996-10-24 00:00:00', '1996-10-03 00:00:00', 2, '41.7600', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10316, 'RATTC', 1, '1996-09-27 00:00:00', '1996-10-25 00:00:00', '1996-10-08 00:00:00', 3, '150.1500', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10317, 'LONEP', 6, '1996-09-30 00:00:00', '1996-10-28 00:00:00', '1996-10-10 00:00:00', 1, '12.6900', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10318, 'ISLAT', 8, '1996-10-01 00:00:00', '1996-10-29 00:00:00', '1996-10-04 00:00:00', 2, '4.7300', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10319, 'TORTU', 7, '1996-10-02 00:00:00', '1996-10-30 00:00:00', '1996-10-11 00:00:00', 3, '64.5000', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10320, 'WARTH', 5, '1996-10-03 00:00:00', '1996-10-17 00:00:00', '1996-10-18 00:00:00', 3, '34.5700', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10321, 'ISLAT', 3, '1996-10-03 00:00:00', '1996-10-31 00:00:00', '1996-10-11 00:00:00', 2, '3.4300', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10322, 'PERIC', 7, '1996-10-04 00:00:00', '1996-11-01 00:00:00', '1996-10-23 00:00:00', 3, '0.4000', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10323, 'KOENE', 4, '1996-10-07 00:00:00', '1996-11-04 00:00:00', '1996-10-14 00:00:00', 1, '4.8800', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10324, 'SAVEA', 9, '1996-10-08 00:00:00', '1996-11-05 00:00:00', '1996-10-10 00:00:00', 1, '214.2700', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10325, 'KOENE', 1, '1996-10-09 00:00:00', '1996-10-23 00:00:00', '1996-10-14 00:00:00', 3, '64.8600', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10326, 'BOLID', 4, '1996-10-10 00:00:00', '1996-11-07 00:00:00', '1996-10-14 00:00:00', 2, '77.9200', 'Blido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain'),
(10327, 'FOLKO', 2, '1996-10-11 00:00:00', '1996-11-08 00:00:00', '1996-10-14 00:00:00', 1, '63.3600', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10328, 'FURIB', 4, '1996-10-14 00:00:00', '1996-11-11 00:00:00', '1996-10-17 00:00:00', 3, '87.0300', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10329, 'SPLIR', 4, '1996-10-15 00:00:00', '1996-11-26 00:00:00', '1996-10-23 00:00:00', 2, '191.6700', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10330, 'LILAS', 3, '1996-10-16 00:00:00', '1996-11-13 00:00:00', '1996-10-28 00:00:00', 1, '12.7500', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10331, 'BONAP', 9, '1996-10-16 00:00:00', '1996-11-27 00:00:00', '1996-10-21 00:00:00', 1, '10.1900', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10332, 'MEREP', 3, '1996-10-17 00:00:00', '1996-11-28 00:00:00', '1996-10-21 00:00:00', 2, '52.8400', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10333, 'WARTH', 5, '1996-10-18 00:00:00', '1996-11-15 00:00:00', '1996-10-25 00:00:00', 3, '0.5900', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10334, 'VICTE', 8, '1996-10-21 00:00:00', '1996-11-18 00:00:00', '1996-10-28 00:00:00', 2, '8.5600', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10335, 'HUNGO', 7, '1996-10-22 00:00:00', '1996-11-19 00:00:00', '1996-10-24 00:00:00', 2, '42.1100', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10336, 'PRINI', 7, '1996-10-23 00:00:00', '1996-11-20 00:00:00', '1996-10-25 00:00:00', 2, '15.5100', 'Princesa Isabel Vinhos', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10337, 'FRANK', 4, '1996-10-24 00:00:00', '1996-11-21 00:00:00', '1996-10-29 00:00:00', 3, '108.2600', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10338, 'OLDWO', 4, '1996-10-25 00:00:00', '1996-11-22 00:00:00', '1996-10-29 00:00:00', 3, '84.2100', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10339, 'MEREP', 2, '1996-10-28 00:00:00', '1996-11-25 00:00:00', '1996-11-04 00:00:00', 2, '15.6600', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10340, 'BONAP', 1, '1996-10-29 00:00:00', '1996-11-26 00:00:00', '1996-11-08 00:00:00', 3, '166.3100', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10341, 'SIMOB', 7, '1996-10-29 00:00:00', '1996-11-26 00:00:00', '1996-11-05 00:00:00', 3, '26.7800', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10342, 'FRANK', 4, '1996-10-30 00:00:00', '1996-11-13 00:00:00', '1996-11-04 00:00:00', 2, '54.8300', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10343, 'LEHMS', 4, '1996-10-31 00:00:00', '1996-11-28 00:00:00', '1996-11-06 00:00:00', 1, '110.3700', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10344, 'WHITC', 4, '1996-11-01 00:00:00', '1996-11-29 00:00:00', '1996-11-05 00:00:00', 2, '23.2900', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10345, 'QUICK', 2, '1996-11-04 00:00:00', '1996-12-02 00:00:00', '1996-11-11 00:00:00', 2, '249.0600', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10346, 'RATTC', 3, '1996-11-05 00:00:00', '1996-12-17 00:00:00', '1996-11-08 00:00:00', 3, '142.0800', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10347, 'FAMIA', 4, '1996-11-06 00:00:00', '1996-12-04 00:00:00', '1996-11-08 00:00:00', 3, '3.1000', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10348, 'WANDK', 4, '1996-11-07 00:00:00', '1996-12-05 00:00:00', '1996-11-15 00:00:00', 2, '0.7800', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10349, 'SPLIR', 7, '1996-11-08 00:00:00', '1996-12-06 00:00:00', '1996-11-15 00:00:00', 1, '8.6300', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10350, 'LAMAI', 6, '1996-11-11 00:00:00', '1996-12-09 00:00:00', '1996-12-03 00:00:00', 2, '64.1900', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10351, 'ERNSH', 1, '1996-11-11 00:00:00', '1996-12-09 00:00:00', '1996-11-20 00:00:00', 1, '162.3300', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10352, 'FURIB', 3, '1996-11-12 00:00:00', '1996-11-26 00:00:00', '1996-11-18 00:00:00', 3, '1.3000', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10353, 'PICCO', 7, '1996-11-13 00:00:00', '1996-12-11 00:00:00', '1996-11-25 00:00:00', 3, '360.6300', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10354, 'PERIC', 8, '1996-11-14 00:00:00', '1996-12-12 00:00:00', '1996-11-20 00:00:00', 3, '53.8000', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10355, 'AROUT', 6, '1996-11-15 00:00:00', '1996-12-13 00:00:00', '1996-11-20 00:00:00', 1, '41.9500', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10356, 'WANDK', 6, '1996-11-18 00:00:00', '1996-12-16 00:00:00', '1996-11-27 00:00:00', 2, '36.7100', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10357, 'LILAS', 1, '1996-11-19 00:00:00', '1996-12-17 00:00:00', '1996-12-02 00:00:00', 3, '34.8800', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10358, 'LAMAI', 5, '1996-11-20 00:00:00', '1996-12-18 00:00:00', '1996-11-27 00:00:00', 1, '19.6400', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10359, 'SEVES', 5, '1996-11-21 00:00:00', '1996-12-19 00:00:00', '1996-11-26 00:00:00', 3, '288.4300', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10360, 'BLONP', 4, '1996-11-22 00:00:00', '1996-12-20 00:00:00', '1996-12-02 00:00:00', 3, '131.7000', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10361, 'QUICK', 1, '1996-11-22 00:00:00', '1996-12-20 00:00:00', '1996-12-03 00:00:00', 2, '183.1700', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10362, 'BONAP', 3, '1996-11-25 00:00:00', '1996-12-23 00:00:00', '1996-11-28 00:00:00', 1, '96.0400', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10363, 'DRACD', 4, '1996-11-26 00:00:00', '1996-12-24 00:00:00', '1996-12-04 00:00:00', 3, '30.5400', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(10364, 'EASTC', 1, '1996-11-26 00:00:00', '1997-01-07 00:00:00', '1996-12-04 00:00:00', 1, '71.9700', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(10365, 'ANTON', 3, '1996-11-27 00:00:00', '1996-12-25 00:00:00', '1996-12-02 00:00:00', 2, '22.0000', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10366, 'GALED', 8, '1996-11-28 00:00:00', '1997-01-09 00:00:00', '1996-12-30 00:00:00', 2, '10.1400', 'Galera del gastronmo', 'Rambla de Catalua, 23', 'Barcelona', NULL, '8022', 'Spain'),
(10367, 'VAFFE', 7, '1996-11-28 00:00:00', '1996-12-26 00:00:00', '1996-12-02 00:00:00', 3, '13.5500', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10368, 'ERNSH', 2, '1996-11-29 00:00:00', '1996-12-27 00:00:00', '1996-12-02 00:00:00', 2, '101.9500', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10369, 'SPLIR', 8, '1996-12-02 00:00:00', '1996-12-30 00:00:00', '1996-12-09 00:00:00', 2, '195.6800', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10370, 'CHOPS', 6, '1996-12-03 00:00:00', '1996-12-31 00:00:00', '1996-12-27 00:00:00', 2, '1.1700', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10371, 'LAMAI', 1, '1996-12-03 00:00:00', '1996-12-31 00:00:00', '1996-12-24 00:00:00', 1, '0.4500', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10372, 'QUEEN', 5, '1996-12-04 00:00:00', '1997-01-01 00:00:00', '1996-12-09 00:00:00', 2, '890.7800', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10373, 'HUNGO', 4, '1996-12-05 00:00:00', '1997-01-02 00:00:00', '1996-12-11 00:00:00', 3, '124.1200', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10374, 'WOLZA', 1, '1996-12-05 00:00:00', '1997-01-02 00:00:00', '1996-12-09 00:00:00', 3, '3.9400', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10375, 'HUNGC', 3, '1996-12-06 00:00:00', '1997-01-03 00:00:00', '1996-12-09 00:00:00', 2, '20.1200', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(10376, 'MEREP', 1, '1996-12-09 00:00:00', '1997-01-06 00:00:00', '1996-12-13 00:00:00', 2, '20.3900', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10377, 'SEVES', 1, '1996-12-09 00:00:00', '1997-01-06 00:00:00', '1996-12-13 00:00:00', 3, '22.2100', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10378, 'FOLKO', 5, '1996-12-10 00:00:00', '1997-01-07 00:00:00', '1996-12-19 00:00:00', 3, '5.4400', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10379, 'QUEDE', 2, '1996-12-11 00:00:00', '1997-01-08 00:00:00', '1996-12-13 00:00:00', 1, '45.0300', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10380, 'HUNGO', 8, '1996-12-12 00:00:00', '1997-01-09 00:00:00', '1997-01-16 00:00:00', 3, '35.0300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10381, 'LILAS', 3, '1996-12-12 00:00:00', '1997-01-09 00:00:00', '1996-12-13 00:00:00', 3, '7.9900', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10382, 'ERNSH', 4, '1996-12-13 00:00:00', '1997-01-10 00:00:00', '1996-12-16 00:00:00', 1, '94.7700', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10383, 'AROUT', 8, '1996-12-16 00:00:00', '1997-01-13 00:00:00', '1996-12-18 00:00:00', 3, '34.2400', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10384, 'BERGS', 3, '1996-12-16 00:00:00', '1997-01-13 00:00:00', '1996-12-20 00:00:00', 3, '168.6400', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10385, 'SPLIR', 1, '1996-12-17 00:00:00', '1997-01-14 00:00:00', '1996-12-23 00:00:00', 2, '30.9600', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10386, 'FAMIA', 9, '1996-12-18 00:00:00', '1997-01-01 00:00:00', '1996-12-25 00:00:00', 3, '13.9900', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10387, 'SANTG', 1, '1996-12-18 00:00:00', '1997-01-15 00:00:00', '1996-12-20 00:00:00', 2, '93.6300', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(10388, 'SEVES', 2, '1996-12-19 00:00:00', '1997-01-16 00:00:00', '1996-12-20 00:00:00', 1, '34.8600', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10389, 'BOTTM', 4, '1996-12-20 00:00:00', '1997-01-17 00:00:00', '1996-12-24 00:00:00', 2, '47.4200', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10390, 'ERNSH', 6, '1996-12-23 00:00:00', '1997-01-20 00:00:00', '1996-12-26 00:00:00', 1, '126.3800', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10391, 'DRACD', 3, '1996-12-23 00:00:00', '1997-01-20 00:00:00', '1996-12-31 00:00:00', 3, '5.4500', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(10392, 'PICCO', 2, '1996-12-24 00:00:00', '1997-01-21 00:00:00', '1997-01-01 00:00:00', 3, '122.4600', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10393, 'SAVEA', 1, '1996-12-25 00:00:00', '1997-01-22 00:00:00', '1997-01-03 00:00:00', 3, '126.5600', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10394, 'HUNGC', 1, '1996-12-25 00:00:00', '1997-01-22 00:00:00', '1997-01-03 00:00:00', 3, '30.3400', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(10395, 'HILAA', 6, '1996-12-26 00:00:00', '1997-01-23 00:00:00', '1997-01-03 00:00:00', 1, '184.4100', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10396, 'FRANK', 1, '1996-12-27 00:00:00', '1997-01-10 00:00:00', '1997-01-06 00:00:00', 3, '135.3500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10397, 'PRINI', 5, '1996-12-27 00:00:00', '1997-01-24 00:00:00', '1997-01-02 00:00:00', 1, '60.2600', 'Princesa Isabel Vinhos', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10398, 'SAVEA', 2, '1996-12-30 00:00:00', '1997-01-27 00:00:00', '1997-01-09 00:00:00', 3, '89.1600', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10399, 'VAFFE', 8, '1996-12-31 00:00:00', '1997-01-14 00:00:00', '1997-01-08 00:00:00', 3, '27.3600', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10400, 'EASTC', 1, '1997-01-01 00:00:00', '1997-01-29 00:00:00', '1997-01-16 00:00:00', 3, '83.9300', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(10401, 'RATTC', 1, '1997-01-01 00:00:00', '1997-01-29 00:00:00', '1997-01-10 00:00:00', 1, '12.5100', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10402, 'ERNSH', 8, '1997-01-02 00:00:00', '1997-02-13 00:00:00', '1997-01-10 00:00:00', 2, '67.8800', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10403, 'ERNSH', 4, '1997-01-03 00:00:00', '1997-01-31 00:00:00', '1997-01-09 00:00:00', 3, '73.7900', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10404, 'MAGAA', 2, '1997-01-03 00:00:00', '1997-01-31 00:00:00', '1997-01-08 00:00:00', 1, '155.9700', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10405, 'LINOD', 1, '1997-01-06 00:00:00', '1997-02-03 00:00:00', '1997-01-22 00:00:00', 1, '34.8200', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10406, 'QUEEN', 7, '1997-01-07 00:00:00', '1997-02-18 00:00:00', '1997-01-13 00:00:00', 1, '108.0400', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10407, 'OTTIK', 2, '1997-01-07 00:00:00', '1997-02-04 00:00:00', '1997-01-30 00:00:00', 2, '91.4800', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10408, 'FOLIG', 8, '1997-01-08 00:00:00', '1997-02-05 00:00:00', '1997-01-14 00:00:00', 1, '11.2600', 'Folies gourmandes', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France'),
(10409, 'OCEAN', 3, '1997-01-09 00:00:00', '1997-02-06 00:00:00', '1997-01-14 00:00:00', 1, '29.8300', 'Ocano Atlntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10410, 'BOTTM', 3, '1997-01-10 00:00:00', '1997-02-07 00:00:00', '1997-01-15 00:00:00', 3, '2.4000', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10411, 'BOTTM', 9, '1997-01-10 00:00:00', '1997-02-07 00:00:00', '1997-01-21 00:00:00', 3, '23.6500', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10412, 'WARTH', 8, '1997-01-13 00:00:00', '1997-02-10 00:00:00', '1997-01-15 00:00:00', 2, '3.7700', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10413, 'LAMAI', 3, '1997-01-14 00:00:00', '1997-02-11 00:00:00', '1997-01-16 00:00:00', 2, '95.6600', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10414, 'FAMIA', 2, '1997-01-14 00:00:00', '1997-02-11 00:00:00', '1997-01-17 00:00:00', 3, '21.4800', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10415, 'HUNGC', 3, '1997-01-15 00:00:00', '1997-02-12 00:00:00', '1997-01-24 00:00:00', 1, '0.2000', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(10416, 'WARTH', 8, '1997-01-16 00:00:00', '1997-02-13 00:00:00', '1997-01-27 00:00:00', 3, '22.7200', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10417, 'SIMOB', 4, '1997-01-16 00:00:00', '1997-02-13 00:00:00', '1997-01-28 00:00:00', 3, '70.2900', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10418, 'QUICK', 4, '1997-01-17 00:00:00', '1997-02-14 00:00:00', '1997-01-24 00:00:00', 1, '17.5500', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10419, 'RICSU', 4, '1997-01-20 00:00:00', '1997-02-17 00:00:00', '1997-01-30 00:00:00', 2, '137.3500', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10420, 'WELLI', 3, '1997-01-21 00:00:00', '1997-02-18 00:00:00', '1997-01-27 00:00:00', 1, '44.1200', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10421, 'QUEDE', 8, '1997-01-21 00:00:00', '1997-03-04 00:00:00', '1997-01-27 00:00:00', 1, '99.2300', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10422, 'FRANS', 2, '1997-01-22 00:00:00', '1997-02-19 00:00:00', '1997-01-31 00:00:00', 1, '3.0200', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(10423, 'GOURL', 6, '1997-01-23 00:00:00', '1997-02-06 00:00:00', '1997-02-24 00:00:00', 3, '24.5000', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10424, 'MEREP', 7, '1997-01-23 00:00:00', '1997-02-20 00:00:00', '1997-01-27 00:00:00', 2, '370.6100', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10425, 'LAMAI', 6, '1997-01-24 00:00:00', '1997-02-21 00:00:00', '1997-02-14 00:00:00', 2, '7.9300', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10426, 'GALED', 4, '1997-01-27 00:00:00', '1997-02-24 00:00:00', '1997-02-06 00:00:00', 1, '18.6900', 'Galera del gastronmo', 'Rambla de Catalua, 23', 'Barcelona', NULL, '8022', 'Spain'),
(10427, 'PICCO', 4, '1997-01-27 00:00:00', '1997-02-24 00:00:00', '1997-03-03 00:00:00', 2, '31.2900', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10428, 'REGGC', 7, '1997-01-28 00:00:00', '1997-02-25 00:00:00', '1997-02-04 00:00:00', 1, '11.0900', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10429, 'HUNGO', 3, '1997-01-29 00:00:00', '1997-03-12 00:00:00', '1997-02-07 00:00:00', 2, '56.6300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10430, 'ERNSH', 4, '1997-01-30 00:00:00', '1997-02-13 00:00:00', '1997-02-03 00:00:00', 1, '458.7800', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10431, 'BOTTM', 4, '1997-01-30 00:00:00', '1997-02-13 00:00:00', '1997-02-07 00:00:00', 2, '44.1700', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10432, 'SPLIR', 3, '1997-01-31 00:00:00', '1997-02-14 00:00:00', '1997-02-07 00:00:00', 2, '4.3400', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10433, 'PRINI', 3, '1997-02-03 00:00:00', '1997-03-03 00:00:00', '1997-03-04 00:00:00', 3, '73.8300', 'Princesa Isabel Vinhos', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10434, 'FOLKO', 3, '1997-02-03 00:00:00', '1997-03-03 00:00:00', '1997-02-13 00:00:00', 2, '17.9200', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10435, 'CONSH', 8, '1997-02-04 00:00:00', '1997-03-18 00:00:00', '1997-02-07 00:00:00', 2, '9.2100', 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK'),
(10436, 'BLONP', 3, '1997-02-05 00:00:00', '1997-03-05 00:00:00', '1997-02-11 00:00:00', 2, '156.6600', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10437, 'WARTH', 8, '1997-02-05 00:00:00', '1997-03-05 00:00:00', '1997-02-12 00:00:00', 1, '19.9700', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10438, 'TOMSP', 3, '1997-02-06 00:00:00', '1997-03-06 00:00:00', '1997-02-14 00:00:00', 2, '8.2400', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10439, 'MEREP', 6, '1997-02-07 00:00:00', '1997-03-07 00:00:00', '1997-02-10 00:00:00', 3, '4.0700', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10440, 'SAVEA', 4, '1997-02-10 00:00:00', '1997-03-10 00:00:00', '1997-02-28 00:00:00', 2, '86.5300', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10441, 'OLDWO', 3, '1997-02-10 00:00:00', '1997-03-24 00:00:00', '1997-03-14 00:00:00', 2, '73.0200', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10442, 'ERNSH', 3, '1997-02-11 00:00:00', '1997-03-11 00:00:00', '1997-02-18 00:00:00', 2, '47.9400', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10443, 'REGGC', 8, '1997-02-12 00:00:00', '1997-03-12 00:00:00', '1997-02-14 00:00:00', 1, '13.9500', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10444, 'BERGS', 3, '1997-02-12 00:00:00', '1997-03-12 00:00:00', '1997-02-21 00:00:00', 3, '3.5000', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10445, 'BERGS', 3, '1997-02-13 00:00:00', '1997-03-13 00:00:00', '1997-02-20 00:00:00', 1, '9.3000', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10446, 'TOMSP', 6, '1997-02-14 00:00:00', '1997-03-14 00:00:00', '1997-02-19 00:00:00', 1, '14.6800', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10447, 'RICAR', 4, '1997-02-14 00:00:00', '1997-03-14 00:00:00', '1997-03-07 00:00:00', 2, '68.6600', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10448, 'RANCH', 4, '1997-02-17 00:00:00', '1997-03-17 00:00:00', '1997-02-24 00:00:00', 2, '38.8200', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10449, 'BLONP', 3, '1997-02-18 00:00:00', '1997-03-18 00:00:00', '1997-02-27 00:00:00', 2, '53.3000', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10450, 'VICTE', 8, '1997-02-19 00:00:00', '1997-03-19 00:00:00', '1997-03-11 00:00:00', 2, '7.2300', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10451, 'QUICK', 4, '1997-02-19 00:00:00', '1997-03-05 00:00:00', '1997-03-12 00:00:00', 3, '189.0900', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10452, 'SAVEA', 8, '1997-02-20 00:00:00', '1997-03-20 00:00:00', '1997-02-26 00:00:00', 1, '140.2600', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10453, 'AROUT', 1, '1997-02-21 00:00:00', '1997-03-21 00:00:00', '1997-02-26 00:00:00', 2, '25.3600', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10454, 'LAMAI', 4, '1997-02-21 00:00:00', '1997-03-21 00:00:00', '1997-02-25 00:00:00', 3, '2.7400', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10455, 'WARTH', 8, '1997-02-24 00:00:00', '1997-04-07 00:00:00', '1997-03-03 00:00:00', 2, '180.4500', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10456, 'KOENE', 8, '1997-02-25 00:00:00', '1997-04-08 00:00:00', '1997-02-28 00:00:00', 2, '8.1200', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10457, 'KOENE', 2, '1997-02-25 00:00:00', '1997-03-25 00:00:00', '1997-03-03 00:00:00', 1, '11.5700', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10458, 'SUPRD', 7, '1997-02-26 00:00:00', '1997-03-26 00:00:00', '1997-03-04 00:00:00', 3, '147.0600', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10459, 'VICTE', 4, '1997-02-27 00:00:00', '1997-03-27 00:00:00', '1997-02-28 00:00:00', 2, '25.0900', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10460, 'FOLKO', 8, '1997-02-28 00:00:00', '1997-03-28 00:00:00', '1997-03-03 00:00:00', 1, '16.2700', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10461, 'LILAS', 1, '1997-02-28 00:00:00', '1997-03-28 00:00:00', '1997-03-05 00:00:00', 3, '148.6100', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10462, 'CONSH', 2, '1997-03-03 00:00:00', '1997-03-31 00:00:00', '1997-03-18 00:00:00', 1, '6.1700', 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK'),
(10463, 'SUPRD', 5, '1997-03-04 00:00:00', '1997-04-01 00:00:00', '1997-03-06 00:00:00', 3, '14.7800', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10464, 'FURIB', 4, '1997-03-04 00:00:00', '1997-04-01 00:00:00', '1997-03-14 00:00:00', 2, '89.0000', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10465, 'VAFFE', 1, '1997-03-05 00:00:00', '1997-04-02 00:00:00', '1997-03-14 00:00:00', 3, '145.0400', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10466, 'COMMI', 4, '1997-03-06 00:00:00', '1997-04-03 00:00:00', '1997-03-13 00:00:00', 1, '11.9300', 'Comrcio Mineiro', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil'),
(10467, 'MAGAA', 8, '1997-03-06 00:00:00', '1997-04-03 00:00:00', '1997-03-11 00:00:00', 2, '4.9300', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10468, 'KOENE', 3, '1997-03-07 00:00:00', '1997-04-04 00:00:00', '1997-03-12 00:00:00', 3, '44.1200', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10469, 'WHITC', 1, '1997-03-10 00:00:00', '1997-04-07 00:00:00', '1997-03-14 00:00:00', 1, '60.1800', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10470, 'BONAP', 4, '1997-03-11 00:00:00', '1997-04-08 00:00:00', '1997-03-14 00:00:00', 2, '64.5600', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10471, 'BSBEV', 2, '1997-03-11 00:00:00', '1997-04-08 00:00:00', '1997-03-18 00:00:00', 3, '45.5900', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10472, 'SEVES', 8, '1997-03-12 00:00:00', '1997-04-09 00:00:00', '1997-03-19 00:00:00', 1, '4.2000', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10473, 'ISLAT', 1, '1997-03-13 00:00:00', '1997-03-27 00:00:00', '1997-03-21 00:00:00', 3, '16.3700', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10474, 'PERIC', 5, '1997-03-13 00:00:00', '1997-04-10 00:00:00', '1997-03-21 00:00:00', 2, '83.4900', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10475, 'SUPRD', 9, '1997-03-14 00:00:00', '1997-04-11 00:00:00', '1997-04-04 00:00:00', 1, '68.5200', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10476, 'HILAA', 8, '1997-03-17 00:00:00', '1997-04-14 00:00:00', '1997-03-24 00:00:00', 3, '4.4100', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10477, 'PRINI', 5, '1997-03-17 00:00:00', '1997-04-14 00:00:00', '1997-03-25 00:00:00', 2, '13.0200', 'Princesa Isabel Vinhos', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10478, 'VICTE', 2, '1997-03-18 00:00:00', '1997-04-01 00:00:00', '1997-03-26 00:00:00', 3, '4.8100', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10479, 'RATTC', 3, '1997-03-19 00:00:00', '1997-04-16 00:00:00', '1997-03-21 00:00:00', 3, '708.9500', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10480, 'FOLIG', 6, '1997-03-20 00:00:00', '1997-04-17 00:00:00', '1997-03-24 00:00:00', 2, '1.3500', 'Folies gourmandes', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France'),
(10481, 'RICAR', 8, '1997-03-20 00:00:00', '1997-04-17 00:00:00', '1997-03-25 00:00:00', 2, '64.3300', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10482, 'LAZYK', 1, '1997-03-21 00:00:00', '1997-04-18 00:00:00', '1997-04-10 00:00:00', 3, '7.4800', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA'),
(10483, 'WHITC', 7, '1997-03-24 00:00:00', '1997-04-21 00:00:00', '1997-04-25 00:00:00', 2, '15.2800', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10484, 'BSBEV', 3, '1997-03-24 00:00:00', '1997-04-21 00:00:00', '1997-04-01 00:00:00', 3, '6.8800', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10485, 'LINOD', 4, '1997-03-25 00:00:00', '1997-04-08 00:00:00', '1997-03-31 00:00:00', 2, '64.4500', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10486, 'HILAA', 1, '1997-03-26 00:00:00', '1997-04-23 00:00:00', '1997-04-02 00:00:00', 2, '30.5300', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10487, 'QUEEN', 2, '1997-03-26 00:00:00', '1997-04-23 00:00:00', '1997-03-28 00:00:00', 2, '71.0700', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10488, 'FRANK', 8, '1997-03-27 00:00:00', '1997-04-24 00:00:00', '1997-04-02 00:00:00', 2, '4.9300', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10489, 'PICCO', 6, '1997-03-28 00:00:00', '1997-04-25 00:00:00', '1997-04-09 00:00:00', 2, '5.2900', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10490, 'HILAA', 7, '1997-03-31 00:00:00', '1997-04-28 00:00:00', '1997-04-03 00:00:00', 2, '210.1900', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10491, 'FURIB', 8, '1997-03-31 00:00:00', '1997-04-28 00:00:00', '1997-04-08 00:00:00', 3, '16.9600', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10492, 'BOTTM', 3, '1997-04-01 00:00:00', '1997-04-29 00:00:00', '1997-04-11 00:00:00', 1, '62.8900', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10493, 'LAMAI', 4, '1997-04-02 00:00:00', '1997-04-30 00:00:00', '1997-04-10 00:00:00', 3, '10.6400', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10494, 'COMMI', 4, '1997-04-02 00:00:00', '1997-04-30 00:00:00', '1997-04-09 00:00:00', 2, '65.9900', 'Comrcio Mineiro', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil'),
(10495, 'LAUGB', 3, '1997-04-03 00:00:00', '1997-05-01 00:00:00', '1997-04-11 00:00:00', 3, '4.6500', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada'),
(10496, 'TRADH', 7, '1997-04-04 00:00:00', '1997-05-02 00:00:00', '1997-04-07 00:00:00', 2, '46.7700', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10497, 'LEHMS', 7, '1997-04-04 00:00:00', '1997-05-02 00:00:00', '1997-04-07 00:00:00', 1, '36.2100', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10498, 'HILAA', 8, '1997-04-07 00:00:00', '1997-05-05 00:00:00', '1997-04-11 00:00:00', 2, '29.7500', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10499, 'LILAS', 4, '1997-04-08 00:00:00', '1997-05-06 00:00:00', '1997-04-16 00:00:00', 2, '102.0200', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10500, 'LAMAI', 6, '1997-04-09 00:00:00', '1997-05-07 00:00:00', '1997-04-17 00:00:00', 1, '42.6800', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10501, 'BLAUS', 9, '1997-04-09 00:00:00', '1997-05-07 00:00:00', '1997-04-16 00:00:00', 3, '8.8500', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10502, 'PERIC', 2, '1997-04-10 00:00:00', '1997-05-08 00:00:00', '1997-04-29 00:00:00', 1, '69.3200', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10503, 'HUNGO', 6, '1997-04-11 00:00:00', '1997-05-09 00:00:00', '1997-04-16 00:00:00', 2, '16.7400', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10504, 'WHITC', 4, '1997-04-11 00:00:00', '1997-05-09 00:00:00', '1997-04-18 00:00:00', 3, '59.1300', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10505, 'MEREP', 3, '1997-04-14 00:00:00', '1997-05-12 00:00:00', '1997-04-21 00:00:00', 3, '7.1300', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10506, 'KOENE', 9, '1997-04-15 00:00:00', '1997-05-13 00:00:00', '1997-05-02 00:00:00', 2, '21.1900', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10507, 'ANTON', 7, '1997-04-15 00:00:00', '1997-05-13 00:00:00', '1997-04-22 00:00:00', 1, '47.4500', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10508, 'OTTIK', 1, '1997-04-16 00:00:00', '1997-05-14 00:00:00', '1997-05-13 00:00:00', 2, '4.9900', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10509, 'BLAUS', 4, '1997-04-17 00:00:00', '1997-05-15 00:00:00', '1997-04-29 00:00:00', 1, '0.1500', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10510, 'SAVEA', 6, '1997-04-18 00:00:00', '1997-05-16 00:00:00', '1997-04-28 00:00:00', 3, '367.6300', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10511, 'BONAP', 4, '1997-04-18 00:00:00', '1997-05-16 00:00:00', '1997-04-21 00:00:00', 3, '350.6400', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10512, 'FAMIA', 7, '1997-04-21 00:00:00', '1997-05-19 00:00:00', '1997-04-24 00:00:00', 2, '3.5300', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10513, 'WANDK', 7, '1997-04-22 00:00:00', '1997-06-03 00:00:00', '1997-04-28 00:00:00', 1, '105.6500', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10514, 'ERNSH', 3, '1997-04-22 00:00:00', '1997-05-20 00:00:00', '1997-05-16 00:00:00', 2, '789.9500', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10515, 'QUICK', 2, '1997-04-23 00:00:00', '1997-05-07 00:00:00', '1997-05-23 00:00:00', 1, '204.4700', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10516, 'HUNGO', 2, '1997-04-24 00:00:00', '1997-05-22 00:00:00', '1997-05-01 00:00:00', 3, '62.7800', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10517, 'NORTS', 3, '1997-04-24 00:00:00', '1997-05-22 00:00:00', '1997-04-29 00:00:00', 3, '32.0700', 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO `orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES
(10518, 'TORTU', 4, '1997-04-25 00:00:00', '1997-05-09 00:00:00', '1997-05-05 00:00:00', 2, '218.1500', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10519, 'CHOPS', 6, '1997-04-28 00:00:00', '1997-05-26 00:00:00', '1997-05-01 00:00:00', 3, '91.7600', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10520, 'SANTG', 7, '1997-04-29 00:00:00', '1997-05-27 00:00:00', '1997-05-01 00:00:00', 1, '13.3700', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(10521, 'CACTU', 8, '1997-04-29 00:00:00', '1997-05-27 00:00:00', '1997-05-02 00:00:00', 2, '17.2200', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10522, 'LEHMS', 4, '1997-04-30 00:00:00', '1997-05-28 00:00:00', '1997-05-06 00:00:00', 1, '45.3300', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10523, 'SEVES', 7, '1997-05-01 00:00:00', '1997-05-29 00:00:00', '1997-05-30 00:00:00', 2, '77.6300', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10524, 'BERGS', 1, '1997-05-01 00:00:00', '1997-05-29 00:00:00', '1997-05-07 00:00:00', 2, '244.7900', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10525, 'BONAP', 1, '1997-05-02 00:00:00', '1997-05-30 00:00:00', '1997-05-23 00:00:00', 2, '11.0600', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10526, 'WARTH', 4, '1997-05-05 00:00:00', '1997-06-02 00:00:00', '1997-05-15 00:00:00', 2, '58.5900', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10527, 'QUICK', 7, '1997-05-05 00:00:00', '1997-06-02 00:00:00', '1997-05-07 00:00:00', 1, '41.9000', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10528, 'GREAL', 6, '1997-05-06 00:00:00', '1997-05-20 00:00:00', '1997-05-09 00:00:00', 2, '3.3500', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10529, 'MAISD', 5, '1997-05-07 00:00:00', '1997-06-04 00:00:00', '1997-05-09 00:00:00', 2, '66.6900', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10530, 'PICCO', 3, '1997-05-08 00:00:00', '1997-06-05 00:00:00', '1997-05-12 00:00:00', 2, '339.2200', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10531, 'OCEAN', 7, '1997-05-08 00:00:00', '1997-06-05 00:00:00', '1997-05-19 00:00:00', 1, '8.1200', 'Ocano Atlntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10532, 'EASTC', 7, '1997-05-09 00:00:00', '1997-06-06 00:00:00', '1997-05-12 00:00:00', 3, '74.4600', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(10533, 'FOLKO', 8, '1997-05-12 00:00:00', '1997-06-09 00:00:00', '1997-05-22 00:00:00', 1, '188.0400', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10534, 'LEHMS', 8, '1997-05-12 00:00:00', '1997-06-09 00:00:00', '1997-05-14 00:00:00', 2, '27.9400', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10535, 'ANTON', 4, '1997-05-13 00:00:00', '1997-06-10 00:00:00', '1997-05-21 00:00:00', 1, '15.6400', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10536, 'LEHMS', 3, '1997-05-14 00:00:00', '1997-06-11 00:00:00', '1997-06-06 00:00:00', 2, '58.8800', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10537, 'RICSU', 1, '1997-05-14 00:00:00', '1997-05-28 00:00:00', '1997-05-19 00:00:00', 1, '78.8500', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10538, 'BSBEV', 9, '1997-05-15 00:00:00', '1997-06-12 00:00:00', '1997-05-16 00:00:00', 3, '4.8700', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10539, 'BSBEV', 6, '1997-05-16 00:00:00', '1997-06-13 00:00:00', '1997-05-23 00:00:00', 3, '12.3600', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10540, 'QUICK', 3, '1997-05-19 00:00:00', '1997-06-16 00:00:00', '1997-06-13 00:00:00', 3, '1007.6400', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10541, 'HANAR', 2, '1997-05-19 00:00:00', '1997-06-16 00:00:00', '1997-05-29 00:00:00', 1, '68.6500', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10542, 'KOENE', 1, '1997-05-20 00:00:00', '1997-06-17 00:00:00', '1997-05-26 00:00:00', 3, '10.9500', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10543, 'LILAS', 8, '1997-05-21 00:00:00', '1997-06-18 00:00:00', '1997-05-23 00:00:00', 2, '48.1700', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10544, 'LONEP', 4, '1997-05-21 00:00:00', '1997-06-18 00:00:00', '1997-05-30 00:00:00', 1, '24.9100', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10545, 'LAZYK', 8, '1997-05-22 00:00:00', '1997-06-19 00:00:00', '1997-06-26 00:00:00', 2, '11.9200', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA'),
(10546, 'VICTE', 1, '1997-05-23 00:00:00', '1997-06-20 00:00:00', '1997-05-27 00:00:00', 3, '194.7200', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10547, 'SEVES', 3, '1997-05-23 00:00:00', '1997-06-20 00:00:00', '1997-06-02 00:00:00', 2, '178.4300', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10548, 'TOMSP', 3, '1997-05-26 00:00:00', '1997-06-23 00:00:00', '1997-06-02 00:00:00', 2, '1.4300', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10549, 'QUICK', 5, '1997-05-27 00:00:00', '1997-06-10 00:00:00', '1997-05-30 00:00:00', 1, '171.2400', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10550, 'GODOS', 7, '1997-05-28 00:00:00', '1997-06-25 00:00:00', '1997-06-06 00:00:00', 3, '4.3200', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10551, 'FURIB', 4, '1997-05-28 00:00:00', '1997-07-09 00:00:00', '1997-06-06 00:00:00', 3, '72.9500', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10552, 'HILAA', 2, '1997-05-29 00:00:00', '1997-06-26 00:00:00', '1997-06-05 00:00:00', 1, '83.2200', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10553, 'WARTH', 2, '1997-05-30 00:00:00', '1997-06-27 00:00:00', '1997-06-03 00:00:00', 2, '149.4900', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10554, 'OTTIK', 4, '1997-05-30 00:00:00', '1997-06-27 00:00:00', '1997-06-05 00:00:00', 3, '120.9700', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10555, 'SAVEA', 6, '1997-06-02 00:00:00', '1997-06-30 00:00:00', '1997-06-04 00:00:00', 3, '252.4900', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10556, 'SIMOB', 2, '1997-06-03 00:00:00', '1997-07-15 00:00:00', '1997-06-13 00:00:00', 1, '9.8000', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10557, 'LEHMS', 9, '1997-06-03 00:00:00', '1997-06-17 00:00:00', '1997-06-06 00:00:00', 2, '96.7200', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10558, 'AROUT', 1, '1997-06-04 00:00:00', '1997-07-02 00:00:00', '1997-06-10 00:00:00', 2, '72.9700', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10559, 'BLONP', 6, '1997-06-05 00:00:00', '1997-07-03 00:00:00', '1997-06-13 00:00:00', 1, '8.0500', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10560, 'FRANK', 8, '1997-06-06 00:00:00', '1997-07-04 00:00:00', '1997-06-09 00:00:00', 1, '36.6500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10561, 'FOLKO', 2, '1997-06-06 00:00:00', '1997-07-04 00:00:00', '1997-06-09 00:00:00', 2, '242.2100', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10562, 'REGGC', 1, '1997-06-09 00:00:00', '1997-07-07 00:00:00', '1997-06-12 00:00:00', 1, '22.9500', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10563, 'RICAR', 2, '1997-06-10 00:00:00', '1997-07-22 00:00:00', '1997-06-24 00:00:00', 2, '60.4300', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10564, 'RATTC', 4, '1997-06-10 00:00:00', '1997-07-08 00:00:00', '1997-06-16 00:00:00', 3, '13.7500', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10565, 'MEREP', 8, '1997-06-11 00:00:00', '1997-07-09 00:00:00', '1997-06-18 00:00:00', 2, '7.1500', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10566, 'BLONP', 9, '1997-06-12 00:00:00', '1997-07-10 00:00:00', '1997-06-18 00:00:00', 1, '88.4000', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10567, 'HUNGO', 1, '1997-06-12 00:00:00', '1997-07-10 00:00:00', '1997-06-17 00:00:00', 1, '33.9700', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10568, 'GALED', 3, '1997-06-13 00:00:00', '1997-07-11 00:00:00', '1997-07-09 00:00:00', 3, '6.5400', 'Galera del gastronmo', 'Rambla de Catalua, 23', 'Barcelona', NULL, '8022', 'Spain'),
(10569, 'RATTC', 5, '1997-06-16 00:00:00', '1997-07-14 00:00:00', '1997-07-11 00:00:00', 1, '58.9800', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10570, 'MEREP', 3, '1997-06-17 00:00:00', '1997-07-15 00:00:00', '1997-06-19 00:00:00', 3, '188.9900', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10571, 'ERNSH', 8, '1997-06-17 00:00:00', '1997-07-29 00:00:00', '1997-07-04 00:00:00', 3, '26.0600', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10572, 'BERGS', 3, '1997-06-18 00:00:00', '1997-07-16 00:00:00', '1997-06-25 00:00:00', 2, '116.4300', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10573, 'ANTON', 7, '1997-06-19 00:00:00', '1997-07-17 00:00:00', '1997-06-20 00:00:00', 3, '84.8400', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10574, 'TRAIH', 4, '1997-06-19 00:00:00', '1997-07-17 00:00:00', '1997-06-30 00:00:00', 2, '37.6000', 'Trail-s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA'),
(10575, 'MORGK', 5, '1997-06-20 00:00:00', '1997-07-04 00:00:00', '1997-06-30 00:00:00', 1, '127.3400', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '4179', 'Germany'),
(10576, 'TORTU', 3, '1997-06-23 00:00:00', '1997-07-07 00:00:00', '1997-06-30 00:00:00', 3, '18.5600', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10577, 'TRAIH', 9, '1997-06-23 00:00:00', '1997-08-04 00:00:00', '1997-06-30 00:00:00', 2, '25.4100', 'Trail-s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA'),
(10578, 'BSBEV', 4, '1997-06-24 00:00:00', '1997-07-22 00:00:00', '1997-07-25 00:00:00', 3, '29.6000', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10579, 'LETSS', 1, '1997-06-25 00:00:00', '1997-07-23 00:00:00', '1997-07-04 00:00:00', 2, '13.7300', 'Let-s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(10580, 'OTTIK', 4, '1997-06-26 00:00:00', '1997-07-24 00:00:00', '1997-07-01 00:00:00', 3, '75.8900', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10581, 'FAMIA', 3, '1997-06-26 00:00:00', '1997-07-24 00:00:00', '1997-07-02 00:00:00', 1, '3.0100', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10582, 'BLAUS', 3, '1997-06-27 00:00:00', '1997-07-25 00:00:00', '1997-07-14 00:00:00', 2, '27.7100', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10583, 'WARTH', 2, '1997-06-30 00:00:00', '1997-07-28 00:00:00', '1997-07-04 00:00:00', 2, '7.2800', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10584, 'BLONP', 4, '1997-06-30 00:00:00', '1997-07-28 00:00:00', '1997-07-04 00:00:00', 1, '59.1400', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10585, 'WELLI', 7, '1997-07-01 00:00:00', '1997-07-29 00:00:00', '1997-07-10 00:00:00', 1, '13.4100', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10586, 'REGGC', 9, '1997-07-02 00:00:00', '1997-07-30 00:00:00', '1997-07-09 00:00:00', 1, '0.4800', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10587, 'QUEDE', 1, '1997-07-02 00:00:00', '1997-07-30 00:00:00', '1997-07-09 00:00:00', 1, '62.5200', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10588, 'QUICK', 2, '1997-07-03 00:00:00', '1997-07-31 00:00:00', '1997-07-10 00:00:00', 3, '194.6700', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10589, 'GREAL', 8, '1997-07-04 00:00:00', '1997-08-01 00:00:00', '1997-07-14 00:00:00', 2, '4.4200', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10590, 'MEREP', 4, '1997-07-07 00:00:00', '1997-08-04 00:00:00', '1997-07-14 00:00:00', 3, '44.7700', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10591, 'VAFFE', 1, '1997-07-07 00:00:00', '1997-07-21 00:00:00', '1997-07-16 00:00:00', 1, '55.9200', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10592, 'LEHMS', 3, '1997-07-08 00:00:00', '1997-08-05 00:00:00', '1997-07-16 00:00:00', 1, '32.1000', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10593, 'LEHMS', 7, '1997-07-09 00:00:00', '1997-08-06 00:00:00', '1997-08-13 00:00:00', 2, '174.2000', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10594, 'OLDWO', 3, '1997-07-09 00:00:00', '1997-08-06 00:00:00', '1997-07-16 00:00:00', 2, '5.2400', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10595, 'ERNSH', 2, '1997-07-10 00:00:00', '1997-08-07 00:00:00', '1997-07-14 00:00:00', 1, '96.7800', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10596, 'WHITC', 8, '1997-07-11 00:00:00', '1997-08-08 00:00:00', '1997-08-12 00:00:00', 1, '16.3400', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10597, 'PICCO', 7, '1997-07-11 00:00:00', '1997-08-08 00:00:00', '1997-07-18 00:00:00', 3, '35.1200', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10598, 'RATTC', 1, '1997-07-14 00:00:00', '1997-08-11 00:00:00', '1997-07-18 00:00:00', 3, '44.4200', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10599, 'BSBEV', 6, '1997-07-15 00:00:00', '1997-08-26 00:00:00', '1997-07-21 00:00:00', 3, '29.9800', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10600, 'HUNGC', 4, '1997-07-16 00:00:00', '1997-08-13 00:00:00', '1997-07-21 00:00:00', 1, '45.1300', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(10601, 'HILAA', 7, '1997-07-16 00:00:00', '1997-08-27 00:00:00', '1997-07-22 00:00:00', 1, '58.3000', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10602, 'VAFFE', 8, '1997-07-17 00:00:00', '1997-08-14 00:00:00', '1997-07-22 00:00:00', 2, '2.9200', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10603, 'SAVEA', 8, '1997-07-18 00:00:00', '1997-08-15 00:00:00', '1997-08-08 00:00:00', 2, '48.7700', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10604, 'FURIB', 1, '1997-07-18 00:00:00', '1997-08-15 00:00:00', '1997-07-29 00:00:00', 1, '7.4600', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10605, 'MEREP', 1, '1997-07-21 00:00:00', '1997-08-18 00:00:00', '1997-07-29 00:00:00', 2, '379.1300', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10606, 'TRADH', 4, '1997-07-22 00:00:00', '1997-08-19 00:00:00', '1997-07-31 00:00:00', 3, '79.4000', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10607, 'SAVEA', 5, '1997-07-22 00:00:00', '1997-08-19 00:00:00', '1997-07-25 00:00:00', 1, '200.2400', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10608, 'TOMSP', 4, '1997-07-23 00:00:00', '1997-08-20 00:00:00', '1997-08-01 00:00:00', 2, '27.7900', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10609, 'DUMON', 7, '1997-07-24 00:00:00', '1997-08-21 00:00:00', '1997-07-30 00:00:00', 2, '1.8500', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France'),
(10610, 'LAMAI', 8, '1997-07-25 00:00:00', '1997-08-22 00:00:00', '1997-08-06 00:00:00', 1, '26.7800', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10611, 'WOLZA', 6, '1997-07-25 00:00:00', '1997-08-22 00:00:00', '1997-08-01 00:00:00', 2, '80.6500', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10612, 'SAVEA', 1, '1997-07-28 00:00:00', '1997-08-25 00:00:00', '1997-08-01 00:00:00', 2, '544.0800', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10613, 'HILAA', 4, '1997-07-29 00:00:00', '1997-08-26 00:00:00', '1997-08-01 00:00:00', 2, '8.1100', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10614, 'BLAUS', 8, '1997-07-29 00:00:00', '1997-08-26 00:00:00', '1997-08-01 00:00:00', 3, '1.9300', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10615, 'WILMK', 2, '1997-07-30 00:00:00', '1997-08-27 00:00:00', '1997-08-06 00:00:00', 3, '0.7500', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10616, 'GREAL', 1, '1997-07-31 00:00:00', '1997-08-28 00:00:00', '1997-08-05 00:00:00', 2, '116.5300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10617, 'GREAL', 4, '1997-07-31 00:00:00', '1997-08-28 00:00:00', '1997-08-04 00:00:00', 2, '18.5300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10618, 'MEREP', 1, '1997-08-01 00:00:00', '1997-09-12 00:00:00', '1997-08-08 00:00:00', 1, '154.6800', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10619, 'MEREP', 3, '1997-08-04 00:00:00', '1997-09-01 00:00:00', '1997-08-07 00:00:00', 3, '91.0500', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10620, 'LAUGB', 2, '1997-08-05 00:00:00', '1997-09-02 00:00:00', '1997-08-14 00:00:00', 3, '0.9400', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada'),
(10621, 'ISLAT', 4, '1997-08-05 00:00:00', '1997-09-02 00:00:00', '1997-08-11 00:00:00', 2, '23.7300', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10622, 'RICAR', 4, '1997-08-06 00:00:00', '1997-09-03 00:00:00', '1997-08-11 00:00:00', 3, '50.9700', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10623, 'FRANK', 8, '1997-08-07 00:00:00', '1997-09-04 00:00:00', '1997-08-12 00:00:00', 2, '97.1800', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10624, 'THECR', 4, '1997-08-07 00:00:00', '1997-09-04 00:00:00', '1997-08-19 00:00:00', 2, '94.8000', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA'),
(10625, 'ANATR', 3, '1997-08-08 00:00:00', '1997-09-05 00:00:00', '1997-08-14 00:00:00', 1, '43.9000', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '5021', 'Mexico'),
(10626, 'BERGS', 1, '1997-08-11 00:00:00', '1997-09-08 00:00:00', '1997-08-20 00:00:00', 2, '138.6900', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10627, 'SAVEA', 8, '1997-08-11 00:00:00', '1997-09-22 00:00:00', '1997-08-21 00:00:00', 3, '107.4600', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10628, 'BLONP', 4, '1997-08-12 00:00:00', '1997-09-09 00:00:00', '1997-08-20 00:00:00', 3, '30.3600', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10629, 'GODOS', 4, '1997-08-12 00:00:00', '1997-09-09 00:00:00', '1997-08-20 00:00:00', 3, '85.4600', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10630, 'KOENE', 1, '1997-08-13 00:00:00', '1997-09-10 00:00:00', '1997-08-19 00:00:00', 2, '32.3500', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10631, 'LAMAI', 8, '1997-08-14 00:00:00', '1997-09-11 00:00:00', '1997-08-15 00:00:00', 1, '0.8700', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10632, 'WANDK', 8, '1997-08-14 00:00:00', '1997-09-11 00:00:00', '1997-08-19 00:00:00', 1, '41.3800', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10633, 'ERNSH', 7, '1997-08-15 00:00:00', '1997-09-12 00:00:00', '1997-08-18 00:00:00', 3, '477.9000', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10634, 'FOLIG', 4, '1997-08-15 00:00:00', '1997-09-12 00:00:00', '1997-08-21 00:00:00', 3, '487.3800', 'Folies gourmandes', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France'),
(10635, 'MAGAA', 8, '1997-08-18 00:00:00', '1997-09-15 00:00:00', '1997-08-21 00:00:00', 3, '47.4600', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10636, 'WARTH', 4, '1997-08-19 00:00:00', '1997-09-16 00:00:00', '1997-08-26 00:00:00', 1, '1.1500', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10637, 'QUEEN', 6, '1997-08-19 00:00:00', '1997-09-16 00:00:00', '1997-08-26 00:00:00', 1, '201.2900', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10638, 'LINOD', 3, '1997-08-20 00:00:00', '1997-09-17 00:00:00', '1997-09-01 00:00:00', 1, '158.4400', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10639, 'SANTG', 7, '1997-08-20 00:00:00', '1997-09-17 00:00:00', '1997-08-27 00:00:00', 3, '38.6400', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(10640, 'WANDK', 4, '1997-08-21 00:00:00', '1997-09-18 00:00:00', '1997-08-28 00:00:00', 1, '23.5500', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10641, 'HILAA', 4, '1997-08-22 00:00:00', '1997-09-19 00:00:00', '1997-08-26 00:00:00', 2, '179.6100', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10642, 'SIMOB', 7, '1997-08-22 00:00:00', '1997-09-19 00:00:00', '1997-09-05 00:00:00', 3, '41.8900', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10643, 'ALFKI', 6, '1997-08-25 00:00:00', '1997-09-22 00:00:00', '1997-09-02 00:00:00', 1, '29.4600', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(10644, 'WELLI', 3, '1997-08-25 00:00:00', '1997-09-22 00:00:00', '1997-09-01 00:00:00', 2, '0.1400', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10645, 'HANAR', 4, '1997-08-26 00:00:00', '1997-09-23 00:00:00', '1997-09-02 00:00:00', 1, '12.4100', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10646, 'HUNGO', 9, '1997-08-27 00:00:00', '1997-10-08 00:00:00', '1997-09-03 00:00:00', 3, '142.3300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10647, 'QUEDE', 4, '1997-08-27 00:00:00', '1997-09-10 00:00:00', '1997-09-03 00:00:00', 2, '45.5400', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10648, 'RICAR', 5, '1997-08-28 00:00:00', '1997-10-09 00:00:00', '1997-09-09 00:00:00', 2, '14.2500', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10649, 'MAISD', 5, '1997-08-28 00:00:00', '1997-09-25 00:00:00', '1997-08-29 00:00:00', 3, '6.2000', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10650, 'FAMIA', 5, '1997-08-29 00:00:00', '1997-09-26 00:00:00', '1997-09-03 00:00:00', 3, '176.8100', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10651, 'WANDK', 8, '1997-09-01 00:00:00', '1997-09-29 00:00:00', '1997-09-11 00:00:00', 2, '20.6000', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10652, 'GOURL', 4, '1997-09-01 00:00:00', '1997-09-29 00:00:00', '1997-09-08 00:00:00', 2, '7.1400', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10653, 'FRANK', 1, '1997-09-02 00:00:00', '1997-09-30 00:00:00', '1997-09-19 00:00:00', 1, '93.2500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10654, 'BERGS', 5, '1997-09-02 00:00:00', '1997-09-30 00:00:00', '1997-09-11 00:00:00', 1, '55.2600', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10655, 'REGGC', 1, '1997-09-03 00:00:00', '1997-10-01 00:00:00', '1997-09-11 00:00:00', 2, '4.4100', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10656, 'GREAL', 6, '1997-09-04 00:00:00', '1997-10-02 00:00:00', '1997-09-10 00:00:00', 1, '57.1500', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10657, 'SAVEA', 2, '1997-09-04 00:00:00', '1997-10-02 00:00:00', '1997-09-15 00:00:00', 2, '352.6900', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10658, 'QUICK', 4, '1997-09-05 00:00:00', '1997-10-03 00:00:00', '1997-09-08 00:00:00', 1, '364.1500', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10659, 'QUEEN', 7, '1997-09-05 00:00:00', '1997-10-03 00:00:00', '1997-09-10 00:00:00', 2, '105.8100', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10660, 'HUNGC', 8, '1997-09-08 00:00:00', '1997-10-06 00:00:00', '1997-10-15 00:00:00', 1, '111.2900', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(10661, 'HUNGO', 7, '1997-09-09 00:00:00', '1997-10-07 00:00:00', '1997-09-15 00:00:00', 3, '17.5500', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10662, 'LONEP', 3, '1997-09-09 00:00:00', '1997-10-07 00:00:00', '1997-09-18 00:00:00', 2, '1.2800', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10663, 'BONAP', 2, '1997-09-10 00:00:00', '1997-09-24 00:00:00', '1997-10-03 00:00:00', 2, '113.1500', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10664, 'FURIB', 1, '1997-09-10 00:00:00', '1997-10-08 00:00:00', '1997-09-19 00:00:00', 3, '1.2700', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10665, 'LONEP', 1, '1997-09-11 00:00:00', '1997-10-09 00:00:00', '1997-09-17 00:00:00', 2, '26.3100', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10666, 'RICSU', 7, '1997-09-12 00:00:00', '1997-10-10 00:00:00', '1997-09-22 00:00:00', 2, '232.4200', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10667, 'ERNSH', 7, '1997-09-12 00:00:00', '1997-10-10 00:00:00', '1997-09-19 00:00:00', 1, '78.0900', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10668, 'WANDK', 1, '1997-09-15 00:00:00', '1997-10-13 00:00:00', '1997-09-23 00:00:00', 2, '47.2200', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(10669, 'SIMOB', 2, '1997-09-15 00:00:00', '1997-10-13 00:00:00', '1997-09-22 00:00:00', 1, '24.3900', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10670, 'FRANK', 4, '1997-09-16 00:00:00', '1997-10-14 00:00:00', '1997-09-18 00:00:00', 1, '203.4800', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10671, 'FRANR', 1, '1997-09-17 00:00:00', '1997-10-15 00:00:00', '1997-09-24 00:00:00', 1, '30.3400', 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France'),
(10672, 'BERGS', 9, '1997-09-17 00:00:00', '1997-10-01 00:00:00', '1997-09-26 00:00:00', 2, '95.7500', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10673, 'WILMK', 2, '1997-09-18 00:00:00', '1997-10-16 00:00:00', '1997-09-19 00:00:00', 1, '22.7600', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10674, 'ISLAT', 4, '1997-09-18 00:00:00', '1997-10-16 00:00:00', '1997-09-30 00:00:00', 2, '0.9000', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10675, 'FRANK', 5, '1997-09-19 00:00:00', '1997-10-17 00:00:00', '1997-09-23 00:00:00', 2, '31.8500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10676, 'TORTU', 2, '1997-09-22 00:00:00', '1997-10-20 00:00:00', '1997-09-29 00:00:00', 2, '2.0100', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10677, 'ANTON', 1, '1997-09-22 00:00:00', '1997-10-20 00:00:00', '1997-09-26 00:00:00', 3, '4.0300', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10678, 'SAVEA', 7, '1997-09-23 00:00:00', '1997-10-21 00:00:00', '1997-10-16 00:00:00', 3, '388.9800', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10679, 'BLONP', 8, '1997-09-23 00:00:00', '1997-10-21 00:00:00', '1997-09-30 00:00:00', 3, '27.9400', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10680, 'OLDWO', 1, '1997-09-24 00:00:00', '1997-10-22 00:00:00', '1997-09-26 00:00:00', 1, '26.6100', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10681, 'GREAL', 3, '1997-09-25 00:00:00', '1997-10-23 00:00:00', '1997-09-30 00:00:00', 3, '76.1300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10682, 'ANTON', 3, '1997-09-25 00:00:00', '1997-10-23 00:00:00', '1997-10-01 00:00:00', 2, '36.1300', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10683, 'DUMON', 2, '1997-09-26 00:00:00', '1997-10-24 00:00:00', '1997-10-01 00:00:00', 1, '4.4000', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France'),
(10684, 'OTTIK', 3, '1997-09-26 00:00:00', '1997-10-24 00:00:00', '1997-09-30 00:00:00', 1, '145.6300', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10685, 'GOURL', 4, '1997-09-29 00:00:00', '1997-10-13 00:00:00', '1997-10-03 00:00:00', 2, '33.7500', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10686, 'PICCO', 2, '1997-09-30 00:00:00', '1997-10-28 00:00:00', '1997-10-08 00:00:00', 1, '96.5000', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10687, 'HUNGO', 9, '1997-09-30 00:00:00', '1997-10-28 00:00:00', '1997-10-30 00:00:00', 2, '296.4300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10688, 'VAFFE', 4, '1997-10-01 00:00:00', '1997-10-15 00:00:00', '1997-10-07 00:00:00', 2, '299.0900', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10689, 'BERGS', 1, '1997-10-01 00:00:00', '1997-10-29 00:00:00', '1997-10-07 00:00:00', 2, '13.4200', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10690, 'HANAR', 1, '1997-10-02 00:00:00', '1997-10-30 00:00:00', '1997-10-03 00:00:00', 1, '15.8000', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10691, 'QUICK', 2, '1997-10-03 00:00:00', '1997-11-14 00:00:00', '1997-10-22 00:00:00', 2, '810.0500', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10692, 'ALFKI', 4, '1997-10-03 00:00:00', '1997-10-31 00:00:00', '1997-10-13 00:00:00', 2, '61.0200', 'Alfred-s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(10693, 'WHITC', 3, '1997-10-06 00:00:00', '1997-10-20 00:00:00', '1997-10-10 00:00:00', 3, '139.3400', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10694, 'QUICK', 8, '1997-10-06 00:00:00', '1997-11-03 00:00:00', '1997-10-09 00:00:00', 3, '398.3600', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10695, 'WILMK', 7, '1997-10-07 00:00:00', '1997-11-18 00:00:00', '1997-10-14 00:00:00', 1, '16.7200', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10696, 'WHITC', 8, '1997-10-08 00:00:00', '1997-11-19 00:00:00', '1997-10-14 00:00:00', 3, '102.5500', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10697, 'LINOD', 3, '1997-10-08 00:00:00', '1997-11-05 00:00:00', '1997-10-14 00:00:00', 1, '45.5200', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10698, 'ERNSH', 4, '1997-10-09 00:00:00', '1997-11-06 00:00:00', '1997-10-17 00:00:00', 1, '272.4700', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10699, 'MORGK', 3, '1997-10-09 00:00:00', '1997-11-06 00:00:00', '1997-10-13 00:00:00', 3, '0.5800', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '4179', 'Germany'),
(10700, 'SAVEA', 3, '1997-10-10 00:00:00', '1997-11-07 00:00:00', '1997-10-16 00:00:00', 1, '65.1000', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10701, 'HUNGO', 6, '1997-10-13 00:00:00', '1997-10-27 00:00:00', '1997-10-15 00:00:00', 3, '220.3100', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10702, 'ALFKI', 4, '1997-10-13 00:00:00', '1997-11-24 00:00:00', '1997-10-21 00:00:00', 1, '23.9400', 'Alfred-s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(10703, 'FOLKO', 6, '1997-10-14 00:00:00', '1997-11-11 00:00:00', '1997-10-20 00:00:00', 2, '152.3000', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10704, 'QUEEN', 6, '1997-10-14 00:00:00', '1997-11-11 00:00:00', '1997-11-07 00:00:00', 1, '4.7800', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10705, 'HILAA', 9, '1997-10-15 00:00:00', '1997-11-12 00:00:00', '1997-11-18 00:00:00', 2, '3.5200', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10706, 'OLDWO', 8, '1997-10-16 00:00:00', '1997-11-13 00:00:00', '1997-10-21 00:00:00', 3, '135.6300', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10707, 'AROUT', 4, '1997-10-16 00:00:00', '1997-10-30 00:00:00', '1997-10-23 00:00:00', 3, '21.7400', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10708, 'THEBI', 6, '1997-10-17 00:00:00', '1997-11-28 00:00:00', '1997-11-05 00:00:00', 2, '2.9600', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA'),
(10709, 'GOURL', 1, '1997-10-17 00:00:00', '1997-11-14 00:00:00', '1997-11-20 00:00:00', 3, '210.8000', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10710, 'FRANS', 1, '1997-10-20 00:00:00', '1997-11-17 00:00:00', '1997-10-23 00:00:00', 1, '4.9800', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(10711, 'SAVEA', 5, '1997-10-21 00:00:00', '1997-12-02 00:00:00', '1997-10-29 00:00:00', 2, '52.4100', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10712, 'HUNGO', 3, '1997-10-21 00:00:00', '1997-11-18 00:00:00', '1997-10-31 00:00:00', 1, '89.9300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10713, 'SAVEA', 1, '1997-10-22 00:00:00', '1997-11-19 00:00:00', '1997-10-24 00:00:00', 1, '167.0500', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10714, 'SAVEA', 5, '1997-10-22 00:00:00', '1997-11-19 00:00:00', '1997-10-27 00:00:00', 3, '24.4900', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10715, 'BONAP', 3, '1997-10-23 00:00:00', '1997-11-06 00:00:00', '1997-10-29 00:00:00', 1, '63.2000', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10716, 'RANCH', 4, '1997-10-24 00:00:00', '1997-11-21 00:00:00', '1997-10-27 00:00:00', 2, '22.5700', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10717, 'FRANK', 1, '1997-10-24 00:00:00', '1997-11-21 00:00:00', '1997-10-29 00:00:00', 2, '59.2500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10718, 'KOENE', 1, '1997-10-27 00:00:00', '1997-11-24 00:00:00', '1997-10-29 00:00:00', 3, '170.8800', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10719, 'LETSS', 8, '1997-10-27 00:00:00', '1997-11-24 00:00:00', '1997-11-05 00:00:00', 2, '51.4400', 'Let-s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(10720, 'QUEDE', 8, '1997-10-28 00:00:00', '1997-11-11 00:00:00', '1997-11-05 00:00:00', 2, '9.5300', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10721, 'QUICK', 5, '1997-10-29 00:00:00', '1997-11-26 00:00:00', '1997-10-31 00:00:00', 3, '48.9200', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10722, 'SAVEA', 8, '1997-10-29 00:00:00', '1997-12-10 00:00:00', '1997-11-04 00:00:00', 1, '74.5800', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10723, 'WHITC', 3, '1997-10-30 00:00:00', '1997-11-27 00:00:00', '1997-11-25 00:00:00', 1, '21.7200', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10724, 'MEREP', 8, '1997-10-30 00:00:00', '1997-12-11 00:00:00', '1997-11-05 00:00:00', 2, '57.7500', 'Mre Paillarde', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada'),
(10725, 'FAMIA', 4, '1997-10-31 00:00:00', '1997-11-28 00:00:00', '1997-11-05 00:00:00', 3, '10.8300', 'Familia Arquibaldo', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil'),
(10726, 'EASTC', 4, '1997-11-03 00:00:00', '1997-11-17 00:00:00', '1997-12-05 00:00:00', 1, '16.5600', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(10727, 'REGGC', 2, '1997-11-03 00:00:00', '1997-12-01 00:00:00', '1997-12-05 00:00:00', 1, '89.9000', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10728, 'QUEEN', 4, '1997-11-04 00:00:00', '1997-12-02 00:00:00', '1997-11-11 00:00:00', 2, '58.3300', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10729, 'LINOD', 8, '1997-11-04 00:00:00', '1997-12-16 00:00:00', '1997-11-14 00:00:00', 3, '141.0600', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10730, 'BONAP', 5, '1997-11-05 00:00:00', '1997-12-03 00:00:00', '1997-11-14 00:00:00', 1, '20.1200', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10731, 'CHOPS', 7, '1997-11-06 00:00:00', '1997-12-04 00:00:00', '1997-11-14 00:00:00', 1, '96.6500', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10732, 'BONAP', 3, '1997-11-06 00:00:00', '1997-12-04 00:00:00', '1997-11-07 00:00:00', 1, '16.9700', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10733, 'BERGS', 1, '1997-11-07 00:00:00', '1997-12-05 00:00:00', '1997-11-10 00:00:00', 3, '110.1100', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10734, 'GOURL', 2, '1997-11-07 00:00:00', '1997-12-05 00:00:00', '1997-11-12 00:00:00', 3, '1.6300', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10735, 'LETSS', 6, '1997-11-10 00:00:00', '1997-12-08 00:00:00', '1997-11-21 00:00:00', 2, '45.9700', 'Let-s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(10736, 'HUNGO', 9, '1997-11-11 00:00:00', '1997-12-09 00:00:00', '1997-11-21 00:00:00', 2, '44.1000', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10737, 'VINET', 2, '1997-11-11 00:00:00', '1997-12-09 00:00:00', '1997-11-18 00:00:00', 2, '7.7900', 'Vins et alcools Chevalier', '59 rue de l-Abbaye', 'Reims', NULL, '51100', 'France'),
(10738, 'SPECD', 2, '1997-11-12 00:00:00', '1997-12-10 00:00:00', '1997-11-18 00:00:00', 1, '2.9100', 'Spcialits du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France'),
(10739, 'VINET', 3, '1997-11-12 00:00:00', '1997-12-10 00:00:00', '1997-11-17 00:00:00', 3, '11.0800', 'Vins et alcools Chevalier', '59 rue de l-Abbaye', 'Reims', NULL, '51100', 'France'),
(10740, 'WHITC', 4, '1997-11-13 00:00:00', '1997-12-11 00:00:00', '1997-11-25 00:00:00', 2, '81.8800', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10741, 'AROUT', 4, '1997-11-14 00:00:00', '1997-11-28 00:00:00', '1997-11-18 00:00:00', 3, '10.9600', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10742, 'BOTTM', 3, '1997-11-14 00:00:00', '1997-12-12 00:00:00', '1997-11-18 00:00:00', 3, '243.7300', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10743, 'AROUT', 1, '1997-11-17 00:00:00', '1997-12-15 00:00:00', '1997-11-21 00:00:00', 2, '23.7200', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10744, 'VAFFE', 6, '1997-11-17 00:00:00', '1997-12-15 00:00:00', '1997-11-24 00:00:00', 1, '69.1900', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10745, 'QUICK', 9, '1997-11-18 00:00:00', '1997-12-16 00:00:00', '1997-11-27 00:00:00', 1, '3.5200', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10746, 'CHOPS', 1, '1997-11-19 00:00:00', '1997-12-17 00:00:00', '1997-11-21 00:00:00', 3, '31.4300', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10747, 'PICCO', 6, '1997-11-19 00:00:00', '1997-12-17 00:00:00', '1997-11-26 00:00:00', 1, '117.3300', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10748, 'SAVEA', 3, '1997-11-20 00:00:00', '1997-12-18 00:00:00', '1997-11-28 00:00:00', 1, '232.5500', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10749, 'ISLAT', 4, '1997-11-20 00:00:00', '1997-12-18 00:00:00', '1997-12-19 00:00:00', 2, '61.5300', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10750, 'WARTH', 9, '1997-11-21 00:00:00', '1997-12-19 00:00:00', '1997-11-24 00:00:00', 1, '79.3000', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10751, 'RICSU', 3, '1997-11-24 00:00:00', '1997-12-22 00:00:00', '1997-12-03 00:00:00', 3, '130.7900', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10752, 'NORTS', 2, '1997-11-24 00:00:00', '1997-12-22 00:00:00', '1997-11-28 00:00:00', 3, '1.3900', 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK'),
(10753, 'FRANS', 3, '1997-11-25 00:00:00', '1997-12-23 00:00:00', '1997-11-27 00:00:00', 1, '7.7000', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(10754, 'MAGAA', 6, '1997-11-25 00:00:00', '1997-12-23 00:00:00', '1997-11-27 00:00:00', 3, '2.3800', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10755, 'BONAP', 4, '1997-11-26 00:00:00', '1997-12-24 00:00:00', '1997-11-28 00:00:00', 2, '16.7100', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10756, 'SPLIR', 8, '1997-11-27 00:00:00', '1997-12-25 00:00:00', '1997-12-02 00:00:00', 2, '73.2100', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10757, 'SAVEA', 6, '1997-11-27 00:00:00', '1997-12-25 00:00:00', '1997-12-15 00:00:00', 1, '8.1900', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10758, 'RICSU', 3, '1997-11-28 00:00:00', '1997-12-26 00:00:00', '1997-12-04 00:00:00', 3, '138.1700', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10759, 'ANATR', 3, '1997-11-28 00:00:00', '1997-12-26 00:00:00', '1997-12-12 00:00:00', 3, '11.9900', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '5021', 'Mexico'),
(10760, 'MAISD', 4, '1997-12-01 00:00:00', '1997-12-29 00:00:00', '1997-12-10 00:00:00', 1, '155.6400', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10761, 'RATTC', 5, '1997-12-02 00:00:00', '1997-12-30 00:00:00', '1997-12-08 00:00:00', 2, '18.6600', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10762, 'FOLKO', 3, '1997-12-02 00:00:00', '1997-12-30 00:00:00', '1997-12-09 00:00:00', 1, '328.7400', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10763, 'FOLIG', 3, '1997-12-03 00:00:00', '1997-12-31 00:00:00', '1997-12-08 00:00:00', 3, '37.3500', 'Folies gourmandes', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France'),
(10764, 'ERNSH', 6, '1997-12-03 00:00:00', '1997-12-31 00:00:00', '1997-12-08 00:00:00', 3, '145.4500', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10765, 'QUICK', 3, '1997-12-04 00:00:00', '1998-01-01 00:00:00', '1997-12-09 00:00:00', 3, '42.7400', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10766, 'OTTIK', 4, '1997-12-05 00:00:00', '1998-01-02 00:00:00', '1997-12-09 00:00:00', 1, '157.5500', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10767, 'SUPRD', 4, '1997-12-05 00:00:00', '1998-01-02 00:00:00', '1997-12-15 00:00:00', 3, '1.5900', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10768, 'AROUT', 3, '1997-12-08 00:00:00', '1998-01-05 00:00:00', '1997-12-15 00:00:00', 2, '146.3200', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10769, 'VAFFE', 3, '1997-12-08 00:00:00', '1998-01-05 00:00:00', '1997-12-12 00:00:00', 1, '65.0600', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10770, 'HANAR', 8, '1997-12-09 00:00:00', '1998-01-06 00:00:00', '1997-12-17 00:00:00', 3, '5.3200', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10771, 'ERNSH', 9, '1997-12-10 00:00:00', '1998-01-07 00:00:00', '1998-01-02 00:00:00', 2, '11.1900', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10772, 'LEHMS', 3, '1997-12-10 00:00:00', '1998-01-07 00:00:00', '1997-12-19 00:00:00', 2, '91.2800', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10773, 'ERNSH', 1, '1997-12-11 00:00:00', '1998-01-08 00:00:00', '1997-12-16 00:00:00', 3, '96.4300', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10774, 'FOLKO', 4, '1997-12-11 00:00:00', '1997-12-25 00:00:00', '1997-12-12 00:00:00', 1, '48.2000', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10775, 'THECR', 7, '1997-12-12 00:00:00', '1998-01-09 00:00:00', '1997-12-26 00:00:00', 1, '20.2500', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA'),
(10776, 'ERNSH', 1, '1997-12-15 00:00:00', '1998-01-12 00:00:00', '1997-12-18 00:00:00', 3, '351.5300', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10777, 'GOURL', 7, '1997-12-15 00:00:00', '1997-12-29 00:00:00', '1998-01-21 00:00:00', 2, '3.0100', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10778, 'BERGS', 3, '1997-12-16 00:00:00', '1998-01-13 00:00:00', '1997-12-24 00:00:00', 1, '6.7900', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10779, 'MORGK', 3, '1997-12-16 00:00:00', '1998-01-13 00:00:00', '1998-01-14 00:00:00', 2, '58.1300', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '4179', 'Germany'),
(10780, 'LILAS', 2, '1997-12-16 00:00:00', '1997-12-30 00:00:00', '1997-12-25 00:00:00', 1, '42.1300', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10781, 'WARTH', 2, '1997-12-17 00:00:00', '1998-01-14 00:00:00', '1997-12-19 00:00:00', 3, '73.1600', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(10782, 'CACTU', 9, '1997-12-17 00:00:00', '1998-01-14 00:00:00', '1997-12-22 00:00:00', 3, '1.1000', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10783, 'HANAR', 4, '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-19 00:00:00', 2, '124.9800', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10784, 'MAGAA', 4, '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-22 00:00:00', 3, '70.0900', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10785, 'GROSR', 1, '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-24 00:00:00', 3, '1.5100', 'GROSELLA-Restaurante', '5 Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela'),
(10786, 'QUEEN', 8, '1997-12-19 00:00:00', '1998-01-16 00:00:00', '1997-12-23 00:00:00', 1, '110.8700', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10787, 'LAMAI', 2, '1997-12-19 00:00:00', '1998-01-02 00:00:00', '1997-12-26 00:00:00', 1, '249.9300', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10788, 'QUICK', 1, '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1998-01-19 00:00:00', 2, '42.7000', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10789, 'FOLIG', 1, '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1997-12-31 00:00:00', 2, '100.6000', 'Folies gourmandes', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France'),
(10790, 'GOURL', 6, '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1997-12-26 00:00:00', 1, '28.2300', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES
(10791, 'FRANK', 6, '1997-12-23 00:00:00', '1998-01-20 00:00:00', '1998-01-01 00:00:00', 2, '16.8500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10792, 'WOLZA', 1, '1997-12-23 00:00:00', '1998-01-20 00:00:00', '1997-12-31 00:00:00', 3, '23.7900', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10793, 'AROUT', 3, '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-08 00:00:00', 3, '4.5200', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10794, 'QUEDE', 6, '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-02 00:00:00', 1, '21.4900', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10795, 'ERNSH', 8, '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-20 00:00:00', 2, '126.6600', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10796, 'HILAA', 3, '1997-12-25 00:00:00', '1998-01-22 00:00:00', '1998-01-14 00:00:00', 1, '26.5200', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10797, 'DRACD', 7, '1997-12-25 00:00:00', '1998-01-22 00:00:00', '1998-01-05 00:00:00', 2, '33.3500', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(10798, 'ISLAT', 2, '1997-12-26 00:00:00', '1998-01-23 00:00:00', '1998-01-05 00:00:00', 1, '2.3300', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10799, 'KOENE', 9, '1997-12-26 00:00:00', '1998-02-06 00:00:00', '1998-01-05 00:00:00', 3, '30.7600', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10800, 'SEVES', 1, '1997-12-26 00:00:00', '1998-01-23 00:00:00', '1998-01-05 00:00:00', 3, '137.4400', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10801, 'BOLID', 4, '1997-12-29 00:00:00', '1998-01-26 00:00:00', '1997-12-31 00:00:00', 2, '97.0900', 'Blido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain'),
(10802, 'SIMOB', 4, '1997-12-29 00:00:00', '1998-01-26 00:00:00', '1998-01-02 00:00:00', 2, '257.2600', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(10803, 'WELLI', 4, '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-06 00:00:00', 1, '55.2300', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10804, 'SEVES', 6, '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-07 00:00:00', 2, '27.3300', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10805, 'THEBI', 2, '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-09 00:00:00', 3, '237.3400', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA'),
(10806, 'VICTE', 3, '1997-12-31 00:00:00', '1998-01-28 00:00:00', '1998-01-05 00:00:00', 2, '22.1100', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10807, 'FRANS', 4, '1997-12-31 00:00:00', '1998-01-28 00:00:00', '1998-01-30 00:00:00', 1, '1.3600', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(10808, 'OLDWO', 2, '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-09 00:00:00', 3, '45.5300', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10809, 'WELLI', 7, '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-07 00:00:00', 1, '4.8700', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10810, 'LAUGB', 2, '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-07 00:00:00', 3, '4.3300', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada'),
(10811, 'LINOD', 8, '1998-01-02 00:00:00', '1998-01-30 00:00:00', '1998-01-08 00:00:00', 1, '31.2200', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10812, 'REGGC', 5, '1998-01-02 00:00:00', '1998-01-30 00:00:00', '1998-01-12 00:00:00', 1, '59.7800', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10813, 'RICAR', 1, '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-09 00:00:00', 1, '47.3800', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10814, 'VICTE', 3, '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-14 00:00:00', 3, '130.9400', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10815, 'SAVEA', 2, '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-14 00:00:00', 3, '14.6200', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10816, 'GREAL', 4, '1998-01-06 00:00:00', '1998-02-03 00:00:00', '1998-02-04 00:00:00', 2, '719.7800', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10817, 'KOENE', 3, '1998-01-06 00:00:00', '1998-01-20 00:00:00', '1998-01-13 00:00:00', 2, '306.0700', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10818, 'MAGAA', 7, '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-12 00:00:00', 3, '65.4800', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10819, 'CACTU', 2, '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-16 00:00:00', 3, '19.7600', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10820, 'RATTC', 3, '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-13 00:00:00', 2, '37.5200', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10821, 'SPLIR', 1, '1998-01-08 00:00:00', '1998-02-05 00:00:00', '1998-01-15 00:00:00', 1, '36.6800', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10822, 'TRAIH', 6, '1998-01-08 00:00:00', '1998-02-05 00:00:00', '1998-01-16 00:00:00', 3, '7.0000', 'Trail-s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA'),
(10823, 'LILAS', 5, '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-13 00:00:00', 2, '163.9700', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10824, 'FOLKO', 8, '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-30 00:00:00', 1, '1.2300', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10825, 'DRACD', 1, '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-14 00:00:00', 1, '79.2500', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(10826, 'BLONP', 6, '1998-01-12 00:00:00', '1998-02-09 00:00:00', '1998-02-06 00:00:00', 1, '7.0900', 'Blondel pre et fils', '24, place Klber', 'Strasbourg', NULL, '67000', 'France'),
(10827, 'BONAP', 1, '1998-01-12 00:00:00', '1998-01-26 00:00:00', '1998-02-06 00:00:00', 2, '63.5400', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10828, 'RANCH', 9, '1998-01-13 00:00:00', '1998-01-27 00:00:00', '1998-02-04 00:00:00', 1, '90.8500', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10829, 'ISLAT', 9, '1998-01-13 00:00:00', '1998-02-10 00:00:00', '1998-01-23 00:00:00', 1, '154.7200', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10830, 'TRADH', 4, '1998-01-13 00:00:00', '1998-02-24 00:00:00', '1998-01-21 00:00:00', 2, '81.8300', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10831, 'SANTG', 3, '1998-01-14 00:00:00', '1998-02-11 00:00:00', '1998-01-23 00:00:00', 2, '72.1900', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(10832, 'LAMAI', 2, '1998-01-14 00:00:00', '1998-02-11 00:00:00', '1998-01-19 00:00:00', 2, '43.2600', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10833, 'OTTIK', 6, '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-23 00:00:00', 2, '71.4900', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(10834, 'TRADH', 1, '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-19 00:00:00', 3, '29.7800', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10835, 'ALFKI', 1, '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-21 00:00:00', 3, '69.5300', 'Alfred-s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(10836, 'ERNSH', 7, '1998-01-16 00:00:00', '1998-02-13 00:00:00', '1998-01-21 00:00:00', 1, '411.8800', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10837, 'BERGS', 9, '1998-01-16 00:00:00', '1998-02-13 00:00:00', '1998-01-23 00:00:00', 3, '13.3200', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10838, 'LINOD', 3, '1998-01-19 00:00:00', '1998-02-16 00:00:00', '1998-01-23 00:00:00', 3, '59.2800', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10839, 'TRADH', 3, '1998-01-19 00:00:00', '1998-02-16 00:00:00', '1998-01-22 00:00:00', 3, '35.4300', 'Tradiao Hipermercados', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil'),
(10840, 'LINOD', 4, '1998-01-19 00:00:00', '1998-03-02 00:00:00', '1998-02-16 00:00:00', 2, '2.7100', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10841, 'SUPRD', 5, '1998-01-20 00:00:00', '1998-02-17 00:00:00', '1998-01-29 00:00:00', 2, '424.3000', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10842, 'TORTU', 1, '1998-01-20 00:00:00', '1998-02-17 00:00:00', '1998-01-29 00:00:00', 3, '54.4200', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10843, 'VICTE', 4, '1998-01-21 00:00:00', '1998-02-18 00:00:00', '1998-01-26 00:00:00', 2, '9.2600', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10844, 'PICCO', 8, '1998-01-21 00:00:00', '1998-02-18 00:00:00', '1998-01-26 00:00:00', 2, '25.2200', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10845, 'QUICK', 8, '1998-01-21 00:00:00', '1998-02-04 00:00:00', '1998-01-30 00:00:00', 1, '212.9800', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10846, 'SUPRD', 2, '1998-01-22 00:00:00', '1998-03-05 00:00:00', '1998-01-23 00:00:00', 3, '56.4600', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10847, 'SAVEA', 4, '1998-01-22 00:00:00', '1998-02-05 00:00:00', '1998-02-10 00:00:00', 3, '487.5700', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10848, 'CONSH', 7, '1998-01-23 00:00:00', '1998-02-20 00:00:00', '1998-01-29 00:00:00', 2, '38.2400', 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK'),
(10849, 'KOENE', 9, '1998-01-23 00:00:00', '1998-02-20 00:00:00', '1998-01-30 00:00:00', 2, '0.5600', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10850, 'VICTE', 1, '1998-01-23 00:00:00', '1998-03-06 00:00:00', '1998-01-30 00:00:00', 1, '49.1900', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
(10851, 'RICAR', 5, '1998-01-26 00:00:00', '1998-02-23 00:00:00', '1998-02-02 00:00:00', 1, '160.5500', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10852, 'RATTC', 8, '1998-01-26 00:00:00', '1998-02-09 00:00:00', '1998-01-30 00:00:00', 1, '174.0500', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10853, 'BLAUS', 9, '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-03 00:00:00', 2, '53.8300', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10854, 'ERNSH', 3, '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-05 00:00:00', 2, '100.2200', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10855, 'OLDWO', 3, '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-04 00:00:00', 1, '170.9700', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10856, 'ANTON', 3, '1998-01-28 00:00:00', '1998-02-25 00:00:00', '1998-02-10 00:00:00', 2, '58.4300', 'Antonio Moreno Taquera', 'Mataderos 2312', 'Mxico D.F.', NULL, '5023', 'Mexico'),
(10857, 'BERGS', 8, '1998-01-28 00:00:00', '1998-02-25 00:00:00', '1998-02-06 00:00:00', 2, '188.8500', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10858, 'LACOR', 2, '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-03 00:00:00', 1, '52.5100', 'La corne d-abondance', '67, avenue de l-Europe', 'Versailles', NULL, '78000', 'France'),
(10859, 'FRANK', 1, '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-02 00:00:00', 2, '76.1000', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10860, 'FRANR', 3, '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-04 00:00:00', 3, '19.2600', 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France'),
(10861, 'WHITC', 4, '1998-01-30 00:00:00', '1998-02-27 00:00:00', '1998-02-17 00:00:00', 2, '14.9300', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10862, 'LEHMS', 8, '1998-01-30 00:00:00', '1998-03-13 00:00:00', '1998-02-02 00:00:00', 2, '53.2300', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10863, 'HILAA', 4, '1998-02-02 00:00:00', '1998-03-02 00:00:00', '1998-02-17 00:00:00', 2, '30.2600', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10864, 'AROUT', 4, '1998-02-02 00:00:00', '1998-03-02 00:00:00', '1998-02-09 00:00:00', 2, '3.0400', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10865, 'QUICK', 2, '1998-02-02 00:00:00', '1998-02-16 00:00:00', '1998-02-12 00:00:00', 1, '348.1400', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10866, 'BERGS', 5, '1998-02-03 00:00:00', '1998-03-03 00:00:00', '1998-02-12 00:00:00', 1, '109.1100', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10867, 'LONEP', 6, '1998-02-03 00:00:00', '1998-03-17 00:00:00', '1998-02-11 00:00:00', 1, '1.9300', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10868, 'QUEEN', 7, '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-23 00:00:00', 2, '191.2700', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10869, 'SEVES', 5, '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-09 00:00:00', 1, '143.2800', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK'),
(10870, 'WOLZA', 5, '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-13 00:00:00', 3, '12.0400', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10871, 'BONAP', 9, '1998-02-05 00:00:00', '1998-03-05 00:00:00', '1998-02-10 00:00:00', 2, '112.2700', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10872, 'GODOS', 5, '1998-02-05 00:00:00', '1998-03-05 00:00:00', '1998-02-09 00:00:00', 2, '175.3200', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10873, 'WILMK', 4, '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-02-09 00:00:00', 1, '0.8200', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10874, 'GODOS', 5, '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-02-11 00:00:00', 2, '19.5800', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10875, 'BERGS', 4, '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-03-03 00:00:00', 2, '32.3700', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10876, 'BONAP', 7, '1998-02-09 00:00:00', '1998-03-09 00:00:00', '1998-02-12 00:00:00', 3, '60.4200', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10877, 'RICAR', 1, '1998-02-09 00:00:00', '1998-03-09 00:00:00', '1998-02-19 00:00:00', 1, '38.0600', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(10878, 'QUICK', 4, '1998-02-10 00:00:00', '1998-03-10 00:00:00', '1998-02-12 00:00:00', 1, '46.6900', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10879, 'WILMK', 3, '1998-02-10 00:00:00', '1998-03-10 00:00:00', '1998-02-12 00:00:00', 3, '8.5000', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10880, 'FOLKO', 7, '1998-02-10 00:00:00', '1998-03-24 00:00:00', '1998-02-18 00:00:00', 1, '88.0100', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10881, 'CACTU', 4, '1998-02-11 00:00:00', '1998-03-11 00:00:00', '1998-02-18 00:00:00', 1, '2.8400', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10882, 'SAVEA', 4, '1998-02-11 00:00:00', '1998-03-11 00:00:00', '1998-02-20 00:00:00', 3, '23.1000', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10883, 'LONEP', 8, '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-20 00:00:00', 3, '0.5300', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(10884, 'LETSS', 4, '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-13 00:00:00', 2, '90.9700', 'Let-s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(10885, 'SUPRD', 6, '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-18 00:00:00', 3, '5.6400', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10886, 'HANAR', 1, '1998-02-13 00:00:00', '1998-03-13 00:00:00', '1998-03-02 00:00:00', 1, '4.9900', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10887, 'GALED', 8, '1998-02-13 00:00:00', '1998-03-13 00:00:00', '1998-02-16 00:00:00', 3, '1.2500', 'Galera del gastronmo', 'Rambla de Catalua, 23', 'Barcelona', NULL, '8022', 'Spain'),
(10888, 'GODOS', 1, '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-23 00:00:00', 2, '51.8700', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10889, 'RATTC', 9, '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-23 00:00:00', 3, '280.6100', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10890, 'DUMON', 7, '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-18 00:00:00', 1, '32.7600', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France'),
(10891, 'LEHMS', 7, '1998-02-17 00:00:00', '1998-03-17 00:00:00', '1998-02-19 00:00:00', 2, '20.3700', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10892, 'MAISD', 4, '1998-02-17 00:00:00', '1998-03-17 00:00:00', '1998-02-19 00:00:00', 2, '120.2700', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10893, 'KOENE', 9, '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-20 00:00:00', 2, '77.7800', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(10894, 'SAVEA', 1, '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-20 00:00:00', 1, '116.1300', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10895, 'ERNSH', 3, '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-23 00:00:00', 1, '162.7500', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10896, 'MAISD', 7, '1998-02-19 00:00:00', '1998-03-19 00:00:00', '1998-02-27 00:00:00', 3, '32.4500', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10897, 'HUNGO', 3, '1998-02-19 00:00:00', '1998-03-19 00:00:00', '1998-02-25 00:00:00', 2, '603.5400', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10898, 'OCEAN', 4, '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-03-06 00:00:00', 2, '1.2700', 'Ocano Atlntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10899, 'LILAS', 5, '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-02-26 00:00:00', 3, '1.2100', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10900, 'WELLI', 1, '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-03-04 00:00:00', 2, '1.6600', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10901, 'HILAA', 4, '1998-02-23 00:00:00', '1998-03-23 00:00:00', '1998-02-26 00:00:00', 1, '62.0900', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10902, 'FOLKO', 1, '1998-02-23 00:00:00', '1998-03-23 00:00:00', '1998-03-03 00:00:00', 1, '44.1500', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10903, 'HANAR', 3, '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-03-04 00:00:00', 3, '36.7100', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10904, 'WHITC', 3, '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-02-27 00:00:00', 3, '162.9500', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(10905, 'WELLI', 9, '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-03-06 00:00:00', 2, '13.7200', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10906, 'WOLZA', 4, '1998-02-25 00:00:00', '1998-03-11 00:00:00', '1998-03-03 00:00:00', 3, '26.2900', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10907, 'SPECD', 6, '1998-02-25 00:00:00', '1998-03-25 00:00:00', '1998-02-27 00:00:00', 3, '9.1900', 'Spcialits du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France'),
(10908, 'REGGC', 4, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-06 00:00:00', 2, '32.9600', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10909, 'SANTG', 1, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-10 00:00:00', 2, '53.0500', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(10910, 'WILMK', 1, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-04 00:00:00', 3, '38.1100', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(10911, 'GODOS', 3, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-05 00:00:00', 1, '38.1900', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10912, 'HUNGO', 2, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-18 00:00:00', 2, '580.9100', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10913, 'QUEEN', 4, '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-04 00:00:00', 1, '33.0500', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10914, 'QUEEN', 6, '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-02 00:00:00', 1, '21.1900', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10915, 'TORTU', 2, '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-02 00:00:00', 2, '3.5100', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10916, 'RANCH', 1, '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-09 00:00:00', 2, '63.7700', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10917, 'ROMEY', 4, '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-11 00:00:00', 2, '8.2900', 'Romero y tomillo', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain'),
(10918, 'BOTTM', 3, '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-11 00:00:00', 3, '48.8300', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10919, 'LINOD', 2, '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-04 00:00:00', 2, '19.8000', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10920, 'AROUT', 4, '1998-03-03 00:00:00', '1998-03-31 00:00:00', '1998-03-09 00:00:00', 2, '29.6100', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10921, 'VAFFE', 1, '1998-03-03 00:00:00', '1998-04-14 00:00:00', '1998-03-09 00:00:00', 1, '176.4800', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10922, 'HANAR', 5, '1998-03-03 00:00:00', '1998-03-31 00:00:00', '1998-03-05 00:00:00', 3, '62.7400', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10923, 'LAMAI', 7, '1998-03-03 00:00:00', '1998-04-14 00:00:00', '1998-03-13 00:00:00', 3, '68.2600', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(10924, 'BERGS', 3, '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-04-08 00:00:00', 2, '151.5200', 'Berglunds snabbkp', 'Berguvsvgen 8', 'Lule', NULL, 'S-958 22', 'Sweden'),
(10925, 'HANAR', 3, '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-03-13 00:00:00', 1, '2.2700', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10926, 'ANATR', 4, '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-03-11 00:00:00', 3, '39.9200', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '5021', 'Mexico'),
(10927, 'LACOR', 4, '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-04-08 00:00:00', 1, '19.7900', 'La corne d-abondance', '67, avenue de l-Europe', 'Versailles', NULL, '78000', 'France'),
(10928, 'GALED', 1, '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-03-18 00:00:00', 1, '1.3600', 'Galera del gastronmo', 'Rambla de Catalua, 23', 'Barcelona', NULL, '8022', 'Spain'),
(10929, 'FRANK', 6, '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-03-12 00:00:00', 1, '33.9300', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(10930, 'SUPRD', 4, '1998-03-06 00:00:00', '1998-04-17 00:00:00', '1998-03-18 00:00:00', 3, '15.5500', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(10931, 'RICSU', 4, '1998-03-06 00:00:00', '1998-03-20 00:00:00', '1998-03-19 00:00:00', 2, '13.6000', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10932, 'BONAP', 8, '1998-03-06 00:00:00', '1998-04-03 00:00:00', '1998-03-24 00:00:00', 1, '134.6400', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10933, 'ISLAT', 6, '1998-03-06 00:00:00', '1998-04-03 00:00:00', '1998-03-16 00:00:00', 3, '54.1500', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK'),
(10934, 'LEHMS', 3, '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-12 00:00:00', 3, '32.0100', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(10935, 'WELLI', 4, '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-18 00:00:00', 3, '47.5900', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
(10936, 'GREAL', 3, '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-18 00:00:00', 2, '33.6800', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10937, 'CACTU', 7, '1998-03-10 00:00:00', '1998-03-24 00:00:00', '1998-03-13 00:00:00', 3, '31.5100', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10938, 'QUICK', 3, '1998-03-10 00:00:00', '1998-04-07 00:00:00', '1998-03-16 00:00:00', 2, '31.8900', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10939, 'MAGAA', 2, '1998-03-10 00:00:00', '1998-04-07 00:00:00', '1998-03-13 00:00:00', 2, '76.3300', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10940, 'BONAP', 8, '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-23 00:00:00', 3, '19.7700', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(10941, 'SAVEA', 7, '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-20 00:00:00', 2, '400.8100', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10942, 'REGGC', 9, '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-18 00:00:00', 3, '17.9500', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(10943, 'BSBEV', 4, '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-19 00:00:00', 2, '2.1700', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10944, 'BOTTM', 6, '1998-03-12 00:00:00', '1998-03-26 00:00:00', '1998-03-13 00:00:00', 3, '52.9200', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10945, 'MORGK', 4, '1998-03-12 00:00:00', '1998-04-09 00:00:00', '1998-03-18 00:00:00', 1, '10.2200', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '4179', 'Germany'),
(10946, 'VAFFE', 1, '1998-03-12 00:00:00', '1998-04-09 00:00:00', '1998-03-19 00:00:00', 2, '27.2000', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10947, 'BSBEV', 3, '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-16 00:00:00', 2, '3.2600', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(10948, 'GODOS', 3, '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-19 00:00:00', 3, '23.3900', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(10949, 'BOTTM', 2, '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-17 00:00:00', 3, '74.4400', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10950, 'MAGAA', 1, '1998-03-16 00:00:00', '1998-04-13 00:00:00', '1998-03-23 00:00:00', 2, '2.5000', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy'),
(10951, 'RICSU', 9, '1998-03-16 00:00:00', '1998-04-27 00:00:00', '1998-04-07 00:00:00', 2, '30.8500', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(10952, 'ALFKI', 1, '1998-03-16 00:00:00', '1998-04-27 00:00:00', '1998-03-24 00:00:00', 1, '40.4200', 'Alfred-s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(10953, 'AROUT', 9, '1998-03-16 00:00:00', '1998-03-30 00:00:00', '1998-03-25 00:00:00', 2, '23.7200', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(10954, 'LINOD', 5, '1998-03-17 00:00:00', '1998-04-28 00:00:00', '1998-03-20 00:00:00', 1, '27.9100', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10955, 'FOLKO', 8, '1998-03-17 00:00:00', '1998-04-14 00:00:00', '1998-03-20 00:00:00', 2, '3.2600', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10956, 'BLAUS', 6, '1998-03-17 00:00:00', '1998-04-28 00:00:00', '1998-03-20 00:00:00', 2, '44.6500', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(10957, 'HILAA', 8, '1998-03-18 00:00:00', '1998-04-15 00:00:00', '1998-03-27 00:00:00', 3, '105.3600', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10958, 'OCEAN', 7, '1998-03-18 00:00:00', '1998-04-15 00:00:00', '1998-03-27 00:00:00', 2, '49.5600', 'Ocano Atlntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10959, 'GOURL', 6, '1998-03-18 00:00:00', '1998-04-29 00:00:00', '1998-03-23 00:00:00', 2, '4.9800', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(10960, 'HILAA', 3, '1998-03-19 00:00:00', '1998-04-02 00:00:00', '1998-04-08 00:00:00', 1, '2.0800', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10961, 'QUEEN', 8, '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-30 00:00:00', 1, '104.4700', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(10962, 'QUICK', 8, '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-23 00:00:00', 2, '275.7900', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10963, 'FURIB', 9, '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-26 00:00:00', 3, '2.7000', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal'),
(10964, 'SPECD', 3, '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-03-24 00:00:00', 2, '87.3800', 'Spcialits du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France'),
(10965, 'OLDWO', 6, '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-03-30 00:00:00', 3, '144.3800', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(10966, 'CHOPS', 4, '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-04-08 00:00:00', 1, '27.1900', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(10967, 'TOMSP', 2, '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-04-02 00:00:00', 2, '62.2200', 'Toms Spezialitten', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany'),
(10968, 'ERNSH', 1, '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-04-01 00:00:00', 3, '74.6000', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10969, 'COMMI', 1, '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-03-30 00:00:00', 2, '0.2100', 'Comrcio Mineiro', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil'),
(10970, 'BOLID', 9, '1998-03-24 00:00:00', '1998-04-07 00:00:00', '1998-04-24 00:00:00', 1, '16.1600', 'Blido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain'),
(10971, 'FRANR', 2, '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-04-02 00:00:00', 2, '121.8200', 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France'),
(10972, 'LACOR', 4, '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-03-26 00:00:00', 2, '0.0200', 'La corne d-abondance', '67, avenue de l-Europe', 'Versailles', NULL, '78000', 'France'),
(10973, 'LACOR', 6, '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-03-27 00:00:00', 2, '15.1700', 'La corne d-abondance', '67, avenue de l-Europe', 'Versailles', NULL, '78000', 'France'),
(10974, 'SPLIR', 3, '1998-03-25 00:00:00', '1998-04-08 00:00:00', '1998-04-03 00:00:00', 3, '12.9600', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA'),
(10975, 'BOTTM', 1, '1998-03-25 00:00:00', '1998-04-22 00:00:00', '1998-03-27 00:00:00', 3, '32.2700', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10976, 'HILAA', 1, '1998-03-25 00:00:00', '1998-05-06 00:00:00', '1998-04-03 00:00:00', 1, '37.9700', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(10977, 'FOLKO', 8, '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-04-10 00:00:00', 3, '208.5000', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10978, 'MAISD', 9, '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-04-23 00:00:00', 2, '32.8200', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(10979, 'ERNSH', 8, '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-03-31 00:00:00', 2, '353.0700', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10980, 'FOLKO', 4, '1998-03-27 00:00:00', '1998-05-08 00:00:00', '1998-04-17 00:00:00', 1, '1.2600', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10981, 'HANAR', 1, '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-02 00:00:00', 2, '193.3700', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(10982, 'BOTTM', 2, '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-08 00:00:00', 1, '14.0100', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(10983, 'SAVEA', 2, '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-06 00:00:00', 2, '657.5400', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10984, 'SAVEA', 1, '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-03 00:00:00', 3, '211.2200', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(10985, 'HUNGO', 2, '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-02 00:00:00', 1, '91.5100', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(10986, 'OCEAN', 8, '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-21 00:00:00', 2, '217.8600', 'Ocano Atlntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10987, 'EASTC', 8, '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-06 00:00:00', 1, '185.4800', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(10988, 'RATTC', 3, '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-10 00:00:00', 2, '61.1400', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(10989, 'QUEDE', 2, '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-02 00:00:00', 1, '34.7600', 'Que Delcia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
(10990, 'ERNSH', 2, '1998-04-01 00:00:00', '1998-05-13 00:00:00', '1998-04-07 00:00:00', 3, '117.6100', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10991, 'QUICK', 1, '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-07 00:00:00', 1, '38.5100', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10992, 'THEBI', 1, '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-03 00:00:00', 3, '4.2700', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA'),
(10993, 'FOLKO', 7, '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-10 00:00:00', 3, '8.8100', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(10994, 'VAFFE', 2, '1998-04-02 00:00:00', '1998-04-16 00:00:00', '1998-04-09 00:00:00', 3, '65.5300', 'Vaffeljernet', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark'),
(10995, 'PERIC', 1, '1998-04-02 00:00:00', '1998-04-30 00:00:00', '1998-04-06 00:00:00', 3, '46.0000', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(10996, 'QUICK', 4, '1998-04-02 00:00:00', '1998-04-30 00:00:00', '1998-04-10 00:00:00', 2, '1.1200', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(10997, 'LILAS', 8, '1998-04-03 00:00:00', '1998-05-15 00:00:00', '1998-04-13 00:00:00', 2, '73.9100', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10998, 'WOLZA', 8, '1998-04-03 00:00:00', '1998-04-17 00:00:00', '1998-04-17 00:00:00', 2, '20.3100', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(10999, 'OTTIK', 6, '1998-04-03 00:00:00', '1998-05-01 00:00:00', '1998-04-10 00:00:00', 2, '96.3500', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(11000, 'RATTC', 2, '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-14 00:00:00', 3, '55.1200', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
(11001, 'FOLKO', 2, '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-14 00:00:00', 2, '197.3000', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(11002, 'SAVEA', 4, '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-16 00:00:00', 1, '141.1600', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(11003, 'THECR', 3, '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-08 00:00:00', 3, '14.9100', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA'),
(11004, 'MAISD', 3, '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-20 00:00:00', 1, '44.8400', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium'),
(11005, 'WILMK', 2, '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-10 00:00:00', 1, '0.7500', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland'),
(11006, 'GREAL', 3, '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-15 00:00:00', 2, '25.1900', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(11007, 'PRINI', 8, '1998-04-08 00:00:00', '1998-05-06 00:00:00', '1998-04-13 00:00:00', 2, '202.2400', 'Princesa Isabel Vinhos', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(11008, 'ERNSH', 7, '1998-04-08 00:00:00', '1998-05-06 00:00:00', NULL, 3, '79.4600', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(11009, 'GODOS', 2, '1998-04-08 00:00:00', '1998-05-06 00:00:00', '1998-04-10 00:00:00', 1, '59.1100', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(11010, 'REGGC', 2, '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-21 00:00:00', 2, '28.7100', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy'),
(11011, 'ALFKI', 3, '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-13 00:00:00', 1, '1.2100', 'Alfred-s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
(11012, 'FRANK', 1, '1998-04-09 00:00:00', '1998-04-23 00:00:00', '1998-04-17 00:00:00', 3, '242.9500', 'Frankenversand', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany'),
(11013, 'ROMEY', 2, '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-10 00:00:00', 1, '32.9900', 'Romero y tomillo', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain'),
(11014, 'LINOD', 2, '1998-04-10 00:00:00', '1998-05-08 00:00:00', '1998-04-15 00:00:00', 3, '23.6000', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(11015, 'SANTG', 2, '1998-04-10 00:00:00', '1998-04-24 00:00:00', '1998-04-20 00:00:00', 2, '4.6200', 'Sant Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway'),
(11016, 'AROUT', 9, '1998-04-10 00:00:00', '1998-05-08 00:00:00', '1998-04-13 00:00:00', 2, '33.8000', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK'),
(11017, 'ERNSH', 9, '1998-04-13 00:00:00', '1998-05-11 00:00:00', '1998-04-20 00:00:00', 2, '754.2600', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(11018, 'LONEP', 4, '1998-04-13 00:00:00', '1998-05-11 00:00:00', '1998-04-16 00:00:00', 2, '11.6500', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA'),
(11019, 'RANCH', 6, '1998-04-13 00:00:00', '1998-05-11 00:00:00', NULL, 3, '3.1700', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina'),
(11020, 'OTTIK', 2, '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-04-16 00:00:00', 2, '43.3000', 'Ottilies Kseladen', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany'),
(11021, 'QUICK', 3, '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-04-21 00:00:00', 1, '297.1800', 'QUICK-Stop', 'Taucherstrae 10', 'Cunewalde', NULL, '1307', 'Germany'),
(11022, 'HANAR', 9, '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-05-04 00:00:00', 2, '6.2700', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(11023, 'BSBEV', 1, '1998-04-14 00:00:00', '1998-04-28 00:00:00', '1998-04-24 00:00:00', 2, '123.8300', 'B-s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK'),
(11024, 'EASTC', 4, '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-20 00:00:00', 1, '74.3600', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(11025, 'WARTH', 6, '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-24 00:00:00', 3, '29.1700', 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
(11026, 'FRANS', 4, '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-28 00:00:00', 1, '47.0900', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(11027, 'BOTTM', 1, '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-20 00:00:00', 1, '52.5200', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(11028, 'KOENE', 2, '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-22 00:00:00', 1, '29.5900', 'Kniglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany'),
(11029, 'CHOPS', 4, '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-27 00:00:00', 1, '47.8400', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(11030, 'SAVEA', 7, '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-27 00:00:00', 2, '830.7500', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(11031, 'SAVEA', 6, '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-24 00:00:00', 2, '227.2200', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(11032, 'WHITC', 2, '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-23 00:00:00', 3, '606.1900', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(11033, 'RICSU', 7, '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-23 00:00:00', 3, '84.7400', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(11034, 'OLDWO', 8, '1998-04-20 00:00:00', '1998-06-01 00:00:00', '1998-04-27 00:00:00', 1, '40.3200', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA'),
(11035, 'SUPRD', 2, '1998-04-20 00:00:00', '1998-05-18 00:00:00', '1998-04-24 00:00:00', 2, '0.1700', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(11036, 'DRACD', 8, '1998-04-20 00:00:00', '1998-05-18 00:00:00', '1998-04-22 00:00:00', 3, '149.4700', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(11037, 'GODOS', 7, '1998-04-21 00:00:00', '1998-05-19 00:00:00', '1998-04-27 00:00:00', 1, '3.2000', 'Godos Cocina Tpica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain'),
(11038, 'SUPRD', 1, '1998-04-21 00:00:00', '1998-05-19 00:00:00', '1998-04-30 00:00:00', 2, '29.5900', 'Suprmes dlices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
(11039, 'LINOD', 1, '1998-04-21 00:00:00', '1998-05-19 00:00:00', NULL, 2, '65.0000', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(11040, 'GREAL', 4, '1998-04-22 00:00:00', '1998-05-20 00:00:00', NULL, 3, '18.8400', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(11041, 'CHOPS', 3, '1998-04-22 00:00:00', '1998-05-20 00:00:00', '1998-04-28 00:00:00', 2, '48.2200', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
(11042, 'COMMI', 2, '1998-04-22 00:00:00', '1998-05-06 00:00:00', '1998-05-01 00:00:00', 1, '29.9900', 'Comrcio Mineiro', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil'),
(11043, 'SPECD', 5, '1998-04-22 00:00:00', '1998-05-20 00:00:00', '1998-04-29 00:00:00', 2, '8.8000', 'Spcialits du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France'),
(11044, 'WOLZA', 4, '1998-04-23 00:00:00', '1998-05-21 00:00:00', '1998-05-01 00:00:00', 1, '8.7200', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland'),
(11045, 'BOTTM', 6, '1998-04-23 00:00:00', '1998-05-21 00:00:00', NULL, 2, '70.5800', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(11046, 'WANDK', 8, '1998-04-23 00:00:00', '1998-05-21 00:00:00', '1998-04-24 00:00:00', 2, '71.6400', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany'),
(11047, 'EASTC', 7, '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-05-01 00:00:00', 3, '46.6200', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(11048, 'BOTTM', 7, '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-04-30 00:00:00', 3, '24.1200', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada'),
(11049, 'GOURL', 3, '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-05-04 00:00:00', 1, '8.3400', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil'),
(11050, 'FOLKO', 8, '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-05-05 00:00:00', 2, '59.4100', 'Folk och f HB', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden'),
(11051, 'LAMAI', 7, '1998-04-27 00:00:00', '1998-05-25 00:00:00', NULL, 3, '2.7900', 'La maison d-Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France'),
(11052, 'HANAR', 3, '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-05-01 00:00:00', 1, '67.2600', 'Hanari Carnes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
(11053, 'PICCO', 2, '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-04-29 00:00:00', 2, '53.0500', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(11054, 'CACTU', 8, '1998-04-28 00:00:00', '1998-05-26 00:00:00', NULL, 1, '0.3300', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(11055, 'HILAA', 7, '1998-04-28 00:00:00', '1998-05-26 00:00:00', '1998-05-05 00:00:00', 2, '120.9200', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela'),
(11056, 'EASTC', 8, '1998-04-28 00:00:00', '1998-05-12 00:00:00', '1998-05-01 00:00:00', 2, '278.9600', 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK'),
(11057, 'NORTS', 3, '1998-04-29 00:00:00', '1998-05-27 00:00:00', '1998-05-01 00:00:00', 3, '4.1300', 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK'),
(11058, 'BLAUS', 9, '1998-04-29 00:00:00', '1998-05-27 00:00:00', NULL, 3, '31.1400', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
(11059, 'RICAR', 2, '1998-04-29 00:00:00', '1998-06-10 00:00:00', NULL, 2, '85.8000', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil'),
(11060, 'FRANS', 2, '1998-04-30 00:00:00', '1998-05-28 00:00:00', '1998-05-04 00:00:00', 2, '10.9800', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy'),
(11061, 'GREAL', 4, '1998-04-30 00:00:00', '1998-06-11 00:00:00', NULL, 3, '14.0100', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(11062, 'REGGC', 4, '1998-04-30 00:00:00', '1998-05-28 00:00:00', NULL, 2, '29.9300', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO `orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES
(11063, 'HUNGO', 3, '1998-04-30 00:00:00', '1998-05-28 00:00:00', '1998-05-06 00:00:00', 2, '81.7300', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland'),
(11064, 'SAVEA', 1, '1998-05-01 00:00:00', '1998-05-29 00:00:00', '1998-05-04 00:00:00', 1, '30.0900', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA'),
(11065, 'LILAS', 8, '1998-05-01 00:00:00', '1998-05-29 00:00:00', NULL, 1, '12.9100', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(11066, 'WHITC', 7, '1998-05-01 00:00:00', '1998-05-29 00:00:00', '1998-05-04 00:00:00', 2, '44.7200', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
(11067, 'DRACD', 1, '1998-05-04 00:00:00', '1998-05-18 00:00:00', '1998-05-06 00:00:00', 2, '7.9800', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany'),
(11068, 'QUEEN', 8, '1998-05-04 00:00:00', '1998-06-01 00:00:00', NULL, 2, '81.7500', 'Queen Cozinha', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil'),
(11069, 'TORTU', 1, '1998-05-04 00:00:00', '1998-06-01 00:00:00', '1998-05-06 00:00:00', 2, '15.6700', 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(11070, 'LEHMS', 2, '1998-05-05 00:00:00', '1998-06-02 00:00:00', NULL, 1, '136.0000', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany'),
(11071, 'LILAS', 1, '1998-05-05 00:00:00', '1998-06-02 00:00:00', NULL, 1, '0.9300', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(11072, 'ERNSH', 4, '1998-05-05 00:00:00', '1998-06-02 00:00:00', NULL, 2, '258.6400', 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(11073, 'PERIC', 2, '1998-05-05 00:00:00', '1998-06-02 00:00:00', NULL, 2, '24.9500', 'Pericles Comidas clsicas', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '5033', 'Mexico'),
(11074, 'SIMOB', 7, '1998-05-06 00:00:00', '1998-06-03 00:00:00', NULL, 2, '18.4400', 'Simons bistro', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark'),
(11075, 'RICSU', 8, '1998-05-06 00:00:00', '1998-06-03 00:00:00', NULL, 2, '6.1900', 'Richter Supermarkt', 'Starenweg 5', 'Genve', NULL, '1204', 'Switzerland'),
(11076, 'BONAP', 4, '1998-05-06 00:00:00', '1998-06-03 00:00:00', NULL, 2, '38.2800', 'Bon app-', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
(11077, 'RATTC', 1, '1998-05-06 00:00:00', '1998-06-03 00:00:00', NULL, 2, '8.5300', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(10,4) DEFAULT '0.0000',
  `UnitsInStock` smallint(2) DEFAULT '0',
  `UnitsOnOrder` smallint(2) DEFAULT '0',
  `ReorderLevel` smallint(2) DEFAULT '0',
  `Discontinued` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES
(1, 'Chai', 1, 1, '10 boxes x 20 bags', '18.0000', 39, 0, 10, b'0'),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', '19.0000', 17, 40, 25, b'0'),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', '10.0000', 13, 70, 25, b'0'),
(4, 'Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', '22.0000', 53, 0, 0, b'0'),
(5, 'Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', '21.3500', 0, 0, 0, b'1'),
(6, 'Grandma\'s Boysenberry Spread', 3, 2, '12 - 8 oz jars', '25.0000', 120, 0, 25, b'0'),
(7, 'Uncle Bob\'s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', '30.0000', 15, 0, 10, b'0'),
(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', '40.0000', 6, 0, 0, b'0'),
(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', '97.0000', 29, 0, 0, b'1'),
(10, 'Ikura', 4, 8, '12 - 200 ml jars', '31.0000', 31, 0, 0, b'0'),
(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', '21.0000', 22, 30, 30, b'0'),
(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', '38.0000', 86, 0, 0, b'0'),
(13, 'Konbu', 6, 8, '2 kg box', '6.0000', 24, 0, 5, b'0'),
(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', '23.2500', 35, 0, 0, b'0'),
(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', '15.5000', 39, 0, 5, b'0'),
(16, 'Pavlova', 7, 3, '32 - 500 g boxes', '17.4500', 29, 0, 10, b'0'),
(17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', '39.0000', 0, 0, 0, b'1'),
(18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', '62.5000', 42, 0, 0, b'0'),
(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', '9.2000', 25, 0, 5, b'0'),
(20, 'Sir Rodney\'s Marmalade', 8, 3, '30 gift boxes', '81.0000', 40, 0, 0, b'0'),
(21, 'Sir Rodney\'s Scones', 8, 3, '24 pkgs. x 4 pieces', '10.0000', 3, 40, 5, b'0'),
(22, 'Gustaf\'s Knckebrd', 9, 5, '24 - 500 g pkgs.', '21.0000', 104, 0, 25, b'0'),
(23, 'Tunnbrd', 9, 5, '12 - 250 g pkgs.', '9.0000', 61, 0, 25, b'0'),
(24, 'Guaran Fantstica', 10, 1, '12 - 355 ml cans', '4.5000', 20, 0, 0, b'1'),
(25, 'NuNuCa Nu-Nougat-Creme', 11, 3, '20 - 450 g glasses', '14.0000', 76, 0, 30, b'0'),
(26, 'Gumbr Gummibrchen', 11, 3, '100 - 250 g bags', '31.2300', 15, 0, 0, b'0'),
(27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', '43.9000', 49, 0, 30, b'0'),
(28, 'Rssle Sauerkraut', 12, 7, '25 - 825 g cans', '45.6000', 26, 0, 0, b'1'),
(29, 'Thringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', '123.7900', 0, 0, 0, b'1'),
(30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', '25.8900', 10, 0, 15, b'0'),
(31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', '12.5000', 0, 70, 20, b'0'),
(32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', '32.0000', 9, 40, 25, b'0'),
(33, 'Geitost', 15, 4, '500 g', '2.5000', 112, 0, 20, b'0'),
(34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', '14.0000', 111, 0, 15, b'0'),
(35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', '18.0000', 20, 0, 15, b'0'),
(36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', '19.0000', 112, 0, 20, b'0'),
(37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', '26.0000', 11, 50, 25, b'0'),
(38, 'Cte de Blaye', 18, 1, '12 - 75 cl bottles', '263.5000', 17, 0, 15, b'0'),
(39, 'Chartreuse verte', 18, 1, '750 cc per bottle', '18.0000', 69, 0, 5, b'0'),
(40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', '18.4000', 123, 0, 30, b'0'),
(41, 'Jack\'s New England Clam Chowder', 19, 8, '12 - 12 oz cans', '9.6500', 85, 0, 10, b'0'),
(42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', '14.0000', 26, 0, 0, b'1'),
(43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', '46.0000', 17, 10, 25, b'0'),
(44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', '19.4500', 27, 0, 15, b'0'),
(45, 'Rogede sild', 21, 8, '1k pkg.', '9.5000', 5, 70, 15, b'0'),
(46, 'Spegesild', 21, 8, '4 - 450 g glasses', '12.0000', 95, 0, 0, b'0'),
(47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', '9.5000', 36, 0, 0, b'0'),
(48, 'Chocolade', 22, 3, '10 pkgs.', '12.7500', 15, 70, 25, b'0'),
(49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', '20.0000', 10, 60, 15, b'0'),
(50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', '16.2500', 65, 0, 30, b'0'),
(51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', '53.0000', 20, 0, 10, b'0'),
(52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', '7.0000', 38, 0, 25, b'0'),
(53, 'Perth Pasties', 24, 6, '48 pieces', '32.8000', 0, 0, 0, b'1'),
(54, 'Tourtire', 25, 6, '16 pies', '7.4500', 21, 0, 10, b'0'),
(55, 'Pt chinois', 25, 6, '24 boxes x 2 pies', '24.0000', 115, 0, 20, b'0'),
(56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', '38.0000', 21, 10, 30, b'0'),
(57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', '19.5000', 36, 0, 20, b'0'),
(58, 'Escargots de Bourgogne', 27, 8, '24 pieces', '13.2500', 62, 0, 20, b'0'),
(59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', '55.0000', 79, 0, 0, b'0'),
(60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', '34.0000', 19, 0, 0, b'0'),
(61, 'Sirop d\'rable', 29, 2, '24 - 500 ml bottles', '28.5000', 113, 0, 25, b'0'),
(62, 'Tarte au sucre', 29, 3, '48 pies', '49.3000', 17, 0, 0, b'0'),
(63, 'Vegie-spread', 7, 2, '15 - 625 g jars', '43.9000', 24, 0, 5, b'0'),
(64, 'Wimmers gute Semmelkndel', 12, 5, '20 bags x 4 pieces', '33.2500', 22, 80, 30, b'0'),
(65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', '21.0500', 76, 0, 0, b'0'),
(66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', '17.0000', 4, 100, 20, b'0'),
(67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', '14.0000', 52, 0, 10, b'0'),
(68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', '12.5000', 6, 10, 15, b'0'),
(69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', '36.0000', 26, 0, 15, b'0'),
(70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', '15.0000', 15, 10, 30, b'0'),
(71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', '21.5000', 26, 0, 0, b'0'),
(72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', '34.8000', 14, 0, 0, b'0'),
(73, 'Rd Kaviar', 17, 8, '24 - 150 g jars', '15.0000', 101, 0, 5, b'0'),
(74, 'Longlife Tofu', 4, 7, '5 kg pkg.', '10.0000', 4, 20, 5, b'0'),
(75, 'Rhnbru Klosterbier', 12, 1, '24 - 0.5 l bottles', '7.7500', 125, 0, 25, b'0'),
(76, 'Lakkalikri', 23, 1, '500 ml', '18.0000', 57, 0, 20, b'0'),
(77, 'Original Frankfurter grne Soe', 12, 2, '12 boxes', '13.0000', 32, 0, 15, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` mediumtext,
  PRIMARY KEY (`SupplierID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `CompanyName`, `ContactName`, `ContactTitle`, `Address`, `City`, `Region`, `PostalCode`, `Country`, `Phone`, `Fax`, `HomePage`) VALUES
(1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#'),
(3, 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL),
(4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai\r\nMusashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL),
(5, 'Cooperativa de Quesos \'Las Cabras\'', 'Antonio del Valle Saavedra ', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL),
(6, 'Mayumi\'s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko\r\nChuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi\'s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#'),
(7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St.\r\nMoonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL),
(8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King\'s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL),
(9, 'PB Knckebrd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Gteborg', NULL, 'S-345 67', 'Sweden ', '031-987 65 43', '031-987 65 91', NULL),
(10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'So Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL),
(11, 'Heli Swaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstrae 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL),
(12, 'Plutzer Lebensmittelgromrkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#'),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL),
(14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#'),
(15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL),
(16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue\r\nSuite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL),
(17, 'Svensk Sjfda AB', 'Michael Bjrn', 'Sales Representative', 'Brovallavgen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL),
(18, 'Aux joyeux ecclsiastiques', 'Guylne Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL),
(19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept.\r\n2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL),
(20, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL),
(21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild\r\nFiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL),
(22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop\r\nRijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL),
(23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL),
(24, 'G\'day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade\r\nHunter\'s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G\'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#'),
(25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL),
(26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL),
(27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL),
(28, 'Gai pturage', 'Eliane Noz', 'Sales Representative', 'Bat. B\r\n3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL),
(29, 'Forts d\'rables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Qubec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `FK_9ABE194D6D1F1751` FOREIGN KEY (`id_alimentation_id`) REFERENCES `alimentations` (`id`);
--
-- Base de données : `animauxapi`
--
CREATE DATABASE IF NOT EXISTS `animauxapi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `animauxapi`;

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `idAnimal` int(10) NOT NULL AUTO_INCREMENT,
  `libelleAnimal` varchar(45) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  PRIMARY KEY (`idAnimal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`idAnimal`, `libelleAnimal`, `dateNaissance`) VALUES
(1, 'lion', '2000-12-05'),
(2, 'autruche', '2000-12-23'),
(3, 'serpent ', '2000-12-02'),
(4, 'loire', '2000-12-16'),
(5, 'biche', '2022-01-18');
--
-- Base de données : `automate`
--
CREATE DATABASE IF NOT EXISTS `automate` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `automate`;

-- --------------------------------------------------------

--
-- Structure de la table `afpa_anomalies`
--

DROP TABLE IF EXISTS `afpa_anomalies`;
CREATE TABLE IF NOT EXISTS `afpa_anomalies` (
  `IdAnomalie` int(11) NOT NULL AUTO_INCREMENT,
  `DateAnomalie` datetime DEFAULT NULL,
  `TypeAnomalie` varchar(50) DEFAULT NULL,
  `NbDeclasses` int(11) DEFAULT NULL,
  `IdErreur` int(11) NOT NULL,
  PRIMARY KEY (`IdAnomalie`),
  KEY `Afpa_Anomalies_Afpa_Erreurs` (`IdErreur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_anomalies`
--

INSERT INTO `afpa_anomalies` (`IdAnomalie`, `DateAnomalie`, `TypeAnomalie`, `NbDeclasses`, `IdErreur`) VALUES
(1, '2022-02-01 14:20:30', 'Lumière ', 10, 3),
(2, '2022-02-01 14:21:52', 'Son', 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `afpa_cadences`
--

DROP TABLE IF EXISTS `afpa_cadences`;
CREATE TABLE IF NOT EXISTS `afpa_cadences` (
  `IdCadence` int(11) NOT NULL AUTO_INCREMENT,
  `NbProduit` int(11) DEFAULT NULL,
  `DateCadence` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCadence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_cadences`
--

INSERT INTO `afpa_cadences` (`IdCadence`, `NbProduit`, `DateCadence`) VALUES
(1, 100, '2022-02-01 14:20:30'),
(2, 150, '2022-02-01 14:22:30');

-- --------------------------------------------------------

--
-- Structure de la table `afpa_couleurs`
--

DROP TABLE IF EXISTS `afpa_couleurs`;
CREATE TABLE IF NOT EXISTS `afpa_couleurs` (
  `IdCouleur` int(11) NOT NULL AUTO_INCREMENT,
  `Red` int(11) DEFAULT NULL,
  `Green` int(11) DEFAULT NULL,
  `Blue` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCouleur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_couleurs`
--

INSERT INTO `afpa_couleurs` (`IdCouleur`, `Red`, `Green`, `Blue`) VALUES
(1, 198, 8, 0),
(2, 158, 253, 56),
(3, 254, 27, 0);

-- --------------------------------------------------------

--
-- Structure de la table `afpa_erreurs`
--

DROP TABLE IF EXISTS `afpa_erreurs`;
CREATE TABLE IF NOT EXISTS `afpa_erreurs` (
  `IdErreur` int(11) NOT NULL AUTO_INCREMENT,
  `MessageErreur` text,
  PRIMARY KEY (`IdErreur`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_erreurs`
--

INSERT INTO `afpa_erreurs` (`IdErreur`, `MessageErreur`) VALUES
(1, 'Luminosité trop basse '),
(2, 'Son trop haut '),
(3, 'Luminosité trop faible'),
(4, 'Son trop bas'),
(5, 'Température trop élevé. '),
(6, 'Température trop basse. '),
(7, 'Son ne fonctionne pas '),
(8, 'Lumière ne fonctionne pas '),
(9, 'Température ne fonctionne pas '),
(10, 'Lumière saccadée '),
(11, 'Son grésillement '),
(12, 'Température Instable');

-- --------------------------------------------------------

--
-- Structure de la table `afpa_lumieres`
--

DROP TABLE IF EXISTS `afpa_lumieres`;
CREATE TABLE IF NOT EXISTS `afpa_lumieres` (
  `IdLumiere` int(11) NOT NULL AUTO_INCREMENT,
  `ValeurLumiere` int(11) DEFAULT NULL,
  `DateLumiere` datetime DEFAULT NULL,
  PRIMARY KEY (`IdLumiere`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_lumieres`
--

INSERT INTO `afpa_lumieres` (`IdLumiere`, `ValeurLumiere`, `DateLumiere`) VALUES
(1, 350, '2022-02-02 14:08:16'),
(2, 120, '2022-02-01 14:08:16');

-- --------------------------------------------------------

--
-- Structure de la table `afpa_objectifs`
--

DROP TABLE IF EXISTS `afpa_objectifs`;
CREATE TABLE IF NOT EXISTS `afpa_objectifs` (
  `IdObjectif` int(11) NOT NULL AUTO_INCREMENT,
  `Rendement` int(11) DEFAULT NULL,
  `MaxNombreArretTemperature` int(11) DEFAULT NULL,
  `MaxNombreArretDecibel` int(11) DEFAULT NULL,
  `MaxPourcentDeclasses` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdObjectif`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_objectifs`
--

INSERT INTO `afpa_objectifs` (`IdObjectif`, `Rendement`, `MaxNombreArretTemperature`, `MaxNombreArretDecibel`, `MaxPourcentDeclasses`) VALUES
(1, 100, 4, 5, 60),
(2, 200, 5, 4, 70);

-- --------------------------------------------------------

--
-- Structure de la table `afpa_seuils`
--

DROP TABLE IF EXISTS `afpa_seuils`;
CREATE TABLE IF NOT EXISTS `afpa_seuils` (
  `IdSeuil` int(11) NOT NULL AUTO_INCREMENT,
  `SeuilBas` int(11) DEFAULT NULL,
  `SeuilHaut` int(11) DEFAULT NULL,
  `DateSeuil` date DEFAULT NULL,
  `Temps` int(11) DEFAULT NULL,
  `Nature` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdSeuil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_seuils`
--

INSERT INTO `afpa_seuils` (`IdSeuil`, `SeuilBas`, `SeuilHaut`, `DateSeuil`, `Temps`, `Nature`) VALUES
(1, 10, 30, '2022-02-01', 1, 3),
(2, 40, 150, '2022-02-02', 2, 2),
(3, 100, 1000, '2022-02-25', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `afpa_sons`
--

DROP TABLE IF EXISTS `afpa_sons`;
CREATE TABLE IF NOT EXISTS `afpa_sons` (
  `IdSon` int(11) NOT NULL AUTO_INCREMENT,
  `ValeurSon` int(11) DEFAULT NULL,
  `DateSon` datetime DEFAULT NULL,
  PRIMARY KEY (`IdSon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_sons`
--

INSERT INTO `afpa_sons` (`IdSon`, `ValeurSon`, `DateSon`) VALUES
(1, 120, '2022-02-01 13:58:44'),
(2, 100, '2022-02-02 13:58:44');

-- --------------------------------------------------------

--
-- Structure de la table `afpa_temperatures`
--

DROP TABLE IF EXISTS `afpa_temperatures`;
CREATE TABLE IF NOT EXISTS `afpa_temperatures` (
  `IdTemperature` int(11) NOT NULL AUTO_INCREMENT,
  `ValeurTemperature` decimal(3,1) DEFAULT NULL,
  `DateTemperature` datetime DEFAULT NULL,
  PRIMARY KEY (`IdTemperature`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `afpa_temperatures`
--

INSERT INTO `afpa_temperatures` (`IdTemperature`, `ValeurTemperature`, `DateTemperature`) VALUES
(1, '21.0', '2022-02-01 13:57:57'),
(2, '-3.0', '2022-02-01 14:57:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
(20, 'Red', 'Rouge', 'Red'),
(21, 'Green', 'Vert', 'Green'),
(22, 'Blue', 'Rouge', 'Red'),
(23, 'MessageErreur', 'Message d\'erreur\r\n', 'Message error'),
(24, 'DateAnomalie', 'DateAnomalie', 'Date anomaly');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `adresseMail`, `motDePasse`, `role`) VALUES
(1, 'Alan', 'Alan', 'Alan@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', 2),
(2, 'Nacer', 'Nacer', 'Nacer@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `afpa_anomalies`
--
ALTER TABLE `afpa_anomalies`
  ADD CONSTRAINT `Afpa_Anomalies_Afpa_Erreurs` FOREIGN KEY (`IdErreur`) REFERENCES `afpa_erreurs` (`IdErreur`);
--
-- Base de données : `baseregion`
--
CREATE DATABASE IF NOT EXISTS `baseregion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `baseregion`;

-- --------------------------------------------------------

--
-- Structure de la table `depatements`
--

DROP TABLE IF EXISTS `depatements`;
CREATE TABLE IF NOT EXISTS `depatements` (
  `IdDepartement` int(11) NOT NULL AUTO_INCREMENT,
  `NomDepartement` varchar(50) NOT NULL,
  `RegionsIdRegion` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDepartement`),
  KEY `IX_Depatements_RegionsIdRegion` (`RegionsIdRegion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `IdRegion` int(11) NOT NULL AUTO_INCREMENT,
  `NomRegion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdRegion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `IdVille` int(11) NOT NULL AUTO_INCREMENT,
  `NomVille` varchar(50) NOT NULL,
  `DepartementsIdDepartement` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVille`),
  KEY `IX_Villes_DepartementsIdDepartement` (`DepartementsIdDepartement`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20211124142754_MigrRegion', '5.0.12');
--
-- Base de données : `cantinemartine`
--
CREATE DATABASE IF NOT EXISTS `cantinemartine` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cantinemartine`;

-- --------------------------------------------------------

--
-- Structure de la table `categoriesplats`
--

DROP TABLE IF EXISTS `categoriesplats`;
CREATE TABLE IF NOT EXISTS `categoriesplats` (
  `IdCategoriePlat` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleCategoriePlat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdCategoriePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
(8, 'Féculent '),
(9, 'Laitage'),
(11, 'Boisson');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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
(15, 'Oeuf mimosa', 1),
(16, 'rreererr', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

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
(10, 'Pomme de terre ', 500, 1),
(11, 'Petit poids ', 30, 1),
(12, 'Topinambour', 3, 4),
(13, 'Carpe', 5, 7),
(14, 'Saumon', 3, 7),
(15, 'Truite', 45, 7),
(16, 'Poivre', 10, 6),
(17, 'Echalotte', 6, 6),
(18, 'Béchamel', 2, 6),
(19, 'Porc', 10, 3),
(20, 'Boeuf', 5, 3),
(21, 'Cheval', 15, 3),
(23, 'Fromage Blanc', 100, 9);

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
--
-- Base de données : `ecf`
--
CREATE DATABASE IF NOT EXISTS `ecf` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ecf`;

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `IdGroupe` int(11) NOT NULL AUTO_INCREMENT,
  `NomDuGroupe` varchar(50) NOT NULL,
  `NombreDeFollowers` int(11) NOT NULL,
  `Logo` varchar(250) NOT NULL,
  PRIMARY KEY (`IdGroupe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`IdGroupe`, `NomDuGroupe`, `NombreDeFollowers`, `Logo`) VALUES
(1, 'TheGroup', 3, 'logo1.jpg'),
(2, 'Meilleur Groupe', 30, 'logo2.png');

-- --------------------------------------------------------

--
-- Structure de la table `musiciens`
--

DROP TABLE IF EXISTS `musiciens`;
CREATE TABLE IF NOT EXISTS `musiciens` (
  `idMusicien` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Instrument` varchar(50) NOT NULL,
  `IdGroupe` int(11) NOT NULL,
  PRIMARY KEY (`idMusicien`),
  KEY `FK_Membres_Groupes` (`IdGroupe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `musiciens`
--

INSERT INTO `musiciens` (`idMusicien`, `Nom`, `Prenom`, `Instrument`, `IdGroupe`) VALUES
(1, 'Dupond', 'Toto', 'guitare', 1),
(4, 'Durand', 'Titi', 'Saxophone', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `musiciens`
--
ALTER TABLE `musiciens`
  ADD CONSTRAINT `FK_Membres_Groupes` FOREIGN KEY (`IdGroupe`) REFERENCES `groupes` (`IdGroupe`);
--
-- Base de données : `ecf_php`
--
CREATE DATABASE IF NOT EXISTS `ecf_php` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ecf_php`;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `textes`
--

INSERT INTO `textes` (`idTexte`, `codeTexte`, `fr`, `en`) VALUES
(1, 'Identification', 'Identification', 'Identification'),
(2, 'MotDePasse', 'Mot de Passe', 'Password'),
(3, 'ConfirmationMotDePasse', 'Confirmation du mot de passe', 'Confirm password'),
(4, 'Role', 'Role(1: user - 2: admin)', 'Role(1: user - 2: admin)'),
(5, 'Produits', 'Produits', 'Product'),
(6, 'Categories', 'Catégories', 'Category'),
(7, 'TexteMenu', 'Choisissez entre Produits et catégories', 'Choose between Product and Category'),
(8, 'Ajouter', 'Ajouter', 'Add'),
(9, 'Editer', 'Afficher', 'Show'),
(10, 'Modifier', 'Modifier', 'Modify'),
(11, 'Supprimer', 'Supprimer', 'Delete'),
(12, 'Libelle', 'Libelle', 'Description'),
(13, 'Prix', 'Prix', 'Price'),
(14, 'DatePeremption', 'Date de peremption', 'Expiry date'),
(15, 'CrudProduit', ' un produit', ' a product'),
(16, 'CrudCategorie', ' une categorie', ' a category'),
(17, 'Deconnecter', 'Deconnecter', 'Disconnect'),
(18, 'Pseudo', 'Pseudo', 'Alias'),
(19, 'Annuler', 'Annuler', 'Cancel'),
(20, 'ListeProduits', 'Liste de produits', 'List product'),
(21, 'GestionProduit', 'Gestion des produits', 'Product management'),
(22, 'ListeCategories', 'Liste des Catégories', 'List Category'),
(23, 'GestionCategories', 'Gestion des catégories', 'Category management'),
(24, 'Inconnue', '418: je suis une théière !', '418 I\'m a teapot'),
(25, 'erreurAjouter', 'L\'ajout a échoué', 'Add failed'),
(26, 'erreurModifier', 'La modification a échoué', 'Update failed'),
(27, 'erreurSupprimer', 'La suppression a échoué', 'Delete failed'),
(28, 'Confirm', 'La confirmation ne correspond pas au mot de passe', 'Confirmation not match'),
(29, 'DoublePseudo', 'Le pseudo existe deja', 'Nickname already exists '),
(30, 'MdpIncorrect', 'Le mot de passe est incorrect', 'incorrect password'),
(31, 'MailUnkn', 'L\'adresse mail  n\'existe pas', 'mail unknown'),
(32, 'titreErreur', 'Une erreur est survenue', 'An error occurred');

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
--
-- Base de données : `efmodeltobase`
--
CREATE DATABASE IF NOT EXISTS `efmodeltobase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `efmodeltobase`;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(50) DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20211124125128_Initiale', '5.0.12');
--
-- Base de données : `garage`
--
CREATE DATABASE IF NOT EXISTS `garage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `garage`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) NOT NULL,
  `prenomClient` varchar(50) NOT NULL,
  `adresseClient` varchar(50) NOT NULL,
  `cpClient` varchar(5) NOT NULL,
  `villeClient` varchar(50) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`idClient`, `nomClient`, `prenomClient`, `adresseClient`, `cpClient`, `villeClient`) VALUES
(1, 'Dupont', 'Toto', '12 rue de la plage', '59100', 'Dunkerque');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

DROP TABLE IF EXISTS `voitures`;
CREATE TABLE IF NOT EXISTS `voitures` (
  `idVoiture` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(20) DEFAULT NULL,
  `modele` varchar(20) DEFAULT NULL,
  `couleur` varchar(20) NOT NULL,
  PRIMARY KEY (`idVoiture`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`idVoiture`, `marque`, `modele`, `couleur`) VALUES
(2, 'Dacia', 'Sandero', 'Bleu'),
(3, 'Peugeot', '406', 'Verte'),
(4, 'Peugeot', '406 coupé', 'Grise'),
(7, 'Renault', 'Dauphine', 'Noir');
--
-- Base de données : `gestionrepresentant`
--
CREATE DATABASE IF NOT EXISTS `gestionrepresentant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestionrepresentant`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `IdClient` int(11) NOT NULL AUTO_INCREMENT,
  `NomClient` varchar(25) DEFAULT NULL,
  `VilleClient` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IdClient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`IdClient`, `NomClient`, `VilleClient`) VALUES
(1, 'Alice', 'Lyon'),
(2, 'Bruno', 'Paris'),
(3, 'Charles', 'Compiègne'),
(4, 'Denis', 'Paris'),
(5, 'Emile', 'Strasbourg'),
(6, 'Charles', 'Paris');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clientsventes`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `clientsventes`;
CREATE TABLE IF NOT EXISTS `clientsventes` (
`NomClient` varchar(25)
,`VilleClient` varchar(25)
,`NomProduit` varchar(25)
,`CouleurProduit` varchar(25)
,`PoidsProduit` int(11)
,`Quantite` int(11)
,`NomRepres` varchar(25)
,`VilleRepres` varchar(25)
);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `IdProduit` int(11) NOT NULL AUTO_INCREMENT,
  `NomProduit` varchar(25) DEFAULT NULL,
  `CouleurProduit` varchar(25) DEFAULT NULL,
  `PoidsProduit` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`IdProduit`, `NomProduit`, `CouleurProduit`, `PoidsProduit`) VALUES
(1, 'Aspirateur', 'Rouge', 3546),
(2, 'Trottinette', 'Bleu', 1423),
(3, 'Chaise', 'Blanc', 3827),
(4, 'Tapis', 'Rouge', 1423),
(5, 'Bureau', 'Rouge', 2152);

-- --------------------------------------------------------

--
-- Structure de la table `representants`
--

DROP TABLE IF EXISTS `representants`;
CREATE TABLE IF NOT EXISTS `representants` (
  `IdRepres` int(11) NOT NULL AUTO_INCREMENT,
  `NomRepres` varchar(25) DEFAULT NULL,
  `VilleRepres` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IdRepres`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `representants`
--

INSERT INTO `representants` (`IdRepres`, `NomRepres`, `VilleRepres`) VALUES
(1, 'Stephane', 'Lyon'),
(2, 'Benjamin', 'Paris'),
(3, 'Leonard', 'Lyon'),
(4, 'Antoine', 'Brest'),
(5, 'Bruno', 'Bayonne');

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
CREATE TABLE IF NOT EXISTS `ventes` (
  `IdVente` int(11) NOT NULL AUTO_INCREMENT,
  `IdRepres` int(11) DEFAULT NULL,
  `IdProduit` int(11) DEFAULT NULL,
  `IdClient` int(11) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVente`),
  KEY `ventes_ibfk_1` (`IdClient`),
  KEY `ventes_ibfk_2` (`IdProduit`),
  KEY `ventes_ibfk_3` (`IdRepres`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ventes`
--

INSERT INTO `ventes` (`IdVente`, `IdRepres`, `IdProduit`, `IdClient`, `Quantite`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 2, 2, 3, 1),
(4, 4, 3, 3, 200),
(5, 3, 4, 2, 190),
(6, 1, 3, 2, 300),
(7, 3, 1, 2, 120),
(8, 3, 1, 4, 120),
(9, 3, 4, 4, 2),
(10, 3, 1, 1, 3),
(11, 3, 4, 1, 5),
(12, 3, 1, 3, 1),
(13, 1, 3, 6, 200),
(14, 2, 5, 6, 200),
(15, 3, 1, 2, 3),
(16, 4, 2, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la vue `clientsventes`
--
DROP TABLE IF EXISTS `clientsventes`;

DROP VIEW IF EXISTS `clientsventes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clientsventes`  AS  select `c`.`NomClient` AS `NomClient`,`c`.`VilleClient` AS `VilleClient`,`p`.`NomProduit` AS `NomProduit`,`p`.`CouleurProduit` AS `CouleurProduit`,`p`.`PoidsProduit` AS `PoidsProduit`,`v`.`Quantite` AS `Quantite`,`r`.`NomRepres` AS `NomRepres`,`r`.`VilleRepres` AS `VilleRepres` from (((`clients` `c` left join `ventes` `v` on((`c`.`IdClient` = `v`.`IdClient`))) left join `produits` `p` on((`v`.`IdProduit` = `p`.`IdProduit`))) left join `representants` `r` on((`v`.`IdRepres` = `r`.`IdRepres`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`IdClient`) REFERENCES `clients` (`IdClient`),
  ADD CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`IdProduit`) REFERENCES `produits` (`IdProduit`),
  ADD CONSTRAINT `ventes_ibfk_3` FOREIGN KEY (`IdRepres`) REFERENCES `representants` (`IdRepres`);
--
-- Base de données : `gestionreunion`
--
CREATE DATABASE IF NOT EXISTS `gestionreunion` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gestionreunion`;

-- --------------------------------------------------------

--
-- Structure de la table `etatsavancements`
--

DROP TABLE IF EXISTS `etatsavancements`;
CREATE TABLE IF NOT EXISTS `etatsavancements` (
  `idEtatAvancement` int(11) NOT NULL AUTO_INCREMENT,
  `libelleEtatAvancement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEtatAvancement`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etatsavancements`
--

INSERT INTO `etatsavancements` (`idEtatAvancement`, `libelleEtatAvancement`) VALUES
(1, 'En attente'),
(2, 'En cours'),
(3, 'Terminer');

-- --------------------------------------------------------

--
-- Structure de la table `fichiersannexes`
--

DROP TABLE IF EXISTS `fichiersannexes`;
CREATE TABLE IF NOT EXISTS `fichiersannexes` (
  `idFichierAnnexe` int(11) NOT NULL AUTO_INCREMENT,
  `titreFichierAnnexe` varchar(50) DEFAULT NULL,
  `lienFichierAnnexe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idFichierAnnexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fichiersannexes`
--

INSERT INTO `fichiersannexes` (`idFichierAnnexe`, `titreFichierAnnexe`, `lienFichierAnnexe`) VALUES
(1, 'Historique entreprise', 'https://fr.wikipedia.org/wiki/Histoire'),
(2, 'Diagramme coups production', 'https://fr.wikipedia.org/wiki/Histoire');

-- --------------------------------------------------------

--
-- Structure de la table `gestionsannexes`
--

DROP TABLE IF EXISTS `gestionsannexes`;
CREATE TABLE IF NOT EXISTS `gestionsannexes` (
  `idGestionAnnexe` int(11) NOT NULL AUTO_INCREMENT,
  `idReunion` int(11) DEFAULT NULL,
  `idFichierAnnexe` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGestionAnnexe`),
  KEY `FK_GestionsAnnexes_Reunions` (`idReunion`),
  KEY `FK_GestionsAnnexes_FichiersAnnexes` (`idFichierAnnexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gestionsannexes`
--

INSERT INTO `gestionsannexes` (`idGestionAnnexe`, `idReunion`, `idFichierAnnexe`) VALUES
(1, 2, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gestionstaches`
--

DROP TABLE IF EXISTS `gestionstaches`;
CREATE TABLE IF NOT EXISTS `gestionstaches` (
  `idGestionTache` int(11) NOT NULL AUTO_INCREMENT,
  `idReunion` int(11) DEFAULT NULL,
  `idTache` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGestionTache`),
  KEY `FK_GestionsTaches_Reunions` (`idReunion`),
  KEY `FK_GestionsTaches_Taches` (`idTache`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gestionstaches`
--

INSERT INTO `gestionstaches` (`idGestionTache`, `idReunion`, `idTache`) VALUES
(1, 2, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ordresdujour`
--

DROP TABLE IF EXISTS `ordresdujour`;
CREATE TABLE IF NOT EXISTS `ordresdujour` (
  `idOrdreDuJour` int(11) NOT NULL AUTO_INCREMENT,
  `idReunion` int(11) DEFAULT NULL,
  `idSujet` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdreDuJour`),
  KEY `FK_OrdresDuJour_Reunions` (`idReunion`),
  KEY `FK_OrdresDuJour_Sujets` (`idSujet`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ordresdujour`
--

INSERT INTO `ordresdujour` (`idOrdreDuJour`, `idReunion`, `idSujet`) VALUES
(1, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

DROP TABLE IF EXISTS `participations`;
CREATE TABLE IF NOT EXISTS `participations` (
  `idParticipation` int(11) NOT NULL AUTO_INCREMENT,
  `idUtilisateur` int(11) DEFAULT NULL,
  `idReunion` int(11) DEFAULT NULL,
  `idStatutPresence` int(11) DEFAULT NULL,
  `obligationPresence` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idParticipation`),
  KEY `FK_Participations_Utilisateurs` (`idUtilisateur`),
  KEY `FK_Participations_Reunions` (`idReunion`),
  KEY `FK_Participations_StatutsPresences` (`idStatutPresence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `participations`
--

INSERT INTO `participations` (`idParticipation`, `idUtilisateur`, `idReunion`, `idStatutPresence`, `obligationPresence`) VALUES
(1, 1, 2, 1, 1),
(2, 3, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `prioritestaches`
--

DROP TABLE IF EXISTS `prioritestaches`;
CREATE TABLE IF NOT EXISTS `prioritestaches` (
  `idPrioriteTache` int(11) NOT NULL AUTO_INCREMENT,
  `libellePrioriteTache` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPrioriteTache`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prioritestaches`
--

INSERT INTO `prioritestaches` (`idPrioriteTache`, `libellePrioriteTache`) VALUES
(1, 'Faible importance '),
(2, 'Moyenne importance '),
(3, 'Forte importance');

-- --------------------------------------------------------

--
-- Structure de la table `reunions`
--

DROP TABLE IF EXISTS `reunions`;
CREATE TABLE IF NOT EXISTS `reunions` (
  `idReunion` int(11) NOT NULL AUTO_INCREMENT,
  `titreReunion` varchar(50) DEFAULT NULL,
  `dateReunion` date DEFAULT NULL,
  `lieuReunion` varchar(50) DEFAULT NULL,
  `horaireDebut` time DEFAULT NULL,
  `horaireFin` time DEFAULT NULL,
  `nbMaxParticipants` int(11) DEFAULT NULL,
  `contenuCompteRendu` text,
  `idCreateur` int(11) NOT NULL,
  `idAnimateur` int(11) NOT NULL,
  `idSecretaire` int(11) NOT NULL,
  `idTypeReunion` int(11) NOT NULL,
  `idEtatAvancement` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  PRIMARY KEY (`idReunion`),
  KEY `FK_Reunions_Createur` (`idCreateur`),
  KEY `FK_Reunions_Secretaire` (`idSecretaire`),
  KEY `FK_Reunions_Animateur` (`idAnimateur`),
  KEY `FK_Reunions_TypesReunions` (`idTypeReunion`),
  KEY `FK_Reunions_EtatsAvancements` (`idEtatAvancement`),
  KEY `FK_Reunions_Salles` (`idSalle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reunions`
--

INSERT INTO `reunions` (`idReunion`, `titreReunion`, `dateReunion`, `lieuReunion`, `horaireDebut`, `horaireFin`, `nbMaxParticipants`, `contenuCompteRendu`, `idCreateur`, `idAnimateur`, `idSecretaire`, `idTypeReunion`, `idEtatAvancement`, `idSalle`) VALUES
(1, 'financiere', '2022-01-13', 'dunkerque ', '06:30:30', '07:30:30', 50, 'la reunion portera sur les comptes de l\'entreprise , on verra l\'intégralités des projet réalisés en 2021', 1, 2, 3, 1, 1, 1),
(2, 'compte rendu operation noel ', '2022-01-19', 'maubeuge', '15:36:30', '20:36:30', 150, 'projet noel , compte rendu de l\'operation', 3, 1, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `libelleRole` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`idRole`, `libelleRole`) VALUES
(1, 'Secretaire '),
(2, 'Animateur'),
(3, 'Participant'),
(4, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `libelleSalle` varchar(50) DEFAULT NULL,
  `tailleMaxSalle` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`idSalle`, `libelleSalle`, `tailleMaxSalle`) VALUES
(1, 'coluche', 50),
(2, 'Charles de gaulle', 150),
(3, 'test', 50),
(5, 'test', 50);

-- --------------------------------------------------------

--
-- Structure de la table `statutspresences`
--

DROP TABLE IF EXISTS `statutspresences`;
CREATE TABLE IF NOT EXISTS `statutspresences` (
  `idStatutPresence` int(11) NOT NULL AUTO_INCREMENT,
  `libelleStatutPresence` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idStatutPresence`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statutspresences`
--

INSERT INTO `statutspresences` (`idStatutPresence`, `libelleStatutPresence`) VALUES
(1, 'Present'),
(2, 'Absent'),
(3, 'Excuse');

-- --------------------------------------------------------

--
-- Structure de la table `sujets`
--

DROP TABLE IF EXISTS `sujets`;
CREATE TABLE IF NOT EXISTS `sujets` (
  `idSujet` int(11) NOT NULL AUTO_INCREMENT,
  `libelleSujet` varchar(150) DEFAULT NULL,
  `tempsAlloue` time DEFAULT NULL,
  `idOrateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSujet`),
  KEY `FK_Sujets_Orateur` (`idOrateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sujets`
--

INSERT INTO `sujets` (`idSujet`, `libelleSujet`, `tempsAlloue`, `idOrateur`) VALUES
(3, 'cout', '09:33:14', 1),
(4, 'temps', '00:18:40', 2),
(5, 'structure', '00:33:22', 3);

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

DROP TABLE IF EXISTS `taches`;
CREATE TABLE IF NOT EXISTS `taches` (
  `idTache` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTache` text,
  `dateEcheanceTache` date DEFAULT NULL,
  `idEtatAvancement` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idPrioriteTache` int(11) NOT NULL,
  PRIMARY KEY (`idTache`),
  KEY `FK_Taches_EtatsAvancements` (`idEtatAvancement`),
  KEY `FK_Taches_Utilisateurs` (`idUtilisateur`),
  KEY `FK_Taches_PrioritesTaches` (`idPrioriteTache`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taches`
--

INSERT INTO `taches` (`idTache`, `libelleTache`, `dateEcheanceTache`, `idEtatAvancement`, `idUtilisateur`, `idPrioriteTache`) VALUES
(1, 'Structure des ducuments', '2022-01-19', 1, 4, 1),
(2, 'Calcule des couts ', '2022-01-12', 2, 2, 2),
(3, 'Mise en production', '2022-01-12', 3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `typesreunions`
--

DROP TABLE IF EXISTS `typesreunions`;
CREATE TABLE IF NOT EXISTS `typesreunions` (
  `idTypeReunion` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTypeReunion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTypeReunion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typesreunions`
--

INSERT INTO `typesreunions` (`idTypeReunion`, `libelleTypeReunion`) VALUES
(1, 'Presentiel'),
(2, 'Distanciel ');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nomUtilisateur` varchar(50) DEFAULT NULL,
  `prenomUtilisateur` varchar(50) DEFAULT NULL,
  `emailUtilisateur` varchar(50) DEFAULT NULL,
  `motDePasseUtilisateur` varchar(50) DEFAULT NULL,
  `validationUtilisateur` tinyint(1) DEFAULT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`),
  KEY `FK_Utilisateurs_Roles` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nomUtilisateur`, `prenomUtilisateur`, `emailUtilisateur`, `motDePasseUtilisateur`, `validationUtilisateur`, `idRole`) VALUES
(1, 'Poson', 'Alan', 'Alan@gmail.com', 'test', 1, 4),
(2, 'Mayeux', 'Bruno', 'Bruno@gmail.com', 'test', 1, 2),
(3, 'Terki', 'Moktar', 'Moktar@gmail.com', 'test', 1, 1),
(4, 'Bolt', 'Usain', 'usain@gmail.com', 'test', 1, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gestionsannexes`
--
ALTER TABLE `gestionsannexes`
  ADD CONSTRAINT `FK_GestionsAnnexes_FichiersAnnexes` FOREIGN KEY (`idFichierAnnexe`) REFERENCES `fichiersannexes` (`idFichierAnnexe`),
  ADD CONSTRAINT `FK_GestionsAnnexes_Reunions` FOREIGN KEY (`idReunion`) REFERENCES `reunions` (`idReunion`);

--
-- Contraintes pour la table `gestionstaches`
--
ALTER TABLE `gestionstaches`
  ADD CONSTRAINT `FK_GestionsTaches_Reunions` FOREIGN KEY (`idReunion`) REFERENCES `reunions` (`idReunion`),
  ADD CONSTRAINT `FK_GestionsTaches_Taches` FOREIGN KEY (`idTache`) REFERENCES `taches` (`idTache`);

--
-- Contraintes pour la table `ordresdujour`
--
ALTER TABLE `ordresdujour`
  ADD CONSTRAINT `FK_OrdresDuJour_Reunions` FOREIGN KEY (`idReunion`) REFERENCES `reunions` (`idReunion`),
  ADD CONSTRAINT `FK_OrdresDuJour_Sujets` FOREIGN KEY (`idSujet`) REFERENCES `sujets` (`idSujet`);

--
-- Contraintes pour la table `participations`
--
ALTER TABLE `participations`
  ADD CONSTRAINT `FK_Participations_Reunions` FOREIGN KEY (`idReunion`) REFERENCES `reunions` (`idReunion`),
  ADD CONSTRAINT `FK_Participations_StatutsPresences` FOREIGN KEY (`idStatutPresence`) REFERENCES `statutspresences` (`idStatutPresence`),
  ADD CONSTRAINT `FK_Participations_Utilisateurs` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateurs` (`idUtilisateur`);

--
-- Contraintes pour la table `reunions`
--
ALTER TABLE `reunions`
  ADD CONSTRAINT `FK_Reunions_Animateur` FOREIGN KEY (`idAnimateur`) REFERENCES `utilisateurs` (`idUtilisateur`),
  ADD CONSTRAINT `FK_Reunions_Createur` FOREIGN KEY (`idCreateur`) REFERENCES `utilisateurs` (`idUtilisateur`),
  ADD CONSTRAINT `FK_Reunions_EtatsAvancements` FOREIGN KEY (`idEtatAvancement`) REFERENCES `etatsavancements` (`idEtatAvancement`),
  ADD CONSTRAINT `FK_Reunions_Salles` FOREIGN KEY (`idSalle`) REFERENCES `salles` (`idSalle`),
  ADD CONSTRAINT `FK_Reunions_Secretaire` FOREIGN KEY (`idSecretaire`) REFERENCES `utilisateurs` (`idUtilisateur`),
  ADD CONSTRAINT `FK_Reunions_TypesReunions` FOREIGN KEY (`idTypeReunion`) REFERENCES `typesreunions` (`idTypeReunion`);

--
-- Contraintes pour la table `sujets`
--
ALTER TABLE `sujets`
  ADD CONSTRAINT `FK_Sujets_Orateur` FOREIGN KEY (`idOrateur`) REFERENCES `utilisateurs` (`idUtilisateur`);

--
-- Contraintes pour la table `taches`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `FK_Taches_EtatsAvancements` FOREIGN KEY (`idEtatAvancement`) REFERENCES `etatsavancements` (`idEtatAvancement`),
  ADD CONSTRAINT `FK_Taches_PrioritesTaches` FOREIGN KEY (`idPrioriteTache`) REFERENCES `prioritestaches` (`idPrioriteTache`),
  ADD CONSTRAINT `FK_Taches_Utilisateurs` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateurs` (`idUtilisateur`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `FK_Utilisateurs_Roles` FOREIGN KEY (`idRole`) REFERENCES `roles` (`idRole`);
--
-- Base de données : `gestionstock`
--
CREATE DATABASE IF NOT EXISTS `gestionstock` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestionstock`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `idArticle` int(11) NOT NULL AUTO_INCREMENT,
  `libelleArticle` varchar(100) DEFAULT NULL,
  `quantiteStockee` int(11) DEFAULT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `FK_Categories_Articles` (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`idArticle`, `libelleArticle`, `quantiteStockee`, `idCategorie`) VALUES
(1, 'Spaghettis', 1000, 1),
(2, 'Pain de mie', 200, 1),
(3, 'Sel', 2500, 1),
(4, 'Chips', 10000, 1),
(5, 'Oeufs', 1000, 2),
(6, 'Yahourts Nature', 800, 2),
(7, 'Beurre', 600, 2),
(8, 'Emmental', 200, 2),
(9, 'Tomates', 6000, 3),
(10, 'Bananes', 1000, 3),
(11, 'Pommes', 10000, 3),
(12, 'Rasoirs', 1000, 4),
(13, 'Lames de rasoirs', 500, 4),
(14, 'Gel de rasage', 600, 4),
(15, 'Savon', 1000, 5),
(16, 'Gel Douche', 4000, 5),
(17, 'Crème Hydratante', 6500, 5),
(18, 'Brosse', 100, 6),
(19, 'Laque', 100, 6),
(20, 'Gel', 100, 6),
(21, 'Serpillères', 800, 7),
(22, 'Balais', 600, 7),
(23, 'Liquide lavage', 300, 7),
(24, 'Liquide Vaisselle', 800, 8),
(25, 'Eponge', 900, 8),
(26, 'Patilles Lava Vaisselle', 800, 8),
(27, 'Détachant', 700, 9),
(28, 'Lessive', 800, 9),
(29, 'Anti-Calcaire', 100, 9),
(30, 'Banc', 100, 10),
(31, 'Table de jardin', 100, 10),
(32, 'Chaise de jardin', 100, 10),
(33, 'Engrais', 1400, 11),
(34, 'Désherbant', 500, 11),
(35, 'Graines de tomates', 100, 12),
(36, 'Graines de fleurs', 100, 12),
(37, 'Graines de salade', 100, 12),
(38, 'Scie', 10, 13),
(39, 'Marteau', 100, 13),
(40, 'Perceuse', 1, 13),
(41, 'Clous', 100, 14),
(42, 'Vis', 100, 14),
(43, 'Ecrous', 100, 14),
(44, 'Dominos', 100, 15),
(45, 'Prises', 100, 15),
(46, 'Interrupteurs', 100, 15);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCategorie` varchar(100) DEFAULT NULL,
  `idTypeProduit` int(11) NOT NULL,
  PRIMARY KEY (`idCategorie`),
  KEY `FK_Categories_TypesProduits` (`idTypeProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `libelleCategorie`, `idTypeProduit`) VALUES
(1, 'Epicerie', 1),
(2, 'Frais', 1),
(3, 'Fruis et Légumes', 1),
(4, 'Rasage', 2),
(5, 'Soins du corps', 2),
(6, 'Coiffure', 2),
(7, 'Lavage Sol', 3),
(8, 'Vaisselle', 3),
(9, 'Lessive', 3),
(10, 'Mobilier', 4),
(11, 'Produits', 4),
(12, 'Gaines', 4),
(13, 'Outillage', 5),
(14, 'Quincallerie', 5),
(15, 'Electricité', 5);

-- --------------------------------------------------------

--
-- Structure de la table `typesproduits`
--

DROP TABLE IF EXISTS `typesproduits`;
CREATE TABLE IF NOT EXISTS `typesproduits` (
  `idTypeProduit` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTypeProduit` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTypeProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typesproduits`
--

INSERT INTO `typesproduits` (`idTypeProduit`, `libelleTypeProduit`) VALUES
(1, 'Alimentaire'),
(2, 'Hygiene'),
(3, 'Droguerie'),
(4, 'Jardinage'),
(5, 'Bricolage');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `FK_Categories_Articles` FOREIGN KEY (`idCategorie`) REFERENCES `categories` (`idCategorie`);

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_Categories_TypesProduits` FOREIGN KEY (`idTypeProduit`) REFERENCES `typesproduits` (`idTypeProduit`);
--
-- Base de données : `northwind`
--
CREATE DATABASE IF NOT EXISTS `northwind` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `northwind`;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220210092139', '2022-02-10 09:21:48', 119);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `require_date` datetime NOT NULL,
  `shipped_date` datetime NOT NULL,
  `ship_via` int(11) NOT NULL,
  `freight` double NOT NULL,
  `ship_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_adress` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_city` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_region` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_country` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Supplier_id_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity_per_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` double NOT NULL,
  `units_in_stock` int(11) NOT NULL,
  `units_on_order` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  `discontinued` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `product_name`, `Supplier_id_id`, `category_id`, `quantity_per_unit`, `unit_price`, `units_in_stock`, `units_on_order`, `reorder_level`, `discontinued`) VALUES
(1, 'biche', 1, 1, '50', 15, 30, 45, 23, 1),
(2, 'tigre', 1, 1, '20', 15, 10, 15, 62, 1),
(3, 'lion', 1, 1, '1', 1, 1, 1, 1, 1),
(4, 'Mygale', 1, 1, 'abcd+20', 1, 1, 1, 1, 1),
(5, 'maxence', 1, 1, '154646', 1, 1, 3, 8, 1),
(6, 'vacheeee', 1, 1, '1', 114, 1, 1, 1, 1),
(7, 'mouflon', 1, 1, '1', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_page` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `contact_name`, `contact_title`, `address`, `city`, `region`, `postal_code`, `country`, `phone`, `fax`, `home_page`) VALUES
(1, 'agora', 'jeanjean', 'projet', '54 rue du lin ', 'dunkerque', 'haut de calais', '59623', 'belgique', '03.20.62.62.30', 'jemerapelleplus', 'bla bla ');
--
-- Base de données : `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`CourseId`, `CourseName`, `Description`) VALUES
(1, 'Math', 'Cours de Math'),
(2, 'Francais', 'Cours de Francais'),
(3, 'Musique', 'Cours de Musique');

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `GradeID` int(11) NOT NULL AUTO_INCREMENT,
  `GradeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `grade`
--

INSERT INTO `grade` (`GradeID`, `GradeName`) VALUES
(1, 'Seconde'),
(2, 'Première'),
(3, 'Terminale'),
(4, 'Bac');

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `GradeID` int(11) NOT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `FK_Student_Grade` (`GradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `student`
--

INSERT INTO `student` (`StudentId`, `Name`, `GradeID`) VALUES
(1, 'Bruno', 3),
(2, 'Rémi', 1),
(3, 'Jean', 1),
(4, 'Yann', 3);

-- --------------------------------------------------------

--
-- Structure de la table `studentscourses`
--

DROP TABLE IF EXISTS `studentscourses`;
CREATE TABLE IF NOT EXISTS `studentscourses` (
  `StudentCourseId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentCourseId`),
  KEY `StudentId` (`StudentId`),
  KEY `CourseId` (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `studentscourses`
--

INSERT INTO `studentscourses` (`StudentCourseId`, `StudentId`, `CourseId`) VALUES
(1, 1, 2),
(2, 3, 3),
(3, 4, 3),
(4, 3, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_Student_Grade` FOREIGN KEY (`GradeID`) REFERENCES `grade` (`GradeID`);

--
-- Contraintes pour la table `studentscourses`
--
ALTER TABLE `studentscourses`
  ADD CONSTRAINT `studentscourses_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  ADD CONSTRAINT `studentscourses_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`);
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `idPersonne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`idPersonne`, `nom`, `prenom`) VALUES
(1, 'Deleu', 'Thomas'),
(2, 'Deleu', 'Thomas'),
(3, 'Joly', 'Sébastien'),
(4, 'test', 'toto');
--
-- Base de données : `villedepartement`
--
CREATE DATABASE IF NOT EXISTS `villedepartement` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `villedepartement`;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `idDepartement` int(11) NOT NULL AUTO_INCREMENT,
  `libelleDepartement` varchar(50) NOT NULL,
  PRIMARY KEY (`idDepartement`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`idDepartement`, `libelleDepartement`) VALUES
(1, 'Nord'),
(2, 'Pas de calais'),
(3, 'Somme'),
(4, 'Aisne'),
(5, 'Calvados'),
(6, 'Manche');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `idVille` int(11) NOT NULL AUTO_INCREMENT,
  `libelleVille` varchar(50) NOT NULL,
  `idDepartement` int(11) NOT NULL,
  PRIMARY KEY (`idVille`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`idVille`, `libelleVille`, `idDepartement`) VALUES
(1, 'Hazebrouck', 1),
(2, 'Dunkerque', 1),
(3, 'Arras', 2),
(4, 'Calais', 2),
(5, 'Albert', 3),
(6, 'Peronne', 3),
(7, 'Saint Quentin', 4),
(8, 'Caen', 5),
(9, 'Cherbourg', 6),
(10, 'Carentan', 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
