-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: labstocks_db
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1

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
-- Table structure for table `ab_avail`
--

DROP TABLE IF EXISTS `ab_avail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_avail` (
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_avail`
--

LOCK TABLES `ab_avail` WRITE;
/*!40000 ALTER TABLE `ab_avail` DISABLE KEYS */;
INSERT INTO `ab_avail` VALUES ('available'),('out of stock');
/*!40000 ALTER TABLE `ab_avail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_host`
--

DROP TABLE IF EXISTS `ab_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_host` (
  `Host` varchar(50) NOT NULL,
  PRIMARY KEY (`Host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_host`
--

LOCK TABLES `ab_host` WRITE;
/*!40000 ALTER TABLE `ab_host` DISABLE KEYS */;
INSERT INTO `ab_host` VALUES ('goat'),('horse'),('mouse'),('rabbit');
/*!40000 ALTER TABLE `ab_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_monopoly`
--

DROP TABLE IF EXISTS `ab_monopoly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_monopoly` (
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_monopoly`
--

LOCK TABLES `ab_monopoly` WRITE;
/*!40000 ALTER TABLE `ab_monopoly` DISABLE KEYS */;
INSERT INTO `ab_monopoly` VALUES ('monoclonal'),('polyclonal');
/*!40000 ALTER TABLE `ab_monopoly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_supplier`
--

DROP TABLE IF EXISTS `ab_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_supplier` (
  `Supplier` varchar(50) NOT NULL,
  PRIMARY KEY (`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_supplier`
--

LOCK TABLES `ab_supplier` WRITE;
/*!40000 ALTER TABLE `ab_supplier` DISABLE KEYS */;
INSERT INTO `ab_supplier` VALUES ('Abcam'),('ActiveMotif'),('Covance/Eurogentec'),('Diagenode'),('MPBiomedicals'),('Sigma'),('Upstate/Millipore');
/*!40000 ALTER TABLE `ab_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_type`
--

DROP TABLE IF EXISTS `ab_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_type` (
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_type`
--

LOCK TABLES `ab_type` WRITE;
/*!40000 ALTER TABLE `ab_type` DISABLE KEYS */;
INSERT INTO `ab_type` VALUES ('monoclonal'),('polyclonal');
/*!40000 ALTER TABLE `ab_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antibodies`
--

DROP TABLE IF EXISTS `antibodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antibodies` (
  `id` int(15) NOT NULL,
  `Antigen` varchar(150) NOT NULL,
  `InStock` varchar(25) NOT NULL,
  `Date` date DEFAULT NULL,
  `Comments` longtext,
  `Host` varchar(40) DEFAULT NULL,
  `Ordered_by` varchar(50) DEFAULT NULL,
  `Type` varchar(40) NOT NULL,
  `Batch_Reference` varchar(40) DEFAULT NULL,
  `Supplier` varchar(40) NOT NULL,
  `Location` varchar(40) NOT NULL,
  `Dilution-WB` text NOT NULL,
  `Volume-ChIP` text NOT NULL,
  `ProductID` varchar(20) NOT NULL,
  `storage_minus20freezers` varchar(100) DEFAULT NULL,
  `storage_minus80freezers` varchar(100) DEFAULT NULL,
  `storage_fridges` varchar(100) DEFAULT NULL,
  `storage_rooms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Ordered_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antibodies`
--

LOCK TABLES `antibodies` WRITE;
/*!40000 ALTER TABLE `antibodies` DISABLE KEYS */;
INSERT INTO `antibodies` VALUES (1,'Actin C4','available','2008-09-11','used for WB control, do not use as control in case of TSA treatment: TSA is known to reduce actin expression.','mouse','Gael.Y','monoclonal','9045J','MPBiomedicals','Boite Ac Primaires#1 / Tiroir #3','1:20000','','69100',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `antibodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_name`
--

DROP TABLE IF EXISTS `cl_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_name` (
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `origin` longtext,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_name`
--

LOCK TABLES `cl_name` WRITE;
/*!40000 ALTER TABLE `cl_name` DISABLE KEYS */;
INSERT INTO `cl_name` VALUES ('LCL_e','EBV-transformed B cell from Evelyne Manet','gift from Evelyne Manet','LCL'),('LCL_GFP','LCL with GFP on ...','Home made','LCL');
/*!40000 ALTER TABLE `cl_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_passages`
--

DROP TABLE IF EXISTS `cl_passages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_passages` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `passage` longtext,
  `date_of_freezing` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_passages`
--

LOCK TABLES `cl_passages` WRITE;
/*!40000 ALTER TABLE `cl_passages` DISABLE KEYS */;
INSERT INTO `cl_passages` VALUES (1,'LCL_GFP','3','2014-02-18'),(2,'LCL_e','n+10','2014-02-19');
/*!40000 ALTER TABLE `cl_passages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_storage`
--

DROP TABLE IF EXISTS `cl_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_storage` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `container` varchar(50) DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `box` varchar(50) DEFAULT NULL,
  `field_y` varchar(50) DEFAULT NULL,
  `field_x` varchar(50) DEFAULT NULL,
  `cl_passages` int(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_storage`
--

LOCK TABLES `cl_storage` WRITE;
/*!40000 ALTER TABLE `cl_storage` DISABLE KEYS */;
INSERT INTO `cl_storage` VALUES (1,'1','1','1','A','1',NULL),(2,'1','1','1','A','2',NULL),(3,'1','1','1','B','1',NULL),(4,'1','1','1','B','2',NULL),(5,'1','1','1','B','3',NULL),(6,'1','1','1','C','1',NULL),(7,'1','1','1','C','2',NULL),(8,'1','1','1','C','3',NULL),(9,'1','1','1','C','4',NULL),(10,'1','1','1','D','1',NULL),(11,'1','1','1','D','2',NULL),(12,'1','1','1','D','3',NULL),(13,'1','1','1','D','4',NULL),(14,'1','1','1','D','5',NULL),(15,'1','1','1','E','1',NULL),(16,'1','1','1','E','2',NULL),(17,'1','1','1','E','3',NULL),(18,'1','1','1','E','4',NULL),(19,'1','1','1','E','5',NULL),(20,'1','1','1','E','6',NULL),(21,'1','1','1','F','1',NULL),(22,'1','1','1','F','2',NULL),(23,'1','1','1','F','3',NULL),(24,'1','1','1','F','4',NULL),(25,'1','1','1','F','5',NULL),(26,'1','1','1','F','6',NULL),(27,'1','1','1','F','7',NULL),(28,'1','1','1','G','1',NULL),(29,'1','1','1','G','2',NULL),(30,'1','1','1','G','3',NULL),(31,'1','1','1','G','4',NULL),(32,'1','1','1','G','5',NULL),(33,'1','1','1','G','6',NULL),(34,'1','1','1','G','7',NULL),(35,'1','1','1','G','8',NULL),(36,'1','1','1','H','1',NULL),(37,'1','1','1','H','2',NULL),(38,'1','1','1','H','3',NULL),(39,'1','1','1','H','4',NULL),(40,'1','1','1','H','5',NULL),(41,'1','1','1','H','6',NULL),(42,'1','1','1','H','7',NULL),(43,'1','1','1','H','8',NULL),(44,'1','1','1','H','9',NULL),(45,'1','1','1','I','1',NULL),(46,'1','1','1','I','2',NULL),(47,'1','1','1','I','3',NULL),(48,'1','1','1','I','4',NULL),(49,'1','1','1','I','5',NULL),(50,'1','1','1','I','6',NULL),(51,'1','1','1','I','7',NULL),(52,'1','1','1','I','8',NULL),(53,'1','1','1','I','9',NULL),(54,'1','1','1','I','10',NULL),(55,'1','1','1','J','1',NULL),(56,'1','1','1','J','2',NULL),(57,'1','1','1','J','3',NULL),(58,'1','1','1','J','4',NULL),(59,'1','1','1','J','5',NULL),(60,'1','1','1','J','6',NULL),(61,'1','1','1','J','7',NULL),(62,'1','1','1','J','8',NULL),(63,'1','1','1','J','9',NULL),(64,'1','1','1','K','1',NULL),(65,'1','1','1','K','2',NULL),(66,'1','1','1','K','3',NULL),(67,'1','1','1','K','4',NULL);
/*!40000 ALTER TABLE `cl_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_type`
--

DROP TABLE IF EXISTS `cl_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_type` (
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_type`
--

LOCK TABLES `cl_type` WRITE;
/*!40000 ALTER TABLE `cl_type` DISABLE KEYS */;
INSERT INTO `cl_type` VALUES ('HEK293'),('HeLa'),('LCL');
/*!40000 ALTER TABLE `cl_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_members`
--

DROP TABLE IF EXISTS `lab_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_members` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_members`
--

LOCK TABLES `lab_members` WRITE;
/*!40000 ALTER TABLE `lab_members` DISABLE KEYS */;
INSERT INTO `lab_members` VALUES ('Christelle.D'),('Florent.C'),('Gael.Y'),('Gift.or.Purchased'),('Helene.B');
/*!40000 ALTER TABLE `lab_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notebooks`
--

DROP TABLE IF EXISTS `notebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notebooks` (
  `ID` int(15) unsigned NOT NULL,
  `Begin_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Author` varchar(50) NOT NULL,
  `Serial_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial_Number` (`Serial_Number`),
  KEY `Author` (`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notebooks`
--

LOCK TABLES `notebooks` WRITE;
/*!40000 ALTER TABLE `notebooks` DISABLE KEYS */;
INSERT INTO `notebooks` VALUES (1,'2005-04-01','2006-01-31','Gael.Y','GY8'),(2,'2005-05-24','2005-12-07','Christelle.D','CD1'),(3,'2008-01-16','0000-00-00','Helene.B','EVO'),(4,'2009-07-06','2010-01-19','Helene.B','B49069'),(5,'2012-09-03','0000-00-00','Florent.C','E002933');
/*!40000 ALTER TABLE `notebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olig_purif`
--

DROP TABLE IF EXISTS `olig_purif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olig_purif` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olig_purif`
--

LOCK TABLES `olig_purif` WRITE;
/*!40000 ALTER TABLE `olig_purif` DISABLE KEYS */;
INSERT INTO `olig_purif` VALUES (''),('Gold'),('HPLC'),('PAGE'),('SePoP');
/*!40000 ALTER TABLE `olig_purif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oligos`
--

DROP TABLE IF EXISTS `oligos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oligos` (
  `id` char(15) NOT NULL,
  `Sequence` varchar(150) NOT NULL,
  `Date_` date DEFAULT NULL,
  `Description` longtext,
  `PCR_conditions_predicted` longtext,
  `Author` varchar(50) DEFAULT NULL,
  `Purif` varchar(40) NOT NULL,
  `storage_minus20freezers` varchar(100) DEFAULT NULL,
  `storage_minus80freezers` varchar(100) DEFAULT NULL,
  `storage_fridges` varchar(100) DEFAULT NULL,
  `storage_rooms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Author`),
  CONSTRAINT `oligos_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oligos`
--

LOCK TABLES `oligos` WRITE;
/*!40000 ALTER TABLE `oligos` DISABLE KEYS */;
INSERT INTO `oligos` VALUES ('1C09','cttaatgcgccgctacaggg','2006-10-05','to screen bacteria for cloning of GAL3 fragment into pRS306','  #1: Product of length 475 (rating: 171)\r\n      Contains region of the molecule from 4048 to 4522\r\n      Tm: 80.5 C  TaOpt: 58.6 C  GC: 53.7\r\n    Sense Primer:\r\n      CTTAATGCGCCGCTACAGGG\r\n      Similarity: 100.0%\r\n      Length: 20  Tm: 57.2 C  GC: 60.0\r\n      dH: -170.4 kcal/mol  dS: -437.5 cal/mol  dG: -38.2 kcal/mol\r\n    Antisense Primer:\r\n      GCTACTGCGACTCTTAGGGCCAAT\r\n      Similarity: 100.0%\r\n      Length: 24  Tm: 58.9 C  GC: 54.17\r\n      dH: -191.8 kcal/mol  dS: -495.6 cal/mol  dG: -42.3 kcal/mol\r\n    Tm Difference: 1.8\r\n    GC Difference: 5.8\r\n','Gael.Y','',NULL,NULL,NULL,NULL),('1F14','gtgatgacggtgaaaacctc','2009-09-07','Upstream selection marker in pSH* plasmids.','','Gael.Y','',NULL,NULL,NULL,NULL),('1F19','ataagggcgacacggaaatg','2009-10-12','To sequence CEN/ARS of pCEN-AdeAru','','Gael.Y','',NULL,NULL,NULL,NULL),('1F97','tgtaacccactcgtgcac','2010-03-01','To sequence any plasmid from the AmpR coding sequence.','','Gael.Y','SePoP',NULL,NULL,NULL,NULL),('1H75','cactatagggcgaattgg','2011-01-06','To amplify yEGFP-CYC1term from pGY8 and clone it into pCM183 by homologous recombination in yeast.','','Gael.Y','SePoP',NULL,NULL,NULL,NULL),('1I97','atttagagcttgacggggaaagcc','2013-03-28','For Laser Game mutagenesis of Cre-VVD II.','Taille du fragment amplifié : 1531 nucl.\r\nGC% : 46%\r\nTempérature d\'hybridation suggérée (TA) : 57°C\r\nAmorce sens : 1I96\r\nAmorce anti-sens : 1I97\r\n\r\nPrimer: 1I96 (1) 5\' tacctgttttgccgggtcagaa 3\' (22)\r\n                    ||||||||||||||||||||||\r\nTarget:   (4077) 5\' tacctgttttgccgggtcagaa 3\' (4099)\r\nscore : 178\r\nTM : 58\r\n\r\n\r\nPrimer: 1I97[compl.] (24)  \r\n3\' ggctttccccgtcaagctctaaat 5\' (1)\r\n                                  ||||||||||||||||||||||||\r\nTarget:              (5584) \r\n5\' ggctttccccgtcaagctctaaat 3\' (5608)\r\nscore : 180\r\nTM : 59\r\n\r\nTarget= pGY286','Helene.B','SePoP',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oligos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_events`
--

DROP TABLE IF EXISTS `pip_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_events` (
  `Events` varchar(100) NOT NULL,
  PRIMARY KEY (`Events`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_events`
--

LOCK TABLES `pip_events` WRITE;
/*!40000 ALTER TABLE `pip_events` DISABLE KEYS */;
INSERT INTO `pip_events` VALUES ('Change Usage'),('Change User'),('Discard'),('Maintenance'),('Misc'),('Purchase');
/*!40000 ALTER TABLE `pip_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_generic_user`
--

DROP TABLE IF EXISTS `pip_generic_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_generic_user` (
  `User` varchar(100) NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_generic_user`
--

LOCK TABLES `pip_generic_user` WRITE;
/*!40000 ALTER TABLE `pip_generic_user` DISABLE KEYS */;
INSERT INTO `pip_generic_user` VALUES ('Christelle.D'),('Everybody'),('Standby'),('Student');
/*!40000 ALTER TABLE `pip_generic_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_history`
--

DROP TABLE IF EXISTS `pip_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_history` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Serial_Number` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Owner_fromNowOn` varchar(50) NOT NULL,
  `Usage_fromNowOn` varchar(50) NOT NULL,
  `Event_Type` varchar(100) NOT NULL,
  `Comments` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_history`
--

LOCK TABLES `pip_history` WRITE;
/*!40000 ALTER TABLE `pip_history` DISABLE KEYS */;
INSERT INTO `pip_history` VALUES (1,'Y60538M','2005-00-00','Christelle.D','Misc','Purchase',''),(2,'Y60538M','2006-00-00','Helene.B','Misc','Change User','Previous user: Christelle Damon'),(3,'Y60538M','2009-03-04','Helene.B','Misc','Maintenance','Change of parts (spring was broken 2009_02_12)'),(4,'Y58817M','2005-00-00','Christelle.D','Misc','Purchase',''),(5,'Y58817M','2006-00-00','Helene.B','Misc','Change User','Previous user: Christelle Damon'),(6,'Y58817M','2009-03-04','Helene.B','Misc','Maintenance','Change of parts '),(7,'Y63235M','2005-00-00','Christelle.D','Misc','Purchase',''),(8,'Y63235M','2009-03-04','Helene.B','Misc','Maintenance',''),(9,'Y63235M','2006-00-00','Helene.B','Misc','Change User','Previous user: Christelle Damon'),(10,'Z64108A','2005-00-00','Christelle.D','Misc','Purchase',''),(11,'Z64108A','2006-00-00','Helene.B','Misc','Change User','Previous user: Christelle Damon'),(12,'Z64108A','2009-03-04','Helene.B','Misc','Maintenance',''),(13,'2102895','2005-09-01','Everybody','Misc','Purchase',''),(14,'6133327','2007-03-02','Everybody','Misc','Purchase',''),(15,'Z64108A','2011-02-18','Andri.Leonidou','Misc','Change User','Previous user: Christelle Damon');
/*!40000 ALTER TABLE `pip_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_marque`
--

DROP TABLE IF EXISTS `pip_marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_marque` (
  `Marque` varchar(100) NOT NULL,
  PRIMARY KEY (`Marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_marque`
--

LOCK TABLES `pip_marque` WRITE;
/*!40000 ALTER TABLE `pip_marque` DISABLE KEYS */;
INSERT INTO `pip_marque` VALUES ('BioHit'),('Eppendorf'),('Gilson');
/*!40000 ALTER TABLE `pip_marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_nonusers`
--

DROP TABLE IF EXISTS `pip_nonusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_nonusers` (
  `User` varchar(100) NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_nonusers`
--

LOCK TABLES `pip_nonusers` WRITE;
/*!40000 ALTER TABLE `pip_nonusers` DISABLE KEYS */;
INSERT INTO `pip_nonusers` VALUES ('Florent.C'),('Gift.or.Purchased');
/*!40000 ALTER TABLE `pip_nonusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_stock`
--

DROP TABLE IF EXISTS `pip_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_stock` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Serial_Number` varchar(40) NOT NULL,
  `Marque` varchar(40) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial_Number` (`Serial_Number`)
) ENGINE=MyISAM AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_stock`
--

LOCK TABLES `pip_stock` WRITE;
/*!40000 ALTER TABLE `pip_stock` DISABLE KEYS */;
INSERT INTO `pip_stock` VALUES (1,'Y60538M','Gilson','P1000'),(2,'Y58817M','Gilson','P200'),(3,'Y63235M','Gilson','P20'),(4,'Z64108A','Gilson','P2'),(5,'2102895','Eppendorf','multicanaux_10-100ul'),(6,'6133327','BioHit','multicanaux_02-10ul');
/*!40000 ALTER TABLE `pip_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_type`
--

DROP TABLE IF EXISTS `pip_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_type` (
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_type`
--

LOCK TABLES `pip_type` WRITE;
/*!40000 ALTER TABLE `pip_type` DISABLE KEYS */;
INSERT INTO `pip_type` VALUES ('multicanaux_02-10ul'),('multicanaux_10-100ul'),('multicanaux_50-1200ul'),('P1000'),('P2'),('P20'),('P200');
/*!40000 ALTER TABLE `pip_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_usage`
--

DROP TABLE IF EXISTS `pip_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_usage` (
  `Usage` varchar(100) NOT NULL,
  PRIMARY KEY (`Usage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_usage`
--

LOCK TABLES `pip_usage` WRITE;
/*!40000 ALTER TABLE `pip_usage` DISABLE KEYS */;
INSERT INTO `pip_usage` VALUES ('Cellular'),('Misc'),('RNA');
/*!40000 ALTER TABLE `pip_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pip_users`
--

DROP TABLE IF EXISTS `pip_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pip_users` (
  `User` varchar(100) NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pip_users`
--

LOCK TABLES `pip_users` WRITE;
/*!40000 ALTER TABLE `pip_users` DISABLE KEYS */;
INSERT INTO `pip_users` VALUES ('Christelle.D'),('Helene.B');
/*!40000 ALTER TABLE `pip_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_bacterial_selection`
--

DROP TABLE IF EXISTS `pl_bacterial_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_bacterial_selection` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_bacterial_selection`
--

LOCK TABLES `pl_bacterial_selection` WRITE;
/*!40000 ALTER TABLE `pl_bacterial_selection` DISABLE KEYS */;
INSERT INTO `pl_bacterial_selection` VALUES (''),('Amp'),('Chloramphenicol'),('Kan');
/*!40000 ALTER TABLE `pl_bacterial_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_features`
--

DROP TABLE IF EXISTS `pl_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_features` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Sequence` longtext NOT NULL,
  `Date_` date DEFAULT NULL,
  `Description` longtext,
  `Comments` longtext NOT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Category` varchar(15) NOT NULL DEFAULT 'OTH',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sequence` (`Sequence`(128)),
  KEY `Author` (`Author`),
  CONSTRAINT `pl_features_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_features`
--

LOCK TABLES `pl_features` WRITE;
/*!40000 ALTER TABLE `pl_features` DISABLE KEYS */;
INSERT INTO `pl_features` VALUES (1,'CGCTTGCCTGTAACTTACACGCGCCTCGTATCTTTTAATGATGGAATAATTTGGGAATTTACTCTGTGTTTATTTATTTTTATGTTTTGTATTTGGATTTTAGAAAGTAAATAAAGAAGGTAGAAGAGTTACGGAATGAAGAAAAAAAAATAAACAAAGGTTTAAAAAATTTCAACAAAAAGCGTACTTTACATATATATTTATTAGACAAGAAAAGCAGATTAAATAGATATACATTCGATTAACGATAAGTAAAATGTAAAATCACAGGATTTTCGTGTGTGGTCTTCTACACAGACAAGATGAAACAATTCGGCATTAATACCTGAGAGCAGGAAGAGCAAGATAAAAGGTAGTATTTGTTGGCGATCCCCCTAGAGTCTTTTACATCTTCGGAAAACAAAAACTATTTTTTCTTTAATTTCTTTTTTTACTTTCTATTTTTAATTTATATATTTATATTAAAAAATTTAAATTATAATTATTTTTATAGCACGTGATGAAAAGGACC','2013-06-11','CEN6/ARSH4','','Gael.Y','ORI'),(2,'ATAACTTCGTATAATGTATGCTATACGAAGTTAT','2013-06-11','LoxP','','Gael.Y','OTH'),(3,'ATGTCTAAAGGTGAAGAATTATTCACTGGTGTTGTCCCAATTTTGGTTGAATTAGATGGTGATGTTAATGGTCACAAATTTTCTGTCTCCGGTGAAGGTGAAGGTGATGCTACTTACGGTAAATTGACCTTAAAATTTATTTGTACTACTGGTAAATTGCCAGTTCCATGGCCAACCTTAGTCACTACTTTCGGTTATGGTGTTCAATGTTTTGCTAGATACCCAGATCATATGAAACAACATGACTTTTTCAAGTCTGCCATGCCAGAAGGTTATGTTCAAGAAAGAACTATTTTTTTCAAAGATGACGGTAACTACAAGACCAGAGCTGAAGTCAAGTTTGAAGGTGATACCTTAGTTAATAGAATCGAATTAAAAGGTATTGATTTTAAAGAAGATGGTAACATTTTAGGTCACAAATTGGAATACAACTATAACTCTCACAATGTTTACATCATGGCTGACAAACAAAAGAATGGTATCAAAGTTAACTTCAAAATTAGACACAACATTGAAGATGGTTCTGTTCAATTAGCTGACCATTATCAACAAAATACTCCAATTGGTGATGGTCCAGTCTTGTTACCAGACAACCATTACTTATCCACTCAATCTGCCTTATCCAAAGATCCAAACGAAAAGAGAGACCACATGGTCTTGTTAGAATTTGTTACTGCTGCTGGTATTACCCATGGTATGGATGAATTGTACAAA','2013-06-11','yEGFP3-CDS','','Gael.Y','REP'),(4,'atgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcttttaaagaggccctactggcgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagctttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtaccaacgatgttccctccaccaaaggtgttcttatgtag','2013-07-19','HIS3-CDS','','Gael.Y','SEL'),(5,'cgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttcccctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaag','2013-07-19','HIS3-prom','','Gael.Y','PRO'),(6,'tgacaccgattatttaaagctgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcga','2013-07-19','HIS3-term','','Gael.Y','TER');
/*!40000 ALTER TABLE `pl_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_features_catname`
--

DROP TABLE IF EXISTS `pl_features_catname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_features_catname` (
  `Category` varchar(15) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_features_catname`
--

LOCK TABLES `pl_features_catname` WRITE;
/*!40000 ALTER TABLE `pl_features_catname` DISABLE KEYS */;
INSERT INTO `pl_features_catname` VALUES ('PRO','Promoters'),('REG','Regulatory sequences'),('TER','Terminators'),('SEL','Selectable markers'),('ORI','Replication origins'),('REP','Reporter genes'),('TAG','Affinity tags'),('LOC','Localization sequences'),('HYB','Hybrid genes'),('OTH','Miscellaneous features');
/*!40000 ALTER TABLE `pl_features_catname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_tag`
--

DROP TABLE IF EXISTS `pl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_tag` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_tag`
--

LOCK TABLES `pl_tag` WRITE;
/*!40000 ALTER TABLE `pl_tag` DISABLE KEYS */;
INSERT INTO `pl_tag` VALUES (''),('FLAG'),('FlAsH'),('GST'),('HA'),('HIS'),('Myc'),('ProA'),('TAP');
/*!40000 ALTER TABLE `pl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_type`
--

DROP TABLE IF EXISTS `pl_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_type` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_type`
--

LOCK TABLES `pl_type` WRITE;
/*!40000 ALTER TABLE `pl_type` DISABLE KEYS */;
INSERT INTO `pl_type` VALUES (''),('2-mu'),('centromeric'),('integrative');
/*!40000 ALTER TABLE `pl_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_yeast_marker`
--

DROP TABLE IF EXISTS `pl_yeast_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_yeast_marker` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_yeast_marker`
--

LOCK TABLES `pl_yeast_marker` WRITE;
/*!40000 ALTER TABLE `pl_yeast_marker` DISABLE KEYS */;
INSERT INTO `pl_yeast_marker` VALUES (''),('ADE2'),('bialaphos'),('CaURA3'),('HIS3'),('HIS3MX6'),('HphNT1'),('HygromycinB'),('Kan'),('KanMX'),('KanMX4'),('KlLEU2'),('KlTRP1'),('KlURA3'),('KlURA3MX4'),('LEU2'),('LYS2'),('Nat'),('NatMX'),('NatNT2'),('phleomycin'),('spHIS5'),('TRP1'),('URA3');
/*!40000 ALTER TABLE `pl_yeast_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_yeast_promoter`
--

DROP TABLE IF EXISTS `pl_yeast_promoter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_yeast_promoter` (
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_yeast_promoter`
--

LOCK TABLES `pl_yeast_promoter` WRITE;
/*!40000 ALTER TABLE `pl_yeast_promoter` DISABLE KEYS */;
INSERT INTO `pl_yeast_promoter` VALUES (''),('ADH'),('CUP1'),('CYC1'),('GAL'),('GAL1'),('GALL'),('GALS'),('GPD'),('MET25'),('TEF');
/*!40000 ALTER TABLE `pl_yeast_promoter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plasmids`
--

DROP TABLE IF EXISTS `plasmids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plasmids` (
  `id` int(10) unsigned NOT NULL,
  `Name_` varchar(50) DEFAULT NULL,
  `Other_names` varchar(50) DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `Checkings` varchar(200) DEFAULT NULL,
  `Type_` varchar(25) DEFAULT NULL,
  `Marker_1` varchar(25) DEFAULT NULL,
  `Marker_2` varchar(25) DEFAULT NULL,
  `Bacterial_selection` varchar(25) DEFAULT NULL,
  `Tags` varchar(25) DEFAULT NULL,
  `parent_vector` varchar(50) DEFAULT NULL,
  `Insert_` varchar(50) DEFAULT NULL,
  `Insert_Type` varchar(25) DEFAULT NULL,
  `Construction_Description` longtext,
  `Reference_` varchar(200) DEFAULT NULL,
  `Reporter` varchar(25) DEFAULT NULL,
  `Promoter` varchar(25) DEFAULT NULL,
  `Link_to_file` varchar(100) DEFAULT NULL,
  `sequence` text,
  `image_file` varchar(100) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `storage_minus20freezers` varchar(100) DEFAULT NULL,
  `storage_minus80freezers` varchar(100) DEFAULT NULL,
  `storage_fridges` varchar(100) DEFAULT NULL,
  `storage_rooms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Link_to_file` (`Link_to_file`),
  UNIQUE KEY `Link_to_file_2` (`Link_to_file`),
  KEY `Author` (`Author`),
  CONSTRAINT `plasmids_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasmids`
--

LOCK TABLES `plasmids` WRITE;
/*!40000 ALTER TABLE `plasmids` DISABLE KEYS */;
INSERT INTO `plasmids` VALUES (1,'pRSII303',NULL,'2013-05-28','','centromeric','HIS3','','Amp','','','','','Bought from Addgene\r\n\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n\r\n','','Lac Z','','pRSII303.gb.gz','TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGACGTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(2,'pRSII403',NULL,'2013-05-28','','centromeric','HIS3','','Amp','','','','','Bought from Addgene\r\n\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n\r\n','','Lac Z','','pRSII403.gb.gz','tcgcgcgtttcggtgatgacggtgaaaacctctgacacatgcagctcccggagacggtcacagcttgtctgtaagcggatgccgggagcagacaagcccgtcagggcgcgtcagcgggtgttggcgggtgtcggggctggcttaactatgcggcatcagagcagattgtactgagagtgcaccataaattcccgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttccAcctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaagatgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcAtttaaagaggccctaGGggcCGTgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagTtttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtacAaacgatgttccctccaccaaaggtgttcttatgtagtgacaccgattatttaaagTtgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcgacggatctatgcggtgtgaaataccgcacagatgcgtaaggagaaaataccgcatcaggaaattgtaaGcgttaatattttgttaaaattcgcgttaaatttttgttaaatcagctcattttttaaccaataggccgaaatcggcaaaatcccttataaatcaaaagaatagaccgagatagggttgagtgttgttccagtttggaacaagagtccactattaaagaacgtggactccaacgtcaaagggcgaaaaaccgtctatcagggcgatggcccactacgtgaaccatcaccctaatcaagttttttggggtcgaggtgccgtaaagcactaaatcggaaccctaaagggagcccccgatttagagcttgacggggaaagccggcgaacgtggcgagaaaggaagggaagaaagcgaaaggagcgggcgctagggcgctggcaagtgtagcggtcacgctgcgcgtaaccaccacacccgccgcgcttaatgcgccgctacagggcgcgtccattcgccattcaggctgcgcaactgttgggaagggcgatcggtgcgggcctcttcgctattacgccagctggcgaaagggggatgtgctgcaaggcgattaagttgggtaacgccagggttttcccagtcacgacgttgtaaaacgacggccagtgagcgcgcgtaatacgactcactatagggcgaattgggtaccgggccccccctcgaggtcgacggtatcgataagcttgatatcgaattcctgcagcccgggggatccactagttctagagcggccgccaccgcggtggagctccagcttttgttccctttagtgagggttaattgcgcgcttggcgtaatcatggtcatagctgtttcctgtgtgaaattgttatccgctcacaattccacacaacataCgagccggaagcataaagtgtaaagcctggggtgcctaatgagtgagCtaactcacattaattgcgttgcgctcactgcccgctttccagtcgggaaacctgtcgtgccagctgcattaatgaatcggccaacgcgcggggagaggcggtttgcgtattgggcgctcttccgcttcctcgctcactgactcgctgcgctcggtcgttcggctgcggcgagcggtatcagctcactcaaaggcggtaatacggttatccacagaatcaggggataacgcaggaaagaacatgtgagcaaaaggccagcaaaaggccaggaaccgtaaaaaggccgcgttgctggcgtttttccataggctccgcccccctgacgagcatcacaaaaatcgacgctcaagtcagaggtggcgaaacccgacaggactataaagataccaggcgtttccccctggaagctccctcgtgcgctctcctgttccgaccctgccgcttaccggatacctgtccgcctttctcccttcgggaagcgtggcgctttctcatagctcacgctgtaggtatctcagttcggtgtaggtcgttcgctccaagctgggctgtgtgcacgaaccccccgttcagcccgaccgctgcgccttatccggtaactatcgtcttgagtccaacccggtaagacacgacttatcgccactggcagcagccactggtaacaggattagcagagcgaggtatgtaggcggtgctacagagttcttgaagtggtggcctaactacggctacactagaagAacagtatttggtatctgcgctctgctgaagccagttaccttcggaaaaagagttggtagctcttgatccggcaaacaaaccaccgctggtagcggtggtttttttgtttgcaagcagcagattacgcgcagaaaaaaaggatctcaagaagatcctttgatcttttctacggggtctgacgctcagtggaacgaaaactcacgttaagggattttggtcatgagattatcaaaaaggatcttcacctagatccttttaaattaaaaatgaagttttaaatcaatctaaagtatatatgagtaaacttggtctgacagttaccaatgcttaatcagtgaggcacctatctcagcgatctgtctatttcgttcatccatagttgcctgactccccgtcgtgtagataactacgatacgggagggcttaccatctggccccagtgctgcaatgataccgcgagacccacgctcaccggctccagatttatcagcaataaaccagccagccggaagggccgagcgcagaagtggtcctgcaactttatccgcctccatccagtctattaattgttgccgggaagctagagtaagtagttcgccagttaatagtttgcgcaacgttgttgccattgctacaggcatcgtggtgtcacgctcgtcgtttggtatggcttcattcagctccggttcccaacgatcaaggcgagttacatgatcccccatgttgtgcaaaaaagcggttagctccttcggtcctccgatcgttgtcagaagtaagttggccgcagtgttatcactcatggttatggcagcactgcataattctcttactgtcatgccatccgtaagatgcttttctgtgactggtgagtactcaaccaagtcattctgagaatagtgtatgcggcgaccgagttgctcttgcccggcgtcaatacgggataataccgcgccacatagcagaactttaaaagtgctcatcattggaaaacgttcttcggggcgaaaactctcaaggatcttaccgctgttgagatccagttcgatgtaacccactcgtgcacccaactgatcttcagcatcttttactttcaccagcgtttctgggtgagcaaaaacaggaaggcaaaatgccgcaaaaaagggaataagggcgacacggaaatgttgaatactcatactcttcctttttcaatattattgaagcatttatcagggttattgtctcatgagcggatacatatttgaatgtatttagaaaaataaacaaataggggttccgcgcacatttccccgaaaagtgccacctgacgtctaagaaaccattattatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtc',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(3,'pRSII313',NULL,'2013-05-28','','integrative','HIS3','','Amp','','','','','Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n','','Lac Z','','pRSII313.gb.gz','TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGggtccttttcatcacgtgctataaaaataattataatttaaattttttaatataaatatataaattaaaaatagaaagtaaaaaaagaaattaaagaaaaaatagtttttgttttccgaagatgtaaaagactctagggggatcgccaacaaatactaccttttatcttgctcttcctgctctcaggtattaatgccgaattgtttcatcttgtctgtgtagaagaccacacacgaaaatcctgtgattttacattttacttatcgttaatcgaatgtatatctatttaatctgcttttcttgtctaataaatatatatgtaaagtacgctttttgttgaaattttttaaacctttgtttatttttttttcttcattccgtaactcttctaccttctttatttactttctaaaatccaaatacaaaacataaaaataaataaacacagagtaaattcccaaattattccatcattaaaagatacgaggcgcgtgtaagttacaggcaagcgatcCGTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(4,'pRSII323',NULL,'2013-05-29','','2-mu','HIS3','','Amp','','','','','Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n2 micron origin is from YEplac195, which has had its XbaI site removed.','','Lac Z','','pRSII323.gb.gz','TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGAAcgaagcatctgtgcttcattttgtagaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgaaagcgctattttaccaacgaagaatctgtgcttcatttttgtaaaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgagagcgctattttaccaacaaagaatctatacttcttttttgttctacaaaaatgcatcccgagagcgctatttttctaacaaagcatcttagattactttttttctcctttgtgcgctctataatgcagtctcttgataactttttgcactgtaggtccgttaaggttagaagaaggctactttggtgtctattttctcttccataaaaaaagcctgactccacttcccgcgtttactgattactagcgaagctgcgggtgcattttttcaagataaaggcatccccgattatattctataccgatgtggattgcgcatactttgtgaacagaaagtgatagcgttgatgattcttcattggtcagaaaattatgaacggtttcttctattttgtctctatatactacgtataggaaatgtttacattttcgtattgttttcgattcactctatgaatagttcttactacaatttttttgtctaaagagtaatactagagataaacataaaaaatgtagaggtcgagtttagatgcaagttcaaggagcgaaaggtggatgggtaggttatatagggatatagcacagagatatatagcaaagagatacttttgagcaatgtttgtggaagcggtattcgcaatattttagtagctcgttacagtccggtgcgtttttggttttttgaaagtgcgtcttcagagcgcttttggttttcaaaagcgctctgaagttcctatactttctagCTAGagaataggaacttcggaataggaacttcaaagcgtttccgaaaacgagcgcttccgaaaatgcaacgcgagctgcgcacatacagctcactgttcacgtcgcacctatatctgcgtgttgcctgtatatatatatacatgagaagaacggcatagtgcgtgtttatgcttaaatgcgtacttatatgcgtctatttatgtaggatgaaaggtagtctagtacctcctgtgatattatcccattccatgcggggtatcgtatgcttccttcagcactaccctttagctgttctatatgctgccactcctcaattggattagtctcatccttcaatgctatcatttcctttgatattggatcaTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(5,'pRSII423',NULL,'2013-05-29','','2-mu','HIS3','','Amp','','','','','Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n2 micron replication origin is from YEplac195 and has had its XbaI site removed.','','Lac Z','','pRSII423.gb.gz','tcgcgcgtttcggtgatgacggtgaaaacctctgacacatgcagctcccggagacggtcacagcttgtctgtaagcggatgccgggagcagacaagcccgtcagggcgcgtcagcgggtgttggcgggtgtcggggctggcttaactatgcggcatcagagcagattgtactgagagtgcaccataaattcccgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttccAcctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaagatgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcAtttaaagaggccctaGGggcCGTgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagTtttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtacAaacgatgttccctccaccaaaggtgttcttatgtagtgacaccgattatttaaagTtgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcgacggatctatgcggtgtgaaataccgcacagatgcgtaaggagaaaataccgcatcaggaaattgtaaGcgttaatattttgttaaaattcgcgttaaatttttgttaaatcagctcattttttaaccaataggccgaaatcggcaaaatcccttataaatcaaaagaatagaccgagatagggttgagtgttgttccagtttggaacaagagtccactattaaagaacgtggactccaacgtcaaagggcgaaaaaccgtctatcagggcgatggcccactacgtgaaccatcaccctaatcaagttttttggggtcgaggtgccgtaaagcactaaatcggaaccctaaagggagcccccgatttagagcttgacggggaaagccggcgaacgtggcgagaaaggaagggaagaaagcgaaaggagcgggcgctagggcgctggcaagtgtagcggtcacgctgcgcgtaaccaccacacccgccgcgcttaatgcgccgctacagggcgcgtccattcgccattcaggctgcgcaactgttgggaagggcgatcggtgcgggcctcttcgctattacgccagctggcgaaagggggatgtgctgcaaggcgattaagttgggtaacgccagggttttcccagtcacgacgttgtaaaacgacggccagtgagcgcgcgtaatacgactcactatagggcgaattgggtaccgggccccccctcgaggtcgacggtatcgataagcttgatatcgaattcctgcagcccgggggatccactagttctagagcggccgccaccgcggtggagctccagcttttgttccctttagtgagggttaattgcgcgcttggcgtaatcatggtcatagctgtttcctgtgtgaaattgttatccgctcacaattccacacaacataCgagccggaagcataaagtgtaaagcctggggtgcctaatgagtgagCtaactcacattaattgcgttgcgctcactgcccgctttccagtcgggaaacctgtcgtgccagctgcattaatgaatcggccaacgcgcggggagaggcggtttgcgtattgggcgctcttccgcttcctcgctcactgactcgctgcgctcggtcgttcggctgcggcgagcggtatcagctcactcaaaggcggtaatacggttatccacagaatcaggggataacgcaggaaagaacatgtgagcaaaaggccagcaaaaggccaggaaccgtaaaaaggccgcgttgctggcgtttttccataggctccgcccccctgacgagcatcacaaaaatcgacgctcaagtcagaggtggcgaaacccgacaggactataaagataccaggcgtttccccctggaagctccctcgtgcgctctcctgttccgaccctgccgcttaccggatacctgtccgcctttctcccttcgggaagcgtggcgctttctcatagctcacgctgtaggtatctcagttcggtgtaggtcgttcgctccaagctgggctgtgtgcacgaaccccccgttcagcccgaccgctgcgccttatccggtaactatcgtcttgagtccaacccggtaagacacgacttatcgccactggcagcagccactggtaacaggattagcagagcgaggtatgtaggcggtgctacagagttcttgaagtggtggcctaactacggctacactagaagAacagtatttggtatctgcgctctgctgaagccagttaccttcggaaaaagagttggtagctcttgatccggcaaacaaaccaccgctggtagcggtggtttttttgtttgcaagcagcagattacgcgcagaaaaaaaggatctcaagaagatcctttgatcttttctacggggtctgacgctcagtggaacgaaaactcacgttaagggattttggtcatgagattatcaaaaaggatcttcacctagatccttttaaattaaaaatgaagttttaaatcaatctaaagtatatatgagtaaacttggtctgacagttaccaatgcttaatcagtgaggcacctatctcagcgatctgtctatttcgttcatccatagttgcctgactccccgtcgtgtagataactacgatacgggagggcttaccatctggccccagtgctgcaatgataccgcgagacccacgctcaccggctccagatttatcagcaataaaccagccagccggaagggccgagcgcagaagtggtcctgcaactttatccgcctccatccagtctattaattgttgccgggaagctagagtaagtagttcgccagttaatagtttgcgcaacgttgttgccattgctacaggcatcgtggtgtcacgctcgtcgtttggtatggcttcattcagctccggttcccaacgatcaaggcgagttacatgatcccccatgttgtgcaaaaaagcggttagctccttcggtcctccgatcgttgtcagaagtaagttggccgcagtgttatcactcatggttatggcagcactgcataattctcttactgtcatgccatccgtaagatgcttttctgtgactggtgagtactcaaccaagtcattctgagaatagtgtatgcggcgaccgagttgctcttgcccggcgtcaatacgggataataccgcgccacatagcagaactttaaaagtgctcatcattggaaaacgttcttcggggcgaaaactctcaaggatcttaccgctgttgagatccagttcgatgtaacccactcgtgcacccaactgatcttcagcatcttttactttcaccagcgtttctgggtgagcaaaaacaggaaggcaaaatgccgcaaaaaagggaataagggcgacacggaaatgttgaatactcatactcttcctttttcaatattattgaagcatttatcagggttattgtctcatgagcggatacatatttgaatgtatttagaaaaataaacaaataggggttccgcgcacatttccccgaaaagtgccacctgaAcgaagcatctgtgcttcattttgtagaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgaaagcgctattttaccaacgaagaatctgtgcttcatttttgtaaaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgagagcgctattttaccaacaaagaatctatacttcttttttgttctacaaaaatgcatcccgagagcgctatttttctaacaaagcatcttagattactttttttctcctttgtgcgctctataatgcagtctcttgataactttttgcactgtaggtccgttaaggttagaagaaggctactttggtgtctattttctcttccataaaaaaagcctgactccacttcccgcgtttactgattactagcgaagctgcgggtgcattttttcaagataaaggcatccccgattatattctataccgatgtggattgcgcatactttgtgaacagaaagtgatagcgttgatgattcttcattggtcagaaaattatgaacggtttcttctattttgtctctatatactacgtataggaaatgtttacattttcgtattgttttcgattcactctatgaatagttcttactacaatttttttgtctaaagagtaatactagagataaacataaaaaatgtagaggtcgagtttagatgcaagttcaaggagcgaaaggtggatgggtaggttatatagggatatagcacagagatatatagcaaagagatacttttgagcaatgtttgtggaagcggtattcgcaatattttagtagctcgttacagtccggtgcgtttttggttttttgaaagtgcgtcttcagagcgcttttggttttcaaaagcgctctgaagttcctatactttctagCTAGagaataggaacttcggaataggaacttcaaagcgtttccgaaaacgagcgcttccgaaaatgcaacgcgagctgcgcacatacagctcactgttcacgtcgcacctatatctgcgtgttgcctgtatatatatatacatgagaagaacggcatagtgcgtgtttatgcttaaatgcgtacttatatgcgtctatttatgtaggatgaaaggtagtctagtacctcctgtgatattatcccattccatgcggggtatcgtatgcttccttcagcactaccctttagctgttctatatgctgccactcctcaattggattagtctcatccttcaatgctatcatttcctttgatattggatcatctaagaaaccattattatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtc',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plasmids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_ADE2`
--

DROP TABLE IF EXISTS `st_ADE2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_ADE2` (
  `alleles` varchar(20) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_ADE2`
--

LOCK TABLES `st_ADE2` WRITE;
/*!40000 ALTER TABLE `st_ADE2` DISABLE KEYS */;
INSERT INTO `st_ADE2` VALUES (''),('ade2-1'),('ade2-1/ADE2'),('ade2-1/ade2-1'),('ADE2.'),('ade2/ade2'),('ade2∆::hisG'),('loxP-ADE2-loxP-HphMX'),('unknown');
/*!40000 ALTER TABLE `st_ADE2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_HIS3`
--

DROP TABLE IF EXISTS `st_HIS3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_HIS3` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_HIS3`
--

LOCK TABLES `st_HIS3` WRITE;
/*!40000 ALTER TABLE `st_HIS3` DISABLE KEYS */;
INSERT INTO `st_HIS3` VALUES (''),('his3'),('his3-11,15'),('his3-11,15/HIS3'),('his3-11,15/his3-11,15'),('HIS3.'),('his3∆1'),('his3∆1/HIS3'),('his3∆1/his3∆1'),('his3∆200'),('his3∆200/HIS3'),('his3∆200/his3∆200'),('unknown');
/*!40000 ALTER TABLE `st_HIS3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_LEU2`
--

DROP TABLE IF EXISTS `st_LEU2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_LEU2` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_LEU2`
--

LOCK TABLES `st_LEU2` WRITE;
/*!40000 ALTER TABLE `st_LEU2` DISABLE KEYS */;
INSERT INTO `st_LEU2` VALUES (''),('leu2'),('leu2-3,112'),('leu2-3,112/LEU2'),('leu2-3,112/leu2-3,112'),('LEU2.'),('leu2::hisG'),('leu2::hisG/LEU2'),('leu2::hisG/leu2::hisG'),('leu2∆(asp781-EcoRI)'),('leu2∆(asp781-EcoRI)/LEU2'),('leu2∆(asp781-EcoRI)/leu2∆(asp781-EcoRI)'),('leu2∆0'),('leu2∆0/LEU2'),('leu2∆0/leu2∆0'),('leu2∆1'),('leu2∆1/LEU2'),('leu2∆1/leu2∆1'),('unknown');
/*!40000 ALTER TABLE `st_LEU2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_LYS2`
--

DROP TABLE IF EXISTS `st_LYS2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_LYS2` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_LYS2`
--

LOCK TABLES `st_LYS2` WRITE;
/*!40000 ALTER TABLE `st_LYS2` DISABLE KEYS */;
INSERT INTO `st_LYS2` VALUES (''),('lys2'),('lys2-128d'),('LYS2.'),('lys2/lys2'),('lys2∆0'),('lys2∆0/LYS2'),('lys2∆0/lys2∆0'),('lys2∆0::lox-ADEaru-xol'),('lys2∆202'),('lys2∆202/LYS2'),('lys2∆202/lys2∆202'),('unknown');
/*!40000 ALTER TABLE `st_LYS2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_MAT`
--

DROP TABLE IF EXISTS `st_MAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_MAT` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_MAT`
--

LOCK TABLES `st_MAT` WRITE;
/*!40000 ALTER TABLE `st_MAT` DISABLE KEYS */;
INSERT INTO `st_MAT` VALUES ('MATa'),('MATa/MATa'),('MATa/MATa/MATb/MATb'),('MATa/MATb'),('MATb'),('MATb/MATb'),('MATb/MATb/MATa'),('unknown');
/*!40000 ALTER TABLE `st_MAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_MET15`
--

DROP TABLE IF EXISTS `st_MET15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_MET15` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_MET15`
--

LOCK TABLES `st_MET15` WRITE;
/*!40000 ALTER TABLE `st_MET15` DISABLE KEYS */;
INSERT INTO `st_MET15` VALUES (''),('MET15.'),('met15∆0'),('met15∆0/MET15'),('met15∆0/met15∆0'),('unknown');
/*!40000 ALTER TABLE `st_MET15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_TRP1`
--

DROP TABLE IF EXISTS `st_TRP1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_TRP1` (
  `alleles` varchar(40) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_TRP1`
--

LOCK TABLES `st_TRP1` WRITE;
/*!40000 ALTER TABLE `st_TRP1` DISABLE KEYS */;
INSERT INTO `st_TRP1` VALUES (''),('trp1'),('trp1-1'),('trp1-1/TRP1'),('trp1-1/trp1-1'),('trp1-289'),('trp1-289/TRP1'),('trp1-289/trp1-289'),('TRP1.'),('trp1∆1'),('trp1∆1/TRP1'),('trp1∆1/trp1∆1'),('trp1∆2'),('trp1∆2/TRP1'),('trp1∆2/trp1∆2'),('trp1∆63'),('trp1∆63/TRP1'),('trp1∆63/trp1∆63'),('trp1∆::KanMX4'),('trp1∆::KanMX4/TRP1'),('trp1∆::KanMX4/trp1∆::KanMX4'),('unknown');
/*!40000 ALTER TABLE `st_TRP1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_URA3`
--

DROP TABLE IF EXISTS `st_URA3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_URA3` (
  `alleles` varchar(20) NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_URA3`
--

LOCK TABLES `st_URA3` WRITE;
/*!40000 ALTER TABLE `st_URA3` DISABLE KEYS */;
INSERT INTO `st_URA3` VALUES (''),('unknown'),('ura3'),('ura3-1'),('ura3-52'),('ura3-52/URA3'),('ura3-52/ura3-52'),('URA3.'),('ura3/ura3'),('ura3::KanMX'),('ura3::KanMX/URA3'),('ura3∆0'),('ura3∆0/URA3'),('ura3∆0/ura3∆0'),('ura3∆0::TRP1'),('ura3∆::hphNT1'),('URA::CMV-tTA');
/*!40000 ALTER TABLE `st_URA3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_general_backgrounds`
--

DROP TABLE IF EXISTS `st_general_backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_general_backgrounds` (
  `background` varchar(20) NOT NULL,
  PRIMARY KEY (`background`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_general_backgrounds`
--

LOCK TABLES `st_general_backgrounds` WRITE;
/*!40000 ALTER TABLE `st_general_backgrounds` DISABLE KEYS */;
INSERT INTO `st_general_backgrounds` VALUES ('273614X'),('322134S'),('378604X'),('A364A'),('AJA2'),('CBS2888_1'),('CBS3093_1'),('CBS403_1'),('CBS7960_1'),('CECT10109_1'),('CECT10266_1'),('CEN.PK'),('CLIB154_1'),('CLIB157_1'),('CLIB192_1'),('CLIB208_1'),('CLIB215_1'),('CLIB219_2'),('CLIB272_2'),('CLIB274_1'),('CLIB294_1'),('CLIB318_1'),('CLIB324_2'),('CLIB326_1'),('CLIB328'),('CLIB382_1'),('CLIB413_1'),('CLIB483_1'),('DBVPG1373_1'),('DBVPG1399_1'),('DBVPG1788_1'),('DBVPG1794_1'),('DBVPG1853_1'),('DBVPG3591_1'),('DBVPG4651_1'),('DBVPG6041_1'),('DBVPG6861'),('EM93_3'),('FL100'),('FL200'),('FY3'),('I14_a'),('IL-01'),('industrial'),('JAY270'),('JAY291'),('K12_2'),('K1_1'),('L9-4A'),('M22_a'),('mixture'),('NC-02'),('PW5'),('RM11'),('RM12'),('RM13'),('RM3'),('RM5'),('RM9'),('S288c'),('SK1'),('T73_1'),('TL229S2.2'),('UC1_a'),('UC5'),('UC8_1'),('unknown'),('V5'),('VL1'),('W303'),('WE372_1'),('Y10_a'),('Y12_1'),('Y3_a'),('Y4_1'),('Y55'),('Y5_1'),('Y6_b'),('Y8_1'),('Y9J_1'),('Y9_4'),('YJM269_a'),('YJM280'),('YJM320'),('YJM326'),('YJM413'),('YJM421'),('YJM428'),('YJM434_1'),('YJM436_a'),('YJM440_d'),('YJM454_a'),('YJM653_1'),('YJM678_1'),('YJM789'),('YJM978'),('YJM981'),('YPS1000_a'),('YPS1009'),('YPS163_a');
/*!40000 ALTER TABLE `st_general_backgrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_fridges`
--

DROP TABLE IF EXISTS `storage_fridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_fridges` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_fridges`
--

LOCK TABLES `storage_fridges` WRITE;
/*!40000 ALTER TABLE `storage_fridges` DISABLE KEYS */;
INSERT INTO `storage_fridges` VALUES ('GY fridge');
/*!40000 ALTER TABLE `storage_fridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_minus20freezers`
--

DROP TABLE IF EXISTS `storage_minus20freezers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_minus20freezers` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_minus20freezers`
--

LOCK TABLES `storage_minus20freezers` WRITE;
/*!40000 ALTER TABLE `storage_minus20freezers` DISABLE KEYS */;
INSERT INTO `storage_minus20freezers` VALUES ('GY -20 freezer');
/*!40000 ALTER TABLE `storage_minus20freezers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_minus80freezers`
--

DROP TABLE IF EXISTS `storage_minus80freezers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_minus80freezers` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_minus80freezers`
--

LOCK TABLES `storage_minus80freezers` WRITE;
/*!40000 ALTER TABLE `storage_minus80freezers` DISABLE KEYS */;
INSERT INTO `storage_minus80freezers` VALUES ('GY -80 freezer');
/*!40000 ALTER TABLE `storage_minus80freezers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_rooms`
--

DROP TABLE IF EXISTS `storage_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_rooms` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_rooms`
--

LOCK TABLES `storage_rooms` WRITE;
/*!40000 ALTER TABLE `storage_rooms` DISABLE KEYS */;
INSERT INTO `storage_rooms` VALUES ('GY room');
/*!40000 ALTER TABLE `storage_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strains`
--

DROP TABLE IF EXISTS `strains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strains` (
  `id` int(10) unsigned NOT NULL,
  `Name_` varchar(25) NOT NULL,
  `Date_` date DEFAULT NULL,
  `Comments` longtext,
  `General_Background` varchar(25) NOT NULL,
  `Mating_Type` varchar(25) DEFAULT NULL,
  `ADE2` varchar(25) DEFAULT NULL,
  `HIS3` varchar(25) DEFAULT NULL,
  `LEU2` varchar(50) DEFAULT NULL,
  `LYS2` varchar(25) DEFAULT NULL,
  `TRP1` varchar(25) DEFAULT NULL,
  `URA3` varchar(25) DEFAULT NULL,
  `HO_` varchar(50) DEFAULT NULL,
  `locus1` varchar(75) DEFAULT NULL,
  `locus2` varchar(50) DEFAULT NULL,
  `locus3` varchar(50) DEFAULT NULL,
  `Parental_strain` varchar(25) DEFAULT NULL,
  `Obtained_by` varchar(25) DEFAULT NULL,
  `Checkings` varchar(225) DEFAULT NULL,
  `extrachromosomal_plasmid` varchar(50) DEFAULT NULL,
  `Other_names` varchar(25) DEFAULT NULL,
  `Reference_` varchar(125) DEFAULT NULL,
  `locus4` varchar(25) DEFAULT NULL,
  `locus5` varchar(50) DEFAULT NULL,
  `Cytoplasmic_Character` varchar(25) DEFAULT NULL,
  `Last_modified` date DEFAULT NULL,
  `MET15` varchar(25) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `storage_minus20freezers` varchar(100) DEFAULT NULL,
  `storage_minus80freezers` varchar(100) DEFAULT NULL,
  `storage_fridges` varchar(100) DEFAULT NULL,
  `storage_rooms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Author`),
  CONSTRAINT `strains_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strains`
--

LOCK TABLES `strains` WRITE;
/*!40000 ALTER TABLE `strains` DISABLE KEYS */;
INSERT INTO `strains` VALUES (1,'BY4700','2005-02-01','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,NULL,NULL,NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(2,'BY4709','2005-02-01','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb',NULL,NULL,NULL,NULL,NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(3,'BY4719','2005-02-01','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,NULL,NULL,'trp1∆63','ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(4,'BY4724','2005-02-01','Gift from Gottschling Lab. Strain from ','S288c','MATa',NULL,NULL,NULL,'lys2∆0',NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(5,'BY4720','2003-05-06',NULL,'S288c','MATb',NULL,NULL,NULL,'lys2∆0','trp1∆63','ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann et al; Yeast 1998 14:115-132.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(6,'BY4716',NULL,'Gift from Hartwell Lab, who got it from Brachmann et al. Yeast 1998 14:115-132.','S288c','MATb',NULL,NULL,NULL,'lys2∆0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann et al. Yeast 1998 14:115-132.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(7,'BY4741','2005-10-11','Gift from Gilson Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,'his3∆1','leu2∆0',NULL,NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02','met15∆0','Gift.or.Purchased',NULL,NULL,NULL,NULL),(8,'BY4742','2005-10-11','Gift from Gilson Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb',NULL,'his3∆1','leu2∆0','lys2∆0',NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(9,'BY4706','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02','met15∆0','Gift.or.Purchased',NULL,NULL,NULL,NULL),(10,'BY4707','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02','met15∆0','Gift.or.Purchased',NULL,NULL,NULL,NULL),(11,'BY4710','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,NULL,NULL,'trp1∆63',NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(12,'BY4711','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb',NULL,NULL,NULL,NULL,'trp1∆63',NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(13,'BY4712','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,'leu2∆0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(14,'BY4713','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb',NULL,NULL,'leu2∆0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(15,'BY4714','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,'his3∆200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(16,'BY4715','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa',NULL,NULL,NULL,'lys2∆0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(17,'BY4717','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa','ade2∆::hisG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(18,'BY4725','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATa','ade2∆::hisG',NULL,NULL,NULL,NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL),(19,'BY4726','2005-11-03','Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.','S288c','MATb','ade2∆::hisG',NULL,NULL,NULL,NULL,'ura3∆0',NULL,NULL,NULL,NULL,NULL,'Gift',NULL,NULL,NULL,'Brachmann Yeast 14:115-132, 1998.',NULL,NULL,NULL,'2006-11-02',NULL,'Gift.or.Purchased',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `strains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `login` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `target_table` varchar(40) NOT NULL,
  `mode` varchar(40) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES ('add','8fb37f04c67f8ea2f11cc8d823c833dd','dyn','add'),('edit','68fc3e4b774ac9e5561bb3d8413963b3','dyn','edit'),('superuser','fe01ce2a7fbac8fafaed7c982a04e229','all','super'),('view','fe01ce2a7fbac8fafaed7c982a04e229','all','view');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websession`
--

DROP TABLE IF EXISTS `websession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websession` (
  `id_session` varchar(100) NOT NULL,
  `login` varchar(40) NOT NULL,
  `time_limit` decimal(10,0) NOT NULL,
  `target_table` varchar(40) DEFAULT NULL,
  `mode` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websession`
--

LOCK TABLES `websession` WRITE;
/*!40000 ALTER TABLE `websession` DISABLE KEYS */;
INSERT INTO `websession` VALUES ('h4mpkgd3c0ooesgqibecn9j433','view',1392978187,'all','view');
/*!40000 ALTER TABLE `websession` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-21  4:53:20
