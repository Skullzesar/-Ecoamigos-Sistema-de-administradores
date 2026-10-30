CREATE DATABASE  IF NOT EXISTS `sistema_recoleccion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_recoleccion`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_recoleccion
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `celular` bigint DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=1096189670 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'Jerson Suarez','jersonsuarez12@ecoamigos.com',3001234567,'admin123'),(2,'Jaider Zagarra','jaiderzagarra12@ecoamigos.com',3001234567,'admin123'),(3,'Adrian Becerra','adrianbecerra12@ecoamigos.com',3001234567,'admin123'),(4,'Duban Vanegas','dubanvanegas12@ecoamigos.com',3001234567,'admin123'),(5,'Eladio Villacob','eladiovillacob12@ecoamigos.com',3001234567,'admin123'),(6,'Jerson Suarez','jersonsuarez12@ecoamigos.com',3001234567,'admin123'),(7,'Jaider Zagarra','jaiderzagarra12@ecoamigos.com',3001234567,'admin123'),(8,'Adrian Becerra','adrianbecerra12@ecoamigos.com',3001234567,'admin123'),(9,'Duban Vanegas','dubanvanegas12@ecoamigos.com',3001234567,'admin123'),(10,'Eladio Villacob','eladiovillacob12@ecoamigos.com',3001234567,'admin123'),(1096189665,'Eladio Villacob','eladiovillacob12@ecoamigos.com',3001234567,'admin123'),(1096189666,'Duban Vanegas','dubanvanegas12@ecoamigos.com',3001234567,'admin123'),(1096189667,'Adrian Becerra','adrianbecerra12@ecoamigos.com',3001234567,'admin123'),(1096189668,'Jesus David Romero','jaiderzagarra12@ecoamigos.com',3001234567,'admin123'),(1096189669,'Jerson Suarez','jersonsuarez12@ecoamigos.com',3001234567,'admin123');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrios` (
  `id_barrio` int NOT NULL AUTO_INCREMENT,
  `id_comuna` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_barrio`),
  KEY `fk_barrios_comuna` (`id_comuna`),
  CONSTRAINT `fk_barrios_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,1,'el recreo'),(2,1,'la victoria'),(3,1,'Palmira'),(4,1,'Buenos aires'),(5,1,'Las playas'),(6,1,'Arenal'),(7,1,'Buenos aires'),(8,1,'Palmira'),(9,2,'Aguas Claras'),(10,2,'Ciudad Bolívar'),(11,2,'Olaya Herrera'),(12,3,'Belén'),(13,3,'La Paz'),(14,3,'Santa Isabel'),(15,4,'Bellavista'),(16,4,'El Bosque'),(17,4,'Los Pinos'),(18,5,'Chapinero'),(19,5,'Las Américas'),(20,5,'San Pedro Claver'),(21,6,'Boston'),(22,6,'Kennedy'),(23,6,'San Pedro'),(24,7,'El Campin'),(25,7,'Las Flores'),(26,7,'Nuevo Horizonte'),(27,1,'Arenal'),(28,1,'Tres unidos'),(29,1,'Colombia'),(30,2,'Aguas Claras'),(31,2,'Ciudad Bolívar'),(32,2,'Olaya Herrera'),(33,3,'Belén'),(34,3,'La Paz'),(35,3,'Santa Isabel'),(36,4,'Bellavista'),(37,4,'El Bosque'),(38,4,'Los Pinos'),(39,5,'Chapinero'),(40,5,'Las Américas'),(41,5,'San Pedro Claver'),(42,6,'Boston'),(43,6,'Kennedy'),(44,6,'San Pedro'),(45,7,'El Campin'),(46,7,'Las Flores'),(47,7,'Nuevo Horizonte'),(48,1,'Arenal'),(49,1,'Tres unidos'),(50,1,'Colombia'),(51,2,'Aguas Claras'),(52,2,'Ciudad Bolívar'),(53,2,'Olaya Herrera'),(54,3,'Belén'),(55,3,'La Paz'),(56,3,'Santa Isabel'),(57,4,'Bellavista'),(58,4,'El Bosque'),(59,4,'Los Pinos'),(60,5,'Chapinero'),(61,5,'Las Américas'),(62,5,'San Pedro Claver'),(63,6,'Boston'),(64,6,'Kennedy'),(65,6,'San Pedro'),(66,7,'El Campin'),(67,7,'Las Flores'),(68,7,'Nuevo Horizonte');
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificaciones`
--

DROP TABLE IF EXISTS `certificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificaciones` (
  `id_cert` int NOT NULL AUTO_INCREMENT,
  `id_prov` int DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cert`),
  KEY `fk_cert_proveedor` (`id_prov`),
  KEY `fk_cert_admin` (`id_admin`),
  CONSTRAINT `fk_cert_admin` FOREIGN KEY (`id_admin`) REFERENCES `administradores` (`id_admin`),
  CONSTRAINT `fk_cert_proveedor` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificaciones`
--

LOCK TABLES `certificaciones` WRITE;
/*!40000 ALTER TABLE `certificaciones` DISABLE KEYS */;
INSERT INTO `certificaciones` VALUES (1,2,1096189665,'2026-05-24 14:40:30',13,'R2'),(2,5,1096189668,'2026-06-04 12:33:25',6,'R2'),(3,10,1096189667,'2026-06-06 10:10:40',7,'R1'),(4,4,1096189665,'2026-06-12 12:04:05',7,'R2'),(5,6,1096189665,'2026-06-24 13:25:42',14,'R1');
/*!40000 ALTER TABLE `certificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunas`
--

DROP TABLE IF EXISTS `comunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunas` (
  `id_comuna` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunas`
--

LOCK TABLES `comunas` WRITE;
/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;
INSERT INTO `comunas` VALUES (1,'comuna 1'),(2,'comuna 2'),(3,'comuna 3'),(4,'comuna 4'),(5,'comuna 5'),(6,'Comuna_6'),(7,'comuna 7');
/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones` (
  `id_cupon` int NOT NULL AUTO_INCREMENT,
  `id_admin` int DEFAULT NULL,
  `id_prov` int DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `monto` bigint DEFAULT NULL,
  PRIMARY KEY (`id_cupon`),
  KEY `fk_cupones_admin` (`id_admin`),
  KEY `fk_cupones_proveedor` (`id_prov`),
  CONSTRAINT `fk_cupones_admin` FOREIGN KEY (`id_admin`) REFERENCES `administradores` (`id_admin`),
  CONSTRAINT `fk_cupones_proveedor` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
INSERT INTO `cupones` VALUES (1,1096189669,1,'2026-05-06 10:00:00','2026-05-06 23:59:59',234000),(2,1096189668,2,'2026-05-06 11:30:00','2026-05-06 23:59:59',244500),(3,1096189667,3,'2026-05-06 09:15:00','2026-05-06 23:59:59',300000),(4,1096189666,6,'2026-05-06 14:45:00','2026-05-06 23:59:59',123400),(5,1096189665,9,'2026-05-06 16:20:00','2026-05-06 23:59:59',300000);
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` bigint DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1003,'ACU','Aceite de cocina usado',1200),(1004,'ACU','Detergente',4500),(1005,'ACU','Jabon',3500),(1006,'ACU','Combustible',6500),(1007,'ACU','Varsol',3000);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_prov` int NOT NULL AUTO_INCREMENT,
  `tipo_id` varchar(25) DEFAULT NULL,
  `tipo_prov` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_barrio` int DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `celular` bigint DEFAULT NULL,
  `contrasena` varchar(30) DEFAULT NULL,
  `puntos` int DEFAULT NULL,
  PRIMARY KEY (`id_prov`),
  KEY `fk_proveedores_barrio` (`id_barrio`),
  CONSTRAINT `fk_proveedores_barrio` FOREIGN KEY (`id_barrio`) REFERENCES `barrios` (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'NIT','Restaurant','Chiflas','cll 60',1,'chiflas@gmail.com',3153954889,'proveedor1',2340),(2,'NIT','Restaurant','German Parrilla','cll 60',2,'german@gmail.com',3153954889,'proveedor2',2445),(3,'NIT','Restaurant','Mora Fresh','cll 60',3,'mora@gmail.com',3153954889,'proveedor3',3000),(4,'NIT','Restaurant','Chatarra','cll 60',1,'chatarra@gmail.com',3153954889,'proveedor4',200),(5,'NIT','Restaurant','Mud','cll 60',2,'mud@gmail.com',3153954889,'proveedor5',250),(6,'TI','Persona','Laura','cll 60',3,'laura@gmail.com',3153954889,'proveedor6',1234),(7,'CC','Persona','Eduardo','cll 60',1,'edu@gmail.com',3153954889,'proveedor7',567),(8,'CC','Persona','Sherol','cll 60',2,'sherol@gmail.com',3153954889,'proveedor8',100),(9,'TI','Persona','Daniela','cll 60',2,'dani@gmail.com',3153954889,'proveedor9',1235),(10,'PPT','Persona','Emiliano','cll 60',3,'emi@gmail.com',3153954889,'proveedor10',150);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recolectores`
--

DROP TABLE IF EXISTS `recolectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recolectores` (
  `id_rec` int NOT NULL AUTO_INCREMENT,
  `id_barrio` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `celular` bigint DEFAULT NULL,
  `contrasena` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_rec`),
  KEY `fk_recolectores_barrio` (`id_barrio`),
  CONSTRAINT `fk_recolectores_barrio` FOREIGN KEY (`id_barrio`) REFERENCES `barrios` (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recolectores`
--

LOCK TABLES `recolectores` WRITE;
/*!40000 ALTER TABLE `recolectores` DISABLE KEYS */;
INSERT INTO `recolectores` VALUES (1,1,'Carlos Mendoza','Cll 45 #12-30','carlos.mendoza@gmail.com',3101234567,'reco1'),(2,2,'Andrés Vargas','Av Antonio Nariño #8','andres.vargas@gmail.com',3112345678,'reco2'),(3,3,'Luisa Fernández','16 De Marzo #22-10','luisa.fernandez@gmail.com',3123456789,'reco3'),(4,1,'Miguel Torres','Altos Del Campestre #5','miguel.torres@gmail.com',3134567890,'reco4'),(5,2,'Valentina Ruiz','Cll 60 #3-15','valentina.ruiz@gmail.com',3145678901,'reco5');
/*!40000 ALTER TABLE `recolectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id_solic` int NOT NULL AUTO_INCREMENT,
  `id_prov` int DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cant_aprox` int DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_solic`),
  KEY `fk_solicitudes_proveedor` (`id_prov`),
  KEY `fk_solicitudes_producto` (`id_producto`),
  CONSTRAINT `fk_solicitudes_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_solicitudes_proveedor` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,1,'2025-01-10 08:30:00',1003,120,'TERMINADA'),(2,2,'2025-01-15 09:00:00',1003,200,'TERMINADA'),(3,6,'2025-01-20 10:15:00',1003,80,'TERMINADA'),(4,3,'2025-02-05 11:00:00',1003,150,'TERMINADA'),(5,7,'2025-02-10 14:30:00',1003,60,'TERMINADA'),(6,4,'2025-02-18 08:00:00',1003,180,'TERMINADA'),(7,8,'2025-03-01 09:45:00',1003,90,'TERMINADA'),(8,5,'2025-03-12 13:00:00',1003,210,'TERMINADA'),(9,9,'2025-03-20 10:00:00',1003,70,'PENDIENTE'),(10,1,'2025-04-02 08:30:00',1003,130,'EN PROCESO'),(11,10,'2025-04-10 11:15:00',1003,55,'CANCELADA'),(12,2,'2025-04-15 09:00:00',1003,175,'PENDIENTE'),(13,6,'2025-04-22 14:00:00',1003,65,'EN PROCESO'),(14,3,'2025-05-03 10:30:00',1003,140,'CANCELADA'),(15,9,'2025-05-10 08:00:00',1003,85,'PENDIENTE'),(16,4,'2025-05-15 09:30:00',1004,300,'TERMINADA'),(17,7,'2025-05-20 11:00:00',1004,95,'TERMINADA'),(18,5,'2025-06-01 13:45:00',1004,220,'EN PROCESO'),(19,8,'2025-06-08 10:00:00',1004,110,'CANCELADA'),(20,10,'2025-06-15 08:30:00',1004,75,'Cancelado');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `id_rec` int DEFAULT NULL,
  `fecha_recoleccion` datetime DEFAULT NULL,
  `canti_recolectada` int DEFAULT NULL,
  `solicitudes_id_solic` int DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `fk_visitas_recolector` (`id_rec`),
  KEY `fk_visitas_solicitud` (`solicitudes_id_solic`),
  CONSTRAINT `fk_visitas_recolector` FOREIGN KEY (`id_rec`) REFERENCES `recolectores` (`id_rec`),
  CONSTRAINT `fk_visitas_solicitud` FOREIGN KEY (`solicitudes_id_solic`) REFERENCES `solicitudes` (`id_solic`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES (1,1096185483,'2025-01-06 14:30:00',48,1),(2,1096182234,'2025-01-11 10:15:00',28,2),(3,1096189867,'2025-01-13 09:45:00',95,3),(4,1096180089,'2025-01-16 16:20:00',25,4),(5,1096182285,'2025-01-19 11:30:00',58,5),(6,1096185483,'2025-01-21 08:00:00',15,6),(7,1096182234,'2025-01-23 13:45:00',18,7),(8,1096189867,'2025-01-26 10:30:00',10,8),(9,1096180089,'2025-01-29 15:10:00',38,9),(10,1096182285,'2025-02-02 09:20:00',33,10);
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12  9:28:58
