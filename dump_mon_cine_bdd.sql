-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mon_cine
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mon_cine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mon_cine` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `mon_cine`;

--
-- Table structure for table `billets`
--

DROP TABLE IF EXISTS `billets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seance_id` int(11) NOT NULL,
  `nb_de_tarif_1` int(11) NOT NULL DEFAULT 0,
  `nb_de_tarif_2` int(11) NOT NULL DEFAULT 0,
  `nb_de_tarif_3` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `erreur_seance` (`seance_id`),
  CONSTRAINT `erreur_seance` FOREIGN KEY (`seance_id`) REFERENCES `seances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billets`
--

LOCK TABLES `billets` WRITE;
/*!40000 ALTER TABLE `billets` DISABLE KEYS */;
INSERT INTO `billets` VALUES (1,1,3,1,0),(2,2,3,1,1),(3,3,2,1,0),(4,4,1,0,0),(5,5,0,1,0),(6,6,0,0,1);
/*!40000 ALTER TABLE `billets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(30) DEFAULT NULL,
  `nb_salles` int(11) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `responsable_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `erreur_responsable` (`responsable_id`),
  CONSTRAINT `erreur_responsable` FOREIGN KEY (`responsable_id`) REFERENCES `employes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'PARIS',7,'8 rue Alfred Hitchcock','01.23.45.67.89','paris@cinema.fr',2),(2,'LILLE',6,'7 rue Quentin Tarantino','03.12.45.67.89','lille@cinema.fr',3),(3,'MARSEILLE',3,'4 rue David Lynch','04.12.35.67.89','marseille@cinema.fr',4),(4,'TOULOUSE',2,'3 rue Stanley Kubrik','05.12.34.67.89','toulouse@cinema.fr',5);
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `role` varchar(10) NOT NULL,
  `password` varchar(60) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES (1,'Doe','John','1980-12-03','admin','$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW','15 rue Alfred Tarantino','01.23.45.76.98','admin@cinema.fr'),(2,'Dupontel','Michel','1992-02-14','vendeur1','$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze','21 rue Quentin Lynch','01.12.45.76.98','paris@cinema.fr'),(3,'Gabin','Julien','1985-03-31','vendeur2','$2y$10$vDNMDO4YjRAN8IeQm3q.k.ZuNf/U8uwHh4mqDKD1wCYT4IOFFjF3W','21 rue Quentin Tarantino','03.12.45.76.98','lille@cinema.fr'),(4,'Monroe','Marie','2001-11-20','vendeur3','$2y$10$wavr2j.udShBC2sByNn6dOQlm4Rcxn7QqMsuo6ojh6BaP04F/M5q2','4 rue David Kubrik','04.12.35.76.98','marseille@cinema.fr'),(5,'Signoret','Simon','1999-02-27','vendeur','$2y$10$4lwN7YyIWyi95KJ/ehnShOlZ70OfPZiSA/jq9It4vtaf1xooUE.LO','3 rue Stanley Kubrik','05.12.34.76.98','toulouse@cinema.fr');
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `realisateur` varchar(100) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `montant_total_des_billets_vendus` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'In the Navy','Tannie Samsin','01:56:00',35.20),(2,'Shoppen ','Carey Matej','01:21:00',41.10),(3,'Babe, The','Pattie Cotherill','01:19:00',26.00),(4,'Chamber of Death (Chambre des morts, La)','Eryn Earp','01:34:00',9.20),(5,'StarStruck','Berrie Gallier','01:39:00',7.60),(6,'Goodbye Girl, The','Winne Southall','01:01:00',5.90),(7,'Swimming to Cambodia','Stormie Yard','01:16:00',0.00),(8,'Deterrence','Ezmeralda Emmison','01:39:00',0.00),(9,'Long Gray Line, The','Marquita Dobrowolski','01:37:00',0.00),(10,'Crackers','Cord Stokey','01:09:00',0.00),(11,'La petite reine','Klarika Ouchterlony','02:29:00',0.00),(12,'Dead or Alive: Final','Vikki Breffit','01:00:00',0.00),(13,'Mother and Child','Vinnie Jonsson','02:39:00',0.00),(14,'Blow-Out (La grande bouffe)','Lonna Iacobini','02:07:00',0.00),(15,'To.get.her','Jodie Dennerley','01:50:00',0.00),(16,'Helvetica','Olag Emnoney','01:12:00',0.00),(17,'Dear Brigitte','Bernita Mandell','01:00:00',0.00),(18,'Crazy Kind of Love','Cobb Budding','01:25:00',0.00),(19,'Raze','Loretta Arrighi','01:27:00',0.00),(20,'RV','Jodi Dorgon','01:40:00',0.00);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_de_salle` int(11) DEFAULT NULL,
  `nb_total_de_places` int(11) DEFAULT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `erreur_salle_sans_cinema` (`cinema_id`),
  CONSTRAINT `erreur_salle_sans_cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,1,250,1),(2,2,240,1),(3,3,140,1),(4,4,140,1),(5,5,140,1),(6,6,120,1),(7,7,120,1),(8,1,250,2),(9,2,220,2),(10,3,210,2),(11,4,120,2),(12,5,120,2),(13,6,120,2),(14,1,250,3),(15,2,220,3),(16,3,110,3),(17,1,150,4),(18,2,120,4);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horaire` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `salle_id` int(11) NOT NULL,
  `nb_places_disponibles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `erreur_film_id` (`film_id`),
  KEY `erreur_salle_id` (`salle_id`),
  CONSTRAINT `erreur_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  CONSTRAINT `erreur_salle_id` FOREIGN KEY (`salle_id`) REFERENCES `salles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,'2022-12-01 20:30:00',1,1,246),(2,'2022-12-02 20:30:00',2,2,235),(3,'2022-12-03 20:30:00',3,3,137),(4,'2022-12-04 20:30:00',4,4,139),(5,'2022-12-05 20:30:00',5,5,139),(6,'2022-12-06 20:30:00',6,6,119);
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `montant` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,'Plein Tarif',9.20),(2,'├ëtudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 23:06:37
