CREATE DATABASE IF NOT EXISTS `lxcore`;
USE `lxcore`;

CREATE TABLE `users` (
    `identifier` VARCHAR(60) NOT NULL,
    `job` VARCHAR(20) NULL DEFAULT 'unemployed',
    `job_grade` INT NULL DEFAULT 0,
    `location` longtext NULL DEFAULT NULL,
    `metadata` JSON NULL DEFAULT NULL, 

    PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;
