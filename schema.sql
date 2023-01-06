-- -----------------------------------------------------
-- Schema gamedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamedb` DEFAULT CHARACTER SET utf8 ;
USE `gamedb` ;

-- -----------------------------------------------------
-- Table `gamedb`.`team`
-- -----------------------------------------------------
CREATE TABLE `gamedb`.`team` (
	`id` INTEGER auto_increment NOT NULL,
	`name` varchar(100) NOT NULL,
	CONSTRAINT `team_PK` PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb3
COLLATE=utf8mb3_general_ci
AUTO_INCREMENT=1;


-- -----------------------------------------------------
-- Table `gamedb`.`match_info`
-- -----------------------------------------------------
CREATE TABLE `gamedb`.match_info (
	`id` INTEGER auto_increment NOT NULL,
	`home_team` INTEGER NOT NULL,
	`away_team` INTEGER NOT NULL,
	`home_score` INTEGER NOT NULL,
	`away_score` INTEGER NOT NULL,
	`in_game_minute` INTEGER NOT NULL,
	`home_win_payout` DOUBLE NOT NULL,
	`away_win_payout` DOUBLE NOT NULL,
	`draw_payout` DOUBLE NOT NULL,
	`start_time` DATETIME NOT NULL,
	`end_time` DATETIME NULL,
	status varchar(100) NOT NULL,
	CONSTRAINT match_PK PRIMARY KEY (`id`),
  CONSTRAINT `match_home_FK` FOREIGN KEY (`home_team`) REFERENCES `gamedb`.`team`(`id`),
  CONSTRAINT `match_away_FK` FOREIGN KEY (`away_team`) REFERENCES `gamedb`.`team`(`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb3
COLLATE=utf8mb3_general_ci;


-- -----------------------------------------------------
-- Table `gamedb`.`match_history`
-- -----------------------------------------------------
CREATE TABLE `gamedb`.match_history (
	`id` INTEGER auto_increment NOT NULL,
	`home_team` INTEGER NOT NULL,
	`away_team` INTEGER NOT NULL,
	`home_score` INTEGER NOT NULL,
	`away_score` INTEGER NOT NULL,
	`start_time` DATETIME NOT NULL,
	`end_time` DATETIME NULL,
	status varchar(100) NOT NULL,
	CONSTRAINT match_history_PK PRIMARY KEY (`id`),
  CONSTRAINT `match_history_home_FK` FOREIGN KEY (`home_team`) REFERENCES `gamedb`.`team`(`id`),
  CONSTRAINT `match_history_away_FK` FOREIGN KEY (`away_team`) REFERENCES `gamedb`.`team`(`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb3
COLLATE=utf8mb3_general_ci;
