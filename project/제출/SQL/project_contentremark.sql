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
-- Table structure for table `contentremark`
--

DROP TABLE IF EXISTS `contentremark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentremark` (
  `contentRemarkNum` int NOT NULL AUTO_INCREMENT,
  `contentElasticity` varchar(30) NOT NULL,
  `contentLining` varchar(30) NOT NULL,
  `contentSeethrough` varchar(30) NOT NULL,
  `contentThickness` varchar(30) NOT NULL,
  `contentWeight` varchar(30) NOT NULL,
  `contentDry` varchar(30) NOT NULL,
  `contentRemarkText` longtext NOT NULL,
  `enrollmentNum` int NOT NULL,
  PRIMARY KEY (`contentRemarkNum`),
  KEY `enrollmentNum_idx` (`enrollmentNum`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentremark`
--

LOCK TABLES `contentremark` WRITE;
/*!40000 ALTER TABLE `contentremark` DISABLE KEYS */;
INSERT INTO `contentremark` VALUES (3,'normal','no','little','normal','light','dryWash','- 소재 : 면100%\r\n - 제조국 : 베트남\r\n - 제조사 : (주)스타일노리터\r\n - 제조연월 : 2020년 03월 이후\r\n - 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.\r\n ',8),(4,'good','no','bright','little','light','wash','- 소재 : 면100%\r - 제조국 : 베트남\r - 제조사 : (주)스타일노리터\r - 제조연월 : 2020년 03월 이후\r - 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.\r ',1),(5,'normal','no','little','little','light','wash','- 소재 : 면100%\r - 제조국 : 대한민국\r - 제조사 : 다소울\r - 제조연월 : 2018년 03월 이후\r - 품질보증기간 : 제품 수령후 1주일 이내\r - A/S정보 : 다소울\r ',9),(6,'good','no','no','normal','light','cold','- 소재 : 면100%\r - 제조국 : 상품택에 기재\r - 제조사 : 로댄티 제휴업체\r - 제조연월 : 2020년 03월 이후\r - 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.\r ',10),(7,'normal','no','no','normal','light','cold','- 소재 : cotton\r - 제조국 : 상품택에 기재\r - 제조사 : 후쿠부쿠로\r - 제조연월 : 2019년 03월 이후\r - 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.\r ',11),(8,'normal','no','no','normal','light','cold','- 소재 : 면100%\r - 제조국 : 한국\r - 제조사 : (주)디에이치어페럴\r - 제조연월 : 2019년 03월 이후\r - 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.\r ',12),(9,'no','no','no','normal','heavy','dry','- 소재 : 상품택에 기재\r\n- 제조국 : 상품택에 기재\r\n- 제조사 : 상품택에 기재\r\n- 제조연월 : 상품택에 기재\r\n- 세탁방법 : 상품택에 기재',13);
/*!40000 ALTER TABLE `contentremark` ENABLE KEYS */;
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
