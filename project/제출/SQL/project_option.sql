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
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `optionCode` varchar(255) NOT NULL,
  `size` varchar(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `purchase` int NOT NULL DEFAULT '0',
  `productCode` varchar(255) NOT NULL,
  `sizeNum` int NOT NULL,
  PRIMARY KEY (`optionCode`),
  KEY `productCode_idx` (`productCode`),
  CONSTRAINT `productCode` FOREIGN KEY (`productCode`) REFERENCES `product` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES ('15754MLB','L','black',93,11,'15754',3),('15754MLW','L','white',48,2,'15754',3),('15754MMB','M','black',24,9,'15754',2),('15754MMW','M','white',14,7,'15754',2),('15754MXLB','XL','black',32,3,'15754',4),('15754MXLW','XL','white',25,6,'15754',4),('BVXQWAZ001','free','black',0,0,'BVXQWAZ',9),('BVXQWAZ002','free','gray',0,0,'BVXQWAZ',9),('DFBWEQR001','230','black',0,0,'DFBWEQR',230),('DFBWEQR002','230','white',0,0,'DFBWEQR',230),('DFBWEQR003','230','blue',0,0,'DFBWEQR',230),('DFBWEQR004','230','yellow',0,0,'DFBWEQR',230),('DFBWEQR005','240','black',0,0,'DFBWEQR',240),('DFBWEQR006','240','white',0,0,'DFBWEQR',240),('DFBWEQR007','240','blue',0,0,'DFBWEQR',240),('DFBWEQR008','240','yellow',0,0,'DFBWEQR',240),('DFBWEQR009','250','black',0,0,'DFBWEQR',250),('DFBWEQR010','250','white',0,0,'DFBWEQR',250),('DFBWEQR011','250','blue',0,0,'DFBWEQR',250),('DFBWEQR012','250','yellow',0,0,'DFBWEQR',250),('DFBWEQR013','260','black',0,0,'DFBWEQR',260),('DFBWEQR014','260','white',0,0,'DFBWEQR',260),('DFBWEQR015','260','blue',0,0,'DFBWEQR',260),('DFBWEQR016','260','yellow',0,0,'DFBWEQR',260),('DFBWEQR017','270','black',0,0,'DFBWEQR',270),('DFBWEQR018','270','white',0,0,'DFBWEQR',270),('DFBWEQR019','270','blue',0,0,'DFBWEQR',270),('DFBWEQR020','270','yellow',0,0,'DFBWEQR',270),('DFBWEQR021','280','black',0,0,'DFBWEQR',280),('DFBWEQR022','280','white',0,0,'DFBWEQR',280),('DFBWEQR023','280','blue',0,0,'DFBWEQR',280),('DFBWEQR024','280','yellow',0,0,'DFBWEQR',280),('DHNSCV001','M','black',0,0,'DHNSCV',2),('DHNSCV002','M','white',0,0,'DHNSCV',2),('DHNSCV003','L','black',0,0,'DHNSCV',3),('DHNSCV004','L','white',0,0,'DHNSCV',3),('DHNSCV005','XL','black',0,0,'DHNSCV',4),('DHNSCV006','XL','white',0,0,'DHNSCV',4),('DTGDWDS001','free','black',0,0,'DTGDWDS',9),('DTGDWDS002','free','white',0,0,'DTGDWDS',9),('DTGDWDS003','free','beige',0,0,'DTGDWDS',9),('DTGDWDS004','free','sora',0,0,'DTGDWDS',9),('DTGDWDS005','free','khaki',0,0,'DTGDWDS',9),('DVWQEQ010','M','green',43,6,'DVWQEQ',2),('DVWQEQ011','M','black',18,2,'DVWQEQ',2),('DVWQEQ012','M','white',9,6,'DVWQEQ',2),('DVWQEQ013','M','pink',0,0,'DVWQEQ',2),('DVWQEQ014','M','blue',0,0,'DVWQEQ',2),('DVWQEQ016','L','black',0,0,'DVWQEQ',3),('DVWQEQ017','L','white',0,0,'DVWQEQ',3),('DVWQEQ018','L','pink',0,0,'DVWQEQ',3),('DVWQEQ019','L','blue',0,0,'DVWQEQ',3),('DVWQEQ201','M','yellow',0,0,'DVWQEQ',2),('DVWQEQ202','L','green',0,0,'DVWQEQ',3),('DVWQEQ203','L','yellow',0,0,'DVWQEQ',3),('DVWQEQ204','S','green',0,0,'DVWQEQ',1),('DVWQEQ205','S','black',0,0,'DVWQEQ',1),('DVWQEQ206','S','white',0,0,'DVWQEQ',1),('DVWQEQ207','S','pink',0,0,'DVWQEQ',1),('DVWQEQ208','S','blue',0,0,'DVWQEQ',1),('DVWQEQ209','S','yellow',0,0,'DVWQEQ',1),('DVWQEQ210','XS','green',0,0,'DVWQEQ',0),('DVWQEQ211','XS','black',0,0,'DVWQEQ',0),('DVWQEQ212','XS','white',0,0,'DVWQEQ',0),('DVWQEQ213','XS','pink',0,0,'DVWQEQ',0),('DVWQEQ214','XS','blue',0,0,'DVWQEQ',0),('DVWQEQ215','XS','yellow',0,0,'DVWQEQ',0),('TDGBCSQW001','M','white',10,0,'TDGBCSQW',2),('TDGBCSQW002','M','beige',10,0,'TDGBCSQW',2),('TDGBCSQW003','M','khaki',0,0,'TDGBCSQW',2),('TDGBCSQW004','M','gray',0,0,'TDGBCSQW',2),('TDGBCSQW005','M','ivory',10,0,'TDGBCSQW',2),('TDGBCSQW006','M','oatmeal',0,0,'TDGBCSQW',2),('TDGBCSQW007','M','bluegreen',10,0,'TDGBCSQW',2),('TDGBCSQW008','M','mint',10,0,'TDGBCSQW',2),('TDGBCSQW009','M','sky',0,0,'TDGBCSQW',2),('TDGBCSQW010','M','cobalt',0,0,'TDGBCSQW',2),('TDGBCSQW011','M','hotpink',0,0,'TDGBCSQW',2),('TDGBCSQW012','M','pink',0,0,'TDGBCSQW',2),('TDGBCSQW013','M','purple',0,0,'TDGBCSQW',2),('TDGBCSQW014','M','lightpurple',0,0,'TDGBCSQW',2),('TDGBCSQW015','M','green',10,0,'TDGBCSQW',2),('TDGBCSQW016','L','white',10,0,'TDGBCSQW',3),('TDGBCSQW017','L','beige',10,0,'TDGBCSQW',3),('TDGBCSQW018','L','khaki',0,0,'TDGBCSQW',3),('TDGBCSQW019','L','gray',0,0,'TDGBCSQW',3),('TDGBCSQW020','L','ivory',0,0,'TDGBCSQW',3),('TDGBCSQW021','L','oatmeal',0,0,'TDGBCSQW',3),('TDGBCSQW022','L','bluegreen',0,0,'TDGBCSQW',3),('TDGBCSQW023','L','mint',0,0,'TDGBCSQW',3),('TDGBCSQW024','L','sky',0,0,'TDGBCSQW',3),('TDGBCSQW025','L','cobalt',0,0,'TDGBCSQW',3),('TDGBCSQW026','L','hotpink',0,0,'TDGBCSQW',3),('TDGBCSQW027','L','pink',0,0,'TDGBCSQW',3),('TDGBCSQW028','L','purple',0,0,'TDGBCSQW',3),('TDGBCSQW029','L','lightpurple',0,0,'TDGBCSQW',3),('TDGBCSQW030','L','green',0,0,'TDGBCSQW',3),('TDGBCSQW031','XL','white',0,0,'TDGBCSQW',4),('TDGBCSQW032','XL','beige',0,0,'TDGBCSQW',4),('TDGBCSQW033','XL','khaki',0,0,'TDGBCSQW',4),('TDGBCSQW034','XL','gray',0,0,'TDGBCSQW',4),('TDGBCSQW035','XL','ivory',0,0,'TDGBCSQW',4),('TDGBCSQW036','XL','oatmeal',0,0,'TDGBCSQW',4),('TDGBCSQW037','XL','bluegreen',0,0,'TDGBCSQW',4),('TDGBCSQW038','XL','mint',0,0,'TDGBCSQW',4),('TDGBCSQW039','XL','sky',0,0,'TDGBCSQW',4),('TDGBCSQW040','XL','cobalt',0,0,'TDGBCSQW',4),('TDGBCSQW041','XL','hotpink',0,0,'TDGBCSQW',4),('TDGBCSQW042','XL','pink',0,0,'TDGBCSQW',4),('TDGBCSQW043','XL','purple',0,0,'TDGBCSQW',4),('TDGBCSQW044','XL','lightpurple',0,0,'TDGBCSQW',4),('TDGBCSQW045','XL','green',0,0,'TDGBCSQW',4),('TQDFSECS001','M','white',0,0,'TQDFSECS',2),('TQDFSECS002','M','gray',0,0,'TQDFSECS',2),('TQDFSECS003','M','beige',0,0,'TQDFSECS',2),('TQDFSECS004','M','pink',0,0,'TQDFSECS',2),('TQDFSECS005','M','red',0,0,'TQDFSECS',2),('TQDFSECS006','M','green',0,0,'TQDFSECS',2),('TQDFSECS007','M','khaki',0,0,'TQDFSECS',2),('TQDFSECS008','M','black',0,0,'TQDFSECS',2),('TQDFSECS009','M','blue',0,0,'TQDFSECS',2),('TQDFSECS010','M','yellow',0,0,'TQDFSECS',2),('TQDFSECS011','M','orange',0,0,'TQDFSECS',2),('TQDFSECS012','M','purple',0,0,'TQDFSECS',2),('TQDFSECS013','L','white',0,0,'TQDFSECS',3),('TQDFSECS014','L','gray',0,0,'TQDFSECS',3),('TQDFSECS015','L','beige',0,0,'TQDFSECS',3),('TQDFSECS016','L','pink',0,0,'TQDFSECS',3),('TQDFSECS017','L','red',0,0,'TQDFSECS',3),('TQDFSECS018','L','green',0,0,'TQDFSECS',3),('TQDFSECS019','L','khaki',0,0,'TQDFSECS',3),('TQDFSECS020','L','black',0,0,'TQDFSECS',3),('TQDFSECS021','L','blue',0,0,'TQDFSECS',3),('TQDFSECS022','L','yellow',0,0,'TQDFSECS',3),('TQDFSECS023','L','orange',0,0,'TQDFSECS',3),('TQDFSECS024','L','purple',0,0,'TQDFSECS',3),('TQDFSECS025','XL','white',0,0,'TQDFSECS',4),('TQDFSECS026','XL','gray',0,0,'TQDFSECS',4),('TQDFSECS027','XL','beige',0,0,'TQDFSECS',4),('TQDFSECS028','XL','pink',0,0,'TQDFSECS',4),('TQDFSECS029','XL','red',0,0,'TQDFSECS',4),('TQDFSECS030','XL','green',0,0,'TQDFSECS',4),('TQDFSECS031','XL','khaki',0,0,'TQDFSECS',4),('TQDFSECS032','XL','black',0,0,'TQDFSECS',4),('TQDFSECS033','XL','blue',0,0,'TQDFSECS',4),('TQDFSECS034','XL','yellow',0,0,'TQDFSECS',4),('TQDFSECS035','XL','orange',0,0,'TQDFSECS',4),('TQDFSECS036','XL','purple',0,0,'TQDFSECS',4),('TQDFSECS037','2XL','white',0,0,'TQDFSECS',5),('TQDFSECS038','2XL','gray',0,0,'TQDFSECS',5),('TQDFSECS039','2XL','beige',0,0,'TQDFSECS',5),('TQDFSECS040','2XL','pink',0,0,'TQDFSECS',5),('TQDFSECS041','2XL','red',0,0,'TQDFSECS',5),('TQDFSECS042','2XL','green',0,0,'TQDFSECS',5),('TQDFSECS043','2XL','khaki',0,0,'TQDFSECS',5),('TQDFSECS044','2XL','black',0,0,'TQDFSECS',5),('TQDFSECS045','2XL','blue',0,0,'TQDFSECS',5),('TQDFSECS046','2XL','yellow',0,0,'TQDFSECS',5),('TQDFSECS047','2XL','orange',0,0,'TQDFSECS',5),('TQDFSECS048','2XL','purple',0,0,'TQDFSECS',5);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
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
