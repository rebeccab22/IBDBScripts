-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: workbench
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `workbench_sidebar_category`
--

DROP TABLE IF EXISTS `workbench_sidebar_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_sidebar_category` (
  `sidebar_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `sidebar_category_name` varchar(255) NOT NULL,
  `sidebar_category_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sidebar_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workbench_sidebar_category`
--

LOCK TABLES `workbench_sidebar_category` WRITE;
/*!40000 ALTER TABLE `workbench_sidebar_category` DISABLE KEYS */;
INSERT INTO `workbench_sidebar_category` VALUES 
(1,'activities','Activities'),(2,'information_mgt','Information Management')
,(3,'queries_analysis','Queries & Analysis'),(4,'more_tools','More Tools')
,(5,'workflows','Workflows'),(6,'admin','Admin & Settings');
/*!40000 ALTER TABLE `workbench_sidebar_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workbench_sidebar_category_link`
--

DROP TABLE IF EXISTS `workbench_sidebar_category_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_sidebar_category_link` (
  `sidebar_category_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(10) unsigned NOT NULL,
  `sidebar_category_id` int(11) NOT NULL,
  `sidebar_link_name` varchar(255) DEFAULT NULL,
  `sidebar_link_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sidebar_category_link_id`),
  KEY `sidebar_category_id_idx` (`sidebar_category_id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `sidebar_category_id` FOREIGN KEY (`sidebar_category_id`) REFERENCES `workbench_sidebar_category` (`sidebar_category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `tool_id` FOREIGN KEY (`tool_id`) REFERENCES `workbench_tool` (`tool_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workbench_sidebar_category_link`
--

LOCK TABLES `workbench_sidebar_category_link` WRITE;
/*!40000 ALTER TABLE `workbench_sidebar_category_link` DISABLE KEYS */;
INSERT INTO `workbench_sidebar_category_link` VALUES 
(1,22,1,'manage_list','Manage Lists')
,(2,11,1,'manage_crosses','Manage Crosses')
,(3,24,1,'manage_nurseries','Manage Nurseries')
,(4,25,1,'manage_trials','Manage Trials')
,(5,22,2,'bm_list_manager','List Manager')
,(6,14,2,'ibfb_germlasm_import','IBFB Germplasm Import')
,(7,15,2,'germplasm_import','Germplasm Import')
,(8,9,2,'gdms','Genotyping Data Mgmt. System (GDMS)')
,(9,7,2,'study_browser','Study Browser')
,(10,26,2,'ontology_browser_fieldbook_web','Ontology Browser')
,(11,20,3,'breeding_view_wb','Single-Site Analysis')
,(12,21,3,'breeding_gxe','Multi-Site Analysis')
,(13,4,3,'breeding_view','Breeding View Standalone')
,(14,27,3,'bv_meta_analysis','Meta Analysis of Field Trials')
,(15,17,3,'main_hxh','Main Head to Head Query')
,(16,19,3,'adopted_query','Adapted Germplasm Query')
,(17,1,4,'mbdt','Molecular Breeding Decision Tool (MBDT)')
,(18,2,4,'optimas','OptiMAS')
,(19,13,4,'mbp','Molecular Breeding Planner (MBP)');
/*!40000 ALTER TABLE `workbench_sidebar_category_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'workbench'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-25 12:17:21
