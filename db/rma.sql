-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2014 at 02:10 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rma`
--

-- --------------------------------------------------------

--
-- Table structure for table `rma_address`
--

CREATE TABLE IF NOT EXISTS `rma_address` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(20) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address_1` varchar(50) DEFAULT NULL,
  `address_2` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma_item`
--

CREATE TABLE IF NOT EXISTS `rma_item` (
  `serial_number` bigint(20) NOT NULL DEFAULT '0',
  `part_number` varchar(20) DEFAULT NULL,
  `warranty_expiry` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rma_item_request`
--

CREATE TABLE IF NOT EXISTS `rma_item_request` (
  `request_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `process_action` varchar(20) NOT NULL,
  `process_comment` text,
  `update_action` varchar(20) DEFAULT NULL,
  `update_comment` int(11) DEFAULT NULL,
  `damaged` tinyint(1) NOT NULL,
  `receive_date` date DEFAULT NULL,
  `new_serial` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`request_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma_order`
--

CREATE TABLE IF NOT EXISTS `rma_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `bill_address_id` int(11) NOT NULL,
  `ship_address_id` int(11) NOT NULL,
  `invoice_number` varchar(20) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma_order_detail`
--

CREATE TABLE IF NOT EXISTS `rma_order_detail` (
  `order_id` int(11) NOT NULL,
  `serial_number` bigint(11) NOT NULL,
  PRIMARY KEY (`order_id`,`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rma_request`
--

CREATE TABLE IF NOT EXISTS `rma_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(30) NOT NULL,
  `bill_address_id` int(11) NOT NULL,
  `contact_email` text NOT NULL,
  `contact_phone` bigint(20) NOT NULL,
  `contact_phone_ext` int(11) DEFAULT NULL,
  `addinational_comment` text,
  `ship_address_id` int(11) NOT NULL,
  `reason_for_return` varchar(50) NOT NULL,
  `rma_number` varchar(10) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rma_request_detail`
--

CREATE TABLE IF NOT EXISTS `rma_request_detail` (
  `request_id` int(11) NOT NULL,
  `request_item_id` int(11) NOT NULL,
  PRIMARY KEY (`request_id`,`request_item_id`),
  KEY `request_item_id` (`request_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `pass` varchar(128) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `uid` int(11) NOT NULL,
  `serial_number` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rma_order_detail`
--
ALTER TABLE `rma_order_detail`
  ADD CONSTRAINT `rma_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `rma_order` (`order_id`);

--
-- Constraints for table `rma_request_detail`
--
ALTER TABLE `rma_request_detail`
  ADD CONSTRAINT `rma_request_detail_ibfk_2` FOREIGN KEY (`request_item_id`) REFERENCES `rma_item_request` (`request_item_id`),
  ADD CONSTRAINT `rma_request_detail_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `rma_request` (`request_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
