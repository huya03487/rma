-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2014 at 11:16 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db-rma`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_code` varchar(50) NOT NULL,
  `cus_account` varchar(50) NOT NULL,
  `cus_pass` varchar(32) NOT NULL,
  `cus_avarta` varchar(200) DEFAULT NULL,
  `cus_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `type_id` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `content_type` varchar(20) NOT NULL,
  `bs_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_serial` varchar(50) NOT NULL,
  `item_warranty` varchar(20) NOT NULL,
  `item_status` tinyint(4) NOT NULL,
  `item_old` int(11) DEFAULT NULL,
  `replace_date` datetime DEFAULT NULL,
  `replace_reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  KEY `fk_orderdt_order` (`order_id`),
  KEY `fk_orderdt_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_code` varchar(50) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `order_date_create` datetime NOT NULL,
  `invoice_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma-items`
--

CREATE TABLE IF NOT EXISTS `rma-items` (
  `rma_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `rma_id` int(11) NOT NULL,
  `item_serial` varchar(50) NOT NULL,
  `receive_date` datetime NOT NULL,
  `damaged` tinyint(4) DEFAULT NULL,
  `issue_comment` varchar(500) DEFAULT NULL,
  `new_serial` varchar(50) DEFAULT NULL,
  `shipdate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `action` int(11) NOT NULL,
  PRIMARY KEY (`rma_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma-request`
--

CREATE TABLE IF NOT EXISTS `rma-request` (
  `rma_id` int(11) NOT NULL AUTO_INCREMENT,
  `rma_number` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rma_datecreate` datetime NOT NULL,
  `rma_reason` int(11) NOT NULL,
  `rma_issue` varchar(500) NOT NULL,
  `rma_comment` text,
  `rma_note` text,
  `rma_status` int(11) NOT NULL,
  `rma_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`rma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(50) NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `user_pass` varchar(32) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_avarta` varchar(200) DEFAULT NULL,
  `user_role` varchar(50) NOT NULL,
  `user_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fk_orderdt_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `fk_orderdt_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
