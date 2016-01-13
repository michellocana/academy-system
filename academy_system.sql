# Host: localhost  (Version: 5.6.25)
# Date: 2016-01-13 18:59:37
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_aula"
#

INSERT INTO `aca_aula` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tMusculação','Aula de musculação'),(2,1,'Muay thai\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de muay thai'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tKickboxing','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tAula de kickboxing\n\t\t\t\t\t\t'),(8,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tNatação\n\t\t\t\t\t\t\n\t\t\t\t\t\t','Aula de natação'),(9,1,'Nome da aula','Descrição');

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
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_cliente"
#

INSERT INTO `aca_cliente` VALUES (2,37,1,1.5,'M','Rua bento gonçalves','1212','Centro','Novo Hamburgo','(12)1212-1212'),(3,39,80,1.75,'F','Rua bento gonçalves','1200','Centro','novo hamburgo','(12)1212-1212'),(5,45,69.6,1.7,'F','Rua bento gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-1212'),(12,46,69.6,1.7,'F','Rua Bento Gonçalves','1033/31','Centro','Novo Hamburgo','(12)1212-12122'),(13,47,120,1.7,'F','rua da usuária','12','12','121','(12)1212-1212');

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
  `statusEquipamento` enum('OK','COM DEFEITO','EM CONSERTO') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_equipamento"
#

INSERT INTO `aca_equipamento` VALUES (1,2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tasasas\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 1\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(2,1,'\n\t\t\t\t\t\t\tmais um teste\n\t\t\t\t\t\t','INATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 2\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(3,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tDescrição do equipamento 3\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','INATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEquipamento 3\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(73,2,'\n\t\t\t\t\t\t\tdescrição do novo equipamento\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\tNovo equipamento\n\t\t\t\t\t\t','OK'),(74,1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tdescrição do equipamento novo\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tNome do equipamento novo \n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','OK'),(75,1,'\n\t\t\t\t\t\t\tdescrição de mais um equipamentoa','INATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tmais um equipamento opa\n\t\t\t\t\t\t','COM DEFEITO'),(76,1,'descrição do equipamento','ATIVO','nome do equipamento',''),(77,2,'\n\t\t\t\t\t\t\tdescrição do novo equipamento\n\t\t\t\t\t\t','ATIVO','\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tnome do novo equipamento\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t','EM CONSERTO'),(80,1,'descrição','ATIVO','equipamento',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_log_equipamento"
#

INSERT INTO `aca_log_equipamento` VALUES (1,2,'Sem informações adicionais','2015-12-20 13:32:42','O equipamento foi desativado.'),(2,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi ativado.'),(3,3,'Sem informações adicionais','2015-12-20 13:32:43','O equipamento foi desativado.'),(4,74,'Sem informações adicionais','2015-12-20 13:32:44','O equipamento foi desativado.'),(5,74,'Sem informações adicionais','2015-12-20 13:32:45','O equipamento foi ativado.'),(6,74,'Sem informações adicionais','2015-12-20 13:32:48','Status do equipamento alterado de COM DEFEITO para OK'),(7,75,'Conserto\n','2015-12-20 13:32:55','Status do equipamento alterado de COM DEFEITO para EM CONSERTO'),(8,75,'Sem informações adicionais','2015-12-20 13:32:59','Status do equipamento alterado de EM CONSERTO para OK'),(9,75,'Sem informações adicionais','2015-12-20 13:33:00','O equipamento foi desativado.'),(10,78,'Sem informações adicionais','2016-01-07 18:48:54','O equipamento foi ativado.'),(11,78,'Sem informações adicionais','2016-01-07 18:49:01','O equipamento foi ativado.'),(12,78,'Sem informações adicionais','2016-01-07 18:49:02','O equipamento foi desativado.'),(13,78,'Sem informações adicionais','2016-01-07 18:49:03','O equipamento foi ativado.'),(14,78,'Sem informações adicionais','2016-01-07 18:49:03','O equipamento foi desativado.'),(15,75,'assas','2016-01-07 19:19:41','Status do equipamento alterado de OK para COM DEFEITO'),(16,80,'Sem informações adicionais','2016-01-07 19:22:57','O equipamento foi ativado.'),(17,77,'asasas','2016-01-07 19:23:18','Status do equipamento alterado de OK para COM DEFEITO');

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

INSERT INTO `aca_modalidade` VALUES (1,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tLuta\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(2,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tGinástica\n\t\t\t\t\t\t\n\t\t\t\t\t\t'),(3,'\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\tEsportes\n\t\t\t\t\t\t\n\t\t\t\t\t\t');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_permissoes"
#

INSERT INTO `aca_permissoes` VALUES ('usuario','VISUALIZAR','S',1,'FUNC'),('usuario','ADICIONAR','S',2,'FUNC'),('usuario','EDITAR','S',3,'FUNC'),('usuario','EXCLUIR','S',4,'FUNC'),('equipamento','VISUALIZAR','S',5,'FUNC'),('equipamento','ADICIONAR','S',6,'FUNC'),('equipamento','EDITAR','N',7,'FUNC'),('equipamento','EXCLUIR','N',8,'FUNC'),('modalidade-de-treino','VISUALIZAR','S',9,'FUNC'),('modalidade-de-treino','ADICIONAR','S',10,'FUNC'),('modalidade-de-treino','EDITAR','S',11,'FUNC'),('modalidade-de-treino','EXCLUIR','S',12,'FUNC'),('aula','VISUALIZAR','S',13,'FUNC'),('aula','ADICIONAR','S',14,'FUNC'),('aula','EDITAR','S',15,'FUNC'),('aula','EXCLUIR','S',16,'FUNC'),('turma','VISUALIZAR','S',17,'FUNC'),('turma','ADICIONAR','S',18,'FUNC'),('turma','EDITAR','S',19,'FUNC'),('turma','EXCLUIR','S',20,'FUNC'),('grafico','VISUALIZAR','S',21,'FUNC');

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

INSERT INTO `aca_sessions` VALUES ('080c46d6a60a8baff1f95fb69fac48f84e41aafe','::1','',0,'__ci_last_regenerate|i:1452362262;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452362514'),('085fb8cdaf1bb0da0d4bd629d0dc7bb05a7ada0c','::1','',0,'__ci_last_regenerate|i:1452638085;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452638366'),('0a83b922bd092499f4e9b7d5901bd6cf6362943c','::1','',0,'__ci_last_regenerate|i:1452639142;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452639426'),('0f317c6eaee6837c0e9974669807efcac8410a5e','::1','',0,'__ci_last_regenerate|i:1452635144;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452635264'),('0f8211ee3c832c0afb39cf86f4f7b8d991a25e56','::1','',0,'__ci_last_regenerate|i:1452355237;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452355515'),('10822f1d1bfc9c67b2b07ba17994698450b1c94c','::1','',0,'__ci_last_regenerate|i:1452635783;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452636055'),('12a16d6bab989368127b3cfa1f07177919ac00fa','::1','',0,'__ci_last_regenerate|i:1452561444;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452561743'),('191955b7d05924d0a14024740fcc715127512adb','::1','',0,'__ci_last_regenerate|i:1452361520;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452361813'),('19278d0933a513776ed3a23ee7a0e3944520f3a1','::1','',0,'__ci_last_regenerate|i:1452560121;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452560399'),('1a867f9dac0bc1a7a6b63c33e92f4764639b2818','::1','',0,'__ci_last_regenerate|i:1452641813;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452642113'),('1bba7a30a378991642292073b0c3be0bf776214b','::1','',0,'__ci_last_regenerate|i:1452643945;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452644197'),('207496709fbcb221886c924e0f86cdd23eb672aa','::1','',0,'__ci_last_regenerate|i:1452717485;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452717733'),('21204ca602d1096ade38e4f7758154b16881f3cf','::1','',0,'__ci_last_regenerate|i:1452718196;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452718335'),('24836d54a643ac1787989541e2bf2521d91a359a','::1','',0,'__ci_last_regenerate|i:1452639853;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452640150'),('259b8f5c5403a48828b8ece3b96c9fcf53d0dac9','::1','',0,'__ci_last_regenerate|i:1452640480;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452640665'),('25aad937cb76f45ff400266cd8253570eae822c2','::1','',0,'__ci_last_regenerate|i:1452354671;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452354962'),('2723f7e60185d7231257b5694ea1b4c1b303c11f','::1','',0,'__ci_last_regenerate|i:1452356840;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452357073'),('2943f66f7d091a82ce5f5114b9d15e41cc41c023','::1','',0,'__ci_last_regenerate|i:1452637734;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452637961'),('2b330573532a38abe7fdacd9bd3085c7653488ca','::1','',0,'__ci_last_regenerate|i:1452353272;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452353386'),('2c09a05fb6697299310eb872d96e64095420239d','::1','',0,'__ci_last_regenerate|i:1452357535;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452357832'),('2de37a8f8d3d96eac5a1e366cf187e4edef87e86','::1','',0,'__ci_last_regenerate|i:1452638822;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452639119'),('2fea01aae41d45c748b006d64e615202c8ba4a57','::1','',0,'__ci_last_regenerate|i:1452360990;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452361049'),('30357987b2986fa9db5d80fb399d118acba43804','::1','',0,'__ci_last_regenerate|i:1452360455;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452360730'),('31bf70460112e3a50fd70e53cb1862528c07f6e7','::1','',0,'__ci_last_regenerate|i:1452356509;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452356766'),('3d1382ba38414aa694b7af51897b4e859f1dc9d0','::1','',0,'__ci_last_regenerate|i:1452637426;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452637714'),('4566ec180db3e1e81adff7e5cc80efb5d43b7de7','::1','',0,'__ci_last_regenerate|i:1452354046;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452354177'),('4bf5ae7d52dbfe40749ff37dcb8cbf2d26b0361f','::1','',0,'__ci_last_regenerate|i:1452355555;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452355853'),('4d69298ecdaf02e8bdd56280f39deb2d5d698ad2','::1','',0,'__ci_last_regenerate|i:1452638439;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452638609'),('5138436d78c7901bf1ff5b71bd50d08c7aeb24f2','::1','',0,'__ci_last_regenerate|i:1452553124;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452553325'),('53d9bcc825ce7edbf50643a6d1f5f7fa5bc9066c','::1','',0,'__ci_last_regenerate|i:1452642114;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452642411'),('5984a267ea0f9fa43c84b187f265d90f3ce75fea','::1','',0,'__ci_last_regenerate|i:1452641512;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452641792'),('5c00af9a14582c0d05c3da8a7cb4fcb630199019','::1','',0,'__ci_last_regenerate|i:1452353679;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452353819'),('5d564ea71d2dc97de0f1607dce864cc5c484f628','::1','',0,'__ci_last_regenerate|i:1452643039;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452643283'),('5d962197aa6ea1285bd0ffc022f708d35f201798','::1','',0,'__ci_last_regenerate|i:1452352142;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452352377'),('622b0076938752cae8fe154b07f67e2363d4b650','::1','',0,'__ci_last_regenerate|i:1452553527;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452553730'),('6354da9e2f00ccf5a8493dfe560bc7efa7d8ab8f','::1','',0,'__ci_last_regenerate|i:1452360077;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452360370'),('6583f11023461d64048c2b04fac37138d94105da','::1','',0,'__ci_last_regenerate|i:1452636472;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452636767'),('6ec4664aa417208ffc9186063a3738daafa3a454','::1','',0,'__ci_last_regenerate|i:1452555366;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452555642'),('6edba187320c3b9e67260854305c361cb9e1e8d4','::1','',0,'__ci_last_regenerate|i:1452562087;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452562374'),('70269eb356e2cbd3a91b6dbb20da9515ca470801','::1','',0,'__ci_last_regenerate|i:1452556871;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452557159'),('7675158a491acec927ff906c67d1387123405511','::1','',0,'__ci_last_regenerate|i:1452642426;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452642726'),('78ac9ceb9baae17754a5a990d5a57e2a05562109','::1','',0,'__ci_last_regenerate|i:1452357871;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452358163'),('7ca80b8ce64e5743c600dba09dd48ed6d1e32b4b','::1','',0,'__ci_last_regenerate|i:1452642727;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452643016'),('7cffbd5030dca73f2f8b4b6617370e3e5ce9afa9','::1','',0,'__ci_last_regenerate|i:1452637113;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452637334'),('7d9e15f8bc76b5db171e71a96fc004e1ab669020','::1','',0,'__ci_last_regenerate|i:1452355859;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452356154'),('7dd0a2e291df5239e911a1e615a1fb7f0b5158d3','::1','',0,'__ci_last_regenerate|i:1452558480;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452558702'),('82bd0166e382f9f3b311cb88f102437485740092','::1','',0,'__ci_last_regenerate|i:1452556043;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452556343'),('87be8ea2ea9d8ac6e994d4a5155fc5d7d5e1fd6d','::1','',0,'__ci_last_regenerate|i:1452557735;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452558010'),('894680819d8e2ea0d706571cfcb4f572af037740','::1','',0,'__ci_last_regenerate|i:1452352892;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452353101'),('8a92648cc11a9835e8fedac0aafa78c7fa4722be','::1','',0,'__ci_last_regenerate|i:1452609553;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452609586'),('8f84431651cf526d8dc7b65a44e81b3a7fc66bf3','::1','',0,'__ci_last_regenerate|i:1452640854;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452641124'),('939d8f8a9b32626d77a902d76402f4c9ed740a25','::1','',0,'__ci_last_regenerate|i:1452559086;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452559298'),('95a6b90a5912a6cd4c9c239c6fa55098ba75f368','::1','',0,'__ci_last_regenerate|i:1452562420;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452562679'),('99e34eee42793261a539088190f405ea88249942','::1','',0,'__ci_last_regenerate|i:1452356207;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452356435'),('9a84ffaf61391bcb45ae5eb4ffc43753b0b1d56c','::1','',0,'__ci_last_regenerate|i:1452633998;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452634210'),('aaaedf5984fee26eb9a0d51ed579685fd678c27a','::1','',0,'__ci_last_regenerate|i:1452640155;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452640455'),('ae9047177b011385102f690afcc23cbd9791369c','::1','',0,'__ci_last_regenerate|i:1452561745;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452562005'),('af05f409cfc3b737988749631ff6e4c813b4f588','::1','',0,'__ci_last_regenerate|i:1452559465;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452559695'),('affa19eb6d50da485e16fdb831f65f4a8fd913cf','::1','',0,'__ci_last_regenerate|i:1452553838;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452553840'),('b2ed4c82242879432523d02576d12c6b2a0c5589','::1','',0,'__ci_last_regenerate|i:1452634305;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452634363'),('b7334f83a402d4bf4ca5805389c55efc0a6e4727','::1','',0,'__ci_last_regenerate|i:1452644263;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452644413'),('b98804219b408a0b9a2b862433e3b0490b1d4113','::1','',0,'__ci_last_regenerate|i:1452354357;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452354554'),('ba42d990b44aaea3a02f6cc23cf2bd1935004b48','::1','',0,'__ci_last_regenerate|i:1452559810;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452560076'),('bc30d2ba2e8fee6c0d9eafdba5646f2eb70709f7','::1','',0,'__ci_last_regenerate|i:1452556449;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452556747'),('bef151acc8ff8cfe57d80db76a19848d4b426be7','::1','',0,'__ci_last_regenerate|i:1452358652;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452358903'),('c006cc3e0508de78ec1b78d04af614602c7e1abe','::1','',0,'__ci_last_regenerate|i:1452635472;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452635771'),('c0e181ca9e3278ff66f9985541dbb3e62fdde901','::1','',0,'__ci_last_regenerate|i:1452558785;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452559028'),('c53ae481b10db64bbc314fc5e39bed93ff103b91','::1','',0,'__ci_last_regenerate|i:1452555734;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452555986'),('c6b37d15770dbc470347671d47bd12e3b539fb9a','::1','',0,'__ci_last_regenerate|i:1452639446;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452639579'),('c8b1883a720120ac8206120743d0346759db78fd','::1','',0,'__ci_last_regenerate|i:1452363589;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452363677'),('cadc3d24915ae63a84cf4df2615a2f2a1ba46fc0','::1','',0,'__ci_last_regenerate|i:1452558038;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452558244'),('cb29c7cd5b33da85d5d5c737dbef20bbca3a9305','::1','',0,'__ci_last_regenerate|i:1452560438;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452560725'),('cc7376d069f48a44bebf5d666deddb5dd8720974','::1','',0,'__ci_last_regenerate|i:1452358325;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452358600'),('cf5154d07ebf9082b1c621e4259349a97b213a21','::1','',0,'__ci_last_regenerate|i:1452641190;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452641468'),('d1d71f90068667c4caa0f196de20fdd1474dedcb','::1','',0,'__ci_last_regenerate|i:1452636793;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452637087'),('d2127f6bc86a49ddfefb3988df45d40728740bc0','::1','',0,'__ci_last_regenerate|i:1452561133;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452561404'),('d29930368e916889d12bbd0ca0de11fc5aa07fb0','::1','',0,'__ci_last_regenerate|i:1452718561;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452718566'),('d5e815b28f6eba9e405afc024eb13d8dc67fd6ef','::1','',0,'__ci_last_regenerate|i:1452363281;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452363527'),('d70f0c7132501b4508f559cf9b32840b7c0a9dfd','::1','',0,'__ci_last_regenerate|i:1452357181;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452357468'),('d7a7d8f06f8dd8a39afce8098a9c37dc0e38f06a','::1','',0,'__ci_last_regenerate|i:1452359776;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452360076'),('dc7b64d62f9aea3b4b43794c6f27d68dec2866ad','::1','',0,'__ci_last_regenerate|i:1452352472;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452352758'),('e50210a804804456473d44c83effafba7fa65de3','::1','',0,'__ci_last_regenerate|i:1452557189;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452557459'),('e6f2c363584ffe2fe21d69b5f1410d29af2a6f21','::1','',0,'__ci_last_regenerate|i:1452359375;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452359661'),('eb0eab33749cf669f40d429b1156e999092fea6b','::1','',0,'__ci_last_regenerate|i:1452358994;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452359000'),('f2752bc78bb267e0f5fec97cfefbbd0b235f9729','::1','',0,'__ci_last_regenerate|i:1452560832;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452561127'),('f3b333d7080ed0decc790624c8f9222e6021cefd','::1','',0,'__ci_last_regenerate|i:1452555049;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452555338'),('f71640c0216a59d76819f0fee25c2d4e8ddaf9ba','::1','',0,'__ci_last_regenerate|i:1452643543;logged|b:1;nickname|s:7:\"michell\";nome|s:7:\"Michell\";sobrenome|s:6:\"Ocaña\";','1452643775');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma_cliente"
#

INSERT INTO `aca_turma_cliente` VALUES (13,1,2),(31,1,5),(32,1,3),(33,7,2),(36,7,3),(37,7,12),(38,5,2),(39,5,5),(40,5,3),(41,8,2),(42,8,5),(43,8,3),(44,8,12),(45,8,13),(46,1,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_usuario"
#

INSERT INTO `aca_usuario` VALUES (5,'michell','77274668b6fed85cd825e35475066338','17/03/1997','Michell','Ocaña','ADM','121.121.121-11','michell@michell.com',NULL,'N','S','S','S'),(12,'lasttest','c20ad4d76fe97759aa27a0c99bff6710','12/12/1212','ultimo','teste','CLI','222.222.222-22','lasttest@ultimo.com',NULL,'S','S','S','S'),(13,'alvinesquilo','c20ad4d76fe97759aa27a0c99bff6710','12121212','alvim','elezer','FUNC','12121111111','teste@teste.com.br',NULL,'S','S','S','S'),(15,'silvatest','c20ad4d76fe97759aa27a0c99bff6710','12121212','um teste','da silva','FUNC','23098039840','teste@hotmail.com',NULL,'S','S','S','S'),(16,'feelsgood','c20ad4d76fe97759aa27a0c99bff6710','12834739','feeling','strange','FUNC','12121342143','lasttest@ultimo.com',NULL,'S','S','S','S'),(17,'gonacelebrat','c20ad4d76fe97759aa27a0c99bff6710','12982749','one more','vez','FUNC','12987349832','aoisasoi@wowiuwoie',NULL,'S','S','S','S'),(18,'cheide','c20ad4d76fe97759aa27a0c99bff6710','12121282','never','since a change','FUNC','18279387998','ofgray@sasas.cmo',NULL,'S','S','S','S'),(19,'lokosound','c20ad4d76fe97759aa27a0c99bff6710','12873947','dj','bl3nd','FUNC','29837394837','blend@blend.com',NULL,'S','S','S','S'),(20,'oheldens','b59c67bf196a4758191e42f76670ceba','19827198','heldens','oliver','CLI','98712398712','oheldens@1111.com',NULL,'S','S','S','S'),(21,'readasasa','4c56ff4ce4aaf9573aa5dff913df997a','22432423','teste','asasas','CLI','21242839429','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(22,'193879','4c56ff4ce4aaf9573aa5dff913df997a','29837298','ready','lerigou','CLI','12234289749','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(23,'noman','c20ad4d76fe97759aa27a0c99bff6710','19837249','um teste','de novo','CLI','12938374982','notagain@esidu',NULL,'S','S','S','S'),(24,'poi','c20ad4d76fe97759aa27a0c99bff6710','19287239','poiu','poi','CLI','12430278409','11111@1111.com',NULL,'S','S','S','S'),(25,'12212','c4ca4238a0b923820dcc509a6f75849b','12112121','um teste','12121','CLI','21212111111','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(26,'teste','c20ad4d76fe97759aa27a0c99bff6710','21313247','um teste','111112223232','CLI','94832749287','982739@3984739',NULL,'S','S','S','S'),(27,'rage','c20ad4d76fe97759aa27a0c99bff6710','21212121','rage','celebrate','CLI','12121212121','11111@1111.com',NULL,'S','S','S','S'),(28,'mejaleza','a01610228fe998f515a72dd730294d87','20938120','lazer','major','CLI','12243287429','mejaleza@aasas',NULL,'S','S','S','S'),(29,'together','c20ad4d76fe97759aa27a0c99bff6710','12234328','together','nah','CLI','28397329487','together@nah.com',NULL,'S','S','S','S'),(30,'hahai','c20ad4d76fe97759aa27a0c99bff6710','39827391','ma','oe','CLI','23874892374','together@hahai',NULL,'S','S','S','S'),(31,'nah','c20ad4d76fe97759aa27a0c99bff6710','12243249','o','tugeter','CLI','13243289374','nah@nahnahnahnahnahnah.com',NULL,'S','S','S','S'),(32,'hahahaha.-.','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL,'S','S','S','S'),(33,'hahahah1212','c20ad4d76fe97759aa27a0c99bff6710','18239791','tousem','ideia','CLI','29847359827','ehai@iasoiuas',NULL,'S','S','S','S'),(34,'im the gai','c20ad4d76fe97759aa27a0c99bff6710','23432489','u the kind','of guy','CLI','21837918371','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(37,'gaybriel','c20ad4d76fe97759aa27a0c99bff6710','21212121','gaybriel','oiuoiu','CLI','12121322323','fiuiu@oifu',NULL,'S','S','S','S'),(38,'oiuoiuoi','c20ad4d76fe97759aa27a0c99bff6710','10998233','aosjoiuoiu','oiuoiu','CLI','29387948729','oiu@oiusoiu.com',NULL,'S','S','S','S'),(39,'edvar','c20ad4d76fe97759aa27a0c99bff6710','12121212','edvar','edvar','CLI','11111111111','edvar@feevale.br',NULL,'S','S','S','S'),(40,'11111','c20ad4d76fe97759aa27a0c99bff6710','11111111','Michell','Ocaña','FUNC','21982982739','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(41,'asasa','6512bd43d9caa6e02c990b0a82652dca','12121111','sasasas','Ocaña','FUNC','11111111111','ocana.1997@hotmail.com',NULL,'S','S','S','S'),(45,'diplo','c20ad4d76fe97759aa27a0c99bff6710','12121212','diplo','diplo','FUNC','12121212817','diplo@academy.com',NULL,'S','S','S','S'),(46,'nomedaosiuas','c20ad4d76fe97759aa27a0c99bff6710','12873982','teste','de um usuario','FUNC','10287398279','email@email',NULL,'S','S','S','S'),(47,'nomedausuari','c20ad4d76fe97759aa27a0c99bff6710','18271928','uma usuária','que né','FUNC','12871298712','nome@usuaria',NULL,'S','S','S','S'),(48,'teste100','c20ad4d76fe97759aa27a0c99bff6710','12121212','teste 1000','teste','FUNC','11111111111','11111@1111.com',NULL,'S','S','S','S'),(49,'michell2','c20ad4d76fe97759aa27a0c99bff6710','12121217','michell','ocana','FUNC','12918721982','fiuiu@oifu',NULL,'N','N','N','N');
