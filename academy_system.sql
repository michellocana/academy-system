# Host: localhost  (Version: 5.6.25)
# Date: 2016-01-16 01:20:22
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "aca_atualizacao_permissoes"
#

DROP TABLE IF EXISTS `aca_atualizacao_permissoes`;
CREATE TABLE `aca_atualizacao_permissoes` (
  `idUsuario` int(11) NOT NULL DEFAULT '0',
  `atualizado` enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_atualizacao_permissoes"
#


#
# Structure for table "aca_aula"
#

DROP TABLE IF EXISTS `aca_aula`;
CREATE TABLE `aca_aula` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT,
  `idModalidade` int(11) DEFAULT NULL,
  `nomeAula` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `descricaoAula` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idAula`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_aula"
#

INSERT INTO `aca_aula` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tMusculação','Aula de musculação'),(2,1,'Muay thai\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de muay thai'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tKickboxing','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de kickboxing\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(8,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tNatação\n\t\t\t\t\t\t\n\t\t\t\t\t\t','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de natação\n\t\t\t\t\t\t'),(9,1,'Nome da aula','\n\t\t\t\t\t\t\tDescrição\n\t\t\t\t\t\t'),(11,NULL,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tUma aula nova\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','Descrição da aul\n\t\t\t\t\t\t\tDescrição da aul\n\t\t\t\t\t\t\tDescrição da aul\n\t\t\t\t\t\t\tDescrição da aul\n\t\t\t\t\t\t\tDescrição da aul\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(12,NULL,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t',NULL);

#
# Structure for table "aca_cliente"
#

DROP TABLE IF EXISTS `aca_cliente`;
CREATE TABLE `aca_cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `sexo` enum('F','M') CHARACTER SET utf8 NOT NULL DEFAULT 'F',
  `endereco` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `numero` varchar(255) CHARACTER SET utf8 DEFAULT '0',
  `bairro` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cidade` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `telefone` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `mensalidade` double(11,2) DEFAULT '0.00',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_cliente"
#

INSERT INTO `aca_cliente` VALUES (2,37,1,1.5,'M','Rua bento gonçalves','1212','Centro','Novo Hamburgo','(12)1212-1212',NULL),(3,39,80,1.75,'F','Rua bento gonçalves','1200','Centro','novo hamburgo','(12)1212-1212',NULL),(5,45,69.6,1.7,'F','Rua bento gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212',NULL),(12,46,69.6,1.7,'F','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-12122',NULL),(13,47,120,1.7,'F','rua da usuária','12','12','121','(12)1212-1212',NULL);

#
# Structure for table "aca_equipamento"
#

DROP TABLE IF EXISTS `aca_equipamento`;
CREATE TABLE `aca_equipamento` (
  `idEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `idModalidade` int(11) DEFAULT NULL,
  `descricaoEquipamento` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `snAtivo` enum('ATIVO','INATIVO') CHARACTER SET utf8 NOT NULL DEFAULT 'ATIVO',
  `nomeEquipamento` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `statusEquipamento` enum('OK','COM DEFEITO','EM CONSERTO','COM DEFEITO','EM CONSERTO') CHARACTER SET utf8 NOT NULL DEFAULT 'OK',
  PRIMARY KEY (`idEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_equipamento"
#

INSERT INTO `aca_equipamento` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tasasas\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 1\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(2,2,'\n\t\t\t\t\t\t\tmais um teste\n\t\t\t\t\t\t','INATIVO','tesre','OK'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tDescrição do equipamento 3\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 3\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(73,2,'\n\t\t\t\t\t\t\tdescrição do novo equipamento\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\tNovo equipamento\n\t\t\t\t\t\t','OK'),(74,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tdescrição do equipamento novo\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tNome do equipamento novo \n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(75,1,'\n\t\t\t\t\t\t\tdescrição de mais um equipamentoa','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tmais um equipamento opa\n\t\t\t\t\t\t','COM DEFEITO'),(76,1,'descrição do equipamento','ATIVO','nome do equipamento','EM CONSERTO'),(77,2,'\n\t\t\t\t\t\t\tdescrição do novo equipamento\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tnome do novo equipamento\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','EM CONSERTO'),(80,1,'descrição','ATIVO','equipamento','OK'),(82,1,'tedste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','INATIVO','\n\t\t\t\t\t\t\tasasas\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(83,2,'teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','INATIVO','asasas','OK'),(84,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\ttestete\n\t\t\t\t\t\t','INATIVO','nome\n\t\t\t\t\t\t\tnome\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(85,2,'teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(86,3,'teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(87,2,'teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','tete\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(88,2,'teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','teste\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(89,NULL,'teste','INATIVO','','OK');

#
# Structure for table "aca_financas"
#

DROP TABLE IF EXISTS `aca_financas`;
CREATE TABLE `aca_financas` (
  `idFinanca` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoFinanca` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `valorFinanca` double(10,2) NOT NULL DEFAULT '0.00',
  `tipoFinanca` enum('DEPOSITO',' SAQUE') CHARACTER SET utf8 NOT NULL DEFAULT 'DEPOSITO',
  `dataFinanca` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `idUsuario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFinanca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_financas"
#


#
# Structure for table "aca_log_equipamento"
#

DROP TABLE IF EXISTS `aca_log_equipamento`;
CREATE TABLE `aca_log_equipamento` (
  `idLogEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipamento` int(11) NOT NULL DEFAULT '0',
  `infoLogEquipamento` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'Sem informações adicionais',
  `dataLogEquipamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mensagemLogEquipamento` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`idLogEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_log_equipamento"
#

INSERT INTO `aca_log_equipamento` VALUES (1,2,'Sem informações adicionais','2015-12-20 13:32:42','O equipamento foi desativado.'),(2,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi ativado.'),(3,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi desativado.'),(4,74,'Sem informações adicionais','2015-12-20 13:32:44','O equipamento foi desativado.'),(5,74,'Sem informações adicionais','2015-12-20 13:32:45','O equipamento foi ativado.'),(6,74,'Sem informações adicionais','2015-12-20 13:32:48','Status do equipamento alterado de COM DEFEITO para OK'),(7,75,'Conserto\n','2015-12-20 13:32:55','Status do equipamento alterado de COM DEFEITO para EM CONSERTO'),(8,75,'Sem informações adicionais','2015-12-20 13:32:59','Status do equipamento alterado de EM CONSERTO para OK'),(9,75,'Sem informações adicionais','2015-12-20 13:33:00','O equipamento foi desativado.'),(10,78,'Sem informações adicionais','2016-01-07 18:48:54','O equipamento foi ativado.'),(11,78,'Sem informações adicionais','2016-01-07 18:49:01','O equipamento foi ativado.'),(12,78,'Sem informações adicionais','2016-01-07 18:49:02','O equipamento foi desativado.'),(13,78,'Sem informações adicionais','2016-01-07 18:49:03','O equipamento foi ativado.'),(14,78,'Sem informações adicionais','2016-01-07 18:49:03','O equipamento foi desativado.'),(15,75,'assas','2016-01-07 19:19:41','Status do equipamento alterado de OK para COM DEFEITO'),(16,80,'Sem informações adicionais','2016-01-07 19:22:57','O equipamento foi ativado.'),(17,77,'asasas','2016-01-07 19:23:18','Status do equipamento alterado de OK para COM DEFEITO'),(18,2,'Sem informações adicionais','2016-01-15 19:34:26','O equipamento foi ativado.'),(19,2,'Sem informações adicionais','2016-01-15 19:34:27','O equipamento foi desativado.'),(20,2,'Sem informações adicionais','2016-01-15 19:34:39','O equipamento foi ativado.'),(21,2,'Sem informações adicionais','2016-01-15 19:34:41','O equipamento foi desativado.'),(22,3,'Sem informações adicionais','2016-01-15 19:34:42','O equipamento foi ativado.'),(23,3,'Sem informações adicionais','2016-01-15 19:34:43','O equipamento foi desativado.'),(24,2,'Sem informações adicionais','2016-01-15 19:34:54','O equipamento foi ativado.'),(25,2,'Sem informações adicionais','2016-01-15 19:34:56','O equipamento foi desativado.'),(26,75,'Sem informações adicionais','2016-01-15 19:35:41','O equipamento foi ativado.'),(27,75,'Sem informações adicionais','2016-01-15 19:35:42','O equipamento foi desativado.'),(28,3,'Sem informações adicionais','2016-01-15 19:36:38','O equipamento foi ativado.'),(29,3,'Sem informações adicionais','2016-01-15 19:36:38','O equipamento foi desativado.'),(30,75,'Sem informações adicionais','2016-01-15 19:36:48','O equipamento foi ativado.'),(31,75,'Sem informações adicionais','2016-01-15 19:36:49','O equipamento foi desativado.'),(32,75,'Sem informações adicionais','2016-01-15 19:36:50','O equipamento foi ativado.'),(33,75,'Sem informações adicionais','2016-01-15 19:36:51','O equipamento foi desativado.'),(34,75,'Sem informações adicionais','2016-01-15 19:36:53','O equipamento foi ativado.'),(35,74,'Sem informações adicionais','2016-01-15 19:37:10','O equipamento foi desativado.'),(36,74,'Sem informações adicionais','2016-01-15 19:37:11','O equipamento foi ativado.'),(37,74,'Sem informações adicionais','2016-01-15 19:37:16','O equipamento foi desativado.'),(38,75,'Sem informações adicionais','2016-01-15 19:37:18','O equipamento foi desativado.'),(39,74,'Sem informações adicionais','2016-01-15 19:37:36','O equipamento foi ativado.'),(40,74,'Sem informações adicionais','2016-01-15 19:37:37','O equipamento foi desativado.'),(41,76,'Sem informações adicionais','2016-01-15 19:38:10','O equipamento foi desativado.'),(42,74,'Sem informações adicionais','2016-01-15 19:39:01','O equipamento foi ativado.'),(43,74,'Sem informações adicionais','2016-01-15 19:39:21','O equipamento foi desativado.'),(44,74,'Sem informações adicionais','2016-01-15 19:39:22','O equipamento foi ativado.'),(45,2,'Sem informações adicionais','2016-01-15 19:42:13','O equipamento foi ativado.'),(46,3,'Sem informações adicionais','2016-01-15 19:42:13','O equipamento foi ativado.'),(47,75,'Sem informações adicionais','2016-01-15 19:42:14','O equipamento foi ativado.'),(48,76,'Sem informações adicionais','2016-01-15 19:42:15','O equipamento foi ativado.'),(49,2,'Sem informações adicionais','2016-01-15 20:08:49','O equipamento foi desativado.'),(50,88,'Sem informações adicionais','2016-01-15 20:16:34','O equipamento foi ativado.'),(51,87,'Sem informações adicionais','2016-01-15 20:16:35','O equipamento foi ativado.'),(52,85,'Sem informações adicionais','2016-01-15 20:16:36','O equipamento foi ativado.'),(53,86,'Sem informações adicionais','2016-01-15 20:16:36','O equipamento foi ativado.');

#
# Structure for table "aca_mensalidade"
#

DROP TABLE IF EXISTS `aca_mensalidade`;
CREATE TABLE `aca_mensalidade` (
  `idMensalidade` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL DEFAULT '0',
  `dtMensalidade` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `valor` double(11,2) DEFAULT '0.00',
  PRIMARY KEY (`idMensalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_mensalidade"
#


#
# Structure for table "aca_modalidade"
#

DROP TABLE IF EXISTS `aca_modalidade`;
CREATE TABLE `aca_modalidade` (
  `idModalidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeModalidade` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`idModalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_modalidade"
#

INSERT INTO `aca_modalidade` VALUES (1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tLuta\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tGinástica\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(3,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEsportes\n\t\t\t\t\t\t\n\t\t\t\t\t\t');

#
# Structure for table "aca_notificacao"
#

DROP TABLE IF EXISTS `aca_notificacao`;
CREATE TABLE `aca_notificacao` (
  `idNotificacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipoNotificacao` enum('"OUTRO"') CHARACTER SET utf8 NOT NULL DEFAULT '"OUTRO"',
  `descricaoNotificacao` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dataNotificacao` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`idNotificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_notificacao"
#


#
# Structure for table "aca_permissoes"
#

DROP TABLE IF EXISTS `aca_permissoes`;
CREATE TABLE `aca_permissoes` (
  `entidade` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `acao` enum('VISUALIZAR','ADICIONAR','EDITAR','EXCLUIR') COLLATE utf8_bin DEFAULT NULL,
  `acesso` enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` enum('CLI','FUNC','ADM') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_permissoes"
#

INSERT INTO `aca_permissoes` VALUES ('usuario','VISUALIZAR','N',1,'FUNC'),('usuario','ADICIONAR','N',2,'FUNC'),('usuario','EDITAR','N',3,'FUNC'),('usuario','EXCLUIR','N',4,'FUNC'),('equipamento','VISUALIZAR','N',5,'FUNC'),('equipamento','ADICIONAR','N',6,'FUNC'),('equipamento','EDITAR','N',7,'FUNC'),('equipamento','EXCLUIR','N',8,'FUNC'),('modalidade_de_treino','VISUALIZAR','N',9,'FUNC'),('modalidade_de_treino','ADICIONAR','N',10,'FUNC'),('modalidade_de_treino','EDITAR','N',11,'FUNC'),('modalidade_de_treino','EXCLUIR','N',12,'FUNC'),('aula','VISUALIZAR','N',13,'FUNC'),('aula','ADICIONAR','N',14,'FUNC'),('aula','EDITAR','N',15,'FUNC'),('aula','EXCLUIR','N',16,'FUNC'),('turma','VISUALIZAR','N',17,'FUNC'),('turma','ADICIONAR','N',18,'FUNC'),('turma','EDITAR','N',19,'FUNC'),('turma','EXCLUIR','N',20,'FUNC'),('grafico','VISUALIZAR','N',21,'FUNC'),('usuario','VISUALIZAR','S',22,'ADM'),('usuario','ADICIONAR','S',23,'ADM'),('usuario','EDITAR','S',24,'ADM'),('usuario','EXCLUIR','S',25,'ADM'),('equipamento','VISUALIZAR','S',26,'ADM'),('equipamento','ADICIONAR','S',27,'ADM'),('equipamento','EDITAR','S',28,'ADM'),('equipamento','EXCLUIR','S',29,'ADM'),('modalidade_de_treino','VISUALIZAR','S',30,'ADM'),('modalidade_de_treino','ADICIONAR','S',31,'ADM'),('modalidade_de_treino','EDITAR','S',32,'ADM'),('modalidade_de_treino','EXCLUIR','S',33,'ADM'),('aula','VISUALIZAR','S',34,'ADM'),('aula','ADICIONAR','S',35,'ADM'),('aula','EDITAR','S',36,'ADM'),('aula','EXCLUIR','S',37,'ADM'),('turma','VISUALIZAR','S',38,'ADM'),('turma','ADICIONAR','S',39,'ADM'),('turma','EDITAR','S',40,'ADM'),('turma','EXCLUIR','S',41,'ADM'),('grafico','VISUALIZAR','S',42,'ADM'),('permissao','EDITAR','N',43,'FUNC'),('permissao','EDITAR','S',44,'ADM'),('entrada-saida','VISUALIZAR','S',45,'ADM'),('entrada-saida','VISUALIZAR','N',46,'FUNC');

#
# Structure for table "aca_sessions"
#

DROP TABLE IF EXISTS `aca_sessions`;
CREATE TABLE `aca_sessions` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_bin NOT NULL,
  `timestamp` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_sessions"
#

INSERT INTO `aca_sessions` VALUES ('001940a694721b37ee7a2c4abd0aaafe4a3667f2','::1','',0,'__ci_last_regenerate|i:1452896965;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452897043'),('01f2cd45126aeed409fa1b01bc1d8a2527e1159b','::1','',0,'__ci_last_regenerate|i:1452896797;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452897041'),('08114a3fca9d6930e862415e388711cb4c4bd27e','::1','',0,'__ci_last_regenerate|i:1452901728;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452901728'),('084e7a2abb2d24a5a3190d19caa4989cad6760a5','::1','',0,'__ci_last_regenerate|i:1452898206;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452898474'),('0a8d9a99328e10bd8b6873e05a5b716968779a9f','::1','',0,'__ci_last_regenerate|i:1452898938;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452899055'),('0cbc28e01a58eeeddfdc207ae852667758ffea36','::1','',0,'__ci_last_regenerate|i:1452899308;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452899308'),('10176742729c227cae364e7697a3036d7e13b827','::1','',0,'__ci_last_regenerate|i:1452892589;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452892818'),('105150409891479bcfc6cc2a79d0d78d6eb14587','::1','',0,'__ci_last_regenerate|i:1452908167;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452908325'),('108a42b3758482df1a8d43a72c39c17d7cd89d51','::1','',0,'__ci_last_regenerate|i:1452899308;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452899468'),('120b2e66f3605a5f96472210da8c1b6153faf10a','::1','',0,'__ci_last_regenerate|i:1452899008;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452899021'),('1222905cf2aa088cd2f38a7d1030e40c62c243fc','::1','',0,'__ci_last_regenerate|i:1452895577;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452895876'),('14e2423dda0be4f425c86591a1310dc2fcc6eb6f','::1','',0,'__ci_last_regenerate|i:1452913341;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452913606'),('18e88fa7c425a1a1580da935bb335ca2d94af36e','::1','',0,'__ci_last_regenerate|i:1452899007;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452899007'),('199c9083e8381465e6efcbecbec283e0b2812411','::1','',0,'__ci_last_regenerate|i:1452890786;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452890987'),('26b1cb6c841f3b47bc3e6b0ca016da2be5f77e79','::1','',0,'__ci_last_regenerate|i:1452907866;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452908149'),('2d8f052421e7a5559e107ae5fa48ebd3c30362fb','::1','',0,'__ci_last_regenerate|i:1452901728;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452901816'),('318933a4823629685c51a963192201a52a4377c4','::1','',0,'__ci_last_regenerate|i:1452897604;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452897904'),('3d27f70aceb4e867be0bb9bd5f95edfef0be1519','::1','',0,'__ci_last_regenerate|i:1452902153;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452902153'),('3f1cec7a9b06a30212178c388a9ec21349e0635e','::1','',0,'__ci_last_regenerate|i:1452909778;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452910013'),('41a6f4097853506e160994ca2d247fa56f17497c','::1','',0,'__ci_last_regenerate|i:1452895264;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452895561'),('4a180bc2f5571816be33d680eea566b8aec0ceb8','::1','',0,'__ci_last_regenerate|i:1452894109;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452894137'),('4b926773fe81166a46553608134fbd5fbe7c2c1b','::1','',0,'__ci_last_regenerate|i:1452911857;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452912127'),('515c7f7ea523bd8013463b3f3d342d33b891f89b','::1','',0,'__ci_last_regenerate|i:1452897905;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452898190'),('528f7cd1cfc3ae49c343d77b8503d6a9969ed787','::1','',0,'__ci_last_regenerate|i:1452908504;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452908646'),('57026ba722ca6004ceef5c6ea49199a4cc28081d','::1','',0,'__ci_last_regenerate|i:1452900649;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452900940'),('6066195195d8398fd33baff1c40c53a10d6fb238','::1','',0,'__ci_last_regenerate|i:1452892683;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452892880'),('65e3e8992ff8830967370f78ed003ab6e558344a','::1','',0,'__ci_last_regenerate|i:1452913758;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452913996'),('6630ab8090895b71aa829bffe72e81b9570af0af','::1','',0,'__ci_last_regenerate|i:1452914114;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452914340'),('66ee28c82d51487b99aa18c4e3e6f3daba86a305','::1','',0,'__ci_last_regenerate|i:1452893303;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452893377'),('68ec523992c6188808c55d62c3ccb82ebcd7573f','::1','',0,'__ci_last_regenerate|i:1452891872;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452892161'),('692d638e85d10352040e6d34122c86b7f45bc6c0','::1','',0,'__ci_last_regenerate|i:1452910863;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452911156'),('699e6181836007f60dec47635351317b90464f6c','::1','',0,'__ci_last_regenerate|i:1452909458;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452909749'),('6b3741e5beb21768b9dabe57472c55c161e5651b','::1','',0,'__ci_last_regenerate|i:1452909139;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452909415'),('6bc488368c2611fa2df3e3fe6a5654b19f626357','::1','',0,'__ci_last_regenerate|i:1452901298;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452901568'),('6d02c4efb761f103715242fc1e8a2bae96035a64','::1','',0,'__ci_last_regenerate|i:1452900988;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452901257'),('6dc90be3b3ed0ff46c3ec3b55500aabb71107fa7','::1','',0,'__ci_last_regenerate|i:1452897905;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452897905'),('6e5702b9a54950e8621d2654c6dde4940ae3e1f3','::1','',0,'__ci_last_regenerate|i:1452899007;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452899009'),('7066801131f20e541eb30e866a95aaec697b251a','::1','',0,'__ci_last_regenerate|i:1452893460;','1452893460'),('711369f5fc1264fb00503464d7ddd4923461acf2','::1','',0,'__ci_last_regenerate|i:1452900657;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452900946'),('72c381795ca7b130e92dc98cf72d2ca907d51498','::1','',0,'__ci_last_regenerate|i:1452891534;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452891745'),('7485bb4d1a535353788bba29f48124171ac48cfe','::1','',0,'__ci_last_regenerate|i:1452898648;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452898649'),('758e7dc53b57dadc8edf9245912b9fd7a54fc9a0','::1','',0,'__ci_last_regenerate|i:1452899363;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452899440'),('7b1e9ce1f826b24f615b0426d6a2ce8d743c4e84','::1','',0,'__ci_last_regenerate|i:1452892356;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452892643'),('85a22cddb16c14b4e9d61a98366ed3ed62349143','::1','',0,'__ci_last_regenerate|i:1452899008;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452899008'),('86137c5751d8eb5b7411307c745cfe2477fb4489','::1','',0,'__ci_last_regenerate|i:1452898215;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452898469'),('8a2b2ac109a932097ab0f2677b6feccc3395b9fb','::1','',0,'__ci_last_regenerate|i:1452912301;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452912573'),('91b6c40e948524d5247bd1a265e5b13b033a08d7','::1','',0,'__ci_last_regenerate|i:1452911169;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452911391'),('92edaf26bc6f7367fa141bbe4447533c96de7d6c','::1','',0,'__ci_last_regenerate|i:1452893662;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452893962'),('95947163f79b780f6e744ef20abe78b4023557e4','::1','',0,'__ci_last_regenerate|i:1452897573;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452897843'),('9af390c82d1f0bdfcc11ff9251c8f5542942994f','::1','',0,'__ci_last_regenerate|i:1452901546;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452901814'),('9dc7ad30b42adc20e26ee4d1cfd5357ae67ac085','::1','',0,'__ci_last_regenerate|i:1452900992;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452901256'),('9e298db9cac94287e591595d95ffd3ab6747d4b5','::1','',0,'__ci_last_regenerate|i:1452890726;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452890927'),('9effac955ca96b4a52fd74408ecd07910272568a','::1','',0,'__ci_last_regenerate|i:1452897890;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452898081'),('a84265d1e759d8cd839e4499b710ac993c84bd5f','::1','',0,'__ci_last_regenerate|i:1452895936;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452896201'),('adcfea5d5f88028d5bd2693b3d797a90ea66dbd0','::1','',0,'__ci_last_regenerate|i:1452895602;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452895739'),('adf402f61d498ed999551fc5ee32afc260fda528','::1','',0,'__ci_last_regenerate|i:1452892052;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452892349'),('b00e9c911bc1bf7c857ea87b05701eb40283de42','::1','',0,'__ci_last_regenerate|i:1452891082;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452891216'),('b13d533291ee802d3f77120722f732301c9b5034','::1','',0,'__ci_last_regenerate|i:1452895270;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452895560'),('b7d2565d658d7931889713d97d5c2eabffa36561','::1','',0,'__ci_last_regenerate|i:1452896603;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452896852'),('bd113793b10ed7310b10d24d957a34bb9f83b0b8','::1','',0,'__ci_last_regenerate|i:1452913023;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452913321'),('c23fada8401718126d02f400708197adfb1e2912','::1','',0,'__ci_last_regenerate|i:1452901983;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452902249'),('c3958b614fe8620f0a3eee2cdb734f49a8c7e607','::1','',0,'__ci_last_regenerate|i:1452898637;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452898933'),('ca3171f79fbfe334338c7aff2883b8e7dd904cd1','::1','',0,'__ci_last_regenerate|i:1452896296;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452896596'),('cbb1c83307d04d28a3b8205953d6337ea8f427dc','::1','',0,'__ci_last_regenerate|i:1452893460;','1452893460'),('ccdf6af1066cb635a60aa344ea972cd5d9422186','::1','',0,'__ci_last_regenerate|i:1452891523;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452891818'),('cfcb4afb903a392bca613821e24c5ffb152b5b44','::1','',0,'__ci_last_regenerate|i:1452898649;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452898937'),('d521470c9b132198fd943e354eeb0029c15e550f','::1','',0,'__ci_last_regenerate|i:1452894127;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452894127'),('d6e4cbdf64d583f26d08bd35d231065b1baf1569','::1','',0,'__ci_last_regenerate|i:1452893001;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452893220'),('d6f20e739446403481d288b619ade4011c1a4f1f','::1','',0,'__ci_last_regenerate|i:1452912721;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452912915'),('db8d16ef5d11019142c0e5815b8caa81774aa1ee','::1','',0,'__ci_last_regenerate|i:1452896425;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452896668'),('dbd3a6c1148e2e231aaa51d70ba12949bfcc96ba','::1','',0,'__ci_last_regenerate|i:1452897350;','1452897350'),('de175e23c169c2a6039b838754f075f4d77a04e7','::1','',0,'__ci_last_regenerate|i:1452910485;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452910719'),('e0e8813901e06208a094fe74caa30969d7a45bbc','::1','',0,'__ci_last_regenerate|i:1452902637;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452902637'),('e157d1e669e69d1f5ba25421109f141ce563f372','::1','',0,'__ci_last_regenerate|i:1452911543;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452911579'),('e15eb33b3e96d965982b4b38a93d4265db4d3e32','::1','',0,'__ci_last_regenerate|i:1452902328;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452902623'),('e30cdba10a8773ce0814ce27165728ad941340b4','::1','',0,'__ci_last_regenerate|i:1452899308;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452899308'),('e4cedc72f5df7345e72cac5f5093c8efe7ce4874','::1','',0,'__ci_last_regenerate|i:1452892355;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452892356'),('e4fb18b098aac68c38bc951f940168cc96460e53','::1','',0,'__ci_last_regenerate|i:1452897301;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452897599'),('e5fd35c6fd7e1756e3d27639ecaa6f4a81271ccc','::1','',0,'__ci_last_regenerate|i:1452893357;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452893657'),('ec5a655d55a3d5899488e1fb4519eb0d0ee711ed','::1','',0,'__ci_last_regenerate|i:1452908829;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452909113'),('ed804973bfd712f1039191c15059c0d2dd15ffba','::1','',0,'__ci_last_regenerate|i:1452910174;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452910424'),('f184ee6abeb18ffccda52d16a0979ab8b2810cf7','::1','',0,'__ci_last_regenerate|i:1452902153;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452902153'),('f3d1f7ac77784c0b7eeec9ab4b75328bedf76780','::1','',0,'__ci_last_regenerate|i:1452897351;','1452897351'),('f850400b7ec97174c9d70fbde4cf23c8f2545136','::1','',0,'__ci_last_regenerate|i:1452896070;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452896304'),('fdd9e1940115082112adb2243bafd6e7379b2162','::1','',0,'__ci_last_regenerate|i:1452892281;logged|b:1;nickname|s:12:\"usuarioteste\";nome|s:8:\"Usuário\";sobrenome|s:5:\"teste\";','1452892453');

#
# Structure for table "aca_turma"
#

DROP TABLE IF EXISTS `aca_turma`;
CREATE TABLE `aca_turma` (
  `idTurma` int(11) NOT NULL AUTO_INCREMENT,
  `idAula` int(11) NOT NULL DEFAULT '0',
  `sigla` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `capacidade` int(11) NOT NULL DEFAULT '0',
  `horario` time NOT NULL DEFAULT '00:00:00',
  `idInstrutor` int(11) DEFAULT '0',
  `statusTurma` enum('INSCRICOES ABERTAS','INSCRICOES ENCERRADAS','EM ANDAMENTO') CHARACTER SET utf8 DEFAULT NULL,
  `mensalidade` double(11,2) DEFAULT '0.00',
  PRIMARY KEY (`idTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma"
#

INSERT INTO `aca_turma` VALUES (1,1,'teste',30,'13:00:00',13,'INSCRICOES ENCERRADAS',130.00),(2,1,'MAOE',30,'13:00:00',13,'EM ANDAMENTO',130.00),(4,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(5,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(6,1,'MAOE',30,'13:00:00',13,'EM ANDAMENTO',130.00),(7,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(8,9,'MT1',30,'12:00:00',48,'INSCRICOES ABERTAS',130.00);

#
# Structure for table "aca_turma_cliente"
#

DROP TABLE IF EXISTS `aca_turma_cliente`;
CREATE TABLE `aca_turma_cliente` (
  `idTurmaCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idTurma` int(11) NOT NULL DEFAULT '0',
  `idCliente` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTurmaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma_cliente"
#

INSERT INTO `aca_turma_cliente` VALUES (13,1,2),(31,1,5),(32,1,3),(33,7,2),(36,7,3),(37,7,12),(38,5,2),(39,5,5),(40,5,3),(41,8,2),(42,8,5),(43,8,3),(44,8,12),(45,8,13),(46,1,0),(47,7,0);

#
# Structure for table "aca_usuario"
#

DROP TABLE IF EXISTS `aca_usuario`;
CREATE TABLE `aca_usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(12) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `senha` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dtNascimento` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nome` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sobrenome` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `snTipo` enum('CLI','FUNC','ADM') CHARACTER SET utf8 DEFAULT 'FUNC',
  `cpf` varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notificacaoEmail` enum('S','N') COLLATE utf8_bin NOT NULL DEFAULT 'S',
  `notificacaoEquipamentos` enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  `notificacaoAulas` enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  `notificacaoTurmas` enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_usuario"
#

INSERT INTO `aca_usuario` VALUES (5,'michell','77274668b6fed85cd825e35475066338','17/03/1997','Michell','Ocaña','ADM','121.121.121-11','michell@michell.com',NULL,'N','N','S','N'),(12,'lasttest','c20ad4d76fe97759aa27a0c99bff6710','12/12/1212','ultimo','teste','CLI','222.222.222-22','lasttest@ultimo.com',NULL,'S','S','S','S'),(13,'alvinesquilo','c20ad4d76fe97759aa27a0c99bff6710','12121212','alvim','elezer','ADM','12121111111','teste@teste.com.br',NULL,'S','S','S','S'),(15,'silvatest','c20ad4d76fe97759aa27a0c99bff6710','12121212','um teste','da silva','ADM','23098039840','teste@hotmail.com',NULL,'S','S','S','S'),(16,'feelsgood','c20ad4d76fe97759aa27a0c99bff6710','12834739','feeling','strange','FUNC','12121342143','lasttest@ultimo.com',NULL,'S','S','S','S'),(17,'gonacelebrat','c20ad4d76fe97759aa27a0c99bff6710','12982749','one more','vez','ADM','12987349832','aoisasoi@wowiuwoie',NULL,'S','S','S','S'),(18,'cheide','c20ad4d76fe97759aa27a0c99bff6710','12121282','never','since a change','FUNC','18279387998','ofgray@sasas.cmo',NULL,'S','S','S','S'),(19,'lokosound','c20ad4d76fe97759aa27a0c99bff6710','12873947','dj','bl3nd','FUNC','29837394837','blend@blend.com',NULL,'S','S','S','S'),(20,'oheldens','b59c67bf196a4758191e42f76670ceba','19827198','heldens','oliver','CLI','98712398712','oheldens@1111.com',NULL,'S','S','S','S'),(21,'readasasa','4c56ff4ce4aaf9573aa5dff913df997a','22432423','teste','asasas','CLI','21242839429','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(22,'193879','4c56ff4ce4aaf9573aa5dff913df997a','29837298','ready','lerigou','CLI','12234289749','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(23,'noman','c20ad4d76fe97759aa27a0c99bff6710','19837249','um teste','de novo','CLI','12938374982','notagain@esidu',NULL,'S','S','S','S'),(24,'poi','c20ad4d76fe97759aa27a0c99bff6710','19287239','poiu','poi','CLI','12430278409','11111@1111.com',NULL,'S','S','S','S'),(25,'12212','c4ca4238a0b923820dcc509a6f75849b','12112121','um teste','12121','CLI','21212111111','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(26,'teste','c20ad4d76fe97759aa27a0c99bff6710','21313247','um teste','111112223232','CLI','94832749287','982739@3984739',NULL,'S','S','S','S'),(27,'rage','c20ad4d76fe97759aa27a0c99bff6710','21212121','rage','celebrate','CLI','12121212121','11111@1111.com',NULL,'S','S','S','S'),(28,'mejaleza','a01610228fe998f515a72dd730294d87','20938120','lazer','major','CLI','12243287429','mejaleza@aasas',NULL,'S','S','S','S'),(29,'together','c20ad4d76fe97759aa27a0c99bff6710','12234328','together','nah','CLI','28397329487','together@nah.com',NULL,'S','S','S','S'),(30,'hahai','c20ad4d76fe97759aa27a0c99bff6710','39827391','ma','oe','CLI','23874892374','together@hahai',NULL,'S','S','S','S'),(31,'nah','c20ad4d76fe97759aa27a0c99bff6710','12243249','o','tugeter','CLI','13243289374','nah@nahnahnahnahnahnah.com',NULL,'S','S','S','S'),(32,'hahahaha.-.','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL,'S','S','S','S'),(33,'hahahah1212','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL,'S','S','S','S'),(34,'im the gai','c20ad4d76fe97759aa27a0c99bff6710','23432489','u the kind','of guy','CLI','21837918371','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(37,'gaybriel','c20ad4d76fe97759aa27a0c99bff6710','21212121','gaybriel','oiuoiu','CLI','12121322323','fiuiu@oifu',NULL,'S','S','S','S'),(38,'oiuoiuoi','c20ad4d76fe97759aa27a0c99bff6710','10998233','aosjoiuoiu','oiuoiu','CLI','29387948729','oiu@oiusoiu.com',NULL,'S','S','S','S'),(39,'edvar','c20ad4d76fe97759aa27a0c99bff6710','12121212','edvar','edvar','CLI','11111111111','edvar@feevale.br',NULL,'S','S','S','S'),(40,'11111','c20ad4d76fe97759aa27a0c99bff6710','11111111','Michell','Ocaña','FUNC','21982982739','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(41,'asasa','6512bd43d9caa6e02c990b0a82652dca','12121111','sasasas','Ocaña','FUNC','11111111111','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(45,'diplo','c20ad4d76fe97759aa27a0c99bff6710','12121212','diplo','diplo','FUNC','12121212817','diplo@academy.com',NULL,'S','S','S','S'),(46,'nomedaosiuas','c20ad4d76fe97759aa27a0c99bff6710','12873982','teste','de um usuario','FUNC','10287398279','email@email',NULL,'S','S','S','S'),(47,'nomedausuari','c20ad4d76fe97759aa27a0c99bff6710','18271928','uma usuária','que né','FUNC','12871298712','nome@usuaria',NULL,'S','S','S','S'),(48,'teste100','c20ad4d76fe97759aa27a0c99bff6710','12121212','teste 1000','teste','FUNC','11111111111','11111@1111.com',NULL,'S','S','S','S'),(49,'michell2','c20ad4d76fe97759aa27a0c99bff6710','12121217','michell','ocana','FUNC','12918721982','fiuiu@oifu',NULL,'N','N','N','N'),(50,'usuarioteste','698dc19d489c4e4db73e28a713eab07b','11212122','Usuário','teste','FUNC','12345679890','usuario@teste.com',NULL,'S','S','S','S');
