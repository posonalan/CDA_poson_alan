-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 16 mai 2022 à 06:16
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
-- Base de données :  `dosimetrieengie2`
--

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

DROP TABLE IF EXISTS `activites`;
CREATE TABLE IF NOT EXISTS `activites` (
  `IdActivite` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleActivite` varchar(50) DEFAULT NULL,
  `DescriptionActivite` text,
  `Risque` text NOT NULL,
  `Parade` text NOT NULL,
  `PhotoActivite` varchar(250) DEFAULT NULL,
  `EffectifActivite` int(11) DEFAULT NULL,
  `TempsActivite` int(11) DEFAULT NULL,
  `IdOperation` int(11) NOT NULL,
  `IdBatiment` int(11) NOT NULL,
  PRIMARY KEY (`IdActivite`),
  KEY `FK_Activites_Batiments` (`IdBatiment`),
  KEY `FK_Activites_Operations` (`IdOperation`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`IdActivite`, `LibelleActivite`, `DescriptionActivite`, `Risque`, `Parade`, `PhotoActivite`, `EffectifActivite`, `TempsActivite`, `IdOperation`, `IdBatiment`) VALUES
(1, 'Soudure tuyaux E11', 'test 04', 'test 20', 'test 04', 'jpg_6262a5abc64b7.jpg', 10, 10, 1, 2),
(2, 'Découpe tuyau E11', 'découpage du tuyaux E11  ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '- expulsion de teest irradiants - expulsion de matières irradiantes ', 'Port de tenu de protection bâche de protection ', 'jpg_624ac98fce02c.jpg', 7, 7, 3, 2),
(3, 'Plan maintenance du tuyaux E11', 'test 02 ', 'test 03', 'test 02 ', 'jpg_62559345b554e.jpg', 6, 6, 2, 2),
(4, 'Radiographie soudure tuyaux E11', 'test', 'test', 'test', 'jpg_6255a51dba319.jpg', 13, 3, 2, 2),
(10, 'Préparation de la pièce coude E11', 'La préparation de l\'extrémité des tubes et des tuyaux est un processus critique, qui est essentiel à la création de joints soudés parfaits sur les conduites et les tuyaux. La préparation peut comprendre : la coupe, le dressage, l\'équerrage, le chanfreinage ou le délardage, mais chaque opération doit être effectuée régulièrement et avec précision, afin que la préparation de la conduite soit de la même qualité, constante et pouvant être répétée à chaque fois !\r\nUne préparation précise de la conduite :\r\n- Assure un alignement parfait des conduites\r\n- Réalise des joints soudés sans fuite\r\n- Réduit le risque de contamination en créant une étanchéité optimale\r\nLes technologies de soudage automatisé sont directement améliorées par la qualité et le soin investis dans la préparation des extrémités des conduites.\r\n\r\n', '- coupe\r\n- projection de déchets de coupes  \r\n- charges lourdes', '- port de gant \r\n- port de lunette de protection\r\n- geste et posture a respecter. ', 'jpg_6274f44100ed4.jpg', 6, 6, 1, 2),
(12, 'Mise en fonction et test tuyaux E11', 'test test', 'test 02 ', 'test 02 ', 'jpg_625ff5cc71f2b.jpg', 6, 6, 1, 2),
(15, 'test', 'test 01', 'test 03', 'protection', 'jpg_6267e6f161e27.jpg', 6, 5, 2, 8),
(16, 'test', 'test test', 'protection', 'protection', 'jpg_6268fea6015fe.jpg', 6, 6, 1, 9),
(17, 'test', 'test test', 'test 02 ', 'protection', 'jpg_626af11313d5b.jpg', 6, 6, 22, 2),
(18, 'Dépose interférent tuyauterie sur ligne à déposer', 'Dépose interférent tuyauterie sur ligne à déposer', '- Exposition externe Gamma corps entier', '- Entrainement et préparation pour réduire le temps d\'exposition.', 'jpg_62724ce2c3d9e.jpg', 2, 11, 24, 17),
(19, 'Dépose interférent mécanique support sur ligne ', 'Dépose interférent mécanique support sur ligne à déposer', '- Exposition externe Gamma corps entier', '- Entrainement et préparation pour réduire le temps d\'exposition.', 'jpg_62724d65d0a69.jpg', 2, 12, 24, 17),
(20, 'Repose interférent tuyauterie sur ligne', 'Dépose interférent mécanique support sur ligne à déposer', '- Exposition externe Gamma corps entier', '- Entrainement et préparation pour réduire le temps d\'exposition.', 'jpg_62724e684c358.jpg', 2, 11, 24, 17),
(21, 'Repose interférent mécanique support sur ligne', 'Dépose interférent mécanique support sur ligne à déposer', '- Exposition externe Gamma corps entier', '- Exposition externe Gamma corps entier', 'jpg_62724ed5857b2.jpg', 2, 16, 24, 17),
(22, 'Préparation du matériel', 'entrer le matériel en zone contrôlée', 'Contamination de matériel non dédié en ZC', 'Protéger le matériel de la contamination. ', 'jpg_62725151e6d05.jpg', 4, 22, 25, 18),
(24, 'test', NULL, 'z', 'z', 'jpg_627a833d2e3fd.jpg', 6, 6, 26, 1),
(25, 'test', NULL, 'zeze', 'zeze', 'jpg_627b9d18776ce.jpg', 6, 5, 28, 9),
(26, 'ezeze', NULL, 'eze', 'zez', 'jpg_627b9d3798775.jpg', 2, 8, 28, 17),
(27, 'Dépose interférent tuyauterie sur ligne à déposer', NULL, 'ezez', 'zez', 'jpg_627bd436047d6.jpg', 6, 6, 28, 9),
(28, 'Repose interférent mécanique support sur ligne', NULL, 'zeeze', 'zezez', 'jpg_627bd45326fb2.jpg', 5, 6, 28, 9),
(29, 'anthony', NULL, 'test', 'test', 'jpg_627d0d0600091.jpg', 12, NULL, 28, 14),
(30, 'Dépose interférent mécanique support sur ligne à d', NULL, 'test', 'test', 'jpg_627d1117b38f1.jpg', 5, 11, 23, 14),
(31, 'test', NULL, 'tombé', 't\'accrocher au matelas ', 'jpg_627d1774526be.jpg', 6, 5, 34, 16),
(32, 'test', NULL, 'test', 'test', 'jpg_627e4f34db0fc.jpg', 5, 11, 1, 10);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `activitesprotections`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `activitesprotections`;
CREATE TABLE IF NOT EXISTS `activitesprotections` (
`IdActiviteProtection` int(11)
,`IdActivite` int(11)
,`IdProtection` int(11)
,`LibelleProtection` varchar(50)
,`DescriptionProtection` text
,`PhotoProtection` varchar(250)
,`DosimetrieProtection` decimal(15,2)
,`InformationProtection` text
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `activitesvues`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `activitesvues`;
CREATE TABLE IF NOT EXISTS `activitesvues` (
`IdActivite` int(11)
,`LibelleActivite` varchar(50)
,`DescriptionActivite` text
,`Risque` text
,`Parade` text
,`PhotoActivite` varchar(250)
,`EffectifActivite` int(11)
,`TempsActivite` int(11)
,`IdOperation` int(11)
,`IdBatiment` int(11)
,`DosimetrieActivite` decimal(38,2)
);

-- --------------------------------------------------------

--
-- Structure de la table `activites_protections`
--

DROP TABLE IF EXISTS `activites_protections`;
CREATE TABLE IF NOT EXISTS `activites_protections` (
  `IdActiviteProtection` int(11) NOT NULL AUTO_INCREMENT,
  `IdActivite` int(11) DEFAULT NULL,
  `IdProtection` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdActiviteProtection`),
  KEY `FK_ActivitesProtections_Activites` (`IdActivite`),
  KEY `FK_ActivitesProtections_Protections` (`IdProtection`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activites_protections`
--

INSERT INTO `activites_protections` (`IdActiviteProtection`, `IdActivite`, `IdProtection`) VALUES
(16, 4, 2),
(27, 12, 1),
(34, 15, 2),
(36, 1, 26),
(37, 16, 26),
(39, 1, 26),
(42, 16, 26),
(45, 17, 26),
(46, 17, 38),
(47, 1, 3),
(48, 1, 38),
(51, 1, 38),
(52, 24, 26),
(56, 25, 26),
(57, 25, 26),
(58, 25, 1),
(59, 26, 38),
(60, 26, 38),
(61, 25, 38),
(62, 25, 38),
(63, 25, 38),
(64, 25, 1),
(65, 25, 1),
(66, 10, 2),
(67, 29, 2),
(68, 29, 26),
(69, 29, 3),
(70, 29, 26),
(71, 29, 2),
(72, 29, 26),
(73, 29, 1),
(74, 29, 38),
(75, 29, 38),
(76, 29, 26),
(77, 29, 21),
(78, 29, 1),
(79, 30, 26),
(80, 30, 2),
(81, 30, 2),
(82, 30, 2),
(83, 30, 2),
(84, 30, 2),
(85, 30, 2),
(86, 30, 1),
(87, 29, 26),
(88, 29, 1),
(89, 29, 3),
(90, 31, 3),
(91, 16, 1),
(92, 16, 21);

-- --------------------------------------------------------

--
-- Structure de la table `batiments`
--

DROP TABLE IF EXISTS `batiments`;
CREATE TABLE IF NOT EXISTS `batiments` (
  `IdBatiment` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleBatiment` varchar(50) DEFAULT NULL,
  `DescriptionBatiment` text,
  `PhotoBatiment` varchar(50) DEFAULT NULL,
  `DosimetrieBatiment` decimal(15,2) DEFAULT NULL,
  `IdEnjeuRadio` int(11) NOT NULL,
  `IdTranche` int(11) NOT NULL,
  PRIMARY KEY (`IdBatiment`),
  KEY `FK_Batiments_EnjeuxRadiologiques` (`IdEnjeuRadio`),
  KEY `FK_Batiments_Tranches` (`IdTranche`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`IdBatiment`, `LibelleBatiment`, `DescriptionBatiment`, `PhotoBatiment`, `DosimetrieBatiment`, `IdEnjeuRadio`, `IdTranche`) VALUES
(1, 'GVL-1-R', 'Le batiment reacteur regroupe le coeur du process nucleaire', 'jpg_626fb5a4543f6.jpg', '0.60', 1, 1),
(2, 'GVL-2-R', 'Le batiment reacteur regroupe le coeur du process nucleaire', 'jpg_626fbbb97e523.jpg', '0.40', 3, 2),
(8, 'GVL-2-A', 'Le batiment reacteur regroupe le coeur du process nucleaire', 'jpg_626fbbc65ca41.jpg', '1.20', 3, 2),
(9, 'FKS-2-R', 'batiment au sud ouest de la centrale ', 'jpg_626fbc0624b0b.jpg', '0.20', 2, 13),
(10, 'THR-2-R', 'batiment au sud ouest de la centrale ', 'jpg_626fbc236cc7b.jpg', '0.50', 3, 11),
(14, 'CHN-2-R', 'batiment au sud ouest de la centrale ', 'jpg_626fbc3a5a6f2.jpg', '0.50', 2, 9),
(16, 'GVL-4-R', 'tetetetetet', 'jpg_626fbcad2f5a1.jpg', '0.50', 3, 7),
(17, 'Reacteur', 'Bâtiment réacteur', 'jpg_627244e06a0ae.jpg', '0.25', 4, 16),
(18, 'Reacteur', 'Batiment reacteur', 'jpg_627246fe3508a.jpg', '0.18', 3, 18),
(19, 'GVL-3-R', 'le bâtiment du réacteur (BR) qui contient le réacteur proprement dit et l’ensemble du circuit primaire sous pression ainsi qu’une partie des circuits assurant le fonctionnement et la sûreté du réacteur ', 'jpg_6272848f71a25.jpg', '0.60', 3, 6),
(20, 'GLV-4-R', 'le bâtiment du réacteur (BR) qui contient le réacteur proprement dit et l’ensemble du circuit primaire sous pression ainsi qu’une partie des circuits assurant le fonctionnement et la sûreté du réacteur ', 'jpg_627284c050706.jpg', '1.30', 2, 7),
(24, 'Reacteur', 'Test 002', 'jpg_627a27fba50fc.jpg', '0.50', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `chantiers`
--

DROP TABLE IF EXISTS `chantiers`;
CREATE TABLE IF NOT EXISTS `chantiers` (
  `IdChantier` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleChantier` varchar(50) DEFAULT NULL,
  `DescriptionChantier` text,
  `PhotoChantier` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IdChantier`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chantiers`
--

INSERT INTO `chantiers` (`IdChantier`, `LibelleChantier`, `DescriptionChantier`, `PhotoChantier`) VALUES
(1, 'Centrale nucleaire Gravelines', 'La centrale nucléaire de Gravelines possède 6 réacteurs à eau pressurisée de 800 MWe. En 2021, elle a produit 29,8 TWh d\'électricité faible en CO2, ce qui couvre l\'équivalent des besoins de 70% de la consommation électrique annuelle des Hauts-de-France.', 'gravelines'),
(2, 'Centrale nucléaire Tchernobyl', 'La centrale devait disposer de six réacteurs nucléaires de type RBMK 1000 pour produire de l\'électricité à partir de l\'énergie nucléaire. La construction des réacteurs 1 et 2 débute en 1971 ; le premier est mis en service en 1977, le second, l’année suivante. Les réacteurs 3 et 4 sont mis en chantier en 1975 ; leur exploitation commence respectivement en 1981 et 1983. La construction des réacteurs 5 et 6, aussi d\'une puissance de 1 000 MW, est interrompue par la catastrophe.', 'tchernobyl'),
(3, 'Centrale nucléaire Chinon', 'La centrale nucléaire de Chinon possède 4 réacteurs à eau pressurisée de 900 MWe. En 2021, elle a produit 22,2 TWh d\'électricité faible en CO2, ce qui représente environ 6 % de la production d’électricité nucléaire française.', 'chinon\r\n'),
(13, 'Centrale nucléaire de Fukushima', 'centrale nucleaire a l\'est du japon ', 'jpg_62581ba484577.jpg'),
(17, 'Coudes-RIS-RRA-Penly', 'Travaux de remplacement des coudes RIS et RRA sur les lignes 1RCP054TY, 1RCP055TY, 1RCP056TY et 1RCP058TY sur la tranche 1 du CNPE de Penly\r\n', 'jpg_627239d2a615d.jpg'),
(18, 'Coudes-RIS-RRA-Chinon', 'Travaux de remplacement des coudes RIS et RRA sur les lignes 1RCP054TY, 1RCP055TY, 1RCP056TY et 1RCP058TY du CNPE de Chinon', 'jpg_6272464ab194e.jpg');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `chantiersvues`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `chantiersvues`;
CREATE TABLE IF NOT EXISTS `chantiersvues` (
`IdChantier` int(11)
,`LibelleChantier` varchar(50)
,`DescriptionChantier` text
,`PhotoChantier` varchar(250)
,`dosimetrieChantier` decimal(23,10)
);

-- --------------------------------------------------------

--
-- Structure de la table `dosimetriesutilisateurs`
--

DROP TABLE IF EXISTS `dosimetriesutilisateurs`;
CREATE TABLE IF NOT EXISTS `dosimetriesutilisateurs` (
  `IdDosimetrieUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `DateIntervention` date DEFAULT NULL,
  `TempsIntervention` int(11) DEFAULT NULL,
  `DosimetrieUtilisateur` decimal(15,2) DEFAULT NULL,
  `IdActivite` int(11) NOT NULL,
  `IdUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`IdDosimetrieUtilisateur`),
  KEY `FK_DosimetriesUtilisateurs_Activites` (`IdActivite`),
  KEY `FK_DosimetriesUtilisateurs_Utilisateurs` (`IdUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dosimetriesutilisateurs`
--

INSERT INTO `dosimetriesutilisateurs` (`IdDosimetrieUtilisateur`, `DateIntervention`, `TempsIntervention`, `DosimetrieUtilisateur`, `IdActivite`, `IdUtilisateur`) VALUES
(1, '2022-12-17', 2, '0.40', 1, 1),
(2, '2022-12-16', 1, '0.50', 1, 1),
(4, '2022-04-22', 2, '0.30', 1, 2),
(5, '2022-04-19', 2, '0.50', 1, 4),
(10, '2022-04-06', 1, '0.30', 1, 2),
(11, '2022-04-06', 11, '0.40', 1, 2),
(12, '2022-04-06', 2, '0.40', 1, 2),
(13, '2022-04-23', 1, '0.40', 1, 2),
(14, '2022-04-13', 2, '0.50', 1, 2),
(15, '2022-04-14', 2, '0.60', 2, 2),
(16, '2022-04-08', 3, '0.30', 2, 2),
(17, '2022-03-30', 1, '0.50', 2, 2),
(18, '2022-04-15', 1, '0.50', 3, 2),
(19, '2022-04-15', 1, '0.50', 3, 2),
(20, '2022-04-26', 1, '0.50', 10, 2),
(21, '2022-04-27', 1, '0.60', 4, 2),
(22, '2022-05-12', 1, '0.40', 10, 3),
(24, '2022-05-15', 2, '0.40', 12, 3),
(25, '2022-05-17', 2, '0.50', 2, 3),
(26, '2022-05-19', 1, '0.20', 4, 3),
(27, '2022-05-14', 2, '0.30', 20, 2),
(28, '2022-04-25', 1, '0.20', 4, 12);

-- --------------------------------------------------------

--
-- Structure de la table `enjeuxradiologiques`
--

DROP TABLE IF EXISTS `enjeuxradiologiques`;
CREATE TABLE IF NOT EXISTS `enjeuxradiologiques` (
  `IdEnjeuRadio` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleEnjeuRadio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdEnjeuRadio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `enjeuxradiologiques`
--

INSERT INTO `enjeuxradiologiques` (`IdEnjeuRadio`, `LibelleEnjeuRadio`) VALUES
(1, 'Niveau 0'),
(2, 'Niveau 1'),
(3, 'Niveau 2'),
(4, 'Niveau 3');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
CREATE TABLE IF NOT EXISTS `entreprises` (
  `IdEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleEntreprise` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`IdEntreprise`, `LibelleEntreprise`) VALUES
(1, 'EDF'),
(2, 'ENGIE'),
(3, 'ENDEL');

-- --------------------------------------------------------

--
-- Structure de la table `operations`
--

DROP TABLE IF EXISTS `operations`;
CREATE TABLE IF NOT EXISTS `operations` (
  `IdOperation` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleOperation` varchar(50) DEFAULT NULL,
  `DescriptionOperation` text,
  `InformationOperation` text NOT NULL,
  `PhotoOperation` varchar(250) DEFAULT NULL,
  `IdChantier` int(11) NOT NULL,
  PRIMARY KEY (`IdOperation`),
  KEY `FK_Operations_Chantiers` (`IdChantier`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operations`
--

INSERT INTO `operations` (`IdOperation`, `LibelleOperation`, `DescriptionOperation`, `InformationOperation`, `PhotoOperation`, `IdChantier`) VALUES
(1, 'Remplacement du tuyaux E11', 'Nous allons changer le tuyaux numero 22 sur le system de feu ', 'Nos testT-FLEX® fffffffffffffsont conçues pour fournir une solution économique et ergonomique pour protéger des sources de rayonnement provenant du sol.  Ergonomique et sure grâce à sa couche de silicone antidérapante elle remplacera les matelas de plomb habituellement jetés au sol pour une utilisation en toute sécurité dans les zones humides et potentiellement glissantes. Sa facilité de pose, son adaptabilité (possibilité de coupe sur place) et sa sécurité en sont ses principales qualités.  La protection biologique antidérapante T-Flex® est disponible en 100% tungstène, 100% bismuth, 100% acier ou un mélange', 'jpg_6268556e60551.jpg', 1),
(2, 'Réparation Clapet sur Robinet I33', 'Changement des pates de fixation du clapet, test de fonctionnement du clapet. mise en fonction du circuit femer', 'Révision de l’ensemble de vos appareils de robinetterie, vannes, soupapes, etc. lors de vos arrêts d’unités réglementaires.', 'robinet', 1),
(3, 'Remplacement moteur de pompe primaire', 'Un groupe motopompe primaire est installé sur la branche froide de chaque boucle, entre la sortie du générateur de vapeur et l’entrée de la cuve.\r\nSon rôle principal est d’assurer la circulation de l’eau avec le débit requis pour refroidir le cœur du réacteur (débit nominal 21 500 m3/h).', 'Il y a trois pompes primaires sur les tranches 900. Il s’agit de pompes de circulation munies de roues hélico-centrifuges à un étage, à axe vertical et dotées d’un dispositif d’étanchéité dynamique (le « joint d’arbre ») à fuite contrôlée, constitué de trois joints montés en cascade. La vitesse de rotation est de 1 485 tr/min.  La hauteur totale de chaque machine dépasse 8 m et la masse totale avoisine les 100 Tonnes.', 'pompe', 2),
(21, 'Chantier terminal méthanier ', 'Un terminal classique a quatre fonctions :\r\n\r\nRéceptionner les navires méthaniers et décharger ou recharger leur cargaison.\r\nStocker du GNL dans des réservoirs cryogéniques (- 160 °C).\r\nRegazéifier du GNL en fonction des besoins du réseau.\r\nRemettre ce gaz sur le réseau de transport national.', 'Un terminal méthanier est une installation permettant de regazéifier du gaz naturel liquéfié (GNL) transporté par voie maritime par les expéditeurs depuis les zones de production.', 'jpg_6268576aa7f94.jpg', 13),
(22, 'test 01', 'eededed', 'dededed', 'jpg_6268fedf3243b.jpg', 2),
(23, 'Test 02', 'eeeeeeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeeeeee', 'jpg_626af0e963369.jpg', 13),
(24, '1RCP054TY', 'Dépose-repose RIS branche chaude boucle 1.', '- Dépose repose des interférents sur tronçon à déposer.\r\n\r\n- Dépose repose des interférents dans l\'environnement.\r\n', 'jpg_62724ab96fad7.jpg', 17),
(25, 'Préparation de chantier', 'Préparation du chantier \r\n', ' Préparation du matériel \r\n\r\n Installation des moyens provisoires de levage (point ancrage , \r\n potence )\r\n\r\n Essai en charge des moyens de manutention provisoire\r\n\r\n Installation des moyens des accéssoires de levage\r\n\r\n Pose de support de ligne temporaire et blocage des lignes\r\n\r\n Relevé altymétrique de la ligne ', 'jpg_62725033a7015.jpg', 17),
(26, 'protection', 'Test 001 ', 'Test 002', 'jpg_627a2d1f03f5e.jpg', 2),
(27, 'Remplacement du velo E11', 'test test', 'test test', 'jpg_627a92ee03401.jpg', 3),
(28, 'Remplacement du velo E11', 'test', 'test', 'jpg_627a93642d998.jpg', 3),
(29, 'Remplacement du velo E11', 'test', 'test', 'jpg_627d12c698cff.jpg', 3),
(30, 'protection', 'test', 'test', 'jpg_627d136c9bc73.jpg', 3),
(31, 'tytyt', 'tete', 'tete', 'jpg_627d138d2f481.jpg', 2),
(32, 'ope 32', 'Test', 'iop', 'jpg_627d14582a75c.jpg', 13),
(33, 'test 001 ', 'cheeux', 'test', 'jpg_627d14d9ce250.jpg', 2),
(34, 'anthony l\'operateur', 'antho 1', 'very good', 'jpg_627d173db5b82.jpg', 13);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `operationsvues`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `operationsvues`;
CREATE TABLE IF NOT EXISTS `operationsvues` (
`IdOperation` int(11)
,`LibelleOperation` varchar(50)
,`DescriptionOperation` text
,`InformationOperation` text
,`PhotoOperation` varchar(250)
,`IdChantier` int(11)
,`EffectifOperation` decimal(32,0)
,`TempsOperation` decimal(32,0)
,`DosimetrieOperation` decimal(42,6)
);

-- --------------------------------------------------------

--
-- Structure de la table `operations_utilisateurs`
--

DROP TABLE IF EXISTS `operations_utilisateurs`;
CREATE TABLE IF NOT EXISTS `operations_utilisateurs` (
  `IdOperationUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `IdOperation` int(11) DEFAULT NULL,
  `IdUtilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdOperationUtilisateur`),
  KEY `FK_OperationsUtilisateurs_Operations` (`IdOperation`),
  KEY `FK_OperationsUtilisateurs_Utilisateurs` (`IdUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operations_utilisateurs`
--

INSERT INTO `operations_utilisateurs` (`IdOperationUtilisateur`, `IdOperation`, `IdUtilisateur`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `postesentreprises`
--

DROP TABLE IF EXISTS `postesentreprises`;
CREATE TABLE IF NOT EXISTS `postesentreprises` (
  `IdPosteEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `LibellePosteEntreprise` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdPosteEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `postesentreprises`
--

INSERT INTO `postesentreprises` (`IdPosteEntreprise`, `LibellePosteEntreprise`) VALUES
(1, 'Tuyauteur'),
(2, 'Soudeur'),
(3, 'Manutentonnaire'),
(8, 'Technicien radiologique '),
(13, 'test'),
(14, 'test'),
(15, 'Monoprix'),
(16, 'tuyauteur 01'),
(17, 'Administrateur Application'),
(18, 'boucher');

-- --------------------------------------------------------

--
-- Structure de la table `protections`
--

DROP TABLE IF EXISTS `protections`;
CREATE TABLE IF NOT EXISTS `protections` (
  `IdProtection` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleProtection` varchar(50) DEFAULT NULL,
  `DescriptionProtection` text,
  `PhotoProtection` varchar(250) DEFAULT NULL,
  `DosimetrieProtection` decimal(15,2) DEFAULT NULL,
  `InformationProtection` text,
  PRIMARY KEY (`IdProtection`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `protections`
--

INSERT INTO `protections` (`IdProtection`, `LibelleProtection`, `DescriptionProtection`, `PhotoProtection`, `DosimetrieProtection`, `InformationProtection`) VALUES
(1, 'Matelas de Plomb 1', 'Simples, souples, facilement transportables, pèsent moins de 25Kgs et permettent une atténuation de 35% des rayons Gamma pour une garantie radiologique optimale. Complété de divers accessoires de fixation, d\'accrochage, de transport et de manutention, meilleur rapport qualité-prix pour la protection totale de vos intervenants et de vos installations.', 'jpg_6273c32fbebb8.jpg', '0.50', 'Dim. Ext. : 960 x 560 mmDim. Gal. : 800 x 400 x 6 mm EqPbPoids : 22 kg12 œillets - Laine de plomb Classement au feu M2Marquage : Zone Contrôlée'),
(2, 'Enrubannage', 'Ce type de protection est destiné au secteur du bâtiment, du\r\nnucléaire (y compris les centrales nouvelles générations type EPR)\r\net de l’Oil & Gas.', 'enrubanage', '1.30', '- Protection à utiliser sur des conduits de ventilation et/ou de désenfumage en acier verticaux et horizontaux.\r\n- Ce bouclier est un complexe endothermique de quatre matériaux\r\nd’épaisseur totale de 76 mm et de masse surfacique 19,5 kg/m².\r\n- La finition est assurée par toile siliconée.\r\n- Des prises endoscopiques ou bossages peuvent être installés.\r\n- La traversée de voile (ou dalle) est permise par épanouissement\r\nde la protection.'),
(3, 'Cloison technique', 'Les cloisons techniques peuvent offrir une protection feu, radiologique ou antiexplosion.', 'cloison', '0.30', 'Des cloisons techniques sur mesure de 1 m2 à 600 m2 de surface'),
(21, 'Trappe technique', 'Les trappes offrent les protections techniques nécessaires que ce soit résistance au séisme, coupe feu, résistante à l\'explosion ou protection radiologique', 'trappe', '0.50', 'Les trappes peuvent être faites sur mesure, de moins de 1m2 à 80m2 de surface'),
(26, 'Matelas T-Flex', 'Les matelas en T-FLEX® sont une ALTERNATIVE aux matelas de plomb. Ils ont une atténuation similaire mais sans les dangers du plomb.', 'tflex', '0.20', 'Les matelas en T-FLEX® sont très résistants aux déchirures. Sa plus grande flexibilité par rapport à un matelas en plomb lui permet d’être « enroulé » au plus près de la source.'),
(38, 'Mise en eau', 'Le fait de faire passé de l\'eau avant dans le tuyaux permet de nettoyer des dépôts présent en fond.', 'jpg_627907ea25bc6.jpg', '0.60', 'la mise en haut peut etre realisé uniquement si les deux enbouchure du tuyaux son controlable. Obligation d\'avoir un tuyaux etanche sans risque de fuite de liquide possiblement irradié ');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `protectionsactivites`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `protectionsactivites`;
CREATE TABLE IF NOT EXISTS `protectionsactivites` (
`IdActiviteProtection` int(11)
,`IdActivite` int(11)
,`IdProtection` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `IdRole` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleRole` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`IdRole`, `LibelleRole`) VALUES
(1, 'Technicien'),
(2, 'Administrateur');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `textes`
--

INSERT INTO `textes` (`idTexte`, `codeTexte`, `fr`, `en`) VALUES
(1, 'Bonjour', 'Bonjour', 'Hello'),
(2, 'Connexion', 'Connexion', 'Log in'),
(3, 'Deconnexion', 'Deconnexion', 'Log out'),
(4, 'Accueil', 'Accueil', 'Home'),
(5, 'AdresseEmail', 'Adresse mail', 'Email address'),
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
(20, 'LibelleProtection', 'Nom de la protection : ', 'Name of the protection : '),
(22, 'DosimetrieProtection', 'Reduction de dose', 'Dosimetric drop level:'),
(23, 'Information', 'Information', 'Information'),
(24, 'DosimetrieAvantActivite', 'Dosimétrie Native', 'native dosimetry'),
(25, 'DosimetrieApresActivite', 'Dosimétrie Final', 'final dosimetry'),
(26, 'DateReleveDosimetrique', 'Date Relevé', 'statement date'),
(27, 'IdRole', 'Role', 'Role'),
(28, 'IdPosteEntreprise', 'Poste', 'business position'),
(29, 'IdEntreprise', 'Entreprise', 'Entreprise'),
(30, 'DateIntervention', 'Date intervention', 'Intervention date \r\n'),
(31, 'TempsIntervention', 'Temps (jours) ', 'times (days) '),
(32, 'DosimetrieUtilisateur', 'Dose perçu', 'Dose rate'),
(33, 'IdOperation', 'Operation', 'Operation'),
(34, 'IdActivite', 'Activite', 'Activite'),
(35, 'IdUtilisateur', 'Utilisateur', 'Utilisateur'),
(36, 'IdChantier', 'Chantier', 'Worksite'),
(37, 'IdTranche', 'Tranche', 'Slice'),
(39, 'LibelleOperation', 'Operation\r\n', 'Operation'),
(40, 'LibelleChantier', 'Chantier', 'Construction site'),
(41, 'Description', 'Description ', 'Description '),
(42, 'Bonjour', 'Bonjour', 'Hello'),
(43, 'Connexion', 'Connexion', 'Log in'),
(44, 'Deconnexion', 'Deconnexion', 'Log out'),
(47, 'Mdp', 'Mot de passe', 'Password'),
(49, 'Nom', 'Nom', 'Surname'),
(50, 'Prenom', 'Prenom', 'Name'),
(52, 'UneMajuscule', '1 majuscule', '1 uppercase'),
(53, 'UneMinuscule', '1 minuscule', '1 lowercase'),
(54, 'UnChiffre', '1 chiffre', '1 number'),
(55, 'UnCaractereSpecial', '1 caractère spécial ( ! @ & # * ^ $ % +)', '1 special character ( ! @ & # * ^ $ % +)'),
(56, 'MinimumCaractere', '8 caractères', '8 character'),
(57, 'Confirmation', 'Confirmation', 'Confirmation'),
(58, 'Reset', 'Réinitialisation', 'Reset'),
(60, 'Envoyer', 'Envoyer', 'Send'),
(61, 'TempsActivite', 'Temps', 'Times'),
(62, 'EffectifActivite', 'Effectif', 'Effective'),
(63, 'DosimetrieActivite', 'Débit dose', 'Dosimetry'),
(64, 'LibelleBatiment', 'Batiment', 'Building'),
(65, 'LibelleTranche', 'Tranche', 'split'),
(66, 'rayonnement', 'DED', 'Débit d\'équivalent de dose'),
(67, 'IdEnjeuRadio', 'Enjeu radiologique', 'Enjeu radiologique'),
(68, 'LibelleActivite', 'Activite', 'Activity');

-- --------------------------------------------------------

--
-- Structure de la table `tranches`
--

DROP TABLE IF EXISTS `tranches`;
CREATE TABLE IF NOT EXISTS `tranches` (
  `IdTranche` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleTranche` varchar(50) DEFAULT NULL,
  `DescriptionTranche` text,
  `PhotoTranche` varchar(250) DEFAULT NULL,
  `IdChantier` int(11) NOT NULL,
  PRIMARY KEY (`IdTranche`),
  KEY `FK_Tranches_Chantiers` (`IdChantier`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tranches`
--

INSERT INTO `tranches` (`IdTranche`, `LibelleTranche`, `DescriptionTranche`, `PhotoTranche`, `IdChantier`) VALUES
(1, 'GVL-1', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_626fbd8b0ecc0.jpg', 1),
(2, 'GVL-2', 'Tranche numéro 2 de la centrale nucléaire de Gravelines, situé au nord Ouest de la centrale. ', 'jpg_626fbdae2f70a.jpg', 1),
(6, 'GVL-3', 'Tranche numéro 3 de la centrale nucléaire de Gravelines, situé au Sud Est de la centrale. ', 'jpg_626fbdb9e9594.jpg', 1),
(7, 'GVL-4', 'Tranche numéro 4 de la centrale nucléaire de Gravelines, situé au Sud Ouest de la centrale. ', 'centrale', 1),
(8, 'CHN-1', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a21dfe2eea.jpg', 3),
(9, 'CHN-2', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a21f4a54d5.jpg', 3),
(10, 'TCH-1', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a220ced046.jpg', 2),
(11, 'THR-2', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a22219dd1c.jpg', 2),
(12, 'FKS-1', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a2230995fa.jpg', 13),
(13, 'FKS-2', 'Tranche numéro 1 de la centrale nucléaire de Gravelines, situé au nord Est de la centrale. ', 'jpg_627a224715235.jpg', 13),
(16, 'Tranche 1', 'Travaux de remplacement des coudes RIS et RRA sur les lignes 1RCP054TY, 1RCP055TY, 1RCP056TY et 1RCP058TY du CNPE de Penly\r\n', 'jpg_62723b3c50509.jpg', 17),
(17, 'Tranche 2', 'Travaux de remplacement des coudes RIS et RRA sur les lignes 1RCP054TY, 1RCP055TY, 1RCP056TY et 1RCP058TY du CNPE de Penly\r\n>', 'jpg_62723bbbea268.jpg', 17),
(18, 'Tranche 1 ', 'Travaux de remplacement des coudes RIS et RRA sur les lignes 1RCP054TY, 1RCP055TY, 1RCP056TY et 1RCP058TY du CNPE de Chinon\r\n', 'jpg_627246b85b08d.jpg', 18),
(19, 'CHN-3', 'Une centrale nucléaire inclut en général 2 à 4 réacteurs qui sont répartis en tranches nucléaires d\'une puissance unitaire moyenne de 1 000 MW (elle fournit dans ce cas une puissance cumulée de 2 000 à 4 000 MW). En France, il existe 58 réacteurs nucléaires en activité', 'jpg_62729b8570cf1.jpg', 3);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `tranchesvues`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `tranchesvues`;
CREATE TABLE IF NOT EXISTS `tranchesvues` (
`IdTranche` int(11)
,`LibelleTranche` varchar(50)
,`DescriptionTranche` text
,`PhotoTranche` varchar(250)
,`IdChantier` int(11)
,`dosimetrieTranche` decimal(19,6)
);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `IdUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AdresseMail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MotDePasse` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TelUtilisateur` varchar(50) DEFAULT NULL,
  `DosimetrieAvantActivite` decimal(15,2) DEFAULT NULL,
  `DosimetrieApresActivite` decimal(15,2) DEFAULT NULL,
  `DateReleveDosimetrique` date DEFAULT NULL,
  `IdRole` int(11) NOT NULL,
  `IdPosteEntreprise` int(11) NOT NULL,
  `IdEntreprise` int(11) NOT NULL,
  PRIMARY KEY (`IdUtilisateur`),
  KEY `FK_Utilisateurs_Roles` (`IdRole`),
  KEY `FK_Utilisateurs_PostesEntreprises` (`IdPosteEntreprise`),
  KEY `FK_Utilisateurs_Entreprises` (`IdEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IdUtilisateur`, `Nom`, `Prenom`, `AdresseMail`, `MotDePasse`, `TelUtilisateur`, `DosimetrieAvantActivite`, `DosimetrieApresActivite`, `DateReleveDosimetrique`, `IdRole`, `IdPosteEntreprise`, `IdEntreprise`) VALUES
(1, 'Colombe', 'Christophe', 'Colombe@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f\r\n', '0629568959', '0.20', '0.50', '2022-03-20', 1, 2, 2),
(2, 'Degaulle', 'Charles', 'Charles@gmail.com', 'ef15a9f6f18c7dd94d2a79b2bd4ff4bd', '0623252623', '0.20', '0.40', '2022-03-09', 1, 1, 1),
(3, 'Bonaparte', 'Napoleon', 'Napoleon@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '06.23.63.63.32', '0.20', '0.50', '2022-12-05', 1, 1, 1),
(4, 'Cesar', 'Jules', 'Cesar@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '06.23.63.63.32', '0.20', '0.50', '2022-03-24', 1, 1, 1),
(6, 'Trump', 'Donald', 'Donald@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '06.23.63.63.32', '0.20', '0.50', '2022-02-15', 1, 3, 2),
(7, 'Piaf', 'Edith', 'Edit@gmail.com', '48aa01b028bdce5c27bb26952ab544a0', '06.23.63.63.32', '0.20', '0.50', '2022-02-15', 1, 8, 3),
(8, 'Shakespeare', 'William', 'Shakespeare@gmail.com', 'c4034207675ecada294f3694e8bfcea3', '06.23.63.63.32', '0.20', '0.60', '2022-02-15', 1, 3, 3),
(12, 'germinal', 'olive', 'germinal@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '06.23.63.63.32', '0.20', '0.50', '2022-05-12', 2, 2, 2),
(13, 'Poson', 'alan', 'alan.poson@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '06.29.62.76.90', '0.20', '0.50', '2022-05-12', 2, 17, 3),
(14, 'Pasteur', 'Louis', 'pasteur@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f\r\n', '06.23.63.63.32', '0.20', '0.50', '2022-05-13', 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la vue `activitesprotections`
--
DROP TABLE IF EXISTS `activitesprotections`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activitesprotections`  AS  select `ap`.`IdActiviteProtection` AS `IdActiviteProtection`,`a`.`IdActivite` AS `IdActivite`,`p`.`IdProtection` AS `IdProtection`,`p`.`LibelleProtection` AS `LibelleProtection`,`p`.`DescriptionProtection` AS `DescriptionProtection`,`p`.`PhotoProtection` AS `PhotoProtection`,`p`.`DosimetrieProtection` AS `DosimetrieProtection`,`p`.`InformationProtection` AS `InformationProtection` from ((`activites` `a` join `activites_protections` `ap` on((`a`.`IdActivite` = `ap`.`IdActivite`))) join `protections` `p` on((`ap`.`IdProtection` = `p`.`IdProtection`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `activitesvues`
--
DROP TABLE IF EXISTS `activitesvues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activitesvues`  AS  select `activites`.`IdActivite` AS `IdActivite`,`activites`.`LibelleActivite` AS `LibelleActivite`,`activites`.`DescriptionActivite` AS `DescriptionActivite`,`activites`.`Risque` AS `Risque`,`activites`.`Parade` AS `Parade`,`activites`.`PhotoActivite` AS `PhotoActivite`,`activites`.`EffectifActivite` AS `EffectifActivite`,`activites`.`TempsActivite` AS `TempsActivite`,`activites`.`IdOperation` AS `IdOperation`,`activites`.`IdBatiment` AS `IdBatiment`,(`batiments`.`DosimetrieBatiment` - sum(ifnull(`protections`.`DosimetrieProtection`,0))) AS `DosimetrieActivite` from (((`activites` left join `activites_protections` on((`activites`.`IdActivite` = `activites_protections`.`IdActivite`))) left join `protections` on((`activites_protections`.`IdProtection` = `protections`.`IdProtection`))) join `batiments` on((`activites`.`IdBatiment` = `batiments`.`IdBatiment`))) group by `activites`.`IdActivite` ;

-- --------------------------------------------------------

--
-- Structure de la vue `chantiersvues`
--
DROP TABLE IF EXISTS `chantiersvues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chantiersvues`  AS  select `chantiers`.`IdChantier` AS `IdChantier`,`chantiers`.`LibelleChantier` AS `LibelleChantier`,`chantiers`.`DescriptionChantier` AS `DescriptionChantier`,`chantiers`.`PhotoChantier` AS `PhotoChantier`,avg(`tranchesvues`.`dosimetrieTranche`) AS `dosimetrieChantier` from (`chantiers` left join `tranchesvues` on((`chantiers`.`IdChantier` = `tranchesvues`.`IdChantier`))) group by `chantiers`.`IdChantier` ;

-- --------------------------------------------------------

--
-- Structure de la vue `operationsvues`
--
DROP TABLE IF EXISTS `operationsvues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `operationsvues`  AS  select `operations`.`IdOperation` AS `IdOperation`,`operations`.`LibelleOperation` AS `LibelleOperation`,`operations`.`DescriptionOperation` AS `DescriptionOperation`,`operations`.`InformationOperation` AS `InformationOperation`,`operations`.`PhotoOperation` AS `PhotoOperation`,`operations`.`IdChantier` AS `IdChantier`,sum(`activitesvues`.`EffectifActivite`) AS `EffectifOperation`,sum(`activitesvues`.`TempsActivite`) AS `TempsOperation`,avg(`activitesvues`.`DosimetrieActivite`) AS `DosimetrieOperation` from (`operations` left join `activitesvues` on((`operations`.`IdOperation` = `activitesvues`.`IdOperation`))) group by `operations`.`IdOperation` ;

-- --------------------------------------------------------

--
-- Structure de la vue `protectionsactivites`
--
DROP TABLE IF EXISTS `protectionsactivites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `protectionsactivites`  AS  select `ap`.`IdActiviteProtection` AS `IdActiviteProtection`,`a`.`IdActivite` AS `IdActivite`,`p`.`IdProtection` AS `IdProtection` from ((`activites` `a` join `protections` `p`) join `activites_protections` `ap`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `tranchesvues`
--
DROP TABLE IF EXISTS `tranchesvues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tranchesvues`  AS  select `tranches`.`IdTranche` AS `IdTranche`,`tranches`.`LibelleTranche` AS `LibelleTranche`,`tranches`.`DescriptionTranche` AS `DescriptionTranche`,`tranches`.`PhotoTranche` AS `PhotoTranche`,`tranches`.`IdChantier` AS `IdChantier`,avg(`batiments`.`DosimetrieBatiment`) AS `dosimetrieTranche` from (`tranches` left join `batiments` on((`tranches`.`IdTranche` = `batiments`.`IdTranche`))) group by `tranches`.`IdTranche` ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activites`
--
ALTER TABLE `activites`
  ADD CONSTRAINT `FK_Activites_Batiments` FOREIGN KEY (`IdBatiment`) REFERENCES `batiments` (`IdBatiment`),
  ADD CONSTRAINT `FK_Activites_Operations` FOREIGN KEY (`IdOperation`) REFERENCES `operations` (`IdOperation`);

--
-- Contraintes pour la table `activites_protections`
--
ALTER TABLE `activites_protections`
  ADD CONSTRAINT `FK_ActivitesProtections_Activites` FOREIGN KEY (`IdActivite`) REFERENCES `activites` (`IdActivite`),
  ADD CONSTRAINT `FK_ActivitesProtections_Protections` FOREIGN KEY (`IdProtection`) REFERENCES `protections` (`IdProtection`);

--
-- Contraintes pour la table `batiments`
--
ALTER TABLE `batiments`
  ADD CONSTRAINT `FK_Batiments_EnjeuxRadiologiques` FOREIGN KEY (`IdEnjeuRadio`) REFERENCES `enjeuxradiologiques` (`IdEnjeuRadio`),
  ADD CONSTRAINT `FK_Batiments_Tranches` FOREIGN KEY (`IdTranche`) REFERENCES `tranches` (`IdTranche`);

--
-- Contraintes pour la table `dosimetriesutilisateurs`
--
ALTER TABLE `dosimetriesutilisateurs`
  ADD CONSTRAINT `FK_DosimetriesUtilisateurs_Activites` FOREIGN KEY (`IdActivite`) REFERENCES `activites` (`IdActivite`),
  ADD CONSTRAINT `FK_DosimetriesUtilisateurs_Utilisateurs` FOREIGN KEY (`IdUtilisateur`) REFERENCES `utilisateurs` (`IdUtilisateur`);

--
-- Contraintes pour la table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `FK_Operations_Chantiers` FOREIGN KEY (`IdChantier`) REFERENCES `chantiers` (`IdChantier`);

--
-- Contraintes pour la table `operations_utilisateurs`
--
ALTER TABLE `operations_utilisateurs`
  ADD CONSTRAINT `FK_OperationsUtilisateurs_Operations` FOREIGN KEY (`IdOperation`) REFERENCES `operations` (`IdOperation`),
  ADD CONSTRAINT `FK_OperationsUtilisateurs_Utilisateurs` FOREIGN KEY (`IdUtilisateur`) REFERENCES `utilisateurs` (`IdUtilisateur`);

--
-- Contraintes pour la table `tranches`
--
ALTER TABLE `tranches`
  ADD CONSTRAINT `FK_Tranches_Chantiers` FOREIGN KEY (`IdChantier`) REFERENCES `chantiers` (`IdChantier`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `FK_Utilisateurs_Entreprises` FOREIGN KEY (`IdEntreprise`) REFERENCES `entreprises` (`IdEntreprise`),
  ADD CONSTRAINT `FK_Utilisateurs_PostesEntreprises` FOREIGN KEY (`IdPosteEntreprise`) REFERENCES `postesentreprises` (`IdPosteEntreprise`),
  ADD CONSTRAINT `FK_Utilisateurs_Roles` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
