-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: usine
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
-- Current Database: `usine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `usine` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `usine`;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  `descriptionCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'bicycle','2 roues '),(2,'tricycle','3 roues');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faute`
--

DROP TABLE IF EXISTS `faute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faute` (
  `idFaute` int(11) NOT NULL AUTO_INCREMENT,
  `codeUniqueFaute` int(11) DEFAULT NULL,
  `titreFaute` varchar(50) DEFAULT NULL,
  `dateDetection` date DEFAULT NULL,
  `commentaire` varchar(50) DEFAULT NULL,
  `dateReparation` date DEFAULT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idFaute`),
  KEY `FK_faute_categorie` (`idCategorie`),
  CONSTRAINT `FK_faute_categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faute`
--

LOCK TABLES `faute` WRITE;
/*!40000 ALTER TABLE `faute` DISABLE KEYS */;
INSERT INTO `faute` VALUES (1,1,'griffe','2021-10-12','coup peu profond','2021-10-13',1),(2,2,'coup','2021-10-12','coup profond','2021-10-14',2);
/*!40000 ALTER TABLE `faute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenence`
--

DROP TABLE IF EXISTS `maintenence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenence` (
  `idMaintenence` int(11) NOT NULL AUTO_INCREMENT,
  `idFaute` int(11) DEFAULT NULL,
  `idProduit` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaintenence`),
  KEY `FK_maintenence_faute` (`idFaute`),
  KEY `FK_maintenence_produit` (`idProduit`),
  CONSTRAINT `FK_maintenence_faute` FOREIGN KEY (`idFaute`) REFERENCES `faute` (`idFaute`),
  CONSTRAINT `FK_maintenence_produit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenence`
--

LOCK TABLES `maintenence` WRITE;
/*!40000 ALTER TABLE `maintenence` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele` (
  `idModele` int(11) NOT NULL AUTO_INCREMENT,
  `codeModele` int(11) DEFAULT NULL,
  `nomModele` varchar(50) DEFAULT NULL,
  `dateMiseSurMarche` date DEFAULT NULL,
  PRIMARY KEY (`idModele`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele`
--

LOCK TABLES `modele` WRITE;
/*!40000 ALTER TABLE `modele` DISABLE KEYS */;
INSERT INTO `modele` VALUES (1,1,'vtt','2021-10-28'),(2,2,'vtc','2021-10-21');
/*!40000 ALTER TABLE `modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `numeroDeSerie` int(11) DEFAULT NULL,
  `numeroDeProduit` int(11) DEFAULT NULL,
  `anneeProduction` date DEFAULT NULL,
  `idModele` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `FK_produit_modele` (`idModele`),
  CONSTRAINT `FK_produit_modele` FOREIGN KEY (`idModele`) REFERENCES `modele` (`idModele`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,1234,1010,'2021-10-20',1),(2,4321,2020,'2021-10-19',2);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 10:50:08
