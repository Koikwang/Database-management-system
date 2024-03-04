-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: seven_eleven
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_ID` varchar(20) NOT NULL,
  `Branch_Name` varchar(50) NOT NULL,
  `Branch_Phone` char(10) NOT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('00781','Pratuchai Phrae','0921177044'),('01520','Piriyalai ','0949933032'),('04081','Buathong Parkville','0886269852'),('04570','Chaloem Phrakiat 48','0886270780'),('04853','Bang Luang','0886297131'),('10165','Ton Mai Khlong 15','0886271354'),('14319','Aiyatha Market','0886289451'),('15113','Niran Ville 4 (Ram2)','0886270385'),('15640','VillaNova (Bang Phli-Tamru)','0886740874'),('16493','Nilubon','0886724822');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_center`
--

DROP TABLE IF EXISTS `call_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_center` (
  `Employee_ID` varchar(20) NOT NULL,
  `Language_Skill` varchar(50) DEFAULT NULL,
  `Shift_In` time NOT NULL,
  `Shift_Out` time NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `FK_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_center`
--

LOCK TABLES `call_center` WRITE;
/*!40000 ALTER TABLE `call_center` DISABLE KEYS */;
INSERT INTO `call_center` VALUES ('0633002','Chinese','06:30:00','17:00:00'),('0633071','','17:00:00','06:30:00'),('0633095','Chinese','17:00:00','06:30:00'),('0633124','English','06:30:00','17:00:00'),('0633152','Chinese','06:30:00','17:00:00'),('0633159','Japanese','06:30:00','17:00:00'),('0633167','English','17:00:00','06:30:00'),('0633479','English','17:00:00','06:30:00'),('0633743','Japanese','06:30:00','17:00:00'),('0633894','Chinese','17:00:00','06:30:00');
/*!40000 ALTER TABLE `call_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_history`
--

DROP TABLE IF EXISTS `call_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_history` (
  `History_No` int NOT NULL,
  `Employee_ID` varchar(20) DEFAULT NULL,
  `Customer_ID` varchar(20) DEFAULT NULL,
  `Problem_Topic` varchar(50) NOT NULL,
  `Call_Description` varchar(200) NOT NULL,
  PRIMARY KEY (`History_No`),
  KEY `FK_EmpID_3` (`Employee_ID`),
  KEY `FK_CusID` (`Customer_ID`),
  CONSTRAINT `FK_CusID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `FK_EmpID_3` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_history`
--

LOCK TABLES `call_history` WRITE;
/*!40000 ALTER TABLE `call_history` DISABLE KEYS */;
INSERT INTO `call_history` VALUES (1,'0633743','125031','Refund','Give a refund to customer'),(2,'0633794','137510','Return','Return the products'),(3,'0633917','132011','App error','Cannot access to 7-Eleven application'),(4,'0633133','143002','Return','Return the products'),(5,'0633196','178001','Slow delivery','The sender always sends late'),(6,'0633964','179520','Refund','Give a refund to customer'),(7,'0649731','132011','App error','Cannot access to 7-Eleven application'),(8,'0649171','143002','Return','Return the products'),(9,'0694739','178001','Refund','Give a refund to customer'),(10,'0649173','179520','Slow delivery','The sender always sends late'),(11,'0633794','137510','App error','Cannot change an email'),(12,'0649731','179520','App error','Payment process error'),(13,'0633794','125031','Refund','Give a refund to customer'),(14,'0633964','143002','App error','Payment process error'),(15,'0633196','178001','Slow delivery','The sender always sends late'),(16,'0633794','179520','Return','Return the products'),(17,'0649731','143002','Refund','Give a refund to customer'),(18,'0649731','132011','Return','Return the products'),(19,'0633964','137510','App error','Cannot access to 7-Eleven application'),(20,'0649173','179520','Slow delivery','The sender always sends late'),(21,'0633794','137510','Return','Return the products'),(22,'0633794','125031','Return','Return the products'),(23,'0649731','204710','Forget username','The customer forgot an username'),(24,'0633964','115342','Slow delivery','The sender always sends late'),(25,'0649731','116324','Refund','Return the products'),(26,'0633794','204710','Forgot username','The customer forgot an username'),(27,'0649173','116324','Refund','Give a refund to customer'),(28,'0633794','179520','App error','Payment process error'),(29,'0649173','204710','Slow delivery','The sender always sends late'),(30,'0649731','178001','Return','Return the products');
/*!40000 ALTER TABLE `call_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` varchar(20) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Title` varchar(5) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Phone` char(10) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Picture_Profile` varchar(100) DEFAULT NULL,
  `Modified_Date` date NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  CONSTRAINT `title` CHECK ((`Title` in (_utf8mb4'Miss',_utf8mb4'Mrs',_utf8mb4'MR')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('115342','nitnoi97','Mr','Nititas','Noipalee','0954213674','nititas@gmail.com','1997-10-23','https://github.com/server/picture_profile/115342.jpg','2020-07-05'),('116324','naruponcho','Mr','Narupon','Chokechatree','0845679856','narupon@yahoo.com','1990-02-18','https://github.com/server/picture_profile/116324.jpg','2020-03-23'),('120031','ballsupachok','Mr','Supachok','Chaichongmee','0836457251','supachook.chai@hotmail.com','2000-07-11','https://github.com/server/picture_profile/120031.png','2020-10-05'),('125031','0985473210','Mr','Nattapat','Sirilimprapan','0985473210','nattapat@outlook.co.th','1986-09-05','https://github.com/server/picture_profile/125031.png','2020-04-04'),('132011','chanakul2002','Miss','Chanakul','Chaliawklang','0812257320','chanakul2002@hotmail.com','2002-05-25','https://github.com/server/picture_profile/132011.jpg','2020-02-01'),('137510','bamchotirot89','Mrs','Chotirot','Klinthong','0894718632','chotirot@gmail.com','2002-05-25','https://github.com/server/picture_profile/137510.jpg','2021-06-18'),('143002','pon11701','Mr','Pontapan','Polyiam','0957704913','pontapan.pol@yahoo.com','2001-11-07','https://github.com/server/picture_profile/143002.png','2021-05-11'),('178001','tabanhan9563','Mrs','Wathanya','Tabanhan','0867739563','wathanya.tab@gmail.com','1990-01-02','https://github.com/server/picture_profile/178001.jpg','2021-03-21'),('179520','AriyaZa','Mr','Ariya','Malai','0985244453','ariya.mai@yahoo.com','1994-06-24','https://github.com/server/picture_profile/179520.png','2021-11-07'),('204710','nitchamon','Mrs','Nitchamon','Aworn','0899886413','nitchamon2000@hotmail.com','2000-04-12','https://github.com/server/picture_profile/204710.jpg','2021-05-25');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` varchar(20) NOT NULL,
  `Branch_ID` varchar(20) NOT NULL,
  `Title` varchar(5) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Phone` char(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Salary` int DEFAULT NULL,
  `Modified_Date` date NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `FK_Branch_ID_1` (`Branch_ID`),
  CONSTRAINT `FK_Branch_ID_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`),
  CONSTRAINT `chk_title` CHECK ((`Title` in (_utf8mb4'Miss',_utf8mb4'Mrs',_utf8mb4'MR')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('0633002','15113','Mrs','Kanokwan','Veeraphan','0656456550','kanokvee@gmail.com','1999-12-25',25000,'2021-11-02'),('0633071','04081','Miss','Sasithorn','Phukan','0855422476','sasithorn.p@hotmail.com','2000-06-01',20000,'2019-01-17'),('0633095','10165','Mr','Natakorn','Chomphoobut','0981455905','natakorn.c@gmail.com','1998-10-15',27000,'2017-03-07'),('0633096','14319','Mrs','Ratha','Sirima','0897425623','ratha.s@hotmail.com','2001-01-01',21000,'2021-11-05'),('0633107','04570','Mr','Chirawat','Boonchai','0932245466','boon12@gmail.com','1997-09-01',20000,'2019-10-31'),('0633112','15113','Mr','Jirat','Burat','0956523472','jirat95@gmail.com','1995-01-09',30000,'2017-12-01'),('0633117','04570','Mrs','Tashita','Poya','0872354986','t_poya@hotmail.com','2000-09-09',22500,'2020-11-09'),('0633124','15113','Miss','Rattana','Dungphimai','0983716255','ratana97@gmail.com','1997-12-04',18000,'2020-04-18'),('0633133','01520','Miss','Pitchaya','Teerawongpairoj','0819266322','pitchaya.tee@hotmail.com','2001-12-07',30000,'2021-11-20'),('0633142','10165','Miss','Pimmada',' Jantara','0923565423','pj2001@hotmail.com','2001-05-15',28000,'2021-06-07'),('0633145','04570','Mrs','Alisara','Nonsiri','0925585362','alisa.n9@gmail.com','1999-07-11',35000,'2020-12-25'),('0633152','14319','Miss','Marisa','Supasorn','0927919589','marisa.s@hotmail.com','1995-06-24',25000,'2018-05-17'),('0633159','01520','Mr','Kontawat','Wisetpaitoon','0947585809','kontawat.wis@gmail.com','2002-04-22',30000,'2021-11-20'),('0633166','10165','Mr','Somchai','Panyatip','0929159141','somchai.p@gmail.com','1990-07-13',32000,'2017-07-01'),('0633167','14319','Mrs','Nisachon','Thawieng','0892839079','nisa_chon@hotmail.com','2001-03-28',18000,'2021-02-09'),('0633187','04853','Mr','Chanon','Siribumrung','0984561474','cha.siri@gmail.com','1997-02-14',17500,'2019-08-19'),('0633189','04081','Mrs','Nitchamon','Chamsi','0988544544','nitcha24@hotmail.com','2000-04-24',15000,'2020-06-05'),('0633191','04853','Mr','Pakorn','Malai','0924153281','pakorn_ma@gmail.com','2001-08-21',25000,'2020-09-25'),('0633196','15640','Miss','Sasima','Srijanya','0922482545','sasima.sri@gmail.com','2002-05-25',32000,'2021-06-05'),('0633257','04853','Mr','Saranya','Meechai','0631455552','saranmee@gmail.com','2001-10-14',15000,'2020-11-25'),('0633479','01520','Miss','Titaya','Wisetpaitoon','0863759336','tangmona@gmail.com','2006-04-15',27000,'2020-11-19'),('0633743','00781','Mr','Danaidech ','Achsamai','0929312311','danaidech.asi@gmail.com','2000-02-05',35000,'2010-12-01'),('0633794','15640','Miss','Wutichai','Wisetpaitoon','0815834322','wutichai.wis@gmail.com','1972-09-16',30000,'2018-02-05'),('0633894','15640','Mr','Vichai','Chaipasit','0923311132','vichai.chi@hotmail.com','1944-04-19',30000,'2021-12-27'),('0633917','15640','Miss','Pratum','Chaiparsit','0947700055','partum.chi@hotmail.com','1949-12-23',40000,'2021-03-09'),('0633964','16493','Mrs','Wimonrat','Teerawongpairoj','0870790055','wimonrat@hotmail.com','1965-05-05',25000,'2020-09-15'),('0649171','00781','Mr','Watana ','Teerawongpairoj','0879992933','watana@gmail.com','1967-12-28',35000,'2020-09-07'),('0649173','15640','Miss','Chayanid','Teerawongpairoj','0815734662','chayanid@hotmail.com','1993-11-26',24000,'2020-09-30'),('0649731','15640','Mrs','Juthamas','Srijanya','0858191464','jutha_@gmail.com','1966-12-23',28000,'2021-01-06'),('0694739','00781','Mr','Sorawit','Teerawongpairoj','0819266321','sorawit@yahoo.com','2000-07-27',23000,'2021-09-17');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_of_product`
--

DROP TABLE IF EXISTS `information_of_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information_of_product` (
  `Information_No` int NOT NULL,
  `How_To_Use` varchar(200) DEFAULT NULL,
  `Warning` varchar(200) NOT NULL,
  `Component_Product` varchar(200) NOT NULL,
  `Producer` varchar(50) NOT NULL,
  `Logo` varchar(100) NOT NULL,
  `Barcode` varchar(100) NOT NULL,
  PRIMARY KEY (`Information_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_of_product`
--

LOCK TABLES `information_of_product` WRITE;
/*!40000 ALTER TABLE `information_of_product` DISABLE KEYS */;
INSERT INTO `information_of_product` VALUES (361494,NULL,'This product was processed ingredients containing wheat, and egg.','Potato, Rice bran oil, Seasoning','Lay','https://github.com/server/logo/361494.png','https://github.com/server/barcode/361494.png'),(361714,'Keep in refridgerator ','This product was processed ingredients containing milk, eggs, and wheat.','Flour, Strawberry, Sugar, Egg, Wheat','EZYGO','https://github.com/server/logo/361714.png','https://github.com/server/barcode/361714.png'),(361716,'Please warm nugget in microwave','This product was processed ingredients containing wheat.','Chicken, Whole wheat flour, Egg','EZYGO','https://github.com/server/logo/361716.png','https://github.com/server/barcode/361716.png'),(361946,'Keep in refridgerator ','This product was processed ingredients containing wheat, and .egg','Flour, Butter, Sugar, Egg, Wheat','Bow Delicious','https://github.com/server/logo/361946.png','https://github.com/server/barcode/361946.png'),(362212,'-','-','Water','Singha','https://github.com/server/logo/362212.png','https://github.com/server/barcode/362212.png'),(364647,'Keep in refridgerator ','This product was processed ingredients containing milk, eggs, and wheat.','Milk','EZYGO','https://github.com/server/logo/364647.png','https://github.com/server/barcode/364647.png'),(364974,'Keep in refridgerator ','This product was processed ingredients containing nut.','Cocoa butter, Milk, Cocoa mass, Nut','Nestle','https://github.com/server/logo/364974.png','https://github.com/server/barcode/364974.png'),(365959,'Keep in refridgerator ','This product was processed ingredients containing milk, eggs, and wheat.','Flour, Egg, Milk, Sugar, Vanilla, Salt','EZYGO','https://github.com/server/logo/365959.png','https://github.com/server/barcode/365959.png'),(368489,'Keep in refridgerator ','This product was processed ingredients containing milk, eggs, and wheat.','Flour, Egg, Sugar, Straberry, Salt','EZYGO','https://github.com/server/logo/368489.png','https://github.com/server/barcode/368489.png'),(369944,'Keep in refridgerator ','Best if consumed within 1 day after opening.','Soy, Sugar, Konjac jelly','Tofusan','https://github.com/server/logo/369944.png','https://github.com/server/barcode/369944.png');
/*!40000 ALTER TABLE `information_of_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_branch`
--

DROP TABLE IF EXISTS `location_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_branch` (
  `Branch_ID` varchar(20) NOT NULL,
  `Location_No` varchar(20) NOT NULL,
  `Road` varchar(50) DEFAULT NULL,
  `Sub_District` varchar(50) NOT NULL,
  `District` varchar(50) NOT NULL,
  `Province` varchar(50) NOT NULL,
  `Post_Code` char(5) NOT NULL,
  PRIMARY KEY (`Location_No`),
  KEY `FK_Branch_ID` (`Branch_ID`),
  CONSTRAINT `FK_Branch_ID` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_branch`
--

LOCK TABLES `location_branch` WRITE;
/*!40000 ALTER TABLE `location_branch` DISABLE KEYS */;
INSERT INTO `location_branch` VALUES ('15113','00001','Ramkhamhaeng 2','Dokmai','Prawet','Bangkok','10250'),('04570','00002','Sukhaphibal 1','Dokmai','Prawet','Bangkok','10260'),('04081','00003','ฺBang Bua Thong','Phimonrat','ฺBangbuathong','Nonthaburi','11110'),('14319','00004','Khlong Luang Muang Mai','Khlong Song','Khlong Luang','Pathumthani','12120'),('10165','00005','Nakhon Nayok','Khlong Yai','Ong Karak','Nakhon Nayok','26120'),('04853','00006','Highway 3351','Bang Luang','Bang Lane','Nakhon Pathom','73190'),('01520','00007','Ratchapruek','Bang Lamard','Taling Chan','Bangkok','10170'),('16493','00008','Ratchapruek','Taling Chan','Taling Chan','Bangkok','10170'),('15640','00009','Paya Wong','Pra Prathom Jedee','Nakhon Pathom','Nakhon Pathom','73000'),('00781','00010','Kum Pang San','Kum Pang San','Kum Pang San','Nakhon Pathom','73000');
/*!40000 ALTER TABLE `location_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_customer`
--

DROP TABLE IF EXISTS `location_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_customer` (
  `Customer_ID` varchar(20) NOT NULL,
  `Location_No` varchar(20) NOT NULL,
  `House_No` varchar(50) NOT NULL,
  `Village` varchar(50) NOT NULL,
  `Road` varchar(50) DEFAULT NULL,
  `Sub_District` varchar(50) NOT NULL,
  `District` varchar(50) NOT NULL,
  `Province` varchar(50) NOT NULL,
  `Post_Code` char(5) NOT NULL,
  PRIMARY KEY (`Location_No`),
  KEY `FK_Customer_ID` (`Customer_ID`),
  CONSTRAINT `FK_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_customer`
--

LOCK TABLES `location_customer` WRITE;
/*!40000 ALTER TABLE `location_customer` DISABLE KEYS */;
INSERT INTO `location_customer` VALUES ('115342','00011','71/2','Phrueksa Village','Daothong','Mahasawat','Phuttamonthon','Nakhon Pathom','73170'),('116324','00012','61/67','Suralai Housing','Bang Kruai - Sai Noi','Bang Yai','Bang Yai','Nonthaburi','11140'),('120031','00013','21/1','Ban Rim Suan','Yothathikan','Bang Rak Noi','Meuang','Nonthaburi','11000'),('125031','00014','12/456','Kaeo Villa','Phuttha Monthon Sai 1','Bang Duan','Phasi Chareon','Bangkok','10160'),('137510','00015','61/264','Butsaba Village','Phuttha Monthon Sai 2','Sala Thammasop','Thawi','Bangkok','10170'),('132011','00016','56/23','Kawinthip Village','Borommaratchachonnani','Song Khanong','Sam Phran','Nakhon Pathom','73120'),('143002','00017','653/09','Ladawan','Ratchaphruek','Taling Chan','Taling Chan','Bangkok','10170'),('178001','00018','666/11','Royal Tier','Ratchaphruek','Taling Chan','Taling Chan','Bangkok','10170'),('179520','00019','122/21','Parichart','Ratchaphruek','Bang Khu Wat','Mueang','Pathum Thani','12000'),('204710','00020','666/09','Royal Tier','Ratchaphruek','Taling Chan','Taling Chan','Bangkok','10170');
/*!40000 ALTER TABLE `location_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_employee`
--

DROP TABLE IF EXISTS `location_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_employee` (
  `Employee_ID` varchar(20) NOT NULL,
  `Location_No` varchar(20) NOT NULL,
  `Road` varchar(50) DEFAULT NULL,
  `Sub_District` varchar(50) NOT NULL,
  `District` varchar(50) NOT NULL,
  `Province` varchar(50) NOT NULL,
  `Post_Code` char(5) NOT NULL,
  PRIMARY KEY (`Location_No`),
  KEY `FK_Employee_ID_2` (`Employee_ID`),
  CONSTRAINT `FK_Employee_ID_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_employee`
--

LOCK TABLES `location_employee` WRITE;
/*!40000 ALTER TABLE `location_employee` DISABLE KEYS */;
INSERT INTO `location_employee` VALUES ('0633002','10021','Sukhaphibal 2','Bang Phli Yai','Bang Phli','Samut Prakan','10540'),('0633107','10022','Sukhumvit','Phra Khanong','Khlong Toei','Bangkok','10110'),('0633189','10023','Nakhon Chaisi','Thanon Nakhon Chai Si','Dusit','Bangkok','73120'),('0633152','10024','Yaowarat','Samphanthawong','Samphanthawong','Bangkok','10100'),('0633166','10025','','Nong Khang Phlu','Nong Khaem','Bangkok','10160'),('0633257','10026','Rama 3','Bang Phong Phang','Yan Nawa','Bangkok','10120'),('0633124','10027','Chalermkhet','Pomprap','Pomprap','Bangkok','10100'),('0633145','10028','Yantrakit Koso','Nai wang','Mueang','Phare','54000'),('0633071','10029','Ratchauthit','Nai Wiang',' Mueang Phrae','Phrae','54000'),('0633167','10030','King Kaeo','Bang Phli Yai','Bang Phli','Samut Prakan','10543'),('0633095','10031','','Prawet','Prawet','Bangkok','10250'),('0633191','10032','','Den Chai','Den Chai','Phrae','54110'),('0633096','10033',' Chetsada Bodin Alley','Tha It','Mueang Uttaradit','Uttaradit','53000'),('0633187','10034','Tang Roadfai','Pattaya City','Bang Lamung','Chon Buri','20150'),('0633112','10035','Khao Talo','Pattaya City','Bang Lamung','Chon Buri','20150'),('0633142','10036','Phlu Ta Luang','Phlu Ta Luang','Sattahip','Chon Buri','20180'),('0633117','10037','Sukuhumvit','Phlu Ta Luang','Sattahip','Chon Buri','20180'),('0633159','10038','Kanlapaphruek','Nai Mueang','Mueang Khon Kaen','Khon Kaen','40000'),('0633894','10039','Mittraphap','Nai Mueang','Mueang Khon Kaen','Khon Kaen','40000'),('0633479','10040','Samlarn','Phra Sing',' Mueang Chiang Mai','Chiang Mai','50200'),('0633743','10041','Chiang Mai Outer Ring','Pa Bong','Saraphi','Chiang Mai','50140'),('0633794','10042','','Saphan Sung','Saphan Sung','Bangkok','10240'),('0633917','10043','','Tak Tok','Ban Tak','Tak ','63120'),('0633133','10044','Krung Thep Kritha','Saphan Sung','Saphan Sung','Bangkok','10240'),('0633196','10045','Rama 3','Bang Phong Phang','Yan Nawa','Bangkok','10120'),('0633964','10046','','Nong Lu','Sangkhla Buri ','Kanchanaburi','71240'),('0649731','10047','Tewarach','Pha Sing','Mueang Nan','Nan','55000'),('0649171','10048','King Kaeo','Bang Phli Yai','Bang Phli','Samut Prakan','10543'),('0694739','10049','Sukhaphibal 2','Bang Phli Yai','Bang Phli','Samut Prakan','10540'),('0649173','10050','',' Khon San',' Khon San',' Chaiyaphum','36180');
/*!40000 ALTER TABLE `location_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Employee_ID` varchar(20) NOT NULL,
  `Inagugration_Date` date NOT NULL,
  `Resignation_Date` date NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `FK_EmpID` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('0633107','2020-12-27','2019-01-31'),('0633145','2021-11-10','2021-03-01'),('0633152','2021-06-09','2021-03-21'),('0633189','2021-02-08','2020-12-24'),('0633191','2020-08-11','2019-10-05'),('0633196','2021-07-06','2021-11-20'),('0633257','2021-03-11','2020-02-08'),('0633964','2021-03-04','2021-09-20'),('0649171','2020-01-08','2021-09-03'),('0649731','2020-09-10','2021-04-07');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_goods` (
  `Order_ID` varchar(50) NOT NULL,
  `Payment` varchar(200) NOT NULL,
  `Order_Note` varchar(100) DEFAULT NULL,
  `Order_Date` date NOT NULL,
  PRIMARY KEY (`Order_ID`),
  CONSTRAINT `Payment_Check` CHECK ((`Payment` in (_utf8mb4'Cash',_utf8mb4'True money',_utf8mb4'Card')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES ('00781847625139549','True money','Please give me a ketchup','2021-11-26'),('01520121456875498','Cash','Please give me a plastic fork','2021-08-14'),('04081484416516518','Cash','Please call me when you arrive','2019-02-14'),('04081529620518484','Cash','Warm in microwave','2019-03-26'),('04081829129288499','Cash','Please give me a plastic spoon','2021-04-11'),('04081928485969127','True money','Please give me a ketchup','2021-06-19'),('04081956250205486','Cash','Please give me a mayonnaise','2021-03-02'),('04081974265189595','Cash','-','2021-08-30'),('04570205185963628','True money','Please call me when you arrive','2021-12-04'),('04570260505128495','Cash','Please give me a plastic fork','2020-12-31'),('04570285185487416','Cash','Please give me a plastic fork','2021-03-13'),('04570548478485010','Cash','Please give me a ketchup','2020-10-30'),('04570565231315151','True money','Warm in microwave','2021-11-11'),('04570841005194849','True money','Please call me when you arrive','2019-10-31'),('04853059845225269','Cash','Please give me a mayonnaise','2019-01-01'),('04853105051849288','Cash','Please call me when you arrive','2021-10-13'),('04853519848597367','Cash','Please call me when you arrive','2019-05-05'),('10165520205174856','Cash','-','2019-03-03'),('10165585248484863','Cash','Please give me a plastic spoon','2019-07-19'),('10165595928740299','True money','Please call me when you arrive','2019-07-09'),('14319101847858625','Cash','-','2019-01-10'),('14319205051859534','True money','-','2020-07-02'),('14319261848959634','True money','-','2021-12-08'),('14319292829292484','True money','Warm in microwave','2020-12-13'),('14319506128956227','True money','Please give me a plastic spoon','2020-11-21'),('14319958447051955','Cash','-','2020-02-24'),('15113125128518959','True money','-','2021-05-30'),('15113211023847536','Cash','Please give me a ketchup','2020-02-01'),('15113529484051258','True money','-','2020-05-18'),('15113592647484586','True money','-','2021-07-26'),('15113595205184599','Cash','-','2019-11-28'),('15113898150687895','True money','Please give me a plastic fork','2020-06-17'),('15640453278415623','Cash','Please call me when you arrive','2020-07-18'),('16493126972653192','True money','-','2021-10-17');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `Order_ID` varchar(20) NOT NULL,
  `Product_ID` varchar(20) NOT NULL,
  `Amount` int NOT NULL,
  `Total_Price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Order_ID`,`Product_ID`),
  KEY `fk_product_id` (`Product_ID`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`Order_ID`) REFERENCES `order_goods` (`Order_ID`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES ('00781847625139549','8851362649514',2,60.00),('00781847625139549','8894194134907',1,25.00),('01520121456875498','8864596562626',2,50.00),('01520121456875498','8865296563147',1,30.00),('04081484416516518','8851351151253',1,30.00),('04081484416516518','8851362649514',3,90.00),('04081484416516518','8869461941947',3,75.00),('04081484416516518','8891491947194',2,60.00),('04081529620518484','8891491947194',1,30.00),('04081829129288499','8851362649514',3,90.00),('04081829129288499','8891491947194',1,30.00),('04081829129288499','8894194134907',2,60.00),('04081928485969127','8891491947194',1,30.00),('04081956250205486','8894194134907',1,25.00),('04081956250205486','8897461413658',2,60.00),('04081974265189595','8851362649514',3,105.00),('04081974265189595','8891491947194',1,30.00),('04570205185963628','8851362649514',3,90.00),('04570205185963628','8869461941947',3,75.00),('04570205185963628','8894194134907',1,30.00),('04570260505128495','8869461941947',2,50.00),('04570260505128495','8897461413658',3,90.00),('04570285185487416','8869461941947',2,60.00),('04570285185487416','8894194134907',2,60.00),('04570285185487416','8897461413658',3,90.00),('04570548478485010','8851351151253',2,70.00),('04570548478485010','8851362649514',2,60.00),('04570548478485010','8897461413658',3,90.00),('04570565231315151','8851351151253',1,35.00),('04570841005194849','8869461941947',3,75.00),('04570841005194849','8894194134907',3,75.00),('04853059845225269','8851351151253',1,35.00),('04853059845225269','8897461413658',2,60.00),('04853105051849288','8851351151253',3,105.00),('04853105051849288','8894194134907',3,75.00),('04853519848597367','8894194134907',2,50.00),('10165520205174856','8891491947194',3,90.00),('10165585248484863','8851362649514',2,70.00),('10165585248484863','8891491947194',3,90.00),('10165585248484863','8894194134907',1,30.00),('10165595928740299','8851351151253',2,60.00),('10165595928740299','8851362649514',3,90.00),('10165595928740299','8869461941947',1,25.00),('10165595928740299','8891491947194',2,60.00),('14319101847858625','8851351151253',1,35.00),('14319101847858625','8869461941947',2,50.00),('14319205051859534','8851351151253',3,105.00),('14319205051859534','8851362649514',2,60.00),('14319205051859534','8894194134907',2,50.00),('14319261848959634','8851362649514',2,60.00),('14319292829292484','8891491947194',2,60.00),('14319292829292484','8897461413658',1,30.00),('14319506128956227','8851362649514',3,90.00),('14319506128956227','8869461941947',1,25.00),('14319958447051955','8891491947194',1,30.00),('15113125128518959','8851351151253',1,35.00),('15113125128518959','8869461941947',2,60.00),('15113125128518959','8891491947194',1,30.00),('15113125128518959','8894194134907',3,90.00),('15113211023847536','8897461413658',3,90.00),('15113529484051258','8851351151253',3,105.00),('15113529484051258','8851362649514',2,70.00),('15113529484051258','8897461413658',1,30.00),('15113592647484586','8851351151253',2,70.00),('15113592647484586','8851362649514',1,30.00),('15113592647484586','8894194134907',2,60.00),('15113595205184599','8891491947194',2,60.00),('15113898150687895','8851351151253',3,90.00),('15113898150687895','8851362649514',1,30.00),('15113898150687895','8891491947194',2,60.00),('15113898150687895','8894194134907',3,90.00),('15640453278415623','8816169530314',2,30.00),('15640453278415623','8851351151253',1,35.00),('15640453278415623','8891491947194',1,30.00),('16493126972653192','8850999321004',3,27.00);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` varchar(20) NOT NULL,
  `Name_Of_Product` varchar(50) NOT NULL,
  `Member_Point` int NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  `Information_No` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `FK_InfNo` (`Information_No`),
  CONSTRAINT `FK_InfNo` FOREIGN KEY (`Information_No`) REFERENCES `information_of_product` (`Information_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('8816169530314','Yogurt',2,15.00,364647),('8850999321004','Sing Drinking Water',1,9.00,362212),('8851351151253','Chicken nuggets',4,35.00,361716),('8851362649514','Fluffy pancake',3,30.00,361946),('8864596562626','Eclair',3,25.00,365959),('8865296563147','Strawberry Mochi',3,30.00,368489),('8869461941947','Brown sugar soy milk',3,25.00,369944),('8891491947194','Pancake with strawberry sause',3,30.00,361714),('8894194134907','Kit kat',3,25.00,364974),('8897461413658','Lay big grab',3,30.00,361494);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender`
--

DROP TABLE IF EXISTS `sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender` (
  `Employee_ID` varchar(20) NOT NULL,
  `Licence_Plate` varchar(10) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `FK_EmpID_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender`
--

LOCK TABLES `sender` WRITE;
/*!40000 ALTER TABLE `sender` DISABLE KEYS */;
INSERT INTO `sender` VALUES ('0633095','สสส 797'),('0633096','อพท 99'),('0633112','สตร 168'),('0633117','อพว 1'),('0633142','กกก 147'),('0633159','หบพ 03'),('0633187','ยมพ 245'),('0633191','ลมม 7'),('0633479','งฟห 762'),('0633894','สวป 68');
/*!40000 ALTER TABLE `sender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `Branch_ID` varchar(20) NOT NULL,
  `Product_ID` varchar(20) NOT NULL,
  `Remaining_Amount` int NOT NULL,
  `Lot_Date` date NOT NULL,
  PRIMARY KEY (`Branch_ID`,`Product_ID`,`Lot_Date`),
  KEY `FK_ProID` (`Product_ID`),
  CONSTRAINT `FK_BraID_2` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`),
  CONSTRAINT `FK_ProID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('00781','8816169530314',44,'2021-11-23'),('00781','8851351151253',116,'2021-06-02'),('00781','8851362649514',364,'2021-03-21'),('00781','8864596562626',312,'2020-10-30'),('00781','8869461941947',8,'2021-03-26'),('00781','8894194134907',231,'2020-08-03'),('00781','8897461413658',77,'2020-12-31'),('01520','8816169530314',196,'2021-11-10'),('01520','8851351151253',258,'2021-09-16'),('01520','8851362649514',169,'2021-07-07'),('01520','8864596562626',147,'2020-09-16'),('01520','8865296563147',120,'2021-08-14'),('01520','8894194134907',123,'2021-07-09'),('01520','8897461413658',372,'2021-12-15'),('04081','8850999321004',5,'2020-05-15'),('04081','8851351151253',168,'2021-06-03'),('04081','8851362649514',82,'2021-10-30'),('04081','8864596562626',362,'2020-01-25'),('04081','8864596562626',139,'2021-11-06'),('04081','8869461941947',27,'2021-07-16'),('04081','8891491947194',181,'2020-12-24'),('04570','8850999321004',73,'2021-12-09'),('04570','8851362649514',249,'2021-05-03'),('04570','8891491947194',220,'2021-04-23'),('04570','8894194134907',365,'2020-07-19'),('04853','8816169530314',154,'2021-11-25'),('04853','8851362649514',47,'2021-04-12'),('04853','8891491947194',117,'2020-11-07'),('04853','8897461413658',275,'2021-07-24'),('10165','8850999321004',133,'2021-12-30'),('10165','8851351151253',347,'2021-10-31'),('10165','8851362649514',164,'2021-10-30'),('10165','8864596562626',132,'2021-11-03'),('10165','8869461941947',185,'2021-06-14'),('10165','8891491947194',245,'2021-08-14'),('10165','8897461413658',74,'2021-09-26'),('14319','8850999321004',113,'2021-11-30'),('14319','8851362649514',257,'2021-08-26'),('14319','8891491947194',350,'2021-05-25'),('15113','8850999321004',134,'2021-09-06'),('15113','8851351151253',205,'2021-02-18'),('15113','8851362649514',26,'2021-07-14'),('15113','8864596562626',190,'2021-02-14'),('15113','8864596562626',274,'2021-02-19'),('15113','8865296563147',370,'2020-12-31'),('15113','8869461941947',14,'2020-12-09'),('15113','8891491947194',175,'2020-01-18'),('15113','8894194134907',128,'2021-01-15'),('15640','8816169530314',46,'2021-11-14'),('15640','8851351151253',98,'2020-12-25'),('15640','8851362649514',198,'2021-01-19'),('15640','8864596562626',160,'2021-06-13'),('15640','8865296563147',160,'2020-08-16'),('15640','8894194134907',169,'2021-09-20'),('15640','8897461413658',250,'2021-08-26'),('16493','8816169530314',203,'2021-11-06'),('16493','8851362649514',18,'2021-12-04'),('16493','8894194134907',222,'2021-06-19'),('16493','8897461413658',73,'2021-11-10');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 13:46:24
