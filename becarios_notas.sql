-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema becarios_udb_virtual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema becarios_udb_virtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `becarios_udb_virtual` DEFAULT CHARACTER SET utf8 ;
USE `becarios_udb_virtual` ;

-- -----------------------------------------------------
-- Table `becarios_udb_virtual`.`Beca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `becarios_udb_virtual`.`Beca` (
  `idinstitucion` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `monto` VARCHAR(45) NULL,
  PRIMARY KEY (`idinstitucion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `becarios_udb_virtual`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `becarios_udb_virtual`.`alumnos` (
  `idalumnos` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Beca_idinstitucion` INT NOT NULL,
  PRIMARY KEY (`idalumnos`),
  INDEX `fk_alumnos_Beca_idx` (`Beca_idinstitucion` ASC) ,
  CONSTRAINT `fk_alumnos_Beca`
    FOREIGN KEY (`Beca_idinstitucion`)
    REFERENCES `becarios_udb_virtual`.`Beca` (`idinstitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `becarios_udb_virtual`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `becarios_udb_virtual`.`Materia` (
  `idmateria` INT NOT NULL,
  `Nombre de la materia` VARCHAR(45) NULL,
  PRIMARY KEY (`idmateria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `becarios_udb_virtual`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `becarios_udb_virtual`.`Notas` (
  `ideva` INT NOT NULL,
  `Notas` DECIMAL(2) NULL,
  `porcentaje` INT NULL,
  `descripcion` VARCHAR(45) NULL,
  `alumnos_idalumnos` INT NOT NULL,
  `Materia_idmateria` INT NOT NULL,
  PRIMARY KEY (`ideva`),
  INDEX `fk_Notas_alumnos1_idx` (`alumnos_idalumnos` ASC) ,
  INDEX `fk_Notas_Materia1_idx` (`Materia_idmateria` ASC),
  CONSTRAINT `fk_Notas_alumnos1`
    FOREIGN KEY (`alumnos_idalumnos`)
    REFERENCES `becarios_udb_virtual`.`alumnos` (`idalumnos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notas_Materia1`
    FOREIGN KEY (`Materia_idmateria`)
    REFERENCES `becarios_udb_virtual`.`Materia` (`idmateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
