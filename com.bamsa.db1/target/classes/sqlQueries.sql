--sushmitha (14-3-2017)
--created table for saving EMPLOYEE TASK details

CREATE TABLE `bamsa`.`employeetasks` (
  `tid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `empid` VARCHAR(45) NOT NULL,
  `taskdescription` VARCHAR(255) NOT NULL,
  `givenby` INT(11) NOT NULL,
  `deadline` DATE NOT NULL,
  `givendate` DATE NOT NULL,
  PRIMARY KEY (`tid`));

  CREATE TABLE `bamsa`.`taskdetails` (
  `tdid` INT(11) NOT NULL AUTO_INCREMENT,
  `tid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `percentagecompleted` FLOAT NOT NULL,
  `queries` VARCHAR(255) NULL,
  `backlogs` VARCHAR(255) NULL,
  PRIMARY KEY (`tdid`));

  DELIMITER $$

USE `bamsa`$$

DROP PROCEDURE IF EXISTS `employeedetailsProcedure`$$

CREATE PROCEDURE employeedetailsProcedure()
BEGIN
DECLARE done INT DEFAULT 0;

SELECT  hierarchyid,umid,NAME,empid FROM (SELECT um.uid AS umid,hierarchyid,name,empid FROM employeemappings um,employeedetails ud WHERE ud.uid = um.uid) ps,(SELECT @pv := '1') initialisation WHERE   FIND_IN_SET(hierarchyid, @pv) >= 0 AND @pv := CONCAT(@pv, ',',umid)ORDER BY hierarchyid,umid   ;


END$$

DELIMITER ;

--Nikhila (01-4-2017)
--employeedetails table modification

ALTER TABLE bamsa.employeedetails MODIFY dob date NOT NULL;

---changed tid column as a auto increment
ALTER TABLE `bamsa`.`employeetasks` 
CHANGE COLUMN `tid` `tid` INT(11) NOT NULL AUTO_INCREMENT ;

----added tasktype column
ALTER TABLE bamsa.employeetasks ADD COLUMN tasktype char(4) NOT NULL; 

----added projectname coulumn
ALTER TABLE bamsa.employeetasks ADD COLUMN project_name varchar(255) NOT NULL; 

---altered column name
ALTER TABLE `bamsa`.`employeetasks` 
CHANGE COLUMN `project_name` `projectname` VARCHAR(255) NULL DEFAULT NULL ;

END$$

DELIMITER ;
--Rajamohan(07-04-2017)
--grievancedetails table
CREATE TABLE `bamsa`.`grievancedetails` (
  `gid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `grievancetype` VARCHAR(45) NOT NULL,
  `grievancesevere` VARCHAR(255) NOT NULL,
  `mobileNo` VARCHAR(45) NOT NULL,
  `grievancedetails` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`gid`));

  ALTER TABLE `bamsa`.`grievancedetails` 
CHANGE COLUMN `gid` `gid` INT(11) NOT NULL AUTO_INCREMENT ;

  --Nikhila (11-4-2017)
  ---altered stored procedure----
USE `bamsa`;
DROP procedure IF EXISTS `employeedetailsProcedure`;

DELIMITER $$
USE `bamsa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employeedetailsProcedure`()
BEGIN
DECLARE done INT DEFAULT 0;

SELECT  hierarchyid,umid,NAME,empid,streamid,desigid,branchname FROM (SELECT um.uid AS umid,hierarchyid,name,empid,streamid,desigid,branchname FROM employeemappings um,employeedetails ud WHERE ud.uid = um.uid) ps,(SELECT @pv := '1') initialisation WHERE   FIND_IN_SET(hierarchyid, @pv) >= 0 AND @pv := CONCAT(@pv, ',',umid)ORDER BY hierarchyid,umid   ;


END$$

DELIMITER ;
--Rajamohan(01-4-2017)
--taskdetails table modification added a new row reason
ALTER TABLE bamsa.taskdetails ADD COLUMN reason varchar(255) NOT NULL; 


--Sushmitha(25-4-2017)
--created table companyassets for storing asset details

CREATE TABLE `bamsa`.`companyassets` (
  `caid` INT(11) NOT NULL,
  `assettag` VARCHAR(45) NOT NULL,
  `assetstatus` VARCHAR(45) NOT NULL,
  `assetserial` VARCHAR(45) NOT NULL,
  `assetname` VARCHAR(45) NOT NULL,
  `purchasedate` DATE NOT NULL,
  `supplier` VARCHAR(45) NOT NULL,
  `orderno` VARCHAR(45) NOT NULL,
  `purcchasecost` FLOAT NOT NULL,
  `warranty` INT(11) NOT NULL,
  `notes` VARCHAR(225) NULL,
  `assetimage` BLOB NULL,
  PRIMARY KEY (`caid`));

ALTER TABLE `bamsa`.`companyassets` 
CHANGE COLUMN `caid` `caid` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `bamsa`.`companyassets` 
ADD COLUMN `model` VARCHAR(45) NOT NULL AFTER `assetimage`;



--Sushmitha(25-4-2017)
--created table companylicenses for storing license details

CREATE TABLE `bamsa`.`companylicenses` (
  `clid` INT(11) NOT NULL AUTO_INCREMENT,
  `softwarename` VARCHAR(225) NOT NULL,
  `seats` INT(11) NOT NULL,
  `company` VARCHAR(225) NOT NULL,
  `manufacturer` VARCHAR(225) NULL,
  `licensedto` VARCHAR(45) NOT NULL,
  `licensedmail` VARCHAR(45) NOT NULL,
  `productkey` VARCHAR(225) NOT NULL,
  `orderno` VARCHAR(45) NOT NULL,
  `purchasecost` FLOAT NOT NULL,
  `purchasedate` DATE NOT NULL,
  `expirationdate` DATE NOT NULL,
  `notes` VARCHAR(225) NULL,
  PRIMARY KEY (`clid`));
  
--Sushmitha(25-4-2017)
--created table companyaccessories for storing accessory details

  CREATE TABLE `bamsa`.`companyaccessories` (
  `caid` INT(11) NOT NULL AUTO_INCREMENT,
  `accessoryname` VARCHAR(45) NOT NULL,
  `accessorycategory` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(225) NOT NULL,
  `modelno` VARCHAR(45) NULL,
  `orderno` VARCHAR(45) NOT NULL,
  `purchasedate` DATE NOT NULL,
  `purchasecost` FLOAT NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`caid`));

  
--Sushmitha(25-4-2017)
--created table companyconsumables for storing consumable details

CREATE TABLE `bamsa`.`companyconsumables` (
  `ccid` INT(11) NOT NULL AUTO_INCREMENT,
  `consumablename` VARCHAR(45) NOT NULL,
  `consumablecategory` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `modelno` VARCHAR(45) NULL,
  `itemno` VARCHAR(45) NOT NULL,
  `orderno` VARCHAR(45) NOT NULL,
  `purchasedate` DATE NOT NULL,
  `purchasecost` FLOAT NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`ccid`));
  
  
--Sushmitha(25-4-2017)
--created table companycomponents for storing component details

CREATE TABLE `bamsa`.`companycomponents` (
  `ccmid` INT(11) NOT NULL AUTO_INCREMENT,
  `componentname` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `serialno` VARCHAR(45) NOT NULL,
  `orderno` VARCHAR(45) NOT NULL,
  `purchaseddate` DATE NOT NULL,
  `purchasecost` FLOAT NOT NULL,
  PRIMARY KEY (`ccmid`));

  ALTER TABLE `bamsa`.`companyassets` 
CHANGE COLUMN `purcchasecost` `purchasecost` FLOAT NOT NULL ;

ALTER TABLE `bamsa`.`companyassets` 
ADD UNIQUE INDEX `assettag_UNIQUE` (`assettag` ASC);




ALTER TABLE `bamsa`.`companylicenses` 
DROP COLUMN `company`;

ALTER TABLE `bamsa`.`companylicenses` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `licensedmail`;

ALTER TABLE `bamsa`.`companylicenses` 
ADD COLUMN `createddate` DATE NOT NULL ;

ALTER TABLE `bamsa`.`companyconsumables` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `manufacturer`;

ALTER TABLE `bamsa`.`companyconsumables`  
ADD COLUMN `createddate` DATE NOT NULL ;

ALTER TABLE `bamsa`.`companyassets` 
ADD COLUMN `createddate` DATE NOT NULL ;

ALTER TABLE `bamsa`.`companyassets` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `assetname`;

ALTER TABLE `bamsa`.`companyaccessories`  
ADD COLUMN `createddate` DATE NOT NULL ;

ALTER TABLE `bamsa`.`companyaccessories` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `manufacturer`;

ALTER TABLE `bamsa`.`companyaccessories` 
ADD COLUMN `accessoriestag` VARCHAR(45) NOT NULL  AFTER `caid`;

ALTER TABLE `bamsa`.`companyaccessories` 
ADD UNIQUE INDEX `accessoriestag_UNIQUE` (`accessoriestag` ASC);

ALTER TABLE `bamsa`.`companycomponents` 
ADD COLUMN `componenttag` VARCHAR(45) NOT NULL UNIQUE  AFTER `ccmid`;

ALTER TABLE `bamsa`.`companyconsumables` 
ADD COLUMN `consumabletag` VARCHAR(45) NOT NULL UNIQUE  AFTER `ccid`;

ALTER TABLE `bamsa`.`companycomponents`  
ADD COLUMN `createddate` DATE NOT NULL ;

ALTER TABLE `bamsa`.`companycomponents` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `componentname`;

ALTER TABLE `bamsa`.`companylicenses` 
ADD COLUMN `licensetag` VARCHAR(45) NOT NULL UNIQUE  AFTER `clid`;


CREATE TABLE `bamsa`.`assettickets` (
  `atid` INT(11) NOT NULL AUTO_INCREMENT,
  `assettype` VARCHAR(45) NOT NULL,
  `tag` VARCHAR(45) NOT NULL,
  `requestto` INT(11) NOT NULL,
  `purpose` VARCHAR(45) NOT NULL,
  `remarks` VARCHAR(225) NULL,
  `fromdate` DATE NULL,
  `todate` DATE NULL,
  `risedby` INT(11) NOT NULL,
  `riseddate` DATE NOT NULL,
  `thstatus` VARCHAR(45) NULL,
  `approvedby` INT(11) NULL,
  `approveddate` DATE NULL,
  `bstatus` VARCHAR(45) NULL,
  `rstatus` VARCHAR(45) NULL,
  PRIMARY KEY (`atid`));

  ALTER TABLE `bamsa`.`grievancedetails` 
ADD COLUMN `status` VARCHAR(45) NOT NULL AFTER `grievancedetails`;


ALTER TABLE `bamsa`.`employeedetails` 
ADD UNIQUE INDEX `empid_UNIQUE` (`empid` ASC);

CREATE TABLE `bamsa`.`projectdetails` (
  `npid` INT(11) NOT NULL AUTO_INCREMENT,
  `projectname` VARCHAR(255) NOT NULL,
  `projectdescription` VARCHAR(400) NOT NULL,
  `projectdeadline` DATE NOT NULL,
  PRIMARY KEY (`npid`));
  
  ALTER TABLE `bamsa`.`employeetasks` 
CHANGE COLUMN `tasktype` `tasktype` CHAR(1) NOT NULL ;

ALTER TABLE `bamsa`.`projectdetails`  
ADD COLUMN `createddate` DATE  NULL ;

ALTER TABLE `bamsa`.`projectdetails` 
CHANGE COLUMN `createddate` `createddate` DATE NOT NULL ;


CREATE TABLE `bamsa`.`createbranch` (
  `nbid` INT(11) NOT NULL AUTO_INCREMENT,
  `branchname` VARCHAR(255) NOT NULL,
  `state` VARCHAR(255) NOT NULL,
  `createddate` DATE NOT NULL,
  PRIMARY KEY (`nbid`));

ALTER TABLE `bamsa`.`companyassets` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`companylicenses` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`companyaccessories` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`companyconsumables` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`companycomponents` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `createddate`;



CREATE TABLE `bamsa`.`candidateinfo` (
  `ciid` INT(11) NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `middlename` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `emailid` VARCHAR(255) NOT NULL,
  `contactno` VARCHAR(255) NOT NULL,
  `currentlocation` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NULL,
  `visastatus` VARCHAR(45) NOT NULL,
  `availablefrom` DATE NOT NULL,
  `relocation` VARCHAR(255) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `typeofconsultant` VARCHAR(45) NOT NULL,
  `hotlist` VARCHAR(45) NULL,
  `ssnno` VARCHAR(45) NULL,
  `billrate` VARCHAR(45) NULL,
  `rate` FLOAT NULL,
  `coverletter` BLOB NULL,
  `resume` BLOB NOT NULL,
  PRIMARY KEY (`ciid`));

  CREATE TABLE `bamsa`.`accountinfo` (
  `acid` INT(11) NOT NULL AUTO_INCREMENT,
  `accountname` VARCHAR(255) NOT NULL,
  `accountowner` VARCHAR(255) NULL,
  `category` VARCHAR(255) NOT NULL,
  `website` VARCHAR(255) NULL,
  `status` VARCHAR(45) NOT NULL,
  `addressinfo` VARCHAR(255) NULL,
  `phoneno` VARCHAR(255) NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`acid`));

  ALTER TABLE `bamsa`.`accountinfo` 
CHANGE COLUMN `email` `primaryemail` VARCHAR(225) NOT NULL ,
ADD COLUMN `firstname` VARCHAR(255) NOT NULL AFTER `description`,
ADD COLUMN `lastname` VARCHAR(255) NULL AFTER `firstname`,
ADD COLUMN `secondaryemail` VARCHAR(255) NULL AFTER `lastname`,
ADD COLUMN `reclist` CHAR(1) NULL AFTER `secondaryemail`,
ADD COLUMN `hotlist` CHAR(1) NULL AFTER `reclist`;

ALTER TABLE `bamsa`.`candidateinfo` 
ADD COLUMN `primaryskills` VARCHAR(255) NOT NULL AFTER `resume`;

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `hotlist` `hotlist` CHAR(1) NULL DEFAULT NULL ;

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `relocation` `relocation` CHAR(1) NOT NULL ;

ALTER TABLE `bamsa`.`candidateinfo` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `primaryskills`,
ADD COLUMN `createddate` DATE NOT NULL AFTER `createdby`;

ALTER TABLE `bamsa`.`accountinfo` 
DROP COLUMN `addressinfo`;

ALTER TABLE `bamsa`.`accountinfo` 
ADD COLUMN `createddate` DATE NOT NULL AFTER `hotlist`;

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `ciid` `ciid` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `coverletter` `coverletter` MEDIUMBLOB NULL DEFAULT NULL ;


CREATE TABLE `bamsa`.`openinginfo` (
  `rqid` INT(11) NOT NULL AUTO_INCREMENT,
  `positionid` INT(11) NOT NULL,
  `positiontitle` VARCHAR(255) NOT NULL,
  `state` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `primaryskill` VARCHAR(255) NOT NULL,
  `secondaryskill` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `rate` FLOAT NOT NULL,
  `primevendor` VARCHAR(255) NOT NULL,
  `endclient` VARCHAR(255) NOT NULL,
  `createdby` INT(11) NOT NULL,
  `createddate` DATE NOT NULL,
  PRIMARY KEY (`rqid`));

ALTER TABLE `bamsa`.`openinginfo` 
CHANGE COLUMN `positionid` `positionid` VARCHAR(255) NOT NULL ,
ADD UNIQUE INDEX `positionid_UNIQUE` (`positionid` ASC);

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `currentlocation` `state` VARCHAR(255) NOT NULL ;

ALTER TABLE `bamsa`.`employeedetails` 
ADD COLUMN `branchname` VARCHAR(255) NOT NULL AFTER `outtime`;

ALTER TABLE `bamsa`.`projectdetails` 
ADD COLUMN `picture` BLOB NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `billrate` `billrate` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `rate` `rate` FLOAT NOT NULL ;

ALTER TABLE `bamsa`.`openinginfo` 
ADD COLUMN `billtype` INT(11) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`openinginfo` 
CHANGE COLUMN `city` `city` VARCHAR(255) NULL ;

ALTER TABLE `bamsa`.`accountinfo` 
ADD COLUMN `createdby` INT(11) NOT NULL AFTER `createddate`;

ALTER TABLE `bamsa`.`accountinfo` 
ADD UNIQUE INDEX `acid_UNIQUE` (`acid` ASC),
DROP PRIMARY KEY,
ADD PRIMARY KEY (`accountname`, `firstname`);


ALTER TABLE `bamsa`.`openinginfo` 
ADD COLUMN `contactperson` VARCHAR(255) NOT NULL AFTER `billtype`;

ALTER TABLE `bamsa`.`candidateinfo` 
ADD UNIQUE INDEX `emailid_UNIQUE` (`emailid` ASC);

ALTER TABLE `bamsa`.`candidateinfo` 
CHANGE COLUMN `coverletter` `coverletter` VARCHAR(255) NULL DEFAULT NULL ;
CHANGE COLUMN `resume` `resume` VARCHAR(255) NOT NULL;