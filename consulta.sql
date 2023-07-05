-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema facturasCompania
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema facturasCompania
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `facturasCompania` DEFAULT CHARACTER SET utf8 ;
USE `facturasCompania` ;

-- -----------------------------------------------------
-- Table `facturasCompania`.`departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`departament` (
  `id_departament` INT NOT NULL,
  `name_departament` VARCHAR(45) NULL,
  PRIMARY KEY (`id_departament`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`customer` (
  `nit_customer` VARCHAR(45) NOT NULL,
  `name_customer` VARCHAR(45) NULL,
  `phone1` BIGINT(45) NULL,
  `phone2` BIGINT(45) NULL,
  `value` BIGINT(45) NULL,
  PRIMARY KEY (`nit_customer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`employee` (
  `cc_employee` MEDIUMTEXT NOT NULL,
  `name_employee` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`cc_employee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`employee` (
  `cc_employee` MEDIUMTEXT NOT NULL,
  `name_employee` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`cc_employee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`client` (
  `nit_client` VARCHAR(45) NOT NULL,
  `name_client` VARCHAR(45) NULL,
  `employee_cc_employee` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`nit_client`, `employee_cc_employee`),
  INDEX `fk_client_employee1_idx` (`employee_cc_employee` ASC),
  CONSTRAINT `fk_client_employee1`
    FOREIGN KEY (`employee_cc_employee`)
    REFERENCES `facturasCompania`.`employee` (`cc_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`invoice` (
  `value` MEDIUMTEXT NULL,
  `client_nit_client` VARCHAR(45) NOT NULL,
  `client_employee_cc_employee` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`client_nit_client`, `client_employee_cc_employee`),
  CONSTRAINT `fk_invoice_client1`
    FOREIGN KEY (`client_nit_client` , `client_employee_cc_employee`)
    REFERENCES `facturasCompania`.`client` (`nit_client` , `employee_cc_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturasCompania`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturasCompania`.`phone` (
  `id_phone` INT NOT NULL,
  `phone_number` MEDIUMTEXT NULL,
  `client_nit_client` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_phone`, `client_nit_client`),
  INDEX `fk_phone_client1_idx` (`client_nit_client` ASC),
  CONSTRAINT `fk_phone_client1`
    FOREIGN KEY (`client_nit_client`)
    REFERENCES `facturasCompania`.`client` (`nit_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
