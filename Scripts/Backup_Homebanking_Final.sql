-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: homebanking
-- ------------------------------------------------------
-- Server version	8.0.30

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

-- Creación de la base de datos
CREATE DATABASE homebanking ;

USE homebanking;

--
-- Table structure for table `caja_seguridad`
--

DROP TABLE IF EXISTS `caja_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja_seguridad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `monto` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`id_cliente`),
  CONSTRAINT `id` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_seguridad`
--

LOCK TABLES `caja_seguridad` WRITE;
/*!40000 ALTER TABLE `caja_seguridad` DISABLE KEYS */;
INSERT INTO `caja_seguridad` VALUES (1,1,'2022-09-01','2023-08-30',20500,1),(2,2,'2022-09-01','2023-08-30',20500,2),(3,3,'2022-09-01','2023-08-30',20500,3),(4,4,'2022-09-01','2023-08-30',20500,4),(5,5,'2022-09-01','2023-08-30',20500,5),(6,6,'2022-09-01','2023-08-30',20500,1),(7,7,'2022-09-01','2023-08-30',20500,6),(8,8,'2022-09-01','2023-08-30',20500,7),(9,9,'2022-09-01','2023-08-30',20500,8),(10,10,'2022-09-01','2023-08-30',20500,9);
/*!40000 ALTER TABLE `caja_seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_prestamo`
--

DROP TABLE IF EXISTS `cliente_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `monto` int NOT NULL,
  `cuota` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_prestamo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_prestamo_idx` (`id_prestamo`),
  CONSTRAINT `cliente_prestamo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `id_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_prestamo`
--

LOCK TABLES `cliente_prestamo` WRITE;
/*!40000 ALTER TABLE `cliente_prestamo` DISABLE KEYS */;
INSERT INTO `cliente_prestamo` VALUES (1,'Prestamo personal',3000000,12,1,1),(2,'Prestamo hipotecario',10000000,48,1,2),(3,'Prestamo prendario',8000000,36,2,3),(4,'Prestamo Hipotecario UVA',11000000,72,3,4),(5,'Prestamo via Acuerdo en descubierto',5000000,24,4,5),(6,'Prestamo automotriz',9000000,12,4,6),(7,'Prestamo prendario',7500000,36,5,3),(8,'Prestamo Hipotecario UVA',15000000,72,6,4),(9,'Prestamo via Acuerdo en descubierto',5000000,24,7,5);
/*!40000 ALTER TABLE `cliente_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_seguro`
--

DROP TABLE IF EXISTS `cliente_seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_seguro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_seguro` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_seguro_idx` (`id_seguro`),
  CONSTRAINT `cliente_seguro_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `id_seguro` FOREIGN KEY (`id_seguro`) REFERENCES `seguros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_seguro`
--

LOCK TABLES `cliente_seguro` WRITE;
/*!40000 ALTER TABLE `cliente_seguro` DISABLE KEYS */;
INSERT INTO `cliente_seguro` VALUES (1,'2022-11-18','2023-11-18',1,1),(2,'2022-11-19','2023-11-19',2,2),(3,'2022-11-20','2023-11-20',3,3),(4,'2022-11-21','2023-11-21',1,4),(5,'2022-11-22','2023-11-22',4,5),(6,'2022-11-23','2023-11-23',5,6),(7,'2022-11-24','2023-11-24',6,7),(8,'2022-11-25','2023-11-25',7,8),(9,'2022-11-26','2023-11-26',8,9),(10,'2022-11-27','2023-11-27',9,10);
/*!40000 ALTER TABLE `cliente_seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `id_domicilio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_domicilio_idx` (`id_domicilio`),
  CONSTRAINT `id_domicilio` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Dennison','Stokey','dstokey0@nsw.gov.au',1),(2,'Kial','Staniland','kstaniland1@dot.gov',2),(3,'Napoleon','Remmers','nremmers2@nsw.gov.au',3),(4,'Bail','Oakenfall','boakenfall3@example.com',4),(5,'Saidee','Farnorth','sfarnorth4@tinyurl.com',5),(6,'Tamiko','Quinell','tquinell5@google.nl',6),(7,'Maurita','Nealon','mnealon6@china.com.cn',7),(8,'Emeline','Dobbinson','edobbinson7@trellian.com',8),(9,'Catarina','Stiggers','cstiggers8@discovery.com',9),(10,'Juieta','Egdal','jegdal9@facebook.com',10);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_inversion`
--

DROP TABLE IF EXISTS `cuenta_inversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_inversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` int NOT NULL,
  `fecha` date NOT NULL,
  `id_cuenta` int NOT NULL,
  `id_inversion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuenta_idx` (`id_cuenta`),
  KEY `id_inversion_idx` (`id_inversion`),
  CONSTRAINT `cuenta_inversion_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id`),
  CONSTRAINT `id_inversion` FOREIGN KEY (`id_inversion`) REFERENCES `inversiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_inversion`
--

LOCK TABLES `cuenta_inversion` WRITE;
/*!40000 ALTER TABLE `cuenta_inversion` DISABLE KEYS */;
INSERT INTO `cuenta_inversion` VALUES (1,500000,'2022-08-10',1,1),(2,1000000,'2022-09-01',2,2),(3,750000,'2022-10-22',3,3),(4,900000,'2022-10-14',4,4),(5,4000000,'2022-11-02',5,5),(6,5000000,'2022-10-20',6,6);
/*!40000 ALTER TABLE `cuenta_inversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `tipo` enum('caja de ahorro','cuenta corriente') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `balance` double NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'VIN001','caja de ahorro','2021-10-02 00:00:00',1000000,1),(2,'VIN002','cuenta corriente','2020-11-30 00:00:00',2000000,1),(3,'VIN003','caja de ahorro','2019-05-10 00:00:00',1500000.5,2),(4,'VIN004','caja de ahorro','2022-01-20 00:00:00',5000000,3),(5,'VIN005','cuenta corriente','2018-06-16 00:00:00',35000000,4),(6,'VIN006','cuenta corriente','2021-12-01 00:00:00',36000000,5),(7,'VIN007','cuenta corriente','2022-04-08 00:00:00',111563,6),(8,'VIN008','caja de ahorro','2022-04-08 00:00:00',15486,9),(9,'VIN009','caja de ahorro','2021-09-01 00:00:00',4521338.2,7),(10,'VIN010','caja de ahorro','2019-09-21 00:00:00',456987.3,8);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logs_cuentas_update` AFTER UPDATE ON `cuentas` FOR EACH ROW begin
	insert into logs_cuentas
    values(null, curdate(), cliente_by_cuenta_SP(new.numero), new.numero, old.tipo, concat("Se actualizó el tipo de cuenta a ", new.tipo), user());    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logs_cuentas_delete` BEFORE DELETE ON `cuentas` FOR EACH ROW begin
	insert into logs_cuentas
    values(null, curdate(), cliente_by_cuenta_SP(old.numero), old.numero, old.tipo, "Se elimino la cuenta", user());    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(75) NOT NULL,
  `provincia` varchar(75) NOT NULL,
  `codigo_postal` varchar(75) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `piso_departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
INSERT INTO `domicilios` VALUES (1,'Villa Maria','Cordoba','5900','Santiago del Estero 1500','1-8'),(2,'Cordoba','Cordoba','5000','Italia 1250','4-B'),(3,'Rio Tercero','Cordoba','5000','San Martin 722',''),(4,'San Miguel de Tucuman','Tucuman','4000','Buenos Aires 4033','5-1'),(5,'Rosario','Santa Fe','2000','General Paz',''),(6,'Comodoro Rivadavia','Chubut','9000','Jose Ingenieros 220','1-1'),(7,'Ushuaia','Tierra del Fuego','9410','Manuel Belgrano',''),(8,'Salta','Salta','4400','Sarmiento 500',''),(9,'Mendoza','Mendoza','5500','EspaÃ±a 123','5-D'),(10,'La Plata','Buenos Aires','1900','9 de Julio 640','');
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inversiones`
--

DROP TABLE IF EXISTS `inversiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inversiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `monto_max` int NOT NULL,
  `ganancia` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inversiones`
--

LOCK TABLES `inversiones` WRITE;
/*!40000 ALTER TABLE `inversiones` DISABLE KEYS */;
INSERT INTO `inversiones` VALUES (1,'Compra/venta dolares','Otras inversiones',1000000,0.15),(2,'Compra/venta valores negociables','Otras inversiones',1000000,0.2),(3,'Licitaciones','Otras inversiones',1500000,0.25),(4,'Pre-cancelable en UVA','Plazo fijo',10000000,0.15),(5,'Cancelacion anticipada','Plazo fijo',5000000,0.1),(6,'Fondos depositados en otros bancos','Plazo fijo',10000000,0.2);
/*!40000 ALTER TABLE `inversiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_cuentas`
--

DROP TABLE IF EXISTS `logs_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_cuentas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `cuenta` varchar(45) NOT NULL,
  `tipo` enum('caja de ahorro','cuenta corriente') NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_cuentas`
--

LOCK TABLES `logs_cuentas` WRITE;
/*!40000 ALTER TABLE `logs_cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_tarjetas`
--

DROP TABLE IF EXISTS `logs_tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_tarjetas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `tarjeta` varchar(45) NOT NULL,
  `tipo` enum('debito','credito') NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_tarjetas`
--

LOCK TABLES `logs_tarjetas` WRITE;
/*!40000 ALTER TABLE `logs_tarjetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `monto_maximo` int NOT NULL,
  `numero_cuotas` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,'Prestamo personal',3000000,12),(2,'Prestamo hipotecario',10000000,48),(3,'Prestamo prendario',8000000,36),(4,'Prestamo Hipotecario UVA',15000000,72),(5,'Prestamo via Acuerdo en descubierto',5000000,24),(6,'Prestamo automotriz',1000000,12);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prestamos_solicitados`
--

DROP TABLE IF EXISTS `prestamos_solicitados`;
/*!50001 DROP VIEW IF EXISTS `prestamos_solicitados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prestamos_solicitados` AS SELECT 
 1 AS `Cliente`,
 1 AS `Prestamo`,
 1 AS `Monto solicitado`,
 1 AS `N° de cuotas`,
 1 AS `Monto p/ cuota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `registro_por_cliente`
--

DROP TABLE IF EXISTS `registro_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `registro_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `registro_por_cliente` AS SELECT 
 1 AS `Cliente`,
 1 AS `Cant. de cuentas`,
 1 AS `Cant. de prestamos`,
 1 AS `Cant. de tarjetas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seguros`
--

DROP TABLE IF EXISTS `seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `monto` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguros`
--

LOCK TABLES `seguros` WRITE;
/*!40000 ALTER TABLE `seguros` DISABLE KEYS */;
INSERT INTO `seguros` VALUES (1,'Seguro de vida','Personales',10000),(2,'Seguro de vida con ahorro','Personales',20000),(3,'Seguro de accidentes personales','Personales',15000),(4,'Seguro de sepelio','Personales',1800),(5,'Seguro de robo','Patrimoniales',5000),(6,'Seguros de vehiculos automotores','Patrimoniales',10000),(7,'Seguro de desempleo involuntario','Patrimoniales',9000),(8,'Seguro de incendio','Patrimoniales',8000),(9,'Seguro de responsabilidad civil','Patrimoniales',8000),(10,'Seguros de asistencia al viajero','Servicios',5000),(11,'Seguros de decesos','Servicios',6000),(12,'Seguros de defensa juridica','Servicios',9000);
/*!40000 ALTER TABLE `seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int NOT NULL,
  `id_tarjeta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`id_tarjeta`),
  CONSTRAINT `id_tarjeta` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Luz','2022-09-20',2500,1),(2,'Gas','2022-12-02',900,2),(3,'Cable','2022-10-10',2650,3),(4,'Internet','2022-08-20',3100,4),(5,'Caja seguridad','2022-10-05',1200,5),(6,'Personal','2022-11-16',2700,6),(7,'Claro','2022-10-19',2000,7);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `servicios_insert` AFTER INSERT ON `servicios` FOR EACH ROW begin
	insert into transacciones
    values(null, "credito", new.monto, concat("Se realizó el pago de ", new.nombre), curdate(), get_cuenta_by_tarjeta_id(new.id_tarjeta));    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sumatoria_transacciones`
--

DROP TABLE IF EXISTS `sumatoria_transacciones`;
/*!50001 DROP VIEW IF EXISTS `sumatoria_transacciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sumatoria_transacciones` AS SELECT 
 1 AS `Cliente`,
 1 AS `N° de cuenta`,
 1 AS `Creditos totales`,
 1 AS `Debitos totales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('credito','debito') NOT NULL,
  `numero` varchar(45) NOT NULL,
  `nombre_titular` varchar(45) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `cvv` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
INSERT INTO `tarjetas` VALUES (1,'credito','5420-4563-1456-0100','Dennison Stokey','2022-08-01 00:00:00','2045-10-06 00:00:00',456,1),(2,'debito','5420-4563-1456-0101','Kial Staniland','2022-08-02 00:00:00','2045-10-07 00:00:00',782,2),(3,'debito','5420-4563-1456-0102','Napoleon Remmers','2022-08-03 00:00:00','2045-10-08 00:00:00',654,3),(4,'credito','5420-4563-1456-0103','Bail Oakenfall','2022-08-04 00:00:00','2045-10-09 00:00:00',328,4),(5,'credito','5420-4563-1456-0104','Saidee Farnorth','2022-08-05 00:00:00','2045-10-10 00:00:00',321,5),(6,'debito','5420-4563-1456-0105','Tamiko Quinell','2022-08-06 00:00:00','2045-10-11 00:00:00',852,6),(7,'debito','5420-4563-1456-0106','Maurita Nealon','2022-08-07 00:00:00','2045-10-12 00:00:00',789,7),(8,'credito','5420-4563-1456-0107','Emeline Dobbinson','2022-08-08 00:00:00','2045-10-13 00:00:00',369,8),(9,'credito','5420-4563-1456-0108','Catarina Stiggers','2022-08-09 00:00:00','2045-10-14 00:00:00',741,9),(10,'credito','5420-4563-1456-0109','Juieta Egdal','2022-08-10 00:00:00','2045-10-15 00:00:00',753,10),(11,'credito','5420-4563-1456-0209','Juieta Egdal','2022-08-10 00:00:00','2022-09-15 00:00:00',753,10),(12,'debito','5420-4563-1456','Juieta Egdal','2022-08-10 00:00:00','2022-09-16 00:00:00',753,10);
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logs_tarjetas_delete` BEFORE DELETE ON `tarjetas` FOR EACH ROW begin
	insert into logs_tarjetas
    values(null, curdate(), cliente_by_tarjeta(old.id), old.numero, old.tipo, concat("Se eliminó la tarjeta vencida el dia ", date(old.fecha_vencimiento)), user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `tarjetas_vencidas`
--

DROP TABLE IF EXISTS `tarjetas_vencidas`;
/*!50001 DROP VIEW IF EXISTS `tarjetas_vencidas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tarjetas_vencidas` AS SELECT 
 1 AS `Cliente`,
 1 AS `Numero de tarjeta`,
 1 AS `Tipo`,
 1 AS `Venció`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('credito','debito') NOT NULL,
  `monto` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_cuenta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuenta_idx` (`id_cuenta`),
  CONSTRAINT `id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,'credito',500,'otros','2022-09-02 00:00:00',1),(2,'debito',2000,'transferencia','2022-09-03 00:00:00',3),(3,'debito',10000,'transferencia','2022-09-04 00:00:00',3),(4,'credito',1500,'Pago Netflix','2022-09-05 00:00:00',2),(5,'credito',10000.75,'Pago cuota celular','2022-09-06 00:00:00',4),(6,'credito',1000000,'Deposito sueldo','2022-09-07 00:00:00',5),(7,'credito',120000,'Deposito sueldo','2022-09-08 00:00:00',6),(8,'credito',200000,'Deposito sueldo','2022-09-09 00:00:00',7),(9,'credito',15000,'otros','2022-09-10 00:00:00',8),(10,'debito',2500,'transferencia','2022-09-11 00:00:00',9),(11,'credito',2500,'Se realizó el pago de Luz','2022-11-19 00:00:00',1),(12,'credito',900,'Se realizó el pago de Gas','2022-11-19 00:00:00',3),(13,'credito',2650,'Se realizó el pago de Cable','2022-11-19 00:00:00',4),(14,'credito',3100,'Se realizó el pago de Internet','2022-11-19 00:00:00',5),(15,'credito',1200,'Se realizó el pago de Caja seguridad','2022-11-19 00:00:00',6),(16,'credito',2700,'Se realizó el pago de Personal','2022-11-19 00:00:00',7),(17,'credito',2000,'Se realizó el pago de Claro','2022-11-19 00:00:00',9);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transacciones_año_actual`
--

DROP TABLE IF EXISTS `transacciones_año_actual`;
/*!50001 DROP VIEW IF EXISTS `transacciones_año_actual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transacciones_año_actual` AS SELECT 
 1 AS `Cliente`,
 1 AS `Cuenta`,
 1 AS `Tipo`,
 1 AS `N° de transacciones p/ cuenta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'homebanking'
--
/*!50003 DROP FUNCTION IF EXISTS `amount_per_payments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `amount_per_payments`(p_id_prestamo int) RETURNS varchar(45) CHARSET utf8mb4
    READS SQL DATA
begin
		declare v_monto varchar(45);
        
        select concat("$ ", (cp.monto/cp.cuota))
        into v_monto
		from cliente_prestamo cp
		where cp.id = p_id_prestamo;
        
        return v_monto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cliente_by_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cliente_by_cuenta`(p_cuenta_numero varchar(45)) RETURNS varchar(45) CHARSET utf8mb4
    READS SQL DATA
begin
	declare v_cliente varchar(45);
    
    select concat(c.nombre," ", c.apellido)
    into v_cliente
    from cuentas cu
    inner join clientes c on cu.id_cliente = c.id
    where cu.numero = p_cuenta_numero;
    
    return v_cliente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cliente_by_tarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cliente_by_tarjeta`(p_tarjeta_id int) RETURNS varchar(45) CHARSET utf8mb4
    READS SQL DATA
begin
	declare v_cliente varchar(45);
    
    select concat(c.nombre," ", c.apellido)
    into v_cliente
    from tarjetas t
    inner join clientes c on t.id_cliente = c.id
    where t.id = p_tarjeta_id;
    
    return v_cliente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_cuenta_by_tarjeta_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_cuenta_by_tarjeta_id`(p_id_tarjeta int) RETURNS int
    READS SQL DATA
begin
		declare v_cuenta_id int;
        
        select cue.id
        into v_cuenta_id from servicios s
        inner join tarjetas t on t.id=s.id_tarjeta
        inner join clientes cli on cli.id=t.id_cliente
        inner join cuentas cue on cli.id=cue.id_cliente
        where s.id_tarjeta=p_id_tarjeta
        limit 1;
        
        return v_cuenta_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_loans_by_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_loans_by_email`(p_email varchar(45)) RETURNS smallint
    READS SQL DATA
begin
		declare v_loans smallint;
        
        select count(1)
        into v_loans
		from clientes cli
		inner join cliente_prestamo cp on cp.id_cliente=cli.id
        where cli.email=p_email;
        
        return v_loans;       
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_tarjetas_vencidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_tarjetas_vencidas`(in p_tarjeta_id int)
begin

	declare v_tarjeta_id int;
    declare v_tarjeta_numero varchar(45);
    declare v_cliente varchar(45);

	-- Validar que la tarjeta exista
    select id
    into v_tarjeta_id
    from tarjetas
    where id = p_tarjeta_id;
    
    -- Validar que la tarjeta este vencida
    if v_tarjeta_id <> '' or v_tarjeta_id > 0 or v_tarjeta_id <> null then
    
		select numero
		into v_tarjeta_numero
		from tarjetas
		where id = v_tarjeta_id and date(fecha_vencimiento) < current_date();
        
        -- Si esta vencida eliminar la tarjeta
        if v_tarjeta_numero != '' then
        
			select cliente_by_tarjeta(p_tarjeta_id)
            into v_cliente;
        
			select concat("Se elimino la tarjeta ", v_tarjeta_numero, " del cliente ",v_cliente) as ok_msg;
        
			delete from tarjetas
            where id = v_tarjeta_id;
		else
			select "La tarjeta aún no esta vencida" as error_msg;
		end if;
        
    else
		select "La tarjeta no existe" as error_msg;
	end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listado_prestamos_ordenados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listado_prestamos_ordenados`(in p_orden_columna varchar(100), in p_orden_tipo varchar(100))
begin

	-- Ordena un listado de cliente_prestamos (prestamos asignados a los clientes)
	
    set @ordenar = concat(" order by ", p_orden_columna, " ", p_orden_tipo);
    set @clausula = concat("select concat(cli.nombre, ' ', cli.apellido) as 'cliente', tipo, monto from cliente_prestamo inner join clientes cli on id_cliente=cli.id", @ordenar);
	
    prepare mi_clausula from @clausula;
    execute mi_clausula;
    deallocate prepare mi_clausula;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `prestamos_solicitados`
--

/*!50001 DROP VIEW IF EXISTS `prestamos_solicitados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prestamos_solicitados` AS select concat(`cli`.`nombre`,' ',`cli`.`apellido`) AS `Cliente`,`p`.`tipo` AS `Prestamo`,`cp`.`monto` AS `Monto solicitado`,`cp`.`cuota` AS `N° de cuotas`,round((`cp`.`monto` / `cp`.`cuota`),2) AS `Monto p/ cuota` from ((`cliente_prestamo` `cp` join `clientes` `cli` on((`cp`.`id_cliente` = `cli`.`id`))) join `prestamos` `p` on((`cp`.`id_prestamo` = `p`.`id`))) order by concat(`cli`.`nombre`,' ',`cli`.`apellido`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `registro_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `registro_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `registro_por_cliente` AS select concat(`cli`.`nombre`,' ',`cli`.`apellido`) AS `Cliente`,(select count(`cu`.`id`) from (`cuentas` `cu` join `clientes` `c` on((`cu`.`id_cliente` = `c`.`id`))) where (`c`.`id` = `cli`.`id`) group by `c`.`nombre`) AS `Cant. de cuentas`,(select count(`cp`.`id`) from (`cliente_prestamo` `cp` join `clientes` `c` on((`cp`.`id_cliente` = `c`.`id`))) where (`c`.`id` = `cli`.`id`) group by `c`.`nombre`) AS `Cant. de prestamos`,(select count(`ta`.`id`) from (`tarjetas` `ta` join `clientes` `c` on((`ta`.`id_cliente` = `c`.`id`))) where (`c`.`id` = `cli`.`id`) group by `c`.`nombre`) AS `Cant. de tarjetas` from ((((`clientes` `cli` join `cuentas` `cue` on((`cue`.`id_cliente` = `cli`.`id`))) join `cliente_prestamo` `clipre` on((`clipre`.`id_cliente` = `cli`.`id`))) join `transacciones` `tran` on((`tran`.`id_cuenta` = `cue`.`id`))) join `tarjetas` `tarj` on((`tarj`.`id_cliente` = `cli`.`id`))) group by `cli`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sumatoria_transacciones`
--

/*!50001 DROP VIEW IF EXISTS `sumatoria_transacciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sumatoria_transacciones` AS select concat(`cli`.`nombre`,' ',`cli`.`apellido`) AS `Cliente`,`c`.`numero` AS `N° de cuenta`,(select sum(`tran`.`monto`) from (`transacciones` `tran` join `cuentas` `cue` on((`tran`.`id_cuenta` = `cue`.`id`))) where ((`tran`.`tipo` = 'credito') and (`cue`.`id` = `c`.`id`))) AS `Creditos totales`,(select sum(`tran`.`monto`) from (`transacciones` `tran` join `cuentas` `cue` on((`tran`.`id_cuenta` = `cue`.`id`))) where ((`tran`.`tipo` = 'debito') and (`cue`.`id` = `c`.`id`))) AS `Debitos totales` from (`cuentas` `c` join `clientes` `cli` on((`cli`.`id` = `c`.`id_cliente`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tarjetas_vencidas`
--

/*!50001 DROP VIEW IF EXISTS `tarjetas_vencidas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tarjetas_vencidas` AS select concat(`cli`.`nombre`,' ',`cli`.`apellido`) AS `Cliente`,`tarj`.`numero` AS `Numero de tarjeta`,`tarj`.`tipo` AS `Tipo`,`tarj`.`fecha_vencimiento` AS `Venció` from (`clientes` `cli` join `tarjetas` `tarj` on((`tarj`.`id_cliente` = `cli`.`id`))) where (`tarj`.`fecha_vencimiento` < curdate()) order by `tarj`.`fecha_vencimiento` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transacciones_año_actual`
--

/*!50001 DROP VIEW IF EXISTS `transacciones_año_actual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transacciones_año_actual` AS select concat(`cli`.`nombre`,' ',`cli`.`apellido`) AS `Cliente`,`cue`.`numero` AS `Cuenta`,`cue`.`tipo` AS `Tipo`,count(`tran`.`id`) AS `N° de transacciones p/ cuenta` from ((`cuentas` `cue` join `clientes` `cli` on((`cue`.`id_cliente` = `cli`.`id`))) join `transacciones` `tran` on((`tran`.`id_cuenta` = `cue`.`id`))) where (year(`tran`.`fecha`) = year(curdate())) group by `Cliente`,`Cuenta`,`cue`.`tipo` order by `Cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-19 16:38:30
