-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GlobalSuperStore_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GlobalSuperStore_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GlobalSuperStore_db` DEFAULT CHARACTER SET utf8 ;
USE `GlobalSuperStore_db` ;

-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`CustomerSegment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`CustomerSegment` (
  `SegmentID` INT NOT NULL,
  `Segment` VARCHAR(45) NULL,
  PRIMARY KEY (`SegmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(45) NULL,
  `SegmentID` INT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `SegmentID_idx` (`SegmentID` ASC) VISIBLE,
  CONSTRAINT `SegmentID`
    FOREIGN KEY (`SegmentID`)
    REFERENCES `GlobalSuperStore_db`.`CustomerSegment` (`SegmentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Category` (
  `CategoryID` INT NOT NULL,
  `Category` VARCHAR(45) NULL,
  `SubCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `CategoryID` INT NOT NULL,
  INDEX `CategoryID_idx` (`CategoryID` ASC) VISIBLE,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `CategoryID`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `GlobalSuperStore_db`.`Category` (`CategoryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Region` (
  `RegionID` INT NOT NULL,
  `Region` VARCHAR(45) NULL,
  `Market` VARCHAR(45) NULL,
  PRIMARY KEY (`RegionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Country` (
  `CountryID` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CountryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`State` (
  `StateID` INT NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StateID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`City` (
  `CityID` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CityID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`DeliveryAddress` (
  `AddressID` INT NOT NULL,
  `RegionID` INT NOT NULL,
  `CountryID` INT NOT NULL,
  `StateID` INT NOT NULL,
  `CityID` INT NOT NULL,
  `PostalCode` INT NOT NULL,
  PRIMARY KEY (`AddressID`),
  INDEX `RegionID_idx` (`RegionID` ASC) VISIBLE,
  INDEX `CountryID_idx` (`CountryID` ASC) VISIBLE,
  INDEX `StateID_idx` (`StateID` ASC) VISIBLE,
  INDEX `CityID_idx` (`CityID` ASC) VISIBLE,
  CONSTRAINT `RegionID`
    FOREIGN KEY (`RegionID`)
    REFERENCES `GlobalSuperStore_db`.`Region` (`RegionID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CountryID`
    FOREIGN KEY (`CountryID`)
    REFERENCES `GlobalSuperStore_db`.`Country` (`CountryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StateID`
    FOREIGN KEY (`StateID`)
    REFERENCES `GlobalSuperStore_db`.`State` (`StateID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CityID`
    FOREIGN KEY (`CityID`)
    REFERENCES `GlobalSuperStore_db`.`City` (`CityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`ShippingMode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`ShippingMode` (
  `ShipModeID` INT NOT NULL,
  `ShipMode` VARCHAR(45) NULL,
  PRIMARY KEY (`ShipModeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Shipping` (
  `ShippingID` INT NOT NULL,
  `ShipModeID` INT NOT NULL,
  `ShipDate` DATETIME NULL,
  `ShippingCost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ShippingID`),
  INDEX `ShipModeID_idx` (`ShipModeID` ASC) VISIBLE,
  CONSTRAINT `ShipModeID`
    FOREIGN KEY (`ShipModeID`)
    REFERENCES `GlobalSuperStore_db`.`ShippingMode` (`ShipModeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`OrderPriority`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`OrderPriority` (
  `OrderPriorityID` INT NOT NULL,
  `OrderPriority` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderPriorityID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `OrderPriorityID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `OrderPriorityID_idx` (`OrderPriorityID` ASC) VISIBLE,
  CONSTRAINT `OrderPriorityID`
    FOREIGN KEY (`OrderPriorityID`)
    REFERENCES `GlobalSuperStore_db`.`OrderPriority` (`OrderPriorityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore_db`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore_db`.`Sales` (
  `RowID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `ShippingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  `Discount` DECIMAL(10,2) NULL,
  `Profit` DECIMAL(10,2) NULL,
  `ProductID` INT NOT NULL,
  PRIMARY KEY (`RowID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `ShippingID_idx` (`ShippingID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  INDEX `ProductID_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `GlobalSuperStore_db`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ShippingID`
    FOREIGN KEY (`ShippingID`)
    REFERENCES `GlobalSuperStore_db`.`Shipping` (`ShippingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `GlobalSuperStore_db`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `GlobalSuperStore_db`.`DeliveryAddress` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ProductID`
    FOREIGN KEY (`ProductID`)
    REFERENCES `GlobalSuperStore_db`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
