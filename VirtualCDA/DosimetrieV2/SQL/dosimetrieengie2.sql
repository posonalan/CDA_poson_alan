-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 30 mars 2022 à 09:24
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`IdActivite`, `LibelleActivite`, `DescriptionActivite`, `Risque`, `Parade`, `PhotoActivite`, `EffectifActivite`, `TempsActivite`, `IdOperation`, `IdBatiment`) VALUES
(1, 'Soudure tuyaux E11', 'Soudure sur la breche du tuyaux E11', 'test', 'test', 'jpg_61f26b02c735c.jpg', 5, 3, 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activites_protections`
--

INSERT INTO `activites_protections` (`IdActiviteProtection`, `IdActivite`, `IdProtection`) VALUES
(1, 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`IdBatiment`, `LibelleBatiment`, `DescriptionBatiment`, `PhotoBatiment`, `DosimetrieBatiment`, `IdEnjeuRadio`, `IdTranche`) VALUES
(1, 'Reacteur', 'Le batiment reacteur regroupe le coeur du process nucleaire', 'jpg_61f26b02c735c.jpg', '0.60', 1, 1),
(2, 'Local 01', 'Le batiment reacteur regroupe le coeur du process nucleaire', 'jpg_61f26b02c735c.jpg', '0.40', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chantiers`
--

INSERT INTO `chantiers` (`IdChantier`, `LibelleChantier`, `DescriptionChantier`, `PhotoChantier`) VALUES
(1, 'Centrale nucleaire Gravelines', 'La centrale nucléaire de Gravelines possède 6 réacteurs à eau pressurisée de 900 MWe. En 2021, elle a produit 29,8 TWh d\'électricité faible en CO2, ce qui couvre l\'équivalent des besoins de 70% de la consommation électrique annuelle des Hauts-de-France.', 'gravelines'),
(2, 'Centrale nucléaire Tchernobyl', 'La centrale devait disposer de six réacteurs nucléaires de type RBMK 1000 pour produire de l\'électricité à partir de l\'énergie nucléaire. La construction des réacteurs 1 et 2 débute en 1971 ; le premier est mis en service en 1977, le second, l’année suivante. Les réacteurs 3 et 4 sont mis en chantier en 1975 ; leur exploitation commence respectivement en 1981 et 1983. La construction des réacteurs 5 et 6, aussi d\'une puissance de 1 000 MW, est interrompue par la catastrophe.', 'tchernobyl'),
(3, 'Centrale nucléaire Chinon', 'La centrale nucléaire de Chinon possède 4 réacteurs à eau pressurisée de 900 MWe. En 2021, elle a produit 22,2 TWh d\'électricité faible en CO2, ce qui représente environ 6 % de la production d’électricité nucléaire française.', 'chinon\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dosimetriesutilisateurs`
--

INSERT INTO `dosimetriesutilisateurs` (`IdDosimetrieUtilisateur`, `DateIntervention`, `TempsIntervention`, `DosimetrieUtilisateur`, `IdActivite`, `IdUtilisateur`) VALUES
(1, '2022-12-15', 3, '0.00', 1, 1),
(2, '2022-12-16', 3, '0.50', 1, 1),
(3, '2022-03-23', 3, '0.50', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operations`
--

INSERT INTO `operations` (`IdOperation`, `LibelleOperation`, `DescriptionOperation`, `InformationOperation`, `PhotoOperation`, `IdChantier`) VALUES
(1, 'Remplacement du tuyaux E11', 'Nous allons changer le tuyaux numero 11 sur le system de refroidissement', 'Nos tuiles T-FLEX® sont conçues pour fournir une solution économique et ergonomique pour protéger des sources de rayonnement provenant du sol.  Ergonomique et sure grâce à sa couche de silicone antidérapante elle remplacera les matelas de plomb habituellement jetés au sol pour une utilisation en toute sécurité dans les zones humides et potentiellement glissantes. Sa facilité de pose, son adaptabilité (possibilité de coupe sur place) et sa sécurité en sont ses principales qualités.  La protection biologique antidérapante T-Flex® est disponible en 100% tungstène, 100% bismuth, 100% acier ou un mélange', 'TuyauxR', 1),
(2, 'Réparation Clapet sur Robinet I33', 'Changement des pates de fixation du clapet, test de fonctionnement du clapet. mise en fonction du circuit femer', 'Révision de l’ensemble de vos appareils de robinetterie, vannes, soupapes, etc. lors de vos arrêts d’unités réglementaires.', 'robinet', 1),
(3, 'Remplacement moteur de pompe primaire', 'Un groupe motopompe primaire est installé sur la branche froide de chaque boucle, entre la sortie du générateur de vapeur et l’entrée de la cuve.\r\nSon rôle principal est d’assurer la circulation de l’eau avec le débit requis pour refroidir le cœur du réacteur (débit nominal 21 500 m3/h).', 'Il y a trois pompes primaires sur les tranches 900. Il s’agit de pompes de circulation munies de roues hélico-centrifuges à un étage, à axe vertical et dotées d’un dispositif d’étanchéité dynamique (le « joint d’arbre ») à fuite contrôlée, constitué de trois joints montés en cascade. La vitesse de rotation est de 1 485 tr/min.  La hauteur totale de chaque machine dépasse 8 m et la masse totale avoisine les 100 Tonnes.', 'pompe', 2),
(8, 'protection', 'protection', 'dzdzdzddzd', NULL, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `postesentreprises`
--

INSERT INTO `postesentreprises` (`IdPosteEntreprise`, `LibellePosteEntreprise`) VALUES
(1, 'Tuyauteur'),
(2, 'Soudeur'),
(3, 'Manutentonnaire'),
(4, 'test'),
(5, 'test');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `protections`
--

INSERT INTO `protections` (`IdProtection`, `LibelleProtection`, `DescriptionProtection`, `PhotoProtection`, `DosimetrieProtection`, `InformationProtection`) VALUES
(1, 'Matelas de plomb', 'Simples, souples, facilement transportables, pèsent moins de 25Kgs et permettent une atténuation de 35% des rayons Gamma pour une garantie radiologique optimale. Complété de divers accessoires de fixation, d\'accrochage, de transport et de manutention, meilleur rapport qualité-prix pour la protection totale de vos intervenants et de vos installations.', 'matelasPlomb', '0.30', 'Dim. Ext. : 960 x 560 mm\r\n\r\nDim. Gal. : 800 x 400 x 6 mm EqPb\r\n\r\nPoids : 22 kg\r\n\r\n12 œillets - Laine de plomb\r\n\r\nClassement au feu M2\r\n\r\nMarquage : Zone Contrôlée'),
(2, 'Enrubannage', 'Ce type de protection est destiné au secteur du bâtiment, du\r\nnucléaire (y compris les centrales nouvelles générations type EPR)\r\net de l’Oil & Gas.', 'enrubanage', '0.50', '- Protection à utiliser sur des conduits de ventilation et/ou de désenfumage en acier verticaux et horizontaux.\r\n- Ce bouclier est un complexe endothermique de quatre matériaux\r\nd’épaisseur totale de 76 mm et de masse surfacique 19,5 kg/m².\r\n- La finition est assurée par toile siliconée.\r\n- Des prises endoscopiques ou bossages peuvent être installés.\r\n- La traversée de voile (ou dalle) est permise par épanouissement\r\nde la protection.'),
(3, 'Cloison technique', 'Les cloisons techniques peuvent offrir une protection feu, radiologique ou antiexplosion.', 'cloison', '0.30', 'Des cloisons techniques sur mesure de 1 m2 à 600 m2 de surface'),
(21, 'Trappe technique', 'Les trappes offrent les protections techniques nécessaires que ce soit résistance au séisme, coupe feu, résistante à l\'explosion ou protection radiologique', 'trappe', '0.50', 'Les trappes peuvent être faites sur mesure, de moins de 1m2 à 80m2 de surface'),
(26, 'Matelas T-Flex', 'Les matelas en T-FLEX® sont une ALTERNATIVE aux matelas de plomb. Ils ont une atténuation similaire mais sans les dangers du plomb.', 'tflex', '0.20', 'Les matelas en T-FLEX® sont très résistants aux déchirures. Sa plus grande flexibilité par rapport à un matelas en plomb lui permet d’être « enroulé » au plus près de la source.');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
(20, 'LibelleProtection', 'Nom de la protection : ', 'Name of the protection : '),
(21, 'DescriptionProtection', 'Description : ', 'Description :'),
(22, 'DosimetrieProtection', 'Niveau de baisse dosimétrique : ', 'Dosimetric drop level:'),
(23, 'InformationProtection', 'Informations : ', 'Information :'),
(24, 'DosimetrieAvantActivite', 'Dosimétrie Native', 'native dosimetry'),
(25, 'DosimetrieApresActivite', 'Dosimétrie Final', 'final dosimetry'),
(26, 'DateReleveDosimetrique', 'Date Relevé', 'statement date'),
(27, 'IdRole', 'Role', 'Role'),
(28, 'IdPosteEntreprise', 'Poste', 'business position'),
(29, 'IdEntreprise', 'Entreprise', 'Entreprise'),
(30, 'DateIntervention', 'Date intervention', 'Intervention date \r\n'),
(31, 'TempsIntervention', 'Temps (jours) ', 'times (days) '),
(32, 'DosimetrieUtilisateur', 'Taux Dosimétrique', '\r\ndose rate'),
(33, 'IdOperation', 'Operation', 'Operation'),
(34, 'IdActivite', 'Activite', 'Activite'),
(35, 'IdUtilisateur', 'Utilisateur', 'Utilisateur');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tranches`
--

INSERT INTO `tranches` (`IdTranche`, `LibelleTranche`, `DescriptionTranche`, `PhotoTranche`, `IdChantier`) VALUES
(1, 'Numero 1', 'tranche au sud de la centrale', 'tranche1', 1),
(4, 'TEST', 'feifjeifjiejf', NULL, 2),
(5, NULL, 'test test test test', NULL, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IdUtilisateur`, `Nom`, `Prenom`, `AdresseMail`, `MotDePasse`, `TelUtilisateur`, `DosimetrieAvantActivite`, `DosimetrieApresActivite`, `DateReleveDosimetrique`, `IdRole`, `IdPosteEntreprise`, `IdEntreprise`) VALUES
(1, 'Poson', 'Alan', 'alan@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '0629568959', '0.20', '0.50', '2022-03-20', 2, 1, 1),
(2, 'Degaulle', 'Charles', 'Charles@gmail.com', '1039c5bba2f583c93c62dc41a3cb365f', '0623252623', '0.20', '0.40', '2022-03-09', 1, 1, 1),
(3, 'Bonaparte', 'Napoleon', 'Napoleon@gmail.com', 'Test@999', '06.23.63.63.32', '0.20', '0.50', '2022-12-05', 1, 1, 1),
(4, 'Cesar', 'Jules', 'Cesar@gmail.com', 'Test@999', '06.23.63.63.32', '0.20', '0.50', '2022-03-24', 1, 1, 1);

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


create view TranchesVues as SELECT tranches.IdTranche,AVG(batiments.DosimetrieBatiment) as dosimetrieTranche FROM `tranches` INNER JOIN batiments on tranches.IdTranche = batiments.IdTranche group by tranches.IdTranche
