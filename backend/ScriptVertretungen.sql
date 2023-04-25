-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: vertretungen
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `fachzulehrer`
--

DROP TABLE IF EXISTS `fachzulehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fachzulehrer` (
  `LehrerID` int unsigned NOT NULL,
  `Fach` varchar(15) DEFAULT NULL,
  CONSTRAINT `fachzulehrer_ibfk_1` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`)
) ;
create index fachzulehrer_idx1 on `fachzulehrer` (`LehrerID`);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fachzulehrer`
--

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasse` (
  `SchuelerZahl` int unsigned NOT NULL,
  `KlassenLeiter` int unsigned NOT NULL,
  `SecondKlassenLeiter` int unsigned NOT NULL,
  `Zimmer` int unsigned NOT NULL,
  PRIMARY KEY (`Zimmer`),
  CONSTRAINT `klasse_ibfk_1` FOREIGN KEY (`KlassenLeiter`) REFERENCES `lehrer` (`LehrerID`),
  CONSTRAINT `klasse_ibfk_2` FOREIGN KEY (`SecondKlassenLeiter`) REFERENCES `lehrer` (`LehrerID`)
) ;
create index klasse_idx1 on `klasse` (`KlassenLeiter`);
create index klasse_idx2 on `klasse` (`SecondKlassenLeiter`);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

--
-- Table structure for table `lehrer`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lehrer` (
  `LehrerID` int unsigned PRIMARY KEY,
  `LehrerName` varchar(50) NOT NULL,
  `VertretungsStunde` int unsigned NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer`
--

--
-- Table structure for table `stunde`
--

DROP TABLE IF EXISTS `stunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stunde` (
  `Klasse` int unsigned NOT NULL,
  `LehrerID` int unsigned NOT NULL,
  `Teil` char(1) NOT NULL,
  `Raum` int unsigned NOT NULL,
  `Fach` varchar(15) NOT NULL,
  PRIMARY KEY (`Raum`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stunde`
--

--
-- Table structure for table `stundenplan`
--

DROP TABLE IF EXISTS `stundenplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stundenplan` (
  `Wochentag` varchar(2) DEFAULT NULL,
  `Stunde` int unsigned NOT NULL,
  `StundeRot` int unsigned NOT NULL,
  PRIMARY KEY (`StundeRot`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stundenplan`
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 19:37:58
