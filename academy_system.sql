# Host: localhost  (Version: 5.6.25)
# Date: 2015-12-22 20:32:07
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "aca_aula"
#

CREATE TABLE `aca_aula` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT,
  `idModalidade` int(11) DEFAULT NULL,
  `nomeAula` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `descricaoAula` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idAula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_aula"
#

INSERT INTO `aca_aula` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tMusculação','Aula de musculação'),(2,1,'Muay thai\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de muay thai'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tKickboxing','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de kickboxing\n\t\t\t\t\t\t'),(8,2,'Natação','Aula de natação');

#
# Structure for table "aca_cliente"
#

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
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_cliente"
#

INSERT INTO `aca_cliente` VALUES (2,37,1,1.5,'M','Rua bento gonçalves','1212','Centro','Novo Hamburgo','(12)1212-1212'),(3,39,80,1.75,'F','Rua bento gonçalves','1200','Centro','novo hamburgo','(12)1212-1212'),(5,45,69.6,1.7,'F','Rua bento gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212'),(6,46,12.1,1.11,'M','asasas','1212','1212','1212','(12)1212-1212'),(7,47,12.1,1.11,'M','asasas','1212','1212','1212','(12)1212-1212'),(8,46,71.6,1.7,'F','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212'),(9,46,69.6,1.7,'M','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212'),(10,46,69.6,1.7,'F','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-12122'),(11,46,69.6,1.7,'M','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212'),(12,46,69.6,1.7,'F','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-12122'),(13,47,120,1.7,'F','rua da usuária','12','12','121','(12)1212-1212');

#
# Structure for table "aca_equipamento"
#

CREATE TABLE `aca_equipamento` (
  `idEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `idModalidade` int(11) DEFAULT NULL,
  `descricaoEquipamento` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `snAtivo` enum('ATIVO','INATIVO') CHARACTER SET utf8 NOT NULL DEFAULT 'ATIVO',
  `nomeEquipamento` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `statusEquipamento` enum('OK','COM DEFEITO','EM CONSERTO') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_equipamento"
#

INSERT INTO `aca_equipamento` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tasasas\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 1\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(2,1,'\n\t\t\t\t\t\t\tmais um teste\n\t\t\t\t\t\t','INATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 2\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tDescrição do equipamento 3\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','INATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 3','OK'),(73,2,'\n\t\t\t\t\t\t\tdescrição do novo equipamento\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\tNovo equipamento\n\t\t\t\t\t\t','OK'),(74,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tdescrição do equipamento novo\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tNome do equipamento novo \n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(75,1,'\n\t\t\t\t\t\t\tdescrição de mais um equipamentoa','INATIVO','\n\t\t\t\t\t\t\tmais um equipamento opa','OK'),(76,1,'descrição do equipamento','ATIVO','nome do equipamento',''),(77,NULL,'descrição do novo equipamento','ATIVO','nome do novo equipamento','OK');

#
# Structure for table "aca_financas"
#

CREATE TABLE `aca_financas` (
  `idFinanca` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoFinanca` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `valorFinanca` double(10,2) NOT NULL DEFAULT '0.00',
  `tipoFinanca` enum('"DEPOSITO"') COLLATE utf8_bin NOT NULL DEFAULT '"DEPOSITO"',
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

CREATE TABLE `aca_log_equipamento` (
  `idLogEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipamento` int(11) NOT NULL DEFAULT '0',
  `infoLogEquipamento` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'Sem informações adicionais',
  `dataLogEquipamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mensagemLogEquipamento` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`idLogEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_log_equipamento"
#

INSERT INTO `aca_log_equipamento` VALUES (1,2,'Sem informações adicionais','2015-12-20 13:32:42','O equipamento foi desativado.'),(2,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi ativado.'),(3,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi desativado.'),(4,74,'Sem informações adicionais','2015-12-20 13:32:44','O equipamento foi desativado.'),(5,74,'Sem informações adicionais','2015-12-20 13:32:45','O equipamento foi ativado.'),(6,74,'Sem informações adicionais','2015-12-20 13:32:48','Status do equipamento alterado de COM DEFEITO para OK'),(7,75,'Conserto\n','2015-12-20 13:32:55','Status do equipamento alterado de COM DEFEITO para EM CONSERTO'),(8,75,'Sem informações adicionais','2015-12-20 13:32:59','Status do equipamento alterado de EM CONSERTO para OK'),(9,75,'Sem informações adicionais','2015-12-20 13:33:00','O equipamento foi desativado.');

#
# Structure for table "aca_modalidade"
#

CREATE TABLE `aca_modalidade` (
  `idModalidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeModalidade` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`idModalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_modalidade"
#

INSERT INTO `aca_modalidade` VALUES (1,'Luta'),(2,'Ginástica'),(3,'Esportes');

#
# Structure for table "aca_notificacao"
#

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
# Structure for table "aca_sessions"
#

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

INSERT INTO `aca_sessions` VALUES ('02337df41206aaccfb2e2a2c6c96cf568d8e64d7','::1','',0,'__ci_last_regenerate|i:1450658905;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450658980'),('0b6a196ec3e5419956f1f4acbc472155e568d81b','::1','',0,'__ci_last_regenerate|i:1450734917;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450734918'),('18e6ca7febf19339fd9bbb9ee5aa7ee99e312d88','::1','',0,'__ci_last_regenerate|i:1450658263;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450658561'),('5ae275ffb6797038349c1b420da974996417520a','::1','',0,'__ci_last_regenerate|i:1450661254;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450661355'),('5f3aec645bbc9f73424489222b2bcbd3779e26b5','::1','',0,'__ci_last_regenerate|i:1450660240;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450660289'),('65315e2b0f6627cfc9e05097abd9c7d460e2e829','::1','',0,'__ci_last_regenerate|i:1450737983;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450737983'),('667b580f9ded9c29df25799ee6ea76841986c223','::1','',0,'__ci_last_regenerate|i:1450659300;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450659600'),('7165b6c866059d96ae49ea8996c9ca9ed22f1e1b','::1','',0,'__ci_last_regenerate|i:1450657645;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450657882'),('7cc3936363fc947229780310b93e2a08a93700e0','::1','',0,'__ci_last_regenerate|i:1450660938;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450661230'),('7e59fab53cb7af7302e26ebedfb34ce00aa122ad','127.0.0.1','',0,'__ci_last_regenerate|i:1450733784;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450733843'),('83765d13e544cffa1099be51baabecba254acabe','::1','',0,'__ci_last_regenerate|i:1450658599;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450658896'),('8c2da05db61dfc838c15f7fdcff719cafafc4b79','::1','',0,'__ci_last_regenerate|i:1450659601;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450659601'),('90074e950cc351f1544af64d156d214fd05a92b0','::1','',0,'__ci_last_regenerate|i:1450738486;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450738486'),('ae2ed0074add310b54d8d76ae7d96613ad6e24cf','::1','',0,'__ci_last_regenerate|i:1450657318;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450657416'),('bf171e314803414538aae01cae6fdca7acf163d6','::1','',0,'__ci_last_regenerate|i:1450659601;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450659627'),('cdec37f31778ebb2fd5cbde9b7eeb0921170c97f','::1','',0,'__ci_last_regenerate|i:1450657947;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1450657947');

#
# Structure for table "aca_turma"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma"
#

INSERT INTO `aca_turma` VALUES (1,1,'teste',30,'13:00:00',13,'EM ANDAMENTO',130.00),(2,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(4,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(5,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(6,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00),(7,1,'MAOE',30,'13:00:00',13,'INSCRICOES ABERTAS',130.00);

#
# Structure for table "aca_turma_cliente"
#

CREATE TABLE `aca_turma_cliente` (
  `idTurmaCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idTurma` int(11) NOT NULL DEFAULT '0',
  `idCliente` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTurmaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma_cliente"
#

INSERT INTO `aca_turma_cliente` VALUES (1,1,2),(2,1,3),(3,1,5),(4,1,6),(5,1,7);

#
# Structure for table "aca_usuario"
#

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
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_usuario"
#

INSERT INTO `aca_usuario` VALUES (5,'michell','77274668b6fed85cd825e35475066338','17/03/1997','Michell','Ocaña','ADM','121.121.121-11','michell@michell.com',NULL),(12,'lasttest','c20ad4d76fe97759aa27a0c99bff6710','12/12/1212','ultimo','teste','CLI','222.222.222-22','lasttest@ultimo.com',NULL),(13,'alvinesquilo','c20ad4d76fe97759aa27a0c99bff6710','12121212','alvim','elezer','FUNC','12121111111','teste@teste.com.br',NULL),(15,'silvatest','c20ad4d76fe97759aa27a0c99bff6710','12121212','um teste','da silva','FUNC','23098039840','teste@hotmail.com',NULL),(16,'feelsgood','c20ad4d76fe97759aa27a0c99bff6710','12834739','feeling','strange','FUNC','12121342143','lasttest@ultimo.com',NULL),(17,'gonacelebrat','c20ad4d76fe97759aa27a0c99bff6710','12982749','one more','vez','FUNC','12987349832','aoisasoi@wowiuwoie',NULL),(18,'cheide','c20ad4d76fe97759aa27a0c99bff6710','12121282','never','since a change','FUNC','18279387998','ofgray@sasas.cmo',NULL),(19,'lokosound','c20ad4d76fe97759aa27a0c99bff6710','12873947','dj','bl3nd','FUNC','29837394837','blend@blend.com',NULL),(20,'oheldens','b59c67bf196a4758191e42f76670ceba','19827198','heldens','oliver','CLI','98712398712','oheldens@1111.com',NULL),(21,'readasasa','4c56ff4ce4aaf9573aa5dff913df997a','22432423','teste','asasas','CLI','21242839429','ocana.1997@hotmail.com',NULL),(22,'193879','4c56ff4ce4aaf9573aa5dff913df997a','29837298','ready','lerigou','CLI','12234289749','ocana.1997@hotmail.com',NULL),(23,'noman','c20ad4d76fe97759aa27a0c99bff6710','19837249','um teste','de novo','CLI','12938374982','notagain@esidu',NULL),(24,'poi','c20ad4d76fe97759aa27a0c99bff6710','19287239','poiu','poi','CLI','12430278409','11111@1111.com',NULL),(25,'12212','c4ca4238a0b923820dcc509a6f75849b','12112121','um teste','12121','CLI','21212111111','ocana.1997@hotmail.com',NULL),(26,'teste','c20ad4d76fe97759aa27a0c99bff6710','21313247','um teste','111112223232','CLI','94832749287','982739@3984739',NULL),(27,'rage','c20ad4d76fe97759aa27a0c99bff6710','21212121','rage','celebrate','CLI','12121212121','11111@1111.com',NULL),(28,'mejaleza','a01610228fe998f515a72dd730294d87','20938120','lazer','major','CLI','12243287429','mejaleza@aasas',NULL),(29,'together','c20ad4d76fe97759aa27a0c99bff6710','12234328','together','nah','CLI','28397329487','together@nah.com',NULL),(30,'hahai','c20ad4d76fe97759aa27a0c99bff6710','39827391','ma','oe','CLI','23874892374','together@hahai',NULL),(31,'nah','c20ad4d76fe97759aa27a0c99bff6710','12243249','o','tugeter','CLI','13243289374','nah@nahnahnahnahnahnah.com',NULL),(32,'hahahaha.-.','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL),(33,'hahahah1212','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL),(34,'im the gai','c20ad4d76fe97759aa27a0c99bff6710','23432489','u the kind','of guy','CLI','21837918371','ocana.1997@hotmail.com',NULL),(37,'gaybriel','c20ad4d76fe97759aa27a0c99bff6710','21212121','gaybriel','oiuoiu','CLI','12121322323','fiuiu@oifu',NULL),(38,'oiuoiuoi','c20ad4d76fe97759aa27a0c99bff6710','10998233','aosjoiuoiu','oiuoiu','CLI','29387948729','oiu@oiusoiu.com',NULL),(39,'edvar','c20ad4d76fe97759aa27a0c99bff6710','12121212','edvar','edvar','CLI','11111111111','edvar@feevale.br',NULL),(40,'11111','c20ad4d76fe97759aa27a0c99bff6710','11111111','Michell','Ocaña','CLI','21982982739','ocana.1997@hotmail.com',NULL),(41,'asasa','6512bd43d9caa6e02c990b0a82652dca','12121111','sasasas','Ocaña','CLI','11111111111','ocana.1997@hotmail.com',NULL),(45,'diplo','c20ad4d76fe97759aa27a0c99bff6710','12121212','diplo','diplo','CLI','12121212817','diplo@academy.com',NULL),(46,'nomedaosiuas','c20ad4d76fe97759aa27a0c99bff6710','12873982','teste','de um usuario','CLI','10287398279','email@email',NULL),(47,'nomedausuari','c20ad4d76fe97759aa27a0c99bff6710','18271928','uma usuária','que né','CLI','12871298712','nome@usuaria',NULL);
