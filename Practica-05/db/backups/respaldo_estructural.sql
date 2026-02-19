-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: abd_practica05_ph
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cat_apellidos`
--

DROP TABLE IF EXISTS `cat_apellidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_apellidos` (
  `apellido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_nombres`
--

DROP TABLE IF EXISTS `cat_nombres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_nombres` (
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_defunciones`
--

DROP TABLE IF EXISTS `tbb_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_departamentos`
--

DROP TABLE IF EXISTS `tbb_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_diagnosticos`
--

DROP TABLE IF EXISTS `tbb_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_diagnosticos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_dietas`
--

DROP TABLE IF EXISTS `tbb_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_nacimientos`
--

DROP TABLE IF EXISTS `tbb_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `estatus_medico` varchar(150) DEFAULT NULL,
  `estatus_vida` enum('Vivo','Finado','Coma','Vegetativo','Desconocido') NOT NULL,
  `fecha_ultima_citamedica` datetime DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `fk_persona_fisica` FOREIGN KEY (`ID`) REFERENCES `tbb_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personal`
--

DROP TABLE IF EXISTS `tbb_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personal_medico`
--

DROP TABLE IF EXISTS `tbb_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `rfc` varchar(45) DEFAULT NULL,
  `pais_origen` varchar(45) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_fisicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo_cortesia` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `genero` enum('H','M','N/B') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `curp` (`curp`),
  CONSTRAINT `fk_persona` FOREIGN KEY (`ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personas_morales`
--

DROP TABLE IF EXISTS `tbb_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_morales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_proveedores`
--

DROP TABLE IF EXISTS `tbb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_recetas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_transacciones_financieras`
--

DROP TABLE IF EXISTS `tbb_transacciones_financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transacciones_financieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_traslados`
--

DROP TABLE IF EXISTS `tbb_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_tratamientos`
--

DROP TABLE IF EXISTS `tbb_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_areas`
--

DROP TABLE IF EXISTS `tbc_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_cirugias`
--

DROP TABLE IF EXISTS `tbc_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_equipamientos`
--

DROP TABLE IF EXISTS `tbc_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_espacios`
--

DROP TABLE IF EXISTS `tbc_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_medicamentos`
--

DROP TABLE IF EXISTS `tbc_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_organos`
--

DROP TABLE IF EXISTS `tbc_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_organos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_patologias`
--

DROP TABLE IF EXISTS `tbc_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_servicios`
--

DROP TABLE IF EXISTS `tbc_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_signos_vitales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_accesos`
--

DROP TABLE IF EXISTS `tbd_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_accesos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_aprobaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_campanias`
--

DROP TABLE IF EXISTS `tbd_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_citas_medicas`
--

DROP TABLE IF EXISTS `tbd_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_horarios`
--

DROP TABLE IF EXISTS `tbd_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_lotes_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_padecimientos`
--

DROP TABLE IF EXISTS `tbd_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_valoraciones`
--

DROP TABLE IF EXISTS `tbd_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('insert','update','delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3000002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_grants_por_roles`
--

DROP TABLE IF EXISTS `vw_grants_por_roles`;
/*!50001 DROP VIEW IF EXISTS `vw_grants_por_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_grants_por_roles` AS SELECT 
 1 AS `linea`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_usuarios`
--

DROP TABLE IF EXISTS `vw_roles_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'abd_practica05_ph'
--

--
-- Final view structure for view `vw_grants_por_roles`
--

/*!50001 DROP VIEW IF EXISTS `vw_grants_por_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_grants_por_roles` AS select '---------------- GERENCIA ----------------' AS `linea` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_2` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'ge_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- RECURSOS HUMANOS ----------------' AS `---------------- RECURSOS HUMANOS ----------------` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_4` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'hr_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- RECURSOS MATERIALES ----------------' AS `---------------- RECURSOS MATERIALES ----------------` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_6` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'mr_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- SERVICIOS MÉDICOS ----------------' AS `---------------- SERVICIOS MÉDICOS ----------------` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_8` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'ms_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- REGISTROS MÉDICOS ----------------' AS `---------------- REGISTROS MÉDICOS ----------------` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_10` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'md_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- FARMACIA ----------------' AS `---------------- FARMACIA ----------------` union all select concat('GRANT ',group_concat(distinct `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', '),' ON `',`information_schema`.`table_privileges`.`TABLE_SCHEMA`,'`.`',`information_schema`.`table_privileges`.`TABLE_NAME`,'` TO ',`information_schema`.`table_privileges`.`GRANTEE`,';') AS `Name_exp_12` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`GRANTEE` like '\'ph_user\'@%') group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` union all select '---------------- DEVELOPER ----------------' AS `---------------- DEVELOPER ----------------` union all select concat('GRANT ',convert(group_concat(`privileges`.`priv` separator ', ') using utf8mb3),' ON `',`privileges`.`Db`,'`.* TO \'',`privileges`.`User`,'\'@\'',convert(`privileges`.`Host` using utf8mb3),'\';') AS `Name_exp_14` from (select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Select_priv` = 'Y') then 'SELECT' end) AS `priv` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142')) union all select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Insert_priv` = 'Y') then 'INSERT' end) AS `CASE WHEN Insert_priv='Y' THEN 'INSERT' END` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142')) union all select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Update_priv` = 'Y') then 'UPDATE' end) AS `CASE WHEN Update_priv='Y' THEN 'UPDATE' END` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142')) union all select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Delete_priv` = 'Y') then 'DELETE' end) AS `CASE WHEN Delete_priv='Y' THEN 'DELETE' END` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142')) union all select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Create_priv` = 'Y') then 'CREATE' end) AS `CASE WHEN Create_priv='Y' THEN 'CREATE' END` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142')) union all select `mysql`.`db`.`User` AS `User`,`mysql`.`db`.`Host` AS `Host`,`mysql`.`db`.`Db` AS `Db`,(case when (`mysql`.`db`.`Alter_priv` = 'Y') then 'ALTER' end) AS `CASE WHEN Alter_priv='Y' THEN 'ALTER' END` from `mysql`.`db` where ((`mysql`.`db`.`User` = 'developer') and (`mysql`.`db`.`Db` = 'hospital_230142'))) `privileges` where (`privileges`.`priv` is not null) group by `privileges`.`User`,`privileges`.`Host`,`privileges`.`Db` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios` AS select 1 AS `usuario`,1 AS `host`,1 AS `roles_asignados` */;
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

-- Dump completed on 2026-02-17 15:07:55
