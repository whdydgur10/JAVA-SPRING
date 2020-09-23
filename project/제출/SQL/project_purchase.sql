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
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `num` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `deposit` varchar(1) NOT NULL DEFAULT 'N',
  `depositDate` date DEFAULT NULL,
  `isPoint` varchar(1) NOT NULL DEFAULT 'N',
  `isCoupon` varchar(1) NOT NULL DEFAULT 'N',
  `situation` varchar(10) NOT NULL DEFAULT '상품 준비중',
  `isConfirm` varchar(1) NOT NULL DEFAULT 'N',
  `confirmDate` date DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `givePoint` int NOT NULL DEFAULT '0',
  `deliveryPrice` int NOT NULL DEFAULT '0',
  `usePoint` int NOT NULL DEFAULT '0',
  `orderDate` date DEFAULT NULL,
  `isDel` varchar(1) NOT NULL DEFAULT 'N',
  `payment` varchar(10) DEFAULT NULL,
  `addressNum` int DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `change` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userId_idx` (`userId`),
  KEY `addressNum_idx` (`addressNum`),
  CONSTRAINT `addressNum` FOREIGN KEY (`addressNum`) REFERENCES `address` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (42,'aaa','Y','2020-09-22','N','N','상품 준비중','N',NULL,13000,155,2500,0,'2020-09-17','N','account',25,NULL,NULL),(43,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,13000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(44,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,12000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(45,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,13000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(46,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,12000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(47,'aaa','Y','2020-09-17','N','N','상품 도착','Y','2020-09-21',14500,145,2500,0,'2020-09-17','N','card',24,'678678557567','교환건'),(48,'aaa','Y','2020-09-17','N','Y','상품 도착','Y','2020-09-18',10500,105,2500,0,'2020-09-17','N','naver',23,'1231231231212',NULL),(49,'aaa','Y','2020-09-17','N','N','상품 도착','Y','2020-09-21',26000,285,2500,0,'2020-09-17','N','account',22,'12312312321312',NULL),(50,'aaa','Y','2020-09-17','N','N','상품 배송중','N',NULL,13000,155,2500,0,'2020-09-17','N','card',20,'2132131231322','교환건'),(51,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,12000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(52,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,13000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(53,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,65000,0,0,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(54,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,39000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(55,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,36000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(56,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,26000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(57,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,26000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(58,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,26000,0,2500,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(59,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,52000,0,0,0,'2020-09-17','Y',NULL,NULL,NULL,NULL),(60,'aaa','Y','2020-09-18','N','N','상품 도착','Y','2020-09-18',15500,155,2500,0,'2020-09-18','N','naver',26,'123123123213',NULL),(61,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,13000,0,2500,0,'2020-09-21','N',NULL,NULL,NULL,NULL),(62,'aaa','Y','2020-09-22','Y','N','상품 준비중','N',NULL,13000,145,2500,1000,'2020-09-22','N','naver',27,NULL,NULL),(63,'aaa','Y','2020-09-22','N','N','상품 준비중','N',NULL,60000,600,0,0,'2020-09-22','N','card',28,NULL,NULL),(64,'aaa','Y','2020-09-22','N','N','상품 준비중','N',NULL,15500,155,2500,0,'2020-09-22','N','payco',29,NULL,NULL),(65,'aaa','Y','2020-09-22','N','N','상품 준비중','N',NULL,15500,155,2500,0,'2020-09-22','N','card',30,NULL,NULL),(66,'aaa','Y','2020-09-22','N','N','상품 준비중','N',NULL,15500,155,2500,0,'2020-09-22','N','payco',31,NULL,NULL),(67,'aaa','N',NULL,'N','N','상품 준비중','N',NULL,12000,0,2500,0,'2020-09-23','N',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:12
