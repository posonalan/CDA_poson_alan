-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: laposte
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
-- Current Database: `laposte`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `laposte` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `laposte`;

--
-- Table structure for table `achemine`
--

DROP TABLE IF EXISTS `achemine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achemine` (
  `idAchemine` int(11) NOT NULL AUTO_INCREMENT,
  `idBureauPostal` int(11) DEFAULT NULL,
  `idCentreDeTri` int(11) DEFAULT NULL,
  `idTransporteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAchemine`),
  KEY `FK_achemine_bureauPostal` (`idBureauPostal`),
  KEY `FK_achemine_centreDeTri` (`idCentreDeTri`),
  KEY `FK_achemine_transporteur` (`idTransporteur`),
  CONSTRAINT `FK_achemine_bureauPostal` FOREIGN KEY (`idBureauPostal`) REFERENCES `bureaupostal` (`idBureauPostal`),
  CONSTRAINT `FK_achemine_centreDeTri` FOREIGN KEY (`idCentreDeTri`) REFERENCES `centredetri` (`idCentreDeTri`),
  CONSTRAINT `FK_achemine_transporteur` FOREIGN KEY (`idTransporteur`) REFERENCES `transporteur` (`idTransporteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achemine`
--

LOCK TABLES `achemine` WRITE;
/*!40000 ALTER TABLE `achemine` DISABLE KEYS */;
/*!40000 ALTER TABLE `achemine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bureaupostal`
--

DROP TABLE IF EXISTS `bureaupostal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bureaupostal` (
  `idBureauPostal` int(11) NOT NULL AUTO_INCREMENT,
  `codePostalBureauPostal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBureauPostal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bureaupostal`
--

LOCK TABLES `bureaupostal` WRITE;
/*!40000 ALTER TABLE `bureaupostal` DISABLE KEYS */;
/*!40000 ALTER TABLE `bureaupostal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centredetri`
--

DROP TABLE IF EXISTS `centredetri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centredetri` (
  `idCentreDeTri` int(11) NOT NULL AUTO_INCREMENT,
  `nomCentreDeTri` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCentreDeTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centredetri`
--

LOCK TABLES `centredetri` WRITE;
/*!40000 ALTER TABLE `centredetri` DISABLE KEYS */;
/*!40000 ALTER TABLE `centredetri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courrier`
--

DROP TABLE IF EXISTS `courrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courrier` (
  `idcourrier` int(11) NOT NULL AUTO_INCREMENT,
  `rueDestinataire` varchar(50) DEFAULT NULL,
  `numeroDestinataire` int(11) DEFAULT NULL,
  `rueEmetteur` varchar(50) DEFAULT NULL,
  `numeroEmetteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcourrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier`
--

LOCK TABLES `courrier` WRITE;
/*!40000 ALTER TABLE `courrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `courrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `definit`
--

DROP TABLE IF EXISTS `definit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `definit` (
  `idDefinite` int(11) NOT NULL AUTO_INCREMENT,
  `idType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDefinite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `definit`
--

LOCK TABLES `definit` WRITE;
/*!40000 ALTER TABLE `definit` DISABLE KEYS */;
/*!40000 ALTER TABLE `definit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gere`
--

DROP TABLE IF EXISTS `gere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gere` (
  `idGere` int(11) NOT NULL AUTO_INCREMENT,
  `idBureauPostal` varchar(50) DEFAULT NULL,
  `dateEnvoi` date DEFAULT NULL,
  `dateReception` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gere`
--

LOCK TABLES `gere` WRITE;
/*!40000 ALTER TABLE `gere` DISABLE KEYS */;
/*!40000 ALTER TABLE `gere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporteur`
--

DROP TABLE IF EXISTS `transporteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporteur` (
  `idTransporteur` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTransporteur` varchar(50) DEFAULT NULL,
  `taxeCarbone` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransporteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporteur`
--

LOCK TABLES `transporteur` WRITE;
/*!40000 ALTER TABLE `transporteur` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `libelleType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
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
