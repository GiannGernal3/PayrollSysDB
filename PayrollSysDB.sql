CREATE DATABASE `payrolldb`;
USE `payrolldb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: payrollsystem_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendanceNo` int (10) AUTO_INCREMENT,
  `employeeID` int (10) NOT NULL,
  `timeInDate` datetime (6) NULL DEFAULT NULL,
  `timeOutDate` datetime (6) NULL DEFAULT NULL,
  `overtimeHours` time (6) DEFAULT NULL,
  `hoursWorked` time (6) DEFAULT NULL,
  PRIMARY KEY (`attendanceNo`),
  UNIQUE KEY `attendanceNo_UNIQUE` (`attendanceNo`),
  KEY `fk_attendance_employeeID_idx` (`employeeID`),
  CONSTRAINT `fk_attendance_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--


LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductions` (
  `deductionID` int (10) AUTO_INCREMENT UNIQUE,
  `employeeID` int (10) NOT NULL,
  `sssId` int (10) NOT NULL,
  `philHealthId` int (10) NOT NULL,
  `pagIbigId` int (10) NOT NULL,
  `witholdingId` int (10) NOT NULL,
  `grossSalary` float (10) DEFAULT NULL,
  `allowances` float (10) DEFAULT NULL,
  `absences` float (10) DEFAULT NULL,
  PRIMARY KEY (`deductionID`),
  KEY `fk_deductions_employeeID_idx` (`employeeID`),
  KEY `fk_deductions_sssId_idx` (`sssId`),
  KEY `fk_deductions_philHealthId_idx` (`philHealthId`),
  KEY `fk_deductions_pagIbigId_idx` (`pagIbigId`),
  KEY `fk_deductions_witholdingId_idx` (`witholdingId`),
  CONSTRAINT `fk_deductions_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `fk_deductions_sssId` FOREIGN KEY (`sssId`) REFERENCES `ssscontributionmatrix` (`sssId`),
  CONSTRAINT `fk_deductions_philHealthId` FOREIGN KEY (`philHealthId`) REFERENCES `philhealthcontributionmatrix` (`philHealthId`),
  CONSTRAINT `fk_deductions_pagIbigId` FOREIGN KEY (`pagIbigId`) REFERENCES `pagibigcontributionmatrix` (`pagIbigId`),
  CONSTRAINT `fk_deductions_witholdingId` FOREIGN KEY (`witholdingId`) REFERENCES `witholdingtaxmatrix` (`witholdingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int (10) AUTO_INCREMENT,
  `lastName` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL COMMENT 'Might need to change date format then change datatype to DATE',
  `address` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `sssNumber` varchar(12) DEFAULT NULL,
  `philHealthNumber` varchar(12) DEFAULT NULL,
  `tinNumber` varchar(15) DEFAULT NULL,
  `pagIbigNumber` varchar(12) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `immediateSupervisor` varchar(100) DEFAULT NULL,
  `basicSalary` decimal(40,2) DEFAULT NULL,
  `riceSubsidy` decimal(40,2) DEFAULT NULL,
  `phoneAllowance` decimal(40,2) DEFAULT NULL,
  `clothingAllowance` decimal(40,2) DEFAULT NULL,
  `grossSemiMonthlyRate` decimal(40,2) DEFAULT NULL,
  `hourlyRate` decimal(40,2) DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE Employee
ADD loginID INT,
ADD CONSTRAINT fk_loginID
FOREIGN KEY (loginID) REFERENCES login(loginID);
--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Garcia','Manuel III','10/11/1983','Valero Carpark Building Valero Street 1227, Makati City','966-860-270','44-4506057-3','820126853951','442-605-657-000','691295330870','Regular','Chief Executive Officer','N/A',90.00,1.00,2.00,1.00,45.00,536.00),(2,'Lim','Antonio','06/19/1988','San Antonio De Padua 2, Block 1 Lot 8 and 2, Dasmarinas, Cavite','171-867-411','52-2061274-9','331735646338','683-102-776-000','663904995411','Regular','Chief Operating Officer','Garcia, Manuel III',60.00,1.00,2.00,1.00,30.00,357.00),(3,'Aquino','Bianca Sofia','08/04/1989','Rm. 402 4/F Jiao Building Timog Avenue Cor. Quezon Avenue 1100, Quezon City','966-889-370','30-8870406-2','177451189665','971-711-280-000','171519773969','Regular','Chief Finance Officer','Garcia, Manuel III',60.00,1.00,2.00,1.00,30.00,357.00),(4,'Reyes','Isabella','06/16/1994','460 Solanda Street Intramuros 1000, Manila','786-868-477','40-2511815-0','341911411254','876-809-437-000','416946776041','Regular','Chief Marketing Officer','Garcia, Manuel III',60.00,1.00,2.00,1.00,30.00,357.00),(5,'Hernandez','Eduard','09/23/1989','National Highway, Gingoog,  Misamis Occidental','088-861-012','50-5577638-1','957436191812','031-702-374-000','952347222457','Regular','IT Operations and Systems','Lim, Antonio',52.00,1.00,1.00,1.00,26.00,314.00),(6,'Villanueva','Andrea Mae','02/14/1988','17/85 Stracke Via Suite 042, Poblacion, Las PiÃ±as 4783 Dinagat Islands ','918-621-603','49-1632020-8','382189453145','317-674-022-000','441093369646','Regular','HR Manager','Lim, Antonio',52.00,1.00,1.00,1.00,26.00,314.00),(7,'San Jose','Brad ','03/15/1996','99 Strosin Hills, Poblacion, Bislig 5340 Tawi-Tawi','797-009-261','40-2400714-1','239192926939','672-474-690-000','210850209964','Regular','HR Team Leader','Villanueva, Andrea Mae',42.00,1.00,800.00,800.00,21.00,256.00),(8,'Romualdez','Alice','05/14/1992','12A/33 Upton Isle Apt. 420, Roxas City 1814 Surigao del Norte ','983-606-799','55-4476527-2','545652640232','888-572-294-000','211385556888','Regular','HR Rank and File','San, Jose Brad',22.00,1.00,500.00,500.00,11.00,134.00),(9,'Atienza','Rosie ','09/24/1948','90A Dibbert Terrace Apt. 190, San Lorenzo 6056 Davao del Norte','266-036-427','41-0644692-3','708988234853','604-997-793-000','260107732354','Regular','HR Rank and File','San, Jose Brad',22.00,1.00,500.00,500.00,11.00,134.00),(10,'Alvaro','Roderick','03/30/1988','#284 T. Morato corner, Scout Rallos Street, Quezon City','053-381-386','64-7605054-4','578114853194','525-420-419-000','799254095212','Regular','Accounting Head','Aquino, Bianca Sofia ',52.00,1.00,1.00,1.00,26.00,314.00),(11,'Salcedo','Anthony','09/14/1993','93/54 Shanahan Alley Apt. 183, Santo Tomas 1572 Masbate','070-766-300','26-9647608-3','126445315651','210-805-911-000','218002473454','Regular','Payroll Manager','Alvaro, Roderick',50.00,1.00,1.00,1.00,25.00,303.00),(12,'Lopez','Josie ','01/14/1987','49 Springs Apt. 266, Poblacion, Taguig 3200 Occidental Mindoro','478-355-427','44-8563448-3','431709011012','218-489-737-000','113071293354','Regular','Payroll Team Leader','Salcedo, Anthony',38.00,1.00,800.00,800.00,19.00,229.00),(13,'Farala','Martha','01/11/1942','42/25 Sawayn Stream, Ubay 1208 Zamboanga del Norte ','329-034-366','45-5656375-0','233693897247','210-835-851-000','631130283546','Regular','Payroll Rank and File','Salcedo, Anthony',24.00,1.00,500.00,500.00,12.00,143.00),(14,'Martinez','Leila','07/11/1970','37/46 Kulas Roads, Maragondon 0962 Quirino ','877-110-749','27-2090996-4','515741057496','275-792-513-000','101205445886','Regular','Payroll Rank and File','Salcedo, Anthony',24.00,1.00,500.00,500.00,12.00,143.00),(15,'Romualdez','Fredrick ','03/10/1985','22A/52 Lubowitz Meadows, Pililla 4895 Zambales','023-079-009','26-8768374-1','308366860059','598-065-761-000','223057707853','Regular','Account Manager','Lim, Antonio',53.00,1.00,1.00,1.00,26.00,318.00),(16,'Mata','Christian','10/21/1987','90 O\'Keefe Spur Apt. 379, Catigbian 2772 Sulu ','783-776-744','49-2959312-6','824187961962','103-100-522-000','631052853464','Regular','Account Team Leader','Romualdez, Fredrick ',42.00,1.00,800.00,800.00,21.00,256.00),(17,'De Leon','Selena ','02/20/1975','89A Armstrong Trace, Compostela 7874 Maguindanao','975-432-139','27-2090208-8','587272469938','482-259-498-000','719007608464','Regular','Account Team Leader','Romualdez, Fredrick ',41.00,1.00,800.00,800.00,20.00,249.00),(18,'San Jose','Allison ','06/24/1986','08 Grant Drive Suite 406, Poblacion, Iloilo City 9186 La Union','179-075-129','45-3251383-0','745148459521','121-203-336-000','114901859343','Regular','Account Rank and File','Mata, Christian',22.00,1.00,500.00,500.00,11.00,134.00),(19,'Rosario','Cydney ','10/06/1996','93A/21 Berge Points, Tapaz 2180 Quezon','868-819-912','49-1629900-2','579253435499','122-244-511-000','265104358643','Regular','Account Rank and File','Mata, Christian',22.00,1.00,500.00,500.00,11.00,134.00),(20,'Bautista','Mark ','02/12/1991','65 Murphy Center Suite 094, Poblacion, Palayan 5636 Quirino','683-725-348','49-1647342-5','399665157135','273-970-941-000','260054585575','Regular','Account Rank and File','Mata, Christian',23.00,1.00,500.00,500.00,11.00,138.00),(21,'Lazaro','Darlene ','11/25/1985','47A/94 Larkin Plaza Apt. 179, Poblacion, Caloocan 2751 Quirino','740-721-558','45-5617168-2','606386917510','354-650-951-000','104907708845','Probationary','Account Rank and File','Mata, Christian',23.00,1.00,500.00,500.00,11.00,138.00),(22,'Delos Santos','Kolby ','02/26/1980','06A Gulgowski Extensions, Bongabon 6085 Zamboanga del Sur','739-443-033','52-0109570-6','357451271274','187-500-345-000','113017988667','Probationary','Account Rank and File','Mata, Christian',24.00,1.00,500.00,500.00,12.00,143.00),(23,'Santos','Vella ','12/31/1983','99A Padberg Spring, Poblacion, Mabalacat 3959 Lanao del Sur','955-879-269','52-9883524-3','548670482885','101-558-994-000','360028104576','Probationary','Account Rank and File','Mata, Christian',22.00,1.00,500.00,500.00,11.00,134.00),(24,'Del Rosario','Tomas','12/18/1978','80A/48 Ledner Ridges, Poblacion, Kabankalan 8870 Marinduque','882-550-989','45-5866331-6','953901539995','560-735-732-000','913108649964','Probationary','Account Rank and File','Mata, Christian',22.00,1.00,500.00,500.00,11.00,134.00),(25,'Tolentino','Jacklyn ','05/19/1984','96/48 Watsica Flats Suite 734, Poblacion, Malolos 1844 Ifugao','675-757-366','47-1692793-0','753800654114','841-177-857-000','210546661243','Probationary','Account Rank and File','De Leon, Selena',24.00,1.00,500.00,500.00,12.00,143.00),(26,'Gutierrez','Percival ','12/18/1970','58A Wilderman Walks, Poblacion, Digos 5822 Davao del Sur','512-899-876','40-9504657-8','797639382265','502-995-671-000','210897095686','Probationary','Account Rank and File','De Leon, Selena',24.00,1.00,500.00,500.00,12.00,147.00),(27,'Manalaysay','Garfield ','08/28/1986','60 Goyette Valley Suite 219, Poblacion, Tabuk 3159 Lanao del Sur','948-628-136','45-3298166-4','810909286264','336-676-445-000','211274476563','Probationary','Account Rank and File','De Leon, Selena',24.00,1.00,500.00,500.00,12.00,147.00),(28,'Villegas','Lizeth ','12/12/1981','66/77 Mann Views, Luisiana 1263 Dinagat Islands','332-372-215','40-2400719-4','934389652994','210-395-397-000','122238077997','Probationary','Account Rank and File','De Leon, Selena',24.00,1.00,500.00,500.00,12.00,143.00),(29,'Ramos','Carol ','08/20/1978','72/70 Stamm Spurs, Bustos 4550 Iloilo','250-700-389','60-1152206-4','351830469744','395-032-717-000','212141893454','Probationary','Account Rank and File','De Leon, Selena',22.00,1.00,500.00,500.00,11.00,134.00),(30,'Maceda','Emelia ','04/14/1973','50A/83 Bahringer Oval Suite 145, Kiamba 7688 Nueva Ecija','973-358-041','54-1331005-0','465087894112','215-973-013-000','515012579765','Probationary','Account Rank and File','De Leon, Selena',22.00,1.00,500.00,500.00,11.00,134.00),(31,'Aguilar','Delia ','01/27/1989','95 Cremin Junction, Surallah 2809 Cotabato','529-705-439','52-1859253-1','136451303068','599-312-588-000','110018813465','Probationary','Account Rank and File','De Leon, Selena',22.00,1.00,500.00,500.00,11.00,134.00),(32,'Castro','John Rafael','02/09/1992','Hi-way, Yati, Liloan Cebu','332-424-955','26-7145133-4','601644902402','404-768-309-000','697764069311','Regular','Sales & Marketing','Reyes, Isabella',52.00,1.00,1.00,1.00,26.00,314.00),(33,'Martinez','Carlos Ian','11/16/1990','Bulala, Camalaniugan','078-854-208','11-5062972-7','380685387212','256-436-296-000','993372963726','Regular','Supply Chain and Logistics','Reyes, Isabella',52.00,1.00,1.00,1.00,26.00,314.00),(34,'Santos','Beatriz','08/07/1990','Agapita Building, Metro Manila','526-639-511','20-2987501-5','918460050077','911-529-713-000','874042259378','Regular','Customer Service and Relations','Reyes, Isabella',52.00,1.00,1.00,1.00,26.00,314.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `leaveID` int (10) AUTO_INCREMENT UNIQUE,
  `employeeID` int (10) NOT NULL,
  `typeOfLeave` varchar(50) DEFAULT NULL,
  `startDate` timestamp (6) NULL DEFAULT NULL,
  `endDate` timestamp (6) NULL DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `leaveStatus` varchar(50) DEFAULT NULL,
  `leaveDuration` time (6) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  PRIMARY KEY (`leaveID`),
  KEY `fk_leave_employeeID_idx` (`employeeID`),
  CONSTRAINT `fk_leave_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `loginID` int (10) AUTO_INCREMENT ,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`loginID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime`
--

DROP TABLE IF EXISTS `overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtime` (
  `overtimeID` int (10) AUTO_INCREMENT UNIQUE,
  `employeeID` int (10) NOT NULL,
  `attendanceNo` int (10) NOT NULL,
  `overTimeStatus` varchar(50) DEFAULT NULL,
  `overtimeDate` timestamp (6) NULL DEFAULT NULL,
  `overtimeHours` time (6) DEFAULT NULL,
  PRIMARY KEY (`overtimeID`),
  KEY `fk_overtime_employeeID_idx` (`employeeID`),
  KEY `fk_overtime_attendanceNo_idx` (`attendanceNo`),
  CONSTRAINT `fk_overtime_attendanceNo` FOREIGN KEY (`attendanceNo`) REFERENCES `attendance` (`attendanceNo`),
  CONSTRAINT `fk_overtime_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime`
--

LOCK TABLES `overtime` WRITE;
/*!40000 ALTER TABLE `overtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagibigcontributionmatrix`
--

DROP TABLE IF EXISTS `pagibigcontributionmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagibigcontributionmatrix` (
  `pagIbigId` int (10) AUTO_INCREMENT UNIQUE,
  `minSalary` decimal(10,2) DEFAULT NULL,
  `maxSalary` decimal(10,2) DEFAULT NULL,
  `employeeContributionRate` decimal(5,2) DEFAULT NULL,
  `employerContributionRate` decimal(5,2) DEFAULT NULL,
  `totalContributionRate` decimal(5,2) DEFAULT NULL,
  `maxContributionAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pagIbigId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagibigcontributionmatrix`
--

LOCK TABLES `pagibigcontributionmatrix` WRITE;
/*!40000 ALTER TABLE `pagibigcontributionmatrix` DISABLE KEYS */;
INSERT INTO `pagibigcontributionmatrix` VALUES (1,1000.00,1500.00,0.01,0.02,0.03,100.00),(2,1500.01,99999999.99,0.02,0.02,0.04,100.00);
/*!40000 ALTER TABLE `pagibigcontributionmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `philhealthcontributionmatrix`
--

DROP TABLE IF EXISTS `philhealthcontributionmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `philhealthcontributionmatrix` (
  `philHealthId` int (10) AUTO_INCREMENT UNIQUE,
  `minSalary` decimal(10,2) DEFAULT NULL,
  `maxSalary` decimal(10,2) DEFAULT NULL,
  `premiumRate` decimal(5,2) DEFAULT NULL,
  `minMonthlyPremium` decimal(10,2) DEFAULT NULL,
  `maxMonthlyPremium` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`philHealthId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `philhealthcontributionmatrix`
--

LOCK TABLES `philhealthcontributionmatrix` WRITE;
/*!40000 ALTER TABLE `philhealthcontributionmatrix` DISABLE KEYS */;
INSERT INTO `philhealthcontributionmatrix` VALUES (1,0.00,10000.00,0.03,300.00,300.00),(2,10000.01,59999.99,0.03,300.00,1800.00),(3,60000.00,99999999.99,0.03,1800.00,1800.00);
/*!40000 ALTER TABLE `philhealthcontributionmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salaryID` int (10) AUTO_INCREMENT UNIQUE,
  `employeeID` int (10) NOT NULL,
  `attendanceNo` int (10) NOT NULL,
  `deductionID` int (10) NOT NULL,
  `basicSalary` float (10) DEFAULT NULL,
  `grossSalary` float (10) DEFAULT NULL,
  `netSalary` float (10) DEFAULT NULL,
  `deductions` float (10) DEFAULT NULL,
  `allowances` float (10) DEFAULT NULL,
  `hoursWorked` float (10) DEFAULT NULL,
  `overtimePay` float (10) DEFAULT NULL,
  `hourlyRate` float (10) DEFAULT NULL,
  PRIMARY KEY (`salaryID`),
  KEY `fk_salary_attendanceNo_idx` (`attendanceNo`),
  KEY `fk_salary_employeeID_idx` (`employeeID`),
  KEY `fk_salary_deductionID_idx` (`deductionID`),
  CONSTRAINT `fk_salary_attendanceNo` FOREIGN KEY (`attendanceNo`) REFERENCES `attendance` (`attendanceNo`),
  CONSTRAINT `fk_salary_employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `fk_salary_deductionID` FOREIGN KEY (`deductionID`) REFERENCES `deductions` (`deductionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssscontributionmatrix`
--

DROP TABLE IF EXISTS `ssscontributionmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssscontributionmatrix` (
  `sssId` int (10) AUTO_INCREMENT UNIQUE,
  `minSalary` decimal(10,2) DEFAULT NULL,
  `maxSalary` decimal(10,2) DEFAULT NULL,
  `sssContribution` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sssId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssscontributionmatrix`
--

LOCK TABLES `ssscontributionmatrix` WRITE;
/*!40000 ALTER TABLE `ssscontributionmatrix` DISABLE KEYS */;
INSERT INTO `ssscontributionmatrix` VALUES (1,0.00,3249.99,135.00),(2,3250.00,3749.99,157.50),(3,3750.00,4249.99,180.00),(4,4250.00,4749.99,202.50),
(5,4750.00,5249.99,225.00),(6,5250.00,5749.99,247.50),(7,5750.00,6249.99,270.00),(8,6250.00,6749.99,292.50),(9,6750.00,7249.99,315.00),(10,7250.00,7749.99,337.50),
(11,7750.00,8249.99,360.00),(12,8250.00,8749.99,382.50),(13,8750.00,9249.99,405.00),(14,9250.00,9749.99,427.50),(15,9750.00,10249.99,450.00),(16,10250.00,10749.99,472.50),
(17,10750.00,11249.99,495.00),(18,11250.00,11749.99,517.50),(19,11750.00,12249.99,540.00),(20,12250.00,12749.99,562.50),(21,12750.00,13249.99,585.00),(22,13250.00,13749.99,607.50),
(23,13750.00,14249.99,630.00),(24,14250.00,14749.99,652.50),(25,14750.00,15249.99,675.00),(26,15250.00,15749.99,697.50),(27,15750.00,16249.99,720.00),(28,16250.00,16749.99,742.50),
(29,16750.00,17249.99,765.00),(30,17250.00,17749.99,787.50),(31,17750.00,18249.99,810.00),(32,18250.00,18749.99,832.50),(33,18750.00,19249.99,855.00),(34,19250.00,19749.99,877.50),
(35,19750.00,20249.99,900.00),(36,20250.00,20749.99,922.50),(37,20750.00,21249.99,945.00),(38,21250.00,21749.99,967.50),(39,21750.00,22249.99,990.00),(40,22250.00,22749.99,1012.50),
(41,22750.00,23249.99,1035.00),(42,23250.00,23749.99,1057.50),(43,23750.00,24249.99,1080.00),(44,24250.00,24749.99,1102.50),(45,24750.00,99999999.99,1125.00);
/*!40000 ALTER TABLE `ssscontributionmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `witholdingtaxmatrix`
--

DROP TABLE IF EXISTS `witholdingtaxmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `witholdingtaxmatrix` (
  `witholdingId` int (10) AUTO_INCREMENT UNIQUE,
  `minSalary` decimal(10,2) NOT NULL,
  `maxSalary` decimal(10,2) DEFAULT NULL,
  `baseTax` decimal(10,2) DEFAULT '0.00',
  `excessRate` decimal(5,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`witholdingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `witholdingtaxmatrix`
--

LOCK TABLES `witholdingtaxmatrix` WRITE;
/*!40000 ALTER TABLE `witholdingtaxmatrix` DISABLE KEYS */;
INSERT INTO `witholdingtaxmatrix` VALUES (1,0.00,20832.00,0.00,0.00,'No withholding tax'),(2,20833.00,33332.99,0.00,0.20,'20% in excess of 20,833'),
(3,33333.00,66666.99,2500.00,0.25,'2,500 plus 25% in excess of 33,333'),(4,66667.00,166666.99,10833.00,0.30,'10,833 plus 30% in excess of 66,667'),
(5,166667.00,666666.99,40833.33,0.32,'40,833.33 plus 32% in excess over 166,667'),(6,666667.00,99999999.99,200833.33,0.35,'200,833.33 plus 35% in excess of 666,667');
/*!40000 ALTER TABLE `witholdingtaxmatrix` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `attendance` (employeeID, timeInDate, timeOutDate, overtimeHours, hoursWorked)
VALUES
(1, '2024-05-19 08:00:00', '2024-05-19 17:00:00', '01:00:00', '08:00:00'),
(2, '2024-05-19 09:00:00', '2024-05-19 18:00:00', '00:30:00', '07:30:00');

INSERT INTO `leave` (employeeID, typeOfLeave, startDate, endDate, reason, leaveStatus, leaveDuration, credits)
VALUES
(1, 'Sick Leave', '2024-05-01 08:00:00', '2024-05-03 17:00:00', 'Flu', 'Approved', '24:00:00', 10),
(2, 'Vacation Leave', '2024-06-15 08:00:00', '2024-06-20 17:00:00', 'Family vacation', 'Approved', '40:00:00', 5);

INSERT INTO `login` (username, password)
VALUES
('john_doe', 'password123'),
('jane_smith', 'securepass456');

INSERT INTO `overtime` (employeeID, attendanceNo, overTimeStatus, overtimeDate, overtimeHours)
VALUES
(1, 1001, 'Approved', '2024-05-20 18:00:00', '02:00:00'),
(2, 1002, 'Rejected', '2024-05-21 19:00:00', '01:30:00');

INSERT INTO salary (employeeID, attendanceNo, basicSalary, grossSalary, netSalary, deductions, allowances, hoursWorked, overtimePay, hourlyRate)
VALUES
(1, 1001, 30000, 35000, 28000, 7000, 2000, 160, 3000, 200),
(2, 1002, 25000, 28000, 23000, 5000, 3000, 150, 2000, 167);

INSERT INTO deductions (employeeID, sssID, philHealthID, pagIbigID, witholdingId, grossSalary, allowances, absences)
VALUES
(1, 101, 201, 301, 401, 50000.00, 5000.00, 2.0),
(2, 102, 202, 302, 402, 45000.00, 4000.00, 1.0);
