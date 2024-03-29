-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: maintenancedb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `maintenanceplans`
--

DROP TABLE IF EXISTS `maintenanceplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceplans` (
  `PlanID` int NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LastMaintenanceDate` date DEFAULT NULL,
  `NextMaintenanceDate` date DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AssignedTechnicianID` int DEFAULT NULL,
  `maintenanceplansReport` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='LastMaintenanceDate: เธงเธฑเธเธ—เธตเนเธ—เธณเธเธฒเธฃเธเนเธญเธกเธเธณเธฃเธธเธเธเธฃเธฑเนเธเธฅเนเธฒเธชเธธเธ”\nNextMaintenanceDate: เธงเธฑเธเธ—เธตเนเธ—เธณเธเธฒเธฃเธเนเธญเธกเธเธณเธฃเธธเธเธเธฃเธฑเนเธเธ–เธฑเธ”เนเธ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceplans`
--

LOCK TABLES `maintenanceplans` WRITE;
/*!40000 ALTER TABLE `maintenanceplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenanceplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productwithdrawals`
--

DROP TABLE IF EXISTS `productwithdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productwithdrawals` (
  `WithdrawalID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `WithdrawalDate` date DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WithdrawalID`),
  KEY `ItemID` (`ItemID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `productwithdrawals_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `supplieslist` (`ItemID`),
  CONSTRAINT `productwithdrawals_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `technicianworkers` (`TechnicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productwithdrawals`
--

LOCK TABLES `productwithdrawals` WRITE;
/*!40000 ALTER TABLE `productwithdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `productwithdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequests`
--

DROP TABLE IF EXISTS `servicerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequests` (
  `idServiceRequests` int NOT NULL,
  `CustomerID` varchar(15) DEFAULT NULL COMMENT 'CustomerID: เธฃเธซเธฑเธชเธซเธฃเธทเธญเธซเธกเธฒเธขเน€เธฅเธเธญเนเธฒเธเธญเธดเธเธเธญเธเธฅเธนเธเธเนเธฒเธ—เธตเนเน€เธเธตเนเธขเธงเธเนเธญเธเธเธฑเธเธเธณเธเธญเธเธฃเธดเธเธฒเธฃ',
  `ServiceType` varchar(15) DEFAULT NULL COMMENT 'เธเนเธญเธกเธเธณเธฃเธธเธ: เน€เธเธตเนเธขเธงเธเธฑเธเธเธฒเธเธเนเธญเธกเนเธเธกเธซเธฃเธทเธญเธเธณเธฃเธธเธเธฃเธฑเธเธฉเธฒเธญเธฒเธเธฒเธฃเธซเธฃเธทเธญเธชเธดเนเธเธเนเธญเธชเธฃเนเธฒเธ\nRepair and Maintenance\n\nเธเธฃเธดเธเธฒเธฃเธเนเธญเธกเนเธเธก: เน€เธเธตเนเธขเธงเธเธฑเธเธเธฒเธเธเนเธญเธกเนเธเธกเธ—เธฑเนเธงเนเธ เนเธกเนเธงเนเธฒเธเธฐเน€เธเนเธเน€เธเธญเธฃเนเธเธดเน€เธเธญเธฃเน, เธญเธธเธเธเธฃเธ“เนเนเธเธเนเธฒ, เธซเธฃเธทเธญเธญเธทเนเธ เน\nRepair Services\n\nเธ•เธดเธ”เธ•เธฑเนเธ: เน€เธเธตเนเธขเธงเธเธฑเธเธเธฒเธฃเธ•เธดเธ”เธ•เธฑเนเธเธญเธธเธเธเธฃเธ“เนเธซเธฃเธทเธญเธญเธธเธเธเธฃเธ“เนเน€เธเธดเนเธกเน€เธ•เธดเธกเนเธเธญเธฒเธเธฒเธฃ\nInstallation Services\n',
  `Description` text,
  `RequestDate` varchar(15) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL COMMENT ' "เธฃเธญเธ”เธณเน€เธเธดเธเธเธฒเธฃ", "เธเธณเธฅเธฑเธเธ”เธณเน€เธเธดเธเธเธฒเธฃ", "เน€เธชเธฃเนเธเธชเธดเนเธ" ',
  `AssignedTechnicianID` varchar(15) DEFAULT NULL,
  `DueDate` varchar(15) DEFAULT NULL COMMENT 'เธงเธฑเธเธ—เธตเนเธซเธฃเธทเธญเน€เธงเธฅเธฒเธ—เธตเนเธเธณเธซเธเธ”เนเธซเนเธ—เธณเธเธฒเธเธซเธฃเธทเธญเธเธดเธเธเธฃเธฃเธกเนเธ” เน',
  `CompletionDate` varchar(15) DEFAULT NULL,
  `RepairReport` text,
  PRIMARY KEY (`idServiceRequests`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequests`
--

LOCK TABLES `servicerequests` WRITE;
/*!40000 ALTER TABLE `servicerequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplieslist`
--

DROP TABLE IF EXISTS `supplieslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplieslist` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(255) NOT NULL,
  `Description` text,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ItemID: เน€เธเนเธเธฃเธซเธฑเธชเธซเธฃเธทเธญเนเธญเธ”เธตเธเธญเธเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธ เนเธ”เธขเธกเธตเธเธฒเธฃเธเธณเธซเธเธ”เนเธซเนเน€เธเธดเนเธกเธเธถเนเธเนเธ”เธขเธญเธฑเธ•เนเธเธกเธฑเธ•เธด (AUTO_INCREMENT) เนเธฅเธฐเน€เธเนเธ Primary Key\\nItemName: เน€เธเนเธเธเธทเนเธญเธเธญเธเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธ\\nDescription: เน€เธเนเธเธเธณเธญเธเธดเธเธฒเธขเน€เธเธตเนเธขเธงเธเธฑเธเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธ (เธชเธฒเธกเธฒเธฃเธ–เน€เธเนเธเธเนเธญเธเธงเธฒเธกเธขเธฒเธงเนเธ”เน)\\nQuantity: เน€เธเนเธเธเธณเธเธงเธเธเธญเธเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธเธ—เธตเนเธกเธตเธญเธขเธนเน\\nUnitPrice: เน€เธเนเธเธฃเธฒเธเธฒเธ•เนเธญเธซเธเนเธงเธขเธเธญเธเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธ\\nCreatedDate: เน€เธเนเธเธงเธฑเธเธ—เธตเนเนเธฅเธฐเน€เธงเธฅเธฒเธ—เธตเนเน€เธเธดเนเธกเธเนเธญเธกเธนเธฅเธฃเธฒเธขเธเธฒเธฃเธงเธฑเธชเธ”เธธเธฅเธเนเธเธเธฒเธเธเนเธญเธกเธนเธฅ (เน€เธฃเธฒเนเธเน TIMESTAMP เนเธฅเธฐเธเธณเธซเธเธ”เนเธซเนเธเนเธฒเน€เธฃเธดเนเธกเธ•เนเธเน€เธเนเธเธเธฑเธเธเธธเธเธฑเธเนเธ”เธขเนเธเน CURRENT_TIMESTAMP)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplieslist`
--

LOCK TABLES `supplieslist` WRITE;
/*!40000 ALTER TABLE `supplieslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplieslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicianworkers`
--

DROP TABLE IF EXISTS `technicianworkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technicianworkers` (
  `TechnicianID` int NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Surname` varchar(25) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone number` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Salary` varchar(25) DEFAULT NULL,
  `WorkingDaysPerMonth` int DEFAULT NULL,
  `WorkingDaysPerYear` int DEFAULT NULL,
  PRIMARY KEY (`TechnicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicianworkers`
--

LOCK TABLES `technicianworkers` WRITE;
/*!40000 ALTER TABLE `technicianworkers` DISABLE KEYS */;
/*!40000 ALTER TABLE `technicianworkers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-04 18:17:04
