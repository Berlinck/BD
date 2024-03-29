SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ReservaX` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ReservaX` ;

-- -----------------------------------------------------
-- Table `ReservaX`.`SENHAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`SENHAS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`SENHAS` (
  `IDSENHAS` INT NOT NULL AUTO_INCREMENT ,
  `SENHA` VARCHAR(45) NOT NULL ,
  `CONFIRMA_SENHA` VARCHAR(45) NOT NULL ,
  `KEY` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IDSENHAS`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`PAGOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`PAGOS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`PAGOS` (
  `IDPAGOS` INT NOT NULL AUTO_INCREMENT ,
  `COMPROVANTE` ENUM('TRUE', 'FALSE') NOT NULL ,
  PRIMARY KEY (`IDPAGOS`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`ATIVIDADE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`ATIVIDADE` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`ATIVIDADE` (
  `IDATIVIDADE` INT NOT NULL AUTO_INCREMENT ,
  `CONDIÇÃO_ATIVIDADE` ENUM('TRUE', 'FALSE') NOT NULL ,
  `PAGOS_IDPAGOS` INT NOT NULL ,
  PRIMARY KEY (`IDATIVIDADE`, `PAGOS_IDPAGOS`) ,
  INDEX `fk_ATIVIDADE_PAGOS1_idx` (`PAGOS_IDPAGOS` ASC) ,
  CONSTRAINT `fk_ATIVIDADE_PAGOS1`
    FOREIGN KEY (`PAGOS_IDPAGOS` )
    REFERENCES `ReservaX`.`PAGOS` (`IDPAGOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`PERMISSÃO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`PERMISSÃO` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`PERMISSÃO` (
  `IDPERMISSION` INT NOT NULL AUTO_INCREMENT ,
  `PERMISSION` DECIMAL NOT NULL ,
  PRIMARY KEY (`IDPERMISSION`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`TELEFONE_USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`TELEFONE_USUARIO` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`TELEFONE_USUARIO` (
  `IDTELEFONE_USUARIO` INT NOT NULL AUTO_INCREMENT ,
  `NUMERO_USUARIO` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IDTELEFONE_USUARIO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`PLANOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`PLANOS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`PLANOS` (
  `IDPLANOS` INT NOT NULL AUTO_INCREMENT ,
  `NOME_PLANO` VARCHAR(45) NOT NULL ,
  `VALOR_PLANO` VARCHAR(45) NOT NULL ,
  `USUARIOS_MAXIMOS` DECIMAL NOT NULL ,
  PRIMARY KEY (`IDPLANOS`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`TELEFONE_EMPRESA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`TELEFONE_EMPRESA` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`TELEFONE_EMPRESA` (
  `IDTELEFONE_EMPRESA` INT NOT NULL AUTO_INCREMENT ,
  `NUMERO_EMPRESA` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IDTELEFONE_EMPRESA`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`EMPRESAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`EMPRESAS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`EMPRESAS` (
  `IDEMPRESAS` INT NOT NULL AUTO_INCREMENT ,
  `EMAIL_EMPRESAS` VARCHAR(45) NOT NULL ,
  `LOGRADOURO_EMPRESAS` MEDIUMTEXT NOT NULL ,
  `PLANOS_IDPLANOS` INT NOT NULL ,
  `PAGOS_IDPAGOS` INT NOT NULL ,
  `SENHAS_IDSENHAS` INT NOT NULL ,
  `PERMISSÃO_IDPERMISSION` INT NOT NULL ,
  `ATIVIDADE_IDATIVIDADE` INT NOT NULL ,
  `TELEFONE_EMPRESA_IDTELEFONE_EMPRESA` INT NOT NULL ,
  PRIMARY KEY (`IDEMPRESAS`, `PLANOS_IDPLANOS`, `PAGOS_IDPAGOS`, `SENHAS_IDSENHAS`, `PERMISSÃO_IDPERMISSION`, `ATIVIDADE_IDATIVIDADE`, `TELEFONE_EMPRESA_IDTELEFONE_EMPRESA`) ,
  INDEX `fk_EMPRESAS_PLANOS1_idx` (`PLANOS_IDPLANOS` ASC) ,
  INDEX `fk_EMPRESAS_PAGOS1_idx` (`PAGOS_IDPAGOS` ASC) ,
  INDEX `fk_EMPRESAS_SENHAS1_idx` (`SENHAS_IDSENHAS` ASC) ,
  INDEX `fk_EMPRESAS_PERMISSÃO1_idx` (`PERMISSÃO_IDPERMISSION` ASC) ,
  INDEX `fk_EMPRESAS_ATIVIDADE1_idx` (`ATIVIDADE_IDATIVIDADE` ASC) ,
  INDEX `fk_EMPRESAS_TELEFONE_EMPRESA1_idx` (`TELEFONE_EMPRESA_IDTELEFONE_EMPRESA` ASC) ,
  CONSTRAINT `fk_EMPRESAS_PLANOS1`
    FOREIGN KEY (`PLANOS_IDPLANOS` )
    REFERENCES `ReservaX`.`PLANOS` (`IDPLANOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_PAGOS1`
    FOREIGN KEY (`PAGOS_IDPAGOS` )
    REFERENCES `ReservaX`.`PAGOS` (`IDPAGOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_SENHAS1`
    FOREIGN KEY (`SENHAS_IDSENHAS` )
    REFERENCES `ReservaX`.`SENHAS` (`IDSENHAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_PERMISSÃO1`
    FOREIGN KEY (`PERMISSÃO_IDPERMISSION` )
    REFERENCES `ReservaX`.`PERMISSÃO` (`IDPERMISSION` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_ATIVIDADE1`
    FOREIGN KEY (`ATIVIDADE_IDATIVIDADE` )
    REFERENCES `ReservaX`.`ATIVIDADE` (`IDATIVIDADE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_TELEFONE_EMPRESA1`
    FOREIGN KEY (`TELEFONE_EMPRESA_IDTELEFONE_EMPRESA` )
    REFERENCES `ReservaX`.`TELEFONE_EMPRESA` (`IDTELEFONE_EMPRESA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`USUARIO` (
  `IDUSUARIO` INT NOT NULL AUTO_INCREMENT ,
  `EMAIL_USUARIO` VARCHAR(45) NOT NULL ,
  `NOME_USUAIRO` VARCHAR(45) NOT NULL ,
  `ENDEREÇO_USUARIO` VARCHAR(45) NOT NULL ,
  `` VARCHAR(45) NOT NULL ,
  `SENHAS_IDSENHAS` INT NOT NULL ,
  `ATIVIDADE_IDATIVIDADE` INT NOT NULL ,
  `PERMISSÃO_IDPERMISSION` INT NOT NULL ,
  `TELEFONE_USUARIO_IDTELEFONE_USUARIO` INT NOT NULL ,
  `EMPRESAS_IDEMPRESAS` INT NOT NULL ,
  PRIMARY KEY (`IDUSUARIO`, `SENHAS_IDSENHAS`, `ATIVIDADE_IDATIVIDADE`, `PERMISSÃO_IDPERMISSION`, `TELEFONE_USUARIO_IDTELEFONE_USUARIO`, `EMPRESAS_IDEMPRESAS`) ,
  INDEX `fk_USUARIO_SENHAS_idx` (`SENHAS_IDSENHAS` ASC) ,
  INDEX `fk_USUARIO_ATIVIDADE1_idx` (`ATIVIDADE_IDATIVIDADE` ASC) ,
  INDEX `fk_USUARIO_PERMISSÃO1_idx` (`PERMISSÃO_IDPERMISSION` ASC) ,
  INDEX `fk_USUARIO_TELEFONE_USUARIO1_idx` (`TELEFONE_USUARIO_IDTELEFONE_USUARIO` ASC) ,
  INDEX `fk_USUARIO_EMPRESAS1_idx` (`EMPRESAS_IDEMPRESAS` ASC) ,
  CONSTRAINT `fk_USUARIO_SENHAS`
    FOREIGN KEY (`SENHAS_IDSENHAS` )
    REFERENCES `ReservaX`.`SENHAS` (`IDSENHAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_ATIVIDADE1`
    FOREIGN KEY (`ATIVIDADE_IDATIVIDADE` )
    REFERENCES `ReservaX`.`ATIVIDADE` (`IDATIVIDADE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_PERMISSÃO1`
    FOREIGN KEY (`PERMISSÃO_IDPERMISSION` )
    REFERENCES `ReservaX`.`PERMISSÃO` (`IDPERMISSION` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_TELEFONE_USUARIO1`
    FOREIGN KEY (`TELEFONE_USUARIO_IDTELEFONE_USUARIO` )
    REFERENCES `ReservaX`.`TELEFONE_USUARIO` (`IDTELEFONE_USUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_EMPRESAS1`
    FOREIGN KEY (`EMPRESAS_IDEMPRESAS` )
    REFERENCES `ReservaX`.`EMPRESAS` (`IDEMPRESAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`SALAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`SALAS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`SALAS` (
  `IDSALAS` INT NOT NULL AUTO_INCREMENT ,
  `NUMERO_SALA` VARCHAR(45) NOT NULL ,
  `EMPRESAS_IDEMPRESAS` INT NOT NULL ,
  PRIMARY KEY (`IDSALAS`, `EMPRESAS_IDEMPRESAS`) ,
  INDEX `fk_SALAS_EMPRESAS1_idx` (`EMPRESAS_IDEMPRESAS` ASC) ,
  CONSTRAINT `fk_SALAS_EMPRESAS1`
    FOREIGN KEY (`EMPRESAS_IDEMPRESAS` )
    REFERENCES `ReservaX`.`EMPRESAS` (`IDEMPRESAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`TURMAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`TURMAS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`TURMAS` (
  `IDTURMAS` INT NOT NULL AUTO_INCREMENT ,
  `NUMERO_TURMA` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IDTURMAS`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`HORARIOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`HORARIOS` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`HORARIOS` (
  `IDHORARIOS` INT NOT NULL AUTO_INCREMENT ,
  `HORA_INICIO` TIME NOT NULL ,
  `HORA_FIM` TIME NOT NULL ,
  PRIMARY KEY (`IDHORARIOS`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReservaX`.`RESERVA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReservaX`.`RESERVA` ;

CREATE  TABLE IF NOT EXISTS `ReservaX`.`RESERVA` (
  `IDRESERVA` INT NOT NULL AUTO_INCREMENT ,
  `DESCRIÇÃO_RESERVA` LONGTEXT NOT NULL ,
  `USUARIO_IDUSUARIO` INT NOT NULL ,
  `EMPRESAS_IDEMPRESAS` INT NOT NULL ,
  `SALAS_IDSALAS` INT NOT NULL ,
  `TURMAS_IDTURMAS` INT NOT NULL ,
  `HORARIOS_IDHORARIOS` INT NOT NULL ,
  PRIMARY KEY (`IDRESERVA`, `USUARIO_IDUSUARIO`, `EMPRESAS_IDEMPRESAS`, `SALAS_IDSALAS`, `TURMAS_IDTURMAS`, `HORARIOS_IDHORARIOS`) ,
  INDEX `fk_RESERVA_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC) ,
  INDEX `fk_RESERVA_EMPRESAS1_idx` (`EMPRESAS_IDEMPRESAS` ASC) ,
  INDEX `fk_RESERVA_SALAS1_idx` (`SALAS_IDSALAS` ASC) ,
  INDEX `fk_RESERVA_TURMAS1_idx` (`TURMAS_IDTURMAS` ASC) ,
  INDEX `fk_RESERVA_HORARIOS1_idx` (`HORARIOS_IDHORARIOS` ASC) ,
  CONSTRAINT `fk_RESERVA_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO` )
    REFERENCES `ReservaX`.`USUARIO` (`IDUSUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_EMPRESAS1`
    FOREIGN KEY (`EMPRESAS_IDEMPRESAS` )
    REFERENCES `ReservaX`.`EMPRESAS` (`IDEMPRESAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_SALAS1`
    FOREIGN KEY (`SALAS_IDSALAS` )
    REFERENCES `ReservaX`.`SALAS` (`IDSALAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_TURMAS1`
    FOREIGN KEY (`TURMAS_IDTURMAS` )
    REFERENCES `ReservaX`.`TURMAS` (`IDTURMAS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_HORARIOS1`
    FOREIGN KEY (`HORARIOS_IDHORARIOS` )
    REFERENCES `ReservaX`.`HORARIOS` (`IDHORARIOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ReservaX` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
