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
-- Table structure for table `shoppingbasket`
--

DROP TABLE IF EXISTS `shoppingbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingbasket` (
  `shoppingNum` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `enrollNum` int NOT NULL,
  `isPurchase` varchar(1) NOT NULL DEFAULT 'N',
  `purchase` int NOT NULL,
  `basketDate` date DEFAULT NULL,
  `optionCode` varchar(255) NOT NULL,
  PRIMARY KEY (`shoppingNum`),
  KEY `userId_idx` (`userId`),
  KEY `enrollNum_idx` (`enrollNum`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingbasket`
--

LOCK TABLES `shoppingbasket` WRITE;
/*!40000 ALTER TABLE `shoppingbasket` DISABLE KEYS */;
INSERT INTO `shoppingbasket` VALUES (3,'root',1,'Y',4,'2020-08-31','15754MLW'),(4,'root',1,'Y',2,'2020-08-31','15754MMW'),(5,'aaa',1,'Y',1,'2020-09-02','15754MMB'),(6,'aaa',1,'Y',1,'2020-09-03','15754MMB'),(7,'aaa',1,'Y',2,'2020-09-03','15754MMW'),(8,'aaa',1,'Y',1,'2020-09-03','15754MLB'),(9,'ㅁㅁㅁ',8,'Y',3,'2020-09-04','DVWQEQ010'),(10,'ㅁㅁㅁ',1,'Y',4,'2020-09-04','15754MXLB'),(11,'ㅁㅁㅁ',1,'Y',4,'2020-09-04','15754MXLW'),(12,'ㅁㅁㅁ',1,'Y',2,'2020-09-04','15754MMW'),(13,'ㅁㅁㅁ',8,'Y',2,'2020-09-04','DVWQEQ010'),(14,'aaa',8,'Y',3,'2020-09-04','DVWQEQ010'),(15,'aaa',1,'Y',3,'2020-09-04','15754MMB'),(16,'aaa',1,'Y',3,'2020-09-04','15754MXLB'),(17,'aaa',1,'Y',2,'2020-09-04','15754MMW'),(18,'aaa',1,'Y',4,'2020-09-04','15754MLW'),(19,'aaa',1,'Y',3,'2020-09-04','15754MMB'),(20,'aaa',1,'Y',2,'2020-09-04','15754MLB'),(21,'aaa',1,'Y',3,'2020-09-04','15754MXLW'),(22,'aaa',1,'Y',4,'2020-09-04','15754MLB'),(23,'aaa',1,'Y',4,'2020-09-04','15754MXLW'),(24,'ㅁㅁㅁ',1,'Y',4,'2020-09-04','15754MMB'),(25,'ㅁㅁㅁ',1,'Y',5,'2020-09-04','15754MXLW'),(26,'ㅁㅁㅁ',1,'Y',5,'2020-09-04','15754MXLB'),(27,'ㅁㅁㅁ',1,'Y',1,'2020-09-04','15754MXLW'),(28,'aaa',1,'Y',6,'2020-09-04','15754MLW'),(29,'aaa',1,'Y',4,'2020-09-04','15754MLB'),(30,'ㅁㅁㅁ',1,'Y',6,'2020-09-04','15754MMW'),(31,'ㅁㅁㅁ',1,'Y',8,'2020-09-04','15754MMB'),(32,'root',1,'Y',1,'2020-09-04','15754MLB'),(33,'root',1,'Y',1,'2020-09-04','15754MXLB'),(44,'aaa',1,'Y',1,'2020-09-17','15754MMB'),(45,'aaa',1,'Y',1,'2020-09-17','15754MXLB'),(46,'aaa',8,'Y',1,'2020-09-17','DVWQEQ012'),(47,'aaa',1,'Y',1,'2020-09-17','15754MXLB'),(48,'aaa',1,'Y',1,'2020-09-17','15754MXLB'),(49,'aaa',1,'Y',2,'2020-09-17','15754MMB'),(50,'aaa',1,'Y',3,'2020-09-17','15754MLW'),(51,'aaa',1,'Y',2,'2020-09-17','15754MLB'),(52,'aaa',1,'Y',3,'2020-09-17','15754MXLW'),(53,'aaa',8,'Y',3,'2020-09-17','DVWQEQ010'),(54,'aaa',8,'Y',2,'2020-09-17','DVWQEQ011'),(55,'aaa',1,'Y',2,'2020-09-17','15754MMB'),(56,'aaa',1,'Y',2,'2020-09-17','15754MLB'),(57,'aaa',1,'Y',1,'2020-09-22','15754MLB'),(58,'aaa',1,'Y',1,'2020-09-22','15754MLW'),(59,'aaa',1,'N',1,'2020-09-23','15754MXLB');
/*!40000 ALTER TABLE `shoppingbasket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:13
