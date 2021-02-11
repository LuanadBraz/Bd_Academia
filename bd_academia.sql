-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.31 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para bd_academia
CREATE DATABASE IF NOT EXISTS `bd_academia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_academia`;

-- Copiando estrutura para tabela bd_academia.tb_agencia
CREATE TABLE IF NOT EXISTS `tb_agencia` (
  `cd_agencia` int(4) unsigned NOT NULL,
  `cd_banco` int(4) unsigned DEFAULT NULL,
  `nome_agencia` varchar(50) DEFAULT NULL,
  `logradouro_agencia` varchar(100) DEFAULT NULL,
  `num_logradouro_agencia` varchar(10) DEFAULT NULL,
  `cep_logradouro_agencia` varchar(10) DEFAULT NULL,
  `descricao_compl_logradouro` varchar(100) DEFAULT NULL,
  `cd_usuario_cadastro` varchar(7) DEFAULT NULL,
  `dta_hr_inclusao_agencia` date DEFAULT NULL,
  PRIMARY KEY (`cd_agencia`) USING BTREE,
  KEY `FK_tb_agencia_tb_endereco` (`cep_logradouro_agencia`),
  KEY `FK_tb_agencia_tb_banco` (`cd_banco`) USING BTREE,
  KEY `FK_tb_agencia_tb_usuario` (`cd_usuario_cadastro`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_agencia: 0 rows
/*!40000 ALTER TABLE `tb_agencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_agencia` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_bairro
CREATE TABLE IF NOT EXISTS `tb_bairro` (
  `cd_bairro` int(7) NOT NULL,
  `nome_bairro` varchar(20) DEFAULT NULL,
  `cd_cidade` int(7) DEFAULT NULL,
  PRIMARY KEY (`cd_bairro`) USING BTREE,
  KEY `cd_cidade_idx` (`cd_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_bairro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_bairro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bairro` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_banco
CREATE TABLE IF NOT EXISTS `tb_banco` (
  `cd_banco` int(4) unsigned NOT NULL,
  `nome_banco` varchar(50) DEFAULT NULL,
  `data_insclusao` date DEFAULT NULL,
  PRIMARY KEY (`cd_banco`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_banco: 0 rows
/*!40000 ALTER TABLE `tb_banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_banco` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_cidade
CREATE TABLE IF NOT EXISTS `tb_cidade` (
  `cd_cidade` int(7) NOT NULL,
  `nome_cidade` varchar(20) DEFAULT NULL,
  `cd_estado` int(7) DEFAULT NULL,
  PRIMARY KEY (`cd_cidade`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_cidade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_cliente
CREATE TABLE IF NOT EXISTS `tb_cliente` (
  `cd_cliente` int(15) unsigned NOT NULL,
  `cd_tipo_cliente` tinyint(1) DEFAULT NULL,
  `logradouro_cliente` varchar(100) DEFAULT NULL,
  `num_logradouro_cliente` int(10) unsigned DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep_logradouro_cliente` varchar(10) DEFAULT NULL,
  `cd_usuario_cadastro` varchar(7) DEFAULT NULL,
  `dta_hr_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`cd_cliente`) USING BTREE,
  KEY `FK_tb_cliente_tb_endereco` (`cep_logradouro_cliente`),
  KEY `FK_tb_cliente_tb_tipo_cliente` (`cd_tipo_cliente`) USING BTREE,
  KEY `FK_tb_cliente_tb_usuario` (`cd_usuario_cadastro`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_cliente: 1 rows
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` (`cd_cliente`, `cd_tipo_cliente`, `logradouro_cliente`, `num_logradouro_cliente`, `bairro`, `cep_logradouro_cliente`, `cd_usuario_cadastro`, `dta_hr_cadastro`) VALUES
	(1, 1, 'Rua Narumi Nakayama', 627, 'JD. N sra de Fatima', '06816-250', '1', '2020-10-26 11:07:00');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_cliente_pf
CREATE TABLE IF NOT EXISTS `tb_cliente_pf` (
  `num_cpf` int(11) unsigned NOT NULL,
  `cd_cliente_pf` int(15) unsigned NOT NULL,
  `nome_completo_cliente_pf` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` tinyint(2) DEFAULT NULL,
  `estado_civil` varchar(20) DEFAULT NULL,
  `num_certidao_matrimocial` int(6) unsigned DEFAULT NULL,
  `nome_livro_registro` varchar(25) DEFAULT NULL,
  `num_folha_livro_registro` varchar(6) DEFAULT NULL,
  `num_titulo_eleitor` int(12) unsigned DEFAULT NULL,
  `num_zona_eleitoral` int(3) unsigned DEFAULT NULL,
  `num_secao_eleitoral` int(4) unsigned DEFAULT NULL,
  `dta_hr_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`num_cpf`),
  KEY `codigo_cliente_pf_idx` (`cd_cliente_pf`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_cliente_pf: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_cliente_pf` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_pf` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_cliente_pj
CREATE TABLE IF NOT EXISTS `tb_cliente_pj` (
  `num_cnpj` int(11) unsigned NOT NULL,
  `cd_cliente_pj` int(15) unsigned NOT NULL,
  `nome_fantasia` varchar(80) DEFAULT NULL,
  `data_abertura_empresa` date DEFAULT NULL,
  `dta_hr_cadastro` datetime DEFAULT NULL,
  `dta_hr_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`num_cnpj`) USING BTREE,
  KEY `FK_tb_cliente_pj_tb_cliente` (`cd_cliente_pj`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_cliente_pj: 0 rows
/*!40000 ALTER TABLE `tb_cliente_pj` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_pj` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_conta_corrente
CREATE TABLE IF NOT EXISTS `tb_conta_corrente` (
  `cd_conta_corrente` int(4) unsigned NOT NULL,
  `cd_banco` int(4) unsigned DEFAULT NULL,
  `cd_agencia` int(4) unsigned DEFAULT NULL,
  `num_conta_corrente` int(7) unsigned DEFAULT NULL,
  `cd_cliente` int(15) unsigned DEFAULT NULL,
  `dta_abertura_conta_corrente` date DEFAULT NULL,
  `dta_encerramento_conta_corrente` date DEFAULT NULL,
  PRIMARY KEY (`cd_conta_corrente`) USING BTREE,
  KEY `FK_tb_conta_corrente_tb_agencia` (`cd_agencia`) USING BTREE,
  KEY `FK_tb_conta_corrente_tb_banco` (`cd_banco`) USING BTREE,
  KEY `FK_tb_conta_corrente_tb_cliente` (`cd_cliente`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_conta_corrente: 0 rows
/*!40000 ALTER TABLE `tb_conta_corrente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_conta_corrente` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_endereco
CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `cd_cep` varchar(11) NOT NULL,
  `cd_bairro` int(7) DEFAULT NULL,
  `cd_cidade` int(7) NOT NULL,
  `cd_estado` int(7) DEFAULT NULL,
  `cd_pais` int(7) DEFAULT NULL,
  PRIMARY KEY (`cd_cep`) USING BTREE,
  KEY `FK_tb_endereco_tb_bairro` (`cd_bairro`) USING BTREE,
  KEY `FK_tb_endereco_tb_cidade` (`cd_cidade`) USING BTREE,
  KEY `FK_tb_endereco_tb_estado` (`cd_estado`) USING BTREE,
  KEY `FK_tb_endereco_tb_pais` (`cd_pais`) USING BTREE,
  CONSTRAINT `cd_bairro` FOREIGN KEY (`cd_bairro`) REFERENCES `tb_bairro` (`cd_bairro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cd_cidade` FOREIGN KEY (`cd_cidade`) REFERENCES `tb_cidade` (`cd_cidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_endereco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_estado
CREATE TABLE IF NOT EXISTS `tb_estado` (
  `cd_estado` int(7) unsigned NOT NULL,
  `sigla_estado` varchar(2) DEFAULT NULL,
  `nome_estado` varchar(20) DEFAULT NULL,
  `cd_pais` int(7) DEFAULT NULL,
  PRIMARY KEY (`cd_estado`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_estado: 0 rows
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_estado_civil
CREATE TABLE IF NOT EXISTS `tb_estado_civil` (
  `cd_estado_civil` int(7) unsigned NOT NULL,
  `nome_estado_civil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_estado_civil`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_estado_civil: 0 rows
/*!40000 ALTER TABLE `tb_estado_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estado_civil` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_genero
CREATE TABLE IF NOT EXISTS `tb_genero` (
  `cd_genero_cliente_pf` int(7) unsigned NOT NULL,
  `sexo_cliente` varchar(2) DEFAULT NULL,
  `nome_sexo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_genero_cliente_pf`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_genero: 0 rows
/*!40000 ALTER TABLE `tb_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_genero` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_pais
CREATE TABLE IF NOT EXISTS `tb_pais` (
  `cd_pais` int(7) unsigned NOT NULL,
  `nome_pais` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cd_pais`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_pais: 0 rows
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_situacao_usuario
CREATE TABLE IF NOT EXISTS `tb_situacao_usuario` (
  `cd_situacao_usuario` tinyint(1) NOT NULL,
  `descricao_situacao_usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_situacao_usuario`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_situacao_usuario: 2 rows
/*!40000 ALTER TABLE `tb_situacao_usuario` DISABLE KEYS */;
INSERT INTO `tb_situacao_usuario` (`cd_situacao_usuario`, `descricao_situacao_usuario`) VALUES
	(1, 'Ativo'),
	(2, 'Cancelado');
/*!40000 ALTER TABLE `tb_situacao_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_tipo_cliente
CREATE TABLE IF NOT EXISTS `tb_tipo_cliente` (
  `cd_tipo_cliente` tinyint(1) NOT NULL DEFAULT '0',
  `descricao_tipo_cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_tipo_cliente`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_tipo_cliente: 2 rows
/*!40000 ALTER TABLE `tb_tipo_cliente` DISABLE KEYS */;
INSERT INTO `tb_tipo_cliente` (`cd_tipo_cliente`, `descricao_tipo_cliente`) VALUES
	(1, 'Pessoa Fisica'),
	(2, 'Pessoa Juridica');
/*!40000 ALTER TABLE `tb_tipo_cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_academia.tb_usuario
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `cd_usuario` varchar(7) NOT NULL,
  `nome_usuario` varchar(50) DEFAULT NULL,
  `cd_situacao_usuario` tinyint(1) NOT NULL,
  PRIMARY KEY (`cd_usuario`) USING BTREE,
  KEY `FK_tb_usuario_tb_situacao_usuario` (`cd_situacao_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_academia.tb_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` (`cd_usuario`, `nome_usuario`, `cd_situacao_usuario`) VALUES
	('1', 'Luana Braz', 1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
