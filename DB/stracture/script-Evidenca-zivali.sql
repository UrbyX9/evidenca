-- MySQL Script generated by MySQL Workbench
-- Mon Jun  1 12:42:22 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema evidenca_zivali
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `evidenca_zivali` ;

-- -----------------------------------------------------
-- Schema evidenca_zivali
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evidenca_zivali` DEFAULT CHARACTER SET utf8 ;
USE `evidenca_zivali` ;

-- -----------------------------------------------------
-- Table `evidenca_zivali`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`users` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`users` (
  `idusers` INT NOT NULL,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(60) NOT NULL,
  `username` VARCHAR(90) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `profile_pic` TEXT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`breeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`breeds` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`breeds` (
  `idbreeds` INT NOT NULL,
  `breed` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbreeds`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`health`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`health` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`health` (
  `idhealth` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhealth`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`sex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`sex` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`sex` (
  `idsex` INT NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idsex`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`pregnancies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`pregnancies` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`pregnancies` (
  `idpregnancies` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpregnancies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`animal_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`animal_types` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`animal_types` (
  `idanimal_types` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idanimal_types`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`animals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`animals` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`animals` (
  `idanimals` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `ear-tag` VARCHAR(10) NOT NULL,
  `birth` DATE NOT NULL,
  `breeds_idbreeds` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  `health_idhealth` INT NOT NULL,
  `sex_idsex` INT NOT NULL,
  `pregnancies_idpregnancies` INT NULL,
  `animal_types_idanimal_types` INT NOT NULL,
  PRIMARY KEY (`idanimals`),
  UNIQUE INDEX `ear-tag_UNIQUE` (`ear-tag` ASC),
  INDEX `fk_animals_breeds_idx` (`breeds_idbreeds` ASC),
  INDEX `fk_animals_users1_idx` (`users_idusers` ASC),
  INDEX `fk_animals_health1_idx` (`health_idhealth` ASC),
  INDEX `fk_animals_sex1_idx` (`sex_idsex` ASC),
  INDEX `fk_animals_pregnancies1_idx` (`pregnancies_idpregnancies` ASC),
  INDEX `fk_animals_animal_types1_idx` (`animal_types_idanimal_types` ASC),
  CONSTRAINT `fk_animals_breeds`
    FOREIGN KEY (`breeds_idbreeds`)
    REFERENCES `evidenca_zivali`.`breeds` (`idbreeds`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `evidenca_zivali`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_health1`
    FOREIGN KEY (`health_idhealth`)
    REFERENCES `evidenca_zivali`.`health` (`idhealth`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_sex1`
    FOREIGN KEY (`sex_idsex`)
    REFERENCES `evidenca_zivali`.`sex` (`idsex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_pregnancies1`
    FOREIGN KEY (`pregnancies_idpregnancies`)
    REFERENCES `evidenca_zivali`.`pregnancies` (`idpregnancies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_animal_types1`
    FOREIGN KEY (`animal_types_idanimal_types`)
    REFERENCES `evidenca_zivali`.`animal_types` (`idanimal_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`milk_production`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`milk_production` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`milk_production` (
  `idmilk_production` INT NOT NULL,
  `quantity` FLOAT NOT NULL,
  `start_milking` DATETIME NOT NULL,
  `end_milking` DATETIME NOT NULL,
  `animals_idanimals` INT NOT NULL,
  PRIMARY KEY (`idmilk_production`),
  INDEX `fk_milk_production_animals1_idx` (`animals_idanimals` ASC),
  CONSTRAINT `fk_milk_production_animals1`
    FOREIGN KEY (`animals_idanimals`)
    REFERENCES `evidenca_zivali`.`animals` (`idanimals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`feeding_auto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`feeding_auto` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`feeding_auto` (
  `idfeeding_auto` INT NOT NULL,
  `quantity` FLOAT NOT NULL,
  `consumed` FLOAT NOT NULL,
  `last_visit` DATETIME NOT NULL,
  `animals_idanimals` INT NOT NULL,
  PRIMARY KEY (`idfeeding_auto`),
  INDEX `fk_feeding_auto_animals1_idx` (`animals_idanimals` ASC),
  CONSTRAINT `fk_feeding_auto_animals1`
    FOREIGN KEY (`animals_idanimals`)
    REFERENCES `evidenca_zivali`.`animals` (`idanimals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`comments` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`comments` (
  `idcomments` INT NOT NULL,
  `content` TEXT NOT NULL,
  `animals_idanimals` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`idcomments`),
  INDEX `fk_comments_animals1_idx` (`animals_idanimals` ASC),
  INDEX `fk_comments_users1_idx` (`users_idusers` ASC),
  CONSTRAINT `fk_comments_animals1`
    FOREIGN KEY (`animals_idanimals`)
    REFERENCES `evidenca_zivali`.`animals` (`idanimals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `evidenca_zivali`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidenca_zivali`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidenca_zivali`.`photos` ;

CREATE TABLE IF NOT EXISTS `evidenca_zivali`.`photos` (
  `idphotos` INT NOT NULL,
  `photo` TEXT NOT NULL,
  `caption` VARCHAR(90) NOT NULL,
  `animals_idanimals` INT NOT NULL,
  PRIMARY KEY (`idphotos`),
  INDEX `fk_photos_animals1_idx` (`animals_idanimals` ASC),
  CONSTRAINT `fk_photos_animals1`
    FOREIGN KEY (`animals_idanimals`)
    REFERENCES `evidenca_zivali`.`animals` (`idanimals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;