-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cuisine
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
-- Current Database: `cuisine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cuisine` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cuisine`;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
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
  `premonClient` varchar(50) DEFAULT NULL,
  `dateDeNaissance` date DEFAULT NULL,
  `emailClient` varchar(50) DEFAULT NULL,
  `telephoneClient` int(11) DEFAULT NULL,
  `IdTicket` int(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `FK_Client_Ticket` (`IdTicket`),
  CONSTRAINT `FK_Client_Ticket` FOREIGN KEY (`IdTicket`) REFERENCES `ticket` (`idTicket`)
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
-- Table structure for table `met`
--

DROP TABLE IF EXISTS `met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `met` (
  `idMet` int(11) NOT NULL AUTO_INCREMENT,
  `nomMet` varchar(50) DEFAULT NULL,
  `prixMet` decimal(15,2) DEFAULT NULL,
  `IdCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idMet`),
  KEY `FK_Met_Categorie` (`IdCategorie`),
  CONSTRAINT `FK_Met_Categorie` FOREIGN KEY (`IdCategorie`) REFERENCES `categorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `met`
--

LOCK TABLES `met` WRITE;
/*!40000 ALTER TABLE `met` DISABLE KEYS */;
/*!40000 ALTER TABLE `met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table1`
--

DROP TABLE IF EXISTS `table1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table1` (
  `idTable1` int(11) NOT NULL AUTO_INCREMENT,
  `numeroTable` int(11) DEFAULT NULL,
  `nombreCouvert` int(11) DEFAULT NULL,
  `idTypeTable` int(11) NOT NULL,
  PRIMARY KEY (`idTable1`),
  KEY `FK_Table1_TypeTable` (`idTypeTable`),
  CONSTRAINT `FK_Table1_TypeTable` FOREIGN KEY (`idTypeTable`) REFERENCES `typetable` (`idTypeTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table1`
--

LOCK TABLES `table1` WRITE;
/*!40000 ALTER TABLE `table1` DISABLE KEYS */;
/*!40000 ALTER TABLE `table1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `idTicket` int(11) NOT NULL AUTO_INCREMENT,
  `dateTicket` date DEFAULT NULL,
  `nombreCouvert` int(11) DEFAULT NULL,
  `addition` int(11) DEFAULT NULL,
  `IdTable1` int(11) NOT NULL,
  `IdMet` int(11) NOT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `FK_Ticket_Table1` (`IdTable1`),
  KEY `FK_Ticket_Met` (`IdMet`),
  CONSTRAINT `FK_Ticket_Met` FOREIGN KEY (`IdMet`) REFERENCES `met` (`idMet`),
  CONSTRAINT `FK_Ticket_Table1` FOREIGN KEY (`IdTable1`) REFERENCES `table1` (`idTable1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typetable`
--

DROP TABLE IF EXISTS `typetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typetable` (
  `idTypeTable` int(11) NOT NULL AUTO_INCREMENT,
  `typeDeTable` varchar(50) DEFAULT NULL,
  `supplement` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idTypeTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typetable`
--

LOCK TABLES `typetable` WRITE;
/*!40000 ALTER TABLE `typetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `typetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 12:20:11
