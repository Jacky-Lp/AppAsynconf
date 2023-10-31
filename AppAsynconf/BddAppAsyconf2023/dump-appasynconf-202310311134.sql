-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: appasynconf
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `annee`
--

DROP TABLE IF EXISTS `annee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `NoteEco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annee`
--

LOCK TABLES `annee` WRITE;
/*!40000 ALTER TABLE `annee` DISABLE KEYS */;
INSERT INTO `annee` VALUES (1,'1960-1970',1),(2,'1970-1980',2),(3,'1980-1990',3),(4,'1990-2000',4),(5,'2000-2010',5),(6,'2010',7);
/*!40000 ALTER TABLE `annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `energie`
--

DROP TABLE IF EXISTS `energie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `NoteEco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energie`
--

LOCK TABLES `energie` WRITE;
/*!40000 ALTER TABLE `energie` DISABLE KEYS */;
INSERT INTO `energie` VALUES (1,'Essence',5),(2,'Electrique',9),(3,'Gaz',6),(4,'Diesel',4),(5,'Hybride',7);
/*!40000 ALTER TABLE `energie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kilometrage`
--

DROP TABLE IF EXISTS `kilometrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kilometrage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NoteEco` int(11) DEFAULT NULL,
  `Distance` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kilometrage`
--

LOCK TABLES `kilometrage` WRITE;
/*!40000 ALTER TABLE `kilometrage` DISABLE KEYS */;
INSERT INTO `kilometrage` VALUES (1,9,'5000-10000'),(2,7,'10000-15000'),(3,5,'15000-20000'),(4,3,'20000-25000'),(5,1,'25000-30000');
/*!40000 ALTER TABLE `kilometrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagers`
--

DROP TABLE IF EXISTS `passagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passagers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` int(11) DEFAULT NULL,
  `Pourcentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagers`
--

LOCK TABLES `passagers` WRITE;
/*!40000 ALTER TABLE `passagers` DISABLE KEYS */;
INSERT INTO `passagers` VALUES (1,1,0.11),(2,2,-0.17),(3,3,-0.29),(4,4,-0.53);
/*!40000 ALTER TABLE `passagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tauxemprunt`
--

DROP TABLE IF EXISTS `tauxemprunt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tauxemprunt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TauxEmprunt` decimal(5,2) DEFAULT NULL,
  `scorevehicule` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tauxemprunt`
--

LOCK TABLES `tauxemprunt` WRITE;
/*!40000 ALTER TABLE `tauxemprunt` DISABLE KEYS */;
INSERT INTO `tauxemprunt` VALUES (1,3.00,'0-10'),(2,2.74,'11-15'),(3,2.52,'16-25'),(4,2.10,'26-33'),(6,1.85,'34-40');
/*!40000 ALTER TABLE `tauxemprunt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `NoteEco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES (1,'Citadine',8),(2,'Cabriolet',6),(3,'Berline',6),(4,'SUV / 4x4',4);
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'appasynconf'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 11:34:22
