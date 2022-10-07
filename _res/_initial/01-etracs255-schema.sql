-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: etracs255
-- ------------------------------------------------------
-- Server version	5.5.59

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `leftindex` int(11) DEFAULT NULL,
  `rightindex` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_code` (`code`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_maingroupid` (`maingroupid`),
  KEY `ix_title` (`title`),
  KEY `uix_account_code` (`maingroupid`,`code`),
  CONSTRAINT `fk_account_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`),
  CONSTRAINT `fk_account_groupid` FOREIGN KEY (`groupid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_incometarget`
--

DROP TABLE IF EXISTS `account_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_incometarget` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemid` (`itemid`),
  KEY `ix_year` (`year`),
  CONSTRAINT `fk_account_incometarget_itemid` FOREIGN KEY (`itemid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_item_mapping`
--

DROP TABLE IF EXISTS `account_item_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_item_mapping` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_itemid` (`itemid`),
  KEY `ix_maingroupid` (`maingroupid`),
  CONSTRAINT `fk_account_item_mapping_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`),
  CONSTRAINT `fk_account_item_mapping` FOREIGN KEY (`itemid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_account_item_mapping_acctid` FOREIGN KEY (`acctid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_maingroup`
--

DROP TABLE IF EXISTS `account_maingroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_maingroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `reporttype` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af`
--

DROP TABLE IF EXISTS `af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `usetype` varchar(50) DEFAULT NULL,
  `serieslength` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `denomination` decimal(10,0) DEFAULT NULL,
  `formtype` varchar(50) DEFAULT NULL,
  `baseunit` varchar(10) DEFAULT NULL,
  `defaultunit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_allocation`
--

DROP TABLE IF EXISTS `af_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_allocation` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_control`
--

DROP TABLE IF EXISTS `af_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control` (
  `objid` varchar(50) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `txnmode` varchar(10) DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(50) DEFAULT NULL,
  `startseries` int(11) NOT NULL,
  `currentseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_title` varchar(200) DEFAULT NULL,
  `stubno` int(11) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `prefix` varchar(10) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '',
  `dtfiled` date DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `unit` varchar(25) NOT NULL,
  `batchno` int(11) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  `currentindexno` int(11) DEFAULT NULL,
  `currentdetailid` varchar(150) DEFAULT NULL,
  `batchref` varchar(50) DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  `allocid` varchar(50) DEFAULT NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `salecost` decimal(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_primary` (`afid`,`startseries`,`prefix`,`suffix`,`ukey`),
  KEY `ix_afid` (`afid`),
  KEY `ix_allocid` (`allocid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_batchno` (`batchno`),
  KEY `ix_currentdetailid` (`currentdetailid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_prefix` (`prefix`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_suffix` (`suffix`),
  KEY `ix_ukey` (`ukey`),
  CONSTRAINT `fk_af_control_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_af_control_afid` FOREIGN KEY (`afid`) REFERENCES `af` (`objid`),
  CONSTRAINT `fk_af_control_allocid` FOREIGN KEY (`allocid`) REFERENCES `af_allocation` (`objid`),
  CONSTRAINT `fk_af_control_currentdetailid` FOREIGN KEY (`currentdetailid`) REFERENCES `af_control_detail` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_control_detail`
--

DROP TABLE IF EXISTS `af_control_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control_detail` (
  `objid` varchar(150) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `controlid` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `aftxnitemid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) NOT NULL,
  `reftype` varchar(32) NOT NULL,
  `refdate` datetime NOT NULL,
  `txndate` datetime NOT NULL,
  `txntype` varchar(50) NOT NULL,
  `receivedstartseries` int(11) DEFAULT NULL,
  `receivedendseries` int(11) DEFAULT NULL,
  `beginstartseries` int(11) DEFAULT NULL,
  `beginendseries` int(11) DEFAULT NULL,
  `issuedstartseries` int(11) DEFAULT NULL,
  `issuedendseries` int(11) DEFAULT NULL,
  `endingstartseries` int(11) DEFAULT NULL,
  `endingendseries` int(11) DEFAULT NULL,
  `qtyreceived` int(11) NOT NULL,
  `qtybegin` int(11) NOT NULL,
  `qtyissued` int(11) NOT NULL,
  `qtyending` int(11) NOT NULL,
  `qtycancelled` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issuedto_objid` varchar(50) DEFAULT NULL,
  `issuedto_name` varchar(255) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(255) DEFAULT NULL,
  `prevdetailid` varchar(150) DEFAULT NULL,
  `aftxnid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_aftxnid` (`aftxnid`),
  KEY `ix_aftxnitemid` (`aftxnitemid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_issuedto_name` (`issuedto_name`),
  KEY `ix_issuedto_objid` (`issuedto_objid`),
  KEY `ix_prevdetailid` (`prevdetailid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refitemid` (`aftxnitemid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txntype` (`txntype`),
  CONSTRAINT `fk_af_control_detail_controlid` FOREIGN KEY (`controlid`) REFERENCES `af_control` (`objid`),
  CONSTRAINT `fk_af_control_detail_aftxnid` FOREIGN KEY (`aftxnid`) REFERENCES `aftxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afrequest`
--

DROP TABLE IF EXISTS `afrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequest` (
  `objid` varchar(50) NOT NULL,
  `reqno` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `reqtype` varchar(10) DEFAULT NULL,
  `itemclass` varchar(50) DEFAULT NULL,
  `requester_objid` varchar(50) DEFAULT NULL,
  `requester_name` varchar(50) DEFAULT NULL,
  `requester_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `dtapproved` datetime DEFAULT NULL,
  `approvedby_objid` varchar(50) DEFAULT NULL,
  `approvedby_name` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_reqno` (`reqno`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_requester_name` (`requester_name`),
  KEY `ix_requester_objid` (`requester_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afrequestitem`
--

DROP TABLE IF EXISTS `afrequestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequestitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `qtyreceived` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_afrequestitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `afrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxn`
--

DROP TABLE IF EXISTS `aftxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn` (
  `objid` varchar(100) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `request_objid` varchar(50) DEFAULT NULL,
  `request_reqno` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `issueto_objid` varchar(50) DEFAULT NULL,
  `issueto_name` varchar(100) DEFAULT NULL,
  `issueto_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `txndate` datetime NOT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `issuefrom_objid` varchar(50) DEFAULT NULL,
  `issuefrom_name` varchar(150) DEFAULT NULL,
  `issuefrom_title` varchar(150) DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_issueno` (`controlno`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_issuefrom_name` (`issuefrom_name`),
  KEY `ix_issuefrom_objid` (`issuefrom_objid`),
  KEY `ix_issueto_objid` (`issueto_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_request_objid` (`request_objid`),
  KEY `ix_request_reqno` (`request_reqno`),
  KEY `ix_user_objid` (`user_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxn_type`
--

DROP TABLE IF EXISTS `aftxn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn_type` (
  `txntype` varchar(50) NOT NULL,
  `formtype` varchar(50) DEFAULT NULL,
  `poststate` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`txntype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxnitem`
--

DROP TABLE IF EXISTS `aftxnitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxnitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(100) NOT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `qtyserved` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_aftxnitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `aftxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afunit`
--

DROP TABLE IF EXISTS `afunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afunit` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `saleprice` decimal(16,2) NOT NULL,
  `interval` int(11) DEFAULT '1',
  `cashreceiptprintout` varchar(255) DEFAULT NULL,
  `cashreceiptdetailprintout` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_itemid_unit` (`itemid`,`unit`),
  KEY `ix_itemid` (`itemid`),
  CONSTRAINT `fk_afunit_itemid` FOREIGN KEY (`itemid`) REFERENCES `af` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmentnotice`
--

DROP TABLE IF EXISTS `assessmentnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentnotice` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(15) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` varchar(800) NOT NULL,
  `taxpayeraddress` varchar(150) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdbyname` varchar(100) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `approvedbyid` varchar(50) DEFAULT NULL,
  `approvedbyname` varchar(100) DEFAULT NULL,
  `approvedbytitle` varchar(50) DEFAULT NULL,
  `dtdelivered` date DEFAULT NULL,
  `receivedby` varchar(150) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `assessmentyear` int(11) DEFAULT NULL,
  `administrator_name` varchar(150) DEFAULT NULL,
  `administrator_address` varchar(150) DEFAULT NULL,
  `deliverytype_objid` varchar(50) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_txnno_assessmentnotice` (`txnno`),
  KEY `ix_assessmentnotice_receivedby` (`receivedby`),
  KEY `ix_assessmentnotice_state` (`state`),
  KEY `ix_assessmentnotice_taxpayerid` (`taxpayerid`),
  KEY `ix_assessmentnotice_taxpayername` (`taxpayername`(255)),
  KEY `ix_assessmentnotice_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmentnotice_online`
--

DROP TABLE IF EXISTS `assessmentnotice_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentnotice_online` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `reftype` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `orno` varchar(25) DEFAULT NULL,
  `ordate` date DEFAULT NULL,
  `oramount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_orno` (`orno`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_assessmentnotice_online_assessmentnotice` FOREIGN KEY (`objid`) REFERENCES `assessmentnotice` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmentnoticeitem`
--

DROP TABLE IF EXISTS `assessmentnoticeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentnoticeitem` (
  `objid` varchar(50) NOT NULL,
  `assessmentnoticeid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_assessmentnoticeitem_assessmentnotice` (`assessmentnoticeid`),
  KEY `FK_assessmentnoticeitem_faas` (`faasid`),
  CONSTRAINT `FK_assessmentnoticeitem_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_assessmentnoticeitem_assessmentnotice` FOREIGN KEY (`assessmentnoticeid`) REFERENCES `assessmentnotice` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `deposittype` varchar(50) DEFAULT NULL,
  `depository` int(11) DEFAULT NULL,
  `depositsliphandler` varchar(50) DEFAULT NULL,
  `cashreport` varchar(255) DEFAULT NULL,
  `checkreport` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bank_code_branch` (`code`,`branchname`),
  UNIQUE KEY `ux_bank_name_branch` (`name`,`branchname`),
  KEY `ix_bank_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accttype` varchar(50) NOT NULL,
  `bank_objid` varchar(50) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_code` varchar(50) NOT NULL,
  `fund_title` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `cashreport` varchar(50) DEFAULT NULL,
  `cashbreakdownreport` varchar(50) DEFAULT NULL,
  `checkreport` varchar(50) DEFAULT NULL,
  `forwardbalance` decimal(16,2) DEFAULT NULL,
  `beginbalance` decimal(16,2) DEFAULT NULL,
  `totaldr` decimal(16,2) DEFAULT NULL,
  `totalcr` decimal(16,2) DEFAULT NULL,
  `endbalance` decimal(16,2) DEFAULT NULL,
  `currentlineno` int(11) DEFAULT NULL,
  `checkbreakdownreport` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_bank_objid` (`bank_objid`),
  KEY `ix_code` (`code`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_bankaccount_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_bankaccount_bank_objid` FOREIGN KEY (`bank_objid`) REFERENCES `bank` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankaccount_ledger`
--

DROP TABLE IF EXISTS `bankaccount_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NOT NULL,
  `bankacctid` varchar(50) NOT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_bankaccount_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`),
  CONSTRAINT `fk_bankaccount_ledger_bankacctid` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`),
  CONSTRAINT `fk_bankaccount_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangay` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `captain_name` varchar(100) DEFAULT NULL,
  `captain_title` varchar(50) DEFAULT NULL,
  `captain_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `oldindexno` varchar(15) DEFAULT NULL,
  `oldpin` varchar(15) DEFAULT NULL,
  `fullname` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_barangay_objid` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcode_launcher`
--

DROP TABLE IF EXISTS `barcode_launcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcode_launcher` (
  `objid` varchar(50) NOT NULL,
  `connection` varchar(50) DEFAULT NULL,
  `paymentorder` int(11) NOT NULL DEFAULT '0',
  `collectiontypeid` varchar(50) DEFAULT NULL,
  `state` varchar(10) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_rpttaxcredit`
--

DROP TABLE IF EXISTS `batch_rpttaxcredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_rpttaxcredit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txndate` date NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `paymentfrom` date DEFAULT NULL,
  `paymentto` varchar(255) DEFAULT NULL,
  `creditedyear` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `validity` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_rpttaxcredit_ledger`
--

DROP TABLE IF EXISTS `batch_rpttaxcredit_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_rpttaxcredit_ledger` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `error` varchar(255) DEFAULT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_rpttaxcredit_rptledger_rptledger` FOREIGN KEY (`objid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rpttaxcredit_rptledger_parent` FOREIGN KEY (`parentid`) REFERENCES `batch_rpttaxcredit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_rpttaxcredit_ledger_posted`
--

DROP TABLE IF EXISTS `batch_rpttaxcredit_ledger_posted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_rpttaxcredit_ledger_posted` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_rpttaxcredit_rptledger_posted_rptledger` FOREIGN KEY (`objid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rpttaxcredit_rptledger_posted_parent` FOREIGN KEY (`parentid`) REFERENCES `batch_rpttaxcredit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection`
--

DROP TABLE IF EXISTS `batchcapture_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(20) NOT NULL,
  `txndate` datetime NOT NULL,
  `defaultreceiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `stub` int(11) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `formtype` varchar(10) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `serieslength` int(11) NOT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `startseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `totalamount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `collector_objid` varchar(50) DEFAULT NULL,
  `collector_name` varchar(100) DEFAULT NULL,
  `collector_title` varchar(50) DEFAULT NULL,
  `capturedby_objid` varchar(50) DEFAULT NULL,
  `capturedby_name` varchar(100) DEFAULT NULL,
  `capturedby_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(100) DEFAULT NULL,
  `postedby_date` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchcapture_collection_capturedbyname` (`capturedby_name`),
  KEY `ix_batchcapture_collection_collectorname` (`collector_name`),
  KEY `ix_batchcapture_collection_txndate` (`txndate`),
  KEY `ix_capturedby_name` (`capturedby_name`),
  KEY `ix_capturedby_objid` (`capturedby_objid`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_defaultreceiptdate` (`defaultreceiptdate`),
  KEY `ix_formno` (`formno`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection_entry`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `paidby` varchar(100) NOT NULL,
  `paidbyaddress` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `series` int(11) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `particulars` longtext,
  `voided` int(11) DEFAULT NULL,
  `paymentitems` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_batchcapture_collection_entry_parentid` (`parentid`),
  KEY `ix_batchcapture_collection_entry_receiptdate` (`receiptdate`),
  KEY `ix_batchcapture_collection_entry_receiptno` (`receiptno`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_receiptno` (`receiptno`),
  CONSTRAINT `fk_batchcapture_collection_entry_collectiontype_objid` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection_entry_item`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry_item` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(50) DEFAULT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchcapture_collection_entry_item_item_code` (`item_code`),
  KEY `ix_batchcapture_collection_entry_item_parentid` (`parentid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_batchcapture_collection_entry_item_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr`
--

DROP TABLE IF EXISTS `batchgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `ry` int(11) NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) NOT NULL,
  `rputype` varchar(15) DEFAULT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `memoranda` varchar(100) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `effectivityyear` int(11) DEFAULT NULL,
  `effectivityqtr` int(11) DEFAULT NULL,
  `originlgu_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_lgu_objid` (`lgu_objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_classificationid` (`classification_objid`),
  KEY `ix_ry` (`ry`),
  KEY `ix_section` (`section`),
  KEY `ix_state` (`state`),
  KEY `ix_txnno` (`txnno`),
  CONSTRAINT `batchgr_ibfk_6` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `batchgr_ibfk_1` FOREIGN KEY (`barangay_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `batchgr_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `batchgr_ibfk_3` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `batchgr_ibfk_4` FOREIGN KEY (`barangay_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `batchgr_ibfk_5` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_item`
--

DROP TABLE IF EXISTS `batchgr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `tdno` varchar(50) NOT NULL,
  `fullpin` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `suffix` int(11) NOT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  `error` text,
  `subsuffix` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_batchgr_item_batchgr` (`parent_objid`),
  KEY `fk_batchgr_item_newfaasid` (`newfaasid`),
  KEY `fk_batchgr_item_pin` (`pin`),
  KEY `fk_batchgr_item_tdno` (`tdno`),
  CONSTRAINT `batchgr_item_ibfk_5` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `batchgr_item_ibfk_1` FOREIGN KEY (`parent_objid`) REFERENCES `batchgr` (`objid`),
  CONSTRAINT `batchgr_item_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `batchgr_item_ibfk_3` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `batchgr_item_ibfk_4` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_task`
--

DROP TABLE IF EXISTS `batchgr_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `batchgr_task_ibfk_1` FOREIGN KEY (`refid`) REFERENCES `batchgr` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billingstatement`
--

DROP TABLE IF EXISTS `billingstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingstatement` (
  `Area` int(11) DEFAULT NULL,
  `BillingNo` int(11) DEFAULT NULL,
  `BillingDate` varchar(20) DEFAULT NULL,
  `ConsumerID` varchar(100) DEFAULT NULL,
  `Names1` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `Barangay` varchar(100) DEFAULT NULL,
  `ConsumerType` varchar(100) DEFAULT NULL,
  `PresentReading` int(11) DEFAULT '0',
  `PreviousReading` int(11) DEFAULT '0',
  `Consumed` int(11) DEFAULT '0',
  `CurrentBill` double DEFAULT '0',
  `CBU` double DEFAULT '0',
  `Surcharge` double DEFAULT '0',
  `Adjust` double DEFAULT NULL,
  `Others` double DEFAULT '0',
  `TotalAmount` double DEFAULT '0',
  `ReadBy` varchar(100) DEFAULT NULL,
  `Remarks` varchar(50) DEFAULT NULL,
  `Tendered` int(11) DEFAULT '0',
  `Cost` double DEFAULT '0',
  `PaymentDate` varchar(15) DEFAULT NULL,
  `MFee` smallint(6) DEFAULT NULL,
  `IFee` smallint(6) DEFAULT '0',
  `TFee` smallint(6) DEFAULT NULL,
  `InstFee` smallint(6) DEFAULT '0',
  `ORS2` varchar(50) DEFAULT '0',
  `MMFee` smallint(6) DEFAULT '0',
  `bd` int(11) DEFAULT NULL,
  `bd2` varchar(200) DEFAULT NULL,
  `SCTIN` varchar(50) DEFAULT NULL,
  `PWDIDNO` varchar(50) DEFAULT NULL,
  `LESS_SC` double DEFAULT '0',
  `WITHOLDING` double DEFAULT NULL,
  `PAYMENTDUE` double DEFAULT '0',
  `TOTALDUE` double DEFAULT '0',
  `del1` varchar(255) DEFAULT NULL,
  `scstats` int(11) DEFAULT '0',
  `cbustats` int(11) DEFAULT '0',
  `consumption2018` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billitem_txntype`
--

DROP TABLE IF EXISTS `billitem_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_category` (`category`),
  KEY `ix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgadditionalitem`
--

DROP TABLE IF EXISTS `bldgadditionalitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgadditionalitem` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `addareatobldgtotalarea` int(11) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgadditionalitem_settingcode` (`bldgrysettingid`,`code`),
  UNIQUE KEY `ux_bldgadditionalitem_settingname` (`bldgrysettingid`,`name`),
  KEY `FK_bldgadditionalitem` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgadditionalitem_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgadditionalitem` FOREIGN KEY (`previd`) REFERENCES `bldgadditionalitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgassesslevel`
--

DROP TABLE IF EXISTS `bldgassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgassesslevel` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgassesslevel_bdlgrysettingid_name` (`bldgrysettingid`,`name`),
  UNIQUE KEY `ux_bldgassesslevel_bldgrysettingid_code` (`bldgrysettingid`,`code`),
  KEY `FK_bldgassesslevel_bldgrysettingid` (`bldgrysettingid`),
  KEY `FK_bldgassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_bldgassesslevel_bldgrysettingid` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgassesslevelrange`
--

DROP TABLE IF EXISTS `bldgassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `bldgassesslevelid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgassesslevelid_mvfrom` (`bldgassesslevelid`,`mvfrom`),
  KEY `FK_bldgassesslevelrange_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `FK_bldgassesslevelrange_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgassesslevelrange_bldgassesslevel` FOREIGN KEY (`bldgassesslevelid`) REFERENCES `bldgassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgfloor`
--

DROP TABLE IF EXISTS `bldgfloor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgfloor` (
  `objid` varchar(50) NOT NULL,
  `bldguseid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `floorno` varchar(5) NOT NULL,
  `area` decimal(10,0) NOT NULL,
  `storeyrate` decimal(10,0) NOT NULL,
  `basevalue` decimal(10,0) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `adjustment` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgfloor_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgfloor_bldguse` (`bldguseid`),
  CONSTRAINT `FK_bldgfloor_bldguse` FOREIGN KEY (`bldguseid`) REFERENCES `bldguse` (`objid`),
  CONSTRAINT `FK_bldgfloor_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgflooradditional`
--

DROP TABLE IF EXISTS `bldgflooradditional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgflooradditional` (
  `objid` varchar(50) NOT NULL,
  `bldgfloorid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `additionalitem_objid` varchar(50) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `expr` varchar(300) NOT NULL,
  `depreciate` int(11) DEFAULT NULL,
  `issystem` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgflooradditional_additionalitem` (`additionalitem_objid`),
  KEY `FK_bldgflooradditional_bldgfloor` (`bldgfloorid`),
  KEY `FK_bldgflooradditional_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `FK_bldgflooradditional_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgflooradditional_additionalitem` FOREIGN KEY (`additionalitem_objid`) REFERENCES `bldgadditionalitem` (`objid`),
  CONSTRAINT `FK_bldgflooradditional_bldgfloor` FOREIGN KEY (`bldgfloorid`) REFERENCES `bldgfloor` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgflooradditionalparam`
--

DROP TABLE IF EXISTS `bldgflooradditionalparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgflooradditionalparam` (
  `objid` varchar(50) NOT NULL,
  `bldgflooradditionalid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `decimalvalue` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgflooradditionalparam_bldgflooradditional` (`bldgflooradditionalid`),
  KEY `FK_bldgflooradditionalparam_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgflooradditionalparam_param` (`param_objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_param` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_bldgflooradditional` FOREIGN KEY (`bldgflooradditionalid`) REFERENCES `bldgflooradditional` (`objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgkind`
--

DROP TABLE IF EXISTS `bldgkind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgkind` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgkind_code` (`code`),
  UNIQUE KEY `ux_bldgkind_name` (`name`),
  KEY `ix_bldgkind_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgkindbucc`
--

DROP TABLE IF EXISTS `bldgkindbucc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgkindbucc` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgkind_objid` varchar(50) NOT NULL,
  `basevaluetype` varchar(25) NOT NULL,
  `basevalue` decimal(10,0) NOT NULL,
  `minbasevalue` decimal(10,0) NOT NULL,
  `maxbasevalue` decimal(10,0) NOT NULL,
  `gapvalue` int(11) NOT NULL,
  `minarea` decimal(10,0) NOT NULL,
  `maxarea` decimal(10,0) NOT NULL,
  `bldgclass` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgkindbucc_settingtypekind` (`bldgrysettingid`,`bldgtypeid`,`bldgkind_objid`,`bldgclass`),
  KEY `FK_bldgkindbucc_bldgkind` (`bldgkind_objid`),
  KEY `FK_bldgkindbucc_bldgkindbucc` (`previd`),
  KEY `FK_bldgkindbucc_bldgtype` (`bldgtypeid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgkindbucc_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgkindbucc_bldgkind` FOREIGN KEY (`bldgkind_objid`) REFERENCES `bldgkind` (`objid`),
  CONSTRAINT `FK_bldgkindbucc_bldgrysettingid` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu`
--

DROP TABLE IF EXISTS `bldgrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) DEFAULT NULL,
  `houseno` varchar(25) DEFAULT NULL,
  `psic` varchar(20) DEFAULT NULL,
  `permitno` varchar(20) DEFAULT NULL,
  `permitdate` datetime DEFAULT NULL,
  `permitissuedby` varchar(50) DEFAULT NULL,
  `bldgtype_objid` varchar(50) DEFAULT NULL,
  `bldgkindbucc_objid` varchar(50) DEFAULT NULL,
  `basevalue` decimal(10,0) NOT NULL,
  `dtcompleted` datetime DEFAULT NULL,
  `dtoccupied` datetime DEFAULT NULL,
  `floorcount` int(11) NOT NULL,
  `depreciation` decimal(10,0) NOT NULL,
  `depreciationvalue` decimal(10,0) NOT NULL,
  `totaladjustment` decimal(10,0) NOT NULL,
  `additionalinfo` varchar(500) DEFAULT NULL,
  `bldgage` int(11) NOT NULL,
  `percentcompleted` int(11) NOT NULL,
  `bldgassesslevel_objid` varchar(50) DEFAULT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `condominium` int(11) NOT NULL,
  `bldgclass` varchar(15) DEFAULT NULL,
  `predominant` int(11) DEFAULT NULL,
  `effectiveage` int(11) DEFAULT NULL,
  `condocerttitle` varchar(50) DEFAULT NULL,
  `dtcertcompletion` date DEFAULT NULL,
  `dtcertoccupancy` date DEFAULT NULL,
  `cdurating` varchar(15) DEFAULT NULL,
  `dtconstructed` date DEFAULT NULL,
  `occpermitno` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgrpu_bldgassesslevel` (`bldgassesslevel_objid`),
  KEY `FK_bldgrpu_bldgkindbucc` (`bldgkindbucc_objid`),
  KEY `FK_bldgrpu_bldgtype` (`bldgtype_objid`),
  KEY `FK_bldgrpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_bldgrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_bldgrpu_bldgassesslevel` FOREIGN KEY (`bldgassesslevel_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `FK_bldgrpu_bldgkindbucc` FOREIGN KEY (`bldgkindbucc_objid`) REFERENCES `bldgkindbucc` (`objid`),
  CONSTRAINT `FK_bldgrpu_bldgtype` FOREIGN KEY (`bldgtype_objid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgrpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_assessment`
--

DROP TABLE IF EXISTS `bldgrpu_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_assessment` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrpuassessment_actualuseid` (`actualuse_objid`),
  KEY `ix_bldgrpuassessment_bldgrpuid` (`bldgrpuid`),
  CONSTRAINT `FK_bldgrpuassessment_rpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgrpuassessment_bldgassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `bldgassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_land`
--

DROP TABLE IF EXISTS `bldgrpu_land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_land` (
  `objid` varchar(50) NOT NULL,
  `rpu_objid` varchar(50) NOT NULL,
  `landfaas_objid` varchar(50) NOT NULL,
  `landrpumaster_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrpu_land_bldgrpuid` (`rpu_objid`),
  KEY `ix_bldgrpu_land_landfaasid` (`landfaas_objid`),
  KEY `ix_bldgrpu_land_landrpumasterid` (`landrpumaster_objid`),
  CONSTRAINT `fk_bldgrpu_land_rpumaster` FOREIGN KEY (`landrpumaster_objid`) REFERENCES `rpumaster` (`objid`),
  CONSTRAINT `fk_bldgrpu_land_bldgrpu` FOREIGN KEY (`rpu_objid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `fk_bldgrpu_land_landfaas` FOREIGN KEY (`landfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_structuraltype`
--

DROP TABLE IF EXISTS `bldgrpu_structuraltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_structuraltype` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `bldgtype_objid` varchar(50) DEFAULT NULL,
  `bldgkindbucc_objid` varchar(50) DEFAULT NULL,
  `floorcount` int(11) NOT NULL,
  `basefloorarea` decimal(16,2) NOT NULL,
  `totalfloorarea` decimal(16,2) NOT NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `unitvalue` decimal(16,2) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgrpu_structuraltype` (`classification_objid`),
  KEY `FK_bldgrpu_structuraltype_bldgkindbucc` (`bldgkindbucc_objid`),
  KEY `FK_bldgrpu_structuraltype_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgrpu_structuraltype_bldgtype` (`bldgtype_objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgtype` FOREIGN KEY (`bldgtype_objid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgkindbucc` FOREIGN KEY (`bldgkindbucc_objid`) REFERENCES `bldgkindbucc` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrysetting`
--

DROP TABLE IF EXISTS `bldgrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `predominant` int(11) DEFAULT NULL,
  `depreciatecoreanditemseparately` int(11) DEFAULT NULL,
  `computedepreciationbasedonschedule` int(11) DEFAULT NULL,
  `straightdepreciation` int(11) DEFAULT NULL,
  `calcbldgagebasedondtoccupied` int(11) DEFAULT NULL,
  `appliedto` longtext,
  `previd` varchar(50) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `ordinanceno` varchar(25) DEFAULT NULL,
  `ordinancedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrysetting_previd` (`previd`),
  KEY `ix_bldgrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgstructure`
--

DROP TABLE IF EXISTS `bldgstructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgstructure` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgstructure_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgstructure_material` (`material_objid`),
  KEY `FK_bldgstructure_structure` (`structure_objid`),
  CONSTRAINT `FK_bldgstructure_structure` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`),
  CONSTRAINT `FK_bldgstructure_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgstructure_material` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype`
--

DROP TABLE IF EXISTS `bldgtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `basevaluetype` varchar(10) NOT NULL,
  `residualrate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `usecdu` int(11) DEFAULT NULL,
  `storeyadjtype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_bldgrysettingid_code` (`bldgrysettingid`,`code`),
  UNIQUE KEY `ux_bldgtype_bldgrysettingid_name` (`bldgrysettingid`,`name`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgtype_bldgtype` FOREIGN KEY (`previd`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgtype_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype_depreciation`
--

DROP TABLE IF EXISTS `bldgtype_depreciation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype_depreciation` (
  `objid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `agefrom` int(11) NOT NULL,
  `ageto` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `excellent` decimal(16,2) DEFAULT NULL,
  `verygood` decimal(16,2) DEFAULT NULL,
  `good` decimal(16,2) DEFAULT NULL,
  `average` decimal(16,2) DEFAULT NULL,
  `fair` decimal(16,2) DEFAULT NULL,
  `poor` decimal(16,2) DEFAULT NULL,
  `verypoor` decimal(16,2) DEFAULT NULL,
  `unsound` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_depreciation_settingtypeagefrom` (`bldgtypeid`,`bldgrysettingid`,`agefrom`),
  KEY `FK_bldgtype_depreciation_bldgrysetting` (`bldgrysettingid`),
  KEY `ix_bldgtypeid` (`bldgtypeid`),
  CONSTRAINT `FK_bldgtype_depreciation_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgtype_depreciation_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype_storeyadjustment`
--

DROP TABLE IF EXISTS `bldgtype_storeyadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype_storeyadjustment` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `floorno` int(11) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_storeyadjustment` (`bldgtypeid`,`floorno`,`rate`),
  KEY `bldgtypeid` (`bldgtypeid`),
  KEY `FK_bldgtype_storeyadjustment` (`previd`),
  KEY `FK_bldgtype_storeyadjustment_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_3` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_1` FOREIGN KEY (`previd`) REFERENCES `bldgtype_storeyadjustment` (`objid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_2` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype_storeyadjustment_bldgkind`
--

DROP TABLE IF EXISTS `bldgtype_storeyadjustment_bldgkind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype_storeyadjustment_bldgkind` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `floorno` int(11) NOT NULL,
  `bldgkindid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_kind_floorno` (`bldgtypeid`,`bldgkindid`,`floorno`),
  KEY `fk_storeyadjustment_bldgkind_bldgrysetting` (`bldgrysettingid`),
  KEY `fk_storeyadjustment_bldgkind_parent` (`parentid`),
  CONSTRAINT `fk_storeyadjustment_bldgkind_parent` FOREIGN KEY (`parentid`) REFERENCES `bldgtype_storeyadjustment` (`objid`),
  CONSTRAINT `fk_storeyadjustment_bldgkind_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `fk_storeyadjustment_bldgkind_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldguse`
--

DROP TABLE IF EXISTS `bldguse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldguse` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `basevalue` decimal(10,0) NOT NULL,
  `area` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `depreciationvalue` decimal(10,0) NOT NULL,
  `adjustment` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) DEFAULT NULL,
  `assessedvalue` decimal(10,0) DEFAULT NULL,
  `structuraltype_objid` varchar(50) DEFAULT NULL,
  `addlinfo` varchar(255) DEFAULT NULL,
  `adjfordepreciation` decimal(16,2) DEFAULT NULL,
  `taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldguse_bldgassesslevel` (`actualuse_objid`),
  KEY `FK_bldguse_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `FK_bldguse_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldguse_bldgassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `bldgassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blkmarket`
--

DROP TABLE IF EXISTS `blkmarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blkmarket` (
  `blkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `blkowner` varchar(100) DEFAULT NULL,
  `blkrate` int(11) DEFAULT NULL,
  PRIMARY KEY (`blkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bpexpirydate`
--

DROP TABLE IF EXISTS `bpexpirydate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpexpirydate` (
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `expirydate` date DEFAULT NULL,
  `reason` text,
  PRIMARY KEY (`qtr`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgy_taxaccount_mapping`
--

DROP TABLE IF EXISTS `brgy_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgy_taxaccount_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshare`
--

DROP TABLE IF EXISTS `brgyshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(15) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `totalshare` decimal(10,0) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `postedbyid` varchar(50) DEFAULT NULL,
  `postedby` varchar(150) DEFAULT NULL,
  `postedbytitle` varchar(50) DEFAULT NULL,
  `sharetype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_state` (`state`),
  KEY `ix_brgyshare_yq` (`year`),
  KEY `ix_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_yr` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshare_account_mapping`
--

DROP TABLE IF EXISTS `brgyshare_account_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare_account_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `acct_objid` varchar(50) NOT NULL,
  `penaltyacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshareitem`
--

DROP TABLE IF EXISTS `brgyshareitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshareitem` (
  `objid` varchar(50) NOT NULL,
  `brgyshareid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `basic` decimal(10,0) NOT NULL,
  `basicint` decimal(10,0) NOT NULL,
  `basicdisc` decimal(10,0) NOT NULL,
  `basicshare` decimal(10,0) NOT NULL,
  `basicintshare` decimal(10,0) NOT NULL,
  `commonshare` decimal(10,0) DEFAULT NULL,
  `basiccurrent` decimal(10,0) DEFAULT NULL,
  `basicprevious` decimal(10,0) DEFAULT NULL,
  `basiccollection` decimal(10,0) DEFAULT NULL,
  `basicintcollection` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_brgyshareitem_brgyshare_brgy` (`brgyshareid`,`barangayid`),
  CONSTRAINT `FK_brgyshareitem_brgyshare` FOREIGN KEY (`brgyshareid`) REFERENCES `brgyshare` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_objid` varchar(50) NOT NULL,
  `owner_address_text` varchar(255) DEFAULT NULL,
  `owner_address_objid` varchar(50) DEFAULT NULL,
  `businessname` varchar(255) DEFAULT NULL,
  `tradename` varchar(255) NOT NULL,
  `address_text` varchar(255) DEFAULT NULL,
  `address_objid` varchar(50) DEFAULT NULL,
  `orgtype` varchar(50) DEFAULT NULL,
  `yearstarted` int(11) DEFAULT NULL,
  `activeyear` int(11) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `taxcredit` decimal(18,2) DEFAULT NULL,
  `currentapplicationid` varchar(50) DEFAULT NULL,
  `currentpermitid` varchar(50) DEFAULT NULL,
  `bin` varchar(50) DEFAULT NULL,
  `activeqtr` int(11) DEFAULT NULL,
  `appcount` int(11) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `oldbin` varchar(50) DEFAULT NULL,
  `permit_objid` varchar(50) DEFAULT NULL,
  `permittype` varchar(50) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `officetype` varchar(25) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `nextrenewaldate` date DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_bin` (`bin`),
  UNIQUE KEY `uix_businessname` (`businessname`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_address_objid` (`address_objid`),
  KEY `ix_bin` (`bin`),
  KEY `ix_currentapplicationid` (`currentapplicationid`),
  KEY `ix_currentpermitid` (`currentpermitid`),
  KEY `ix_owner_address_objid` (`owner_address_objid`),
  KEY `ix_owner_name` (`owner_name`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_tradename` (`tradename`),
  KEY `ix_yearstarted` (`yearstarted`),
  CONSTRAINT `FK_business_business_application` FOREIGN KEY (`currentapplicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `FK_business_business_address` FOREIGN KEY (`address_objid`) REFERENCES `business_address` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_active_info`
--

DROP TABLE IF EXISTS `business_active_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_active_info` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `attribute_objid` varchar(50) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `lob_objid` varchar(50) DEFAULT NULL,
  `lob_name` varchar(100) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `boolvalue` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_attribute_name` (`attribute_name`),
  KEY `ix_attribute_objid` (`attribute_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lob_name` (`lob_name`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `FK_business_active_info_lob` FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `FK_business_active_info_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_active_lob`
--

DROP TABLE IF EXISTS `business_active_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_active_lob` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `FK_business_active_lob_lob` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `FK_business_active_lob_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_active_lob_history`
--

DROP TABLE IF EXISTS `business_active_lob_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_active_lob_history` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `activeyear` int(11) DEFAULT NULL,
  `lobid` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `fk_business_active_lob_history_lobid` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `fk_business_active_lob_history_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_active_lob_history_forprocess`
--

DROP TABLE IF EXISTS `business_active_lob_history_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_active_lob_history_forprocess` (
  `businessid` varchar(50) NOT NULL,
  PRIMARY KEY (`businessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_address`
--

DROP TABLE IF EXISTS `business_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_address` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `addresstype` varchar(50) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `municipality` varchar(50) DEFAULT NULL,
  `bldgno` varchar(50) DEFAULT NULL,
  `bldgname` varchar(50) DEFAULT NULL,
  `unitno` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `monthlyrent` decimal(18,2) DEFAULT NULL,
  `lessor_objid` varchar(50) DEFAULT NULL,
  `lessor_name` varchar(255) DEFAULT NULL,
  `lessor_address_text` varchar(255) DEFAULT NULL,
  `rentedaddressid` varchar(50) DEFAULT NULL,
  `ownedaddressid` varchar(50) DEFAULT NULL,
  `lessor_address_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lessor_address_objid` (`lessor_address_objid`),
  KEY `ix_lessor_objid` (`lessor_objid`),
  KEY `ix_ownedaddressid` (`ownedaddressid`),
  KEY `ix_rentedaddressid` (`rentedaddressid`),
  CONSTRAINT `FK_business_address_rentedaddressid` FOREIGN KEY (`rentedaddressid`) REFERENCES `business_lessor` (`objid`),
  CONSTRAINT `FK_business_address_ownerid` FOREIGN KEY (`ownedaddressid`) REFERENCES `business_lessor` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application`
--

DROP TABLE IF EXISTS `business_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application` (
  `objid` varchar(50) NOT NULL,
  `business_objid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `apptype` varchar(25) DEFAULT NULL,
  `dtfiled` date DEFAULT NULL,
  `ownername` varchar(255) DEFAULT NULL,
  `owneraddress` varchar(255) DEFAULT NULL,
  `tradename` varchar(255) DEFAULT NULL,
  `businessaddress` varchar(255) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `yearstarted` int(11) DEFAULT NULL,
  `appyear` int(11) DEFAULT NULL,
  `appqtr` int(11) DEFAULT NULL,
  `txnmode` varchar(25) DEFAULT NULL,
  `assessor_objid` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(255) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `approver_objid` varchar(50) DEFAULT NULL,
  `approver_name` varchar(255) DEFAULT NULL,
  `approver_title` varchar(50) DEFAULT NULL,
  `dtreleased` datetime DEFAULT NULL,
  `totals_tax` decimal(18,2) DEFAULT NULL,
  `totals_regfee` decimal(18,2) DEFAULT NULL,
  `totals_othercharge` decimal(18,2) DEFAULT NULL,
  `totals_total` decimal(18,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `permit_objid` varchar(50) DEFAULT NULL,
  `parentapplicationid` varchar(50) DEFAULT NULL,
  `nextbilldate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_appno` (`appno`),
  KEY `ix_approver_objid` (`approver_objid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_assessor_objid` (`assessor_objid`),
  KEY `ix_business_objid` (`business_objid`),
  KEY `ix_businessaddress` (`businessaddress`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_dtreleased` (`dtreleased`),
  KEY `ix_nextbilldate` (`nextbilldate`),
  KEY `ix_owneraddress` (`owneraddress`),
  KEY `ix_ownername` (`ownername`),
  KEY `ix_parentapplicationid` (`parentapplicationid`),
  KEY `ix_permit_objid` (`permit_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_tradename` (`tradename`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `FK_business_application_parent` FOREIGN KEY (`parentapplicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `FK_business_application_business` FOREIGN KEY (`business_objid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application_info`
--

DROP TABLE IF EXISTS `business_application_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application_info` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `activeyear` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `attribute_objid` varchar(50) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `lob_objid` varchar(50) DEFAULT NULL,
  `lob_name` varchar(100) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `boolvalue` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_attribute_objid` (`attribute_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `FK_business_info_business_lob` FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `FK_business_info_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_info_business_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application_lob`
--

DROP TABLE IF EXISTS `business_application_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application_lob` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `activeyear` int(11) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `assessmenttype` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lobid` (`lobid`),
  KEY `ix_name` (`name`),
  CONSTRAINT `fk_business_application_lob_lob` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `fk_business_application_lob_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_application_lob_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application_task`
--

DROP TABLE IF EXISTS `business_application_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application_task` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_startdate` (`startdate`),
  CONSTRAINT `fk_business_application_task_application` FOREIGN KEY (`refid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application_task_lock`
--

DROP TABLE IF EXISTS `business_application_task_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application_task_lock` (
  `refid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`refid`,`state`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `fk_business_application_task_lock_refid` FOREIGN KEY (`refid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_application_workitem`
--

DROP TABLE IF EXISTS `business_application_workitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_application_workitem` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `workitemid` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_taskid` (`taskid`),
  KEY `ix_workitemid` (`workitemid`),
  CONSTRAINT `fk_business_application_workitem_task` FOREIGN KEY (`taskid`) REFERENCES `business_application_task` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_billing`
--

DROP TABLE IF EXISTS `business_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_billing` (
  `objid` varchar(50) NOT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `billdate` datetime DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `appyear` int(11) DEFAULT NULL,
  `expirydate` datetime DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `surcharge` decimal(18,2) DEFAULT NULL,
  `interest` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_applicationid` (`applicationid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_billdate` (`billdate`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_expirydate` (`expirydate`),
  CONSTRAINT `FK_business_billing_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_billing_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_billing_item`
--

DROP TABLE IF EXISTS `business_billing_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_billing_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `receivableid` varchar(50) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_title` varchar(255) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `surcharge` decimal(18,2) DEFAULT NULL,
  `interest` decimal(18,2) DEFAULT NULL,
  `discount` decimal(18,2) DEFAULT NULL,
  `lob_objid` varchar(50) DEFAULT NULL,
  `lob_assessmenttype` varchar(50) DEFAULT NULL,
  `taxfeetype` varchar(50) DEFAULT NULL,
  `paypriority` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_duedate` (`duedate`),
  KEY `ix_lob_objid` (`lob_objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receivableid` (`receivableid`),
  CONSTRAINT `fk_business_billing_item_parent` FOREIGN KEY (`parentid`) REFERENCES `business_billing` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_billitem_txntype`
--

DROP TABLE IF EXISTS `business_billitem_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `feetype` varchar(50) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_change_log`
--

DROP TABLE IF EXISTS `business_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_change_log` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NOT NULL,
  `entryno` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(100) NOT NULL,
  `changetype` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `particulars` text,
  PRIMARY KEY (`objid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_entryno` (`entryno`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  CONSTRAINT `FK_business_change_log_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_change_log_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_closure`
--

DROP TABLE IF EXISTS `business_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_closure` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `dtceased` date NOT NULL,
  `dtissued` datetime NOT NULL,
  `remarks` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessid` (`businessid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtceased` (`dtceased`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_dtissued` (`dtissued`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_compromise`
--

DROP TABLE IF EXISTS `business_compromise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_compromise` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `dtexpiry` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `approver_objid` varchar(50) DEFAULT NULL,
  `approver_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_approver_objid` (`approver_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_txntype` (`txntype`),
  CONSTRAINT `fk_business_compromise_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_lessor`
--

DROP TABLE IF EXISTS `business_lessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_lessor` (
  `objid` varchar(50) NOT NULL,
  `government` int(11) DEFAULT NULL,
  `lessor_orgtype` varchar(50) DEFAULT NULL,
  `lessor_objid` varchar(50) DEFAULT NULL,
  `lessor_name` varchar(100) DEFAULT NULL,
  `lessor_address_text` varchar(255) DEFAULT NULL,
  `lessor_address_objid` varchar(50) DEFAULT NULL,
  `bldgno` varchar(50) DEFAULT NULL,
  `bldgname` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_bldgname` (`bldgname`),
  KEY `ix_bldgno` (`bldgno`),
  KEY `ix_lessor_address_objid` (`lessor_address_objid`),
  KEY `ix_lessor_objid` (`lessor_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_payment`
--

DROP TABLE IF EXISTS `business_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_payment` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `appyear` int(11) DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `taxcredit` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  CONSTRAINT `fk_business_payment_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_payment_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_payment_item`
--

DROP TABLE IF EXISTS `business_payment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `receivableid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_code` varchar(50) DEFAULT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `lob_objid` varchar(50) DEFAULT NULL,
  `lob_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `surcharge` decimal(16,2) DEFAULT NULL,
  `interest` decimal(16,2) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `partial` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_lob_objid` (`lob_objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receivableid` (`receivableid`),
  CONSTRAINT `fk_business_payment_item_parent` FOREIGN KEY (`parentid`) REFERENCES `business_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_permit`
--

DROP TABLE IF EXISTS `business_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_permit` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `permitno` varchar(20) DEFAULT NULL,
  `activeyear` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `permittype` varchar(20) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(255) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `plateno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessid_activeyear_version` (`businessid`,`activeyear`,`version`),
  UNIQUE KEY `uix_permitno` (`permitno`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_expirydate` (`expirydate`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_plateno` (`plateno`),
  CONSTRAINT `fk_business_permit_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_permit_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_permit_lob`
--

DROP TABLE IF EXISTS `business_permit_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_permit_lob` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `lobid` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lobid` (`lobid`),
  KEY `ix_name` (`name`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_business_permit_lob_parentid` FOREIGN KEY (`parentid`) REFERENCES `business_permit` (`objid`),
  CONSTRAINT `fk_business_permit_lob_lobid` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_permit_type`
--

DROP TABLE IF EXISTS `business_permit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_permit_type` (
  `objid` varchar(10) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `indexno` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_receivable`
--

DROP TABLE IF EXISTS `business_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_receivable` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `iyear` int(11) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `lob_objid` varchar(50) DEFAULT NULL,
  `lob_name` varchar(100) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `taxcredit` decimal(16,2) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `taxfeetype` varchar(50) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `surcharge` decimal(16,2) DEFAULT NULL,
  `interest` decimal(16,2) DEFAULT NULL,
  `assessmenttype` varchar(50) DEFAULT NULL,
  `lastqtrpaid` int(11) DEFAULT NULL,
  `partial` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `fk_business_receivable_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_receivable_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_receivable_detail`
--

DROP TABLE IF EXISTS `business_receivable_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_receivable_detail` (
  `objid` varchar(50) NOT NULL,
  `receivableid` varchar(50) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `surcharge` decimal(18,2) DEFAULT NULL,
  `interest` decimal(18,2) DEFAULT NULL,
  `discount` decimal(18,2) DEFAULT NULL,
  `paypriority` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_duedate` (`duedate`),
  KEY `ix_receivableid` (`receivableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_recurringfee`
--

DROP TABLE IF EXISTS `business_recurringfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_recurringfee` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(150) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_txntype_objid` (`txntype_objid`),
  CONSTRAINT `fk_business_recurringfee_txntype_objid` FOREIGN KEY (`txntype_objid`) REFERENCES `business_billitem_txntype` (`objid`),
  CONSTRAINT `fk_business_recurringfee_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_redflag`
--

DROP TABLE IF EXISTS `business_redflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_redflag` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `filedby_objid` varchar(50) DEFAULT NULL,
  `filedby_name` varchar(255) DEFAULT NULL,
  `resolved` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `blockaction` varchar(50) DEFAULT NULL,
  `effectivedate` date DEFAULT NULL,
  `resolvedby_objid` varchar(50) DEFAULT NULL,
  `resolvedby_name` varchar(100) DEFAULT NULL,
  `caseno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_effectivedate` (`effectivedate`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_resolvedby_objid` (`resolvedby_objid`),
  CONSTRAINT `fk_business_redflag_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_requirement`
--

DROP TABLE IF EXISTS `business_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_requirement` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `issuedby` varchar(100) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `placeissued` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `step` varchar(50) DEFAULT NULL,
  `completedby_objid` varchar(50) DEFAULT NULL,
  `completedby_name` varchar(50) DEFAULT NULL,
  `dtcompleted` datetime DEFAULT NULL,
  `completed` int(11) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_completedby_objid` (`completedby_objid`),
  KEY `ix_dtcompleted` (`dtcompleted`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  CONSTRAINT `fk_business_requirement_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_requirement_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_sms`
--

DROP TABLE IF EXISTS `business_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_sms` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `traceid` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `logdate` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amtpaid` decimal(10,2) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_taxcredit`
--

DROP TABLE IF EXISTS `business_taxcredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_taxcredit` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) DEFAULT NULL,
  `currentlineno` int(11) DEFAULT NULL,
  `totaldr` decimal(18,2) DEFAULT NULL,
  `totalcr` decimal(18,2) DEFAULT NULL,
  `balance` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_taxcredit_item`
--

DROP TABLE IF EXISTS `business_taxcredit_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_taxcredit_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `lineno` int(11) DEFAULT NULL,
  `particulars` varchar(100) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(20) DEFAULT NULL,
  `dr` decimal(18,2) DEFAULT NULL,
  `cr` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `FK_business_taxcredit_detail_business_taxcredit` FOREIGN KEY (`parentid`) REFERENCES `business_taxcredit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_taxincentive`
--

DROP TABLE IF EXISTS `business_taxincentive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_taxincentive` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `dtexpiry` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `approver_objid` varchar(50) DEFAULT NULL,
  `approver_name` varchar(255) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessrequirementtype`
--

DROP TABLE IF EXISTS `businessrequirementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessrequirementtype` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `agency` varchar(50) DEFAULT NULL,
  `sortindex` int(11) DEFAULT NULL,
  `verifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`),
  UNIQUE KEY `uix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessvariable`
--

DROP TABLE IF EXISTS `businessvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessvariable` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arrayvalues` longtext,
  `system` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelannotation`
--

DROP TABLE IF EXISTS `cancelannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(10) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `annotationid` varchar(50) NOT NULL,
  `fileno` varchar(20) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `orno` varchar(10) DEFAULT NULL,
  `ordate` datetime DEFAULT NULL,
  `oramount` decimal(10,0) NOT NULL,
  `signedby` varchar(150) NOT NULL,
  `signedbytitle` varchar(50) NOT NULL,
  `dtsigned` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cancelannotation_faasannotation` (`annotationid`),
  KEY `ix_cancelannotation_fileno` (`fileno`),
  KEY `ix_cancelannotation_txnno` (`txnno`),
  CONSTRAINT `FK_cancelannotation_faasannotation` FOREIGN KEY (`annotationid`) REFERENCES `faasannotation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas`
--

DROP TABLE IF EXISTS `cancelledfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `reason_objid` varchar(50) DEFAULT NULL,
  `remarks` longtext,
  `online` int(11) DEFAULT NULL,
  `lguid` varchar(50) DEFAULT NULL,
  `lasttaxyear` int(11) DEFAULT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `originlguid` varchar(50) DEFAULT NULL,
  `cancelledbytdnos` varchar(500) DEFAULT NULL,
  `cancelledbypins` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cancelledfaas_faas` (`faasid`),
  KEY `FK_cancelledfaas_reason` (`reason_objid`),
  KEY `ix_cancelledfaas_txnno` (`txnno`),
  CONSTRAINT `FK_cancelledfaas_reason` FOREIGN KEY (`reason_objid`) REFERENCES `canceltdreason` (`objid`),
  CONSTRAINT `FK_cancelledfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas_signatory`
--

DROP TABLE IF EXISTS `cancelledfaas_signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas_signatory` (
  `objid` varchar(50) NOT NULL,
  `taxmapper_objid` varchar(50) DEFAULT NULL,
  `taxmapper_name` varchar(100) DEFAULT NULL,
  `taxmapper_title` varchar(50) DEFAULT NULL,
  `taxmapper_dtsigned` datetime DEFAULT NULL,
  `taxmapper_taskid` varchar(50) DEFAULT NULL,
  `taxmapperchief_objid` varchar(50) DEFAULT NULL,
  `taxmapperchief_name` varchar(100) DEFAULT NULL,
  `taxmapperchief_title` varchar(50) DEFAULT NULL,
  `taxmapperchief_dtsigned` datetime DEFAULT NULL,
  `taxmapperchief_taskid` varchar(50) DEFAULT NULL,
  `appraiser_objid` varchar(50) DEFAULT NULL,
  `appraiser_name` varchar(150) DEFAULT NULL,
  `appraiser_title` varchar(50) DEFAULT NULL,
  `appraiser_dtsigned` datetime DEFAULT NULL,
  `appraiser_taskid` varchar(50) DEFAULT NULL,
  `appraiserchief_objid` varchar(50) DEFAULT NULL,
  `appraiserchief_name` varchar(100) DEFAULT NULL,
  `appraiserchief_title` varchar(50) DEFAULT NULL,
  `appraiserchief_dtsigned` datetime DEFAULT NULL,
  `appraiserchief_taskid` varchar(50) DEFAULT NULL,
  `recommender_objid` varchar(50) DEFAULT NULL,
  `recommender_name` varchar(100) DEFAULT NULL,
  `recommender_title` varchar(50) DEFAULT NULL,
  `recommender_dtsigned` datetime DEFAULT NULL,
  `recommender_taskid` varchar(50) DEFAULT NULL,
  `provtaxmapper_objid` varchar(50) DEFAULT NULL,
  `provtaxmapper_name` varchar(100) DEFAULT NULL,
  `provtaxmapper_title` varchar(50) DEFAULT NULL,
  `provtaxmapper_dtsigned` datetime DEFAULT NULL,
  `provtaxmapper_taskid` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_objid` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_name` varchar(100) DEFAULT NULL,
  `provtaxmapperchief_title` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_dtsigned` datetime DEFAULT NULL,
  `provtaxmapperchief_taskid` varchar(50) DEFAULT NULL,
  `provappraiser_objid` varchar(50) DEFAULT NULL,
  `provappraiser_name` varchar(100) DEFAULT NULL,
  `provappraiser_title` varchar(50) DEFAULT NULL,
  `provappraiser_dtsigned` datetime DEFAULT NULL,
  `provappraiser_taskid` varchar(50) DEFAULT NULL,
  `provappraiserchief_objid` varchar(50) DEFAULT NULL,
  `provappraiserchief_name` varchar(100) DEFAULT NULL,
  `provappraiserchief_title` varchar(50) DEFAULT NULL,
  `provappraiserchief_dtsigned` datetime DEFAULT NULL,
  `provappraiserchief_taskid` varchar(50) DEFAULT NULL,
  `approver_objid` varchar(50) DEFAULT NULL,
  `approver_name` varchar(100) DEFAULT NULL,
  `approver_title` varchar(50) DEFAULT NULL,
  `approver_dtsigned` datetime DEFAULT NULL,
  `approver_taskid` varchar(50) DEFAULT NULL,
  `provapprover_objid` varchar(50) DEFAULT NULL,
  `provapprover_name` varchar(100) DEFAULT NULL,
  `provapprover_title` varchar(50) DEFAULT NULL,
  `provapprover_dtsigned` datetime DEFAULT NULL,
  `provapprover_taskid` varchar(50) DEFAULT NULL,
  `provrecommender_objid` varchar(50) DEFAULT NULL,
  `provrecommender_name` varchar(100) DEFAULT NULL,
  `provrecommender_title` varchar(50) DEFAULT NULL,
  `provrecommender_dtsigned` datetime DEFAULT NULL,
  `provrecommender_taskid` varchar(50) DEFAULT NULL,
  `reviewer_objid` varchar(50) DEFAULT NULL,
  `reviewer_name` varchar(100) DEFAULT NULL,
  `reviewer_title` varchar(75) DEFAULT NULL,
  `reviewer_dtsigned` datetime DEFAULT NULL,
  `reviewer_taskid` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_cancelledfaas_signatory_cancelled_faas` FOREIGN KEY (`objid`) REFERENCES `cancelledfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas_task`
--

DROP TABLE IF EXISTS `cancelledfaas_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `FK_cancelledfaas_task_cancelledfaas` FOREIGN KEY (`refid`) REFERENCES `cancelledfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canceltdreason`
--

DROP TABLE IF EXISTS `canceltdreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canceltdreason` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_canceltdreason_code` (`code`),
  UNIQUE KEY `ux_canceltdreason_name` (`name`),
  KEY `ix_canceltdreason_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_treasury_ledger`
--

DROP TABLE IF EXISTS `cash_treasury_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_treasury_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `itemacctid` varchar(50) DEFAULT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_cash_treasury_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`),
  CONSTRAINT `fk_cash_treasury_jev_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`),
  CONSTRAINT `fk_cash_treasury_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashbook_revolving_fund`
--

DROP TABLE IF EXISTS `cashbook_revolving_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashbook_revolving_fund` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `issueto_objid` varchar(50) NOT NULL,
  `issueto_name` varchar(150) NOT NULL,
  `controldate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_fund_title` (`fund_title`),
  KEY `ix_issueto_name` (`issueto_name`),
  KEY `ix_issueto_objid` (`issueto_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_cashbook_revolving_fund_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt`
--

DROP TABLE IF EXISTS `cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(800) DEFAULT NULL,
  `paidby` varchar(800) NOT NULL,
  `paidbyaddress` varchar(800) NOT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `totalcash` decimal(16,4) DEFAULT NULL,
  `totalnoncash` decimal(16,4) DEFAULT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  `totalcredit` decimal(16,2) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(100) DEFAULT NULL,
  `subcollector_title` varchar(50) DEFAULT NULL,
  `formtype` varchar(25) DEFAULT NULL,
  `stub` varchar(25) DEFAULT NULL,
  `remittanceid` varchar(50) DEFAULT NULL,
  `subcollector_remittanceid` varchar(50) DEFAULT NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlid_receiptno` (`controlid`,`receiptno`,`ukey`),
  KEY `FK_cashereceipt_userid` (`user_objid`),
  KEY `FK_cashreceipt_afcontrol` (`controlid`),
  KEY `ix_cashreceipt_receiptdate` (`receiptdate`),
  KEY `ix_cashreceipt_series` (`series`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorname` (`collector_name`),
  KEY `ix_formno` (`formno`),
  KEY `ix_formtype` (`formtype`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_remittanceid` (`subcollector_remittanceid`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `fk_cashreceipt_remittanceid` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`),
  CONSTRAINT `cashreceipt_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_cashreceipt_collectiontype` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `FK_cashreceipt_collector` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_burial`
--

DROP TABLE IF EXISTS `cashreceipt_burial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_burial` (
  `objid` varchar(50) NOT NULL,
  `tocitymuni` varchar(100) DEFAULT NULL,
  `toprovince` varchar(100) DEFAULT NULL,
  `permissiontype` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `nationality` varchar(15) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `dtdeath` varchar(15) DEFAULT NULL,
  `deathcause` varchar(50) DEFAULT NULL,
  `cemetery` varchar(50) DEFAULT NULL,
  `infectious` varchar(50) DEFAULT NULL,
  `embalmed` varchar(50) DEFAULT NULL,
  `disposition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_cancelseries`
--

DROP TABLE IF EXISTS `cashreceipt_cancelseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cancelseries` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(100) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `controlid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_receiptid` (`receiptid`),
  KEY `FK_cashreceipt_cancelseries_receipt` (`receiptid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `FK_cashreceipt_cancelseries_receipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_cancelseries_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_cashreceipt_cancelseries_controlid` FOREIGN KEY (`controlid`) REFERENCES `af_control` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_cashticket`
--

DROP TABLE IF EXISTS `cashreceipt_cashticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cashticket` (
  `objid` varchar(50) NOT NULL,
  `qtyissued` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceipt_cashticket_cashreceipt` (`objid`),
  CONSTRAINT `FK_cashreceipt_cashticket_cashreceipt` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_changelog`
--

DROP TABLE IF EXISTS `cashreceipt_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_changelog` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `action` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_action` (`action`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_receiptid` (`receiptid`),
  CONSTRAINT `fk_cashreceipt_changelog_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_ctc_corporate`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_corporate` (
  `objid` varchar(50) NOT NULL,
  `payer_tin` varchar(50) DEFAULT NULL,
  `payer_orgtype` varchar(50) DEFAULT NULL,
  `payer_nature` varchar(50) DEFAULT NULL,
  `payer_dtregistered` datetime DEFAULT NULL,
  `payer_placeregistered` varchar(100) DEFAULT NULL,
  `additional_remarks` varchar(100) DEFAULT NULL,
  `realpropertyav` decimal(10,0) NOT NULL,
  `businessgross` decimal(10,0) NOT NULL,
  `basictax` decimal(10,0) NOT NULL,
  `propertyavtax` decimal(10,0) NOT NULL,
  `businessgrosstax` decimal(10,0) NOT NULL,
  `totaltax` decimal(10,0) NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `amountdue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_cashreceiptctccorporate_cashreceipt` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_ctc_corporate_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_ctc_individual`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_individual` (
  `objid` varchar(50) NOT NULL,
  `payer_profession` varchar(50) DEFAULT NULL,
  `payer_citizenship` varchar(50) DEFAULT NULL,
  `payer_civilstatus` varchar(25) DEFAULT NULL,
  `payer_height` varchar(25) DEFAULT NULL,
  `payer_weight` varchar(25) DEFAULT NULL,
  `additional_remarks` varchar(100) DEFAULT NULL,
  `businessgross` decimal(10,0) NOT NULL,
  `annualsalary` decimal(10,0) NOT NULL,
  `propertyincome` decimal(10,0) NOT NULL,
  `basictax` decimal(10,0) NOT NULL,
  `salarytax` decimal(10,0) NOT NULL,
  `businessgrosstax` decimal(10,0) NOT NULL,
  `propertyincometax` decimal(10,0) NOT NULL,
  `additionaltax` decimal(10,0) NOT NULL,
  `totaltax` decimal(10,0) NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `amountdue` decimal(10,0) NOT NULL,
  `interestdue` decimal(10,0) NOT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(50) DEFAULT NULL,
  `brgytaxshare` decimal(10,0) NOT NULL,
  `brgyinterestshare` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_cashreceiptctcindividual_cashreceipt` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_ctc_individual_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_group`
--

DROP TABLE IF EXISTS `cashreceipt_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_group` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_txndate` (`txndate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_groupitem`
--

DROP TABLE IF EXISTS `cashreceipt_groupitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_groupitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_cashreceipt_groupitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `cashreceipt_group` (`objid`),
  CONSTRAINT `fk_cashreceipt_groupitem_objid` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_largecattleownership`
--

DROP TABLE IF EXISTS `cashreceipt_largecattleownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattleownership` (
  `objid` varchar(50) NOT NULL,
  `ownerof` varchar(200) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `municipalitybrand` varchar(20) DEFAULT NULL,
  `ownerbrand` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_largecattletransfer`
--

DROP TABLE IF EXISTS `cashreceipt_largecattletransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattletransfer` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `purchasedby` varchar(200) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `citymuni` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `municipalitybrand` varchar(20) DEFAULT NULL,
  `ownerbrand` varchar(20) DEFAULT NULL,
  `certificateno` varchar(30) DEFAULT NULL,
  `issuedate` date DEFAULT NULL,
  `issuedcitymuni` varchar(100) DEFAULT NULL,
  `issuedprovince` varchar(100) DEFAULT NULL,
  `attestedby` varchar(100) DEFAULT NULL,
  `treasurer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_largecattletransfer_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_marriage`
--

DROP TABLE IF EXISTS `cashreceipt_marriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_marriage` (
  `objid` varchar(50) NOT NULL,
  `groomname` varchar(100) DEFAULT NULL,
  `groomaddress` varchar(100) DEFAULT NULL,
  `groomageyear` int(11) DEFAULT NULL,
  `groomagemonth` int(11) DEFAULT NULL,
  `bridename` varchar(100) DEFAULT NULL,
  `brideaddress` varchar(100) DEFAULT NULL,
  `brideageyear` int(11) DEFAULT NULL,
  `brideagemonth` int(11) DEFAULT NULL,
  `registerno` varchar(30) DEFAULT NULL,
  `attachments` varchar(200) DEFAULT NULL,
  `lcrofficer` varchar(100) DEFAULT NULL,
  `lcrofficertitle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_reprint_log`
--

DROP TABLE IF EXISTS `cashreceipt_reprint_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_reprint_log` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `approvedby_objid` varchar(50) NOT NULL,
  `approvedby_name` varchar(150) NOT NULL,
  `dtapproved` datetime NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_receiptid` (`receiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_rpt`
--

DROP TABLE IF EXISTS `cashreceipt_rpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_rpt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_rpt_share_forposting`
--

DROP TABLE IF EXISTS `cashreceipt_rpt_share_forposting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt_share_forposting` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `error` int(11) NOT NULL,
  `msg` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_receiptid_rptledgerid` (`receiptid`,`rptledgerid`),
  KEY `fk_cashreceipt_rpt_share_forposing_cashreceipt` (`receiptid`),
  KEY `fk_cashreceipt_rpt_share_forposing_rptledger` (`rptledgerid`),
  CONSTRAINT `fk_cashreceipt_rpt_share_forposing_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_cashreceipt_rpt_share_forposing_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_rpt_share_forposting_repost`
--

DROP TABLE IF EXISTS `cashreceipt_rpt_share_forposting_repost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt_share_forposting_repost` (
  `objid` varchar(100) NOT NULL,
  `rptpaymentid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `receiptdate` date NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `error` int(11) DEFAULT NULL,
  `msg` text,
  `receipttype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_receiptid_rptledgerid` (`receiptid`,`rptledgerid`),
  KEY `fk_rptshare_repost_cashreceiptid` (`receiptid`),
  KEY `fk_rptshare_repost_rptledgerid` (`rptledgerid`),
  CONSTRAINT `cashreceipt_rpt_share_forposting_repost_ibfk_2` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_share`
--

DROP TABLE IF EXISTS `cashreceipt_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_share` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `refitem_objid` varchar(50) DEFAULT NULL,
  `payableitem_objid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `share` decimal(16,2) DEFAULT NULL,
  `receiptitemid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_payableitem_objid` (`payableitem_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_receiptitemid` (`receiptitemid`),
  KEY `ix_refitem_objid` (`refitem_objid`),
  CONSTRAINT `fk_cashreceipt_share_refitem_objid` FOREIGN KEY (`refitem_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_cashreceipt_share_payableitem_objid` FOREIGN KEY (`payableitem_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_slaughter`
--

DROP TABLE IF EXISTS `cashreceipt_slaughter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_slaughter` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctitle` varchar(100) DEFAULT NULL,
  `permitamount` decimal(18,2) DEFAULT NULL,
  `slaughterof` varchar(25) DEFAULT NULL,
  `weight` decimal(18,2) DEFAULT NULL,
  `ordinanceno` varchar(50) DEFAULT NULL,
  `ordinancedate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_void`
--

DROP TABLE IF EXISTS `cashreceipt_void`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_void` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) NOT NULL,
  `postedby_name` varchar(100) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `FK_voidreceipt_receipt` (`receiptid`),
  UNIQUE KEY `uix_receiptid` (`receiptid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `FK_cashreceipt_void_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_void_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptitem`
--

DROP TABLE IF EXISTS `cashreceiptitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `item_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `item_fund_objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_code` (`item_code`),
  KEY `ix_item_fund_objid` (`item_fund_objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_item_title` (`item_title`),
  KEY `ix_receiptid` (`receiptid`),
  CONSTRAINT `fk_cashreceiptitem_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_cashreceiptitem_item_fund_objid` FOREIGN KEY (`item_fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_cashreceiptitem_item_objid` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptitem_discount`
--

DROP TABLE IF EXISTS `cashreceiptitem_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem_discount` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptitemid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptpayment_creditmemo`
--

DROP TABLE IF EXISTS `cashreceiptpayment_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_creditmemo` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_code` varchar(100) DEFAULT NULL,
  `account_fund_name` varchar(50) DEFAULT NULL,
  `account_fund_objid` varchar(50) DEFAULT NULL,
  `account_bank` varchar(50) DEFAULT NULL,
  `refno` varchar(25) DEFAULT NULL,
  `refdate` datetime DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceiptpayment_creditmemo` (`receiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `cashreceiptpayment_noncash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_noncash` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `refno` varchar(25) DEFAULT NULL,
  `refdate` datetime DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_code` varchar(50) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_fund_objid` varchar(100) DEFAULT NULL,
  `account_fund_name` varchar(50) DEFAULT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `checkid` varchar(50) DEFAULT NULL,
  `voidamount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceiptpayment_check` (`receiptid`),
  KEY `ix_account_fund_objid` (`account_fund_objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_checkid` (`checkid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `cashreceiptpayment_noncash_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipts`
--

DROP TABLE IF EXISTS `cashreceipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipts` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(100) NOT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) DEFAULT NULL,
  `byauthoritytitle` varchar(50) DEFAULT NULL,
  `orno` varchar(25) DEFAULT NULL,
  `ordate` datetime DEFAULT NULL,
  `oramount` decimal(10,0) NOT NULL,
  `stampamount` decimal(10,0) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) DEFAULT NULL,
  `info` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_certification_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpayment`
--

DROP TABLE IF EXISTS `checkpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `amtused` decimal(16,4) DEFAULT NULL,
  `receivedfrom` longtext,
  `state` varchar(50) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `depositslipid` varchar(100) DEFAULT NULL,
  `split` int(11) NOT NULL,
  `external` int(11) NOT NULL DEFAULT '0',
  `collector_objid` varchar(50) DEFAULT NULL,
  `collector_name` varchar(255) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  CONSTRAINT `fk_paymentcheck_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_checkpayment_depositslipid` FOREIGN KEY (`depositslipid`) REFERENCES `depositslip` (`objid`),
  CONSTRAINT `fk_paymentcheck_depositvoucher` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpayment_deadchecks`
--

DROP TABLE IF EXISTS `checkpayment_deadchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment_deadchecks` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `collector_objid` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `amtused` decimal(16,4) DEFAULT NULL,
  `receivedfrom` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `depositslipid` varchar(100) DEFAULT NULL,
  `split` int(11) NOT NULL,
  `amtdeposited` decimal(16,4) DEFAULT NULL,
  `external` int(11) DEFAULT NULL,
  `collector_name` varchar(255) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(255) DEFAULT NULL,
  `collectorid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorid_` (`collectorid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_subcollector_objid` (`subcollector_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpayment_dishonored`
--

DROP TABLE IF EXISTS `checkpayment_dishonored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment_dishonored` (
  `objid` varchar(50) NOT NULL,
  `checkpaymentid` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_checkpaymentid` (`checkpaymentid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  CONSTRAINT `fk_checkpayment_dishonored_checkpaymentid` FOREIGN KEY (`checkpaymentid`) REFERENCES `checkpayment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citizenship` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `mayor_name` varchar(100) DEFAULT NULL,
  `mayor_title` varchar(50) DEFAULT NULL,
  `mayor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_city_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup`
--

DROP TABLE IF EXISTS `collectiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `sharing` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_name` (`name`),
  UNIQUE KEY `uix_colletiongroup_name` (`name`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup_account`
--

DROP TABLE IF EXISTS `collectiongroup_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_account` (
  `collectiongroupid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `valuetype` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(16,2) DEFAULT NULL,
  `objid` varchar(100) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_account` (`collectiongroupid`,`account_objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  CONSTRAINT `fk_collectiongroup_account_collectiongroupid` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`),
  CONSTRAINT `fk_collectiongroup_account` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup_org`
--

DROP TABLE IF EXISTS `collectiongroup_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_org` (
  `objid` varchar(100) NOT NULL,
  `collectiongroupid` varchar(50) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `org_type` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_org` (`collectiongroupid`,`org_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  KEY `ix_org_objid` (`org_objid`),
  CONSTRAINT `fk_collectiongroup_org_parent` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype`
--

DROP TABLE IF EXISTS `collectiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `formno` varchar(15) DEFAULT NULL,
  `handler` varchar(25) DEFAULT NULL,
  `allowbatch` int(11) DEFAULT '0',
  `barcodekey` varchar(100) DEFAULT NULL,
  `allowonline` int(11) DEFAULT '0',
  `allowoffline` int(11) DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `fund_objid` varchar(50) DEFAULT NULL,
  `fund_title` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `system` int(11) DEFAULT '0',
  `queuesection` varchar(100) DEFAULT NULL,
  `allowpaymentorder` int(11) DEFAULT '0',
  `allowkiosk` int(11) DEFAULT '0',
  `allowcreditmemo` int(11) DEFAULT '0',
  `info` text,
  `connection` varchar(150) DEFAULT NULL,
  `servicename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_formno` (`formno`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_handler` (`handler`),
  KEY `ix_name` (`name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype_account`
--

DROP TABLE IF EXISTS `collectiontype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_account` (
  `collectiontypeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(10,0) DEFAULT NULL,
  `valuetype` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `objid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_objid`,`collectiontypeid`),
  UNIQUE KEY `uix_collectiontype_account` (`collectiontypeid`,`account_objid`),
  KEY `fk_collectiontype_account_revitem` (`account_objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_account_title` (`account_title`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  CONSTRAINT `fk_collectiontype_account_revitem` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_collectiontype_account_collectiontype` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype_org`
--

DROP TABLE IF EXISTS `collectiontype_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_org` (
  `objid` varchar(100) NOT NULL,
  `collectiontypeid` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(150) DEFAULT NULL,
  `org_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiontype_org` (`collectiontypeid`,`org_objid`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  CONSTRAINT `fk_collectiontype_org_collectiontypeid` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionvoucher`
--

DROP TABLE IF EXISTS `collectionvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(50) NOT NULL,
  `controldate` date NOT NULL,
  `dtposted` datetime NOT NULL,
  `liquidatingofficer_objid` varchar(50) DEFAULT NULL,
  `liquidatingofficer_name` varchar(100) DEFAULT NULL,
  `liquidatingofficer_title` varchar(50) DEFAULT NULL,
  `liquidatingofficer_signature` longtext,
  `amount` decimal(18,2) DEFAULT NULL,
  `totalcash` decimal(18,2) DEFAULT NULL,
  `totalcheck` decimal(16,4) DEFAULT NULL,
  `cashbreakdown` longtext,
  `totalcr` decimal(16,4) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  UNIQUE KEY `uix_txnno` (`controlno`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_liquidatingofficer_name` (`liquidatingofficer_name`),
  KEY `ix_liquidatingofficer_objid` (`liquidatingofficer_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_collectionvoucher_liquidatingofficer` FOREIGN KEY (`liquidatingofficer_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_collectionvoucher_depositvoucherid` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionvoucher_fund`
--

DROP TABLE IF EXISTS `collectionvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher_fund` (
  `objid` varchar(255) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fund_objid` (`parentid`,`fund_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_fundid` (`fund_objid`),
  KEY `ix_liquidationid` (`parentid`),
  KEY `ix_objid_controlno` (`objid`,`controlno`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_collectionvoucherfund_parent` FOREIGN KEY (`parentid`) REFERENCES `collectionvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidatedland`
--

DROP TABLE IF EXISTS `consolidatedland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidatedland` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `rpid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidatedland_consolidation` (`consolidationid`),
  KEY `FK_consolidatedland_faas` (`landfaasid`),
  CONSTRAINT `FK_consolidatedland_faas` FOREIGN KEY (`landfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidatedland_consolidation` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidation`
--

DROP TABLE IF EXISTS `consolidation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `autonumber` int(11) DEFAULT NULL,
  `effectivityyear` int(11) DEFAULT NULL,
  `effectivityqtr` int(11) DEFAULT NULL,
  `newtdno` varchar(50) DEFAULT NULL,
  `newutdno` varchar(50) DEFAULT NULL,
  `newtitletype` varchar(50) DEFAULT NULL,
  `newtitleno` varchar(50) DEFAULT NULL,
  `newtitledate` varchar(50) DEFAULT NULL,
  `memoranda` longtext,
  `lguid` varchar(50) DEFAULT NULL,
  `lgutype` varchar(50) DEFAULT NULL,
  `newrpid` varchar(50) DEFAULT NULL,
  `newrpuid` varchar(50) DEFAULT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `taxpayer_name` longtext,
  `taxpayer_address` varchar(200) DEFAULT NULL,
  `owner_name` longtext,
  `owner_address` varchar(200) DEFAULT NULL,
  `administrator_objid` varchar(50) DEFAULT NULL,
  `administrator_name` varchar(500) DEFAULT NULL,
  `administrator_address` varchar(200) DEFAULT NULL,
  `administratorid` varchar(50) DEFAULT NULL,
  `administratorname` varchar(500) DEFAULT NULL,
  `administratoraddress` varchar(200) DEFAULT NULL,
  `signatories` longtext,
  `originlguid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidation_newfaas` (`newfaasid`),
  KEY `FK_consolidation_newrp` (`newrpid`),
  KEY `FK_consolidation_newrpu` (`newrpuid`),
  KEY `ix_lguid` (`lguid`),
  CONSTRAINT `FK_consolidation_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_consolidation_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidation_newrp` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidation_task`
--

DROP TABLE IF EXISTS `consolidation_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidation_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidationaffectedrpu`
--

DROP TABLE IF EXISTS `consolidationaffectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidationaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  `newtdno` varchar(50) DEFAULT NULL,
  `newutdno` varchar(50) DEFAULT NULL,
  `newsuffix` int(11) DEFAULT NULL,
  `memoranda` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidationaffectedrpu_consolidation` (`consolidationid`),
  KEY `FK_consolidationaffectedrpu_newfaas` (`newfaasid`),
  KEY `FK_consolidationaffectedrpu_newrpu` (`newrpuid`),
  KEY `FK_consolidationaffectedrpu_prevfaas` (`prevfaasid`),
  KEY `ix_consolidationaffectedrpu_landfaasid` (`landfaasid`),
  KEY `ix_consolidationaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `FK_consolidationaffectedrpu_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_consolidation` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemo`
--

DROP TABLE IF EXISTS `creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(25) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `particulars` varchar(250) DEFAULT NULL,
  `type_objid` varchar(50) DEFAULT NULL,
  `type_title` varchar(150) DEFAULT NULL,
  `bankaccount_objid` varchar(50) DEFAULT NULL,
  `bankaccount_title` varchar(150) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `payer_address_text` varchar(255) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `bankaccount_code` varchar(50) DEFAULT NULL,
  `receiptdate` date DEFAULT NULL,
  `issuereceipt` int(11) DEFAULT '0',
  `type` varchar(25) DEFAULT NULL,
  `payer_address_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankaccount_objid` (`bankaccount_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_payer_address_objid` (`payer_address_objid`),
  KEY `ix_payer_name` (`payer_name`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  KEY `ix_type_objid` (`type_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemoitem`
--

DROP TABLE IF EXISTS `creditmemoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemoitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `creditmemoitem_ibfk_2` (`item_objid`),
  KEY `FK_creditmemo_item` (`parentid`),
  CONSTRAINT `FK_creditmemo_item` FOREIGN KEY (`parentid`) REFERENCES `creditmemo` (`objid`),
  CONSTRAINT `creditmemoitem_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `creditmemo` (`objid`),
  CONSTRAINT `creditmemoitem_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `FK_creditmemoitem_revenueitem` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemotype`
--

DROP TABLE IF EXISTS `creditmemotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `issuereceipt` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemotype_account`
--

DROP TABLE IF EXISTS `creditmemotype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype_account` (
  `typeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_objid`,`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_fund_transfer`
--

DROP TABLE IF EXISTS `deposit_fund_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_fund_transfer` (
  `objid` varchar(150) NOT NULL,
  `fromdepositvoucherfundid` varchar(150) NOT NULL,
  `todepositvoucherfundid` varchar(150) NOT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fromfundid` (`fromdepositvoucherfundid`),
  KEY `ix_tofundid` (`todepositvoucherfundid`),
  CONSTRAINT `fk_deposit_fund_transfer_todepositvoucherfundid` FOREIGN KEY (`todepositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`),
  CONSTRAINT `fk_deposit_fund_transfer_fromdepositvoucherfundid` FOREIGN KEY (`fromdepositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositslip`
--

DROP TABLE IF EXISTS `depositslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositslip` (
  `objid` varchar(100) NOT NULL,
  `depositvoucherfundid` varchar(150) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `depositdate` date DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `bankacctid` varchar(50) DEFAULT NULL,
  `totalcash` decimal(16,4) DEFAULT NULL,
  `totalcheck` decimal(16,4) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `validation_refno` varchar(50) DEFAULT NULL,
  `validation_refdate` date DEFAULT NULL,
  `cashbreakdown` longtext,
  `state` varchar(10) DEFAULT NULL,
  `deposittype` varchar(50) DEFAULT NULL,
  `checktype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_depositdate` (`depositdate`),
  KEY `ix_depositvoucherid` (`depositvoucherfundid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_validation_refdate` (`validation_refdate`),
  KEY `ix_validation_refno` (`validation_refno`),
  CONSTRAINT `fk_depositslip_depositvoucherfundid` FOREIGN KEY (`depositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositvoucher`
--

DROP TABLE IF EXISTS `depositvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(50) NOT NULL,
  `controldate` date DEFAULT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_postedby_name` (`postedby_name`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositvoucher_fund`
--

DROP TABLE IF EXISTS `depositvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher_fund` (
  `objid` varchar(150) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `parentid` varchar(50) NOT NULL,
  `fundid` varchar(100) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `amountdeposited` decimal(16,4) NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `totaldr` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `postedby_title` varchar(100) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fundid` (`parentid`,`fundid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_postedby_name` (`postedby_name`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_depositvoucher_fund_parentid` FOREIGN KEY (`parentid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `oldindexno` varchar(15) DEFAULT NULL,
  `oldpin` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `draftremittance`
--

DROP TABLE IF EXISTS `draftremittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `remittancedate` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(255) NOT NULL,
  `collector_title` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `txnmode` varchar(32) NOT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_remittancedate` (`remittancedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `draftremittanceitem`
--

DROP TABLE IF EXISTS `draftremittanceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittanceitem` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `voided` int(11) NOT NULL,
  `cancelled` int(11) NOT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchid` (`batchid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_remittanceid` (`remittanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eftpayment`
--

DROP TABLE IF EXISTS `eftpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eftpayment` (
  `objid` varchar(50) NOT NULL,
  `bankacctid` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `receivedfrom` varchar(255) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `payer_address_objid` varchar(50) DEFAULT NULL,
  `payer_address_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_payer_address_objid` (`payer_address_objid`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_eftpayment_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_eftpayment_bankacct` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `entityno` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `address_text` varchar(255) NOT NULL,
  `mailingaddress` varchar(255) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `sys_lastupdate` varchar(25) DEFAULT NULL,
  `sys_lastupdateby` varchar(50) DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `entityname` varchar(900) NOT NULL,
  `address_objid` varchar(50) DEFAULT NULL,
  `mobileno` varchar(25) DEFAULT NULL,
  `phoneno` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityno` (`entityno`),
  KEY `ix_entityname` (`entityname`(255)),
  KEY `ix_entityname_state` (`state`,`entityname`(255)),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_address`
--

DROP TABLE IF EXISTS `entity_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_address` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `addresstype` varchar(50) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `municipality` varchar(50) DEFAULT NULL,
  `bldgno` varchar(50) DEFAULT NULL,
  `bldgname` varchar(50) DEFAULT NULL,
  `unitno` varchar(50) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_parentid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_ctc`
--

DROP TABLE IF EXISTS `entity_ctc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_ctc` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `nonresident` int(11) NOT NULL,
  `ctcno` varchar(50) NOT NULL,
  `dtissued` date NOT NULL,
  `placeissued` varchar(255) NOT NULL,
  `lgu_objid` varchar(50) DEFAULT NULL,
  `lgu_name` varchar(255) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(255) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(160) NOT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_ctcno` (`ctcno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_lgu_name` (`lgu_name`),
  KEY `ix_lgu_objid` (`lgu_objid`),
  CONSTRAINT `fk_entity_ctc_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_fingerprint`
--

DROP TABLE IF EXISTS `entity_fingerprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_fingerprint` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `fingertype` varchar(20) DEFAULT NULL,
  `data` longtext,
  `image` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityid_fingertype` (`entityid`,`fingertype`),
  KEY `ix_dtfiled` (`dtfiled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_mapping`
--

DROP TABLE IF EXISTS `entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_reconciled`
--

DROP TABLE IF EXISTS `entity_reconciled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled` (
  `objid` varchar(50) NOT NULL,
  `info` longtext,
  `masterid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_entity_reconciled_entity` (`masterid`),
  CONSTRAINT `FK_entity_reconciled_entity` FOREIGN KEY (`masterid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_reconciled_txn`
--

DROP TABLE IF EXISTS `entity_reconciled_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled_txn` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `tag` char(1) DEFAULT NULL,
  PRIMARY KEY (`objid`,`refid`,`reftype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_relation`
--

DROP TABLE IF EXISTS `entity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation` (
  `objid` varchar(50) NOT NULL,
  `entity_objid` varchar(50) DEFAULT NULL,
  `relateto_objid` varchar(50) DEFAULT NULL,
  `relation_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_sender_receiver` (`entity_objid`,`relateto_objid`),
  KEY `ix_entity_objid` (`entity_objid`),
  KEY `ix_relateto_objid` (`relateto_objid`),
  KEY `ix_relation_objid` (`relation_objid`),
  CONSTRAINT `fk_entity_relation_relation_objid` FOREIGN KEY (`relateto_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entity_relation_entity_objid` FOREIGN KEY (`entity_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entity_relation_relation` FOREIGN KEY (`relation_objid`) REFERENCES `entity_relation_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_relation_type`
--

DROP TABLE IF EXISTS `entity_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation_type` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(1) DEFAULT NULL,
  `inverse_any` varchar(50) DEFAULT NULL,
  `inverse_male` varchar(50) DEFAULT NULL,
  `inverse_female` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitycontact`
--

DROP TABLE IF EXISTS `entitycontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitycontact` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `contacttype` varchar(25) NOT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_entityid` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityid`
--

DROP TABLE IF EXISTS `entityid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityid` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `dtissued` date DEFAULT NULL,
  `dtexpiry` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_entityidcard_idtype_idno` (`idtype`,`idno`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_idno` (`idno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityidcard`
--

DROP TABLE IF EXISTS `entityidcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityidcard` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `expiry` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_entityidcard_entityid_idtype_idno` (`entityid`,`idtype`,`idno`),
  KEY `FK_entityidcard_entity` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityindividual`
--

DROP TABLE IF EXISTS `entityindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityindividual` (
  `objid` varchar(50) NOT NULL,
  `lastname` varchar(800) NOT NULL,
  `firstname` varchar(800) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `birthplace` varchar(255) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civilstatus` varchar(15) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `sss` varchar(25) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `acr` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `photo` mediumblob,
  `thumbnail` mediumblob,
  `profileid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_entityindividual_firstname` (`firstname`(255)),
  KEY `ix_entityindividual_lastname` (`lastname`(255)),
  KEY `ix_lastname` (`lastname`(255)),
  KEY `ix_lfname` (`lastname`(255),`firstname`(255)),
  KEY `ix_profileid` (`profileid`),
  CONSTRAINT `fk_entityindividual_profileid` FOREIGN KEY (`profileid`) REFERENCES `entityprofile` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityjuridical`
--

DROP TABLE IF EXISTS `entityjuridical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityjuridical` (
  `objid` varchar(50) NOT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `dtregistered` datetime DEFAULT NULL,
  `orgtype` varchar(25) DEFAULT NULL,
  `nature` varchar(50) DEFAULT NULL,
  `placeregistered` varchar(100) DEFAULT NULL,
  `administrator_name` varchar(100) DEFAULT NULL,
  `administrator_address_text` varchar(100) DEFAULT NULL,
  `administrator_position` varchar(50) DEFAULT NULL,
  `administrator_objid` varchar(50) DEFAULT NULL,
  `administrator_address_objid` varchar(50) DEFAULT NULL,
  `administrator_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_administrator_name` (`administrator_name`),
  KEY `ix_administrator_objid` (`administrator_objid`),
  KEY `ix_adminstrator_address_objid` (`administrator_address_objid`),
  KEY `ix_tin` (`tin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitymember`
--

DROP TABLE IF EXISTS `entitymember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(11) NOT NULL,
  `prefix` varchar(25) DEFAULT NULL,
  `member_objid` varchar(50) NOT NULL,
  `member_name` varchar(800) NOT NULL,
  `member_address` varchar(255) DEFAULT NULL,
  `suffix` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `member_address_text` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_entitymember_entity` (`entityid`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_member_objid` (`member_objid`),
  KEY `ix_taxpayer_name` (`member_name`(255)),
  KEY `ix_taxpayer_objid` (`member_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitymultiple`
--

DROP TABLE IF EXISTS `entitymultiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymultiple` (
  `objid` varchar(50) NOT NULL,
  `fullname` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityprofile`
--

DROP TABLE IF EXISTS `entityprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityprofile` (
  `objid` varchar(50) NOT NULL,
  `idno` varchar(50) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `middlename` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` longtext,
  `defaultentityid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_defaultentityid` (`defaultentityid`),
  KEY `ix_firstname` (`firstname`),
  KEY `ix_idno` (`idno`),
  KEY `ix_lastname` (`lastname`),
  KEY `ix_lfname` (`lastname`,`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examiner_finding`
--

DROP TABLE IF EXISTS `examiner_finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examiner_finding` (
  `objid` varchar(50) NOT NULL,
  `findings` longtext,
  `parent_objid` varchar(50) DEFAULT NULL,
  `dtinspected` date DEFAULT NULL,
  `recommendations` varchar(500) DEFAULT NULL,
  `inspectors` varchar(500) DEFAULT NULL,
  `notedby` varchar(100) DEFAULT NULL,
  `notedbytitle` varchar(50) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `inspectedby_objid` varchar(50) DEFAULT NULL,
  `inspectedby_name` varchar(100) DEFAULT NULL,
  `inspectedby_title` varchar(50) DEFAULT NULL,
  `doctype` varchar(50) DEFAULT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_txnno` (`txnno`),
  KEY `ix_dtinspected` (`dtinspected`),
  KEY `ix_examiner_finding_inspectedby_objid` (`inspectedby_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exemptiontype`
--

DROP TABLE IF EXISTS `exemptiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemptiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_exemptiontype_code` (`code`),
  UNIQUE KEY `ux_exemptiontype_name` (`name`),
  KEY `ix_exemptiontype_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas`
--

DROP TABLE IF EXISTS `faas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rpuid` varchar(50) DEFAULT NULL,
  `datacapture` int(11) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `utdno` varchar(25) NOT NULL,
  `tdno` varchar(25) DEFAULT NULL,
  `txntype_objid` varchar(10) DEFAULT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `titletype` varchar(10) DEFAULT NULL,
  `titleno` varchar(50) DEFAULT NULL,
  `titledate` datetime DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `owner_name` longtext,
  `owner_address` varchar(150) DEFAULT NULL,
  `administrator_objid` varchar(50) DEFAULT NULL,
  `administrator_name` varchar(800) DEFAULT NULL,
  `administrator_address` varchar(150) DEFAULT NULL,
  `beneficiary_objid` varchar(50) DEFAULT NULL,
  `beneficiary_name` varchar(150) DEFAULT NULL,
  `beneficiary_address` varchar(150) DEFAULT NULL,
  `memoranda` longtext,
  `cancelnote` varchar(250) DEFAULT NULL,
  `restrictionid` varchar(50) DEFAULT NULL,
  `backtaxyrs` int(11) NOT NULL,
  `prevtdno` varchar(800) DEFAULT NULL,
  `prevpin` varchar(500) DEFAULT NULL,
  `prevowner` longtext,
  `prevav` varchar(200) DEFAULT NULL,
  `prevmv` varchar(200) DEFAULT NULL,
  `cancelreason` varchar(5) DEFAULT NULL,
  `canceldate` date DEFAULT NULL,
  `cancelledbytdnos` longtext,
  `lguid` varchar(50) NOT NULL,
  `txntimestamp` varchar(20) DEFAULT NULL,
  `cancelledtimestamp` varchar(25) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dtapproved` date DEFAULT NULL,
  `realpropertyid` varchar(50) DEFAULT NULL,
  `lgutype` varchar(25) DEFAULT NULL,
  `signatories` longtext,
  `ryordinanceno` varchar(25) DEFAULT NULL,
  `ryordinancedate` date DEFAULT NULL,
  `prevareaha` varchar(200) DEFAULT NULL,
  `prevareasqm` varchar(200) DEFAULT NULL,
  `preveffectivity` varchar(15) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `cancelledyear` int(11) DEFAULT NULL,
  `cancelledqtr` int(11) DEFAULT NULL,
  `cancelledmonth` int(11) DEFAULT NULL,
  `cancelledday` int(11) DEFAULT NULL,
  `fullpin` varchar(35) DEFAULT NULL,
  `prevadministrator` varchar(500) DEFAULT NULL,
  `originlguid` varchar(50) DEFAULT NULL,
  `parentfaasid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faas_utdno` (`utdno`),
  KEY `FK_faas_entity` (`taxpayer_objid`),
  KEY `FK_faas_entity_admin` (`administrator_objid`),
  KEY `FK_faas_entity_beneficiary` (`beneficiary_objid`),
  KEY `FK_faas_rpu` (`rpuid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_faas_administratorname` (`administrator_name`(255)),
  KEY `ix_faas_appraisedby` (`objid`),
  KEY `ix_faas_beneficiary` (`beneficiary_name`),
  KEY `ix_faas_canceldate` (`canceldate`),
  KEY `ix_faas_cancelledtimestamp` (`cancelledtimestamp`),
  KEY `ix_faas_cancelledyear` (`cancelledyear`),
  KEY `ix_faas_cancelledyear_qtr` (`cancelledyear`,`cancelledqtr`),
  KEY `ix_faas_cancelledyear_qtr_month` (`cancelledyear`,`cancelledqtr`,`cancelledmonth`),
  KEY `ix_faas_cancelledyear_qtr_month_day` (`cancelledyear`,`cancelledqtr`,`cancelledmonth`,`cancelledday`),
  KEY `ix_faas_fullpin` (`fullpin`),
  KEY `ix_faas_name` (`name`),
  KEY `ix_faas_prevpin` (`prevpin`(255)),
  KEY `ix_faas_prevtdno` (`prevtdno`(255)),
  KEY `ix_faas_realproperty` (`realpropertyid`),
  KEY `ix_faas_restrictionid` (`restrictionid`),
  KEY `ix_faas_state` (`state`),
  KEY `ix_faas_tdno` (`tdno`),
  KEY `ix_faas_titleno` (`titleno`),
  KEY `ix_faas_year` (`year`),
  KEY `ix_faas_year_qtr` (`year`,`qtr`),
  KEY `ix_faas_year_qtr_month` (`year`,`qtr`,`month`),
  KEY `ix_faas_year_qtr_month_day` (`year`,`qtr`,`month`,`day`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_prevtdno` (`prevtdno`(255)),
  CONSTRAINT `FK_faas_rpu` FOREIGN KEY (`rpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_affectedrpu`
--

DROP TABLE IF EXISTS `faas_affectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_affectedrpu` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  `newsuffix` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faasaffectedrpu_faasprevfaas` (`faasid`,`prevfaasid`),
  KEY `FK_faasaffectedrpu_faas` (`faasid`),
  KEY `FK_faasaffectedrpu_newfaas` (`newfaasid`),
  KEY `FK_faasaffectedrpu_prevfaas` (`prevfaasid`),
  CONSTRAINT `FK_faasaffectedrpu_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_faasaffectedrpu_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_faasaffectedrpu_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_list`
--

DROP TABLE IF EXISTS `faas_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_list` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `realpropertyid` varchar(50) NOT NULL,
  `datacapture` int(11) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(50) NOT NULL,
  `tdno` varchar(25) DEFAULT NULL,
  `utdno` varchar(25) NOT NULL,
  `prevtdno` varchar(800) DEFAULT NULL,
  `displaypin` varchar(35) NOT NULL,
  `pin` varchar(35) NOT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(5000) DEFAULT NULL,
  `owner_address` varchar(150) DEFAULT NULL,
  `administrator_name` varchar(150) DEFAULT NULL,
  `administrator_address` varchar(150) DEFAULT NULL,
  `rputype` varchar(10) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `barangay` varchar(75) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `classcode` varchar(20) DEFAULT NULL,
  `cadastrallotno` varchar(900) DEFAULT NULL,
  `blockno` varchar(100) DEFAULT NULL,
  `surveyno` varchar(255) DEFAULT NULL,
  `titleno` varchar(50) DEFAULT NULL,
  `totalareaha` decimal(16,6) NOT NULL,
  `totalareasqm` decimal(16,6) NOT NULL,
  `totalmv` decimal(16,2) NOT NULL,
  `totalav` decimal(16,2) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `cancelreason` varchar(15) DEFAULT NULL,
  `cancelledbytdnos` longtext,
  `lguid` varchar(50) NOT NULL,
  `originlguid` varchar(50) NOT NULL,
  `yearissued` int(11) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `taskstate` varchar(50) DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `trackingno` varchar(20) DEFAULT NULL,
  `publicland` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_faaslist_administrator_name` (`administrator_name`),
  KEY `ix_faaslist_assigneeid` (`assignee_objid`),
  KEY `ix_faaslist_barangay` (`barangay`),
  KEY `ix_faaslist_barangayid` (`barangayid`),
  KEY `ix_faaslist_blockno` (`blockno`),
  KEY `ix_faaslist_classcode` (`classcode`),
  KEY `ix_faaslist_classification_objid` (`classification_objid`),
  KEY `ix_faaslist_lguid` (`lguid`),
  KEY `ix_faaslist_originlguid` (`originlguid`),
  KEY `ix_faaslist_pin` (`pin`),
  KEY `ix_faaslist_publicland` (`publicland`),
  KEY `ix_faaslist_realpropertyid` (`realpropertyid`),
  KEY `ix_faaslist_rpuid` (`rpuid`),
  KEY `ix_faaslist_rputype` (`rputype`),
  KEY `ix_faaslist_ry` (`ry`),
  KEY `ix_faaslist_state` (`state`),
  KEY `ix_faaslist_surveyno` (`surveyno`),
  KEY `ix_faaslist_taskstate` (`taskstate`),
  KEY `ix_faaslist_taxpayer_objid` (`taxpayer_objid`),
  KEY `ix_faaslist_tdno` (`tdno`),
  KEY `ix_faaslist_titleno` (`titleno`),
  KEY `ix_faaslist_trackingno` (`trackingno`),
  KEY `ix_faaslist_txntype_objid` (`txntype_objid`),
  KEY `ix_faaslist_utdno` (`utdno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_previous`
--

DROP TABLE IF EXISTS `faas_previous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_previous` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) DEFAULT NULL,
  `prevrpuid` varchar(50) DEFAULT NULL,
  `prevtdno` longtext,
  `prevpin` longtext,
  `prevowner` longtext,
  `prevadministrator` longtext,
  `prevav` varchar(500) DEFAULT NULL,
  `prevmv` varchar(500) DEFAULT NULL,
  `prevareasqm` varchar(500) DEFAULT NULL,
  `prevareaha` varchar(500) DEFAULT NULL,
  `preveffectivity` varchar(15) DEFAULT NULL,
  `prevtaxability` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faas_previous_faas` (`faasid`),
  KEY `ix_faas_previous_pin` (`prevpin`(255)),
  KEY `ix_faas_previous_tdno` (`prevtdno`(255)),
  CONSTRAINT `FK_faas_previous_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_requested_series`
--

DROP TABLE IF EXISTS `faas_requested_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_requested_series` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `series` varchar(255) NOT NULL,
  `requestedby_name` varchar(255) NOT NULL,
  `requestedby_date` date NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `createdby_date` datetime NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_faas_requested_series_sys_sequence` (`parentid`),
  CONSTRAINT `fk_faas_requested_series_sys_sequence` FOREIGN KEY (`parentid`) REFERENCES `sys_sequence` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_restriction`
--

DROP TABLE IF EXISTS `faas_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_restriction` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `ledger_objid` varchar(50) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `restrictiontype_objid` varchar(50) NOT NULL,
  `txndate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `receipt_objid` varchar(50) DEFAULT NULL,
  `receipt_receiptno` varchar(15) DEFAULT NULL,
  `receipt_receiptdate` datetime DEFAULT NULL,
  `receipt_amount` decimal(16,2) DEFAULT NULL,
  `receipt_lastyearpaid` int(11) DEFAULT NULL,
  `receipt_lastqtrpaid` int(11) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(150) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `rpumaster_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_ledger_objid` (`ledger_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_receiptno` (`receipt_receiptno`),
  KEY `ix_restrictiontype_objid` (`restrictiontype_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `FK_faas_restriction_faas` FOREIGN KEY (`parent_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_restriction_type`
--

DROP TABLE IF EXISTS `faas_restriction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_restriction_type` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `idx` int(11) NOT NULL,
  `isother` int(11) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_signatory`
--

DROP TABLE IF EXISTS `faas_signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_signatory` (
  `objid` varchar(50) NOT NULL,
  `taxmapper_objid` varchar(50) DEFAULT NULL,
  `taxmapper_name` varchar(100) DEFAULT NULL,
  `taxmapper_title` varchar(50) DEFAULT NULL,
  `taxmapper_dtsigned` datetime DEFAULT NULL,
  `taxmapper_taskid` varchar(50) DEFAULT NULL,
  `taxmapperchief_objid` varchar(50) DEFAULT NULL,
  `taxmapperchief_name` varchar(100) DEFAULT NULL,
  `taxmapperchief_title` varchar(50) DEFAULT NULL,
  `taxmapperchief_dtsigned` datetime DEFAULT NULL,
  `taxmapperchief_taskid` varchar(50) DEFAULT NULL,
  `appraiser_objid` varchar(50) DEFAULT NULL,
  `appraiser_name` varchar(100) DEFAULT NULL,
  `appraiser_title` varchar(50) DEFAULT NULL,
  `appraiser_dtsigned` datetime DEFAULT NULL,
  `appraiser_taskid` varchar(50) DEFAULT NULL,
  `appraiserchief_objid` varchar(50) DEFAULT NULL,
  `appraiserchief_name` varchar(100) DEFAULT NULL,
  `appraiserchief_title` varchar(50) DEFAULT NULL,
  `appraiserchief_dtsigned` datetime DEFAULT NULL,
  `appraiserchief_taskid` varchar(50) DEFAULT NULL,
  `recommender_objid` varchar(50) DEFAULT NULL,
  `recommender_name` varchar(100) DEFAULT NULL,
  `recommender_title` varchar(50) DEFAULT NULL,
  `recommender_dtsigned` datetime DEFAULT NULL,
  `recommender_taskid` varchar(50) DEFAULT NULL,
  `provtaxmapper_objid` varchar(50) DEFAULT NULL,
  `provtaxmapper_name` varchar(100) DEFAULT NULL,
  `provtaxmapper_title` varchar(50) DEFAULT NULL,
  `provtaxmapper_dtsigned` datetime DEFAULT NULL,
  `provtaxmapper_taskid` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_objid` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_name` varchar(100) DEFAULT NULL,
  `provtaxmapperchief_title` varchar(50) DEFAULT NULL,
  `provtaxmapperchief_dtsigned` datetime DEFAULT NULL,
  `provtaxmapperchief_taskid` varchar(50) DEFAULT NULL,
  `provappraiser_objid` varchar(50) DEFAULT NULL,
  `provappraiser_name` varchar(100) DEFAULT NULL,
  `provappraiser_title` varchar(50) DEFAULT NULL,
  `provappraiser_dtsigned` datetime DEFAULT NULL,
  `provappraiser_taskid` varchar(50) DEFAULT NULL,
  `provappraiserchief_objid` varchar(50) DEFAULT NULL,
  `provappraiserchief_name` varchar(100) DEFAULT NULL,
  `provappraiserchief_title` varchar(50) DEFAULT NULL,
  `provappraiserchief_dtsigned` datetime DEFAULT NULL,
  `provappraiserchief_taskid` varchar(50) DEFAULT NULL,
  `approver_objid` varchar(50) DEFAULT NULL,
  `approver_name` varchar(100) DEFAULT NULL,
  `approver_title` varchar(50) DEFAULT NULL,
  `approver_dtsigned` datetime DEFAULT NULL,
  `approver_taskid` varchar(50) DEFAULT NULL,
  `provapprover_objid` varchar(50) DEFAULT NULL,
  `provapprover_name` varchar(100) DEFAULT NULL,
  `provapprover_title` varchar(75) DEFAULT NULL,
  `provapprover_dtsigned` datetime DEFAULT NULL,
  `provapprover_taskid` varchar(50) DEFAULT NULL,
  `provrecommender_objid` varchar(50) DEFAULT NULL,
  `provrecommender_name` varchar(100) DEFAULT NULL,
  `provrecommender_title` varchar(50) DEFAULT NULL,
  `provrecommender_dtsigned` datetime DEFAULT NULL,
  `provrecommender_taskid` varchar(50) DEFAULT NULL,
  `reviewer_objid` varchar(50) DEFAULT NULL,
  `reviewer_name` varchar(100) DEFAULT NULL,
  `reviewer_title` varchar(75) DEFAULT NULL,
  `reviewer_dtsigned` datetime DEFAULT NULL,
  `reviewer_taskid` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_faas_faas_signatory` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_sketch`
--

DROP TABLE IF EXISTS `faas_sketch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_sketch` (
  `objid` varchar(50) NOT NULL,
  `drawing` longtext NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faas_sketch_faas` (`objid`),
  CONSTRAINT `FK_faas_sketch_faas` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_stewardship`
--

DROP TABLE IF EXISTS `faas_stewardship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_stewardship` (
  `objid` varchar(50) NOT NULL,
  `rpumasterid` varchar(50) NOT NULL,
  `stewardrpumasterid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `stewardshipno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faas_stewardship` (`rpumasterid`,`stewardrpumasterid`,`ry`,`stewardshipno`),
  KEY `ix_faas_stewardship_rpumasterid` (`rpumasterid`),
  KEY `ix_faas_stewardship_stewardrpumasterid` (`stewardrpumasterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_task`
--

DROP TABLE IF EXISTS `faas_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype`
--

DROP TABLE IF EXISTS `faas_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `newledger` int(11) NOT NULL,
  `newrpu` int(11) NOT NULL,
  `newrealproperty` int(11) NOT NULL,
  `displaycode` varchar(10) DEFAULT NULL,
  `allowEditOwner` int(11) DEFAULT NULL,
  `allowEditPin` int(11) DEFAULT NULL,
  `allowEditPinInfo` int(11) DEFAULT NULL,
  `allowEditAppraisal` int(11) DEFAULT NULL,
  `opener` varchar(50) DEFAULT NULL,
  `checkbalance` int(11) DEFAULT NULL,
  `reconcileledger` int(11) DEFAULT NULL,
  `allowannotated` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype_attribute`
--

DROP TABLE IF EXISTS `faas_txntype_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype_attribute` (
  `txntype_objid` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`attribute`,`txntype_objid`),
  KEY `FK_faas_txntype_attribute_type` (`attribute`),
  KEY `FK_faas_txntype_attribute` (`txntype_objid`),
  CONSTRAINT `FK_faas_txntype_attribute_type` FOREIGN KEY (`attribute`) REFERENCES `faas_txntype_attribute_type` (`attribute`),
  CONSTRAINT `FK_faas_txntype_attribute` FOREIGN KEY (`txntype_objid`) REFERENCES `faas_txntype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype_attribute_type`
--

DROP TABLE IF EXISTS `faas_txntype_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype_attribute_type` (
  `attribute` varchar(50) NOT NULL,
  PRIMARY KEY (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasannotation`
--

DROP TABLE IF EXISTS `faasannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `annotationtype_objid` varchar(50) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `fileno` varchar(25) NOT NULL,
  `orno` varchar(10) NOT NULL,
  `ordate` datetime NOT NULL,
  `oramount` decimal(10,0) NOT NULL,
  `memoranda` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_faasannotation_faas` (`faasid`),
  KEY `FK_faasannotation_faasannotationtype` (`annotationtype_objid`),
  KEY `ix_faasannotation_fileno` (`fileno`),
  KEY `ix_faasannotation_orno` (`orno`),
  KEY `ix_faasannotation_state` (`state`),
  KEY `ix_faasannotation_txnno` (`txnno`),
  CONSTRAINT `FK_faasannotation_faasannotationtype` FOREIGN KEY (`annotationtype_objid`) REFERENCES `faasannotationtype` (`objid`),
  CONSTRAINT `FK_faasannotation_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasannotation_faas`
--

DROP TABLE IF EXISTS `faasannotation_faas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasannotation_faas` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parent_faas` (`parent_objid`,`faas_objid`),
  KEY `ix_faas_objid` (`faas_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  CONSTRAINT `fk_faasannotationfaas_faasannotation` FOREIGN KEY (`parent_objid`) REFERENCES `faasannotation` (`objid`),
  CONSTRAINT `fk_faasannotationfaas_faas` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasannotationtype`
--

DROP TABLE IF EXISTS `faasannotationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasannotationtype` (
  `objid` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `annotationtype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasbacktax`
--

DROP TABLE IF EXISTS `faasbacktax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasbacktax` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `tdno` varchar(25) DEFAULT NULL,
  `bmv` decimal(10,0) NOT NULL,
  `mv` decimal(10,0) NOT NULL,
  `av` decimal(10,0) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `taxable` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faasbacktax` (`faasid`),
  CONSTRAINT `FK_faasbacktax` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasupdate`
--

DROP TABLE IF EXISTS `faasupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasupdate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevtitletype` varchar(25) DEFAULT NULL,
  `prevtitleno` varchar(25) DEFAULT NULL,
  `prevtitledate` datetime DEFAULT NULL,
  `prevtaxpayerid` varchar(50) NOT NULL,
  `prevtaxpayername` varchar(800) NOT NULL,
  `prevtaxpayeraddress` varchar(150) NOT NULL,
  `prevownername` varchar(800) NOT NULL,
  `prevowneraddress` varchar(150) NOT NULL,
  `prevadministratorid` varchar(50) DEFAULT NULL,
  `prevadministratorname` varchar(150) DEFAULT NULL,
  `prevadministratoraddress` varchar(100) DEFAULT NULL,
  `prevrestrictionid` varchar(50) DEFAULT NULL,
  `prevmemoranda` varchar(500) NOT NULL,
  `prevsurveyno` varchar(100) DEFAULT NULL,
  `prevcadastrallotno` varchar(100) NOT NULL,
  `prevblockno` varchar(50) DEFAULT NULL,
  `prevpurok` varchar(50) DEFAULT NULL,
  `prevstreet` varchar(100) DEFAULT NULL,
  `prevnorth` varchar(150) NOT NULL,
  `preveast` varchar(150) NOT NULL,
  `prevsouth` varchar(150) NOT NULL,
  `prevwest` varchar(150) NOT NULL,
  `faas_titletype` varchar(25) DEFAULT NULL,
  `faas_titleno` varchar(25) DEFAULT NULL,
  `faas_titledate` datetime DEFAULT NULL,
  `faas_restrictionid` varchar(50) DEFAULT NULL,
  `faas_memoranda` varchar(500) NOT NULL,
  `rp_surveyno` varchar(100) DEFAULT NULL,
  `rp_cadastrallotno` varchar(100) NOT NULL,
  `rp_blockno` varchar(50) DEFAULT NULL,
  `rp_street` varchar(100) DEFAULT NULL,
  `rp_north` varchar(150) NOT NULL,
  `rp_east` varchar(150) NOT NULL,
  `rp_south` varchar(150) NOT NULL,
  `rp_west` varchar(150) NOT NULL,
  `faas_taxpayer_objid` varchar(50) NOT NULL,
  `faas_taxpayer_name` varchar(800) NOT NULL,
  `faas_taxpayer_address` varchar(150) NOT NULL,
  `faas_owner_address` varchar(800) NOT NULL,
  `faas_owner_name` varchar(800) NOT NULL,
  `faas_administrator_name` varchar(200) DEFAULT NULL,
  `faas_administrator_objid` varchar(50) DEFAULT NULL,
  `faas_administrator_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faasupdate_txnno` (`txnno`),
  KEY `FK_faasupdate_faas` (`faasid`),
  CONSTRAINT `FK_faasupdate_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `special` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `depositoryfundid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_code` (`code`),
  KEY `ix_depositoryfundid` (`depositoryfundid`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_state` (`state`),
  KEY `ix_title` (`title`),
  CONSTRAINT `fk_depositoryfundid_depositoryfundid` FOREIGN KEY (`depositoryfundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fundgroup`
--

DROP TABLE IF EXISTS `fundgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fundgroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `indexno` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `government_property`
--

DROP TABLE IF EXISTS `government_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government_property` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(255) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `dow` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_ledger`
--

DROP TABLE IF EXISTS `income_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NOT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_income_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`),
  CONSTRAINT `fk_income_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_summary`
--

DROP TABLE IF EXISTS `income_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_summary` (
  `refid` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `orgid` varchar(50) NOT NULL,
  `collectorid` varchar(50) DEFAULT NULL,
  `refyear` int(11) DEFAULT NULL,
  `refmonth` int(11) DEFAULT NULL,
  `refqtr` int(11) DEFAULT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `remittancedate` date NOT NULL,
  `remittanceyear` int(11) DEFAULT NULL,
  `remittancemonth` int(11) DEFAULT NULL,
  `remittanceqtr` int(11) DEFAULT NULL,
  `liquidationid` varchar(50) NOT NULL,
  `liquidationdate` date DEFAULT NULL,
  `liquidationyear` int(11) DEFAULT NULL,
  `liquidationmonth` int(11) DEFAULT NULL,
  `liquidationqtr` int(11) DEFAULT NULL,
  PRIMARY KEY (`acctid`,`fundid`,`liquidationid`,`orgid`,`refdate`,`refid`,`remittancedate`,`remittanceid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_collectorid` (`collectorid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_liquidationdate` (`liquidationdate`),
  KEY `ix_liquidationid` (`liquidationid`),
  KEY `ix_liquidationmonth` (`liquidationmonth`),
  KEY `ix_liquidationqtr` (`liquidationqtr`),
  KEY `ix_liquidationyear` (`liquidationyear`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refmonth` (`refmonth`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refqtr` (`refqtr`),
  KEY `ix_refyear` (`refyear`),
  KEY `ix_remittancedate` (`remittancedate`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_remittancemonth` (`remittancemonth`),
  KEY `ix_remittanceqtr` (`remittanceqtr`),
  KEY `ix_remittanceyear` (`remittanceyear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interfund_transfer_ledger`
--

DROP TABLE IF EXISTS `interfund_transfer_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfund_transfer_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `itemacctid` varchar(50) DEFAULT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_interfund_transfer_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemaccount`
--

DROP TABLE IF EXISTS `itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(16,2) DEFAULT NULL,
  `valuetype` varchar(10) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `generic` int(11) DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `hidefromlookup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `ix_code` (`code`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_generic` (`generic`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_state` (`state`),
  KEY `ix_title` (`title`),
  KEY `ix_type` (`type`),
  CONSTRAINT `fk_itemaccount_parentid` FOREIGN KEY (`parentid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemaccount_tag`
--

DROP TABLE IF EXISTS `itemaccount_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount_tag` (
  `acctid` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `objid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_acctid_tag` (`acctid`,`tag`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_tag` (`tag`),
  CONSTRAINT `itemaccount_tag_itemaccount` FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jev`
--

DROP TABLE IF EXISTS `jev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jev` (
  `objid` varchar(150) NOT NULL,
  `jevno` varchar(50) DEFAULT NULL,
  `jevdate` date DEFAULT NULL,
  `fundid` varchar(50) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `verifiedby_objid` varchar(50) DEFAULT NULL,
  `verifiedby_name` varchar(255) DEFAULT NULL,
  `dtverified` datetime DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchid` (`batchid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_dtverified` (`dtverified`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_jevdate` (`jevdate`),
  KEY `ix_jevno` (`jevno`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_verifiedby_objid` (`verifiedby_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jevitem`
--

DROP TABLE IF EXISTS `jevitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jevitem` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NOT NULL,
  `accttype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `acctcode` varchar(32) DEFAULT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `itemrefid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctcode` (`acctcode`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_acctname` (`acctname`),
  KEY `ix_itemrefid` (`itemrefid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_ledgertype` (`accttype`),
  CONSTRAINT `fk_jevitem_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustment`
--

DROP TABLE IF EXISTS `landadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustment` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) DEFAULT NULL,
  `landdetailid` varchar(50) DEFAULT NULL,
  `adjustmenttype_objid` varchar(50) NOT NULL,
  `expr` varchar(250) NOT NULL,
  `adjustment` decimal(16,2) DEFAULT '0.00',
  `type` varchar(2) NOT NULL,
  `basemarketvalue` decimal(16,2) DEFAULT NULL,
  `marketvalue` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustment_landadjustmenttype` (`adjustmenttype_objid`),
  KEY `FK_landadjustment_landdetail` (`landdetailid`),
  KEY `FK_landadjustment_landrpu` (`landrpuid`),
  CONSTRAINT `FK_landadjustment_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_landadjustment_landadjustmenttype` FOREIGN KEY (`adjustmenttype_objid`) REFERENCES `landadjustmenttype` (`objid`),
  CONSTRAINT `FK_landadjustment_landdetail` FOREIGN KEY (`landdetailid`) REFERENCES `landdetail` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmentparameter`
--

DROP TABLE IF EXISTS `landadjustmentparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmentparameter` (
  `objid` varchar(50) NOT NULL,
  `landadjustmentid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `parameter_objid` varchar(50) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `param_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustmentparameter_landadjustment` (`landadjustmentid`),
  KEY `FK_landadjustmentparameter_landrpu` (`landrpuid`),
  KEY `FK_landadjustmentparameter_rptparameter` (`parameter_objid`),
  CONSTRAINT `FK_landadjustmentparameter_rptparameter` FOREIGN KEY (`parameter_objid`) REFERENCES `rptparameter` (`objid`),
  CONSTRAINT `FK_landadjustmentparameter_landadjustment` FOREIGN KEY (`landadjustmentid`) REFERENCES `landadjustment` (`objid`),
  CONSTRAINT `FK_landadjustmentparameter_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmenttype`
--

DROP TABLE IF EXISTS `landadjustmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmenttype` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expr` longtext NOT NULL,
  `appliedto` varchar(150) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustment_landrysetting` (`landrysettingid`),
  KEY `ix_landadjustmenttype` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_landadjustment_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmenttype_classification`
--

DROP TABLE IF EXISTS `landadjustmenttype_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmenttype_classification` (
  `landadjustmenttypeid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY (`classification_objid`,`landadjustmenttypeid`),
  KEY `FK_landadjustment_classification_landrysetting` (`landrysettingid`),
  KEY `FK_landadjustmenttype_classification_classification` (`classification_objid`),
  KEY `FK_landadjustmenttype_landadjustment` (`landadjustmenttypeid`),
  CONSTRAINT `FK_landadjustmenttype_landadjustment` FOREIGN KEY (`landadjustmenttypeid`) REFERENCES `landadjustmenttype` (`objid`),
  CONSTRAINT `FK_landadjustmenttype_classification_classification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landassesslevel`
--

DROP TABLE IF EXISTS `landassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landassesslevel` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_landassesslevel_code` (`landrysettingid`,`code`),
  UNIQUE KEY `ux_landassesslevel_name` (`landrysettingid`,`name`),
  KEY `FK_landassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_landassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_landassesslevl_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `FK_landassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landassesslevelrange`
--

DROP TABLE IF EXISTS `landassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `landassesslevelid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landassesslevelrange_landassesslevel` (`landassesslevelid`),
  KEY `ix_landassesslevelrange_rootid` (`landrysettingid`),
  CONSTRAINT `FK_landassesslevel_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `FK_landassesslevelrange_landassesslevel` FOREIGN KEY (`landassesslevelid`) REFERENCES `landassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landdetail`
--

DROP TABLE IF EXISTS `landdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landdetail` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `subclass_objid` varchar(50) DEFAULT NULL,
  `specificclass_objid` varchar(50) DEFAULT NULL,
  `actualuse_objid` varchar(50) DEFAULT NULL,
  `stripping_objid` varchar(50) DEFAULT NULL,
  `striprate` decimal(10,0) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `addlinfo` varchar(250) DEFAULT NULL,
  `area` decimal(10,0) NOT NULL,
  `areasqm` decimal(10,0) NOT NULL,
  `areaha` decimal(10,0) NOT NULL,
  `basevalue` decimal(10,0) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `taxable` int(11) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `adjustment` decimal(10,0) NOT NULL,
  `landvalueadjustment` decimal(10,0) NOT NULL,
  `actualuseadjustment` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `landspecificclass_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landdetail_actualuse` (`actualuse_objid`),
  KEY `FK_landdetail_landrpu` (`landrpuid`),
  KEY `FK_landdetail_lcuvspecificclass` (`specificclass_objid`),
  KEY `FK_landdetail_lcuvstripping` (`stripping_objid`),
  KEY `FK_landdetail_lcuvsubclass` (`subclass_objid`),
  CONSTRAINT `FK_landdetail_lcuvsubclass` FOREIGN KEY (`subclass_objid`) REFERENCES `lcuvsubclass` (`objid`),
  CONSTRAINT `FK_landdetail_actualuse` FOREIGN KEY (`actualuse_objid`) REFERENCES `landassesslevel` (`objid`),
  CONSTRAINT `FK_landdetail_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_landdetail_lcuvspecificclass` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landrpu`
--

DROP TABLE IF EXISTS `landrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landrpu` (
  `objid` varchar(50) NOT NULL,
  `idleland` int(11) NOT NULL,
  `totallandbmv` decimal(10,0) NOT NULL,
  `totallandmv` decimal(10,0) NOT NULL,
  `totallandav` decimal(10,0) NOT NULL,
  `totalplanttreebmv` decimal(10,0) NOT NULL,
  `totalplanttreemv` decimal(10,0) NOT NULL,
  `totalplanttreeadjustment` decimal(10,0) NOT NULL,
  `totalplanttreeav` decimal(10,0) NOT NULL,
  `landvalueadjustment` decimal(10,0) NOT NULL,
  `publicland` int(11) DEFAULT NULL,
  `distanceawr` decimal(16,2) DEFAULT NULL,
  `distanceltc` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_landrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landrysetting`
--

DROP TABLE IF EXISTS `landrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `appliedto` varchar(500) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `ordinanceno` varchar(25) DEFAULT NULL,
  `ordinancedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_landrysetting_previd` (`previd`),
  KEY `ix_landrysetting_ry` (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landspecificclass`
--

DROP TABLE IF EXISTS `landspecificclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landspecificclass` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ux_landspecificclass_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landtax_lgu_account_mapping`
--

DROP TABLE IF EXISTS `landtax_lgu_account_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landtax_lgu_account_mapping` (
  `objid` varchar(50) NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  KEY `fk_landtaxlguaccountmapping_itemaccount` (`item_objid`),
  KEY `fk_landtaxlguaccountmapping_sysorg` (`lgu_objid`),
  KEY `ix_objid` (`objid`),
  KEY `ix_revtype` (`revtype`),
  CONSTRAINT `fk_landtaxlguaccountmapping_sysorg` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `fk_landtaxlguaccountmapping_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landtax_report_rptdelinquency`
--

DROP TABLE IF EXISTS `landtax_report_rptdelinquency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landtax_report_rptdelinquency` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) DEFAULT NULL,
  `revtype` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `dtgenerated` datetime NOT NULL,
  `generatedby_name` varchar(255) NOT NULL,
  `generatedby_title` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvspecificclass`
--

DROP TABLE IF EXISTS `lcuvspecificclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvspecificclass` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `landspecificclass_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lcuvspecificclass_landrysetting` (`landrysettingid`),
  KEY `FK_lcuvspecificclass_propertyclassification` (`classification_objid`),
  KEY `ix_landspecificclass_objid` (`landspecificclass_objid`),
  KEY `ix_lcuvspecificclass_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_lcuvspecificclass_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_lcuvspecificclass_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `fk_lcuvspecificclass_landspecificclass` FOREIGN KEY (`landspecificclass_objid`) REFERENCES `landspecificclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvstripping`
--

DROP TABLE IF EXISTS `lcuvstripping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvstripping` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `striplevel` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lcuvstripping_landrysetting` (`landrysettingid`),
  KEY `FK_lcuvstripping_propertyclassification` (`classification_objid`),
  KEY `ix_lcuvstripping_previd` (`previd`),
  CONSTRAINT `FK_lcuvstripping_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_lcuvstripping_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvsubclass`
--

DROP TABLE IF EXISTS `lcuvsubclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvsubclass` (
  `objid` varchar(50) NOT NULL,
  `specificclass_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_lcuvsubclass_code` (`landrysettingid`,`specificclass_objid`,`code`),
  UNIQUE KEY `ux_lcuvsubclass_name` (`landrysettingid`,`specificclass_objid`,`code`,`name`),
  KEY `FK_lcuvsubclass_lcuvspecificclass` (`specificclass_objid`),
  KEY `ix_lcuvsubclass_previd` (`previd`),
  KEY `ix_lcuvsubclass_rootid` (`landrysettingid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_lcuvsubclass_lcuvspecificclass` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`),
  CONSTRAINT `FK_lcuvsubclass_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lob`
--

DROP TABLE IF EXISTS `lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `_psic` varchar(255) DEFAULT NULL,
  `_psic_objid` varchar(50) DEFAULT NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  `psicid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_name` (`name`,`_ukey`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_name` (`name`),
  KEY `ix_psic` (`_psic`),
  KEY `ix_psic_objid` (`_psic_objid`),
  CONSTRAINT `lob_classification_objid_ibfk_1` FOREIGN KEY (`classification_objid`) REFERENCES `lobclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lob_lobattribute`
--

DROP TABLE IF EXISTS `lob_lobattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob_lobattribute` (
  `lobid` varchar(50) NOT NULL,
  `lobattributeid` varchar(50) NOT NULL,
  PRIMARY KEY (`lobattributeid`,`lobid`),
  KEY `lobattributeid` (`lobattributeid`),
  KEY `lob_lobattribute_ibfk_1` (`lobid`),
  CONSTRAINT `lob_lobattribute_ibfk_2` FOREIGN KEY (`lobattributeid`) REFERENCES `lobattribute` (`objid`),
  CONSTRAINT `lob_lobattribute_ibfk_1` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lob_report_category`
--

DROP TABLE IF EXISTS `lob_report_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob_report_category` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `itemtype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_lob_report_category_groupid` FOREIGN KEY (`groupid`) REFERENCES `lob_report_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lob_report_category_mapping`
--

DROP TABLE IF EXISTS `lob_report_category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob_report_category_mapping` (
  `objid` varchar(50) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `categoryid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_categoryid` (`categoryid`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `fk_lob_report_category_mapping_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `lob_report_category` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lob_report_group`
--

DROP TABLE IF EXISTS `lob_report_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob_report_group` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lobattribute`
--

DROP TABLE IF EXISTS `lobattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobattribute` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lobclassification`
--

DROP TABLE IF EXISTS `lobclassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machassesslevel`
--

DROP TABLE IF EXISTS `machassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machassesslevel` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machassesslevel_settingcode` (`machrysettingid`,`code`),
  UNIQUE KEY `ux_machassesslevel_settingname` (`machrysettingid`,`name`),
  KEY `FK_machassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_machassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_machassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_machassesslevel_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machassesslevelrange`
--

DROP TABLE IF EXISTS `machassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `machassesslevelid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machassesslevelrange_mvfrom` (`machrysettingid`,`machassesslevelid`,`mvfrom`),
  KEY `FK_machassesslevelrange_machassesslevel` (`machassesslevelid`),
  CONSTRAINT `FK_machassesslevelrange_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`),
  CONSTRAINT `FK_machassesslevelrange_machassesslevel` FOREIGN KEY (`machassesslevelid`) REFERENCES `machassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machdetail`
--

DROP TABLE IF EXISTS `machdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machdetail` (
  `objid` varchar(50) NOT NULL,
  `machuseid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `machine_objid` varchar(50) NOT NULL,
  `operationyear` int(11) DEFAULT NULL,
  `replacementcost` decimal(10,0) NOT NULL,
  `depreciation` decimal(16,6) DEFAULT NULL,
  `depreciationvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `yearacquired` int(11) DEFAULT NULL,
  `estimatedlife` int(11) DEFAULT NULL,
  `remaininglife` int(11) DEFAULT NULL,
  `yearinstalled` int(11) DEFAULT NULL,
  `yearsused` int(11) DEFAULT NULL,
  `originalcost` decimal(10,0) NOT NULL,
  `freightcost` decimal(10,0) NOT NULL,
  `insurancecost` decimal(10,0) NOT NULL,
  `installationcost` decimal(10,0) NOT NULL,
  `brokeragecost` decimal(10,0) NOT NULL,
  `arrastrecost` decimal(10,0) NOT NULL,
  `othercost` decimal(10,0) NOT NULL,
  `acquisitioncost` decimal(10,0) NOT NULL,
  `feracid` varchar(50) DEFAULT NULL,
  `ferac` decimal(10,0) DEFAULT NULL,
  `forexid` varchar(50) DEFAULT NULL,
  `forex` decimal(10,0) DEFAULT NULL,
  `residualrate` decimal(10,0) NOT NULL,
  `conversionfactor` decimal(10,0) NOT NULL,
  `swornamount` decimal(10,0) NOT NULL,
  `useswornamount` int(11) NOT NULL,
  `imported` int(11) NOT NULL,
  `newlyinstalled` int(11) NOT NULL,
  `autodepreciate` int(11) NOT NULL,
  `taxable` int(11) DEFAULT NULL,
  `smvid` varchar(50) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`objid`),
  KEY `FK_machdetail_machforex` (`feracid`),
  KEY `FK_machdetail_machforexid` (`forexid`),
  KEY `FK_machdetail_machine` (`machine_objid`),
  KEY `FK_machdetail_machrpu` (`machrpuid`),
  KEY `FK_machdetail_machuse` (`machuseid`),
  KEY `ix_smvid` (`smvid`),
  CONSTRAINT `FK_machdetail_machuse` FOREIGN KEY (`machuseid`) REFERENCES `machuse` (`objid`),
  CONSTRAINT `FK_machdetail_machforex` FOREIGN KEY (`feracid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `FK_machdetail_machforexid` FOREIGN KEY (`forexid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `FK_machdetail_machine` FOREIGN KEY (`machine_objid`) REFERENCES `machine` (`objid`),
  CONSTRAINT `fk_machdetail_machine_smv` FOREIGN KEY (`smvid`) REFERENCES `machine_smv` (`objid`),
  CONSTRAINT `FK_machdetail_machrpu` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machforex`
--

DROP TABLE IF EXISTS `machforex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machforex` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `forex` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machforex_settingyear` (`machrysettingid`,`year`),
  KEY `ix_machforex_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_machforex_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machine_code` (`code`),
  UNIQUE KEY `ux_machine_name` (`name`),
  KEY `ix_machine_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_smv`
--

DROP TABLE IF EXISTS `machine_smv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_smv` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `machine_objid` varchar(50) NOT NULL,
  `expr` varchar(255) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parent_machine` (`parent_objid`,`machine_objid`),
  KEY `ix_machine_objid` (`machine_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_machinesmv_machrysetting` FOREIGN KEY (`parent_objid`) REFERENCES `machrysetting` (`objid`),
  CONSTRAINT `fk_machinesmv_machine` FOREIGN KEY (`machine_objid`) REFERENCES `machine` (`objid`),
  CONSTRAINT `fk_machinesmv_machinesmv` FOREIGN KEY (`previd`) REFERENCES `machine_smv` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machrpu`
--

DROP TABLE IF EXISTS `machrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) DEFAULT NULL,
  `bldgmaster_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_machrpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_machrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_machrpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machrysetting`
--

DROP TABLE IF EXISTS `machrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `appliedto` longtext,
  `residualrate` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `ordinanceno` varchar(25) DEFAULT NULL,
  `ordinancedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_machrysetting_machrysetting` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machuse`
--

DROP TABLE IF EXISTS `machuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machuse` (
  `objid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_actualuseid_taxable` (`machrpuid`,`actualuse_objid`,`taxable`),
  KEY `FK_machuse_machassesslevel` (`actualuse_objid`),
  KEY `FK_machuse_machrpu` (`machrpuid`),
  CONSTRAINT `FK_machuse_machrpu` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`),
  CONSTRAINT `FK_machuse_machassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `machassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_material_code` (`code`),
  UNIQUE KEY `ux_material_name` (`name`),
  KEY `ix_material_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement`
--

DROP TABLE IF EXISTS `mcsettlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` longtext,
  `prevfaas_objid` varchar(50) DEFAULT NULL,
  `newfaas_objid` varchar(50) DEFAULT NULL,
  `newtdno` varchar(25) DEFAULT NULL,
  `signatories` longtext NOT NULL,
  `lgutype` varchar(25) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_mcsettlement_newfaas` (`newfaas_objid`),
  KEY `FK_mcsettlement_prevfaas` (`prevfaas_objid`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_mcsettlement_state` (`state`),
  KEY `ix_mcsettlement_txnno` (`txnno`),
  CONSTRAINT `FK_mcsettlement_prevfaas` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_mcsettlement_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement_affectedrpu`
--

DROP TABLE IF EXISTS `mcsettlement_affectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement_affectedrpu` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `prevfaas_objid` varchar(50) NOT NULL,
  `newfaas_objid` varchar(50) DEFAULT NULL,
  `newtdno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_mcaffectedrpu_prevfaas_objid` (`prevfaas_objid`),
  KEY `ix_mcaffectedrpu_mcid` (`mcsettlementid`),
  KEY `ix_mcaffectedrpu_newfaas_objid` (`newfaas_objid`),
  KEY `ix_mcaffectedrpu_prevfaas_objid` (`prevfaas_objid`),
  CONSTRAINT `FK_mcaffectedrpu_prevfaas` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_mcaffectedrpu_mc` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`),
  CONSTRAINT `FK_mcaffectedrpu_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement_otherclaim`
--

DROP TABLE IF EXISTS `mcsettlement_otherclaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement_otherclaim` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_mcotherclaim_faas_objid` (`faas_objid`),
  KEY `ix_mcotherclaim_faas_objid` (`faas_objid`),
  KEY `ix_mcotherclaim_mcid` (`mcsettlementid`),
  CONSTRAINT `FK_mcotherclaim_mc` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`),
  CONSTRAINT `FK_mcotherclaim_faas` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memoranda_template`
--

DROP TABLE IF EXISTS `memoranda_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memoranda_template` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL,
  `template` varchar(500) NOT NULL,
  `fields` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrated_business`
--

DROP TABLE IF EXISTS `migrated_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrated_business` (
  `objid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_applicationid` (`applicationid`),
  CONSTRAINT `fk_migrated_business_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_migrated_business_objid` FOREIGN KEY (`objid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscassesslevel`
--

DROP TABLE IF EXISTS `miscassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscassesslevel` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscassesslevel_settingcode` (`miscrysettingid`,`code`),
  UNIQUE KEY `ux_miscassesslevel_settingname` (`miscrysettingid`,`name`),
  KEY `FK_miscassesslevel_classification` (`classification_objid`),
  KEY `ix_miscassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_miscassesslevel_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`),
  CONSTRAINT `FK_miscassesslevel_classification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscassesslevelrange`
--

DROP TABLE IF EXISTS `miscassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `miscassesslevelid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscassesslevelrange_miscassesslevel` (`miscassesslevelid`),
  KEY `FK_miscassesslevelrange_miscrysetting` (`miscrysettingid`),
  CONSTRAINT `FK_miscassesslevelrange_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`),
  CONSTRAINT `FK_miscassesslevelrange_miscassesslevel` FOREIGN KEY (`miscassesslevelid`) REFERENCES `miscassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscitem`
--

DROP TABLE IF EXISTS `miscitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscitem_code` (`code`),
  UNIQUE KEY `ux_miscitem_name` (`name`),
  KEY `ix_miscitem_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscitemvalue`
--

DROP TABLE IF EXISTS `miscitemvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscitemvalue` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscitemvalue_rysetting_item` (`miscrysettingid`,`miscitem_objid`),
  KEY `FK_miscitemvalue_miscitem` (`miscitem_objid`),
  KEY `ix_miscitemvalue_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_miscitemvalue_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`),
  CONSTRAINT `FK_miscitemvalue_miscitem` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpu`
--

DROP TABLE IF EXISTS `miscrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpu` (
  `objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) DEFAULT NULL,
  `landrpuid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscrpu_miscassesslevel` (`actualuse_objid`),
  CONSTRAINT `FK_miscrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_miscrpu_miscassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `miscassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpuitem`
--

DROP TABLE IF EXISTS `miscrpuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpuitem` (
  `objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `miv_objid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(255) NOT NULL,
  `depreciation` decimal(10,0) NOT NULL,
  `depreciatedvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `appraisalstartdate` date DEFAULT NULL,
  `taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscrpuitem_miscitem` (`miscitem_objid`),
  KEY `FK_miscrpuitem_miscitemvalue` (`miv_objid`),
  KEY `FK_miscrpuitem_miscrpu` (`miscrpuid`),
  CONSTRAINT `FK_miscrpuitem_miscrpu` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`),
  CONSTRAINT `FK_miscrpuitem_miscitem` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`),
  CONSTRAINT `FK_miscrpuitem_miscitemvalue` FOREIGN KEY (`miv_objid`) REFERENCES `miscitemvalue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpuitem_rptparameter`
--

DROP TABLE IF EXISTS `miscrpuitem_rptparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpuitem_rptparameter` (
  `miscrpuitemid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `decimalvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`miscrpuitemid`,`param_objid`),
  KEY `FK_miscrpuitem_rptparameter_` (`miscrpuid`),
  KEY `FK_miscrpuitem_rptparameter_rptparamer` (`param_objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_rptparamer` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_miscrpuitem` FOREIGN KEY (`miscrpuitemid`) REFERENCES `miscrpuitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrysetting`
--

DROP TABLE IF EXISTS `miscrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `appliedto` longtext,
  `remarks` varchar(200) DEFAULT NULL,
  `ordinanceno` varchar(25) DEFAULT NULL,
  `ordinancedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_miscrysetting_ry` (`ry`),
  KEY `ix_miscrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `mayor_name` varchar(100) DEFAULT NULL,
  `mayor_title` varchar(50) DEFAULT NULL,
  `mayor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_municipality_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality_taxaccount_mapping`
--

DROP TABLE IF EXISTS `municipality_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality_taxaccount_mapping` (
  `lguid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  `sefadvacct_objid` varchar(50) DEFAULT NULL,
  `sefprevacct_objid` varchar(50) DEFAULT NULL,
  `sefprevintacct_objid` varchar(50) DEFAULT NULL,
  `sefprioracct_objid` varchar(50) DEFAULT NULL,
  `sefpriorintacct_objid` varchar(50) DEFAULT NULL,
  `sefcurracct_objid` varchar(50) DEFAULT NULL,
  `sefcurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurracct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleadvacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lguid`),
  KEY `ix_lguid` (`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_business_application`
--

DROP TABLE IF EXISTS `online_business_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_business_application` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `controlno` varchar(25) NOT NULL,
  `prevapplicationid` varchar(50) NOT NULL,
  `business_objid` varchar(50) NOT NULL,
  `appyear` int(11) NOT NULL,
  `apptype` varchar(20) NOT NULL,
  `appdate` date NOT NULL,
  `lobs` text NOT NULL,
  `infos` longtext NOT NULL,
  `requirements` longtext NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `dtapproved` datetime DEFAULT NULL,
  `approvedby_objid` varchar(50) DEFAULT NULL,
  `approvedby_name` varchar(150) DEFAULT NULL,
  `approvedappno` varchar(25) DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_mobileno` varchar(15) DEFAULT NULL,
  `partnername` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_appdate` (`appdate`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_business_objid` (`business_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_prevapplicationid` (`prevapplicationid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_online_business_application_prevapplicationid` FOREIGN KEY (`prevapplicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_online_business_application_business_objid` FOREIGN KEY (`business_objid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_business_application_doc`
--

DROP TABLE IF EXISTS `online_business_application_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_business_application_doc` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `doc_type` varchar(50) NOT NULL,
  `doc_title` varchar(255) NOT NULL,
  `attachment_objid` varchar(50) NOT NULL,
  `attachment_name` varchar(255) NOT NULL,
  `attachment_path` varchar(255) NOT NULL,
  `fs_filetype` varchar(10) NOT NULL,
  `fs_filelocid` varchar(50) DEFAULT NULL,
  `fs_fileid` varchar(50) DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  `fs_state` varchar(20) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_attachment_objid` (`attachment_objid`),
  KEY `ix_fs_fileid` (`fs_fileid`),
  KEY `ix_fs_filelocid` (`fs_filelocid`),
  KEY `ix_lockid` (`lockid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_online_business_application_doc_parentid` FOREIGN KEY (`parentid`) REFERENCES `online_business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_business_application_doc_fordownload`
--

DROP TABLE IF EXISTS `online_business_application_doc_fordownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_business_application_doc_fordownload` (
  `objid` varchar(50) NOT NULL,
  `scheduledate` datetime NOT NULL,
  `msg` text,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `bytesprocessed` int(11) NOT NULL DEFAULT '0',
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lockid` (`lockid`),
  KEY `ix_scheduledate` (`scheduledate`),
  CONSTRAINT `fk_online_business_application_doc_fordownload_objid` FOREIGN KEY (`objid`) REFERENCES `online_business_application_doc` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payable_ledger`
--

DROP TABLE IF EXISTS `payable_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_ledger` (
  `objid` varchar(50) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `refitemacctid` varchar(50) DEFAULT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_refitemacctid` (`refitemacctid`),
  CONSTRAINT `fk_payable_ledger_jev` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payable_summary`
--

DROP TABLE IF EXISTS `payable_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_summary` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`item_objid`),
  KEY `ix_fundid` (`fund_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder`
--

DROP TABLE IF EXISTS `paymentorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) DEFAULT NULL,
  `particulars` varchar(500) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `params` text,
  `items` longtext,
  `state` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paidby` (`paidby`(255)),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_typeid` (`typeid`),
  CONSTRAINT `fk_paymentorder_typeid` FOREIGN KEY (`typeid`) REFERENCES `paymentorder_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder_cancelled`
--

DROP TABLE IF EXISTS `paymentorder_cancelled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_cancelled` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) DEFAULT NULL,
  `particulars` varchar(500) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `params` text,
  `items` longtext,
  `state` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `dtcancelled` datetime NOT NULL,
  `cancelledby_objid` varchar(50) NOT NULL,
  `cancelledby_name` varchar(150) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_cancelledby_name` (`cancelledby_name`),
  KEY `ix_cancelledby_objid` (`cancelledby_objid`),
  KEY `ix_dtcancelled` (`dtcancelled`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paidby` (`paidby`(255)),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_typeid` (`typeid`),
  CONSTRAINT `fk_paymentorder_cancelled_typeid` FOREIGN KEY (`typeid`) REFERENCES `paymentorder_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder_paid`
--

DROP TABLE IF EXISTS `paymentorder_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_paid` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) DEFAULT NULL,
  `particulars` varchar(500) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `params` text,
  `items` longtext,
  `state` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `receiptid` varchar(50) NOT NULL,
  `receiptno` varchar(30) NOT NULL,
  `receiptdate` date NOT NULL,
  `receipttype` varchar(20) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paidby` (`paidby`(255)),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_typeid` (`typeid`),
  CONSTRAINT `fk_paymentorder_paid_typeid` FOREIGN KEY (`typeid`) REFERENCES `paymentorder_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder_type`
--

DROP TABLE IF EXISTS `paymentorder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_type` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(50) DEFAULT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  `accesstype` int(11) NOT NULL DEFAULT '0',
  `barcodeid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_collectiontytpe_objid` (`collectiontype_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_domain_role` (`domain`,`role`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lgu_barangay` (`barangayid`),
  KEY `ix_pin_state` (`state`),
  CONSTRAINT `FK_pin_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttree`
--

DROP TABLE IF EXISTS `planttree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttree` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttree_code` (`code`),
  UNIQUE KEY `ux_planttree_name` (`name`),
  KEY `ix_planttree_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreeassesslevel`
--

DROP TABLE IF EXISTS `planttreeassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreeassesslevel` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `fixrate` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttreeassesslevel_settingcode` (`planttreerysettingid`,`code`),
  UNIQUE KEY `ux_planttreeassesslevel_settingname` (`planttreerysettingid`,`name`),
  KEY `FK_planttreeassesslevel_planttreeassesslevel` (`previd`),
  CONSTRAINT `FK_planttreeassesslevel_planttreerysetting` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreedetail`
--

DROP TABLE IF EXISTS `planttreedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreedetail` (
  `objid` varchar(50) NOT NULL,
  `planttreerpuid` varchar(50) DEFAULT NULL,
  `landrpuid` varchar(50) DEFAULT NULL,
  `planttreeunitvalue_objid` varchar(50) NOT NULL,
  `planttree_objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `productive` decimal(10,0) NOT NULL,
  `nonproductive` decimal(10,0) NOT NULL,
  `nonproductiveage` varchar(25) DEFAULT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `adjustment` decimal(10,0) NOT NULL,
  `adjustmentrate` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `areacovered` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_planttreedetail_landrpu` (`landrpuid`),
  KEY `FK_planttreedetail_plantreeassesslevel` (`actualuse_objid`),
  KEY `FK_planttreedetail_planttree` (`planttree_objid`),
  KEY `FK_planttreedetail_planttreerpu` (`planttreerpuid`),
  KEY `FK_planttreedetail_planttreeunitvalue` (`planttreeunitvalue_objid`),
  CONSTRAINT `FK_planttreedetail_planttreeunitvalue` FOREIGN KEY (`planttreeunitvalue_objid`) REFERENCES `planttreeunitvalue` (`objid`),
  CONSTRAINT `FK_planttreedetail_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_planttreedetail_plantreeassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `planttreeassesslevel` (`objid`),
  CONSTRAINT `FK_planttreedetail_planttree` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`),
  CONSTRAINT `FK_planttreedetail_planttreerpu` FOREIGN KEY (`planttreerpuid`) REFERENCES `planttreerpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreerpu`
--

DROP TABLE IF EXISTS `planttreerpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreerpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `productive` decimal(10,0) NOT NULL,
  `nonproductive` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_planttreerpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_planttreerpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_planttreerpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreerysetting`
--

DROP TABLE IF EXISTS `planttreerysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreerysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `applyagriadjustment` int(11) DEFAULT NULL,
  `appliedto` longtext,
  `previd` varchar(50) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `ordinanceno` varchar(25) DEFAULT NULL,
  `ordinancedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_planttreerysetting_planttreerysetting` (`previd`),
  KEY `ix_planttreerysetting_ry` (`ry`),
  CONSTRAINT `FK_planttreerysetting_planttreerysetting` FOREIGN KEY (`previd`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreeunitvalue`
--

DROP TABLE IF EXISTS `planttreeunitvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreeunitvalue` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `planttree_objid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttreeunitvalue_settingplanttreecode` (`planttreerysettingid`,`planttree_objid`,`code`),
  UNIQUE KEY `ux_planttreeunitvalue_settingplanttreename` (`planttreerysettingid`,`planttree_objid`,`name`),
  KEY `FK_planttreeunitvalue_planttree` (`planttree_objid`),
  KEY `FK_planttreeunitvalue_planttreeunitvalue` (`previd`),
  CONSTRAINT `FK_planttreeunitvalue_planttreerysetting` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`),
  CONSTRAINT `FK_planttreeunitvalue_planttree` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `previousfaas`
--

DROP TABLE IF EXISTS `previousfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previousfaas` (
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  PRIMARY KEY (`faasid`,`prevfaasid`),
  KEY `FK_previousfaas_prevfaas` (`prevfaasid`),
  CONSTRAINT `FK_previousfaas_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_previousfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertyclassification`
--

DROP TABLE IF EXISTS `propertyclassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertyclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `special` int(11) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_propertyclassification_code` (`code`),
  UNIQUE KEY `ux_propertyclassification_name` (`name`),
  KEY `ix_propertyclassification_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertypayer`
--

DROP TABLE IF EXISTS `propertypayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertypayer` (
  `objid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_propertypayer_taxpayerid` (`taxpayer_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertypayer_item`
--

DROP TABLE IF EXISTS `propertypayer_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertypayer_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledger_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_propertypayeritem_rptledgerid` (`parentid`,`rptledger_objid`),
  KEY `ix_propertypayeritem_parentid` (`parentid`),
  KEY `ix_propertypayeritem_rptledgerid` (`rptledger_objid`),
  CONSTRAINT `FK_propertypayeritem_propertypayer` FOREIGN KEY (`parentid`) REFERENCES `propertypayer` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `governor_name` varchar(100) DEFAULT NULL,
  `governor_title` varchar(50) DEFAULT NULL,
  `governor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_province_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province_taxaccount_mapping`
--

DROP TABLE IF EXISTS `province_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_taxaccount_mapping` (
  `objid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  `sefadvacct_objid` varchar(50) DEFAULT NULL,
  `sefprevacct_objid` varchar(50) DEFAULT NULL,
  `sefprevintacct_objid` varchar(50) DEFAULT NULL,
  `sefprioracct_objid` varchar(50) DEFAULT NULL,
  `sefpriorintacct_objid` varchar(50) DEFAULT NULL,
  `sefcurracct_objid` varchar(50) DEFAULT NULL,
  `sefcurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurracct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleadvacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `psic_class`
--

DROP TABLE IF EXISTS `psic_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psic_class` (
  `code` varchar(4) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `details` varchar(5000) DEFAULT NULL,
  `groupid` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `ix_groupid` (`groupid`),
  CONSTRAINT `fk_psic_class_groupid` FOREIGN KEY (`groupid`) REFERENCES `psic_group` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `psic_division`
--

DROP TABLE IF EXISTS `psic_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psic_division` (
  `code` varchar(2) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `details` text,
  `sectionid` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `ix_sectionid` (`sectionid`),
  CONSTRAINT `fk_psic_division_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `psic_section` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `psic_group`
--

DROP TABLE IF EXISTS `psic_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psic_group` (
  `code` varchar(3) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `details` text,
  `divisionid` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `ix_divisionid` (`divisionid`),
  CONSTRAINT `fk_psic_group_divisionid` FOREIGN KEY (`divisionid`) REFERENCES `psic_division` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `psic_section`
--

DROP TABLE IF EXISTS `psic_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psic_section` (
  `code` varchar(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `psic_subclass`
--

DROP TABLE IF EXISTS `psic_subclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psic_subclass` (
  `code` varchar(5) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `details` text,
  `classid` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `ix_classid` (`classid`),
  CONSTRAINT `fk_psic_subclass_classid` FOREIGN KEY (`classid`) REFERENCES `psic_class` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `cno` double DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `transtype` varchar(255) DEFAULT NULL,
  `tellerno` double DEFAULT '-1',
  `stats` double DEFAULT NULL,
  `seqno` double DEFAULT '0',
  `prefx` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realproperty`
--

DROP TABLE IF EXISTS `realproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realproperty` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `pintype` varchar(5) NOT NULL,
  `pin` varchar(30) NOT NULL,
  `ry` int(11) NOT NULL,
  `claimno` varchar(5) DEFAULT NULL,
  `section` varchar(3) NOT NULL,
  `parcel` varchar(3) NOT NULL,
  `cadastrallotno` varchar(300) DEFAULT NULL,
  `blockno` varchar(255) DEFAULT NULL,
  `surveyno` varchar(30) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `purok` varchar(100) DEFAULT NULL,
  `north` varchar(500) DEFAULT NULL,
  `south` varchar(500) DEFAULT NULL,
  `east` varchar(500) DEFAULT NULL,
  `west` varchar(500) DEFAULT NULL,
  `barangayid` varchar(50) NOT NULL,
  `lgutype` varchar(50) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `lguid` varchar(50) DEFAULT NULL,
  `stewardshipno` varchar(3) DEFAULT NULL,
  `portionof` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_realproperty_blockno` (`blockno`),
  KEY `ix_realproperty_brgysection` (`barangayid`,`section`),
  KEY `ix_realproperty_brgystate` (`barangayid`,`state`),
  KEY `ix_realproperty_cadastrallotno` (`cadastrallotno`(255)),
  KEY `ix_realproperty_claimno` (`claimno`),
  KEY `ix_realproperty_pin` (`pin`),
  KEY `ix_realproperty_ry` (`ry`),
  KEY `ix_realproperty_surveyno` (`surveyno`),
  CONSTRAINT `FK_realproperty_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religion` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance`
--

DROP TABLE IF EXISTS `remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `controlno` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `liquidatingofficer_objid` varchar(50) DEFAULT NULL,
  `liquidatingofficer_name` varchar(160) DEFAULT NULL,
  `liquidatingofficer_title` varchar(100) DEFAULT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `cashbreakdown` varchar(600) NOT NULL,
  `controldate` datetime NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `liquidatingofficer_signature` longtext,
  `collector_signature` longtext,
  `liquidationid` varchar(50) DEFAULT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `collectionvoucherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  UNIQUE KEY `ux_remittance_txnno` (`controlno`),
  KEY `ix_collectionvoucherid` (`collectionvoucherid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_liquidatingofficer_objid` (`liquidatingofficer_objid`),
  KEY `ix_liquidationid` (`liquidationid`),
  KEY `ix_remittance_state` (`state`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_remittance_collectionvoucherid` FOREIGN KEY (`collectionvoucherid`) REFERENCES `collectionvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance_af`
--

DROP TABLE IF EXISTS `remittance_af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_af` (
  `objid` varchar(100) NOT NULL,
  `remittanceid` varchar(50) DEFAULT NULL,
  `controlid` varchar(50) DEFAULT NULL,
  `receivedstartseries` int(11) DEFAULT NULL,
  `receivedendseries` int(11) DEFAULT NULL,
  `beginstartseries` int(11) DEFAULT NULL,
  `beginendseries` int(11) DEFAULT NULL,
  `issuedstartseries` int(11) DEFAULT NULL,
  `issuedendseries` int(11) DEFAULT NULL,
  `endingstartseries` int(11) DEFAULT NULL,
  `endingendseries` int(11) DEFAULT NULL,
  `qtyreceived` int(11) DEFAULT NULL,
  `qtybegin` int(11) DEFAULT NULL,
  `qtyissued` int(11) DEFAULT NULL,
  `qtyending` int(11) DEFAULT NULL,
  `qtycancelled` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_remittance_afserial_remittance` (`remittanceid`),
  KEY `ix_controlid` (`controlid`),
  CONSTRAINT `remittance_afserial_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`),
  CONSTRAINT `FK_remittance_afserial_remittance` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance_fund`
--

DROP TABLE IF EXISTS `remittance_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_fund` (
  `objid` varchar(150) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext NOT NULL,
  `controlno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_remittance_fund` (`remittanceid`,`fund_objid`),
  KEY `ix_controlno` (`controlno`),
  CONSTRAINT `remittance_fund_ibfk_1` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`),
  CONSTRAINT `FK_remittance_fund` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remote_mapping`
--

DROP TABLE IF EXISTS `remote_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remote_mapping` (
  `objid` varchar(50) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `remote_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `createdby_title` varchar(100) DEFAULT NULL,
  `dtcreated` datetime NOT NULL,
  `orgcode` varchar(10) DEFAULT NULL,
  `remote_orgcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_doctype` (`doctype`),
  KEY `ix_orgcode` (`orgcode`),
  KEY `ix_remote_objid` (`remote_objid`),
  KEY `ix_remote_orgcode` (`remote_orgcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_bpdelinquency`
--

DROP TABLE IF EXISTS `report_bpdelinquency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_bpdelinquency` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(160) DEFAULT NULL,
  `totalcount` int(11) DEFAULT NULL,
  `processedcount` int(11) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_billdate` (`billdate`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_duedate` (`duedate`),
  KEY `ix_state` (`state`),
  KEY `ix_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_bpdelinquency_app`
--

DROP TABLE IF EXISTS `report_bpdelinquency_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_bpdelinquency_app` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `appyear` int(11) NOT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_applicationid` (`parentid`,`applicationid`),
  KEY `ix_appdate` (`appdate`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_lockid` (`lockid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_report_bpdelinquency_app_parentid` FOREIGN KEY (`parentid`) REFERENCES `report_bpdelinquency` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_bpdelinquency_item`
--

DROP TABLE IF EXISTS `report_bpdelinquency_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_bpdelinquency_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NOT NULL,
  `tax` decimal(16,2) NOT NULL DEFAULT '0.00',
  `regfee` decimal(16,2) NOT NULL DEFAULT '0.00',
  `othercharge` decimal(16,2) NOT NULL DEFAULT '0.00',
  `surcharge` decimal(16,2) NOT NULL DEFAULT '0.00',
  `interest` decimal(16,2) NOT NULL DEFAULT '0.00',
  `total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `duedate` date DEFAULT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_qtr` (`qtr`),
  KEY `ix_year` (`year`),
  CONSTRAINT `fk_report_bpdelinquency_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `report_bpdelinquency` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptcollection_annual_bypayer`
--

DROP TABLE IF EXISTS `report_rptcollection_annual_bypayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptcollection_annual_bypayer` (
  `rputype` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `payer_name` varchar(2000) NOT NULL,
  `amount` decimal(50,2) DEFAULT NULL,
  `dtgenerated` datetime NOT NULL,
  KEY `ix_payer` (`payer_name`(255)),
  KEY `ix_rputype` (`rputype`),
  KEY `ix_year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency`
--

DROP TABLE IF EXISTS `report_rptdelinquency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `dtgenerated` datetime NOT NULL,
  `dtcomputed` datetime NOT NULL,
  `generatedby_name` varchar(255) NOT NULL,
  `generatedby_title` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_barangay`
--

DROP TABLE IF EXISTS `report_rptdelinquency_barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_barangay` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `processed` int(11) NOT NULL,
  `errors` int(11) NOT NULL,
  `ignored` int(11) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptdelinquency_barangay_barangay` (`barangayid`),
  KEY `fk_rptdelinquency_barangay_rptdelinquency` (`parentid`),
  CONSTRAINT `fk_rptdelinquency_barangay_rptdelinquency` FOREIGN KEY (`parentid`) REFERENCES `report_rptdelinquency` (`objid`),
  CONSTRAINT `fk_rptdelinquency_barangay_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_error`
--

DROP TABLE IF EXISTS `report_rptdelinquency_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_error` (
  `objid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `error` longtext,
  `ignored` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_forprocess`
--

DROP TABLE IF EXISTS `report_rptdelinquency_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_forprocess` (
  `objid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_item`
--

DROP TABLE IF EXISTS `report_rptdelinquency_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) DEFAULT NULL,
  `revtype` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptdelinquency_barangay_rptdelinquency` (`parentid`),
  KEY `fk_rptdelinquency_item_barangay` (`barangayid`),
  KEY `fk_rptdelinquency_item_rptdelinquency` (`parentid`),
  KEY `fk_rptdelinquency_item_rptledger` (`rptledgerid`),
  KEY `ix_year` (`year`),
  CONSTRAINT `fk_rptdelinquency_item_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rptdelinquency_item_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `fk_rptdelinquency_item_rptdelinquency` FOREIGN KEY (`parentid`) REFERENCES `report_rptdelinquency` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_total_bytaxpayer`
--

DROP TABLE IF EXISTS `report_rptdelinquency_total_bytaxpayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_total_bytaxpayer` (
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `ledgercount` int(11) DEFAULT NULL,
  KEY `ix_amount` (`amount`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_taxpayer_objid` (`taxpayer_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection`
--

DROP TABLE IF EXISTS `resection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) NOT NULL,
  `pintype` varchar(3) NOT NULL,
  `section` varchar(3) NOT NULL,
  `originlgu_objid` varchar(50) NOT NULL,
  `memoranda` varchar(255) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `taskstate` varchar(50) DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_resection_txnno` (`txnno`),
  KEY `FK_resection_barangay_org` (`barangay_objid`),
  KEY `FK_resection_lgu_org` (`lgu_objid`),
  KEY `FK_resection_originlgu_org` (`originlgu_objid`),
  KEY `ix_resection_state` (`state`),
  CONSTRAINT `FK_resection_originlgu_org` FOREIGN KEY (`originlgu_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `FK_resection_barangay_org` FOREIGN KEY (`barangay_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `FK_resection_lgu_org` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection_item`
--

DROP TABLE IF EXISTS `resection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  `faas_rputype` varchar(15) NOT NULL,
  `faas_pin` varchar(25) NOT NULL,
  `faas_suffix` int(11) NOT NULL,
  `newfaas_objid` varchar(50) DEFAULT NULL,
  `newfaas_rpuid` varchar(50) DEFAULT NULL,
  `newfaas_rpid` varchar(50) DEFAULT NULL,
  `newfaas_section` varchar(3) DEFAULT NULL,
  `newfaas_parcel` varchar(3) DEFAULT NULL,
  `newfaas_suffix` int(11) DEFAULT NULL,
  `newfaas_tdno` varchar(25) DEFAULT NULL,
  `newfaas_fullpin` varchar(50) DEFAULT NULL,
  `newfaas_claimno` varchar(25) DEFAULT NULL,
  `faas_claimno` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_resection_item_tdno` (`newfaas_tdno`),
  KEY `FK_resection_item_faas` (`faas_objid`),
  KEY `FK_resection_item_item` (`parent_objid`),
  KEY `FK_resection_item_newfaas` (`newfaas_objid`),
  KEY `ix_resection_item_fullpin` (`newfaas_fullpin`),
  CONSTRAINT `FK_resection_item_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_resection_item_faas` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_resection_item_item` FOREIGN KEY (`parent_objid`) REFERENCES `resection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection_task`
--

DROP TABLE IF EXISTS `resection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_changeinfo`
--

DROP TABLE IF EXISTS `rpt_changeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_changeinfo` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `rpid` varchar(50) DEFAULT NULL,
  `rpuid` varchar(50) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `reason` longtext NOT NULL,
  `newinfo` longtext NOT NULL,
  `previnfo` longtext NOT NULL,
  `dtposted` datetime NOT NULL,
  `postedbyid` varchar(50) DEFAULT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(100) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `redflagid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_redflag`
--

DROP TABLE IF EXISTS `rpt_redflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_redflag` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(15) NOT NULL,
  `caseno` varchar(25) NOT NULL,
  `message` longtext,
  `filedby_date` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `action` varchar(50) NOT NULL,
  `resolvedby_objid` varchar(50) DEFAULT NULL,
  `resolvedby_name` varchar(150) DEFAULT NULL,
  `resolvedby_date` datetime DEFAULT NULL,
  `lguid` varchar(15) NOT NULL,
  `dtclosed` datetime DEFAULT NULL,
  `remarks` longtext,
  `info` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptredflag_caseno` (`caseno`),
  KEY `ix_rptredflag_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_requirement`
--

DROP TABLE IF EXISTS `rpt_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_requirement` (
  `objid` varchar(50) NOT NULL,
  `requirementtypeid` varchar(50) NOT NULL,
  `handler` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `value_objid` varchar(50) DEFAULT NULL,
  `value_txnno` varchar(50) DEFAULT NULL,
  `value_txndate` date DEFAULT NULL,
  `value_txnamount` decimal(10,0) DEFAULT NULL,
  `value_remarks` longtext,
  `complied` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptrequirement_refid` (`refid`),
  KEY `ix_rptrequirement_requirementtypeid` (`requirementtypeid`),
  KEY `ix_rptrequirement_valueobjid` (`value_objid`),
  CONSTRAINT `FK_rptrequirement_rptrequirementtype` FOREIGN KEY (`requirementtypeid`) REFERENCES `rpt_requirement_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_requirement_type`
--

DROP TABLE IF EXISTS `rpt_requirement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_requirement_type` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `handler` varchar(100) DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptrequirementtype_name` (`name`),
  KEY `ix_rptrequirementtype_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sales_data`
--

DROP TABLE IF EXISTS `rpt_sales_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sales_data` (
  `objid` varchar(50) NOT NULL,
  `seller_name` varchar(250) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `buyer_name` varchar(250) NOT NULL,
  `buyer_address` varchar(100) NOT NULL,
  `saledate` date NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `remarks` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_buyername` (`buyer_name`),
  KEY `ix_FK_faas_sales_data` (`objid`),
  KEY `ix_sellername` (`seller_name`),
  CONSTRAINT `FK_faas_sales_data` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sms`
--

DROP TABLE IF EXISTS `rpt_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sms` (
  `objid` varchar(50) NOT NULL,
  `traceid` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `amtpaid` decimal(10,0) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptsms_phoneno` (`phoneno`),
  KEY `ix_rptsms_traceid` (`traceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sms_registration`
--

DROP TABLE IF EXISTS `rpt_sms_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sms_registration` (
  `phoneno` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY (`phoneno`,`refid`),
  KEY `ix_rptsmsreg_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata`
--

DROP TABLE IF EXISTS `rpt_syncdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `orgid` varchar(50) NOT NULL,
  `remote_orgid` varchar(50) DEFAULT NULL,
  `remote_orgcode` varchar(5) DEFAULT NULL,
  `remote_orgclass` varchar(25) DEFAULT NULL,
  `sender_objid` varchar(50) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_title` varchar(80) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_completed`
--

DROP TABLE IF EXISTS `rpt_syncdata_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_completed` (
  `objid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_title` varchar(80) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `info` text,
  `dtfiled` datetime DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  `sender_objid` varchar(50) DEFAULT NULL,
  `remote_orgid` varchar(50) DEFAULT NULL,
  `remote_orgcode` varchar(25) DEFAULT NULL,
  `remote_orgclass` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_downloaded`
--

DROP TABLE IF EXISTS `rpt_syncdata_downloaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_downloaded` (
  `objid` varchar(255) NOT NULL,
  `etag` varchar(64) NOT NULL,
  `error` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_error` (`error`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_error`
--

DROP TABLE IF EXISTS `rpt_syncdata_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_error` (
  `objid` varchar(50) NOT NULL,
  `filekey` varchar(1000) NOT NULL,
  `error` text,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `idx` int(11) NOT NULL,
  `info` text,
  `parent` text,
  `remote_orgid` varchar(50) DEFAULT NULL,
  `remote_orgcode` varchar(5) DEFAULT NULL,
  `remote_orgclass` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_filekey` (`filekey`(255)),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_remote_orgcode` (`remote_orgcode`),
  KEY `ix_remote_orgid` (`remote_orgid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_fordownload`
--

DROP TABLE IF EXISTS `rpt_syncdata_fordownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_fordownload` (
  `objid` varchar(255) NOT NULL,
  `etag` varchar(64) NOT NULL,
  `error` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_error` (`error`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_forsync`
--

DROP TABLE IF EXISTS `rpt_syncdata_forsync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_forsync` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `orgid` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `createdby_title` varchar(50) DEFAULT NULL,
  `remote_orgid` varchar(15) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_item`
--

DROP TABLE IF EXISTS `rpt_syncdata_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `idx` int(11) NOT NULL,
  `info` text,
  `error` text,
  `filekey` varchar(1200) DEFAULT NULL,
  `etag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `rpt_syncdata_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `rpt_syncdata` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_syncdata_item_completed`
--

DROP TABLE IF EXISTS `rpt_syncdata_item_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_syncdata_item_completed` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_remote_orgid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptacknowledgement`
--

DROP TABLE IF EXISTS `rptacknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptacknowledgement` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `releasemode` varchar(50) DEFAULT NULL,
  `receivedby` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `pin` varchar(25) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(150) DEFAULT NULL,
  `createdby_title` varchar(100) DEFAULT NULL,
  `dtchecked` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptacknowledgement_txnno` (`txnno`),
  KEY `ix_rptacknowledgement_createdby_name` (`createdby_name`),
  KEY `ix_rptacknowledgement_createdby_objid` (`createdby_objid`),
  KEY `ix_rptacknowledgement_pin` (`pin`),
  KEY `ix_rptacknowledgement_taxpayerid` (`taxpayer_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptacknowledgement_item`
--

DROP TABLE IF EXISTS `rptacknowledgement_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptacknowledgement_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `trackingno` varchar(25) DEFAULT NULL,
  `ref_objid` varchar(50) DEFAULT NULL,
  `newfaas_objid` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptacknowledgement_itemno` (`trackingno`),
  KEY `ix_rptacknowledgement_item_faasid` (`ref_objid`),
  KEY `ix_rptacknowledgement_item_newfaasid` (`newfaas_objid`),
  KEY `ix_rptacknowledgement_parentid` (`parent_objid`),
  CONSTRAINT `fk_rptacknowledgement_item_rptacknowledgement` FOREIGN KEY (`parent_objid`) REFERENCES `rptacknowledgement` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptbill`
--

DROP TABLE IF EXISTS `rptbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptbill` (
  `objid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `expirydate` date NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) DEFAULT NULL,
  `billtoyear` int(11) DEFAULT NULL,
  `billtoqtr` int(11) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptbill_barcode` (`barcode`),
  KEY `ix_expirydate` (`expirydate`),
  KEY `ix_rptbill_expirydate` (`expirydate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptbill_ledger`
--

DROP TABLE IF EXISTS `rptbill_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptbill_ledger` (
  `rptledgerid` varchar(50) NOT NULL DEFAULT '',
  `billid` varchar(50) NOT NULL DEFAULT '',
  `updateflag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`billid`,`rptledgerid`),
  KEY `ix_rptbill_ledgter_rptbillid` (`billid`),
  KEY `ix_rptbill_ledgter_rptledgerid` (`rptledgerid`),
  CONSTRAINT `FK_rptbillledger_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `FK_rptbillledger_rptbill` FOREIGN KEY (`billid`) REFERENCES `rptbill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertification`
--

DROP TABLE IF EXISTS `rptcertification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `opener` varchar(50) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(255) DEFAULT NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(255) NOT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) DEFAULT NULL,
  `byauthoritytitle` varchar(50) DEFAULT NULL,
  `official` int(11) NOT NULL,
  `orno` varchar(25) DEFAULT NULL,
  `ordate` datetime DEFAULT NULL,
  `oramount` decimal(10,0) NOT NULL,
  `stampamount` decimal(10,0) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) DEFAULT NULL,
  `addlinfo` varchar(500) DEFAULT NULL,
  `attestedby` varchar(100) DEFAULT NULL,
  `attestedbytitle` varchar(100) DEFAULT NULL,
  `asofyear` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  `properties` text,
  `taskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptcertification_txnno` (`txnno`),
  KEY `FK_rptcertification_faas` (`faasid`),
  KEY `ix_rptcertification_office` (`office`),
  KEY `ix_rptcertification_office_txnno` (`office`,`txnno`),
  KEY `ix_rptcertification_taxpayerid` (`taxpayer_objid`),
  CONSTRAINT `FK_rptcertification_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertification_online`
--

DROP TABLE IF EXISTS `rptcertification_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertification_online` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `reftype` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `orno` varchar(25) DEFAULT NULL,
  `ordate` date DEFAULT NULL,
  `oramount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_orno` (`orno`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_rptcertification_online_rptcertification` FOREIGN KEY (`objid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertification_task`
--

DROP TABLE IF EXISTS `rptcertification_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertification_task` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` text,
  `returnedby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `rptcertification_task_ibfk_1` FOREIGN KEY (`refid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertificationitem`
--

DROP TABLE IF EXISTS `rptcertificationitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertificationitem` (
  `objid` int(11) NOT NULL AUTO_INCREMENT,
  `rptcertificationid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptcertificationitem_rptcertification` (`rptcertificationid`),
  KEY `ix_rptcertificationitem_refid` (`refid`),
  CONSTRAINT `FK_rptcertificationitem_rptcertification` FOREIGN KEY (`rptcertificationid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise`
--

DROP TABLE IF EXISTS `rptcompromise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` date NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `startyear` int(11) NOT NULL,
  `startqtr` int(11) NOT NULL,
  `endyear` int(11) NOT NULL,
  `endqtr` int(11) NOT NULL,
  `enddate` date NOT NULL,
  `cypaymentrequired` int(11) DEFAULT NULL,
  `cypaymentorno` varchar(15) DEFAULT NULL,
  `cypaymentordate` date DEFAULT NULL,
  `cypaymentoramount` decimal(10,2) DEFAULT NULL,
  `downpaymentrequired` int(11) NOT NULL,
  `downpaymentrate` decimal(10,0) NOT NULL,
  `downpayment` decimal(10,2) NOT NULL,
  `downpaymentorno` varchar(50) DEFAULT NULL,
  `downpaymentordate` date DEFAULT NULL,
  `term` int(11) NOT NULL,
  `numofinstallment` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtforinstallment` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `firstpartyname` varchar(100) NOT NULL,
  `firstpartytitle` varchar(50) NOT NULL,
  `firstpartyaddress` varchar(100) NOT NULL,
  `firstpartyctcno` varchar(15) NOT NULL,
  `firstpartyctcissued` varchar(100) NOT NULL,
  `firstpartyctcdate` date NOT NULL,
  `firstpartynationality` varchar(50) NOT NULL,
  `firstpartystatus` varchar(50) NOT NULL,
  `firstpartygender` varchar(10) NOT NULL,
  `secondpartyrepresentative` varchar(100) NOT NULL,
  `secondpartyname` varchar(100) NOT NULL,
  `secondpartyaddress` varchar(100) NOT NULL,
  `secondpartyctcno` varchar(15) NOT NULL,
  `secondpartyctcissued` varchar(100) NOT NULL,
  `secondpartyctcdate` date NOT NULL,
  `secondpartynationality` varchar(50) NOT NULL,
  `secondpartystatus` varchar(50) NOT NULL,
  `secondpartygender` varchar(10) NOT NULL,
  `dtsigned` date DEFAULT NULL,
  `notarizeddate` date DEFAULT NULL,
  `notarizedby` varchar(100) DEFAULT NULL,
  `notarizedbytitle` varchar(50) DEFAULT NULL,
  `signatories` longtext NOT NULL,
  `manualdiff` decimal(16,2) NOT NULL DEFAULT '0.00',
  `cypaymentreceiptid` varchar(50) DEFAULT NULL,
  `downpaymentreceiptid` varchar(50) DEFAULT NULL,
  `cutoffdate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_faasid` (`faasid`),
  KEY `ix_rptcompromise_ledgerid` (`rptledgerid`),
  CONSTRAINT `fk_rptcompromise_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rptcompromise_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_credit`
--

DROP TABLE IF EXISTS `rptcompromise_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_credit` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `installmentid` varchar(50) DEFAULT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `orno` varchar(15) DEFAULT NULL,
  `ordate` date NOT NULL,
  `oramount` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `paidby` varchar(150) NOT NULL,
  `paidbyaddress` varchar(100) NOT NULL,
  `partial` int(11) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_credit_installmentid` (`installmentid`),
  KEY `ix_rptcompromise_credit_parentid` (`parentid`),
  KEY `ix_rptcompromise_credit_receiptid` (`receiptid`),
  CONSTRAINT `fk_rptcompromise_credit_rptcompromise_installment` FOREIGN KEY (`installmentid`) REFERENCES `rptcompromise_installment` (`objid`),
  CONSTRAINT `fk_rptcompromise_credit_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_rptcompromise_credit_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_installment`
--

DROP TABLE IF EXISTS `rptcompromise_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_installment` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `installmentno` int(11) NOT NULL,
  `duedate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `fullypaid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_installment_rptcompromiseid` (`parentid`),
  CONSTRAINT `fk_rptcompromise_installment_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_item`
--

DROP TABLE IF EXISTS `rptcompromise_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `interestpaid` decimal(16,2) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `taxdifference` int(11) DEFAULT NULL,
  `qtr` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_item_rptcompromise` (`parentid`),
  KEY `ix_rptcompromise_item_rptledgerfaas` (`rptledgerfaasid`),
  CONSTRAINT `fk_rptcompromise_item_rptledgerfaas` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`),
  CONSTRAINT `fk_rptcompromise_item_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptexpiry`
--

DROP TABLE IF EXISTS `rptexpiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptexpiry` (
  `iyear` int(11) NOT NULL,
  `iqtr` int(11) NOT NULL,
  `expirytype` varchar(50) NOT NULL,
  `expirydate` datetime DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`expirytype`,`iqtr`,`iyear`),
  KEY `ix_rptexpiry_yrqtr` (`iyear`,`iqtr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger`
--

DROP TABLE IF EXISTS `rptledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `nextbilldate` date DEFAULT NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `firstqtrpaidontime` int(11) DEFAULT NULL,
  `qtrlypaymentavailed` int(11) DEFAULT NULL,
  `qtrlypaymentpaidontime` int(11) DEFAULT NULL,
  `lastitemyear` int(11) DEFAULT NULL,
  `lastreceiptid` varchar(50) DEFAULT NULL,
  `barangayid` varchar(50) DEFAULT NULL,
  `advancebill` int(11) DEFAULT '0',
  `lastbilledyear` int(11) DEFAULT '0',
  `lastbilledqtr` int(11) DEFAULT '0',
  `partialbasic` decimal(16,2) DEFAULT NULL,
  `partialbasicint` decimal(16,2) DEFAULT NULL,
  `partialbasicdisc` decimal(16,2) DEFAULT NULL,
  `partialsef` decimal(16,2) DEFAULT NULL,
  `partialsefint` decimal(16,2) DEFAULT NULL,
  `partialsefdisc` decimal(16,2) DEFAULT NULL,
  `partialledyear` int(11) DEFAULT '0',
  `partialledqtr` int(11) DEFAULT '0',
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `fullpin` varchar(35) DEFAULT NULL,
  `tdno` varchar(50) DEFAULT NULL,
  `cadastrallotno` longtext,
  `rputype` varchar(15) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `classcode` varchar(15) DEFAULT NULL,
  `totalav` decimal(16,2) DEFAULT NULL,
  `totalmv` decimal(16,2) DEFAULT NULL,
  `totalareaha` decimal(16,6) DEFAULT NULL,
  `taxable` int(11) DEFAULT NULL,
  `owner_name` varchar(1000) NOT NULL,
  `prevtdno` varchar(800) DEFAULT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `titleno` varchar(50) DEFAULT NULL,
  `undercompromise` int(11) DEFAULT NULL,
  `updateflag` varchar(50) DEFAULT NULL,
  `forcerecalcbill` int(11) DEFAULT NULL,
  `administrator_name` varchar(150) DEFAULT NULL,
  `blockno` varchar(50) DEFAULT NULL,
  `lguid` varchar(50) DEFAULT NULL,
  `beneficiary_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledger_barangay` (`barangayid`),
  KEY `FK_rptledger_faas` (`faasid`),
  KEY `ix_rptledger_administartorname` (`administrator_name`),
  KEY `ix_rptledger_blockno` (`blockno`),
  KEY `ix_rptledger_cadastrallotno` (`cadastrallotno`(255)),
  KEY `ix_rptledger_faasid` (`faasid`),
  KEY `ix_rptledger_fullpin` (`fullpin`),
  KEY `ix_rptledger_owner_name` (`owner_name`(255)),
  KEY `ix_rptledger_prevtdno` (`prevtdno`(255)),
  KEY `ix_rptledger_state` (`state`),
  KEY `ix_rptledger_state_barangay` (`state`,`barangayid`),
  KEY `ix_rptledger_state_faasid` (`state`,`faasid`),
  KEY `ix_rptledger_state_lastyearpaid` (`state`,`lastyearpaid`),
  KEY `ix_rptledger_tdno` (`tdno`),
  KEY `ix_rptledgerlastyearpaidqtr` (`lastyearpaid`,`lastqtrpaid`),
  CONSTRAINT `FK_rptledger_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_rptledger_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_avdifference`
--

DROP TABLE IF EXISTS `rptledger_avdifference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_avdifference` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `rptledgerfaas_objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `paid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger` (`parent_objid`),
  KEY `fk_rptledgerfaas` (`rptledgerfaas_objid`),
  CONSTRAINT `fk_rptledgerfaas` FOREIGN KEY (`rptledgerfaas_objid`) REFERENCES `rptledgerfaas` (`objid`),
  CONSTRAINT `fk_rptledger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_credit`
--

DROP TABLE IF EXISTS `rptledger_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_credit` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `payorid` varchar(50) DEFAULT NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `collector` varchar(80) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `basicidle` decimal(12,2) NOT NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `firecode` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectingagency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledgercredit_rptledger` (`rptledgerid`),
  KEY `ix_rptreceipt_payorid` (`payorid`),
  KEY `ix_rptreceipt_receiptno` (`refno`),
  CONSTRAINT `rptledger_credit_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_forprocess`
--

DROP TABLE IF EXISTS `rptledger_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_forprocess` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_item`
--

DROP TABLE IF EXISTS `rptledger_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `basicav` decimal(16,2) NOT NULL,
  `sefav` decimal(16,2) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `priority` int(11) NOT NULL,
  `taxdifference` int(11) NOT NULL,
  `system` int(11) NOT NULL,
  `fromqtr` int(11) DEFAULT NULL,
  `toqtr` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger_item_rptledger` (`parentid`),
  CONSTRAINT `fk_rptledger_item_rptledger` FOREIGN KEY (`parentid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_redflag`
--

DROP TABLE IF EXISTS `rptledger_redflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_redflag` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `caseno` varchar(25) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `finding` text,
  `remarks` text,
  `blockaction` varchar(25) DEFAULT NULL,
  `filedby_objid` varchar(50) DEFAULT NULL,
  `filedby_name` varchar(255) DEFAULT NULL,
  `filedby_title` varchar(50) DEFAULT NULL,
  `resolvedby_objid` varchar(50) DEFAULT NULL,
  `resolvedby_name` varchar(255) DEFAULT NULL,
  `resolvedby_title` varchar(50) DEFAULT NULL,
  `dtresolved` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_caseno` (`caseno`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_resolvedby_objid` (`resolvedby_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_type` (`type`),
  CONSTRAINT `fk_rptledger_redflag_rptledger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rptledger_redflag_filedby` FOREIGN KEY (`filedby_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_rptledger_redflag_resolvedby` FOREIGN KEY (`resolvedby_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_restriction`
--

DROP TABLE IF EXISTS `rptledger_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_restriction` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `restrictionid` varchar(50) NOT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`objid`),
  KEY `ix_autoinc_oid` (`oid`),
  KEY `FK_rptledger_restriction_rptledger` (`parentid`),
  CONSTRAINT `FK_rptledger_restriction_rptledger` FOREIGN KEY (`parentid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_subledger`
--

DROP TABLE IF EXISTS `rptledger_subledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_subledger` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `subacctno` varchar(10) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_subacctno` (`parent_objid`,`subacctno`),
  CONSTRAINT `FK_rptledger_subledger_rptldger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_tag`
--

DROP TABLE IF EXISTS `rptledger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_tag` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptledger_tag` (`parent_objid`,`tag`),
  KEY `FK_rptledgertag_rptledger` (`parent_objid`),
  CONSTRAINT `FK_rptledgertag_rptledger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledgerbill`
--

DROP TABLE IF EXISTS `rptledgerbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledgerbill` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `ledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `av` decimal(10,0) NOT NULL,
  `type` varchar(25) NOT NULL,
  `revenueitemid` varchar(50) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `amtpaid` decimal(10,0) NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledgerbillitem`
--

DROP TABLE IF EXISTS `rptledgerbillitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledgerbillitem` (
  `objid` varchar(75) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `qtrlyav` decimal(10,0) NOT NULL,
  `basic` decimal(10,0) NOT NULL,
  `basicpaid` decimal(10,0) NOT NULL,
  `basicint` decimal(10,0) NOT NULL,
  `basicintpaid` decimal(10,0) NOT NULL,
  `basicintpartial` decimal(10,2) NOT NULL,
  `basicdisc` decimal(10,0) NOT NULL,
  `basicdisctaken` decimal(10,0) NOT NULL,
  `basicamnesty` decimal(10,0) NOT NULL,
  `basicintamnesty` decimal(10,0) NOT NULL,
  `basiccredit` decimal(10,0) NOT NULL,
  `sef` decimal(10,0) NOT NULL,
  `sefpaid` decimal(10,0) NOT NULL,
  `sefint` decimal(10,0) NOT NULL,
  `sefintpaid` decimal(10,0) NOT NULL,
  `sefintpartial` decimal(10,2) NOT NULL,
  `sefdisc` decimal(10,0) NOT NULL,
  `sefdisctaken` decimal(10,0) NOT NULL,
  `sefamnesty` decimal(10,0) NOT NULL,
  `sefintamnesty` decimal(10,0) NOT NULL,
  `sefcredit` decimal(10,0) NOT NULL,
  `firecode` decimal(10,2) DEFAULT NULL,
  `firecodepaid` decimal(10,2) DEFAULT NULL,
  `revtype` varchar(15) DEFAULT NULL,
  `amnestyinfo` varchar(50) DEFAULT NULL,
  `forpayment` int(11) NOT NULL,
  `partial` int(11) DEFAULT NULL,
  `partialapplied` int(11) DEFAULT NULL,
  `partialbasic` decimal(10,2) DEFAULT NULL,
  `partialbasicint` decimal(10,2) DEFAULT NULL,
  `partialbasicdisc` decimal(10,2) DEFAULT NULL,
  `partialsef` decimal(10,2) DEFAULT NULL,
  `partialsefint` decimal(10,2) DEFAULT NULL,
  `partialsefdisc` decimal(10,2) DEFAULT NULL,
  `basicacctid` varchar(50) DEFAULT NULL,
  `basicintacctid` varchar(50) DEFAULT NULL,
  `sefacctid` varchar(50) DEFAULT NULL,
  `sefintacctid` varchar(50) DEFAULT NULL,
  `firecodeacctid` varchar(50) DEFAULT NULL,
  `lgushare` decimal(10,0) NOT NULL DEFAULT '0',
  `lguintshare` decimal(10,0) NOT NULL DEFAULT '0',
  `brgyshare` decimal(10,0) NOT NULL DEFAULT '0',
  `brgyintshare` decimal(10,0) NOT NULL DEFAULT '0',
  `brgyshareacctid` varchar(50) DEFAULT NULL,
  `brgyintshareacctid` varchar(50) DEFAULT NULL,
  `provshare` decimal(10,0) NOT NULL DEFAULT '0',
  `provintshare` decimal(10,0) NOT NULL DEFAULT '0',
  `provshareacctid` varchar(50) DEFAULT NULL,
  `provintshareacctid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptledgerbillitem_ledgeridyearqtr` (`rptledgerid`,`year`,`qtr`),
  KEY `ix_rptledgerbillitem_rptledgerfaasid` (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerid` (`rptledgerid`),
  CONSTRAINT `FK_rptledgerbillitem_rptledgerfaas` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`),
  CONSTRAINT `FK_rptledgerbillitem_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledgerfaas`
--

DROP TABLE IF EXISTS `rptledgerfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledgerfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `tdno` varchar(50) DEFAULT NULL,
  `txntype_objid` varchar(10) DEFAULT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `actualuse_objid` varchar(50) DEFAULT NULL,
  `taxable` int(11) NOT NULL,
  `backtax` int(11) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `systemcreated` int(11) NOT NULL,
  `reclassed` int(11) DEFAULT NULL,
  `idleland` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledgerfaas_faas` (`faasid`),
  KEY `FK_rptledgerhistory_rptledger` (`rptledgerid`),
  KEY `ix_rptledgerfaas_rptledgerid_faasid` (`rptledgerid`,`faasid`),
  KEY `ix_rptledgerfaas_tdno` (`tdno`),
  KEY `ix_rptledgerhistory_ledgerid_toyear` (`rptledgerid`,`toyear`),
  CONSTRAINT `FK_rptledgerfaas_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `FK_rptledgerfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptparameter`
--

DROP TABLE IF EXISTS `rptparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptparameter` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `description` longtext,
  `paramtype` varchar(20) NOT NULL,
  `minvalue` decimal(10,0) NOT NULL,
  `maxvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptparameter_name` (`name`),
  KEY `ix_rptparameter_caption` (`caption`),
  KEY `ix_rptparameter_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment`
--

DROP TABLE IF EXISTS `rptpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment` (
  `objid` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` date NOT NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectingagency` varchar(50) DEFAULT NULL,
  `voided` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_cashreceipt` (`receiptid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment_item`
--

DROP TABLE IF EXISTS `rptpayment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment_item` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) DEFAULT NULL,
  `rptledgerfaasid` varchar(50) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) DEFAULT NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(25) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `partialled` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_item_parentid` (`parentid`),
  KEY `fk_rptpayment_item_rptledgerfaasid` (`rptledgerfaasid`),
  KEY `ix_revperiod` (`revperiod`),
  KEY `ix_revtype` (`revtype`),
  KEY `ix_year` (`year`),
  CONSTRAINT `rptpayment_item_rptpayment` FOREIGN KEY (`parentid`) REFERENCES `rptpayment` (`objid`),
  CONSTRAINT `rptpayment_item_rptledgerfaas` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment_share`
--

DROP TABLE IF EXISTS `rptpayment_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment_share` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) DEFAULT NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `sharetype` varchar(25) NOT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) NOT NULL,
  `discount` decimal(16,4) DEFAULT NULL,
  `iscommon` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_share_item_objid` (`item_objid`),
  KEY `fk_rptpayment_share_parentid` (`parentid`),
  KEY `ix_revperiod` (`revperiod`),
  KEY `ix_revtype` (`revtype`),
  KEY `ix_year` (`year`),
  CONSTRAINT `rptpayment_share_rptpayment` FOREIGN KEY (`parentid`) REFERENCES `rptpayment` (`objid`),
  CONSTRAINT `rptpayment_share_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptreceipt_capture`
--

DROP TABLE IF EXISTS `rptreceipt_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptreceipt_capture` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `receiptno` varchar(25) NOT NULL,
  `receiptdate` date NOT NULL,
  `payorid` varchar(50) DEFAULT NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `collector` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `paidby` varchar(50) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `period` varchar(50) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `firecode` decimal(12,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptreceipt_capture_paidby` (`paidby`),
  KEY `ix_rptreceipt_payorid` (`payorid`),
  KEY `ix_rptreceipt_receiptno` (`receiptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttask`
--

DROP TABLE IF EXISTS `rpttask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttask` (
  `taskid` varchar(50) NOT NULL,
  `objid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `createdby_title` varchar(50) DEFAULT NULL,
  `assignedto_objid` varchar(50) DEFAULT NULL,
  `assignedto_name` varchar(150) DEFAULT NULL,
  `assignedto_title` varchar(50) DEFAULT NULL,
  `workflowid` varchar(50) DEFAULT NULL,
  `signatory` varchar(50) DEFAULT NULL,
  `docname` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_rpttask_assignedto_enddate` (`assignedto_objid`,`enddate`),
  KEY `ix_rpttask_assignedto_name` (`assignedto_name`),
  KEY `ix_rpttask_assignedto_objid` (`assignedto_objid`),
  KEY `ix_rpttask_createdby_name` (`createdby_name`),
  KEY `ix_rpttask_createdby_objid` (`createdby_objid`),
  KEY `ix_rpttask_enddate` (`enddate`),
  KEY `ix_rpttask_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxclearance`
--

DROP TABLE IF EXISTS `rpttaxclearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxclearance` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `reporttype` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_rpttaxclearance_rptcertification` FOREIGN KEY (`objid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxcredit`
--

DROP TABLE IF EXISTS `rpttaxcredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxcredit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `reftype` varchar(25) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(25) NOT NULL,
  `refdate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtapplied` decimal(16,2) NOT NULL,
  `rptledger_objid` varchar(50) NOT NULL,
  `srcledger_objid` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `approvedby_objid` varchar(50) DEFAULT NULL,
  `approvedby_name` varchar(150) DEFAULT NULL,
  `approvedby_title` varchar(75) DEFAULT NULL,
  `info` text,
  `discapplied` decimal(16,2) DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_txnno` (`txnno`),
  KEY `fk_rpttaxcredit_sys_user` (`approvedby_objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_rptledger_objid` (`rptledger_objid`),
  KEY `ix_srcledger_objid` (`srcledger_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_type` (`type`),
  CONSTRAINT `fk_rpttaxcredit_sys_user` FOREIGN KEY (`approvedby_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_rpttaxcredit_rptledger` FOREIGN KEY (`rptledger_objid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rpttaxcredit_srcledger` FOREIGN KEY (`srcledger_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxincentive`
--

DROP TABLE IF EXISTS `rpttaxincentive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxincentive` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) DEFAULT NULL,
  `txndate` date DEFAULT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `createdby_title` varchar(50) NOT NULL,
  `createdby_date` datetime NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rpttaxincentive_name` (`name`),
  KEY `ix_rpttaxincentive_state` (`state`),
  KEY `ix_rpttaxincentive_taxpayerid` (`taxpayer_objid`),
  KEY `ix_rpttaxincentive_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxincentive_item`
--

DROP TABLE IF EXISTS `rpttaxincentive_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxincentive_item` (
  `objid` varchar(50) NOT NULL,
  `rpttaxincentiveid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `basicrate` int(11) NOT NULL,
  `sefrate` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rpttaxincentiveitem_rptledgerid` (`rptledgerid`),
  KEY `ix_rpttaxincentiveitem_rpttaxincentiveid` (`rpttaxincentiveid`),
  CONSTRAINT `FK_rpttaxincentiveitem_rpttaxincentive` FOREIGN KEY (`rpttaxincentiveid`) REFERENCES `rpttaxincentive` (`objid`),
  CONSTRAINT `FK_rpttaxincentiveitem_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttracking`
--

DROP TABLE IF EXISTS `rpttracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttracking` (
  `objid` varchar(50) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `trackingno` varchar(25) NOT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `releasemode` varchar(50) DEFAULT NULL,
  `receivedby` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `landcount` int(11) DEFAULT '0',
  `bldgcount` int(11) DEFAULT '0',
  `machcount` int(11) DEFAULT '0',
  `planttreecount` int(11) DEFAULT '0',
  `misccount` int(11) DEFAULT '0',
  `pin` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rpttracking_trackingno` (`trackingno`),
  KEY `ix_rpttracking_pin` (`pin`),
  KEY `ix_rpttracking_receivedby` (`receivedby`),
  KEY `ix_rpttracking_remarks` (`remarks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttransmittal`
--

DROP TABLE IF EXISTS `rpttransmittal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttransmittal` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `txnno` varchar(15) NOT NULL,
  `txndate` datetime NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `lgu_name` varchar(50) NOT NULL,
  `lgu_type` varchar(50) NOT NULL,
  `tolgu_objid` varchar(50) NOT NULL,
  `tolgu_name` varchar(50) NOT NULL,
  `tolgu_type` varchar(50) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `createdby_title` varchar(50) NOT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_txnno` (`txnno`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_lguname` (`lgu_name`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttransmittal_item`
--

DROP TABLE IF EXISTS `rpttransmittal_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttransmittal_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(150) NOT NULL,
  `message` varchar(350) DEFAULT NULL,
  `remarks` varchar(350) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `disapprovedby_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_refid` (`parentid`,`refid`),
  KEY `FK_rpttransmittal_item_rpttransmittal` (`parentid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `rpttransmittal_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `rpttransmittal` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptworkflow`
--

DROP TABLE IF EXISTS `rptworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptworkflow` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `appliedto` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptworkflow_state`
--

DROP TABLE IF EXISTS `rptworkflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptworkflow_state` (
  `objid` varchar(50) NOT NULL,
  `workflowid` varchar(50) NOT NULL,
  `fromstate` varchar(50) DEFAULT NULL,
  `tostate` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `signatory` varchar(50) DEFAULT NULL,
  `message` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptworkflowstate_workflowid` (`workflowid`),
  CONSTRAINT `FK_rptworkflowstate_rptworkflow` FOREIGN KEY (`workflowid`) REFERENCES `rptworkflow` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu`
--

DROP TABLE IF EXISTS `rpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `realpropertyid` varchar(50) DEFAULT NULL,
  `rputype` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `fullpin` varchar(30) DEFAULT NULL,
  `suffix` int(11) NOT NULL,
  `subsuffix` int(11) DEFAULT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `exemptiontype_objid` varchar(50) DEFAULT NULL,
  `taxable` int(11) NOT NULL,
  `totalareaha` decimal(10,0) NOT NULL,
  `totalareasqm` decimal(10,0) NOT NULL,
  `totalbmv` decimal(10,0) NOT NULL,
  `totalmv` decimal(10,0) NOT NULL,
  `totalav` decimal(10,0) NOT NULL,
  `hasswornamount` int(11) NOT NULL,
  `swornamount` decimal(10,0) NOT NULL,
  `useswornamount` int(11) NOT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `rpumasterid` varchar(50) DEFAULT NULL,
  `reclassed` int(11) DEFAULT NULL,
  `isonline` int(11) DEFAULT '0',
  `stewardparentrpumasterid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rpu_exemptiontype` (`exemptiontype_objid`),
  KEY `FK_rpu_realpropertyid` (`realpropertyid`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  KEY `ix_rpu_fullpin` (`fullpin`),
  KEY `ix_rpu_rpumasterid` (`rpumasterid`),
  KEY `ix_rpu_ry_fullpin` (`fullpin`,`ry`),
  KEY `ix_rpu_ry_state` (`state`),
  KEY `ix_rpu_state` (`state`),
  KEY `ix_rpy_ry` (`ry`),
  CONSTRAINT `FK_rpu_rpumaster` FOREIGN KEY (`rpumasterid`) REFERENCES `rpumaster` (`objid`),
  CONSTRAINT `FK_rpu_exemptiontype` FOREIGN KEY (`exemptiontype_objid`) REFERENCES `exemptiontype` (`objid`),
  CONSTRAINT `FK_rpu_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_rpu_realpropertyid` FOREIGN KEY (`realpropertyid`) REFERENCES `realproperty` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu_assessment`
--

DROP TABLE IF EXISTS `rpu_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu_assessment` (
  `objid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) DEFAULT NULL,
  `actualuse_objid` varchar(50) DEFAULT NULL,
  `areasqm` decimal(16,2) NOT NULL,
  `areaha` decimal(16,6) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `rputype` varchar(25) DEFAULT NULL,
  `taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rpuassessmetn_rpu` (`rpuid`),
  CONSTRAINT `FK_rpuassessmetn_rpu` FOREIGN KEY (`rpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu_history`
--

DROP TABLE IF EXISTS `rpu_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu_history` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rpumaster_objid` varchar(50) NOT NULL,
  `tdno` varchar(50) NOT NULL,
  `prevtdno` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `titleno` varchar(50) DEFAULT NULL,
  `titledate` date DEFAULT NULL,
  `portionof` varchar(255) DEFAULT NULL,
  `owner_name` varchar(1500) NOT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `administrator_name` varchar(255) DEFAULT NULL,
  `administrator_address` varchar(255) DEFAULT NULL,
  `beneficiary_name` varchar(255) DEFAULT NULL,
  `beneficiary_address` varchar(255) DEFAULT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `totalareaha` decimal(16,6) NOT NULL,
  `totalareasqm` decimal(16,2) NOT NULL,
  `totalmv` decimal(16,2) NOT NULL,
  `totalav` decimal(16,2) NOT NULL,
  `memoranda` varchar(1500) NOT NULL,
  `surveyno` varchar(255) DEFAULT NULL,
  `cadastrallotno` varchar(255) DEFAULT NULL,
  `blockno` varchar(25) DEFAULT NULL,
  `purok` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `dtapproved` date NOT NULL,
  `cancelreason` varchar(50) NOT NULL,
  `canceldate` date NOT NULL,
  `cancelledbytdnos` varchar(255) NOT NULL,
  `prevhistory_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_administrator_name` (`administrator_name`),
  KEY `ix_cadastrallotno` (`cadastrallotno`),
  KEY `ix_cancelledbytdnos` (`cancelledbytdnos`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_owner_name` (`owner_name`(255)),
  KEY `ix_pin` (`pin`),
  KEY `ix_prevhistory_objid` (`prevhistory_objid`),
  KEY `ix_prevtdno` (`prevtdno`),
  KEY `ix_rpumasterid` (`rpumaster_objid`),
  KEY `ix_tdno` (`tdno`),
  KEY `ix_titleno` (`titleno`),
  CONSTRAINT `fk_rpuhistory_rpumaster` FOREIGN KEY (`rpumaster_objid`) REFERENCES `rpumaster` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu_type_suffix`
--

DROP TABLE IF EXISTS `rpu_type_suffix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu_type_suffix` (
  `objid` varchar(50) NOT NULL,
  `rputype` varchar(20) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpumaster`
--

DROP TABLE IF EXISTS `rpumaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpumaster` (
  `objid` varchar(50) NOT NULL,
  `currentfaasid` varchar(50) DEFAULT NULL,
  `currentrpuid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rysetting_lgu`
--

DROP TABLE IF EXISTS `rysetting_lgu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rysetting_lgu` (
  `rysettingid` varchar(50) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  `lguname` varchar(100) NOT NULL,
  `settingtype` varchar(15) NOT NULL,
  `barangayid` varchar(50) DEFAULT NULL,
  `objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lguid`,`rysettingid`),
  KEY `ix_lguid` (`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rysettinginfo`
--

DROP TABLE IF EXISTS `rysettinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rysettinginfo` (
  `ry` int(11) NOT NULL,
  `ordinanceno` varchar(50) DEFAULT NULL,
  `ordinancedate` datetime DEFAULT NULL,
  `sangguniangname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signatory`
--

DROP TABLE IF EXISTS `signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signatory` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `personnelid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_signatory_doctype` (`doctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_rpt_registration`
--

DROP TABLE IF EXISTS `sms_rpt_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_rpt_registration` (
  `mobileno` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY (`mobileno`,`rptledgerid`),
  KEY `ix_smsrptreg_rptledgerid` (`rptledgerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialaccountsetting`
--

DROP TABLE IF EXISTS `specialaccountsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialaccountsetting` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `item_objid` varchar(50) NOT NULL DEFAULT '',
  `amount` decimal(16,2) NOT NULL,
  `collectiontypeid` varchar(50) NOT NULL,
  `revtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_specialaccountsetting_collectiontype` (`collectiontypeid`),
  CONSTRAINT `specialaccountsetting_ibfk_1` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `FK_specialaccountsetting_collectiontype` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sre_revenue_mapping`
--

DROP TABLE IF EXISTS `sre_revenue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sre_revenue_mapping` (
  `objid` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `revenueitemid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sreaccount`
--

DROP TABLE IF EXISTS `sreaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `chartid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `acctgroup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sreaccount_incometarget`
--

DROP TABLE IF EXISTS `sreaccount_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount_incometarget` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`objid`,`year`),
  CONSTRAINT `sreaccount_incometarget_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sreaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structure`
--

DROP TABLE IF EXISTS `structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `indexno` int(11) NOT NULL,
  `showinfaas` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_structure_code` (`code`),
  UNIQUE KEY `ux_structure_name` (`name`),
  KEY `ix_structure_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structurematerial`
--

DROP TABLE IF EXISTS `structurematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structurematerial` (
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) NOT NULL,
  `display` int(11) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`material_objid`,`structure_objid`),
  KEY `FK_structurematerial_material` (`material_objid`),
  KEY `FK_structurematerial_strucutre` (`structure_objid`),
  CONSTRAINT `FK_structurematerial_strucutre` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`),
  CONSTRAINT `FK_structurematerial_material` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcollector_remittance`
--

DROP TABLE IF EXISTS `subcollector_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(30) NOT NULL,
  `subcollector_objid` varchar(50) NOT NULL,
  `subcollector_name` varchar(100) NOT NULL,
  `subcollector_title` varchar(50) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(10,0) DEFAULT NULL,
  `totalnoncash` decimal(10,0) DEFAULT NULL,
  `cashbreakdown` varchar(800) DEFAULT NULL,
  `collectionsummaries` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  KEY `ix_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcollector_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `subcollector_remittance_cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance_cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subcollector_remittance_cashreceipt_remittance` (`remittanceid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`),
  CONSTRAINT `FK_subcollector_remittance_cashreceipt_cashreceipt` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `FK_subcollector_remittance_cashreceipt_remittance` FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdividedland`
--

DROP TABLE IF EXISTS `subdividedland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdividedland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(10) DEFAULT NULL,
  `newtdno` varchar(50) DEFAULT NULL,
  `newutdno` varchar(50) DEFAULT NULL,
  `newpin` varchar(25) NOT NULL,
  `newtitletype` varchar(50) DEFAULT NULL,
  `newtitleno` varchar(50) DEFAULT NULL,
  `newtitledate` varchar(50) DEFAULT NULL,
  `areasqm` decimal(16,6) DEFAULT NULL,
  `areaha` decimal(16,6) DEFAULT NULL,
  `memoranda` longtext,
  `administrator_objid` varchar(50) DEFAULT NULL,
  `administrator_name` varchar(200) DEFAULT NULL,
  `administrator_address` varchar(200) DEFAULT NULL,
  `taxpayer_objid` varchar(50) DEFAULT NULL,
  `taxpayer_name` longtext,
  `taxpayer_address` varchar(200) DEFAULT NULL,
  `owner_name` longtext,
  `owner_address` longtext,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) DEFAULT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_newpin` (`subdivisionid`,`newpin`),
  KEY `FK_subdividedland_faas` (`newfaasid`),
  KEY `FK_subdividedland_newrp` (`newrpid`),
  KEY `FK_subdividedland_newrpu` (`newrpuid`),
  KEY `FK_subdividedland_subdivision` (`subdivisionid`),
  KEY `ix_subdividedland_newpin` (`newpin`),
  CONSTRAINT `FK_subdividedland_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`),
  CONSTRAINT `FK_subdividedland_faas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdividedland_newrp` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `FK_subdividedland_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision`
--

DROP TABLE IF EXISTS `subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `autonumber` int(11) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` longtext NOT NULL,
  `motherfaasid` varchar(50) DEFAULT NULL,
  `lguid` varchar(50) DEFAULT NULL,
  `signatories` longtext,
  `source` varchar(50) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `originlguid` varchar(50) DEFAULT NULL,
  `mothertdnos` longtext,
  `motherpins` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_subdivision_txnno` (`txnno`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_subdivision_motherpins` (`motherpins`(255)),
  KEY `ix_subdivision_mothertdnos` (`mothertdnos`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_assist`
--

DROP TABLE IF EXISTS `subdivision_assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_assist` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `taskstate` varchar(50) NOT NULL,
  `assignee_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parent_assignee` (`parent_objid`,`taskstate`,`assignee_objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  CONSTRAINT `fk_subdivision_assist_user` FOREIGN KEY (`assignee_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_subdivision_assist_subdivision` FOREIGN KEY (`parent_objid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_assist_item`
--

DROP TABLE IF EXISTS `subdivision_assist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_assist_item` (
  `objid` varchar(50) NOT NULL,
  `subdivision_objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `pintype` varchar(10) NOT NULL,
  `section` varchar(5) NOT NULL,
  `startparcel` int(11) NOT NULL,
  `endparcel` int(11) NOT NULL,
  `parcelcount` int(11) DEFAULT NULL,
  `parcelcreated` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_subdivision_objid` (`subdivision_objid`),
  CONSTRAINT `fk_subdivision_assist_item_subdivision_assist` FOREIGN KEY (`parent_objid`) REFERENCES `subdivision_assist` (`objid`),
  CONSTRAINT `fk_subdivision_assist_item_subdivision` FOREIGN KEY (`subdivision_objid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_cancelledimprovement`
--

DROP TABLE IF EXISTS `subdivision_cancelledimprovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_cancelledimprovement` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `remarks` longtext,
  `lasttaxyear` int(11) DEFAULT NULL,
  `lguid` varchar(50) DEFAULT NULL,
  `reason_objid` varchar(50) DEFAULT NULL,
  `cancelledbytdnos` varchar(500) DEFAULT NULL,
  `cancelledbypins` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subdivision_cancelledimprovement_faas` (`faasid`),
  KEY `FK_subdivision_cancelledimprovement_subdivision` (`parentid`),
  CONSTRAINT `FK_subdivision_cancelledimprovement_subdivision` FOREIGN KEY (`parentid`) REFERENCES `subdivision` (`objid`),
  CONSTRAINT `FK_subdivision_cancelledimprovement_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_motherland`
--

DROP TABLE IF EXISTS `subdivision_motherland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_motherland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `rpid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidatedland_faas` (`landfaasid`),
  KEY `FK_consolidatedland_subdivision` (`subdivisionid`),
  CONSTRAINT `FK_subdivison_motherland_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`),
  CONSTRAINT `FK_subdivision_motherland_faas` FOREIGN KEY (`landfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_task`
--

DROP TABLE IF EXISTS `subdivision_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `assignee_title` varchar(80) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `actor_title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `signature` longtext,
  `returnedby` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivisionaffectedrpu`
--

DROP TABLE IF EXISTS `subdivisionaffectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivisionaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(50) DEFAULT NULL,
  `subdividedlandid` varchar(50) DEFAULT NULL,
  `prevfaasid` varchar(50) DEFAULT NULL,
  `newfaasid` varchar(50) DEFAULT NULL,
  `newtdno` varchar(50) DEFAULT NULL,
  `newutdno` varchar(50) DEFAULT NULL,
  `newsuffix` int(11) DEFAULT NULL,
  `newpin` varchar(25) DEFAULT NULL,
  `newrpuid` varchar(50) DEFAULT NULL,
  `newrpid` varchar(50) DEFAULT NULL,
  `memoranda` longtext,
  `prevpin` varchar(50) DEFAULT NULL,
  `prevtdno` varchar(50) DEFAULT NULL,
  `isnew` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subdivisionaffectedpru_newfaas` (`newfaasid`),
  KEY `FK_subdivisionaffectedpru_newrpu` (`newrpuid`),
  KEY `FK_subdivisionaffectedpru_prevfaas` (`prevfaasid`),
  KEY `FK_subdivisionaffectedpru_subdividedland` (`subdividedlandid`),
  KEY `FK_subdivisionaffectedpru_subdivision` (`subdivisionid`),
  KEY `ix_subdivisionaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `FK_subdivisionaffectedpru_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_subdividedland` FOREIGN KEY (`subdividedlandid`) REFERENCES `subdividedland` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata`
--

DROP TABLE IF EXISTS `syncdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  `remote_orgid` varchar(50) DEFAULT NULL,
  `remote_orgcode` varchar(20) DEFAULT NULL,
  `remote_orgclass` varchar(20) DEFAULT NULL,
  `sender_objid` varchar(50) DEFAULT NULL,
  `sender_name` varchar(150) DEFAULT NULL,
  `fileid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_fileid` (`fileid`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata_forprocess`
--

DROP TABLE IF EXISTS `syncdata_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata_forprocess` (
  `objid` varchar(50) NOT NULL,
  `processed` int(11) DEFAULT '0',
  PRIMARY KEY (`objid`),
  CONSTRAINT `fk_forprocess_syncdata_item` FOREIGN KEY (`objid`) REFERENCES `syncdata_item` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata_forsync`
--

DROP TABLE IF EXISTS `syncdata_forsync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata_forsync` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(100) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(100) NOT NULL,
  `orgid` varchar(25) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `createdby_title` varchar(100) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_createdbyid` (`createdby_objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata_item`
--

DROP TABLE IF EXISTS `syncdata_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(255) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `error` text,
  `idx` int(11) NOT NULL,
  `info` text,
  `async` int(11) DEFAULT '0',
  `dependedaction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_syncdataitem_syncdata` FOREIGN KEY (`parentid`) REFERENCES `syncdata` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata_org`
--

DROP TABLE IF EXISTS `syncdata_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata_org` (
  `orgid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `errorcount` int(11) DEFAULT '0',
  PRIMARY KEY (`orgid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncdata_pending`
--

DROP TABLE IF EXISTS `syncdata_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata_pending` (
  `objid` varchar(50) NOT NULL,
  `error` text,
  `expirydate` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_expirydate` (`expirydate`),
  CONSTRAINT `fk_syncdata_pending_syncdata` FOREIGN KEY (`objid`) REFERENCES `syncdata` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_dataset`
--

DROP TABLE IF EXISTS `sys_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dataset` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `input` longtext,
  `output` longtext,
  `statement` varchar(50) DEFAULT NULL,
  `datasource` varchar(50) DEFAULT NULL,
  `servicename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_domain`
--

DROP TABLE IF EXISTS `sys_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_domain` (
  `name` varchar(50) NOT NULL,
  `connection` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_email_queue`
--

DROP TABLE IF EXISTS `sys_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_queue` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `dtsent` datetime NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `errmsg` longtext,
  `connection` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_dtsent` (`dtsent`),
  KEY `ix_refid` (`refid`),
  KEY `ix_reportid` (`reportid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_email_template`
--

DROP TABLE IF EXISTS `sys_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_template` (
  `objid` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`objid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_keywords` (`keywords`),
  KEY `ix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_fileitem`
--

DROP TABLE IF EXISTS `sys_fileitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fileitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `caption` varchar(155) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `filelocid` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `thumbnail` text,
  PRIMARY KEY (`objid`),
  KEY `ix_filelocid` (`filelocid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_sys_fileitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_file` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_fileloc`
--

DROP TABLE IF EXISTS `sys_fileloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fileloc` (
  `objid` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rootdir` varchar(255) DEFAULT NULL,
  `defaultloc` int(11) NOT NULL,
  `loctype` varchar(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_loctype` (`loctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_org` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `parent_objid` varchar(50) DEFAULT NULL,
  `parent_orgclass` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `root` int(11) NOT NULL DEFAULT '0',
  `txncode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `idx_org_name` (`name`,`parent_objid`),
  UNIQUE KEY `uix_orgcode` (`code`),
  KEY `FK_sys_org` (`parent_orgclass`),
  KEY `FK_sys_org_orgclass` (`orgclass`),
  KEY `ix_parent_objid` (`parent_objid`),
  CONSTRAINT `sys_org_ibfk_2` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `FK_sys_org` FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `FK_sys_org_orgclass` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `sys_org_ibfk_1` FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_orgclass`
--

DROP TABLE IF EXISTS `sys_orgclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_orgclass` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parentclass` varchar(255) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_quarter`
--

DROP TABLE IF EXISTS `sys_quarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_quarter` (
  `qtrid` int(11) NOT NULL,
  PRIMARY KEY (`qtrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report` (
  `objid` varchar(50) NOT NULL,
  `folderid` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filetype` varchar(25) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `datasetid` varchar(50) DEFAULT NULL,
  `template` mediumtext,
  `outputtype` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_datasetid` (`datasetid`),
  KEY `ix_folderid` (`folderid`),
  CONSTRAINT `fk_sys_report_datasetid` FOREIGN KEY (`datasetid`) REFERENCES `sys_dataset` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_admin`
--

DROP TABLE IF EXISTS `sys_report_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_admin` (
  `objid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `reportfolderid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_admin_folder` (`reportfolderid`),
  KEY `FK_sys_report_admin_user` (`userid`),
  CONSTRAINT `sys_report_admin_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `FK_sys_report_admin_folder` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `FK_sys_report_admin_user` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_report_admin_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_def`
--

DROP TABLE IF EXISTS `sys_report_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_def` (
  `name` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `reportheader` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `statement` longtext,
  `permission` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  `querytype` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `properties` longtext,
  PRIMARY KEY (`name`),
  KEY `ix_template` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_folder`
--

DROP TABLE IF EXISTS `sys_report_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_folder` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `idx_foldername` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_member`
--

DROP TABLE IF EXISTS `sys_report_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_member` (
  `objid` varchar(50) NOT NULL,
  `reportfolderid` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `usergroupid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_member_folder` (`reportfolderid`),
  KEY `FK_sys_report_member_user` (`userid`),
  KEY `FK_sys_report_member_usergroup` (`usergroupid`),
  CONSTRAINT `sys_report_member_ibfk_3` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_sys_report_member_folder` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `FK_sys_report_member_user` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `FK_sys_report_member_usergroup` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_subreport_def`
--

DROP TABLE IF EXISTS `sys_report_subreport_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_subreport_def` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `reportid` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `querytype` varchar(50) DEFAULT NULL,
  `statement` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_reportid` (`reportid`),
  CONSTRAINT `fk_sys_report_subreport_def_reportid` FOREIGN KEY (`reportid`) REFERENCES `sys_report_def` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_template`
--

DROP TABLE IF EXISTS `sys_report_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_template` (
  `name` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `master` int(11) DEFAULT NULL,
  `icon` mediumblob,
  PRIMARY KEY (`name`),
  UNIQUE KEY `uix_filepath` (`filepath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_requirement_type`
--

DROP TABLE IF EXISTS `sys_requirement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_requirement_type` (
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `objid` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `agency` varchar(50) DEFAULT NULL,
  `sortindex` int(11) NOT NULL,
  `verifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT '0',
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) NOT NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_ruleset_name` (`ruleset`,`name`,`_ukey`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `fk_sys_rule_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`),
  CONSTRAINT `fk_sys_rule_rulegroup_ruleset` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_actiondef_objid` (`actiondef_objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `fk_sys_rule_action_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`),
  CONSTRAINT `fk_sys_rule_action_actiondef_objid` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `parentid` varchar(50) NOT NULL,
  `actiondefparam_objid` varchar(255) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_actiondefparam_objid` (`actiondefparam_objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_actiondefparam_objid` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `fk_sys_rule_actiondef_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fact_objid` (`fact_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `fk_sys_rule_condition_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_fact_objid` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(255) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_field_objid` (`field_objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_field_objid` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_ruleid` (`ruleid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `fk_sys_rule_condition_var_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `ruletext` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `fk_sys_rule_fact_field_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT '0',
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `fk_sys_rulegroup_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`actiondef`,`ruleset`),
  KEY `actiondef` (`actiondef`),
  KEY `fk_sys_ruleset_actiondef_ruleset` (`ruleset`),
  CONSTRAINT `fk_sys_ruleset_actiondef_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`rulefact`,`ruleset`),
  KEY `rulefact` (`rulefact`),
  KEY `fk_sys_ruleset_fact_ruleset` (`ruleset`),
  CONSTRAINT `fk_sys_ruleset_fact_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `title` longtext,
  `content` longtext,
  `category` varchar(20) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(100) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `idx_securitygroup_name` (`name`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_securitygroup_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_sys_securitygroup_usergroup` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `clienttype` varchar(12) DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL,
  `accessexpiry` datetime DEFAULT NULL,
  `timein` datetime DEFAULT NULL,
  `terminalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `clienttype` varchar(12) DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL,
  `accessexpiry` datetime DEFAULT NULL,
  `timein` datetime DEFAULT NULL,
  `timeout` datetime DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `terminalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `parentcode` varchar(50) DEFAULT NULL,
  `parenttype` varchar(50) DEFAULT NULL,
  `macaddress` varchar(50) DEFAULT NULL,
  `dtregistered` datetime DEFAULT NULL,
  `registeredby` varchar(50) DEFAULT NULL,
  `info` longtext,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`terminalid`),
  KEY `FK_terminal` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  `pwdlogincount` int(11) DEFAULT NULL,
  `pwdexpirydate` datetime DEFAULT NULL,
  `usedpwds` longtext,
  `lockid` varchar(32) DEFAULT NULL,
  `txncode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sys_user_role` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `domain` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `txncode` tinyint NOT NULL,
  `jobtitle` tinyint NOT NULL,
  `usergroupmemberid` tinyint NOT NULL,
  `usergroup_objid` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_username` varchar(50) DEFAULT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `idx_usergroup_admin_user` (`usergroupid`,`user_objid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_sys_usergroup_admin` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `FK_sys_usergroup_admin_usergroup` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) DEFAULT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_orgclass` varchar(50) DEFAULT NULL,
  `securitygroup_objid` varchar(100) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  `displayname` varchar(50) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroup_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  KEY `sys_usergroup_member_ibfk_4` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_4` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_sys_usergroup_member` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `FK_sys_usergroup_member_org` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `FK_sys_usergroup_member_securitygroup` FOREIGN KEY (`securitygroup_objid`) REFERENCES `sys_securitygroup` (`objid`),
  CONSTRAINT `FK_sys_usergroup_member_usergroup` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_2` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(100) NOT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_2` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_sys_usergroup_permission_usergroup` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `FK_usergroup_permission_usergroup` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_assignee`
--

DROP TABLE IF EXISTS `sys_wf_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_assignee` (
  `objid` varchar(50) NOT NULL,
  `processname` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `expr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) NOT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `ui` longtext,
  `properties` longtext,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_subtask`
--

DROP TABLE IF EXISTS `sys_wf_subtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_subtask` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `taskid` varchar(50) DEFAULT NULL,
  `requester_objid` varchar(50) DEFAULT NULL,
  `requester_name` varchar(100) DEFAULT NULL,
  `requestdate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_wf_subtask_sys_wf_task` (`taskid`),
  CONSTRAINT `FK_sys_wf_subtask_sys_wf_task` FOREIGN KEY (`taskid`) REFERENCES `sys_wf_task` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_task`
--

DROP TABLE IF EXISTS `sys_wf_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_task` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` longtext,
  `properties` longtext,
  `permission` varchar(50) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` longtext,
  PRIMARY KEY (`action`,`parentid`,`processname`,`to`),
  KEY `FK_sys_wf_transition_wf_node` (`parentid`,`processname`),
  CONSTRAINT `FK_sys_wf_transition_wf_node` FOREIGN KEY (`parentid`, `processname`) REFERENCES `sys_wf_node` (`name`, `processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_workitemtype`
--

DROP TABLE IF EXISTS `sys_wf_workitemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_workitemtype` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `processname` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `expr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_wf_subtasktype_node` (`processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treasury_variableinfo`
--

DROP TABLE IF EXISTS `treasury_variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasury_variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arrayvalues` longtext,
  `system` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnlog`
--

DROP TABLE IF EXISTS `txnlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnlog` (
  `objid` varchar(50) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `refid` varchar(500) NOT NULL,
  `txndate` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `remarks` longtext,
  `diff` longtext,
  `username` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txnlog_action` (`action`),
  KEY `ix_txnlog_ref` (`ref`),
  KEY `ix_txnlog_refid` (`refid`(255)),
  KEY `ix_txnlog_userid` (`userid`),
  KEY `ix_txnlog_useridaction` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnref`
--

DROP TABLE IF EXISTS `txnref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnref` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `ux_txnref_objid` (`objid`),
  KEY `ix_txnref_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnsignatory`
--

DROP TABLE IF EXISTS `txnsignatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnsignatory` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `personnelid` varchar(50) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `caption` varchar(25) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dtsigned` datetime DEFAULT NULL,
  `seqno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_signatory_personnel` (`personnelid`),
  KEY `ix_signatory_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variableinfo`
--

DROP TABLE IF EXISTS `variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arrayvalues` longtext,
  `system` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vw_account_income_summary`
--

DROP TABLE IF EXISTS `vw_account_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_income_summary` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `accttype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_incometarget`
--

DROP TABLE IF EXISTS `vw_account_incometarget`;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_incometarget` (
  `objid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `target` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `item_objid` tinyint NOT NULL,
  `item_code` tinyint NOT NULL,
  `item_title` tinyint NOT NULL,
  `item_level` tinyint NOT NULL,
  `item_leftindex` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_code` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_level` tinyint NOT NULL,
  `group_leftindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_item_mapping`
--

DROP TABLE IF EXISTS `vw_account_item_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_item_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_mapping`
--

DROP TABLE IF EXISTS `vw_account_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_control_detail`
--

DROP TABLE IF EXISTS `vw_af_control_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_control_detail` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `indexno` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `aftxnitemid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `txntype` tinyint NOT NULL,
  `receivedstartseries` tinyint NOT NULL,
  `receivedendseries` tinyint NOT NULL,
  `beginstartseries` tinyint NOT NULL,
  `beginendseries` tinyint NOT NULL,
  `issuedstartseries` tinyint NOT NULL,
  `issuedendseries` tinyint NOT NULL,
  `endingstartseries` tinyint NOT NULL,
  `endingendseries` tinyint NOT NULL,
  `qtyreceived` tinyint NOT NULL,
  `qtybegin` tinyint NOT NULL,
  `qtyissued` tinyint NOT NULL,
  `qtyending` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `issuedto_objid` tinyint NOT NULL,
  `issuedto_name` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL,
  `prevdetailid` tinyint NOT NULL,
  `aftxnid` tinyint NOT NULL,
  `afid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `currentseries` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL,
  `cost` tinyint NOT NULL,
  `batchno` tinyint NOT NULL,
  `controlstate` tinyint NOT NULL,
  `qtybalance` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_inventory_summary`
--

DROP TABLE IF EXISTS `vw_af_inventory_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_inventory_summary` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL,
  `countopen` tinyint NOT NULL,
  `countissued` tinyint NOT NULL,
  `countclosed` tinyint NOT NULL,
  `countsold` tinyint NOT NULL,
  `countprocessing` tinyint NOT NULL,
  `counthold` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_afunit`
--

DROP TABLE IF EXISTS `vw_afunit`;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_afunit` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `usetype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `cashreceiptprintout` tinyint NOT NULL,
  `cashreceiptdetailprintout` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_assessment_notice`
--

DROP TABLE IF EXISTS `vw_assessment_notice`;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_assessment_notice` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `taxpayerid` tinyint NOT NULL,
  `taxpayername` tinyint NOT NULL,
  `taxpayeraddress` tinyint NOT NULL,
  `dtdelivered` tinyint NOT NULL,
  `receivedby` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `assessmentyear` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `titleno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_assessment_notice_item`
--

DROP TABLE IF EXISTS `vw_assessment_notice_item`;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_assessment_notice_item` (
  `objid` tinyint NOT NULL,
  `assessmentnoticeid` tinyint NOT NULL,
  `info` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalbmv` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `parcel` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `claimno` tinyint NOT NULL,
  `street` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classification` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_batch_rpttaxcredit_error`
--

DROP TABLE IF EXISTS `vw_batch_rpttaxcredit_error`;
/*!50001 DROP VIEW IF EXISTS `vw_batch_rpttaxcredit_error`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_batch_rpttaxcredit_error` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `error` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_batchgr`
--

DROP TABLE IF EXISTS `vw_batchgr`;
/*!50001 DROP VIEW IF EXISTS `vw_batchgr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_batchgr` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `lgu_objid` tinyint NOT NULL,
  `barangay_objid` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `memoranda` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `originlgu_objid` tinyint NOT NULL,
  `lgu_name` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `barangay_pin` tinyint NOT NULL,
  `classification_name` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `taskstate` tinyint NOT NULL,
  `assignee_objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_building`
--

DROP TABLE IF EXISTS `vw_building`;
/*!50001 DROP VIEW IF EXISTS `vw_building`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_building` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `realpropertyid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `lgu_objid` tinyint NOT NULL,
  `lgu_name` tinyint NOT NULL,
  `barangay_objid` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `classification_name` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `bldgtype_objid` tinyint NOT NULL,
  `bldgtype_name` tinyint NOT NULL,
  `bldgkind_objid` tinyint NOT NULL,
  `bldgkind_name` tinyint NOT NULL,
  `basemarketvalue` tinyint NOT NULL,
  `adjustment` tinyint NOT NULL,
  `depreciationvalue` tinyint NOT NULL,
  `marketvalue` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `actualuse_objid` tinyint NOT NULL,
  `actualuse_name` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_business_application_lob_retire`
--

DROP TABLE IF EXISTS `vw_business_application_lob_retire`;
/*!50001 DROP VIEW IF EXISTS `vw_business_application_lob_retire`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_business_application_lob_retire` (
  `businessid` tinyint NOT NULL,
  `applicationid` tinyint NOT NULL,
  `appno` tinyint NOT NULL,
  `appyear` tinyint NOT NULL,
  `dtfiled` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `tradename` tinyint NOT NULL,
  `bin` tinyint NOT NULL,
  `assessmenttype` tinyint NOT NULL,
  `lobid` tinyint NOT NULL,
  `lobname` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share_payable` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `payableitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share_payable` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share_payable` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiongroup` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiongroupid` tinyint NOT NULL,
  `generic` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `hasorg` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash_liquidated` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectionvoucher_objid` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `collectionvoucher_controldate` tinyint NOT NULL,
  `depositvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_certification_land_improvement`
--

DROP TABLE IF EXISTS `vw_certification_land_improvement`;
/*!50001 DROP VIEW IF EXISTS `vw_certification_land_improvement`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_certification_land_improvement` (
  `faasid` tinyint NOT NULL,
  `improvement` tinyint NOT NULL,
  `areacovered` tinyint NOT NULL,
  `productive` tinyint NOT NULL,
  `nonproductive` tinyint NOT NULL,
  `basemarketvalue` tinyint NOT NULL,
  `marketvalue` tinyint NOT NULL,
  `unitvalue` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_certification_landdetail`
--

DROP TABLE IF EXISTS `vw_certification_landdetail`;
/*!50001 DROP VIEW IF EXISTS `vw_certification_landdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_certification_landdetail` (
  `faasid` tinyint NOT NULL,
  `areaha` tinyint NOT NULL,
  `areasqm` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `marketvalue` tinyint NOT NULL,
  `basemarketvalue` tinyint NOT NULL,
  `unitvalue` tinyint NOT NULL,
  `specificclass_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiongroup`
--

DROP TABLE IF EXISTS `vw_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiongroup` (
  `objid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `sharing` tinyint NOT NULL,
  `orgid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype`
--

DROP TABLE IF EXISTS `vw_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `handler` tinyint NOT NULL,
  `allowbatch` tinyint NOT NULL,
  `barcodekey` tinyint NOT NULL,
  `allowonline` tinyint NOT NULL,
  `allowoffline` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `queuesection` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `af_formtype` tinyint NOT NULL,
  `af_serieslength` tinyint NOT NULL,
  `af_denomination` tinyint NOT NULL,
  `af_baseunit` tinyint NOT NULL,
  `allowpaymentorder` tinyint NOT NULL,
  `allowkiosk` tinyint NOT NULL,
  `allowcreditmemo` tinyint NOT NULL,
  `connection` tinyint NOT NULL,
  `servicename` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype_account`
--

DROP TABLE IF EXISTS `vw_collectiontype_account`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype_account` (
  `objid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `tag` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptitem` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptshare` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_deposit_fund_transfer`
--

DROP TABLE IF EXISTS `vw_deposit_fund_transfer`;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_deposit_fund_transfer` (
  `objid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `todepositvoucherfundid` tinyint NOT NULL,
  `todepositvoucherfund_fund_objid` tinyint NOT NULL,
  `todepositvoucherfund_fund_code` tinyint NOT NULL,
  `todepositvoucherfund_fund_title` tinyint NOT NULL,
  `fromdepositvoucherfundid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_objid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_code` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_mapping`
--

DROP TABLE IF EXISTS `vw_entity_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_mapping` (
  `objid` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_municipality` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_relation`
--

DROP TABLE IF EXISTS `vw_entity_relation`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_relation` (
  `objid` tinyint NOT NULL,
  `ownerid` tinyint NOT NULL,
  `entityid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `relationship` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual`
--

DROP TABLE IF EXISTS `vw_entityindividual`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `birthplace` tinyint NOT NULL,
  `citizenship` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `civilstatus` tinyint NOT NULL,
  `profession` tinyint NOT NULL,
  `tin` tinyint NOT NULL,
  `sss` tinyint NOT NULL,
  `height` tinyint NOT NULL,
  `weight` tinyint NOT NULL,
  `acr` tinyint NOT NULL,
  `religion` tinyint NOT NULL,
  `photo` tinyint NOT NULL,
  `thumbnail` tinyint NOT NULL,
  `profileid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `entityname` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL,
  `address_objid` tinyint NOT NULL,
  `address_text` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual_lookup`
--

DROP TABLE IF EXISTS `vw_entityindividual_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual_lookup` (
  `objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityrelation_lookup`
--

DROP TABLE IF EXISTS `vw_entityrelation_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityrelation_lookup` (
  `objid` tinyint NOT NULL,
  `entity_objid` tinyint NOT NULL,
  `relateto_objid` tinyint NOT NULL,
  `relation_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_faas_lookup`
--

DROP TABLE IF EXISTS `vw_faas_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_faas_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_faas_lookup` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `utdno` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `prevtdno` tinyint NOT NULL,
  `cancelreason` tinyint NOT NULL,
  `cancelledbytdnos` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `realpropertyid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `originlguid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `classification_code` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classification_name` tinyint NOT NULL,
  `classname` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `trackingno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_fund`
--

DROP TABLE IF EXISTS `vw_fund`;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_fund` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `depositoryfundid` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_indexno` tinyint NOT NULL,
  `depositoryfund_objid` tinyint NOT NULL,
  `depositoryfund_state` tinyint NOT NULL,
  `depositoryfund_code` tinyint NOT NULL,
  `depositoryfund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_idle_land`
--

DROP TABLE IF EXISTS `vw_idle_land`;
/*!50001 DROP VIEW IF EXISTS `vw_idle_land`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_idle_land` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `realpropertyid` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_ledger`
--

DROP TABLE IF EXISTS `vw_income_ledger`;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_ledger` (
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `itemacctid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `jevid` tinyint NOT NULL,
  `objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_summary`
--

DROP TABLE IF EXISTS `vw_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_summary` (
  `refid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refyear` tinyint NOT NULL,
  `refmonth` tinyint NOT NULL,
  `refqtr` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittanceyear` tinyint NOT NULL,
  `remittancemonth` tinyint NOT NULL,
  `remittanceqtr` tinyint NOT NULL,
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `liquidationyear` tinyint NOT NULL,
  `liquidationmonth` tinyint NOT NULL,
  `liquidationqtr` tinyint NOT NULL,
  `fundgroupid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL,
  `itemtype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_abstract_of_collection_detail`
--

DROP TABLE IF EXISTS `vw_landtax_abstract_of_collection_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_abstract_of_collection_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_abstract_of_collection_detail` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `ordate` tinyint NOT NULL,
  `orno` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `fromqtr` tinyint NOT NULL,
  `toqtr` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `taxpayername` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `municityname` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `assessvalue` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `basiccurrentyear` tinyint NOT NULL,
  `basicpreviousyear` tinyint NOT NULL,
  `basicdiscount` tinyint NOT NULL,
  `basicpenaltycurrent` tinyint NOT NULL,
  `basicpenaltyprevious` tinyint NOT NULL,
  `sefcurrentyear` tinyint NOT NULL,
  `sefpreviousyear` tinyint NOT NULL,
  `sefdiscount` tinyint NOT NULL,
  `sefpenaltycurrent` tinyint NOT NULL,
  `sefpenaltyprevious` tinyint NOT NULL,
  `basicidlecurrent` tinyint NOT NULL,
  `basicidleprevious` tinyint NOT NULL,
  `basicidlediscount` tinyint NOT NULL,
  `basicidlecurrentpenalty` tinyint NOT NULL,
  `basicidlepreviouspenalty` tinyint NOT NULL,
  `shcurrent` tinyint NOT NULL,
  `shprevious` tinyint NOT NULL,
  `shdiscount` tinyint NOT NULL,
  `shcurrentpenalty` tinyint NOT NULL,
  `shpreviouspenalty` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `partialled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_abstract_of_collection_detail_eor`
--

DROP TABLE IF EXISTS `vw_landtax_abstract_of_collection_detail_eor`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_abstract_of_collection_detail_eor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_abstract_of_collection_detail_eor` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `ordate` tinyint NOT NULL,
  `orno` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `fromqtr` tinyint NOT NULL,
  `toqtr` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `taxpayername` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `municityname` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `assessvalue` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `basiccurrentyear` tinyint NOT NULL,
  `basicpreviousyear` tinyint NOT NULL,
  `basicdiscount` tinyint NOT NULL,
  `basicpenaltycurrent` tinyint NOT NULL,
  `basicpenaltyprevious` tinyint NOT NULL,
  `sefcurrentyear` tinyint NOT NULL,
  `sefpreviousyear` tinyint NOT NULL,
  `sefdiscount` tinyint NOT NULL,
  `sefpenaltycurrent` tinyint NOT NULL,
  `sefpenaltyprevious` tinyint NOT NULL,
  `basicidlecurrent` tinyint NOT NULL,
  `basicidleprevious` tinyint NOT NULL,
  `basicidlediscount` tinyint NOT NULL,
  `basicidlecurrentpenalty` tinyint NOT NULL,
  `basicidlepreviouspenalty` tinyint NOT NULL,
  `shcurrent` tinyint NOT NULL,
  `shprevious` tinyint NOT NULL,
  `shdiscount` tinyint NOT NULL,
  `shcurrentpenalty` tinyint NOT NULL,
  `shpreviouspenalty` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `partialled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_detail`
--

DROP TABLE IF EXISTS `vw_landtax_collection_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_detail` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `brgyindex` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `interest` tinyint NOT NULL,
  `discount` tinyint NOT NULL,
  `classname` tinyint NOT NULL,
  `orderno` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `basiccurrent` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicprev` tinyint NOT NULL,
  `basiccurrentint` tinyint NOT NULL,
  `basicprevint` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `sefcurrent` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefprev` tinyint NOT NULL,
  `sefcurrentint` tinyint NOT NULL,
  `sefprevint` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `idlecurrent` tinyint NOT NULL,
  `idleprev` tinyint NOT NULL,
  `idledisc` tinyint NOT NULL,
  `idleint` tinyint NOT NULL,
  `idlenet` tinyint NOT NULL,
  `shcurrent` tinyint NOT NULL,
  `shprev` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `levynet` tinyint NOT NULL,
  `voided` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_detail_eor`
--

DROP TABLE IF EXISTS `vw_landtax_collection_detail_eor`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_detail_eor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_detail_eor` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `brgyindex` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `interest` tinyint NOT NULL,
  `discount` tinyint NOT NULL,
  `classname` tinyint NOT NULL,
  `orderno` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `basiccurrent` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicprev` tinyint NOT NULL,
  `basiccurrentint` tinyint NOT NULL,
  `basicprevint` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `sefcurrent` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefprev` tinyint NOT NULL,
  `sefcurrentint` tinyint NOT NULL,
  `sefprevint` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `idlecurrent` tinyint NOT NULL,
  `idleprev` tinyint NOT NULL,
  `idledisc` tinyint NOT NULL,
  `idleint` tinyint NOT NULL,
  `idlenet` tinyint NOT NULL,
  `shcurrent` tinyint NOT NULL,
  `shprev` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `levynet` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_disposition_detail`
--

DROP TABLE IF EXISTS `vw_landtax_collection_disposition_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_disposition_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_disposition_detail` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `provcitybasicshare` tinyint NOT NULL,
  `munibasicshare` tinyint NOT NULL,
  `brgybasicshare` tinyint NOT NULL,
  `provcitysefshare` tinyint NOT NULL,
  `munisefshare` tinyint NOT NULL,
  `brgysefshare` tinyint NOT NULL,
  `voided` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_disposition_detail_eor`
--

DROP TABLE IF EXISTS `vw_landtax_collection_disposition_detail_eor`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_disposition_detail_eor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_disposition_detail_eor` (
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `provcitybasicshare` tinyint NOT NULL,
  `munibasicshare` tinyint NOT NULL,
  `brgybasicshare` tinyint NOT NULL,
  `provcitysefshare` tinyint NOT NULL,
  `munisefshare` tinyint NOT NULL,
  `brgysefshare` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_share_detail`
--

DROP TABLE IF EXISTS `vw_landtax_collection_share_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_share_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_share_detail` (
  `liquidationid` tinyint NOT NULL,
  `liquidationno` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittanceno` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `sharetype` tinyint NOT NULL,
  `brgycurr` tinyint NOT NULL,
  `brgyprev` tinyint NOT NULL,
  `brgypenalty` tinyint NOT NULL,
  `brgycurrshare` tinyint NOT NULL,
  `brgyprevshare` tinyint NOT NULL,
  `brgypenaltyshare` tinyint NOT NULL,
  `citycurrshare` tinyint NOT NULL,
  `cityprevshare` tinyint NOT NULL,
  `citypenaltyshare` tinyint NOT NULL,
  `provmunicurrshare` tinyint NOT NULL,
  `provmuniprevshare` tinyint NOT NULL,
  `provmunipenaltyshare` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `discount` tinyint NOT NULL,
  `voided` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_collection_share_detail_eor`
--

DROP TABLE IF EXISTS `vw_landtax_collection_share_detail_eor`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_share_detail_eor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_collection_share_detail_eor` (
  `liquidationid` tinyint NOT NULL,
  `liquidationno` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittanceno` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `revtype` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `sharetype` tinyint NOT NULL,
  `brgycurr` tinyint NOT NULL,
  `brgyprev` tinyint NOT NULL,
  `brgypenalty` tinyint NOT NULL,
  `brgycurrshare` tinyint NOT NULL,
  `brgyprevshare` tinyint NOT NULL,
  `brgypenaltyshare` tinyint NOT NULL,
  `citycurrshare` tinyint NOT NULL,
  `cityprevshare` tinyint NOT NULL,
  `citypenaltyshare` tinyint NOT NULL,
  `provmunicurrshare` tinyint NOT NULL,
  `provmuniprevshare` tinyint NOT NULL,
  `provmunipenaltyshare` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `discount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_eor`
--

DROP TABLE IF EXISTS `vw_landtax_eor`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_eor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_eor` (
  `objid` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `partnerid` tinyint NOT NULL,
  `txntype` tinyint NOT NULL,
  `traceid` tinyint NOT NULL,
  `tracedate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `payer_objid` tinyint NOT NULL,
  `paymethod` tinyint NOT NULL,
  `paymentrefid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `lockid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_eor_remittance`
--

DROP TABLE IF EXISTS `vw_landtax_eor_remittance`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_eor_remittance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_eor_remittance` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `controlno` tinyint NOT NULL,
  `partnerid` tinyint NOT NULL,
  `controldate` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `createdby_objid` tinyint NOT NULL,
  `createdby_name` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `dtposted` tinyint NOT NULL,
  `postedby_objid` tinyint NOT NULL,
  `postedby_name` tinyint NOT NULL,
  `lockid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_lgu_account_mapping`
--

DROP TABLE IF EXISTS `vw_landtax_lgu_account_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_lgu_account_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_lgu_account_mapping` (
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `org_class` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `parent_code` tinyint NOT NULL,
  `parent_title` tinyint NOT NULL,
  `item_objid` tinyint NOT NULL,
  `item_code` tinyint NOT NULL,
  `item_title` tinyint NOT NULL,
  `item_fund_objid` tinyint NOT NULL,
  `item_fund_code` tinyint NOT NULL,
  `item_fund_title` tinyint NOT NULL,
  `item_type` tinyint NOT NULL,
  `item_tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_report_rptdelinquency`
--

DROP TABLE IF EXISTS `vw_landtax_report_rptdelinquency`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_report_rptdelinquency`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_report_rptdelinquency` (
  `objid` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `dtgenerated` tinyint NOT NULL,
  `dtcomputed` tinyint NOT NULL,
  `generatedby_name` tinyint NOT NULL,
  `generatedby_title` tinyint NOT NULL,
  `basic` tinyint NOT NULL,
  `basicint` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicdp` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `basicidle` tinyint NOT NULL,
  `basicidleint` tinyint NOT NULL,
  `basicidledisc` tinyint NOT NULL,
  `basicidledp` tinyint NOT NULL,
  `basicidlenet` tinyint NOT NULL,
  `sef` tinyint NOT NULL,
  `sefint` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefdp` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `firecodeint` tinyint NOT NULL,
  `firecodedisc` tinyint NOT NULL,
  `firecodedp` tinyint NOT NULL,
  `firecodenet` tinyint NOT NULL,
  `sh` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shdp` tinyint NOT NULL,
  `shnet` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_report_rptdelinquency_detail`
--

DROP TABLE IF EXISTS `vw_landtax_report_rptdelinquency_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_report_rptdelinquency_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_report_rptdelinquency_detail` (
  `parentid` tinyint NOT NULL,
  `objid` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `dtgenerated` tinyint NOT NULL,
  `dtcomputed` tinyint NOT NULL,
  `generatedby_name` tinyint NOT NULL,
  `generatedby_title` tinyint NOT NULL,
  `basic` tinyint NOT NULL,
  `basicint` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicdp` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `basicidle` tinyint NOT NULL,
  `basicidleint` tinyint NOT NULL,
  `basicidledisc` tinyint NOT NULL,
  `basicidledp` tinyint NOT NULL,
  `basicidlenet` tinyint NOT NULL,
  `sef` tinyint NOT NULL,
  `sefint` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefdp` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `firecodeint` tinyint NOT NULL,
  `firecodedisc` tinyint NOT NULL,
  `firecodedp` tinyint NOT NULL,
  `firecodenet` tinyint NOT NULL,
  `sh` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shdp` tinyint NOT NULL,
  `shnet` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_machine_smv`
--

DROP TABLE IF EXISTS `vw_machine_smv`;
/*!50001 DROP VIEW IF EXISTS `vw_machine_smv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_machine_smv` (
  `objid` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `machine_objid` tinyint NOT NULL,
  `expr` tinyint NOT NULL,
  `previd` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_machinery`
--

DROP TABLE IF EXISTS `vw_machinery`;
/*!50001 DROP VIEW IF EXISTS `vw_machinery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_machinery` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `realpropertyid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `lgu_objid` tinyint NOT NULL,
  `lgu_name` tinyint NOT NULL,
  `barangay_objid` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `classification_name` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `machine_objid` tinyint NOT NULL,
  `machine_name` tinyint NOT NULL,
  `basemarketvalue` tinyint NOT NULL,
  `marketvalue` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `actualuse_objid` tinyint NOT NULL,
  `actualuse_name` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_migrated_business`
--

DROP TABLE IF EXISTS `vw_migrated_business`;
/*!50001 DROP VIEW IF EXISTS `vw_migrated_business`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_migrated_business` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `bin` tinyint NOT NULL,
  `tradename` tinyint NOT NULL,
  `businessname` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address_text` tinyint NOT NULL,
  `owner_address_objid` tinyint NOT NULL,
  `yearstarted` tinyint NOT NULL,
  `orgtype` tinyint NOT NULL,
  `permittype` tinyint NOT NULL,
  `officetype` tinyint NOT NULL,
  `applicationid` tinyint NOT NULL,
  `appstate` tinyint NOT NULL,
  `appyear` tinyint NOT NULL,
  `apptype` tinyint NOT NULL,
  `appno` tinyint NOT NULL,
  `dtfiled` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `txnmode` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_newly_assessed_property`
--

DROP TABLE IF EXISTS `vw_newly_assessed_property`;
/*!50001 DROP VIEW IF EXISTS `vw_newly_assessed_property`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_newly_assessed_property` (
  `objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ocular_inspection`
--

DROP TABLE IF EXISTS `vw_ocular_inspection`;
/*!50001 DROP VIEW IF EXISTS `vw_ocular_inspection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ocular_inspection` (
  `objid` tinyint NOT NULL,
  `findings` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `dtinspected` tinyint NOT NULL,
  `inspectors` tinyint NOT NULL,
  `notedby` tinyint NOT NULL,
  `notedbytitle` tinyint NOT NULL,
  `photos` tinyint NOT NULL,
  `recommendations` tinyint NOT NULL,
  `inspectedby_objid` tinyint NOT NULL,
  `inspectedby_name` tinyint NOT NULL,
  `inspectedby_title` tinyint NOT NULL,
  `doctype` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `lgu_name` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `barangay_parentid` tinyint NOT NULL,
  `purok` tinyint NOT NULL,
  `street` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_online_business_application`
--

DROP TABLE IF EXISTS `vw_online_business_application`;
/*!50001 DROP VIEW IF EXISTS `vw_online_business_application`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_online_business_application` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `createdby_objid` tinyint NOT NULL,
  `createdby_name` tinyint NOT NULL,
  `controlno` tinyint NOT NULL,
  `apptype` tinyint NOT NULL,
  `appyear` tinyint NOT NULL,
  `appdate` tinyint NOT NULL,
  `prevapplicationid` tinyint NOT NULL,
  `business_objid` tinyint NOT NULL,
  `bin` tinyint NOT NULL,
  `tradename` tinyint NOT NULL,
  `businessname` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address_text` tinyint NOT NULL,
  `owner_address_objid` tinyint NOT NULL,
  `yearstarted` tinyint NOT NULL,
  `orgtype` tinyint NOT NULL,
  `permittype` tinyint NOT NULL,
  `officetype` tinyint NOT NULL,
  `step` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_real_property_payment`
--

DROP TABLE IF EXISTS `vw_real_property_payment`;
/*!50001 DROP VIEW IF EXISTS `vw_real_property_payment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_real_property_payment` (
  `cv_controldate` tinyint NOT NULL,
  `rem_controldate` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt` (
  `remittance_objid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindexno` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `totalnoncash` tinyint NOT NULL,
  `totalcash` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `payer_objid` tinyint NOT NULL,
  `payer_name` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `collector_name` tinyint NOT NULL,
  `collector_title` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_af`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_af` (
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_afsummary`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_afsummary` (
  `objid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptitem` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `bankid` tinyint NOT NULL,
  `bank_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptshare` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_consolidated_land`
--

DROP TABLE IF EXISTS `vw_report_consolidated_land`;
/*!50001 DROP VIEW IF EXISTS `vw_report_consolidated_land`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_consolidated_land` (
  `consolidationid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_consolidation`
--

DROP TABLE IF EXISTS `vw_report_consolidation`;
/*!50001 DROP VIEW IF EXISTS `vw_report_consolidation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_consolidation` (
  `objid` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_landrpu`
--

DROP TABLE IF EXISTS `vw_report_landrpu`;
/*!50001 DROP VIEW IF EXISTS `vw_report_landrpu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_landrpu` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `lgu` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `dtapproved` tinyint NOT NULL,
  `canceldate` tinyint NOT NULL,
  `cancelledbytdnos` tinyint NOT NULL,
  `prevtdno` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `specificclass` tinyint NOT NULL,
  `subclasscode` tinyint NOT NULL,
  `subclass` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `parcel` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalbmv` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_motherland_summary`
--

DROP TABLE IF EXISTS `vw_report_motherland_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_report_motherland_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_motherland_summary` (
  `subdivisionid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `titledate` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_orc`
--

DROP TABLE IF EXISTS `vw_report_orc`;
/*!50001 DROP VIEW IF EXISTS `vw_report_orc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_orc` (
  `objid` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `taxpayerid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `lgu_name` tinyint NOT NULL,
  `lgu_indexno` tinyint NOT NULL,
  `dtapproved` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `prevtdno` tinyint NOT NULL,
  `arpno` tinyint NOT NULL,
  `prevowner` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `remarks` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report_subdividedland`
--

DROP TABLE IF EXISTS `vw_report_subdividedland`;
/*!50001 DROP VIEW IF EXISTS `vw_report_subdividedland`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_report_subdividedland` (
  `objid` tinyint NOT NULL,
  `subdivisionid` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `titledate` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptcertification_item`
--

DROP TABLE IF EXISTS `vw_rptcertification_item`;
/*!50001 DROP VIEW IF EXISTS `vw_rptcertification_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptcertification_item` (
  `rptcertificationid` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `taxpayerid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classname` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `suffix` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `street` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptledger_avdifference`
--

DROP TABLE IF EXISTS `vw_rptledger_avdifference`;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_avdifference`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptledger_avdifference` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `actualuse_objid` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `backtax` tinyint NOT NULL,
  `fromyear` tinyint NOT NULL,
  `fromqtr` tinyint NOT NULL,
  `toyear` tinyint NOT NULL,
  `toqtr` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `systemcreated` tinyint NOT NULL,
  `reclassed` tinyint NOT NULL,
  `idleland` tinyint NOT NULL,
  `taxdifference` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptledger_cancelled_faas`
--

DROP TABLE IF EXISTS `vw_rptledger_cancelled_faas`;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_cancelled_faas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptledger_cancelled_faas` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `lastyearpaid` tinyint NOT NULL,
  `lastqtrpaid` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `prevtdno` tinyint NOT NULL,
  `titleno` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `beneficiary_objid` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `lgu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptpayment_item_detail`
--

DROP TABLE IF EXISTS `vw_rptpayment_item_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_rptpayment_item_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptpayment_item_detail` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `rptledgerfaasid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `basic` tinyint NOT NULL,
  `basicint` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicdp` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `basicidle` tinyint NOT NULL,
  `basicidleint` tinyint NOT NULL,
  `basicidledisc` tinyint NOT NULL,
  `basicidledp` tinyint NOT NULL,
  `sef` tinyint NOT NULL,
  `sefint` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefdp` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `sh` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shdp` tinyint NOT NULL,
  `shnet` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `partialled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rpu_assessment`
--

DROP TABLE IF EXISTS `vw_rpu_assessment`;
/*!50001 DROP VIEW IF EXISTS `vw_rpu_assessment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rpu_assessment` (
  `objid` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `dominantclass_objid` tinyint NOT NULL,
  `dominantclass_code` tinyint NOT NULL,
  `dominantclass_name` tinyint NOT NULL,
  `dominantclass_orderno` tinyint NOT NULL,
  `areasqm` tinyint NOT NULL,
  `areaha` tinyint NOT NULL,
  `marketvalue` tinyint NOT NULL,
  `assesslevel` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `actualuse_code` tinyint NOT NULL,
  `actualuse_name` tinyint NOT NULL,
  `actualuse_objid` tinyint NOT NULL,
  `actualuse_classcode` tinyint NOT NULL,
  `actualuse_classname` tinyint NOT NULL,
  `actualuse_orderno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_txn_log`
--

DROP TABLE IF EXISTS `vw_txn_log`;
/*!50001 DROP VIEW IF EXISTS `vw_txn_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_txn_log` (
  `userid` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `ref` tinyint NOT NULL,
  `action` tinyint NOT NULL,
  `cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowstate`
--

DROP TABLE IF EXISTS `workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowstate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`,`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `sys_user_role`
--

/*!50001 DROP TABLE IF EXISTS `sys_user_role`*/;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sys_user_role` AS select `u`.`objid` AS `objid`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`middlename` AS `middlename`,`u`.`username` AS `username`,concat(`u`.`lastname`,', ',`u`.`firstname`,(case when isnull(`u`.`middlename`) then '' else concat(' ',`u`.`middlename`) end)) AS `name`,`ug`.`role` AS `role`,`ug`.`domain` AS `domain`,`ugm`.`org_objid` AS `orgid`,`u`.`txncode` AS `txncode`,`u`.`jobtitle` AS `jobtitle`,`ugm`.`objid` AS `usergroupmemberid`,`ugm`.`usergroup_objid` AS `usergroup_objid`,`ugm`.`org_objid` AS `respcenter_objid`,`ugm`.`org_name` AS `respcenter_name` from ((`sys_usergroup_member` `ugm` join `sys_usergroup` `ug` on((`ug`.`objid` = `ugm`.`usergroup_objid`))) join `sys_user` `u` on((`u`.`objid` = `ugm`.`user_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_income_summary` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`inc`.`amount` AS `amount`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refdate` AS `refdate`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`liquidationdate` AS `liquidationdate`,`ia`.`type` AS `accttype` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `income_summary` `inc` on((`inc`.`acctid` = `ia`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_incometarget`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_incometarget`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_incometarget` AS select `t`.`objid` AS `objid`,`t`.`itemid` AS `itemid`,`t`.`year` AS `year`,`t`.`target` AS `target`,`a`.`maingroupid` AS `maingroupid`,`a`.`objid` AS `item_objid`,`a`.`code` AS `item_code`,`a`.`title` AS `item_title`,`a`.`level` AS `item_level`,`a`.`leftindex` AS `item_leftindex`,`g`.`objid` AS `group_objid`,`g`.`code` AS `group_code`,`g`.`title` AS `group_title`,`g`.`level` AS `group_level`,`g`.`leftindex` AS `group_leftindex` from ((`account_incometarget` `t` join `account` `a` on((`a`.`objid` = `t`.`itemid`))) join `account` `g` on((`g`.`objid` = `a`.`groupid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_item_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_item_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_item_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`l`.`amount` AS `amount`,`l`.`fundid` AS `fundid`,`l`.`year` AS `year`,`l`.`month` AS `month`,`aim`.`itemid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `vw_income_ledger` `l` on((`l`.`itemacctid` = `aim`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`m`.`itemid` AS `itemid`,`m`.`acctid` AS `acctid` from (`account_item_mapping` `m` join `account` `a` on((`a`.`objid` = `m`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_control_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_control_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_control_detail` AS select `afd`.`objid` AS `objid`,`afd`.`state` AS `state`,`afd`.`controlid` AS `controlid`,`afd`.`indexno` AS `indexno`,`afd`.`refid` AS `refid`,`afd`.`aftxnitemid` AS `aftxnitemid`,`afd`.`refno` AS `refno`,`afd`.`reftype` AS `reftype`,`afd`.`refdate` AS `refdate`,`afd`.`txndate` AS `txndate`,`afd`.`txntype` AS `txntype`,`afd`.`receivedstartseries` AS `receivedstartseries`,`afd`.`receivedendseries` AS `receivedendseries`,`afd`.`beginstartseries` AS `beginstartseries`,`afd`.`beginendseries` AS `beginendseries`,`afd`.`issuedstartseries` AS `issuedstartseries`,`afd`.`issuedendseries` AS `issuedendseries`,`afd`.`endingstartseries` AS `endingstartseries`,`afd`.`endingendseries` AS `endingendseries`,`afd`.`qtyreceived` AS `qtyreceived`,`afd`.`qtybegin` AS `qtybegin`,`afd`.`qtyissued` AS `qtyissued`,`afd`.`qtyending` AS `qtyending`,`afd`.`qtycancelled` AS `qtycancelled`,`afd`.`remarks` AS `remarks`,`afd`.`issuedto_objid` AS `issuedto_objid`,`afd`.`issuedto_name` AS `issuedto_name`,`afd`.`respcenter_objid` AS `respcenter_objid`,`afd`.`respcenter_name` AS `respcenter_name`,`afd`.`prevdetailid` AS `prevdetailid`,`afd`.`aftxnid` AS `aftxnid`,`afc`.`afid` AS `afid`,`afc`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,`af`.`denomination` AS `denomination`,`af`.`serieslength` AS `serieslength`,`afu`.`qty` AS `qty`,`afu`.`saleprice` AS `saleprice`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`currentseries` AS `currentseries`,`afc`.`stubno` AS `stubno`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix`,`afc`.`cost` AS `cost`,`afc`.`batchno` AS `batchno`,`afc`.`state` AS `controlstate`,`afd`.`qtyending` AS `qtybalance` from (((`af_control_detail` `afd` join `af_control` `afc` on((`afc`.`objid` = `afd`.`controlid`))) join `af` on((`af`.`objid` = `afc`.`afid`))) join `afunit` `afu` on(((`afu`.`itemid` = `af`.`objid`) and (`afu`.`unit` = `afc`.`unit`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_inventory_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_inventory_summary` AS select `af`.`objid` AS `objid`,`af`.`title` AS `title`,`u`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'OPEN'))) AS `countopen`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED'))) AS `countissued`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED') and (`af_control`.`currentseries` > `af_control`.`endseries`))) AS `countclosed`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'SOLD'))) AS `countsold`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'PROCESSING'))) AS `countprocessing`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'HOLD'))) AS `counthold` from (`af` join `afunit` `u`) where (`af`.`objid` = `u`.`itemid`) order by (case when (`af`.`formtype` = 'serial') then 0 else 1 end),`af`.`objid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afunit`
--

/*!50001 DROP TABLE IF EXISTS `vw_afunit`*/;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afunit` AS select `u`.`objid` AS `objid`,`af`.`title` AS `title`,`af`.`usetype` AS `usetype`,`af`.`serieslength` AS `serieslength`,`af`.`system` AS `system`,`af`.`denomination` AS `denomination`,`af`.`formtype` AS `formtype`,`u`.`itemid` AS `itemid`,`u`.`unit` AS `unit`,`u`.`qty` AS `qty`,`u`.`saleprice` AS `saleprice`,`u`.`interval` AS `interval`,`u`.`cashreceiptprintout` AS `cashreceiptprintout`,`u`.`cashreceiptdetailprintout` AS `cashreceiptdetailprintout` from (`afunit` `u` join `af` on((`af`.`objid` = `u`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assessment_notice`
--

/*!50001 DROP TABLE IF EXISTS `vw_assessment_notice`*/;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assessment_notice` AS select `a`.`objid` AS `objid`,`a`.`state` AS `state`,`a`.`txnno` AS `txnno`,`a`.`txndate` AS `txndate`,`a`.`taxpayerid` AS `taxpayerid`,`a`.`taxpayername` AS `taxpayername`,`a`.`taxpayeraddress` AS `taxpayeraddress`,`a`.`dtdelivered` AS `dtdelivered`,`a`.`receivedby` AS `receivedby`,`a`.`remarks` AS `remarks`,`a`.`assessmentyear` AS `assessmentyear`,`a`.`administrator_name` AS `administrator_name`,`a`.`administrator_address` AS `administrator_address`,`fl`.`tdno` AS `tdno`,`fl`.`displaypin` AS `fullpin`,`fl`.`cadastrallotno` AS `cadastrallotno`,`fl`.`titleno` AS `titleno` from ((`assessmentnotice` `a` join `assessmentnoticeitem` `i` on((`a`.`objid` = `i`.`assessmentnoticeid`))) join `faas_list` `fl` on((`i`.`faasid` = `fl`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assessment_notice_item`
--

/*!50001 DROP TABLE IF EXISTS `vw_assessment_notice_item`*/;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assessment_notice_item` AS select `ni`.`objid` AS `objid`,`ni`.`assessmentnoticeid` AS `assessmentnoticeid`,`ni`.`info` AS `info`,`f`.`objid` AS `faasid`,`f`.`effectivityyear` AS `effectivityyear`,`f`.`effectivityqtr` AS `effectivityqtr`,`f`.`tdno` AS `tdno`,`f`.`taxpayer_objid` AS `taxpayer_objid`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`f`.`rpuid` AS `rpuid`,`f`.`lguid` AS `lguid`,`f`.`txntype_objid` AS `txntype_objid`,`ft`.`displaycode` AS `txntype_code`,`rpu`.`rputype` AS `rputype`,`rpu`.`ry` AS `ry`,`rpu`.`fullpin` AS `fullpin`,`rpu`.`taxable` AS `taxable`,`rpu`.`totalareaha` AS `totalareaha`,`rpu`.`totalareasqm` AS `totalareasqm`,`rpu`.`totalbmv` AS `totalbmv`,`rpu`.`totalmv` AS `totalmv`,`rpu`.`totalav` AS `totalav`,`rp`.`section` AS `section`,`rp`.`parcel` AS `parcel`,`rp`.`surveyno` AS `surveyno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`claimno` AS `claimno`,`rp`.`street` AS `street`,`o`.`name` AS `lguname`,`b`.`name` AS `barangay`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classification` from (((((((((`assessmentnoticeitem` `ni` join `faas` `f` on((`ni`.`faasid` = `f`.`objid`))) left join `txnsignatory` `ts` on(((`ts`.`refid` = `f`.`objid`) and (`ts`.`type` = 'APPROVER')))) join `rpu` on((`f`.`rpuid` = `rpu`.`objid`))) join `propertyclassification` `pc` on((`rpu`.`classification_objid` = `pc`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_batch_rpttaxcredit_error`
--

/*!50001 DROP TABLE IF EXISTS `vw_batch_rpttaxcredit_error`*/;
/*!50001 DROP VIEW IF EXISTS `vw_batch_rpttaxcredit_error`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_batch_rpttaxcredit_error` AS select `br`.`objid` AS `objid`,`br`.`parentid` AS `parentid`,`br`.`state` AS `state`,`br`.`error` AS `error`,`br`.`barangayid` AS `barangayid`,`rl`.`tdno` AS `tdno` from (`batch_rpttaxcredit_ledger` `br` join `rptledger` `rl` on((`br`.`objid` = `rl`.`objid`))) where (`br`.`state` = 'ERROR') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_batchgr`
--

/*!50001 DROP TABLE IF EXISTS `vw_batchgr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_batchgr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_batchgr` AS select `bg`.`objid` AS `objid`,`bg`.`state` AS `state`,`bg`.`ry` AS `ry`,`bg`.`lgu_objid` AS `lgu_objid`,`bg`.`barangay_objid` AS `barangay_objid`,`bg`.`rputype` AS `rputype`,`bg`.`classification_objid` AS `classification_objid`,`bg`.`section` AS `section`,`bg`.`memoranda` AS `memoranda`,`bg`.`txntype_objid` AS `txntype_objid`,`bg`.`txnno` AS `txnno`,`bg`.`txndate` AS `txndate`,`bg`.`effectivityyear` AS `effectivityyear`,`bg`.`effectivityqtr` AS `effectivityqtr`,`bg`.`originlgu_objid` AS `originlgu_objid`,`l`.`name` AS `lgu_name`,`b`.`name` AS `barangay_name`,`b`.`pin` AS `barangay_pin`,`pc`.`name` AS `classification_name`,`t`.`objid` AS `taskid`,`t`.`state` AS `taskstate`,`t`.`assignee_objid` AS `assignee_objid` from ((((`batchgr` `bg` join `sys_org` `l` on((`bg`.`lgu_objid` = `l`.`objid`))) left join `barangay` `b` on((`bg`.`barangay_objid` = `b`.`objid`))) left join `propertyclassification` `pc` on((`bg`.`classification_objid` = `pc`.`objid`))) left join `batchgr_task` `t` on(((`bg`.`objid` = `t`.`refid`) and isnull(`t`.`enddate`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_building`
--

/*!50001 DROP TABLE IF EXISTS `vw_building`*/;
/*!50001 DROP VIEW IF EXISTS `vw_building`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_building` AS select `f`.`objid` AS `objid`,`f`.`state` AS `state`,`f`.`rpuid` AS `rpuid`,`f`.`realpropertyid` AS `realpropertyid`,`f`.`tdno` AS `tdno`,`f`.`fullpin` AS `fullpin`,`f`.`taxpayer_objid` AS `taxpayer_objid`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`f`.`lguid` AS `lgu_objid`,`o`.`name` AS `lgu_name`,`b`.`objid` AS `barangay_objid`,`b`.`name` AS `barangay_name`,`r`.`classification_objid` AS `classification_objid`,`pc`.`name` AS `classification_name`,`rp`.`pin` AS `pin`,`rp`.`section` AS `section`,`rp`.`ry` AS `ry`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`bt`.`objid` AS `bldgtype_objid`,`bt`.`name` AS `bldgtype_name`,`bk`.`objid` AS `bldgkind_objid`,`bk`.`name` AS `bldgkind_name`,`bu`.`basemarketvalue` AS `basemarketvalue`,`bu`.`adjustment` AS `adjustment`,`bu`.`depreciationvalue` AS `depreciationvalue`,`bu`.`marketvalue` AS `marketvalue`,`bu`.`assessedvalue` AS `assessedvalue`,`al`.`objid` AS `actualuse_objid`,`al`.`name` AS `actualuse_name`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav` from (((((((((((`faas` `f` join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `bldgrpu_structuraltype` `bst` on((`r`.`objid` = `bst`.`bldgrpuid`))) join `bldgtype` `bt` on((`bst`.`bldgtype_objid` = `bt`.`objid`))) join `bldgkindbucc` `bucc` on((`bst`.`bldgkindbucc_objid` = `bucc`.`objid`))) join `bldgkind` `bk` on((`bucc`.`bldgkind_objid` = `bk`.`objid`))) join `bldguse` `bu` on((`bst`.`objid` = `bu`.`structuraltype_objid`))) join `bldgassesslevel` `al` on((`bu`.`actualuse_objid` = `al`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_business_application_lob_retire`
--

/*!50001 DROP TABLE IF EXISTS `vw_business_application_lob_retire`*/;
/*!50001 DROP VIEW IF EXISTS `vw_business_application_lob_retire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_business_application_lob_retire` AS select `a`.`business_objid` AS `businessid`,`a`.`objid` AS `applicationid`,`a`.`appno` AS `appno`,`a`.`appyear` AS `appyear`,`a`.`dtfiled` AS `dtfiled`,`a`.`txndate` AS `txndate`,`a`.`tradename` AS `tradename`,`b`.`bin` AS `bin`,`alob`.`assessmenttype` AS `assessmenttype`,`alob`.`lobid` AS `lobid`,`alob`.`name` AS `lobname`,`a`.`objid` AS `refid`,`a`.`appno` AS `refno` from ((`business_application` `a` join `business_application_lob` `alob` on((`alob`.`applicationid` = `a`.`objid`))) join `business` `b` on((`b`.`objid` = `a`.`business_objid`))) where ((`alob`.`assessmenttype` = 'RETIRE') and (`a`.`state` = 'COMPLETED') and isnull(`a`.`parentapplicationid`)) union all select `pa`.`business_objid` AS `businessid`,`pa`.`objid` AS `applicationid`,`pa`.`appno` AS `appno`,`pa`.`appyear` AS `appyear`,`pa`.`dtfiled` AS `dtfiled`,`pa`.`txndate` AS `txndate`,`pa`.`tradename` AS `tradename`,`b`.`bin` AS `bin`,`alob`.`assessmenttype` AS `assessmenttype`,`alob`.`lobid` AS `lobid`,`alob`.`name` AS `lobname`,`a`.`objid` AS `refid`,`a`.`appno` AS `refno` from (((`business_application` `a` join `business_application` `pa` on((`pa`.`objid` = `a`.`parentapplicationid`))) join `business_application_lob` `alob` on((`alob`.`applicationid` = `a`.`objid`))) join `business` `b` on((`b`.`objid` = `pa`.`business_objid`))) where ((`alob`.`assessmenttype` = 'RETIRE') and (`a`.`state` = 'COMPLETED')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`ci`.`amount` AS `dr`,NULL AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,-(`cs`.`amount`) AS `dr`,NULL AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`refitem_objid` AS `refitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share_payable` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,NULL AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`payableitem_objid` AS `payableitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid` AS select `v`.`objid` AS `objid`,`c`.`state` AS `state`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,(case when isnull(`r`.`objid`) then -(`ci`.`amount`) when (`v`.`txndate` <= ifnull(`r`.`dtposted`,`v`.`txndate`)) then -(`ci`.`amount`) when ((`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) and (`c`.`receiptdate` < cast(`v`.`txndate` as date))) then -(`ci`.`amount`) end) AS `dr`,(case when isnull(`r`.`objid`) then NULL when (`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) then -(`ci`.`amount`) end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share` AS select `v`.`objid` AS `objid`,`c`.`state` AS `state`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,(case when isnull(`r`.`objid`) then `cs`.`amount` when (`v`.`txndate` <= ifnull(`r`.`dtposted`,`v`.`txndate`)) then `cs`.`amount` when ((`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) and (`c`.`receiptdate` < cast(`v`.`txndate` as date))) then `cs`.`amount` end) AS `dr`,(case when isnull(`r`.`objid`) then NULL when (`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) then `cs`.`amount` end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share_payable` AS select `v`.`objid` AS `objid`,`c`.`state` AS `state`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,(case when isnull(`r`.`objid`) then -(`cs`.`amount`) when (`v`.`txndate` <= ifnull(`r`.`dtposted`,`v`.`txndate`)) then -(`cs`.`amount`) when ((`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) and (`c`.`receiptdate` < cast(`v`.`txndate` as date))) then -(`cs`.`amount`) end) AS `dr`,(case when isnull(`r`.`objid`) then NULL when (`v`.`txndate` > ifnull(`r`.`dtposted`,`v`.`txndate`)) then -(`cs`.`amount`) end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance` AS select `r`.`objid` AS `objid`,`r`.`state` AS `state`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,NULL AS `dr`,(case when isnull(`v`.`objid`) then `ci`.`amount` when (`r`.`dtposted` < ifnull(`v`.`txndate`,`r`.`dtposted`)) then `ci`.`amount` else NULL end) AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share` AS select `r`.`objid` AS `objid`,`r`.`state` AS `state`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,NULL AS `dr`,(case when isnull(`v`.`objid`) then -(`cs`.`amount`) when (`r`.`dtposted` < ifnull(`v`.`txndate`,`r`.`dtposted`)) then -(`cs`.`amount`) else NULL end) AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share_payable` AS select `r`.`objid` AS `objid`,`r`.`state` AS `state`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,NULL AS `dr`,(case when isnull(`v`.`objid`) then `cs`.`amount` when (`r`.`dtposted` < ifnull(`v`.`txndate`,`r`.`dtposted`)) then `cs`.`amount` else NULL end) AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount` AS select `itemaccount`.`objid` AS `objid`,`itemaccount`.`state` AS `state`,`itemaccount`.`code` AS `code`,`itemaccount`.`title` AS `title`,`itemaccount`.`description` AS `description`,`itemaccount`.`type` AS `type`,`itemaccount`.`fund_objid` AS `fund_objid`,`itemaccount`.`fund_code` AS `fund_code`,`itemaccount`.`fund_title` AS `fund_title`,`itemaccount`.`defaultvalue` AS `defaultvalue`,`itemaccount`.`valuetype` AS `valuetype`,`itemaccount`.`sortorder` AS `sortorder`,`itemaccount`.`org_objid` AS `orgid`,`itemaccount`.`hidefromlookup` AS `hidefromlookup` from `itemaccount` where ((`itemaccount`.`state` = 'ACTIVE') and (`itemaccount`.`type` in ('REVENUE','NONREVENUE','PAYABLE')) and (ifnull(`itemaccount`.`generic`,0) = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiongroup` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`defaultvalue` else `ca`.`defaultvalue` end) AS `defaultvalue`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`valuetype` else `ca`.`valuetype` end) AS `valuetype`,`ca`.`sortorder` AS `sortorder`,`ia`.`org_objid` AS `orgid`,`ca`.`collectiongroupid` AS `collectiongroupid`,`ia`.`generic` AS `generic` from (`collectiongroup_account` `ca` join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiontype` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,NULL AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,0 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) left join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ca`.`objid`))) where (isnull(`o`.`objid`) and (`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) union all select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,`o`.`org_objid` AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,1 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ct`.`objid`))) join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) where ((`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`rem`.`objid` AS `remittance_objid`,`rem`.`controlno` AS `remittance_controlno`,`rem`.`controldate` AS `remittance_controldate` from (((`cashreceiptpayment_noncash` `nc` join `cashreceipt` `c` on((`c`.`objid` = `nc`.`receiptid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) left join `remittance` `rem` on((`rem`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash_liquidated` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`objid` AS `remittance_objid`,`r`.`controlno` AS `remittance_controlno`,`r`.`controldate` AS `remittance_controldate`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`cv`.`objid` AS `collectionvoucher_objid`,`cv`.`controlno` AS `collectionvoucher_controlno`,`cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`depositvoucherid` AS `depositvoucherid` from ((((`collectionvoucher` `cv` join `remittance` `r` on((`r`.`collectionvoucherid` = `cv`.`objid`))) join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on((`nc`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_certification_land_improvement`
--

/*!50001 DROP TABLE IF EXISTS `vw_certification_land_improvement`*/;
/*!50001 DROP VIEW IF EXISTS `vw_certification_land_improvement`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_certification_land_improvement` AS select `f`.`objid` AS `faasid`,`pt`.`name` AS `improvement`,`ptd`.`areacovered` AS `areacovered`,`ptd`.`productive` AS `productive`,`ptd`.`nonproductive` AS `nonproductive`,`ptd`.`basemarketvalue` AS `basemarketvalue`,`ptd`.`marketvalue` AS `marketvalue`,`ptd`.`unitvalue` AS `unitvalue`,`ptd`.`assessedvalue` AS `assessedvalue` from ((`faas` `f` join `planttreedetail` `ptd` on((`f`.`rpuid` = `ptd`.`landrpuid`))) join `planttree` `pt` on((`ptd`.`planttree_objid` = `pt`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_certification_landdetail`
--

/*!50001 DROP TABLE IF EXISTS `vw_certification_landdetail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_certification_landdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_certification_landdetail` AS select `f`.`objid` AS `faasid`,`ld`.`areaha` AS `areaha`,`ld`.`areasqm` AS `areasqm`,`ld`.`assessedvalue` AS `assessedvalue`,`ld`.`marketvalue` AS `marketvalue`,`ld`.`basemarketvalue` AS `basemarketvalue`,`ld`.`unitvalue` AS `unitvalue`,`lspc`.`name` AS `specificclass_name` from ((`faas` `f` join `landdetail` `ld` on((`f`.`rpuid` = `ld`.`landrpuid`))) join `landspecificclass` `lspc` on((`ld`.`landspecificclass_objid` = `lspc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiongroup` AS select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,NULL AS `orgid` from (`collectiongroup` `cg` left join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where ((`cg`.`state` = 'ACTIVE') and isnull(`co`.`objid`)) union select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,`co`.`org_objid` AS `orgid` from (`collectiongroup` `cg` join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where (`cg`.`state` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,`o`.`org_objid` AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo`,`c`.`connection` AS `connection`,`c`.`servicename` AS `servicename` from ((`collectiontype_org` `o` join `collectiontype` `c` on((`c`.`objid` = `o`.`collectiontypeid`))) join `af` on((`af`.`objid` = `c`.`formno`))) where (`c`.`state` = 'ACTIVE') union select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,NULL AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo`,`c`.`connection` AS `connection`,`c`.`servicename` AS `servicename` from ((`collectiontype` `c` join `af` on((`af`.`objid` = `c`.`formno`))) left join `collectiontype_org` `o` on((`c`.`objid` = `o`.`collectiontypeid`))) where (isnull(`o`.`objid`) and (`c`.`state` = 'ACTIVE')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype_account`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype_account`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype_account` AS select `ia`.`objid` AS `objid`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`fund_objid` AS `fund_objid`,`fund`.`code` AS `fund_code`,`fund`.`title` AS `fund_title`,`cta`.`collectiontypeid` AS `collectiontypeid`,`cta`.`tag` AS `tag`,`cta`.`valuetype` AS `valuetype`,`cta`.`defaultvalue` AS `defaultvalue` from ((`collectiontype_account` `cta` join `itemaccount` `ia` on((`ia`.`objid` = `cta`.`account_objid`))) join `fund` on((`fund`.`objid` = `ia`.`fund_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptitem` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`formtype` AS `formtype`,`v`.`formno` AS `formno`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`controlid` AS `controlid`,`v`.`series` AS `series`,`v`.`stubno` AS `stubno`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`remarks` AS `remarks`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount`,`v`.`formtypeindex` AS `formtypeindex` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptitem` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptshare` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`formno` AS `formno`,`v`.`formtype` AS `formtype`,`v`.`controlid` AS `controlid`,`v`.`series` AS `series`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`refacctid` AS `refacctid`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount`,`v`.`formtypeindex` AS `formtypeindex` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptshare` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_deposit_fund_transfer`
--

/*!50001 DROP TABLE IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_deposit_fund_transfer` AS select `dft`.`objid` AS `objid`,`dft`.`amount` AS `amount`,`dft`.`todepositvoucherfundid` AS `todepositvoucherfundid`,`tof`.`objid` AS `todepositvoucherfund_fund_objid`,`tof`.`code` AS `todepositvoucherfund_fund_code`,`tof`.`title` AS `todepositvoucherfund_fund_title`,`dft`.`fromdepositvoucherfundid` AS `fromdepositvoucherfundid`,`fromf`.`objid` AS `fromdepositvoucherfund_fund_objid`,`fromf`.`code` AS `fromdepositvoucherfund_fund_code`,`fromf`.`title` AS `fromdepositvoucherfund_fund_title` from ((((`deposit_fund_transfer` `dft` join `depositvoucher_fund` `todv` on((`dft`.`todepositvoucherfundid` = `todv`.`objid`))) join `fund` `tof` on((`todv`.`fundid` = `tof`.`objid`))) join `depositvoucher_fund` `fromdv` on((`dft`.`fromdepositvoucherfundid` = `fromdv`.`objid`))) join `fund` `fromf` on((`fromdv`.`fundid` = `fromf`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_mapping` AS select `r`.`objid` AS `objid`,`r`.`parent_objid` AS `parent_objid`,`r`.`org_objid` AS `org_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `address_text`,`a`.`province` AS `address_province`,`a`.`municipality` AS `address_municipality` from ((((`entity_mapping` `r` join `entity` `e` on((`r`.`objid` = `e`.`objid`))) left join `entity_address` `a` on((`e`.`address_objid` = `a`.`objid`))) left join `sys_org` `b` on((`a`.`barangay_objid` = `b`.`objid`))) left join `sys_org` `m` on((`b`.`parent_objid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_relation`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_relation`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_relation` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,`er`.`relation_objid` AS `relationship` from (`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`relateto_objid` = `ei`.`objid`))) union all select `er`.`objid` AS `objid`,`er`.`relateto_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,(case when (`ei`.`gender` = 'M') then `et`.`inverse_male` when (`ei`.`gender` = 'F') then `et`.`inverse_female` else `et`.`inverse_any` end) AS `relationship` from ((`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`entity_objid` = `ei`.`objid`))) join `entity_relation_type` `et` on((`er`.`relation_objid` = `et`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual` AS select `ei`.`objid` AS `objid`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`birthplace` AS `birthplace`,`ei`.`citizenship` AS `citizenship`,`ei`.`gender` AS `gender`,`ei`.`civilstatus` AS `civilstatus`,`ei`.`profession` AS `profession`,`ei`.`tin` AS `tin`,`ei`.`sss` AS `sss`,`ei`.`height` AS `height`,`ei`.`weight` AS `weight`,`ei`.`acr` AS `acr`,`ei`.`religion` AS `religion`,`ei`.`photo` AS `photo`,`ei`.`thumbnail` AS `thumbnail`,`ei`.`profileid` AS `profileid`,`e`.`entityno` AS `entityno`,`e`.`type` AS `type`,`e`.`name` AS `name`,`e`.`entityname` AS `entityname`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno`,`e`.`address_objid` AS `address_objid`,`e`.`address_text` AS `address_text` from (`entityindividual` `ei` join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual_lookup` AS select `e`.`objid` AS `objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from (`entity` `e` join `entityindividual` `ei` on((`ei`.`objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityrelation_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityrelation_lookup` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `entity_objid`,`er`.`relateto_objid` AS `relateto_objid`,`er`.`relation_objid` AS `relation_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from ((`entity_relation` `er` join `entityindividual` `ei` on((`ei`.`objid` = `er`.`relateto_objid`))) join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_faas_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_faas_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_faas_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_faas_lookup` AS select `fl`.`objid` AS `objid`,`fl`.`state` AS `state`,`fl`.`rpuid` AS `rpuid`,`fl`.`utdno` AS `utdno`,`fl`.`tdno` AS `tdno`,`fl`.`txntype_objid` AS `txntype_objid`,`fl`.`effectivityyear` AS `effectivityyear`,`fl`.`effectivityqtr` AS `effectivityqtr`,`fl`.`taxpayer_objid` AS `taxpayer_objid`,`fl`.`owner_name` AS `owner_name`,`fl`.`owner_address` AS `owner_address`,`fl`.`prevtdno` AS `prevtdno`,`fl`.`cancelreason` AS `cancelreason`,`fl`.`cancelledbytdnos` AS `cancelledbytdnos`,`fl`.`lguid` AS `lguid`,`fl`.`realpropertyid` AS `realpropertyid`,`fl`.`displaypin` AS `fullpin`,`fl`.`originlguid` AS `originlguid`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`pc`.`code` AS `classification_code`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classification_name`,`pc`.`name` AS `classname`,`fl`.`ry` AS `ry`,`fl`.`rputype` AS `rputype`,`fl`.`totalmv` AS `totalmv`,`fl`.`totalav` AS `totalav`,`fl`.`totalareasqm` AS `totalareasqm`,`fl`.`totalareaha` AS `totalareaha`,`fl`.`barangayid` AS `barangayid`,`fl`.`cadastrallotno` AS `cadastrallotno`,`fl`.`blockno` AS `blockno`,`fl`.`surveyno` AS `surveyno`,`fl`.`pin` AS `pin`,`fl`.`barangay` AS `barangay_name`,`fl`.`trackingno` AS `trackingno` from ((`faas_list` `fl` left join `propertyclassification` `pc` on((`fl`.`classification_objid` = `pc`.`objid`))) left join `entity` `e` on((`fl`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fund`
--

/*!50001 DROP TABLE IF EXISTS `vw_fund`*/;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fund` AS select `f`.`objid` AS `objid`,`f`.`parentid` AS `parentid`,`f`.`state` AS `state`,`f`.`code` AS `code`,`f`.`title` AS `title`,`f`.`type` AS `type`,`f`.`special` AS `special`,`f`.`system` AS `system`,`f`.`groupid` AS `groupid`,`f`.`depositoryfundid` AS `depositoryfundid`,`g`.`objid` AS `group_objid`,`g`.`title` AS `group_title`,`g`.`indexno` AS `group_indexno`,`d`.`objid` AS `depositoryfund_objid`,`d`.`state` AS `depositoryfund_state`,`d`.`code` AS `depositoryfund_code`,`d`.`title` AS `depositoryfund_title` from ((`fund` `f` left join `fundgroup` `g` on((`g`.`objid` = `f`.`groupid`))) left join `fund` `d` on((`d`.`objid` = `f`.`depositoryfundid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_idle_land`
--

/*!50001 DROP TABLE IF EXISTS `vw_idle_land`*/;
/*!50001 DROP VIEW IF EXISTS `vw_idle_land`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_idle_land` AS select `f`.`objid` AS `objid`,`f`.`state` AS `state`,`f`.`rpuid` AS `rpuid`,`f`.`realpropertyid` AS `realpropertyid`,`f`.`lguid` AS `lguid`,`f`.`barangayid` AS `barangayid`,`o`.`name` AS `lgu`,`f`.`barangay` AS `barangay`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`f`.`tdno` AS `tdno`,`f`.`titleno` AS `titleno`,`f`.`pin` AS `pin`,`pc`.`name` AS `classification`,`f`.`cadastrallotno` AS `cadastrallotno`,`f`.`blockno` AS `blockno`,`f`.`ry` AS `ry`,`f`.`totalareaha` AS `totalareaha`,`f`.`totalareasqm` AS `totalareasqm`,`f`.`totalmv` AS `totalmv`,`f`.`totalav` AS `totalav` from (((`faas_list` `f` join `landrpu` `lr` on(`f`.`rpuid`)) join `propertyclassification` `pc` on(`f`.`classification_objid`)) join `sys_org` `o` on(`f`.`lguid`)) where ((`f`.`state` in ('current','cancelled')) and (`lr`.`idleland` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_ledger`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_ledger`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_ledger` AS select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`itemacctid` AS `itemacctid`,`l`.`cr` AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`income_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) union all select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`refitemacctid` AS `itemacctid`,(`l`.`cr` - `l`.`dr`) AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`payable_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_summary` AS select `inc`.`refid` AS `refid`,`inc`.`refdate` AS `refdate`,`inc`.`refno` AS `refno`,`inc`.`reftype` AS `reftype`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`amount` AS `amount`,`inc`.`orgid` AS `orgid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refyear` AS `refyear`,`inc`.`refmonth` AS `refmonth`,`inc`.`refqtr` AS `refqtr`,`inc`.`remittanceid` AS `remittanceid`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`remittanceyear` AS `remittanceyear`,`inc`.`remittancemonth` AS `remittancemonth`,`inc`.`remittanceqtr` AS `remittanceqtr`,`inc`.`liquidationid` AS `liquidationid`,`inc`.`liquidationdate` AS `liquidationdate`,`inc`.`liquidationyear` AS `liquidationyear`,`inc`.`liquidationmonth` AS `liquidationmonth`,`inc`.`liquidationqtr` AS `liquidationqtr`,`fund`.`groupid` AS `fundgroupid`,`ia`.`objid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle`,`ia`.`type` AS `itemtype` from ((`income_summary` `inc` join `fund` on((`fund`.`objid` = `inc`.`fundid`))) join `itemaccount` `ia` on((`ia`.`objid` = `inc`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_abstract_of_collection_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_abstract_of_collection_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_abstract_of_collection_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_abstract_of_collection_detail` AS select `liq`.`objid` AS `liquidationid`,`liq`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`cr`.`objid` AS `receiptid`,`cr`.`receiptdate` AS `ordate`,`cr`.`receiptno` AS `orno`,`cr`.`collector_objid` AS `collectorid`,`rl`.`objid` AS `rptledgerid`,`rl`.`fullpin` AS `fullpin`,`rl`.`titleno` AS `titleno`,`rl`.`cadastrallotno` AS `cadastrallotno`,`rl`.`rputype` AS `rputype`,`rl`.`totalmv` AS `totalmv`,`b`.`name` AS `barangay`,`rp`.`fromqtr` AS `fromqtr`,`rp`.`toqtr` AS `toqtr`,`rpi`.`year` AS `year`,`rpi`.`qtr` AS `qtr`,`rpi`.`revtype` AS `revtype`,(case when isnull(`cv`.`objid`) then `rl`.`owner_name` else '*** voided ***' end) AS `taxpayername`,(case when isnull(`cv`.`objid`) then `rl`.`tdno` else '' end) AS `tdno`,(case when isnull(`m`.`name`) then `c`.`name` else `m`.`name` end) AS `municityname`,(case when isnull(`cv`.`objid`) then `rl`.`classcode` else '' end) AS `classification`,(case when isnull(`cv`.`objid`) then `rl`.`totalav` else 0.0 end) AS `assessvalue`,(case when isnull(`cv`.`objid`) then `rl`.`totalav` else 0.0 end) AS `assessedvalue`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `basiccurrentyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `basicpreviousyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic')) then `rpi`.`discount` else 0.0 end) AS `basicdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `basicpenaltycurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `basicpenaltyprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `sefcurrentyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `sefpreviousyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef')) then `rpi`.`discount` else 0.0 end) AS `sefdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `sefpenaltycurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `sefpenaltyprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `basicidlecurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `basicidleprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle')) then `rpi`.`amount` else 0.0 end) AS `basicidlediscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `basicidlecurrentpenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `basicidlepreviouspenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `shcurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `shprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh')) then `rpi`.`discount` else 0.0 end) AS `shdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `shcurrentpenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `shpreviouspenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'firecode')) then `rpi`.`amount` else 0.0 end) AS `firecode`,(case when isnull(`cv`.`objid`) then ((`rpi`.`amount` - `rpi`.`discount`) + `rpi`.`interest`) else 0.0 end) AS `total`,(case when isnull(`cv`.`objid`) then `rpi`.`partialled` else 0 end) AS `partialled` from ((((((((((`collectionvoucher` `liq` join `remittance` `rem` on((`rem`.`collectionvoucherid` = `liq`.`objid`))) join `cashreceipt` `cr` on((`rem`.`objid` = `cr`.`remittanceid`))) left join `cashreceipt_void` `cv` on((`cr`.`objid` = `cv`.`receiptid`))) join `rptpayment` `rp` on((`rp`.`receiptid` = `cr`.`objid`))) join `rptpayment_item` `rpi` on((`rpi`.`parentid` = `rp`.`objid`))) join `rptledger` `rl` on((`rl`.`objid` = `rp`.`refid`))) join `barangay` `b` on((`b`.`objid` = `rl`.`barangayid`))) left join `district` `d` on((`b`.`parentid` = `d`.`objid`))) left join `city` `c` on((`d`.`parentid` = `c`.`objid`))) left join `municipality` `m` on((`b`.`parentid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_abstract_of_collection_detail_eor`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_abstract_of_collection_detail_eor`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_abstract_of_collection_detail_eor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_abstract_of_collection_detail_eor` AS select `rem`.`objid` AS `liquidationid`,`rem`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`eor`.`objid` AS `receiptid`,`eor`.`receiptdate` AS `ordate`,`eor`.`receiptno` AS `orno`,`rem`.`createdby_objid` AS `collectorid`,`rl`.`objid` AS `rptledgerid`,`rl`.`fullpin` AS `fullpin`,`rl`.`titleno` AS `titleno`,`rl`.`cadastrallotno` AS `cadastrallotno`,`rl`.`rputype` AS `rputype`,`rl`.`totalmv` AS `totalmv`,`b`.`name` AS `barangay`,`rp`.`fromqtr` AS `fromqtr`,`rp`.`toqtr` AS `toqtr`,`rpi`.`year` AS `year`,`rpi`.`qtr` AS `qtr`,`rpi`.`revtype` AS `revtype`,(case when isnull(`cv`.`objid`) then `rl`.`owner_name` else '*** voided ***' end) AS `taxpayername`,(case when isnull(`cv`.`objid`) then `rl`.`tdno` else '' end) AS `tdno`,(case when isnull(`m`.`name`) then `c`.`name` else `m`.`name` end) AS `municityname`,(case when isnull(`cv`.`objid`) then `rl`.`classcode` else '' end) AS `classification`,(case when isnull(`cv`.`objid`) then `rl`.`totalav` else 0.0 end) AS `assessvalue`,(case when isnull(`cv`.`objid`) then `rl`.`totalav` else 0.0 end) AS `assessedvalue`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `basiccurrentyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `basicpreviousyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic')) then `rpi`.`discount` else 0.0 end) AS `basicdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `basicpenaltycurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basic') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `basicpenaltyprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `sefcurrentyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `sefpreviousyear`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef')) then `rpi`.`discount` else 0.0 end) AS `sefdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `sefpenaltycurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sef') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `sefpenaltyprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `basicidlecurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `basicidleprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle')) then `rpi`.`amount` else 0.0 end) AS `basicidlediscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `basicidlecurrentpenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'basicidle') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `basicidlepreviouspenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`amount` else 0.0 end) AS `shcurrent`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`amount` else 0.0 end) AS `shprevious`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh')) then `rpi`.`discount` else 0.0 end) AS `shdiscount`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('current','advance'))) then `rpi`.`interest` else 0.0 end) AS `shcurrentpenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'sh') and (`rpi`.`revperiod` in ('previous','prior'))) then `rpi`.`interest` else 0.0 end) AS `shpreviouspenalty`,(case when (isnull(`cv`.`objid`) and (`rpi`.`revtype` = 'firecode')) then `rpi`.`amount` else 0.0 end) AS `firecode`,(case when isnull(`cv`.`objid`) then ((`rpi`.`amount` - `rpi`.`discount`) + `rpi`.`interest`) else 0.0 end) AS `total`,(case when isnull(`cv`.`objid`) then `rpi`.`partialled` else 0 end) AS `partialled` from (((((((((`vw_landtax_eor_remittance` `rem` join `vw_landtax_eor` `eor` on((`rem`.`objid` = `eor`.`remittanceid`))) left join `cashreceipt_void` `cv` on((`eor`.`objid` = `cv`.`receiptid`))) join `rptpayment` `rp` on((`eor`.`objid` = `rp`.`receiptid`))) join `rptpayment_item` `rpi` on((`rpi`.`parentid` = `rp`.`objid`))) join `rptledger` `rl` on((`rl`.`objid` = `rp`.`refid`))) join `barangay` `b` on((`b`.`objid` = `rl`.`barangayid`))) left join `district` `d` on((`b`.`parentid` = `d`.`objid`))) left join `city` `c` on((`d`.`parentid` = `c`.`objid`))) left join `municipality` `m` on((`b`.`parentid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_detail` AS select `cv`.`objid` AS `liquidationid`,`cv`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`cr`.`receiptdate` AS `receiptdate`,`o`.`objid` AS `lguid`,`o`.`name` AS `lgu`,`b`.`objid` AS `barangayid`,`b`.`indexno` AS `brgyindex`,`b`.`name` AS `barangay`,`ri`.`revperiod` AS `revperiod`,`ri`.`revtype` AS `revtype`,`ri`.`year` AS `year`,`ri`.`qtr` AS `qtr`,`ri`.`amount` AS `amount`,`ri`.`interest` AS `interest`,`ri`.`discount` AS `discount`,`pc`.`name` AS `classname`,`pc`.`orderno` AS `orderno`,`pc`.`special` AS `special`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basic')) then `ri`.`amount` else 0.0 end) AS `basiccurrent`,(case when (`ri`.`revtype` = 'basic') then `ri`.`discount` else 0.0 end) AS `basicdisc`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basic')) then `ri`.`amount` else 0.0 end) AS `basicprev`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basic')) then `ri`.`interest` else 0.0 end) AS `basiccurrentint`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basic')) then `ri`.`interest` else 0.0 end) AS `basicprevint`,(case when (`ri`.`revtype` = 'basic') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `basicnet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sef')) then `ri`.`amount` else 0.0 end) AS `sefcurrent`,(case when (`ri`.`revtype` = 'sef') then `ri`.`discount` else 0.0 end) AS `sefdisc`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sef')) then `ri`.`amount` else 0.0 end) AS `sefprev`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sef')) then `ri`.`interest` else 0.0 end) AS `sefcurrentint`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sef')) then `ri`.`interest` else 0.0 end) AS `sefprevint`,(case when (`ri`.`revtype` = 'sef') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `sefnet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basicidle')) then `ri`.`amount` else 0.0 end) AS `idlecurrent`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basicidle')) then `ri`.`amount` else 0.0 end) AS `idleprev`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`discount` else 0.0 end) AS `idledisc`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`interest` else 0 end) AS `idleint`,(case when (`ri`.`revtype` = 'basicidle') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `idlenet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sh')) then `ri`.`amount` else 0.0 end) AS `shcurrent`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sh')) then `ri`.`amount` else 0.0 end) AS `shprev`,(case when (`ri`.`revtype` = 'sh') then `ri`.`discount` else 0.0 end) AS `shdisc`,(case when (`ri`.`revtype` = 'sh') then `ri`.`interest` else 0 end) AS `shint`,(case when (`ri`.`revtype` = 'sh') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `shnet`,(case when (`ri`.`revtype` = 'firecode') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `firecode`,0.0 AS `levynet`,(case when isnull(`crv`.`objid`) then 0 else 1 end) AS `voided` from (((((((((`remittance` `rem` join `collectionvoucher` `cv` on((`cv`.`objid` = `rem`.`collectionvoucherid`))) join `cashreceipt` `cr` on((`cr`.`remittanceid` = `rem`.`objid`))) left join `cashreceipt_void` `crv` on((`cr`.`objid` = `crv`.`receiptid`))) join `rptpayment` `rp` on((`cr`.`objid` = `rp`.`receiptid`))) join `rptpayment_item` `ri` on((`rp`.`objid` = `ri`.`parentid`))) left join `rptledger` `rl` on((`rp`.`refid` = `rl`.`objid`))) left join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) left join `sys_org` `o` on((`rl`.`lguid` = `o`.`objid`))) left join `propertyclassification` `pc` on((`rl`.`classification_objid` = `pc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_detail_eor`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_detail_eor`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_detail_eor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_detail_eor` AS select `rem`.`objid` AS `liquidationid`,`rem`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`eor`.`receiptdate` AS `receiptdate`,`o`.`objid` AS `lguid`,`o`.`name` AS `lgu`,`b`.`objid` AS `barangayid`,`b`.`indexno` AS `brgyindex`,`b`.`name` AS `barangay`,`ri`.`revperiod` AS `revperiod`,`ri`.`revtype` AS `revtype`,`ri`.`year` AS `year`,`ri`.`qtr` AS `qtr`,`ri`.`amount` AS `amount`,`ri`.`interest` AS `interest`,`ri`.`discount` AS `discount`,`pc`.`name` AS `classname`,`pc`.`orderno` AS `orderno`,`pc`.`special` AS `special`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basic')) then `ri`.`amount` else 0.0 end) AS `basiccurrent`,(case when (`ri`.`revtype` = 'basic') then `ri`.`discount` else 0.0 end) AS `basicdisc`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basic')) then `ri`.`amount` else 0.0 end) AS `basicprev`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basic')) then `ri`.`interest` else 0.0 end) AS `basiccurrentint`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basic')) then `ri`.`interest` else 0.0 end) AS `basicprevint`,(case when (`ri`.`revtype` = 'basic') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `basicnet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sef')) then `ri`.`amount` else 0.0 end) AS `sefcurrent`,(case when (`ri`.`revtype` = 'sef') then `ri`.`discount` else 0.0 end) AS `sefdisc`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sef')) then `ri`.`amount` else 0.0 end) AS `sefprev`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sef')) then `ri`.`interest` else 0.0 end) AS `sefcurrentint`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sef')) then `ri`.`interest` else 0.0 end) AS `sefprevint`,(case when (`ri`.`revtype` = 'sef') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `sefnet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'basicidle')) then `ri`.`amount` else 0.0 end) AS `idlecurrent`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'basicidle')) then `ri`.`amount` else 0.0 end) AS `idleprev`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`discount` else 0.0 end) AS `idledisc`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`interest` else 0 end) AS `idleint`,(case when (`ri`.`revtype` = 'basicidle') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `idlenet`,(case when ((`ri`.`revperiod` = 'current') and (`ri`.`revtype` = 'sh')) then `ri`.`amount` else 0.0 end) AS `shcurrent`,(case when ((`ri`.`revperiod` in ('previous','prior')) and (`ri`.`revtype` = 'sh')) then `ri`.`amount` else 0.0 end) AS `shprev`,(case when (`ri`.`revtype` = 'sh') then `ri`.`discount` else 0.0 end) AS `shdisc`,(case when (`ri`.`revtype` = 'sh') then `ri`.`interest` else 0 end) AS `shint`,(case when (`ri`.`revtype` = 'sh') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `shnet`,(case when (`ri`.`revtype` = 'firecode') then ((`ri`.`amount` - `ri`.`discount`) + `ri`.`interest`) else 0 end) AS `firecode`,0.0 AS `levynet` from (((((((`vw_landtax_eor_remittance` `rem` join `vw_landtax_eor` `eor` on((`rem`.`objid` = `eor`.`remittanceid`))) join `rptpayment` `rp` on((`eor`.`objid` = `rp`.`receiptid`))) join `rptpayment_item` `ri` on((`rp`.`objid` = `ri`.`parentid`))) left join `rptledger` `rl` on((`rp`.`refid` = `rl`.`objid`))) left join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) left join `sys_org` `o` on((`rl`.`lguid` = `o`.`objid`))) left join `propertyclassification` `pc` on((`rl`.`classification_objid` = `pc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_disposition_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_disposition_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_disposition_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_disposition_detail` AS select `cv`.`objid` AS `liquidationid`,`cv`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`cr`.`receiptdate` AS `receiptdate`,`ri`.`revperiod` AS `revperiod`,(case when ((`ri`.`revtype` in ('basic','basicint','basicidle','basicidleint')) and (`ri`.`sharetype` in ('province','city'))) then `ri`.`amount` else 0.0 end) AS `provcitybasicshare`,(case when ((`ri`.`revtype` in ('basic','basicint','basicidle','basicidleint')) and (`ri`.`sharetype` = 'municipality')) then `ri`.`amount` else 0.0 end) AS `munibasicshare`,(case when ((`ri`.`revtype` in ('basic','basicint')) and (`ri`.`sharetype` = 'barangay')) then `ri`.`amount` else 0.0 end) AS `brgybasicshare`,(case when ((`ri`.`revtype` in ('sef','sefint')) and (`ri`.`sharetype` in ('province','city'))) then `ri`.`amount` else 0.0 end) AS `provcitysefshare`,(case when ((`ri`.`revtype` in ('sef','sefint')) and (`ri`.`sharetype` = 'municipality')) then `ri`.`amount` else 0.0 end) AS `munisefshare`,0.0 AS `brgysefshare`,(case when isnull(`crv`.`objid`) then 0 else 1 end) AS `voided` from (((((`remittance` `rem` join `collectionvoucher` `cv` on((`cv`.`objid` = `rem`.`collectionvoucherid`))) join `cashreceipt` `cr` on((`cr`.`remittanceid` = `rem`.`objid`))) left join `cashreceipt_void` `crv` on((`cr`.`objid` = `crv`.`receiptid`))) join `rptpayment` `rp` on((`cr`.`objid` = `rp`.`receiptid`))) join `rptpayment_share` `ri` on((`rp`.`objid` = `ri`.`parentid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_disposition_detail_eor`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_disposition_detail_eor`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_disposition_detail_eor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_disposition_detail_eor` AS select `rem`.`objid` AS `liquidationid`,`rem`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controldate` AS `remittancedate`,`eor`.`receiptdate` AS `receiptdate`,`ri`.`revperiod` AS `revperiod`,(case when ((`ri`.`revtype` in ('basic','basicint','basicidle','basicidleint')) and (`ri`.`sharetype` in ('province','city'))) then `ri`.`amount` else 0.0 end) AS `provcitybasicshare`,(case when ((`ri`.`revtype` in ('basic','basicint','basicidle','basicidleint')) and (`ri`.`sharetype` = 'municipality')) then `ri`.`amount` else 0.0 end) AS `munibasicshare`,(case when ((`ri`.`revtype` in ('basic','basicint')) and (`ri`.`sharetype` = 'barangay')) then `ri`.`amount` else 0.0 end) AS `brgybasicshare`,(case when ((`ri`.`revtype` in ('sef','sefint')) and (`ri`.`sharetype` in ('province','city'))) then `ri`.`amount` else 0.0 end) AS `provcitysefshare`,(case when ((`ri`.`revtype` in ('sef','sefint')) and (`ri`.`sharetype` = 'municipality')) then `ri`.`amount` else 0.0 end) AS `munisefshare`,0.0 AS `brgysefshare` from (((`vw_landtax_eor_remittance` `rem` join `vw_landtax_eor` `eor` on((`rem`.`objid` = `eor`.`remittanceid`))) join `rptpayment` `rp` on((`eor`.`objid` = `rp`.`receiptid`))) join `rptpayment_share` `ri` on((`rp`.`objid` = `ri`.`parentid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_share_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_share_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_share_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_share_detail` AS select `cv`.`objid` AS `liquidationid`,`cv`.`controlno` AS `liquidationno`,`cv`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controlno` AS `remittanceno`,`rem`.`controldate` AS `remittancedate`,`cr`.`objid` AS `receiptid`,`cr`.`receiptno` AS `receiptno`,`cr`.`receiptdate` AS `receiptdate`,`cr`.`txndate` AS `txndate`,`o`.`name` AS `lgu`,`b`.`objid` AS `barangayid`,`b`.`name` AS `barangay`,`cra`.`revtype` AS `revtype`,`cra`.`revperiod` AS `revperiod`,`cra`.`sharetype` AS `sharetype`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic')) then `cra`.`amount` else 0 end) AS `brgycurr`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic')) then `cra`.`amount` else 0 end) AS `brgyprev`,(case when (`cra`.`revtype` = 'basicint') then `cra`.`amount` else 0 end) AS `brgypenalty`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgycurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgyprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgypenaltyshare`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `citycurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `cityprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `citypenaltyshare`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmunicurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmuniprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmunipenaltyshare`,`cra`.`amount` AS `amount`,`cra`.`discount` AS `discount`,(case when isnull(`crv`.`objid`) then 0 else 1 end) AS `voided` from ((((((((`remittance` `rem` join `collectionvoucher` `cv` on((`cv`.`objid` = `rem`.`collectionvoucherid`))) join `cashreceipt` `cr` on((`cr`.`remittanceid` = `rem`.`objid`))) join `rptpayment` `rp` on((`cr`.`objid` = `rp`.`receiptid`))) join `rptpayment_share` `cra` on((`rp`.`objid` = `cra`.`parentid`))) left join `rptledger` `rl` on((`rp`.`refid` = `rl`.`objid`))) left join `sys_org` `o` on((`rl`.`lguid` = `o`.`objid`))) left join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) left join `cashreceipt_void` `crv` on((`cr`.`objid` = `crv`.`receiptid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_collection_share_detail_eor`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_collection_share_detail_eor`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_collection_share_detail_eor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_collection_share_detail_eor` AS select `rem`.`objid` AS `liquidationid`,`rem`.`controlno` AS `liquidationno`,`rem`.`controldate` AS `liquidationdate`,`rem`.`objid` AS `remittanceid`,`rem`.`controlno` AS `remittanceno`,`rem`.`controldate` AS `remittancedate`,`eor`.`objid` AS `receiptid`,`eor`.`receiptno` AS `receiptno`,`eor`.`receiptdate` AS `receiptdate`,`eor`.`txndate` AS `txndate`,`o`.`name` AS `lgu`,`b`.`objid` AS `barangayid`,`b`.`name` AS `barangay`,`cra`.`revtype` AS `revtype`,`cra`.`revperiod` AS `revperiod`,`cra`.`sharetype` AS `sharetype`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic')) then `cra`.`amount` else 0 end) AS `brgycurr`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic')) then `cra`.`amount` else 0 end) AS `brgyprev`,(case when (`cra`.`revtype` = 'basicint') then `cra`.`amount` else 0 end) AS `brgypenalty`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgycurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgyprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` = 'barangay')) then `cra`.`amount` else 0 end) AS `brgypenaltyshare`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `citycurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `cityprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` = 'city')) then `cra`.`amount` else 0 end) AS `citypenaltyshare`,(case when ((`cra`.`revperiod` = 'current') and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmunicurrshare`,(case when ((`cra`.`revperiod` in ('previous','prior')) and (`cra`.`revtype` = 'basic') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmuniprevshare`,(case when ((`cra`.`revtype` = 'basicint') and (`cra`.`sharetype` in ('province','municipality'))) then `cra`.`amount` else 0 end) AS `provmunipenaltyshare`,`cra`.`amount` AS `amount`,`cra`.`discount` AS `discount` from (((((((`vw_landtax_eor_remittance` `rem` join `vw_landtax_eor` `eor` on((`rem`.`objid` = `eor`.`remittanceid`))) join `rptpayment` `rp` on((`eor`.`objid` = `rp`.`receiptid`))) join `rptpayment_share` `cra` on((`rp`.`objid` = `cra`.`parentid`))) left join `rptledger` `rl` on((`rp`.`refid` = `rl`.`objid`))) left join `sys_org` `o` on((`rl`.`lguid` = `o`.`objid`))) left join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) left join `cashreceipt_void` `crv` on((`eor`.`objid` = `crv`.`receiptid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_eor`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_eor`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_eor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_eor` AS select `eor`.`eor`.`objid` AS `objid`,`eor`.`eor`.`receiptno` AS `receiptno`,`eor`.`eor`.`receiptdate` AS `receiptdate`,`eor`.`eor`.`txndate` AS `txndate`,`eor`.`eor`.`state` AS `state`,`eor`.`eor`.`partnerid` AS `partnerid`,`eor`.`eor`.`txntype` AS `txntype`,`eor`.`eor`.`traceid` AS `traceid`,`eor`.`eor`.`tracedate` AS `tracedate`,`eor`.`eor`.`refid` AS `refid`,`eor`.`eor`.`paidby` AS `paidby`,`eor`.`eor`.`paidbyaddress` AS `paidbyaddress`,`eor`.`eor`.`payer_objid` AS `payer_objid`,`eor`.`eor`.`paymethod` AS `paymethod`,`eor`.`eor`.`paymentrefid` AS `paymentrefid`,`eor`.`eor`.`remittanceid` AS `remittanceid`,`eor`.`eor`.`remarks` AS `remarks`,`eor`.`eor`.`amount` AS `amount`,`eor`.`eor`.`lockid` AS `lockid` from `eor`.`eor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_eor_remittance`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_eor_remittance`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_eor_remittance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_eor_remittance` AS select `eor`.`eor_remittance`.`objid` AS `objid`,`eor`.`eor_remittance`.`state` AS `state`,`eor`.`eor_remittance`.`controlno` AS `controlno`,`eor`.`eor_remittance`.`partnerid` AS `partnerid`,`eor`.`eor_remittance`.`controldate` AS `controldate`,`eor`.`eor_remittance`.`dtcreated` AS `dtcreated`,`eor`.`eor_remittance`.`createdby_objid` AS `createdby_objid`,`eor`.`eor_remittance`.`createdby_name` AS `createdby_name`,`eor`.`eor_remittance`.`amount` AS `amount`,`eor`.`eor_remittance`.`dtposted` AS `dtposted`,`eor`.`eor_remittance`.`postedby_objid` AS `postedby_objid`,`eor`.`eor_remittance`.`postedby_name` AS `postedby_name`,`eor`.`eor_remittance`.`lockid` AS `lockid` from `eor`.`eor_remittance` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_lgu_account_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_lgu_account_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_lgu_account_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_lgu_account_mapping` AS select `ia`.`org_objid` AS `org_objid`,`ia`.`org_name` AS `org_name`,`o`.`orgclass` AS `org_class`,`p`.`objid` AS `parent_objid`,`p`.`code` AS `parent_code`,`p`.`title` AS `parent_title`,`ia`.`objid` AS `item_objid`,`ia`.`code` AS `item_code`,`ia`.`title` AS `item_title`,`ia`.`fund_objid` AS `item_fund_objid`,`ia`.`fund_code` AS `item_fund_code`,`ia`.`fund_title` AS `item_fund_title`,`ia`.`type` AS `item_type`,`pt`.`tag` AS `item_tag` from (((`itemaccount` `ia` join `itemaccount` `p` on((`ia`.`parentid` = `p`.`objid`))) join `itemaccount_tag` `pt` on((`p`.`objid` = `pt`.`acctid`))) join `sys_org` `o` on((`ia`.`org_objid` = `o`.`objid`))) where (`p`.`state` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_report_rptdelinquency`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_report_rptdelinquency`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_report_rptdelinquency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_report_rptdelinquency` AS select `ri`.`objid` AS `objid`,`ri`.`rptledgerid` AS `rptledgerid`,`ri`.`barangayid` AS `barangayid`,`ri`.`year` AS `year`,`ri`.`qtr` AS `qtr`,`r`.`dtgenerated` AS `dtgenerated`,`r`.`dtcomputed` AS `dtcomputed`,`r`.`generatedby_name` AS `generatedby_name`,`r`.`generatedby_title` AS `generatedby_title`,(case when (`ri`.`revtype` = 'basic') then `ri`.`amount` else 0 end) AS `basic`,(case when (`ri`.`revtype` = 'basic') then `ri`.`interest` else 0 end) AS `basicint`,(case when (`ri`.`revtype` = 'basic') then `ri`.`discount` else 0 end) AS `basicdisc`,(case when (`ri`.`revtype` = 'basic') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `basicdp`,(case when (`ri`.`revtype` = 'basic') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `basicnet`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`amount` else 0 end) AS `basicidle`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`interest` else 0 end) AS `basicidleint`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`discount` else 0 end) AS `basicidledisc`,(case when (`ri`.`revtype` = 'basicidle') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `basicidledp`,(case when (`ri`.`revtype` = 'basicidle') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `basicidlenet`,(case when (`ri`.`revtype` = 'sef') then `ri`.`amount` else 0 end) AS `sef`,(case when (`ri`.`revtype` = 'sef') then `ri`.`interest` else 0 end) AS `sefint`,(case when (`ri`.`revtype` = 'sef') then `ri`.`discount` else 0 end) AS `sefdisc`,(case when (`ri`.`revtype` = 'sef') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `sefdp`,(case when (`ri`.`revtype` = 'sef') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `sefnet`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`amount` else 0 end) AS `firecode`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`interest` else 0 end) AS `firecodeint`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`discount` else 0 end) AS `firecodedisc`,(case when (`ri`.`revtype` = 'firecode') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `firecodedp`,(case when (`ri`.`revtype` = 'firecode') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `firecodenet`,(case when (`ri`.`revtype` = 'sh') then `ri`.`amount` else 0 end) AS `sh`,(case when (`ri`.`revtype` = 'sh') then `ri`.`interest` else 0 end) AS `shint`,(case when (`ri`.`revtype` = 'sh') then `ri`.`discount` else 0 end) AS `shdisc`,(case when (`ri`.`revtype` = 'sh') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `shdp`,(case when (`ri`.`revtype` = 'sh') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `shnet`,((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) AS `total` from (`report_rptdelinquency_item` `ri` join `report_rptdelinquency` `r` on((`ri`.`parentid` = `r`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_report_rptdelinquency_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_report_rptdelinquency_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_report_rptdelinquency_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_report_rptdelinquency_detail` AS select `r`.`objid` AS `parentid`,`ri`.`objid` AS `objid`,`ri`.`rptledgerid` AS `rptledgerid`,`ri`.`barangayid` AS `barangayid`,`ri`.`year` AS `year`,`ri`.`qtr` AS `qtr`,`r`.`dtgenerated` AS `dtgenerated`,`r`.`dtcomputed` AS `dtcomputed`,`r`.`generatedby_name` AS `generatedby_name`,`r`.`generatedby_title` AS `generatedby_title`,(case when (`ri`.`revtype` = 'basic') then `ri`.`amount` else 0 end) AS `basic`,(case when (`ri`.`revtype` = 'basic') then `ri`.`interest` else 0 end) AS `basicint`,(case when (`ri`.`revtype` = 'basic') then `ri`.`discount` else 0 end) AS `basicdisc`,(case when (`ri`.`revtype` = 'basic') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `basicdp`,(case when (`ri`.`revtype` = 'basic') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `basicnet`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`amount` else 0 end) AS `basicidle`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`interest` else 0 end) AS `basicidleint`,(case when (`ri`.`revtype` = 'basicidle') then `ri`.`discount` else 0 end) AS `basicidledisc`,(case when (`ri`.`revtype` = 'basicidle') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `basicidledp`,(case when (`ri`.`revtype` = 'basicidle') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `basicidlenet`,(case when (`ri`.`revtype` = 'sef') then `ri`.`amount` else 0 end) AS `sef`,(case when (`ri`.`revtype` = 'sef') then `ri`.`interest` else 0 end) AS `sefint`,(case when (`ri`.`revtype` = 'sef') then `ri`.`discount` else 0 end) AS `sefdisc`,(case when (`ri`.`revtype` = 'sef') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `sefdp`,(case when (`ri`.`revtype` = 'sef') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `sefnet`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`amount` else 0 end) AS `firecode`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`interest` else 0 end) AS `firecodeint`,(case when (`ri`.`revtype` = 'firecode') then `ri`.`discount` else 0 end) AS `firecodedisc`,(case when (`ri`.`revtype` = 'firecode') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `firecodedp`,(case when (`ri`.`revtype` = 'firecode') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `firecodenet`,(case when (`ri`.`revtype` = 'sh') then `ri`.`amount` else 0 end) AS `sh`,(case when (`ri`.`revtype` = 'sh') then `ri`.`interest` else 0 end) AS `shint`,(case when (`ri`.`revtype` = 'sh') then `ri`.`discount` else 0 end) AS `shdisc`,(case when (`ri`.`revtype` = 'sh') then (`ri`.`interest` - `ri`.`discount`) else 0 end) AS `shdp`,(case when (`ri`.`revtype` = 'sh') then ((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) else 0 end) AS `shnet`,((`ri`.`amount` + `ri`.`interest`) - `ri`.`discount`) AS `total` from (`report_rptdelinquency_item` `ri` join `report_rptdelinquency` `r` on((`ri`.`parentid` = `r`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_machine_smv`
--

/*!50001 DROP TABLE IF EXISTS `vw_machine_smv`*/;
/*!50001 DROP VIEW IF EXISTS `vw_machine_smv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_machine_smv` AS select `ms`.`objid` AS `objid`,`ms`.`parent_objid` AS `parent_objid`,`ms`.`machine_objid` AS `machine_objid`,`ms`.`expr` AS `expr`,`ms`.`previd` AS `previd`,`m`.`code` AS `code`,`m`.`name` AS `name` from (`machine_smv` `ms` join `machine` `m` on((`ms`.`machine_objid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_machinery`
--

/*!50001 DROP TABLE IF EXISTS `vw_machinery`*/;
/*!50001 DROP VIEW IF EXISTS `vw_machinery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_machinery` AS select `f`.`objid` AS `objid`,`f`.`state` AS `state`,`f`.`rpuid` AS `rpuid`,`f`.`realpropertyid` AS `realpropertyid`,`f`.`tdno` AS `tdno`,`f`.`fullpin` AS `fullpin`,`f`.`taxpayer_objid` AS `taxpayer_objid`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`f`.`lguid` AS `lgu_objid`,`o`.`name` AS `lgu_name`,`b`.`objid` AS `barangay_objid`,`b`.`name` AS `barangay_name`,`r`.`classification_objid` AS `classification_objid`,`pc`.`name` AS `classification_name`,`rp`.`pin` AS `pin`,`rp`.`section` AS `section`,`rp`.`ry` AS `ry`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`m`.`objid` AS `machine_objid`,`m`.`name` AS `machine_name`,`mu`.`basemarketvalue` AS `basemarketvalue`,`mu`.`marketvalue` AS `marketvalue`,`mu`.`assessedvalue` AS `assessedvalue`,`al`.`objid` AS `actualuse_objid`,`al`.`name` AS `actualuse_name`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav` from (((((((((`faas` `f` join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `machuse` `mu` on((`r`.`objid` = `mu`.`machrpuid`))) join `machdetail` `md` on((`mu`.`objid` = `md`.`machuseid`))) join `machine` `m` on((`md`.`machine_objid` = `m`.`objid`))) join `machassesslevel` `al` on((`mu`.`actualuse_objid` = `al`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_migrated_business`
--

/*!50001 DROP TABLE IF EXISTS `vw_migrated_business`*/;
/*!50001 DROP VIEW IF EXISTS `vw_migrated_business`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_migrated_business` AS select `b`.`objid` AS `objid`,`b`.`state` AS `state`,`b`.`bin` AS `bin`,`b`.`tradename` AS `tradename`,`b`.`businessname` AS `businessname`,`b`.`address_text` AS `address_text`,`b`.`address_objid` AS `address_objid`,`b`.`owner_name` AS `owner_name`,`b`.`owner_address_text` AS `owner_address_text`,`b`.`owner_address_objid` AS `owner_address_objid`,`b`.`yearstarted` AS `yearstarted`,`b`.`orgtype` AS `orgtype`,`b`.`permittype` AS `permittype`,`b`.`officetype` AS `officetype`,`a`.`objid` AS `applicationid`,`a`.`state` AS `appstate`,`a`.`appyear` AS `appyear`,`a`.`apptype` AS `apptype`,`a`.`appno` AS `appno`,`a`.`dtfiled` AS `dtfiled`,`a`.`txndate` AS `txndate`,`a`.`txnmode` AS `txnmode` from ((`migrated_business` `mb` join `business` `b` on((`b`.`objid` = `mb`.`objid`))) join `business_application` `a` on((`a`.`objid` = `mb`.`applicationid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_newly_assessed_property`
--

/*!50001 DROP TABLE IF EXISTS `vw_newly_assessed_property`*/;
/*!50001 DROP VIEW IF EXISTS `vw_newly_assessed_property`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_newly_assessed_property` AS select `f`.`objid` AS `objid`,`f`.`owner_name` AS `owner_name`,`f`.`tdno` AS `tdno`,`b`.`name` AS `barangay`,(case when (`f`.`rputype` = 'land') then 'LAND' when (`f`.`rputype` = 'bldg') then 'BUILDING' when (`f`.`rputype` = 'mach') then 'MACHINERY' when (`f`.`rputype` = 'planttree') then 'PLANT/TREE' else 'MISCELLANEOUS' end) AS `rputype`,`f`.`totalav` AS `totalav`,`f`.`effectivityyear` AS `effectivityyear` from (`faas_list` `f` join `barangay` `b` on((`f`.`barangayid` = `b`.`objid`))) where ((`f`.`state` in ('CURRENT','CANCELLED')) and (`f`.`txntype_objid` = 'ND')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ocular_inspection`
--

/*!50001 DROP TABLE IF EXISTS `vw_ocular_inspection`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ocular_inspection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ocular_inspection` AS select `ef`.`objid` AS `objid`,`ef`.`findings` AS `findings`,`ef`.`parent_objid` AS `parent_objid`,`ef`.`dtinspected` AS `dtinspected`,`ef`.`inspectors` AS `inspectors`,`ef`.`notedby` AS `notedby`,`ef`.`notedbytitle` AS `notedbytitle`,`ef`.`photos` AS `photos`,`ef`.`recommendations` AS `recommendations`,`ef`.`inspectedby_objid` AS `inspectedby_objid`,`ef`.`inspectedby_name` AS `inspectedby_name`,`ef`.`inspectedby_title` AS `inspectedby_title`,`ef`.`doctype` AS `doctype`,`ef`.`txnno` AS `txnno`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`titleno` AS `titleno`,`f`.`fullpin` AS `fullpin`,`rp`.`blockno` AS `blockno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`f`.`lguid` AS `lguid`,`o`.`name` AS `lgu_name`,`rp`.`barangayid` AS `barangayid`,`b`.`name` AS `barangay_name`,`b`.`objid` AS `barangay_parentid`,`rp`.`purok` AS `purok`,`rp`.`street` AS `street` from (((((`examiner_finding` `ef` join `faas` `f` on((`ef`.`parent_objid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `sys_org` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) union all select `ef`.`objid` AS `objid`,`ef`.`findings` AS `findings`,`ef`.`parent_objid` AS `parent_objid`,`ef`.`dtinspected` AS `dtinspected`,`ef`.`inspectors` AS `inspectors`,`ef`.`notedby` AS `notedby`,`ef`.`notedbytitle` AS `notedbytitle`,`ef`.`photos` AS `photos`,`ef`.`recommendations` AS `recommendations`,`ef`.`inspectedby_objid` AS `inspectedby_objid`,`ef`.`inspectedby_name` AS `inspectedby_name`,`ef`.`inspectedby_title` AS `inspectedby_title`,`ef`.`doctype` AS `doctype`,`ef`.`txnno` AS `txnno`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`titleno` AS `titleno`,`f`.`fullpin` AS `fullpin`,`rp`.`blockno` AS `blockno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`f`.`lguid` AS `lguid`,`o`.`name` AS `lgu_name`,`rp`.`barangayid` AS `barangayid`,`b`.`name` AS `barangay_name`,`b`.`parent_objid` AS `barangay_parentid`,`rp`.`purok` AS `purok`,`rp`.`street` AS `street` from ((((((`examiner_finding` `ef` left join `subdivision_motherland` `sm` on((`ef`.`parent_objid` = `sm`.`subdivisionid`))) left join `faas` `f` on((`sm`.`landfaasid` = `f`.`objid`))) left join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) left join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) left join `sys_org` `b` on((`rp`.`barangayid` = `b`.`objid`))) left join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) union all select `ef`.`objid` AS `objid`,`ef`.`findings` AS `findings`,`ef`.`parent_objid` AS `parent_objid`,`ef`.`dtinspected` AS `dtinspected`,`ef`.`inspectors` AS `inspectors`,`ef`.`notedby` AS `notedby`,`ef`.`notedbytitle` AS `notedbytitle`,`ef`.`photos` AS `photos`,`ef`.`recommendations` AS `recommendations`,`ef`.`inspectedby_objid` AS `inspectedby_objid`,`ef`.`inspectedby_name` AS `inspectedby_name`,`ef`.`inspectedby_title` AS `inspectedby_title`,`ef`.`doctype` AS `doctype`,`ef`.`txnno` AS `txnno`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`titleno` AS `titleno`,`f`.`fullpin` AS `fullpin`,`rp`.`blockno` AS `blockno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`f`.`lguid` AS `lguid`,`o`.`name` AS `lgu_name`,`rp`.`barangayid` AS `barangayid`,`b`.`name` AS `barangay_name`,`b`.`parent_objid` AS `barangay_parentid`,`rp`.`purok` AS `purok`,`rp`.`street` AS `street` from ((((((`examiner_finding` `ef` join `consolidation` `c` on((`ef`.`parent_objid` = `c`.`objid`))) left join `faas` `f` on((`c`.`newfaasid` = `f`.`objid`))) left join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) left join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) left join `sys_org` `b` on((`rp`.`barangayid` = `b`.`objid`))) left join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) union all select `ef`.`objid` AS `objid`,`ef`.`findings` AS `findings`,`ef`.`parent_objid` AS `parent_objid`,`ef`.`dtinspected` AS `dtinspected`,`ef`.`inspectors` AS `inspectors`,`ef`.`notedby` AS `notedby`,`ef`.`notedbytitle` AS `notedbytitle`,`ef`.`photos` AS `photos`,`ef`.`recommendations` AS `recommendations`,`ef`.`inspectedby_objid` AS `inspectedby_objid`,`ef`.`inspectedby_name` AS `inspectedby_name`,`ef`.`inspectedby_title` AS `inspectedby_title`,`ef`.`doctype` AS `doctype`,`ef`.`txnno` AS `txnno`,'\r\n  ' AS `owner_name`,'\r\n  ' AS `owner_address`,'\r\n  ' AS `titleno`,'\r\n  ' AS `fullpin`,'\r\n  ' AS `blockno`,'\r\n  ' AS `cadastrallotno`,0 AS `totalareaha`,0 AS `totalareasqm`,0 AS `totalmv`,0 AS `totalav`,`o`.`objid` AS `lguid`,`o`.`name` AS `lgu_name`,`b`.`objid` AS `barangayid`,`b`.`name` AS `barangay_name`,`b`.`parent_objid` AS `barangay_parentid`,'\r\n  ' AS `purok`,'\r\n  ' AS `street` from (((`examiner_finding` `ef` join `batchgr` `bgr` on((`ef`.`parent_objid` = `bgr`.`objid`))) join `sys_org` `b` on((`bgr`.`barangay_objid` = `b`.`objid`))) join `sys_org` `o` on((`bgr`.`lgu_objid` = `o`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_online_business_application`
--

/*!50001 DROP TABLE IF EXISTS `vw_online_business_application`*/;
/*!50001 DROP VIEW IF EXISTS `vw_online_business_application`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_online_business_application` AS select `oa`.`objid` AS `objid`,`oa`.`state` AS `state`,`oa`.`dtcreated` AS `dtcreated`,`oa`.`createdby_objid` AS `createdby_objid`,`oa`.`createdby_name` AS `createdby_name`,`oa`.`controlno` AS `controlno`,`oa`.`apptype` AS `apptype`,`oa`.`appyear` AS `appyear`,`oa`.`appdate` AS `appdate`,`oa`.`prevapplicationid` AS `prevapplicationid`,`oa`.`business_objid` AS `business_objid`,`b`.`bin` AS `bin`,`b`.`tradename` AS `tradename`,`b`.`businessname` AS `businessname`,`b`.`address_text` AS `address_text`,`b`.`address_objid` AS `address_objid`,`b`.`owner_name` AS `owner_name`,`b`.`owner_address_text` AS `owner_address_text`,`b`.`owner_address_objid` AS `owner_address_objid`,`b`.`yearstarted` AS `yearstarted`,`b`.`orgtype` AS `orgtype`,`b`.`permittype` AS `permittype`,`b`.`officetype` AS `officetype`,`oa`.`step` AS `step` from ((`online_business_application` `oa` join `business_application` `a` on((`a`.`objid` = `oa`.`prevapplicationid`))) join `business` `b` on((`b`.`objid` = `a`.`business_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_real_property_payment`
--

/*!50001 DROP TABLE IF EXISTS `vw_real_property_payment`*/;
/*!50001 DROP VIEW IF EXISTS `vw_real_property_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_real_property_payment` AS select `cv`.`controldate` AS `cv_controldate`,`rem`.`controldate` AS `rem_controldate`,`rl`.`owner_name` AS `owner_name`,`rl`.`tdno` AS `tdno`,`pc`.`name` AS `classification`,(case when (`rl`.`rputype` = 'land') then 'LAND' when (`rl`.`rputype` = 'bldg') then 'BUILDING' when (`rl`.`rputype` = 'mach') then 'MACHINERY' when (`rl`.`rputype` = 'planttree') then 'PLANT/TREE' else 'MISCELLANEOUS' end) AS `rputype`,`b`.`name` AS `barangay`,`rpi`.`year` AS `year`,`rpi`.`qtr` AS `qtr`,((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided` from ((((((((`collectionvoucher` `cv` join `remittance` `rem` on((`cv`.`objid` = `rem`.`collectionvoucherid`))) join `cashreceipt` `cr` on((`rem`.`objid` = `cr`.`remittanceid`))) join `rptpayment` `rp` on((`cr`.`objid` = `rp`.`receiptid`))) join `rptpayment_item` `rpi` on((`rp`.`objid` = `rpi`.`parentid`))) join `rptledger` `rl` on((`rp`.`refid` = `rl`.`objid`))) join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) join `propertyclassification` `pc` on((`rl`.`classification_objid` = `pc`.`objid`))) left join `cashreceipt_void` `v` on((`cr`.`objid` = `v`.`receiptid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt` AS select `r`.`objid` AS `remittance_objid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`controlid` AS `controlid`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindexno`,`c`.`formno` AS `formno`,`c`.`stub` AS `stubno`,`c`.`series` AS `series`,`c`.`receiptno` AS `receiptno`,`c`.`receiptdate` AS `receiptdate`,`c`.`amount` AS `amount`,`c`.`totalnoncash` AS `totalnoncash`,(`c`.`amount` - `c`.`totalnoncash`) AS `totalcash`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0 else `c`.`amount` end) AS `voidamount`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`payer_objid` AS `payer_objid`,`c`.`payer_name` AS `payer_name`,`c`.`collector_objid` AS `collector_objid`,`c`.`collector_name` AS `collector_name`,`c`.`collector_title` AS `collector_title`,`c`.`objid` AS `receiptid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`org_objid` AS `org_objid` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `af` on((`af`.`objid` = `c`.`formno`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_af`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_af` AS select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,min(`cr`.`receiptno`) AS `fromreceiptno`,max(`cr`.`receiptno`) AS `toreceiptno`,min(`cr`.`series`) AS `fromseries`,max(`cr`.`series`) AS `toseries`,count(`cr`.`objid`) AS `qty`,sum(`cr`.`amount`) AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,count(`cr`.`objid`) AS `qtyvoided`,sum(`cr`.`amount`) AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from ((((`cashreceipt` `cr` join `cashreceipt_void` `cv` on((`cv`.`receiptid` = `cr`.`objid`))) join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,count(`cr`.`objid`) AS `qtycancelled`,sum(`cr`.`amount`) AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) where (`cr`.`state` = 'CANCELLED') group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_afsummary`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_afsummary` AS select concat(`v`.`remittanceid`,'|',`v`.`collector_objid`,'|',`v`.`controlid`) AS `objid`,`v`.`remittanceid` AS `remittanceid`,`v`.`collector_objid` AS `collector_objid`,`v`.`controlid` AS `controlid`,min(`v`.`fromreceiptno`) AS `fromreceiptno`,max(`v`.`toreceiptno`) AS `toreceiptno`,min(`v`.`fromseries`) AS `fromseries`,max(`v`.`toseries`) AS `toseries`,sum(`v`.`qty`) AS `qty`,sum(`v`.`amount`) AS `amount`,sum(`v`.`qtyvoided`) AS `qtyvoided`,sum(`v`.`voidamt`) AS `voidamt`,sum(`v`.`qtycancelled`) AS `qtycancelled`,sum(`v`.`cancelledamt`) AS `cancelledamt`,`v`.`formtype` AS `formtype`,`v`.`serieslength` AS `serieslength`,`v`.`denomination` AS `denomination`,`v`.`formno` AS `formno`,`v`.`stubno` AS `stubno`,`v`.`startseries` AS `startseries`,`v`.`endseries` AS `endseries`,`v`.`prefix` AS `prefix`,`v`.`suffix` AS `suffix` from `vw_remittance_cashreceipt_af` `v` group by `v`.`remittanceid`,`v`.`collector_objid`,`v`.`controlid`,`v`.`formtype`,`v`.`serieslength`,`v`.`denomination`,`v`.`formno`,`v`.`stubno`,`v`.`startseries`,`v`.`endseries`,`v`.`prefix`,`v`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptitem` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`formtype` AS `formtype`,`c`.`formno` AS `formno`,`cri`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`controlid` AS `controlid`,`c`.`series` AS `series`,`c`.`stub` AS `stubno`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cri`.`item_fund_objid` AS `fundid`,`cri`.`item_objid` AS `acctid`,`cri`.`item_code` AS `acctcode`,`cri`.`item_title` AS `acctname`,`cri`.`remarks` AS `remarks`,(case when isnull(`v`.`objid`) then `cri`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cri`.`amount` end) AS `voidamount`,(case when (`c`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `cri` on((`cri`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`fund_objid` AS `fundid`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`cp`.`bankid` AS `bankid`,`cp`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'CHECK')))) join `checkpayment` `cp` on((`cp`.`objid` = `nc`.`refid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) union all select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,'EFT' AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`fund_objid` AS `fundid`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`ba`.`bank_objid` AS `bankid`,`ba`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from (((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'EFT')))) join `eftpayment` `eft` on((`eft`.`objid` = `nc`.`refid`))) join `bankaccount` `ba` on((`ba`.`objid` = `eft`.`bankacctid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptshare` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`controlid` AS `controlid`,`c`.`series` AS `series`,`cs`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cs`.`refitem_objid` AS `refacctid`,`ia`.`fund_objid` AS `fundid`,`ia`.`objid` AS `acctid`,`ia`.`code` AS `acctcode`,`ia`.`title` AS `acctname`,(case when isnull(`v`.`objid`) then `cs`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cs`.`amount` end) AS `voidamount`,(case when (`c`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_consolidated_land`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_consolidated_land`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_consolidated_land`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_consolidated_land` AS select `cl`.`consolidationid` AS `consolidationid`,`f`.`tdno` AS `tdno`,`f`.`owner_name` AS `owner_name`,`b`.`name` AS `barangay`,`o`.`name` AS `lguname`,`f`.`titleno` AS `titleno`,`f`.`fullpin` AS `fullpin`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`rputype` AS `rputype`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`r`.`taxable` AS `taxable`,`f`.`administrator_name` AS `administrator_name`,`f`.`txntype_objid` AS `txntype_objid`,`pc`.`code` AS `classcode`,`ft`.`displaycode` AS `txntype_code`,`e`.`name` AS `taxpayer_name` from ((((((((`consolidatedland` `cl` join `faas` `f` on((`cl`.`landfaasid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_consolidation`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_consolidation`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_consolidation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_consolidation` AS select `c`.`objid` AS `objid`,`c`.`txnno` AS `txnno`,`b`.`name` AS `barangay`,`o`.`name` AS `lguname`,`f`.`tdno` AS `tdno`,`f`.`owner_name` AS `owner_name`,`f`.`administrator_name` AS `administrator_name`,`f`.`titleno` AS `titleno`,`f`.`fullpin` AS `fullpin`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`rputype` AS `rputype`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`f`.`txntype_objid` AS `txntype_objid`,`pc`.`code` AS `classcode`,`ft`.`displaycode` AS `txntype_code`,`e`.`name` AS `taxpayer_name` from ((((((((`consolidation` `c` join `faas` `f` on((`c`.`newfaasid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_landrpu`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_landrpu`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_landrpu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_landrpu` AS select `f`.`objid` AS `objid`,`f`.`state` AS `state`,`o`.`name` AS `lgu`,`b`.`name` AS `barangay`,`f`.`tdno` AS `tdno`,`f`.`fullpin` AS `pin`,`f`.`titleno` AS `titleno`,`f`.`dtapproved` AS `dtapproved`,`f`.`canceldate` AS `canceldate`,`f`.`cancelledbytdnos` AS `cancelledbytdnos`,`f`.`prevtdno` AS `prevtdno`,`f`.`effectivityyear` AS `effectivityyear`,`f`.`effectivityqtr` AS `effectivityqtr`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`pc`.`name` AS `classification`,`lspc`.`name` AS `specificclass`,`sub`.`code` AS `subclasscode`,`sub`.`name` AS `subclass`,`rp`.`blockno` AS `blockno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`ry` AS `ry`,`rp`.`section` AS `section`,`rp`.`parcel` AS `parcel`,`rp`.`surveyno` AS `surveyno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,(case when (`r`.`useswornamount` = 1) then `r`.`swornamount` else `r`.`totalbmv` end) AS `totalbmv`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav` from ((((((((((`faas` `f` join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `landdetail` `ld` on((`r`.`objid` = `ld`.`landrpuid`))) join `lcuvspecificclass` `spc` on((`ld`.`specificclass_objid` = `spc`.`objid`))) join `landspecificclass` `lspc` on((`spc`.`landspecificclass_objid` = `lspc`.`objid`))) join `lcuvsubclass` `sub` on((`ld`.`subclass_objid` = `sub`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_motherland_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_motherland_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_motherland_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_motherland_summary` AS select `m`.`subdivisionid` AS `subdivisionid`,`f`.`tdno` AS `tdno`,`f`.`owner_name` AS `owner_name`,`b`.`name` AS `barangay`,`o`.`name` AS `lguname`,`f`.`titleno` AS `titleno`,`f`.`titledate` AS `titledate`,`f`.`fullpin` AS `fullpin`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`rputype` AS `rputype`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`f`.`administrator_name` AS `administrator_name`,`pc`.`code` AS `classcode`,`ft`.`displaycode` AS `txntype_code`,`e`.`name` AS `taxpayer_name` from ((((((((`subdivision_motherland` `m` join `faas` `f` on((`m`.`landfaasid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_orc`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_orc`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_orc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_orc` AS select `f`.`objid` AS `objid`,`f`.`txntype_objid` AS `txntype_objid`,`f`.`state` AS `state`,`e`.`objid` AS `taxpayerid`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`o`.`name` AS `lgu_name`,`o`.`code` AS `lgu_indexno`,`f`.`dtapproved` AS `dtapproved`,`r`.`rputype` AS `rputype`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classification`,`f`.`fullpin` AS `pin`,`f`.`titleno` AS `titleno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`f`.`tdno` AS `tdno`,`f`.`prevtdno` AS `prevtdno`,'' AS `arpno`,`f`.`prevowner` AS `prevowner`,`b`.`name` AS `location`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,(case when (`f`.`state` = 'CURRENT') then '' else 'CANCELLED' end) AS `remarks` from ((((((`faas` `f` join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) join `sys_org` `o` on((`rp`.`lguid` = `o`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) where (`f`.`state` in ('CURRENT','CANCELLED')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_subdividedland`
--

/*!50001 DROP TABLE IF EXISTS `vw_report_subdividedland`*/;
/*!50001 DROP VIEW IF EXISTS `vw_report_subdividedland`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_subdividedland` AS select `sl`.`objid` AS `objid`,`s`.`objid` AS `subdivisionid`,`s`.`txnno` AS `txnno`,`b`.`name` AS `barangay`,`o`.`name` AS `lguname`,`pc`.`code` AS `classcode`,`f`.`tdno` AS `tdno`,`f`.`owner_name` AS `owner_name`,`f`.`administrator_name` AS `administrator_name`,`f`.`titleno` AS `titleno`,`f`.`lguid` AS `lguid`,`f`.`titledate` AS `titledate`,`f`.`fullpin` AS `fullpin`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`surveyno` AS `surveyno`,`r`.`totalareaha` AS `totalareaha`,`r`.`rputype` AS `rputype`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalmv` AS `totalmv`,`r`.`totalav` AS `totalav`,`r`.`taxable` AS `taxable`,`f`.`txntype_objid` AS `txntype_objid`,`ft`.`displaycode` AS `txntype_code`,`e`.`name` AS `taxpayer_name` from (((((((((`subdividedland` `sl` join `subdivision` `s` on((`sl`.`subdivisionid` = `s`.`objid`))) join `faas` `f` on((`sl`.`newfaasid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptcertification_item`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptcertification_item`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptcertification_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptcertification_item` AS select `rci`.`rptcertificationid` AS `rptcertificationid`,`f`.`objid` AS `faasid`,`f`.`fullpin` AS `fullpin`,`f`.`tdno` AS `tdno`,`e`.`objid` AS `taxpayerid`,`e`.`name` AS `taxpayer_name`,`f`.`owner_name` AS `owner_name`,`f`.`administrator_name` AS `administrator_name`,`f`.`titleno` AS `titleno`,`f`.`rpuid` AS `rpuid`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classname`,`so`.`name` AS `lguname`,`b`.`name` AS `barangay`,`r`.`rputype` AS `rputype`,`r`.`suffix` AS `suffix`,`r`.`totalareaha` AS `totalareaha`,`r`.`totalareasqm` AS `totalareasqm`,`r`.`totalav` AS `totalav`,`r`.`totalmv` AS `totalmv`,`rp`.`street` AS `street`,`rp`.`blockno` AS `blockno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`surveyno` AS `surveyno`,`r`.`taxable` AS `taxable`,`f`.`effectivityyear` AS `effectivityyear`,`f`.`effectivityqtr` AS `effectivityqtr` from (((((((`rptcertificationitem` `rci` join `faas` `f` on((`rci`.`refid` = `f`.`objid`))) join `rpu` `r` on((`f`.`rpuid` = `r`.`objid`))) join `propertyclassification` `pc` on((`r`.`classification_objid` = `pc`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `so` on((`f`.`lguid` = `so`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptledger_avdifference`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptledger_avdifference`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_avdifference`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptledger_avdifference` AS select `rlf`.`objid` AS `objid`,'APPROVED' AS `state`,`d`.`parent_objid` AS `rptledgerid`,`rl`.`faasid` AS `faasid`,`rl`.`tdno` AS `tdno`,`rlf`.`txntype_objid` AS `txntype_objid`,`rlf`.`classification_objid` AS `classification_objid`,`rlf`.`actualuse_objid` AS `actualuse_objid`,`rlf`.`taxable` AS `taxable`,`rlf`.`backtax` AS `backtax`,`d`.`year` AS `fromyear`,1 AS `fromqtr`,`d`.`year` AS `toyear`,4 AS `toqtr`,`d`.`av` AS `assessedvalue`,1 AS `systemcreated`,`rlf`.`reclassed` AS `reclassed`,`rlf`.`idleland` AS `idleland`,1 AS `taxdifference` from ((`rptledger_avdifference` `d` join `rptledgerfaas` `rlf` on((`d`.`rptledgerfaas_objid` = `rlf`.`objid`))) join `rptledger` `rl` on((`d`.`parent_objid` = `rl`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptledger_cancelled_faas`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptledger_cancelled_faas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_cancelled_faas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptledger_cancelled_faas` AS select `rl`.`objid` AS `objid`,`rl`.`state` AS `state`,`rl`.`faasid` AS `faasid`,`rl`.`lastyearpaid` AS `lastyearpaid`,`rl`.`lastqtrpaid` AS `lastqtrpaid`,`rl`.`barangayid` AS `barangayid`,`rl`.`taxpayer_objid` AS `taxpayer_objid`,`rl`.`fullpin` AS `fullpin`,`rl`.`tdno` AS `tdno`,`rl`.`cadastrallotno` AS `cadastrallotno`,`rl`.`rputype` AS `rputype`,`rl`.`txntype_objid` AS `txntype_objid`,`rl`.`classification_objid` AS `classification_objid`,`rl`.`classcode` AS `classcode`,`rl`.`totalav` AS `totalav`,`rl`.`totalmv` AS `totalmv`,`rl`.`totalareaha` AS `totalareaha`,`rl`.`taxable` AS `taxable`,`rl`.`owner_name` AS `owner_name`,`rl`.`prevtdno` AS `prevtdno`,`rl`.`titleno` AS `titleno`,`rl`.`administrator_name` AS `administrator_name`,`rl`.`blockno` AS `blockno`,`rl`.`lguid` AS `lguid`,`rl`.`beneficiary_objid` AS `beneficiary_objid`,`pc`.`name` AS `classification`,`b`.`name` AS `barangay`,`o`.`name` AS `lgu` from (((((`rptledger` `rl` join `faas` `f` on((`rl`.`faasid` = `f`.`objid`))) left join `barangay` `b` on((`rl`.`barangayid` = `b`.`objid`))) left join `sys_org` `o` on((`rl`.`lguid` = `o`.`objid`))) left join `propertyclassification` `pc` on((`rl`.`classification_objid` = `pc`.`objid`))) join `entity` `e` on((`rl`.`taxpayer_objid` = `e`.`objid`))) where ((`rl`.`state` = 'APPROVED') and (`f`.`state` = 'CANCELLED')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptpayment_item_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptpayment_item_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptpayment_item_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptpayment_item_detail` AS select `rpi`.`objid` AS `objid`,`rpi`.`parentid` AS `parentid`,`rpi`.`rptledgerfaasid` AS `rptledgerfaasid`,`rpi`.`year` AS `year`,`rpi`.`qtr` AS `qtr`,`rpi`.`revperiod` AS `revperiod`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`amount` else 0 end) AS `basic`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`interest` else 0 end) AS `basicint`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`discount` else 0 end) AS `basicdisc`,(case when (`rpi`.`revtype` = 'basic') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `basicdp`,(case when (`rpi`.`revtype` = 'basic') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `basicnet`,(case when (`rpi`.`revtype` = 'basicidle') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `basicidle`,(case when (`rpi`.`revtype` = 'basicidle') then `rpi`.`interest` else 0 end) AS `basicidleint`,(case when (`rpi`.`revtype` = 'basicidle') then `rpi`.`discount` else 0 end) AS `basicidledisc`,(case when (`rpi`.`revtype` = 'basicidle') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `basicidledp`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`amount` else 0 end) AS `sef`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`interest` else 0 end) AS `sefint`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`discount` else 0 end) AS `sefdisc`,(case when (`rpi`.`revtype` = 'sef') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `sefdp`,(case when (`rpi`.`revtype` = 'sef') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `sefnet`,(case when (`rpi`.`revtype` = 'firecode') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `firecode`,(case when (`rpi`.`revtype` = 'sh') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `sh`,(case when (`rpi`.`revtype` = 'sh') then `rpi`.`interest` else 0 end) AS `shint`,(case when (`rpi`.`revtype` = 'sh') then `rpi`.`discount` else 0 end) AS `shdisc`,(case when (`rpi`.`revtype` = 'sh') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `shdp`,(case when (`rpi`.`revtype` = 'sh') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `shnet`,((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) AS `amount`,`rpi`.`partialled` AS `partialled` from `rptpayment_item` `rpi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rpu_assessment`
--

/*!50001 DROP TABLE IF EXISTS `vw_rpu_assessment`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rpu_assessment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rpu_assessment` AS select `r`.`objid` AS `objid`,`r`.`rputype` AS `rputype`,`dpc`.`objid` AS `dominantclass_objid`,`dpc`.`code` AS `dominantclass_code`,`dpc`.`name` AS `dominantclass_name`,`dpc`.`orderno` AS `dominantclass_orderno`,`ra`.`areasqm` AS `areasqm`,`ra`.`areaha` AS `areaha`,`ra`.`marketvalue` AS `marketvalue`,`ra`.`assesslevel` AS `assesslevel`,`ra`.`assessedvalue` AS `assessedvalue`,`ra`.`taxable` AS `taxable`,`au`.`code` AS `actualuse_code`,`au`.`name` AS `actualuse_name`,`auc`.`objid` AS `actualuse_objid`,`auc`.`code` AS `actualuse_classcode`,`auc`.`name` AS `actualuse_classname`,`auc`.`orderno` AS `actualuse_orderno` from ((((`rpu` `r` join `propertyclassification` `dpc` on((`r`.`classification_objid` = `dpc`.`objid`))) join `rpu_assessment` `ra` on((`r`.`objid` = `ra`.`rpuid`))) join `landassesslevel` `au` on((`ra`.`actualuse_objid` = `au`.`objid`))) left join `propertyclassification` `auc` on((`au`.`classification_objid` = `auc`.`objid`))) union select `r`.`objid` AS `objid`,`r`.`rputype` AS `rputype`,`dpc`.`objid` AS `dominantclass_objid`,`dpc`.`code` AS `dominantclass_code`,`dpc`.`name` AS `dominantclass_name`,`dpc`.`orderno` AS `dominantclass_orderno`,`ra`.`areasqm` AS `areasqm`,`ra`.`areaha` AS `areaha`,`ra`.`marketvalue` AS `marketvalue`,`ra`.`assesslevel` AS `assesslevel`,`ra`.`assessedvalue` AS `assessedvalue`,`ra`.`taxable` AS `taxable`,`au`.`code` AS `actualuse_code`,`au`.`name` AS `actualuse_name`,`auc`.`objid` AS `actualuse_objid`,`auc`.`code` AS `actualuse_classcode`,`auc`.`name` AS `actualuse_classname`,`auc`.`orderno` AS `actualuse_orderno` from ((((`rpu` `r` join `propertyclassification` `dpc` on((`r`.`classification_objid` = `dpc`.`objid`))) join `rpu_assessment` `ra` on((`r`.`objid` = `ra`.`rpuid`))) join `bldgassesslevel` `au` on((`ra`.`actualuse_objid` = `au`.`objid`))) left join `propertyclassification` `auc` on((`au`.`classification_objid` = `auc`.`objid`))) union select `r`.`objid` AS `objid`,`r`.`rputype` AS `rputype`,`dpc`.`objid` AS `dominantclass_objid`,`dpc`.`code` AS `dominantclass_code`,`dpc`.`name` AS `dominantclass_name`,`dpc`.`orderno` AS `dominantclass_orderno`,`ra`.`areasqm` AS `areasqm`,`ra`.`areaha` AS `areaha`,`ra`.`marketvalue` AS `marketvalue`,`ra`.`assesslevel` AS `assesslevel`,`ra`.`assessedvalue` AS `assessedvalue`,`ra`.`taxable` AS `taxable`,`au`.`code` AS `actualuse_code`,`au`.`name` AS `actualuse_name`,`auc`.`objid` AS `actualuse_objid`,`auc`.`code` AS `actualuse_classcode`,`auc`.`name` AS `actualuse_classname`,`auc`.`orderno` AS `actualuse_orderno` from ((((`rpu` `r` join `propertyclassification` `dpc` on((`r`.`classification_objid` = `dpc`.`objid`))) join `rpu_assessment` `ra` on((`r`.`objid` = `ra`.`rpuid`))) join `machassesslevel` `au` on((`ra`.`actualuse_objid` = `au`.`objid`))) left join `propertyclassification` `auc` on((`au`.`classification_objid` = `auc`.`objid`))) union select `r`.`objid` AS `objid`,`r`.`rputype` AS `rputype`,`dpc`.`objid` AS `dominantclass_objid`,`dpc`.`code` AS `dominantclass_code`,`dpc`.`name` AS `dominantclass_name`,`dpc`.`orderno` AS `dominantclass_orderno`,`ra`.`areasqm` AS `areasqm`,`ra`.`areaha` AS `areaha`,`ra`.`marketvalue` AS `marketvalue`,`ra`.`assesslevel` AS `assesslevel`,`ra`.`assessedvalue` AS `assessedvalue`,`ra`.`taxable` AS `taxable`,`au`.`code` AS `actualuse_code`,`au`.`name` AS `actualuse_name`,`auc`.`objid` AS `actualuse_objid`,`auc`.`code` AS `actualuse_classcode`,`auc`.`name` AS `actualuse_classname`,`auc`.`orderno` AS `actualuse_orderno` from ((((`rpu` `r` join `propertyclassification` `dpc` on((`r`.`classification_objid` = `dpc`.`objid`))) join `rpu_assessment` `ra` on((`r`.`objid` = `ra`.`rpuid`))) join `planttreeassesslevel` `au` on((`ra`.`actualuse_objid` = `au`.`objid`))) left join `propertyclassification` `auc` on((`au`.`classification_objid` = `auc`.`objid`))) union select `r`.`objid` AS `objid`,`r`.`rputype` AS `rputype`,`dpc`.`objid` AS `dominantclass_objid`,`dpc`.`code` AS `dominantclass_code`,`dpc`.`name` AS `dominantclass_name`,`dpc`.`orderno` AS `dominantclass_orderno`,`ra`.`areasqm` AS `areasqm`,`ra`.`areaha` AS `areaha`,`ra`.`marketvalue` AS `marketvalue`,`ra`.`assesslevel` AS `assesslevel`,`ra`.`assessedvalue` AS `assessedvalue`,`ra`.`taxable` AS `taxable`,`au`.`code` AS `actualuse_code`,`au`.`name` AS `actualuse_name`,`auc`.`objid` AS `actualuse_objid`,`auc`.`code` AS `actualuse_classcode`,`auc`.`name` AS `actualuse_classname`,`auc`.`orderno` AS `actualuse_orderno` from ((((`rpu` `r` join `propertyclassification` `dpc` on((`r`.`classification_objid` = `dpc`.`objid`))) join `rpu_assessment` `ra` on((`r`.`objid` = `ra`.`rpuid`))) join `miscassesslevel` `au` on((`ra`.`actualuse_objid` = `au`.`objid`))) left join `propertyclassification` `auc` on((`au`.`classification_objid` = `auc`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_txn_log`
--

/*!50001 DROP TABLE IF EXISTS `vw_txn_log`*/;
/*!50001 DROP VIEW IF EXISTS `vw_txn_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_txn_log` AS select distinct `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`txndate` AS `txndate`,`t`.`ref` AS `ref`,`t`.`action` AS `action`,1 AS `cnt` from (`txnlog` `t` join `sys_user` `u` on((`t`.`userid` = `u`.`objid`))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'faas' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`faas_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%assign%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'subdivision' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%assign%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'consolidation' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%consolidation%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'cancelledfaas' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%cancelledfaas%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28 13:22:52
