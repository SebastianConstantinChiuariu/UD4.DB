-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `User` INT NOT NULL,
  `Pwd` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Població` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  PRIMARY KEY (`User`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `Matricula - Vehicle` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricula - Vehicle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `Marca` INT NOT NULL,
  `Model` VARCHAR(45) NULL,
  `DNI-Client` VARCHAR(45) NULL,
  `Client_User` INT NOT NULL,
  `Cita_Matricula - Vehicle` INT NOT NULL,
  PRIMARY KEY (`Marca`),
  INDEX `fk_Vehicle_Client1_idx` (`Client_User` ASC) VISIBLE,
  INDEX `fk_Vehicle_Cita1_idx` (`Cita_Matricula - Vehicle` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client1`
    FOREIGN KEY (`Client_User`)
    REFERENCES `mydb`.`Client` (`User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Cita1`
    FOREIGN KEY (`Cita_Matricula - Vehicle`)
    REFERENCES `mydb`.`Cita` (`Matricula - Vehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus de vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus de vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  `Vehicle_Marca` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Tipus de vehicle_Vehicle1_idx` (`Vehicle_Marca` ASC) VISIBLE,
  CONSTRAINT `fk_Tipus de vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_Marca`)
    REFERENCES `mydb`.`Vehicle` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle_has_Tipus de vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle_has_Tipus de vehicle` (
  `Vehicle_Marca` INT NOT NULL,
  `Tipus de vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`Vehicle_Marca`, `Tipus de vehicle_ID`),
  INDEX `fk_Vehicle_has_Tipus de vehicle_Tipus de vehicle1_idx` (`Tipus de vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Vehicle_has_Tipus de vehicle_Vehicle1_idx` (`Vehicle_Marca` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_Marca`)
    REFERENCES `mydb`.`Vehicle` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_has_Tipus de vehicle_Tipus de vehicle1`
    FOREIGN KEY (`Tipus de vehicle_ID`)
    REFERENCES `mydb`.`Tipus de vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
