-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_5` ;
USE `Exercici_5` ;

-- -----------------------------------------------------
-- Table `Exercici_5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Client` (
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Població` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  `Usuari` VARCHAR(45) NULL,
  `Contrasenya` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Cita` (
  `Matricula - Vehicle` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Cites_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Matricula - Vehicle`, `Cites_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Vehicle` (
  `Marca` INT NOT NULL,
  `Model` VARCHAR(45) NULL,
  `Cita_Matricula - Vehicle` INT NOT NULL,
  `Client_DNI` VARCHAR(45) NOT NULL,
  `Tipus_de_vehicle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Marca`, `Cita_Matricula - Vehicle`, `Tipus_de_vehicle`, `Client_DNI`),
  INDEX `fk_Vehicle_Cita1_idx` (`Cita_Matricula - Vehicle` ASC) VISIBLE,
  INDEX `fk_Vehicle_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Cita1`
    FOREIGN KEY (`Cita_Matricula - Vehicle`)
    REFERENCES `Exercici_5`.`Cita` (`Matricula - Vehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `Exercici_5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_5`.`Tipus de vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Tipus de vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  `Vehicle_Matrícula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_5`.`Vehicle_has_Tipus de vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Vehicle_has_Tipus de vehicle` (
  `Vehicle_Marca` INT NOT NULL,
  `Tipus de vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`Vehicle_Marca`, `Tipus de vehicle_ID`),
  INDEX `fk_Vehicle_has_Tipus de vehicle_Tipus de vehicle1_idx` (`Tipus de vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Vehicle_has_Tipus de vehicle_Vehicle1_idx` (`Vehicle_Marca` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_Marca`)
    REFERENCES `Exercici_5`.`Vehicle` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle_Tipus de vehicle1`
    FOREIGN KEY (`Tipus de vehicle_ID`)
    REFERENCES `Exercici_5`.`Tipus de vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_5`.`Vehicle_has_Tipus de vehicle1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_5`.`Vehicle_has_Tipus de vehicle1` (
  `Vehicle_Marca` INT NOT NULL,
  `Tipus_de_vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`Vehicle_Marca`, `Tipus_de_vehicle_ID`),
  INDEX `fk_Vehicle_has_Tipus de vehicle1_Tipus de vehicle1_idx` (`Tipus_de_vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Vehicle_has_Tipus de vehicle1_Vehicle1_idx` (`Vehicle_Marca` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle1_Vehicle1`
    FOREIGN KEY (`Vehicle_Marca`)
    REFERENCES `Exercici_5`.`Vehicle` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle1_Tipus de vehicle1`
    FOREIGN KEY (`Tipus_de_vehicle_ID`)
    REFERENCES `Exercici_5`.`Tipus de vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
