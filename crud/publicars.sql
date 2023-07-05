-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PUBLICARS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PUBLICARS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PUBLICARS` DEFAULT CHARACTER SET utf8 ;
USE `PUBLICARS` ;

-- -----------------------------------------------------
-- Table `PUBLICARS`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`brand` (
  `id_brand` INT NOT NULL AUTO_INCREMENT,
  `name_brand` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_brand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`brake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`brake` (
  `id_brake` INT NOT NULL AUTO_INCREMENT,
  `type_brake` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_brake`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`model` (
  `id_model` INT NOT NULL,
  `name_model` VARCHAR(45) NOT NULL,
  `cilinder` INT NOT NULL,
  `brand_id_brand` INT NOT NULL,
  `brake_id_brake` INT NOT NULL,
  PRIMARY KEY (`id_model`),
  INDEX `fk_model_brand1_idx` (`brand_id_brand` ASC),
  INDEX `fk_model_brake1_idx` (`brake_id_brake` ASC),
  CONSTRAINT `fk_model_brand1`
    FOREIGN KEY (`brand_id_brand`)
    REFERENCES `PUBLICARS`.`brand` (`id_brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_brake1`
    FOREIGN KEY (`brake_id_brake`)
    REFERENCES `PUBLICARS`.`brake` (`id_brake`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`seating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`seating` (
  `id_seating` INT NOT NULL AUTO_INCREMENT,
  `material` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_seating`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`combustible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`combustible` (
  `id_combustible` INT NOT NULL AUTO_INCREMENT,
  `type_combustible` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_combustible`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`color` (
  `id_color` INT NOT NULL AUTO_INCREMENT,
  `name_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_color`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`automobile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`automobile` (
  `id_automobile` INT NOT NULL AUTO_INCREMENT,
  `registration_number` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `price_automobile` MEDIUMTEXT NOT NULL,
  `negotiable` TINYINT(1) NOT NULL,
  `mileage` INT NOT NULL,
  `glasses` TINYINT(1) NOT NULL,
  `airbag` TINYINT(1) NOT NULL,
  `air_conditioner` TINYINT(1) NOT NULL,
  `transmition` TINYINT(1) NOT NULL,
  `traction` TINYINT(1) NOT NULL,
  `service_type` TINYINT(1) NOT NULL,
  `model_id_model` INT NOT NULL,
  `seating_id_seating` INT NOT NULL,
  `combustible_id_combustible` INT NOT NULL,
  `color_id_color` INT NOT NULL,
  PRIMARY KEY (`id_automobile`),
  INDEX `fk_automobile_model_idx` (`model_id_model` ASC),
  INDEX `fk_automobile_seating1_idx` (`seating_id_seating` ASC),
  INDEX `fk_automobile_combustible1_idx` (`combustible_id_combustible` ASC),
  INDEX `fk_automobile_color1_idx` (`color_id_color` ASC),
  CONSTRAINT `fk_automobile_model`
    FOREIGN KEY (`model_id_model`)
    REFERENCES `PUBLICARS`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_automobile_seating1`
    FOREIGN KEY (`seating_id_seating`)
    REFERENCES `PUBLICARS`.`seating` (`id_seating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_automobile_combustible1`
    FOREIGN KEY (`combustible_id_combustible`)
    REFERENCES `PUBLICARS`.`combustible` (`id_combustible`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_automobile_color1`
    FOREIGN KEY (`color_id_color`)
    REFERENCES `PUBLICARS`.`color` (`id_color`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `identification` MEDIUMTEXT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` MEDIUMTEXT NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`department` (
  `id_department` INT NOT NULL AUTO_INCREMENT,
  `name_department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`city` (
  `id_city` INT NOT NULL AUTO_INCREMENT,
  `name_city` VARCHAR(45) NOT NULL,
  `department_id_department` INT NOT NULL,
  PRIMARY KEY (`id_city`),
  INDEX `fk_city_department1_idx` (`department_id_department` ASC),
  CONSTRAINT `fk_city_department1`
    FOREIGN KEY (`department_id_department`)
    REFERENCES `PUBLICARS`.`department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`ad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`ad` (
  `id_ad` INT NOT NULL AUTO_INCREMENT,
  `initial_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `price_ad` MEDIUMTEXT NOT NULL,
  `automobile_id_automobile` INT NOT NULL,
  `user_id_user` INT NOT NULL,
  `city_id_city` INT NOT NULL,
  PRIMARY KEY (`id_ad`),
  INDEX `fk_ad_user1_idx` (`user_id_user` ASC),
  INDEX `fk_ad_city1_idx` (`city_id_city` ASC),
  INDEX `fk_ad_automobile1_idx` (`automobile_id_automobile` ASC),
  CONSTRAINT `fk_ad_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `PUBLICARS`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ad_city1`
    FOREIGN KEY (`city_id_city`)
    REFERENCES `PUBLICARS`.`city` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ad_automobile1`
    FOREIGN KEY (`automobile_id_automobile`)
    REFERENCES `PUBLICARS`.`automobile` (`id_automobile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`payment` (
  `id_payment` INT NOT NULL AUTO_INCREMENT,
  `type_payment` TINYINT(1) NOT NULL,
  `date_payment` DATE NOT NULL,
  `quantity_payment` INT NOT NULL,
  `value_payment` MEDIUMTEXT NOT NULL,
  `ad_id_ad` INT NOT NULL,
  PRIMARY KEY (`id_payment`),
  INDEX `fk_payment_ad1_idx` (`ad_id_ad` ASC),
  CONSTRAINT `fk_payment_ad1`
    FOREIGN KEY (`ad_id_ad`)
    REFERENCES `PUBLICARS`.`ad` (`id_ad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`photo` (
  `id_photo` INT NOT NULL AUTO_INCREMENT,
  `format` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `ad_id_ad` INT NOT NULL,
  PRIMARY KEY (`id_photo`),
  INDEX `fk_photo_ad1_idx` (`ad_id_ad` ASC),
  CONSTRAINT `fk_photo_ad1`
    FOREIGN KEY (`ad_id_ad`)
    REFERENCES `PUBLICARS`.`ad` (`id_ad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICARS`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PUBLICARS`.`invoice` (
  `id_invoice` INT NOT NULL AUTO_INCREMENT,
  `date_invoice` DATE NOT NULL,
  `quantity_invoice` INT NOT NULL,
  `unit_price` INT NOT NULL,
  `total_invoice` MEDIUMTEXT NOT NULL,
  `payment_id_payment` INT NOT NULL,
  PRIMARY KEY (`id_invoice`),
  INDEX `fk_invoice_payment1_idx` (`payment_id_payment` ASC),
  CONSTRAINT `fk_invoice_payment1`
    FOREIGN KEY (`payment_id_payment`)
    REFERENCES `PUBLICARS`.`payment` (`id_payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
