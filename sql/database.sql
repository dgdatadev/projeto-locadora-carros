-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: banco de dados
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `agencia`
--

DROP TABLE IF EXISTS `agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencia` (
  `NumAg` int NOT NULL,
  `Rua` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `Contato` varchar(100) NOT NULL,
  PRIMARY KEY (`NumAg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia`
--

LOCK TABLES `agencia` WRITE;
/*!40000 ALTER TABLE `agencia` DISABLE KEYS */;
INSERT INTO `agencia` VALUES (1,'Rua das Flores','São Paulo','SP','1234-5678'),(2,'Avenida Paulista','São Paulo','SP','2345-6789'),(3,'Rua dos Andradas','Rio de Janeiro','RJ','3456-7890'),(4,'Avenida Brasil','Belo Horizonte','MG','4567-8901'),(5,'Rua XV de Novembro','Curitiba','PR','5678-9012'),(6,'Rua da Praia','Porto Alegre','RS','6789-0123'),(7,'Avenida Getúlio Vargas','Salvador','BA','7890-1234'),(8,'Rua das Palmeiras','Recife','PE','8901-2345'),(9,'Avenida Rio Branco','Fortaleza','CE','9012-3456'),(10,'Rua dos Pinheiros','Brasília','DF','0123-4567');
/*!40000 ALTER TABLE `agencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel` (
  `Data` date NOT NULL,
  `CNH` varchar(100) NOT NULL,
  `Placa` varchar(100) NOT NULL,
  PRIMARY KEY (`CNH`,`Placa`),
  KEY `Placa` (`Placa`),
  CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`CNH`) REFERENCES `cliente` (`CNH`),
  CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`Placa`) REFERENCES `carro` (`Placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
INSERT INTO `aluguel` VALUES ('2024-05-19','10123456789','CDE9F19'),('2024-05-10','11234567890','BCD0E21'),('2024-05-01','12345678901','ABC1D23'),('2024-05-20','21234567890','FGH0I41'),('2024-05-11','22345678901','EFG1H43'),('2024-05-02','23456789012','DEF2G45'),('2024-05-21','32345678901','IJK1L63'),('2024-05-12','33456789012','HIJ2K65'),('2024-05-03','34567890123','GHI3J67'),('2024-05-22','43456789012','LMN2O85'),('2024-05-13','44567890123','KLM3N87'),('2024-05-04','45678901234','JKL4M89'),('2024-05-23','54567890123','OPQ3R07'),('2024-05-14','55678901234','NOP4Q09'),('2024-05-05','56789012345','MNO5P10'),('2024-05-24','65678901234','RST4U29'),('2024-05-15','66789012345','QRS5T31'),('2024-05-06','67890123456','PQR6S32'),('2024-05-25','76789012345','UVW5X51'),('2024-05-16','77890123456','TUV6W53'),('2024-05-07','78901234567','STU7V54'),('2024-05-17','88901234567','WXY7Z75'),('2024-05-08','89012345678','VWX8Y76'),('2024-05-09','90123456789','YZA9B98'),('2024-05-18','99012345678','ZAB8C97');
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `Placa` varchar(100) NOT NULL,
  `Modelo` varchar(100) NOT NULL,
  `Ano` int NOT NULL,
  `NumAg` int NOT NULL,
  PRIMARY KEY (`Placa`),
  KEY `NumAg` (`NumAg`),
  CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`NumAg`) REFERENCES `agencia` (`NumAg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES ('ABC1D23','Fiat Argo',2020,1),('BCD0E21','Nissan Kicks',2023,10),('CDE9F19','Peugeot 208',2022,9),('DEF2G45','Hyundai HB20',2021,2),('EFG1H43','Volkswagen T-Cross',2021,1),('FGH0I41','Citroën C4 Cactus',2023,10),('GHI3J67','Chevrolet Onix',2019,3),('HIJ2K65','Chevrolet Tracker',2022,2),('IJK1L63','Volkswagen Nivus',2021,1),('JKL4M89','Volkswagen Gol',2018,4),('KLM3N87','Hyundai Creta',2020,3),('LMN2O85','Honda WR-V',2020,2),('MNO5P10','Ford Ka',2020,5),('NOP4Q09','Toyota Yaris',2021,4),('OPQ3R07','Chevrolet Spin',2022,3),('PQR6S32','Renault Kwid',2022,6),('QRS5T31','Honda HR-V',2023,5),('RST4U29','Toyota Hilux',2021,4),('STU7V54','Honda Civic',2021,7),('TUV6W53','Fiat Pulse',2022,6),('UVW5X51','Jeep Commander',2023,5),('VWX8Y76','Toyota Corolla',2020,8),('WXY7Z75','Renault Duster',2020,7),('YZA9B98','Jeep Renegade',2022,9),('ZAB8C97','Jeep Compass',2021,8);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CNH` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cartao` int NOT NULL,
  `Telefone` varchar(100) NOT NULL,
  PRIMARY KEY (`CNH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('10123456789','Rebeca Fernandes',446688,'(51)95544-3322'),('11234567890','Cauê da Rocha',667788,'(41)94433-2211'),('12345678901','Breno Gonçalves',123456,'(11)91234-5678'),('21234567890','Lucas Monteiro',778833,'(61)94433-2211'),('22345678901','Guilherme Pinto',990011,'(51)93322-1100'),('23456789012','Davi Lucas Santos',654321,'(21)94321-8765'),('32345678901','Laura Monteiro',991144,'(71)93322-1100'),('33456789012','Pedro Miguel Mendes',334455,'(61)92211-0099'),('34567890123','Ana Lívia Cavalcanti',112233,'(31)98765-4321'),('43456789012','Joana da Mota',223366,'(81)92211-0099'),('44567890123','Isis Lopes',778800,'(71)91100-9988'),('45678901234','Luiz Otávio Viana',445566,'(41)92233-4455'),('54567890123','Nathan Vieira',446699,'(11)91100-9988'),('55678901234','Matheus Barros',112255,'(81)90099-8877'),('56789012345','João Pedro Pinto',778899,'(51)99988-7766'),('65678901234','Lavínia da Mota',779911,'(21)90099-8877'),('66789012345','Eduardo da Cruz',336677,'(11)99988-7766'),('67890123456','Esther das Neves',332211,'(61)98877-6655'),('76789012345','Heloísa da Paz',223377,'(31)99988-7766'),('77890123456','Isadora Almeida',559988,'(21)98877-6655'),('78901234567','Juliana Freitas',556677,'(71)97766-5544'),('88901234567','Nathan Freitas',991122,'(31)97766-5544'),('89012345678','Leonardo Azevedo',889900,'(81)96655-4433'),('90123456789','Rafaela Peixoto',223344,'(31)95544-3322'),('99012345678','João Lucas da Mata',223355,'(41)96655-4433');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 12:24:28
