-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bookPrj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookPrj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise5` DEFAULT CHARACTER SET utf8mb3 ;
USE `exercise5` ;

-- -----------------------------------------------------
-- Table `bookPrj`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Admin` (
  `ad_id` VARCHAR(255) NOT NULL,
  `ad_pw` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ad_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`User` (
  `u_id` VARCHAR(255) NOT NULL,
  `u_pw` VARCHAR(255) NOT NULL,
  `u_name` VARCHAR(255) NOT NULL,
  `u_phone` VARCHAR(255) NOT NULL,
  `u_email` VARCHAR(255) NOT NULL,
  `u_address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`u_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `bookPrj`.`Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Answer` (
  `a_id` INT(11) NOT NULL AUTO_INCREMENT,
  `q_number` INT(11) NULL DEFAULT NULL,
  `a_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `ad_id` VARCHAR(255) NOT NULL,
  `u_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`a_id`),
  INDEX `fk_Answer_Admin1_idx` (`ad_id` ASC) VISIBLE,
  INDEX `fk_Answer_User1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_Admin1`
    FOREIGN KEY (`ad_id`)
    REFERENCES `exercise5`.`Admin` (`ad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_User1`
    FOREIGN KEY (`u_id`)
    REFERENCES `exercise5`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Book` (
  `b_code` INT(11) NOT NULL AUTO_INCREMENT,
  `b_title` VARCHAR(255) NOT NULL,
  `b_writer` VARCHAR(255) NOT NULL,
  `b_pubDate` VARCHAR(255) NOT NULL,
  `b_price` INT(11) NOT NULL,
  `b_genre` VARCHAR(255) NOT NULL,
  `b_img` VARCHAR(255) NOT NULL,
  `b_like` INT(11) NULL DEFAULT 0,
  PRIMARY KEY (`b_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



-- -----------------------------------------------------
-- Table `bookPrj`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Cart` (
  `c_count` INT(11) NULL DEFAULT 0,
  `u_id` VARCHAR(255) NOT NULL,
  `b_code` INT(11) NOT NULL,
  INDEX `fk_Cart_User1_idx` (`u_id` ASC) VISIBLE,
  INDEX `fk_Cart_Book1_idx` (`b_code` ASC) VISIBLE,
  PRIMARY KEY (`b_code`),
  CONSTRAINT `fk_Cart_User1`
    FOREIGN KEY (`u_id`)
    REFERENCES `exercise5`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cart_Book1`
    FOREIGN KEY (`b_code`)
    REFERENCES `exercise5`.`Book` (`b_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`Notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Notice` (
  `n_id` INT(11) NOT NULL AUTO_INCREMENT,
  `n_title` VARCHAR(255) NOT NULL,
  `n_content` VARCHAR(255) NOT NULL,
  `n_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `ad_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`n_id`),
  INDEX `fk_Notice_Admin1_idx` (`ad_id` ASC) VISIBLE,
  CONSTRAINT `fk_Notice_Admin1`
    FOREIGN KEY (`ad_id`)
    REFERENCES `exercise5`.`Admin` (`ad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Orders` (
  `o_number` INT(11) NOT NULL AUTO_INCREMENT,
  `o_count` INT(11) NOT NULL DEFAULT 1,
  `o_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `o_status` VARCHAR(255) NOT NULL,
  `b_code` INT(11) NOT NULL,
  `u_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`o_number`),
  INDEX `fk_Orders_Book1_idx` (`b_code` ASC) VISIBLE,
  INDEX `fk_Orders_User1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Book1`
    FOREIGN KEY (`b_code`)
    REFERENCES `exercise5`.`Book` (`b_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_User1`
    FOREIGN KEY (`u_id`)
    REFERENCES `exercise5`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`Quest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Quest` (
  `q_number` INT(11) NOT NULL AUTO_INCREMENT,
  `q_title` VARCHAR(255) NULL DEFAULT NULL,
  `q_content` VARCHAR(255) NULL DEFAULT NULL,
  `q_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `q_img` VARCHAR(255) NULL DEFAULT NULL,
  `u_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`q_number`),
  INDEX `fk_Quest_User1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_Quest_User1`
    FOREIGN KEY (`u_id`)
    REFERENCES `exercise5`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bookPrj`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise5`.`Review` (
  `r_content` VARCHAR(255) NOT NULL,
  `r_star` INT(11) NULL DEFAULT 1,
  `b_code` INT(11) NOT NULL,
  `o_number` INT(11) NOT NULL,
  `u_id` VARCHAR(255) NOT NULL,
  INDEX `fk_Review_Book1_idx` (`b_code` ASC) VISIBLE,
  INDEX `fk_Review_Orders1_idx` (`o_number` ASC) VISIBLE,
  INDEX `fk_Review_User1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Book1`
    FOREIGN KEY (`b_code`)
    REFERENCES `exercise5`.`Book` (`b_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Orders1`
    FOREIGN KEY (`o_number`)
    REFERENCES `exercise5`.`Orders` (`o_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`u_id`)
    REFERENCES `exercise5`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

DESC Cart;

SELECT * FROM Cart;
DELETE FROM Cart
WHERE 
 u_id = 2 AND b_code = 4;
