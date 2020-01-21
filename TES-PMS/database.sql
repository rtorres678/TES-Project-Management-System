CREATE DATABASE `projectmanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE  projectmanagementsystem;

CREATE TABLE `action_item` (
  `ProjectNumber` varchar(15) NOT NULL,
  `WBSCode` varchar(15) NOT NULL,
  `DeliverableCode` varchar(15) NOT NULL,
  `CreationDate` date NOT NULL,
  `PlanDate` date DEFAULT NULL,
  `Actual Date` date DEFAULT NULL,
  `PlanEffort` double DEFAULT NULL,
  `ActualEffort` double DEFAULT NULL,
  `Status` enum('Not Done','Done','Canceled') NOT NULL DEFAULT 'Not Done',
  `Notes` longtext,
  PRIMARY KEY (`ProjectNumber`,`WBSCode`,`DeliverableCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `consultants` (
  `Company` varchar(50) NOT NULL,
  `Street Address` varchar(60) NOT NULL,
  `CityStateZip` varchar(100) NOT NULL,
  `APContact` varchar(100) NOT NULL,
  `Status` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`Company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customers` (
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `deliverables` (
  `ProjectNumber` varchar(15) NOT NULL,
  `WBSCode` varchar(15) NOT NULL,
  `Deliverable Code` varchar(15) NOT NULL,
  `Creation Date` date DEFAULT NULL,
  `Description` longtext,
  `DueDate` date DEFAULT NULL,
  `Billed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `DateBilled` date DEFAULT NULL,
  `InvoiceNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProjectNumber`,`WBSCode`,`Deliverable Code`)
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
  `Trash` longtext,
  PRIMARY KEY (`InvoiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `master file` (
  `Date` text,
  `Project` text,
  `ProjectName` text,
  `Description` text,
  `Revision` text,
  `Phase` int(11) DEFAULT NULL,
  `Amount` text,
  `SubAmount` text,
  `Status` text,
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project` (
  `ProjectNumber` varchar(25) NOT NULL,
  `ProjectCode` varchar(45) NOT NULL,
  `Project Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Client` varchar(45) NOT NULL,
  `PO` double NOT NULL DEFAULT '0',
  `Notes` longtext,
  `Status` enum('Proposal','Active','Rejected','Archive','Collection') NOT NULL,
  `CreationDate` date NOT NULL,
  PRIMARY KEY (`ProjectNumber`),
  UNIQUE KEY `Project Number_UNIQUE` (`ProjectNumber`),
  UNIQUE KEY `Project Code_UNIQUE` (`ProjectCode`),
  UNIQUE KEY `Name_UNIQUE` (`Project Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project_reference` (
  `ProjectNumber` varchar(15) NOT NULL,
  `Reference` longtext,
  PRIMARY KEY (`ProjectNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project_status_changes` (
  `ProjectNumber` varchar(15) NOT NULL,
  `OldStatus` varchar(15) NOT NULL,
  `NewStatus` varchar(15) NOT NULL,
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
  `ProjectNumber` varchar(45) NOT NULL,
  `Creation Date` date NOT NULL,
  `Description` longtext,
  `Fee` double NOT NULL DEFAULT '0',
  `Team` varchar(45) DEFAULT NULL,
  `Status` enum('Completed','Pending','Rejected','Accepted') NOT NULL DEFAULT 'Pending',
  `PercentComplete` int(100) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`WBSCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wbs_reference` (
  `WBSCode` varchar(15) NOT NULL,
  `Reference` longtext,
  PRIMARY KEY (`WBSCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wbs_status_changes` (
  `WBSCode` varchar(15) NOT NULL,
  `Date` date DEFAULT NULL,
  `OldStatus` enum('Completed','Pending','Rejected','Accepted') DEFAULT NULL,
  `NewStatus` enum('Completed','Pending','Rejected','Accepted') DEFAULT NULL,
  `Notes` longtext,
  PRIMARY KEY (`WBSCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
