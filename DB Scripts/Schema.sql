-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema mentor_on_demand
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mentor_on_demand
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mentor_on_demand` DEFAULT CHARACTER SET utf8 ;
USE `mentor_on_demand` ;

-- -----------------------------------------------------
-- Table `mentor_on_demand`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentor_on_demand`.`user` (
  `user_id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(75) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `user_contact_number` VARCHAR(10) NOT NULL,
  `user_role` VARCHAR(6) NOT NULL,
  `user_reset_password` TINYINT(1) NOT NULL DEFAULT '0',
  `user_reset_password_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 117
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mentor_on_demand`.`mentor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentor_on_demand`.`mentor` (
  `mentor_id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `mentor_linkedin_url` VARCHAR(100) NOT NULL,
  `mentor_years_of_experience` FLOAT(2,1) NOT NULL,
  `mentor_timeslot` VARCHAR(11) NOT NULL,
  `mentor_user_id` BIGINT(10) NOT NULL,
  PRIMARY KEY (`mentor_id`),
  UNIQUE INDEX `mentor_linkedin_url_UNIQUE` (`mentor_linkedin_url` ASC),
  INDEX `user_idx` (`mentor_user_id` ASC),
  CONSTRAINT `user`
    FOREIGN KEY (`mentor_user_id`)
    REFERENCES `mentor_on_demand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mentor_on_demand`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentor_on_demand`.`skill` (
  `skill_id` BIGINT(11) NOT NULL,
  `skill_name` VARCHAR(45) NOT NULL,
  `skill_toc` VARCHAR(45) NULL DEFAULT NULL,
  `skill_prerequisite` BIGINT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  INDEX `prerequisite_idx` (`skill_prerequisite` ASC),
  CONSTRAINT `prerequisite`
    FOREIGN KEY (`skill_prerequisite`)
    REFERENCES `mentor_on_demand`.`skill` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mentor_on_demand`.`mentor_skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentor_on_demand`.`mentor_skill` (
  `ms_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
  `ms_mentor_id` BIGINT(11) NOT NULL,
  `ms_skill_id` BIGINT(11) NOT NULL,
  `ms_self_rating` FLOAT(2,1) NOT NULL,
  `ms_years_of_experience` FLOAT(2,1) NOT NULL,
  PRIMARY KEY (`ms_id`),
  INDEX `Mentor_idx` (`ms_mentor_id` ASC),
  INDEX `Skill_idx` (`ms_skill_id` ASC),
  CONSTRAINT `Mentor`
    FOREIGN KEY (`ms_mentor_id`)
    REFERENCES `mentor_on_demand`.`mentor` (`mentor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Skill`
    FOREIGN KEY (`ms_skill_id`)
    REFERENCES `mentor_on_demand`.`skill` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mentor_on_demand`.`training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mentor_on_demand`.`training` (
  `training_id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `training_user_id` BIGINT(10) NOT NULL,
  `training_mentor_id` BIGINT(10) NOT NULL,
  `training_skill_id` BIGINT(10) NOT NULL,
  `training_status` VARCHAR(20) NOT NULL,
  `training_progress` INT(11) NOT NULL,
  `training_rating` FLOAT(2,1) NULL DEFAULT NULL,
  `training_start_date` DATE NOT NULL,
  `training_end_date` DATE NOT NULL,
  PRIMARY KEY (`training_id`),
  UNIQUE INDEX `training_id_UNIQUE` (`training_id` ASC),
  INDEX `Mentor_Training_idx` (`training_mentor_id` ASC),
  INDEX `Skill_Training_idx` (`training_skill_id` ASC),
  INDEX `User_Training_idx` (`training_user_id` ASC),
  CONSTRAINT `Mentor_Training`
    FOREIGN KEY (`training_mentor_id`)
    REFERENCES `mentor_on_demand`.`mentor` (`mentor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Skill_Training`
    FOREIGN KEY (`training_skill_id`)
    REFERENCES `mentor_on_demand`.`skill` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Training`
    FOREIGN KEY (`training_user_id`)
    REFERENCES `mentor_on_demand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
