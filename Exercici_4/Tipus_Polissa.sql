-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_4` ;
USE `Exercici_4` ;

-- -----------------------------------------------------
-- Table `Exercici_4`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exercici_4`.`Client` ;

CREATE TABLE IF NOT EXISTS `Exercici_4`.`Client` (
  `Client_DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Mòbil` VARCHAR(45) NULL,
  `EsVIP` VARCHAR(45) NULL,
  PRIMARY KEY (`Client_DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_4`.`Venedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exercici_4`.`Venedor` ;

CREATE TABLE IF NOT EXISTS `Exercici_4`.`Venedor` (
  `Venedor_DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Mòbil` VARCHAR(45) NULL,
  PRIMARY KEY (`Venedor_DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_4`.`Tipus polissa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exercici_4`.`Tipus polissa` ;

CREATE TABLE IF NOT EXISTS `Exercici_4`.`Tipus polissa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_4`.`Polissa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exercici_4`.`Polissa` ;

CREATE TABLE IF NOT EXISTS `Exercici_4`.`Polissa` (
  `NumPolissa` INT NOT NULL AUTO_INCREMENT,
  `Import` VARCHAR(45) NULL,
  `DataInici` VARCHAR(45) NULL,
  `DataFi` VARCHAR(45) NULL,
  `Venedor` VARCHAR(45) NULL,
  `Tipus polissa_id` INT NOT NULL,
  `Client_Client_DNI` VARCHAR(10) NOT NULL,
  `Venedor_Venedor_DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`NumPolissa`),
  INDEX `fk_Polissa_Tipus polissa1_idx` (`Tipus polissa_id` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_Venedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Tipus polissa1`
    FOREIGN KEY (`Tipus polissa_id`)
    REFERENCES `Exercici_4`.`Tipus polissa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_Client_DNI`)
    REFERENCES `Exercici_4`.`Client` (`Client_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_Venedor_DNI`)
    REFERENCES `Exercici_4`.`Venedor` (`Venedor_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
