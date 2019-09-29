CREATE DATABASE `projectmanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE  projectmanagementsystem;
CREATE TABLE `action_item` (
  `Project Number` varchar(15) NOT NULL,
  `WBSCode` varchar(15) NOT NULL,
  `DeliverableCode` varchar(15) NOT NULL,
  `Creation Date` date NOT NULL,
  `Plan Date` date DEFAULT NULL,
  `Actual Date` date DEFAULT NULL,
  `Plan Effort` double DEFAULT NULL,
  `Actual Effort` double DEFAULT NULL,
  `Status` enum('Not Done','Done','Canceled') NOT NULL DEFAULT 'Not Done',
  `Notes` longtext,
  PRIMARY KEY (`Project Number`,`WBSCode`,`DeliverableCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `consultants` (
  `Company` varchar(50) NOT NULL,
  `Street Address` varchar(60) NOT NULL,
  `CityStateZip` varchar(100) NOT NULL,
  `AP Contact` varchar(100) NOT NULL,
  `Status` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`Company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `deliverables` (
  `Project Number` varchar(15) NOT NULL,
  `WBSCode` varchar(15) NOT NULL,
  `Deliverable Code` varchar(15) NOT NULL,
  `Creation Date` date DEFAULT NULL,
  `Description` longtext,
  `Due Date` date DEFAULT NULL,
  `Billed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Date Billed` date DEFAULT NULL,
  `Invoice Number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Project Number`,`WBSCode`,`Deliverable Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `deliverables_changes` (
  `Deliverable Code` varchar(15) NOT NULL,
  `Date` date DEFAULT NULL,
  `Notes` longtext,
  PRIMARY KEY (`Deliverable Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `deliverables_reference` (
  `DeliverableCode` varchar(15) NOT NULL,
  `Reference` longtext,
  PRIMARY KEY (`DeliverableCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoice` (
  `InvoiceNumber` varchar(15) NOT NULL,
  `ProjectNumber` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `Client` varchar(50) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `SubconsultantFee` double NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `WBSCode` varchar(15) NOT NULL,
  `PercentComplete` int(100) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`InvoiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project` (
  `Project Number` varchar(25) NOT NULL,
  `Project Code` varchar(45) NOT NULL,
  `Project Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Client` varchar(45) NOT NULL,
  `PO` double NOT NULL DEFAULT '0',
  `Notes` longtext,
  `Status` enum('Proposal','Active','Rejected','Archive','Collection') NOT NULL,
  `Creation Date` date NOT NULL,
  PRIMARY KEY (`Project Number`),
  UNIQUE KEY `Project Number_UNIQUE` (`Project Number`),
  UNIQUE KEY `Project Code_UNIQUE` (`Project Code`),
  UNIQUE KEY `Name_UNIQUE` (`Project Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project_reference` (
  `Project Number` varchar(15) NOT NULL,
  `Reference` longtext,
  PRIMARY KEY (`Project Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project_status_changes` (
  `ProjectNumber` varchar(15) NOT NULL,
  `Old Status` varchar(15) NOT NULL,
  `New Status` varchar(15) NOT NULL,
  `Date` varchar(15) NOT NULL,
  PRIMARY KEY (`ProjectNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subconsultant` (
  `subconsultantID` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Fee` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`subconsultantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wbs` (
  `WBSCode` varchar(15) NOT NULL,
  `Project Number` varchar(45) NOT NULL,
  `Creation Date` date NOT NULL,
  `Description` longtext,
  `Fee` double NOT NULL DEFAULT '0',
  `Team` varchar(45) DEFAULT NULL,
  `Status` enum('Completed','Pending','Rejected','Accepted') NOT NULL DEFAULT 'Pending',
  `Percent Complete` int(100) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`WBSCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wbs_reference` (
  `WBSCode` varchar(15) NOT NULL,
  `Reference` longtext,
  PRIMARY KEY (`WBSCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
