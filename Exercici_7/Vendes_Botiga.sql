-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Adreça electrònica` VARCHAR(45) NULL,
  `Data_Naixement` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  `Edat` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Ticket` (
  `Identificador` INT NOT NULL,
  `NºFactura` VARCHAR(45) NULL,
  `idEmpleat` VARCHAR(45) NULL,
  `Ticket.Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Preu_IVA_Inclós` VARCHAR(45) NULL,
  `DNI_Empleat` VARCHAR(45) NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`Identificador`),
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `Exercici7`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `Codi_Intern` INT NOT NULL AUTO_INCREMENT,
  `Codi_Barres` VARCHAR(45) NULL,
  `Preu_Unitari` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NULL,
  `Preu_Final` VARCHAR(45) NULL,
  `Producte.nom` VARCHAR(45) NULL,
  PRIMARY KEY (`Codi_Intern`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Linea_de_Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Linea_de_Ticket` (
  `Identificador` VARCHAR(45) NOT NULL,
  `Identificador-Ticket` VARCHAR(45) NULL,
  `Codi_Producte` VARCHAR(45) NULL,
  `Descripció_Producte` VARCHAR(45) NULL,
  `Unitats_Descompte` VARCHAR(45) NULL,
  `Preu_Unitari` VARCHAR(45) NULL,
  `Preu_Total` VARCHAR(45) NULL,
  `Ticket_Identificador` INT NOT NULL,
  `Producte_Codi_Intern` INT NOT NULL,
  INDEX `fk_Linea_de_Ticket_Ticket1_idx` (`Ticket_Identificador` ASC) VISIBLE,
  INDEX `fk_Linea_de_Ticket_Producte1_idx` (`Producte_Codi_Intern` ASC) VISIBLE,
  PRIMARY KEY (`Identificador`),
  CONSTRAINT `fk_Linea_de_Ticket_Ticket1`
    FOREIGN KEY (`Ticket_Identificador`)
    REFERENCES `Exercici7`.`Ticket` (`Identificador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_de_Ticket_Producte1`
    FOREIGN KEY (`Producte_Codi_Intern`)
    REFERENCES `Exercici7`.`Producte` (`Codi_Intern`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
