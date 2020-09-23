CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contentsize`
--

DROP TABLE IF EXISTS `contentsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentsize` (
  `contentSizeNum` int NOT NULL AUTO_INCREMENT,
  `contentSize` varchar(10) NOT NULL,
  `contentLength` varchar(10) NOT NULL,
  `contentShoulder` varchar(10) NOT NULL,
  `contentChest` varchar(10) NOT NULL,
  `contentSleeve` varchar(10) NOT NULL,
  `enrollmentNum` int NOT NULL,
  PRIMARY KEY (`contentSizeNum`),
  KEY `enrollmentNum_idx` (`enrollmentNum`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentsize`
--

LOCK TABLES `contentsize` WRITE;
/*!40000 ALTER TABLE `contentsize` DISABLE KEYS */;
INSERT INTO `contentsize` VALUES (6,'XS','20','20','20','20',8),(7,'S','25','25','25','25',8),(8,'M','30','30','30','30',8),(9,'L','40','40','40','40',8),(10,'M','20','20','20','20',1),(11,'L','30','30','30','30',1),(12,'XL','40','40','40','40',1),(17,'M','65','41','45','19',9),(18,'L','70','46','49','21',9),(19,'XL','76','51.5','54.5','22.5',9),(20,'2XL','78','57','61','24',9),(21,'M','73','48','55','19',10),(22,'L','74','50','57','20',10),(23,'XL','75','52','59','21',10),(24,'free','71','52.5','51','22',11),(25,'free','71','52.5','51','22',11),(34,'M','68.5','51','55','33',12),(35,'L','69.5','52','57','34',12),(36,'XL','70.5','53','59','35',12),(37,'free','115','81','59','71',13);
/*!40000 ALTER TABLE `contentsize` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:11
