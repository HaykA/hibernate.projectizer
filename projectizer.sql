-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: projectizer
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `taxIdNumber` varchar(45) DEFAULT NULL,
  `street` varchar(45) NOT NULL,
  `houseNumber` varchar(15) NOT NULL,
  `postalIndex` varchar(15) NOT NULL,
  `city` varchar(45) NOT NULL,
  `countryId` tinyint(3) unsigned NOT NULL,
  `websiteUrl` varchar(255) DEFAULT NULL,
  `currencyId` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_company$countryId_idx` (`countryId`),
  CONSTRAINT `fk_company$countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Casio','BE0123456789','Technologiestraat','1','1082','Brussel',1,'http://www.casio-europe.com/nl/',NULL),(2,'Cisco','BE0987654321','De Kleetlaan','6','1831','Diegem',1,'http://www.cisco.com/c/en_be/index.html',NULL),(3,'General Electrics','BE0123789456','Nieuwevaart','51','9000','Gent',1,'http://be.geindustrial.com/',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_contacthyperlink`
--

DROP TABLE IF EXISTS `company_contacthyperlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_contacthyperlink` (
  `companyId` int(9) unsigned NOT NULL,
  `type` enum('FACEBOOK','LINKEDIN','OTHER') NOT NULL,
  `url` varchar(255) NOT NULL,
  `urlText` varchar(255) NOT NULL,
  PRIMARY KEY (`companyId`,`type`,`url`,`urlText`),
  CONSTRAINT `fk_company_contacthyperlink$companyId` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_contacthyperlink`
--

LOCK TABLES `company_contacthyperlink` WRITE;
/*!40000 ALTER TABLE `company_contacthyperlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_contacthyperlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_contactnumber`
--

DROP TABLE IF EXISTS `company_contactnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_contactnumber` (
  `companyId` int(9) unsigned NOT NULL,
  `value` varchar(25) NOT NULL,
  `type` enum('PHONE','MOBILE','FAX') NOT NULL,
  PRIMARY KEY (`companyId`,`value`,`type`),
  CONSTRAINT `fk_company_contactnumber$companyId` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_contactnumber`
--

LOCK TABLES `company_contactnumber` WRITE;
/*!40000 ALTER TABLE `company_contactnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_contactnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `contractorId` int(9) unsigned NOT NULL,
  `projectId` int(9) unsigned NOT NULL,
  `hourSalary` decimal(10,0) DEFAULT NULL,
  `distance` smallint(4) DEFAULT NULL,
  `skill` varchar(25) NOT NULL DEFAULT 'UNKNOWN',
  `date` date NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`contractorId`,`projectId`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_contract$projectId_idx` (`projectId`),
  KEY `fk_contract$contractorId_idx` (`contractorId`),
  CONSTRAINT `fk_contract$contractorId` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contract$projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,4,1,14,18,'home automation','2016-02-08',1),(2,5,1,14,35,'technician','2016-02-09',1),(3,6,1,40,88,'calculator','2016-02-07',1),(4,1,2,50,42,'in-house management','2015-07-01',1);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_cost`
--

DROP TABLE IF EXISTS `contract_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_cost` (
  `contractId` int(9) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(1000) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  KEY `contractId_INDEX` (`contractId`),
  CONSTRAINT `fk_contract_cost$contractId` FOREIGN KEY (`contractId`) REFERENCES `contract` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_cost`
--

LOCK TABLES `contract_cost` WRITE;
/*!40000 ALTER TABLE `contract_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_performance`
--

DROP TABLE IF EXISTS `contract_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_performance` (
  `contractId` int(9) unsigned NOT NULL,
  `date` date NOT NULL,
  `totalQuarterHours` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(512) DEFAULT NULL,
  `hourSalary` decimal(10,0) DEFAULT NULL,
  `distance` smallint(4) DEFAULT NULL,
  `additionalDistance` smallint(4) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  KEY `contractId_INDEX` (`contractId`),
  CONSTRAINT `fk_contract_performance$contractId` FOREIGN KEY (`contractId`) REFERENCES `contract` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_performance`
--

LOCK TABLES `contract_performance` WRITE;
/*!40000 ALTER TABLE `contract_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor`
--

DROP TABLE IF EXISTS `contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `firstname` varchar(45) NOT NULL,
  `secondname` varchar(45) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `houseNumber` varchar(15) DEFAULT NULL,
  `postalIndex` varchar(15) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `countryId` tinyint(3) unsigned NOT NULL,
  `companyId` int(9) unsigned DEFAULT NULL,
  `hourSalary` decimal(10,0) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `languageId` tinyint(3) unsigned DEFAULT NULL,
  `sessionMaxInactiveInterval` smallint(4) DEFAULT '900',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `email_INDEX` (`email`),
  KEY `fk_contractor$countryId` (`countryId`),
  KEY `fk_contractor$languageId_idx` (`languageId`),
  KEY `fk_contractor$companyId_idx` (`companyId`),
  CONSTRAINT `fk_contractor$companyId` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_contractor$countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_contractor$languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor`
--

LOCK TABLES `contractor` WRITE;
/*!40000 ALTER TABLE `contractor` DISABLE KEYS */;
INSERT INTO `contractor` VALUES (1,'mickey.haller@projectizer.com','demo','Mickey','Haller','M',NULL,NULL,'8800',NULL,1,3,NULL,1,NULL,900),(2,'kate.hazeltine@projectizer.com','demo','	Kate','Hazeltine','F',NULL,NULL,'1000',NULL,1,NULL,NULL,1,NULL,900),(3,'delilah.abraham@projectizer.com','demo','Delilah','Abraham','F',NULL,NULL,'2018',NULL,1,NULL,NULL,1,NULL,900),(4,'ben.shepard@projectizer.com','demo','Ben','Shepard','M',NULL,NULL,'1060',NULL,1,NULL,14,1,NULL,900),(5,'yves.gluant@projectizer.com','demo','Yves','Gluant','M',NULL,NULL,'9000',NULL,1,NULL,14,1,NULL,900),(6,'john.smith@casio.com','demo','John','Smith','M',NULL,NULL,'8500',NULL,1,1,40,1,NULL,900);
/*!40000 ALTER TABLE `contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_contacthyperlink`
--

DROP TABLE IF EXISTS `contractor_contacthyperlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_contacthyperlink` (
  `contractorId` int(9) unsigned NOT NULL,
  `type` enum('FACEBOOK','LINKEDIN','OTHER') NOT NULL,
  `url` varchar(255) NOT NULL,
  `urlText` varchar(255) NOT NULL,
  PRIMARY KEY (`contractorId`,`url`,`urlText`,`type`),
  KEY `fk_contractor_contacthyperlink$contractorId_idx` (`contractorId`),
  CONSTRAINT `fk_contractor_contacthyperlink$contractorId` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_contacthyperlink`
--

LOCK TABLES `contractor_contacthyperlink` WRITE;
/*!40000 ALTER TABLE `contractor_contacthyperlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_contacthyperlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_contactnumber`
--

DROP TABLE IF EXISTS `contractor_contactnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_contactnumber` (
  `contractorId` int(9) unsigned NOT NULL,
  `value` varchar(25) NOT NULL,
  `type` enum('PHONE','MOBILE','FAX') NOT NULL,
  PRIMARY KEY (`contractorId`,`value`,`type`),
  KEY `fk_contractor_contactnumber$contractorId_idx` (`contractorId`),
  CONSTRAINT `fk_contractor_contactnumber$contractorId` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_contactnumber`
--

LOCK TABLES `contractor_contactnumber` WRITE;
/*!40000 ALTER TABLE `contractor_contactnumber` DISABLE KEYS */;
INSERT INTO `contractor_contactnumber` VALUES (1,'0412 34 56 78','PHONE'),(1,'051 23 45 67','MOBILE'),(2,'0412 34 56 77','MOBILE');
/*!40000 ALTER TABLE `contractor_contactnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_profile`
--

DROP TABLE IF EXISTS `contractor_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_profile` (
  `contractorId` int(9) unsigned NOT NULL,
  `skillId` smallint(5) unsigned NOT NULL,
  `degree` enum('UNKNOWN','LEARNER','JUNIOR','SENIOR','EXPERT') NOT NULL,
  PRIMARY KEY (`contractorId`,`skillId`),
  KEY `fk_contractor_profile$skillId_idx` (`skillId`),
  CONSTRAINT `fk_contractor_profile` FOREIGN KEY (`skillId`) REFERENCES `skill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_contractor_profile$contractorId` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_profile`
--

LOCK TABLES `contractor_profile` WRITE;
/*!40000 ALTER TABLE `contractor_profile` DISABLE KEYS */;
INSERT INTO `contractor_profile` VALUES (4,1,'SENIOR'),(5,2,'SENIOR');
/*!40000 ALTER TABLE `contractor_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `shortname` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `shortname_UNIQUE` (`shortname`),
  KEY `name_INDEX` (`name`),
  KEY `shortname_INDEX` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Belgium','BE'),(2,'Netherlands','NL'),(3,'France','FR'),(4,'Germany','DE'),(5,'Luxembourg','LU'),(6,'Austria','AT'),(7,'United Kingdom','GB');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(9) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `secondname` varchar(45) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `houseNumber` varchar(15) DEFAULT NULL,
  `postalIndex` varchar(15) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `countryId` tinyint(3) unsigned DEFAULT NULL,
  `companyId` int(9) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `languageId` tinyint(3) unsigned DEFAULT NULL,
  `sessionMaxInactiveInterval` smallint(4) DEFAULT '900',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `email_INDEX` (`email`),
  KEY `fk_customer$countryId_idx` (`countryId`),
  KEY `fk_customer$companyId_idx` (`companyId`),
  CONSTRAINT `fk_customer$companyId` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customer$countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customer$languageId` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'hayk@live.be','demo','Hayk','AVETISYAN','M',NULL,NULL,NULL,NULL,NULL,2,1,NULL,900);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contacthyperlink`
--

DROP TABLE IF EXISTS `customer_contacthyperlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contacthyperlink` (
  `customerId` int(9) unsigned NOT NULL,
  `type` enum('FACEBOOK','LINKEDIN','OTHER') NOT NULL,
  `url` varchar(255) NOT NULL,
  `urlText` varchar(255) NOT NULL,
  PRIMARY KEY (`customerId`,`type`,`url`,`urlText`),
  KEY `fk_customer_contacthyperlink_idx` (`customerId`),
  CONSTRAINT `fk_customer_contacthyperlink$customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contacthyperlink`
--

LOCK TABLES `customer_contacthyperlink` WRITE;
/*!40000 ALTER TABLE `customer_contacthyperlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contacthyperlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contactlanguage`
--

DROP TABLE IF EXISTS `customer_contactlanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contactlanguage` (
  `customerId` int(9) unsigned NOT NULL,
  `contactLanguageId` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`customerId`,`contactLanguageId`),
  KEY `fk_customer_contactlanguage$languageId_idx` (`contactLanguageId`),
  CONSTRAINT `fk_customer_contactlanguage$customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_contactlanguage$languageId` FOREIGN KEY (`contactLanguageId`) REFERENCES `language` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contactlanguage`
--

LOCK TABLES `customer_contactlanguage` WRITE;
/*!40000 ALTER TABLE `customer_contactlanguage` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contactlanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contactnumber`
--

DROP TABLE IF EXISTS `customer_contactnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contactnumber` (
  `customerId` int(9) unsigned NOT NULL,
  `value` varchar(25) NOT NULL,
  `type` enum('PHONE','MOBILE','FAX') NOT NULL,
  KEY `fk_customer_contactnumber$customerId_idx` (`customerId`),
  CONSTRAINT `fk_customer_contactnumber$customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contactnumber`
--

LOCK TABLES `customer_contactnumber` WRITE;
/*!40000 ALTER TABLE `customer_contactnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contactnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `shortname` varchar(2) NOT NULL,
  `nativename` varchar(45) NOT NULL,
  `nativeShortname` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `shortname_UNIQUE` (`shortname`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `name_INDEX` (`name`),
  KEY `shortname_INDEX` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English','EN','English','ENG'),(2,'Dutch','NL','Nederlands','NED'),(3,'French','FR','Français','FRA'),(4,'German','DE','Deutsch','DEU'),(5,'Rusian','RU','Русский','РУС'),(6,'Armenian','HY','Հայերեն','ՀԱՅ');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(9) unsigned NOT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `budget` decimal(10,0) NOT NULL DEFAULT '0',
  `creationDate` date NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `houseNumber` varchar(15) DEFAULT NULL,
  `postalIndex` varchar(15) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `countryId` tinyint(3) unsigned NOT NULL,
  `customerId` int(9) unsigned NOT NULL,
  `managerId` int(9) unsigned DEFAULT NULL,
  `status` enum('CREATED','VIEWED','APPROVED','DISPUTED','PROCESSING','FINALIZED','CANCELLED') NOT NULL DEFAULT 'CREATED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_project$customerId_idx` (`customerId`),
  KEY `fk_project$managerId_idx` (`managerId`),
  KEY `fk_project$countryId_idx` (`countryId`),
  CONSTRAINT `fk_project$countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_project$customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project$managerId` FOREIGN KEY (`managerId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'A0001','Homerus','Et nec choro dignissim. Vel ad veritus complectitur. Nec ne dicat docendi lobortis, stet instructior interpretaris et his, ad enim propriae gubergren mel. Cu posse viderer democritum pro, nostrud signiferumque no eum, hinc nonumes fuisset pri ea. In postea iriure persequeris ius.',0,'2016-02-02','2016-09-08','2016-12-31','Vooruitgangstraat','172','1000','Brussel',1,1,3,'DISPUTED'),(2,'A0002','Cleopatra','Nibh semper id usu. Quodsi debitis ea qui, tota persequeris an est, vidisse denique evertitur ad qui. His illum deleniti platonem te. Sensibus reprimique his cu, liber nostrud erroribus cu mei. Ut illum expetendis concludaturque nam.',1500,'2016-04-03',NULL,NULL,'Noordstraat','53','2018','Antwerpen',1,1,2,'PROCESSING'),(3,'A0003','Nostradamus','Ut vel atqui movet partem, an est amet magna rebum. Ne tollit luptatum deterruisset quo, eos imperdiet accommodare in. Vis duis voluptatum ex, ad eos persius salutatus. Per ut eruditi civibus indoctum. Ad quo utinam maiorum denique, ad ceteros consetetur est, mei habeo euripidis in. Qui tota singulis at, eu his velit falli.',500,'2015-10-07','2015-11-02','2015-12-25','Belliardstraat','25','1040','Brussel',1,1,1,'CANCELLED');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_assistant`
--

DROP TABLE IF EXISTS `project_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_assistant` (
  `projectId` int(9) unsigned NOT NULL,
  `contractorId` int(9) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`contractorId`),
  KEY `fk_project_assistant$contractorId_idx` (`contractorId`),
  CONSTRAINT `fk_project_assistant$contractorId` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project_assistant$projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_assistant`
--

LOCK TABLES `project_assistant` WRITE;
/*!40000 ALTER TABLE `project_assistant` DISABLE KEYS */;
INSERT INTO `project_assistant` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `project_assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `name_INDEX` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'home automation',NULL),(2,'technician',NULL),(3,'calculator',NULL);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `sss` smallint(4) NOT NULL AUTO_INCREMENT,
  `testcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sss`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (999,'ss'),(1000,'ee'),(9999,'tt'),(10000,'s');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `secondname` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `houseNumber` varchar(15) NOT NULL,
  `postalIndex` varchar(15) NOT NULL,
  `city` varchar(45) NOT NULL,
  `countryId` tinyint(3) unsigned NOT NULL,
  `password` varchar(150) NOT NULL,
  `active` tinyint(1) unsigned DEFAULT '1',
  `languageId` tinyint(3) unsigned DEFAULT NULL,
  `sessionMaxInactiveInterval` smallint(4) unsigned DEFAULT '900',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user$countryId_idx` (`countryId`),
  KEY `fk_user$languageId_idx` (`languageId`),
  CONSTRAINT `fk_user$countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user$languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 13:06:32
