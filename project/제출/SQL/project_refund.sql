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
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `refundNum` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `listNum` int NOT NULL,
  `bankName` varchar(45) DEFAULT NULL,
  `refundName` varchar(45) DEFAULT NULL,
  `stat` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `account` varchar(45) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `refundDate` date NOT NULL,
  `depositDate` date DEFAULT NULL,
  `completeDate` date DEFAULT NULL,
  PRIMARY KEY (`refundNum`),
  KEY `userId_idx` (`userId`),
  KEY `listNum_idx` (`listNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,'aaa',74,NULL,NULL,'환불 완료',24000,NULL,'단순 변심','2020-09-18',NULL,'2020-09-21'),(2,'aaa',75,NULL,NULL,'환불',36000,NULL,'단순 변심','2020-09-18',NULL,NULL),(3,'aaa',72,NULL,NULL,'취소',39000,NULL,'단순 변심','2020-09-18',NULL,NULL),(4,'aaa',63,NULL,NULL,'교환',12000,NULL,'변질','2020-09-18','2020-09-17',NULL),(5,'aaa',67,NULL,NULL,'교환 완료',13000,NULL,'오염','2020-09-18','2020-09-17','2020-09-21'),(6,'aaa',63,NULL,NULL,'교환 완료',12000,NULL,'변질','2020-09-18','2020-09-17','2020-09-22');
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:10
