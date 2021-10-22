-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: agencevoyage
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `agencevoyage`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `agencevoyage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `agencevoyage`;

--
-- Table structure for table `avoir_note`
--

DROP TABLE IF EXISTS `avoir_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avoir_note` (
  `idAvoirNote` int(11) NOT NULL AUTO_INCREMENT,
  `idEtudiant` int(11) DEFAULT NULL,
  `idEpreuve` int(11) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAvoirNote`),
  KEY `FK_AvoirNote_Epreuves` (`idEpreuve`),
  KEY `FK_AvoirNote_Etudiants` (`idEtudiant`),
  CONSTRAINT `FK_AvoirNote_Epreuves` FOREIGN KEY (`idEpreuve`) REFERENCES `epreuves` (`idEpreuve`),
  CONSTRAINT `FK_AvoirNote_Etudiants` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`idEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avoir_note`
--

LOCK TABLES `avoir_note` WRITE;
/*!40000 ALTER TABLE `avoir_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `avoir_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue`
--

DROP TABLE IF EXISTS `catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue` (
  `idCatalogue` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestation` int(11) NOT NULL,
  PRIMARY KEY (`idCatalogue`),
  KEY `FK_Catalogue_Prestation` (`idPrestation`),
  CONSTRAINT `FK_Catalogue_Prestation` FOREIGN KEY (`idPrestation`) REFERENCES `prestation` (`idPrestation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue`
--

LOCK TABLES `catalogue` WRITE;
/*!40000 ALTER TABLE `catalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomClient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enseignants` (
  `idEnseignant` int(11) NOT NULL AUTO_INCREMENT,
  `nomEnseignant` varchar(20) NOT NULL,
  `prenomEnseignant` varchar(20) DEFAULT NULL,
  `fonctionEnseignant` varchar(25) DEFAULT NULL,
  `adresseEnseignant` varchar(40) DEFAULT NULL,
  `villeEnseignant` varchar(10) DEFAULT NULL,
  `codePostalEnseignant` int(11) DEFAULT NULL,
  `telephoneEnseignant` varchar(14) DEFAULT NULL,
  `dateNaissanceEnseignant` date DEFAULT NULL,
  `dateEmbaucheEnseignant` date DEFAULT NULL,
  PRIMARY KEY (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignants`
--

LOCK TABLES `enseignants` WRITE;
/*!40000 ALTER TABLE `enseignants` DISABLE KEYS */;
/*!40000 ALTER TABLE `enseignants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epreuves`
--

DROP TABLE IF EXISTS `epreuves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epreuves` (
  `idEpreuve` int(11) NOT NULL AUTO_INCREMENT,
  `libelleEpreuve` varchar(20) DEFAULT NULL,
  `idEnseignantEpreuve` int(11) NOT NULL,
  `idMatiereEpreuve` int(11) NOT NULL,
  `dateEpreuve` date DEFAULT NULL,
  `CoefficientEpreuve` int(11) NOT NULL,
  `anneeEpreuve` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEpreuve`),
  KEY `FK_epreuves_enseignants` (`idEnseignantEpreuve`),
  KEY `FK_epreuves_matieres` (`idMatiereEpreuve`),
  CONSTRAINT `FK_epreuves_enseignants` FOREIGN KEY (`idEnseignantEpreuve`) REFERENCES `enseignants` (`idEnseignant`),
  CONSTRAINT `FK_epreuves_matieres` FOREIGN KEY (`idMatiereEpreuve`) REFERENCES `matieres` (`idMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epreuves`
--

LOCK TABLES `epreuves` WRITE;
/*!40000 ALTER TABLE `epreuves` DISABLE KEYS */;
/*!40000 ALTER TABLE `epreuves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etudiants` (
  `idEtudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nomEtudiant` varchar(20) NOT NULL,
  `prenomEtudiant` varchar(20) DEFAULT NULL,
  `adresseEtudiant` varchar(40) DEFAULT NULL,
  `villeEtudiant` varchar(10) DEFAULT NULL,
  `codePostalEtudiant` int(11) DEFAULT NULL,
  `telephoneEtudiant` varchar(14) DEFAULT NULL,
  `dateEntreeEtudiant` date DEFAULT NULL,
  `anneeEtudiant` int(11) DEFAULT NULL,
  `remarqueEtudiant` varchar(40) DEFAULT NULL,
  `sexeEtudiant` char(1) DEFAULT NULL,
  `dateNaissanceEtudiant` date DEFAULT NULL,
  PRIMARY KEY (`idEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facture` (
  `idFacture` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestation` int(11) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `prixPaye` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idFacture`),
  KEY `FK_Facture_Prestation` (`idPrestation`),
  KEY `FK_Facture_Client` (`idClient`),
  CONSTRAINT `FK_Facture_Client` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  CONSTRAINT `FK_Facture_Prestation` FOREIGN KEY (`idPrestation`) REFERENCES `prestation` (`idPrestation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faire_cours`
--

DROP TABLE IF EXISTS `faire_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faire_cours` (
  `idFaireCours` int(11) NOT NULL AUTO_INCREMENT,
  `idEnseignant` int(11) DEFAULT NULL,
  `idMatiere` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFaireCours`),
  KEY `FK_FaireCours_Enseignants` (`idEnseignant`),
  KEY `FK_FaireCours_Matieres` (`idMatiere`),
  CONSTRAINT `FK_FaireCours_Enseignants` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignants` (`idEnseignant`),
  CONSTRAINT `FK_FaireCours_Matieres` FOREIGN KEY (`idMatiere`) REFERENCES `matieres` (`idMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faire_cours`
--

LOCK TABLES `faire_cours` WRITE;
/*!40000 ALTER TABLE `faire_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `faire_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logement`
--

DROP TABLE IF EXISTS `logement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logement` (
  `idLogement` int(11) NOT NULL AUTO_INCREMENT,
  `typeDeLogement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLogement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logement`
--

LOCK TABLES `logement` WRITE;
/*!40000 ALTER TABLE `logement` DISABLE KEYS */;
/*!40000 ALTER TABLE `logement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matieres` (
  `idMatiere` int(11) NOT NULL AUTO_INCREMENT,
  `nomMatiere` varchar(15) NOT NULL,
  `idModule` int(11) DEFAULT NULL,
  `coefficientMatiere` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMatiere`),
  KEY `FK_matieres_modules` (`idModule`),
  CONSTRAINT `FK_matieres_modules` FOREIGN KEY (`idModule`) REFERENCES `modules` (`idModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matieres`
--

LOCK TABLES `matieres` WRITE;
/*!40000 ALTER TABLE `matieres` DISABLE KEYS */;
/*!40000 ALTER TABLE `matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `idModule` int(11) NOT NULL AUTO_INCREMENT,
  `nomModule` varchar(15) NOT NULL,
  `coefficientModule` int(11) DEFAULT NULL,
  PRIMARY KEY (`idModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestation` (
  `idPrestation` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `lieu` varchar(50) DEFAULT NULL,
  `niveauPrestation` int(11) DEFAULT NULL,
  `prixPublic` decimal(15,2) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `idLogement` int(11) NOT NULL,
  PRIMARY KEY (`idPrestation`),
  KEY `FK_Presentation_Logement` (`idLogement`),
  CONSTRAINT `FK_Presentation_Logement` FOREIGN KEY (`idLogement`) REFERENCES `logement` (`idLogement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestation`
--

LOCK TABLES `prestation` WRITE;
/*!40000 ALTER TABLE `prestation` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-21 17:20:55
