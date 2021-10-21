-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: noel
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
-- Current Database: `noel`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `noel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `noel`;

--
-- Table structure for table `cadeau`
--

DROP TABLE IF EXISTS `cadeau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadeau` (
  `idCadeau` int(11) NOT NULL AUTO_INCREMENT,
  `matriculeCadeau` int(11) DEFAULT NULL,
  `designationCadeau` varchar(50) DEFAULT NULL,
  `idLutin` int(11) NOT NULL,
  `idEnfant` int(11) NOT NULL,
  PRIMARY KEY (`idCadeau`),
  KEY `FK_Cadeau_Lutin` (`idLutin`),
  KEY `FK_Cadeau_Enfant` (`idEnfant`),
  CONSTRAINT `FK_Cadeau_Enfant` FOREIGN KEY (`idEnfant`) REFERENCES `enfant` (`idEnfant`),
  CONSTRAINT `FK_Cadeau_Lutin` FOREIGN KEY (`idLutin`) REFERENCES `lutin` (`idLutin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadeau`
--

LOCK TABLES `cadeau` WRITE;
/*!40000 ALTER TABLE `cadeau` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadeau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `idDistribution` int(11) NOT NULL AUTO_INCREMENT,
  `idTourne` int(11) DEFAULT NULL,
  `idRenne` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDistribution`),
  KEY `FK_Distribution_Tourne` (`idTourne`),
  KEY `FK_Distribution_Renne` (`idRenne`),
  CONSTRAINT `FK_Distribution_Renne` FOREIGN KEY (`idRenne`) REFERENCES `renne` (`idRenne`),
  CONSTRAINT `FK_Distribution_Tourne` FOREIGN KEY (`idTourne`) REFERENCES `tourne` (`idTourne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution`
--

LOCK TABLES `distribution` WRITE;
/*!40000 ALTER TABLE `distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfant`
--

DROP TABLE IF EXISTS `enfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfant` (
  `idEnfant` int(11) NOT NULL AUTO_INCREMENT,
  `matriculeEnfant` int(11) DEFAULT NULL,
  `nomEnfant` varchar(50) DEFAULT NULL,
  `prenomEnfant` varchar(50) DEFAULT NULL,
  `adresseEnfant` varchar(50) DEFAULT NULL,
  `sexeEnfant` varchar(50) DEFAULT NULL,
  `sagesse` decimal(25,0) DEFAULT NULL,
  PRIMARY KEY (`idEnfant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfant`
--

LOCK TABLES `enfant` WRITE;
/*!40000 ALTER TABLE `enfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiontraineau`
--

DROP TABLE IF EXISTS `gestiontraineau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestiontraineau` (
  `idGestionTraineau` int(11) NOT NULL AUTO_INCREMENT,
  `idLutin` int(11) DEFAULT NULL,
  `idTraineau` int(11) DEFAULT NULL,
  `historiqueResponssabilite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGestionTraineau`),
  KEY `FK_GestionTraineau_Lutin` (`idLutin`),
  KEY `FK_GestionTraineau_Traineau` (`idTraineau`),
  CONSTRAINT `FK_GestionTraineau_Lutin` FOREIGN KEY (`idLutin`) REFERENCES `lutin` (`idLutin`),
  CONSTRAINT `FK_GestionTraineau_Traineau` FOREIGN KEY (`idTraineau`) REFERENCES `traineau` (`idTraineau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiontraineau`
--

LOCK TABLES `gestiontraineau` WRITE;
/*!40000 ALTER TABLE `gestiontraineau` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiontraineau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livraison` (
  `idLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `idCadeau` int(11) DEFAULT NULL,
  `idTourne` int(11) DEFAULT NULL,
  `dateLivraison` date DEFAULT NULL,
  PRIMARY KEY (`idLivraison`),
  KEY `FK_Livraison_Cadeau` (`idCadeau`),
  KEY `FK_Livraison_Tourne` (`idTourne`),
  CONSTRAINT `FK_Livraison_Cadeau` FOREIGN KEY (`idCadeau`) REFERENCES `cadeau` (`idCadeau`),
  CONSTRAINT `FK_Livraison_Tourne` FOREIGN KEY (`idTourne`) REFERENCES `tourne` (`idTourne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lutin`
--

DROP TABLE IF EXISTS `lutin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lutin` (
  `idLutin` int(11) NOT NULL AUTO_INCREMENT,
  `matriculeLutin` int(11) DEFAULT NULL,
  `nomLutin` varchar(50) DEFAULT NULL,
  `prenomLutin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLutin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lutin`
--

LOCK TABLES `lutin` WRITE;
/*!40000 ALTER TABLE `lutin` DISABLE KEYS */;
/*!40000 ALTER TABLE `lutin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renne`
--

DROP TABLE IF EXISTS `renne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renne` (
  `idRenne` int(11) NOT NULL AUTO_INCREMENT,
  `nomRenne` varchar(50) DEFAULT NULL,
  `sexeRenne` varchar(50) DEFAULT NULL,
  `dateDeNaissanceRenne` date DEFAULT NULL,
  `idTraineau` int(11) NOT NULL,
  PRIMARY KEY (`idRenne`),
  KEY `FK_Renne_Traineau` (`idTraineau`),
  CONSTRAINT `FK_Renne_Traineau` FOREIGN KEY (`idTraineau`) REFERENCES `traineau` (`idTraineau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renne`
--

LOCK TABLES `renne` WRITE;
/*!40000 ALTER TABLE `renne` DISABLE KEYS */;
/*!40000 ALTER TABLE `renne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souhait`
--

DROP TABLE IF EXISTS `souhait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `souhait` (
  `idSouhait` int(11) NOT NULL AUTO_INCREMENT,
  `idEnfant` int(11) DEFAULT NULL,
  `idVoeux` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSouhait`),
  KEY `FK_Souhait_Enfant` (`idEnfant`),
  KEY `FK_Souhait_Voeux` (`idVoeux`),
  CONSTRAINT `FK_Souhait_Enfant` FOREIGN KEY (`idEnfant`) REFERENCES `enfant` (`idEnfant`),
  CONSTRAINT `FK_Souhait_Voeux` FOREIGN KEY (`idVoeux`) REFERENCES `voeux` (`idVoeux`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souhait`
--

LOCK TABLES `souhait` WRITE;
/*!40000 ALTER TABLE `souhait` DISABLE KEYS */;
/*!40000 ALTER TABLE `souhait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourne`
--

DROP TABLE IF EXISTS `tourne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourne` (
  `idTourne` int(11) NOT NULL AUTO_INCREMENT,
  `matriculeTourne` int(11) DEFAULT NULL,
  `heureDepartTourne` time DEFAULT NULL,
  `idLutin` int(11) NOT NULL,
  `idTraineau` int(11) NOT NULL,
  PRIMARY KEY (`idTourne`),
  KEY `FK_Tourne_Lutin` (`idLutin`),
  KEY `FK_Tourne_Traineau` (`idTraineau`),
  CONSTRAINT `FK_Tourne_Lutin` FOREIGN KEY (`idLutin`) REFERENCES `lutin` (`idLutin`),
  CONSTRAINT `FK_Tourne_Traineau` FOREIGN KEY (`idTraineau`) REFERENCES `traineau` (`idTraineau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourne`
--

LOCK TABLES `tourne` WRITE;
/*!40000 ALTER TABLE `tourne` DISABLE KEYS */;
/*!40000 ALTER TABLE `tourne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traineau`
--

DROP TABLE IF EXISTS `traineau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traineau` (
  `idTraineau` int(11) NOT NULL AUTO_INCREMENT,
  `matriculeTraineau` int(11) DEFAULT NULL,
  `tailleTraineau` int(11) DEFAULT NULL,
  `dateMiseEnService` date DEFAULT NULL,
  `dateDerniereRevision` date DEFAULT NULL,
  PRIMARY KEY (`idTraineau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traineau`
--

LOCK TABLES `traineau` WRITE;
/*!40000 ALTER TABLE `traineau` DISABLE KEYS */;
/*!40000 ALTER TABLE `traineau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voeux`
--

DROP TABLE IF EXISTS `voeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voeux` (
  `idVoeux` int(11) NOT NULL AUTO_INCREMENT,
  `libelleVoeux` varchar(50) DEFAULT NULL,
  `descriptionVoeux` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idVoeux`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voeux`
--

LOCK TABLES `voeux` WRITE;
/*!40000 ALTER TABLE `voeux` DISABLE KEYS */;
/*!40000 ALTER TABLE `voeux` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-21 16:34:04
