# Host: localhost  (Version: 5.6.25)
# Date: 2015-10-09 19:31:33
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "aca_aula"
#

CREATE TABLE `aca_aula` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT,
  `idInstrutor` int(11) DEFAULT '0',
  `idModalidade` int(11) DEFAULT NULL,
  `descricaoAula` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `statusAula` enum('"EXEMPLO"') CHARACTER SET utf8 NOT NULL DEFAULT '"EXEMPLO"',
  PRIMARY KEY (`idAula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_aula"
#


#
# Structure for table "aca_cliente"
#

CREATE TABLE `aca_cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `peso` double(3,2) DEFAULT '0.00',
  `altura` double(3,2) NOT NULL DEFAULT '0.00',
  `sexo` enum('"F"','"M"') COLLATE utf8_bin NOT NULL DEFAULT '"M"',
  `endereco` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `numero` int(11) DEFAULT '0',
  `bairro` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cidade` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cpf` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_cliente"
#


#
# Structure for table "aca_equipamento"
#

CREATE TABLE `aca_equipamento` (
  `idEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `idModalidade` int(11) NOT NULL DEFAULT '0',
  `descricaoEquipamento` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `statusEquipamento` enum('"EX"') COLLATE utf8_bin NOT NULL DEFAULT '"EX"',
  PRIMARY KEY (`idEquipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_equipamento"
#


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
  `descricaoLogEquipamento` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dataLogEquipamento` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`idLogEquipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_log_equipamento"
#


#
# Structure for table "aca_modalidade"
#

CREATE TABLE `aca_modalidade` (
  `idModalidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoModalidade` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`idModalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_modalidade"
#


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

INSERT INTO `aca_sessions` VALUES ('06017f6613aea0d74f4484d1fb9ccb90b40f8c49','::1','',0,'__ci_last_regenerate|i:1443223238;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443223238'),('071d6e5f8e6ad06ffbd8a7210fa8163915d06cbd','::1','',0,'__ci_last_regenerate|i:1443495683;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443495933'),('0911d3a4e91c9bb30d350362e1407057ca1278db','::1','',0,'__ci_last_regenerate|i:1443494232;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443494455'),('09af894c78106635a1d2cc740c620aff25fb3f15','::1','',0,'__ci_last_regenerate|i:1443495023;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443495320'),('0a4a93eb99125ec51909bbdc12b24e9befa6fa7e','::1','',0,'__ci_last_regenerate|i:1443223852;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443224134'),('1120263737b87f6cec6c9a5b0f6f58a3cad15d7a','::1','',0,'__ci_last_regenerate|i:1442801145;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442801443'),('117fd8f9424e0209f4f9d9ba7afcefe8573a2622','::1','',0,'__ci_last_regenerate|i:1442800533;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442800833'),('12528d0c7d8e4fc987a0fa3a6075eb29d7fbf22a','::1','',0,'__ci_last_regenerate|i:1443224143;','1443224143'),('139d5c5fd95d48796883937a24ea4eff350a5c2b','::1','',0,'__ci_last_regenerate|i:1442800162;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442800458'),('189d62e8b77a9fd425767823e5026c86a92b6ed0','::1','',0,'__ci_last_regenerate|i:1443225857;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443225899'),('18f36b951e5303a4218379ec6941517b728c5294','::1','',0,'__ci_last_regenerate|i:1443224493;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443224499'),('1b84aea104bd787ea412b32ef077c304c1107017','::1','',0,'__ci_last_regenerate|i:1443224946;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443225205'),('223aa1969cb437a258b998fe922d539e3095c391','::1','',0,'__ci_last_regenerate|i:1442801456;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442801726'),('2687fd594070e137e8d1f582969bab207c9ac056','::1','',0,'__ci_last_regenerate|i:1443270483;','1443270484'),('2774db1d3f4e4746d4a8929d0af348807fe45f4c','::1','',0,'__ci_last_regenerate|i:1443218897;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443219155'),('2a684d303a57ebd23b535bcb0c1bdf6d6eced328','::1','',0,'__ci_last_regenerate|i:1443488641;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443488882'),('32be03dfcf7e112352b89b0ac2bdecb4882ed032','::1','',0,'__ci_last_regenerate|i:1442793185;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442793467'),('34c4a05f57306d51ec21e82329c39a825e1c3bfe','::1','',0,'__ci_last_regenerate|i:1443224143;','1443224143'),('367a10f82a632763124d4e58212fa82d706c53cc','::1','',0,'__ci_last_regenerate|i:1443493269;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443493564'),('385c427465b3ae34ae598d42629be079da0956f3','::1','',0,'__ci_last_regenerate|i:1443491414;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443491709'),('3cf5ef037e8c17f91fffad44cd3374106d76ce28','::1','',0,'__ci_last_regenerate|i:1443218572;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443218848'),('3d2ac58bb4840a5197b63e1bed09de819398844e','::1','',0,'__ci_last_regenerate|i:1443491088;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443491387'),('4134b1783e88548658157b226f41ff809e7af156','::1','',0,'__ci_last_regenerate|i:1443492963;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443493239'),('430a4b78770c1a0c0ebca8ee9a6827498b960ad0','::1','',0,'__ci_last_regenerate|i:1443216395;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443216693'),('439bbc0332b315072c64ae616d6816ff37ecb96e','::1','',0,'__ci_last_regenerate|i:1443492171;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443492221'),('43b2ca6c0e320ad11eeff714e46115728e53188a','::1','',0,'__ci_last_regenerate|i:1443217426;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443217497'),('45f2fcb0426398c9765281ea8d9f8fccc100748f','::1','',0,'__ci_last_regenerate|i:1443493574;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443493850'),('48e1e0920edc6dafb77c582c299b07e4fbb0eb8c','::1','',0,'__ci_last_regenerate|i:1444356327;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1444356329'),('4bdaab0a6285c870ffe2b62e70b7636c350442b9','::1','',0,'__ci_last_regenerate|i:1442797988;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442798281'),('4db6ce3e91037290727d2578278da40bd0b8025f','::1','',0,'__ci_last_regenerate|i:1443223239;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443223513'),('4e4c24af5458808eabe554f2c80e7ac881388f3c','::1','',0,'__ci_last_regenerate|i:1443219873;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443220142'),('4e8d6da420c56fa31f3ff2ce3caa1b99297a021f','::1','',0,'__ci_last_regenerate|i:1442792989;','1442793163'),('50a31fe688d1193adfec25fd0dd8bb8876d01fd3','::1','',0,'__ci_last_regenerate|i:1442802339;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442802635'),('55bd14fac32b2ba53533bb0bb18a754f78ceed33','::1','',0,'__ci_last_regenerate|i:1444428340;','1444428340'),('5632339e3f98db6e27d554b376ae2f134e60e4ca','::1','',0,'__ci_last_regenerate|i:1442797667;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442797963'),('5744922e95147804a294ff76d1a53848a313a2d2','::1','',0,'__ci_last_regenerate|i:1443219517;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443219771'),('580b2fe5833cb7d3fbad88c08025242548aba13d','::1','',0,'__ci_last_regenerate|i:1443490482;','1443490764'),('5b256e8401bb2f731c2416cc9c0ae3dbc1c35c1f','::1','',0,'__ci_last_regenerate|i:1442798933;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442799159'),('5d19a3352febc77b779028bd82a3bec4b0286d98','::1','',0,'__ci_last_regenerate|i:1442796842;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442796857'),('5db52013ef69b048cfd84f9ff3f2c074263e0307','::1','',0,'__ci_last_regenerate|i:1442793831;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442793836'),('6008ad505daa6969b7c38853816105f8322189eb','::1','',0,'__ci_last_regenerate|i:1443224142;','1443224142'),('65f9ab40245b2576596622c71936cca90cb4c6e3','::1','',0,'__ci_last_regenerate|i:1443215684;','1443215684'),('672315c3dcd0b2a492c1927bfd71b7c3f3919e5c','::1','',0,'__ci_last_regenerate|i:1443494646;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443494908'),('67b66f123853bc6181264575b7ad242482b52476','::1','',0,'__ci_last_regenerate|i:1443496334;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443496395'),('6e9c1a0a21edbfbf3e99e03a57e0d70a5b1f1883','::1','',0,'__ci_last_regenerate|i:1443490181;','1443490467'),('6ecda5d37d07371c41141fdb830c047c98bcd2fd','::1','',0,'__ci_last_regenerate|i:1442798296;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442798530'),('6ed2c0e2aeed615f7fd375bd3d1ca323d03e4588','::1','',0,'__ci_last_regenerate|i:1442799521;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442799800'),('6ed533c62ead3b620d705144deb674a5c8cfb7c9','::1','',0,'__ci_last_regenerate|i:1443489386;','1443489678'),('6ff4358c310e2963d6f4a90af858b2a2d8807a3f','::1','',0,'__ci_last_regenerate|i:1443219210;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443219456'),('708ee2a426accac3862c94544edab30a5d0960c0','::1','',0,'__ci_last_regenerate|i:1443497338;','1443497338'),('7390412e8da2829ede4f1fa1d7404bc455ee3061','::1','',0,'__ci_last_regenerate|i:1443225672;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443225712'),('760155d4fc2f2ecdf699f1e9c7621f63718cd4e7','::1','',0,'__ci_last_regenerate|i:1443492642;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443492928'),('780c22038c3d89f375728925c2fa1c798145869a','::1','',0,'__ci_last_regenerate|i:1443216701;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443216950'),('7a32671b90b86872f8cb4a5db26bfb2b194ed5fd','::1','',0,'__ci_last_regenerate|i:1443223550;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443223849'),('7e0542780c17d20fb3d1a72a0602eb92fd109d96','::1','',0,'__ci_last_regenerate|i:1443217016;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443217190'),('8cd491230d26255d322d83ec26e7717c9620162e','::1','',0,'__ci_last_regenerate|i:1443489081;','1443489380'),('90b954f51e34cbc5e08d4e18242d1fe1addfbbb8','::1','',0,'__ci_last_regenerate|i:1443495360;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443495611'),('929ed807c238cc472c082e67c0be7a822c88c075','::1','',0,'__ci_last_regenerate|i:1442802495;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442802495'),('947b78bbe0719fe877c2e071a9d6a35ebd01b69e','::1','',0,'__ci_last_regenerate|i:1442793570;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442793585'),('95eb206529525ed2fc139a42fc430eea3a0269b1','::1','',0,'__ci_last_regenerate|i:1443487450;','1443487748'),('9674b32076027cb3eeac27276ca8ccd95ab05421','::1','',0,'__ci_last_regenerate|i:1442796929;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442797198'),('9931a602b527fa8f9d4cb8658593d986548a8f44','::1','',0,'__ci_last_regenerate|i:1442794538;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442794826'),('9b875aeae5e20c5b73167164d0d6b75e4d1980a5','::1','',0,'__ci_last_regenerate|i:1443220655;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443220691'),('a35d24366e2351f248eedac3aab82c3008d6847c','::1','',0,'__ci_last_regenerate|i:1442802030;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442802313'),('a444d895a2a22d980bd6bd501b97e3368a6e1010','::1','',0,'__ci_last_regenerate|i:1443489694;','1443489694'),('a703cee5541a41cc610a40f6d17e2239e01f249b','::1','',0,'__ci_last_regenerate|i:1443493877;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443494022'),('a73d9b4ae4165bac39f22f21c1cabdb9f4017cb3','::1','',0,'__ci_last_regenerate|i:1443217798;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443217987'),('a754d5e4d81eac3cc832c4f6e741d0444c5be265','::1','',0,'__ci_last_regenerate|i:1443487127;','1443487423'),('a796e42dfcb3718928e574225a26cbd5cd4d31e0','::1','',0,'__ci_last_regenerate|i:1442796628;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442796872'),('a83e4902a05fd189200710543e4141e08a3fc777','::1','',0,'__ci_last_regenerate|i:1442794220;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442794439'),('ad04ec8e012ebc4383f9241c5aa37e848d3ad769','::1','',0,'__ci_last_regenerate|i:1442800834;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442801068'),('ae13ddaf40293f4895bc88c230f96dd2f919a91e','::1','',0,'__ci_last_regenerate|i:1442803932;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442804227'),('b0fbf199011805ab92e1ce599d1a8a760dfbf586','::1','',0,'__ci_last_regenerate|i:1443491727;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443491993'),('b10546e7fcfecf47df0125761da76a2fc003b321','::1','',0,'__ci_last_regenerate|i:1442802991;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442803284'),('b88a047195302170507c3526a3532b1665544b6d','::1','',0,'__ci_last_regenerate|i:1443569777;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443569782'),('b96d6d9aee8f35935f514db309c7cc56bc8dac9f','::1','',0,'__ci_last_regenerate|i:1442804439;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442804439'),('bc27e2bebd2f95759ccc8512a912763a117a615d','::1','',0,'__ci_last_regenerate|i:1443496032;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443496304'),('bf3d686f86e4075614e7700abcc600b67d225426','::1','',0,'__ci_last_regenerate|i:1443490787;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443491064'),('bf469d0c85155a61e71273524afa60cc831619f7','::1','',0,'__ci_last_regenerate|i:1443225249;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443225514'),('c823b99d75ca8ae58d51e3782e05436a8806e8d9','::1','',0,'__ci_last_regenerate|i:1443224163;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443224405'),('c9ade14a65ef77145045dadb74fc3989444c78ef','::1','',0,'__ci_last_regenerate|i:1443225527;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443225733'),('d75897bbb3604defbd9a9349c38fcc2c67637c93','::1','',0,'__ci_last_regenerate|i:1443492642;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443492642'),('dcde78abcf9bbca0576c444a238d5db73da36dd7','::1','',0,'__ci_last_regenerate|i:1442803605;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442803904'),('e182baf094c5fe72535d3888d3e4a26b682e4f51','::1','',0,'__ci_last_regenerate|i:1442804239;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442804299'),('e2eb15149b2faba5d7cac4c84b5c51b918c466eb','::1','',0,'__ci_last_regenerate|i:1442803299;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442803590'),('e35d9d2ccd0fc00ff943cfdaf365933b426672cb','::1','',0,'__ci_last_regenerate|i:1442793886;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442794182'),('e42bdc0b9445486c56bcf978a4a540730149fb19','::1','',0,'__ci_last_regenerate|i:1443488058;','1443488358'),('e7178f18d8811e50adff32050f13f6f84f6133f1','::1','',0,'__ci_last_regenerate|i:1443220354;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443220654'),('ebe307e74464a512b10a51778315666648acfe8b','::1','',0,'__ci_last_regenerate|i:1442799844;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442800123'),('ec714ac5974f6b03e68d7715c0e9e92d1058f81e','::1','',0,'__ci_last_regenerate|i:1442794993;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442795042'),('edaa2e0c7aad4f63b4a5ba8320ad134e17ec3f13','::1','',0,'__ci_last_regenerate|i:1443487754;','1443487932'),('ee4d8bcb5621d3ca1beff230e35df2a40263da82','::1','',0,'__ci_last_regenerate|i:1443215733;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1443216027'),('f2007396e6b260d00c37fe093ac880b1239a90a4','::1','',0,'__ci_last_regenerate|i:1442797293;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442797560'),('fa6157877eaaaa6ac384539ff38dbe68cc30dabe','::1','',0,'__ci_last_regenerate|i:1444351347;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1444351470'),('fb0fa33f17cbd963a53a9a528cc114045f65ac6e','::1','',0,'__ci_last_regenerate|i:1442798621;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442798911'),('ffba9b220e0d575e12ca1f5ef70d6069cc4aa215','::1','',0,'__ci_last_regenerate|i:1442802654;logged|b:1;dsNickname|s:7:\"michell\";dsNome|s:7:\"Michell\";dsSobrenome|s:6:\"Ocaña\";','1442802917');

#
# Structure for table "aca_turma"
#

CREATE TABLE `aca_turma` (
  `idTurma` int(11) NOT NULL AUTO_INCREMENT,
  `idAula` int(11) NOT NULL DEFAULT '0',
  `chave` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT '',
  `capacidade` int(3) NOT NULL DEFAULT '0',
  `horário` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`idTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma"
#


#
# Structure for table "aca_turma_cliente"
#

CREATE TABLE `aca_turma_cliente` (
  `idTurmaCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idTurma` int(11) NOT NULL DEFAULT '0',
  `idCliente` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTurmaCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_turma_cliente"
#


#
# Structure for table "aca_usuario"
#

CREATE TABLE `aca_usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `dsNickname` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dsPassword` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dtNascimento` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dsNome` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dsSobrenome` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snTipo` enum('"CLI"','"FUNC"') COLLATE utf8_bin DEFAULT '"CLI"',
  `cpf` varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `senha` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "aca_usuario"
#

INSERT INTO `aca_usuario` VALUES (1,'michell','77274668b6fed85cd825e35475066338','17/03/1997','Michell','Ocaña','\"CLI\"',NULL,NULL,NULL,NULL),(2,'nomeusuario','a01610228fe998f515a72dd730294d87','12/12/1212','Nome','do Usuário','\"CLI\"',NULL,NULL,NULL,NULL),(3,'maisumuser','7c67e713a4b4139702de1a4fac672344','12/12/1212','Mais um','Usuário','\"CLI\"',NULL,NULL,NULL,NULL),(4,'outrousuario','81dc9bdb52d04dc20036dbd8313ed055','12/12/1212','outro','usuario','\"CLI\"',NULL,NULL,NULL,NULL),(5,'umoutro','92daa86ad43a42f28f4bf58e94667c95','12/12/1212','um','outro','\"CLI\"',NULL,NULL,NULL,NULL),(6,'porai','92daa86ad43a42f28f4bf58e94667c95','12/12/1212','mais','testes','\"CLI\"',NULL,NULL,NULL,NULL),(7,'dalalana','4c56ff4ce4aaf9573aa5dff913df997a','12/12/1212','daniel','dalalana','\"CLI\"',NULL,NULL,NULL,NULL);
