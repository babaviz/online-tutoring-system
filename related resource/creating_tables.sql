SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `onlinetutoring` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `onlinetutoring` ;

-- -----------------------------------------------------
-- Table `onlinetutoring`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Person` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Person` (
  `id` INT NOT NULL ,
  `first_name` VARCHAR(30) NULL ,
  `last_name` VARCHAR(30) NULL ,
  `email` VARCHAR(60) NOT NULL ,
  `password` VARCHAR(30) NOT NULL ,
  `phone` VARCHAR(15) NULL ,
  `birthday` DATE NULL ,
  `card_num` VARCHAR(16) NULL ,
  `type` CHAR(1) NOT NULL ,
  `point` INT NULL DEFAULT 0 ,
  `head_pic_sn` VARCHAR(10) NULL ,
  `school` VARCHAR(20) NULL ,
  `cookie_sn` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Subject` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Subject` (
  `id` INT NOT NULL ,
  `name` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Questions` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Questions` (
  `id` INT NOT NULL ,
  `person_id` INT NOT NULL ,
  `title` VARCHAR(30) NOT NULL ,
  `content` VARCHAR(1000) NOT NULL ,
  `time` DATETIME NULL ,
  `view` INT NOT NULL DEFAULT 0 ,
  `pic_sn` VARCHAR(10) NULL ,
  `attachment_sn` VARCHAR(10) NULL ,
  `subject_id` INT NULL ,
  `reply` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `picSn_UNIQUE` (`pic_sn` ASC) ,
  UNIQUE INDEX `attachmentSn_UNIQUE` (`attachment_sn` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `authorId_idx` (`person_id` ASC) ,
  INDEX `fk_que_sub_id_idx` (`subject_id` ASC) ,
  CONSTRAINT `fk_que_per_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_que_sub_id`
    FOREIGN KEY (`subject_id` )
    REFERENCES `onlinetutoring`.`Subject` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Answers` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Answers` (
  `id` INT NOT NULL ,
  `person_id` INT NOT NULL ,
  `content` VARCHAR(1000) NULL ,
  `time` DATETIME NULL ,
  `question_id` INT NULL ,
  `pic_sn` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `questionId_idx` (`question_id` ASC) ,
  INDEX `authorId_idx` (`person_id` ASC) ,
  CONSTRAINT `fk_ans_per_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ans_que_id`
    FOREIGN KEY (`question_id` )
    REFERENCES `onlinetutoring`.`Questions` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Notification` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Notification` (
  `id` INT NOT NULL ,
  `notification_id` INT NOT NULL ,
  `receiver_id` INT NOT NULL ,
  `type` INT NOT NULL ,
  `time` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `_idx` (`receiver_id` ASC) ,
  CONSTRAINT `fk_not_per_id`
    FOREIGN KEY (`receiver_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Tutor` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Tutor` (
  `id` INT NOT NULL ,
  `person_id` INT NOT NULL ,
  `balance` INT NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`, `person_id`) ,
  UNIQUE INDEX `personId_UNIQUE` (`person_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_tut_per_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Student` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Student` (
  `id` INT NOT NULL ,
  `person_id` INT NOT NULL ,
  `grade` INT NULL ,
  PRIMARY KEY (`id`, `person_id`) ,
  UNIQUE INDEX `personId_UNIQUE` (`person_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_stu_per_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Friend` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Friend` (
  `id_a` INT NOT NULL ,
  `id_b` INT NOT NULL ,
  PRIMARY KEY (`id_a`, `id_b`) ,
  INDEX `fk_fri_b_per_id_idx` (`id_b` ASC) ,
  INDEX `fk_fri_a_per_id_idx` (`id_a` ASC) ,
  CONSTRAINT `fk_fri_a_per_id`
    FOREIGN KEY (`id_a` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fri_b_per_id`
    FOREIGN KEY (`id_b` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`message` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`message` (
  `id` INT NOT NULL ,
  `sender_id` INT NOT NULL ,
  `receiver_id` INT NOT NULL ,
  `content` VARCHAR(200) NOT NULL ,
  `time` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `toId_idx` (`receiver_id` ASC) ,
  INDEX `fromId_idx` (`sender_id` ASC) ,
  CONSTRAINT `fk_mes_sen_per_id`
    FOREIGN KEY (`sender_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mes_rec_per_id`
    FOREIGN KEY (`receiver_id` )
    REFERENCES `onlinetutoring`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Course` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Course` (
  `id` INT NOT NULL ,
  `start_time` DATETIME NOT NULL ,
  `end_time` DATETIME NOT NULL ,
  `duration` INT NOT NULL ,
  `student_id` INT NULL ,
  `tutor_id` INT NOT NULL ,
  `price` INT NOT NULL DEFAULT 0 ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(1000) NOT NULL ,
  `subject_id` INT NOT NULL ,
  `eval_by_tutor_a` INT NOT NULL DEFAULT 0 ,
  `eval_by_tutor_b` INT NOT NULL DEFAULT 0 ,
  `eval_by_tutor_c` INT NOT NULL DEFAULT 0 ,
  `eval_by_stu_a` INT NOT NULL DEFAULT 0 ,
  `eval_by_stu_b` INT NOT NULL DEFAULT 0 ,
  `eval_by_stu_c` INT NOT NULL DEFAULT 0 ,
  `evaluation` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_cou_sub_id_idx` (`subject_id` ASC) ,
  INDEX `fk_cou_stu_per_id_idx` (`student_id` ASC) ,
  INDEX `fk_cou_tut_per_id_idx` (`tutor_id` ASC) ,
  CONSTRAINT `fk_cou_stu_per_id`
    FOREIGN KEY (`student_id` )
    REFERENCES `onlinetutoring`.`Student` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cou_tut_per_id`
    FOREIGN KEY (`tutor_id` )
    REFERENCES `onlinetutoring`.`Tutor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cou_sub_id`
    FOREIGN KEY (`subject_id` )
    REFERENCES `onlinetutoring`.`Subject` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`Application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`Application` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`Application` (
  `course_id` INT NOT NULL ,
  `student_id` INT NOT NULL ,
  PRIMARY KEY (`course_id`, `student_id`) ,
  INDEX `courseId_idx` (`course_id` ASC) ,
  INDEX `fk_app_stu_id_idx` (`student_id` ASC) ,
  CONSTRAINT `fk_app_cou_id`
    FOREIGN KEY (`course_id` )
    REFERENCES `onlinetutoring`.`Course` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_stu_id`
    FOREIGN KEY (`student_id` )
    REFERENCES `onlinetutoring`.`Student` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinetutoring`.`specializedField`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onlinetutoring`.`specializedField` ;

CREATE  TABLE IF NOT EXISTS `onlinetutoring`.`specializedField` (
  `id` INT NOT NULL ,
  `tutor_id` INT NOT NULL ,
  `subject_id` INT NULL ,
  PRIMARY KEY (`id`, `tutor_id`) ,
  UNIQUE INDEX `tutorId_UNIQUE` (`tutor_id` ASC) ,
  INDEX `fk_spe_sub_id_idx` (`subject_id` ASC) ,
  CONSTRAINT `fk_spe_tut_id`
    FOREIGN KEY (`tutor_id` )
    REFERENCES `onlinetutoring`.`Tutor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spe_sub_id`
    FOREIGN KEY (`subject_id` )
    REFERENCES `onlinetutoring`.`Subject` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `onlinetutoring` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
