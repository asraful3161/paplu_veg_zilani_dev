-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 13, 2015 at 07:16 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cl54-paplu`
--

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

DROP TABLE IF EXISTS `billers`;
CREATE TABLE IF NOT EXISTS `billers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) NOT NULL,
  `postal_code` varchar(8) NOT NULL,
  `country` varchar(55) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `invoice_footer` varchar(1000) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `company`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `logo`, `invoice_footer`, `mobile`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`) VALUES
(1, 'Mian Saleem', 'Tecdiary IT Solutions', 'Address', 'City', 'Sate', '0000', 'Malaysia', '012345678', 'saleem@tecdairy.com', 'logo.png', '', '01722702590', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `date` date NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--


-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`) VALUES
(1, 'C1', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment`) VALUES
('&lt;h4&gt;Thank you for Purchasing Stock Manager Advance 2.3 with POS Module &lt;/h4&gt;\r\n&lt;p&gt;\r\n              This is latest the latest release of Stock Manager Advance.\r\n&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) NOT NULL,
  `postal_code` varchar(8) NOT NULL,
  `country` varchar(55) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `creator_id`, `name`, `company`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `mobile`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`) VALUES
(1, 0, 'bangla town', 'LAL BHAG LTD', '27 bow triangle business center', 'London', 'England', 'e3 4ur', 'United Kingdom', '02089804004', '01722702590', 'papluveg@yahoo.co.uk', '', '', '', '', '', ''),
(2, 0, 'saleah', 'Service On', 'Mirpur', 'Dhaka', 'England', '1207', '', '01722702590', '01722702590', 'abu_salea5h@yahoo.com', '0', '0', '0', '0', '0', '0'),
(3, 0, 'sayem1', 'Service On1', 'Mirpur1', 'Dhaka1', 'England', '12071', '0', '0172270259011', '01722702590', 'abu1121@yahoo.com', '0', '0', '0', '0', '0', '0'),
(4, 0, 'monir', 'Service On', 'Mirpur', 'Dhaka', 'Dhaka', '1207', 'United Kingdom', '01722702590', '01722702590', 'abu_sah@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 'faysal1', 'Service On', 'Mirpur', 'Dhaka', 'Dhaka', '1207', 'United Kingdom', '01722702590', '01722702590', 'abu_saleah@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 'Protik9', 'Service On9', 'Mirpur9', 'Dhaka9', 'Dhaka', '12079', 'United Kingdom', '017227025909', '017227025909', 'protik9@yahoo.com', '0', '0', '0', '0', '0', '0'),
(7, 0, 'abu dfsgdsg', 'Service On', 'fdgfds', 'fdgdsgds', 'Dhaka', 'gdsgdsg', 'United Kingdom', '01722702590', '01722702590', '', '', '', '', '', '', ''),
(8, 0, 'ads saleah', 'Service On', 'safsaf', 'afads', 'Dhaka', 'asfsaf', 'United Kingdom', '01722702590', '01722702590', '', '', '', '', '', '', ''),
(9, 0, 'ads saleah12', 'Service On', 'safsaf', 'afads', 'England', 'asfsaf', 'United Kingdom', '02000002313', '02000002313', 'ab2d@gmail.com', '', '', '', '', '', ''),
(10, 0, 'protik', 'Service On', 'safsaf', 'afads', 'England', 'asfsaf', 'United Kingdom', '02000002313', '02000002313', 'abudd@gmail.com', '', '', '', '', '', ''),
(11, 0, 'Sayem2015', 'sayem', 'fghgf', 'fghfgh', 'fghfh', '34', 'hhh', '4645646642', '', 'hemem@taa.com', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'ads saleah', 'Service On', 'safsaf', 'afads', 'England', 'asfsaf', 'UK', '02000002313', '02000002313', 'abudd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_balance`
--

DROP TABLE IF EXISTS `customer_balance`;
CREATE TABLE IF NOT EXISTS `customer_balance` (
  `customer_balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_balance` decimal(10,2) NOT NULL,
  `total_balance_amount` decimal(10,2) NOT NULL,
  `date` varchar(200) NOT NULL,
  PRIMARY KEY (`customer_balance_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `customer_balance`
--

INSERT INTO `customer_balance` (`customer_balance_id`, `customer_id`, `customer_balance`, `total_balance_amount`, `date`) VALUES
(1, 1, '0.00', '665533.00', '01/04/2015'),
(2, 2, '0.00', '320.00', '02/04/2015'),
(3, 3, '0.00', '320.00', '02/04/2015'),
(4, 4, '0.00', '3048.00', '02/04/2015'),
(5, 5, '0.00', '3048.00', '02/04/2015'),
(6, 6, '0.00', '0.00', '02/04/2015'),
(7, 7, '0.00', '0.00', '07/04/2015'),
(8, 8, '0.00', '0.00', '07/04/2015'),
(9, 9, '0.00', '1364.00', '07/04/2015'),
(10, 10, '0.00', '0.00', '07/04/2015'),
(11, 11, '0.00', '4985.00', '07/04/2015'),
(12, 12, '1220002.00', '0.00', '07/04/2015');

-- --------------------------------------------------------

--
-- Table structure for table `customer_discount`
--

DROP TABLE IF EXISTS `customer_discount`;
CREATE TABLE IF NOT EXISTS `customer_discount` (
  `customer_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_type` varchar(200) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customer_discount_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customer_discount`
--

INSERT INTO `customer_discount` (`customer_discount_id`, `customer_id`, `product_id`, `discount_type`, `discount_amount`) VALUES
(12, 1, 11, '2', '500.00'),
(11, 2, 14, '2', '500.00'),
(8, 2, 11, '2', '500.00'),
(13, 2, 12, '2', '20.00'),
(14, 5, 11, '2', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `damage_products`
--

DROP TABLE IF EXISTS `damage_products`;
CREATE TABLE IF NOT EXISTS `damage_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `damage_products`
--


-- --------------------------------------------------------

--
-- Table structure for table `date_format`
--

DROP TABLE IF EXISTS `date_format`;
CREATE TABLE IF NOT EXISTS `date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `date_format`
--

INSERT INTO `date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE IF NOT EXISTS `deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` varchar(10) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `deliveries`
--


-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `discount`, `type`) VALUES
(1, 'No Discount', '0.00', '2'),
(2, '2.5 Percent', '2.50', '1'),
(3, '5 Percent', '5.00', '1'),
(4, '10 Percent', '10.00', '1'),
(5, 'Fixed', '200.00', '2');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'purchaser', 'Purchasing Staff'),
(4, 'salesman', 'Sales Staff'),
(5, 'viewer', 'View Only User');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_types`
--

DROP TABLE IF EXISTS `invoice_types`;
CREATE TABLE IF NOT EXISTS `invoice_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `invoice_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `login_attempts`
--


-- --------------------------------------------------------

--
-- Table structure for table `pos_settings`
--

DROP TABLE IF EXISTS `pos_settings`;
CREATE TABLE IF NOT EXISTS `pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`) VALUES
(1, 22, 30, 1, 1, 1, 'yes', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `weight` varchar(50) NOT NULL,
  `size` varchar(55) NOT NULL,
  `cost` decimal(25,2) DEFAULT NULL,
  `price` decimal(25,2) NOT NULL,
  `alert_quantity` int(11) NOT NULL DEFAULT '20',
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `available_quantity` int(11) NOT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(4) DEFAULT '1',
  `creator_id` int(11) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `unit`, `weight`, `size`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `available_quantity`, `tax_rate`, `track_quantity`, `creator_id`, `details`) VALUES
(11, '11', 'Fish', '0', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, '', '', '', '', '', '', 62, 62, 1, 1, 0, ''),
(12, '22', 'Meat', '0', '10', '10', '1000.00', '1100.00', 10, 'no_image.jpg', 1, 0, '', '', '', '', '', '', -41, -41, 2, 1, 0, ''),
(13, '33', 'Sweet', '0', '5', '', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, '', '', '', '', '', '', -47, -47, 2, 1, 0, ''),
(14, '66', 'Vege', '0', '', '', '100.00', '120.00', 3, 'login_logo.png', 1, 0, '', '', '', '', '', '', -38, -38, 1, 1, 0, ''),
(15, '55', 'Fruit', '0', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, '', '', '', '', '', '', -39, -39, 1, 1, 1, ''),
(16, '36', 'Poteto', '0', '10', '10', '100.00', '120.00', 5, 'no_image.jpg', 1, 0, '', '', '', '', '', '', -40, -40, 1, 1, 1, ''),
(17, '56', 'Tomato', '0', '10', '10', '100.00', '105.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 8, 8, 1, 1, 2, ''),
(18, '43', 'Oil', '0', '15', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, '', '', '', '', '', '', -36, -36, 1, 1, 2, ''),
(19, '96', 'Vegetable', '0', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', -36, -36, 2, 1, 1, ''),
(20, 'J00190', 'Jack Fruit', '0', '4', '10', '80.00', '100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', -50, -50, 1, 1, 0, '<p>\n       This is variable type product\n</p>'),
(21, '2001', 'Lichi', '0', '2', '', '0.50', '1.50', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', -42, -42, 1, 1, 0, ''),
(22, '258', 'Test1', '55', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', -41, 14, 1, 1, 0, ''),
(23, 'T-13', 'Test-13', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 19, 69, 1, 1, 0, ''),
(24, 'T-14', 'Test-14', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 19, 69, 1, 1, 0, ''),
(25, 'T-15', 'Test-15', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 19, 69, 1, 1, 0, ''),
(26, 'T-16', 'Test-16', '50', '10', '10', '1000.00', '105.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 19, 69, 1, 1, 0, ''),
(27, 'T-17', 'Test-17', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 19, 69, 1, 1, 0, ''),
(28, 'T-18', 'Test-18', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 20, 70, 1, 1, 0, ''),
(29, 'T-19', 'Test-19', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 24, 74, 1, 1, 0, ''),
(30, 'T-20', 'Test-20', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 24, 74, 1, 1, 0, ''),
(31, 'T-21', 'test-21', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 33, 83, 1, 1, 0, ''),
(32, 'T-22', 'Test-22', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 35, 85, 1, 1, 0, ''),
(33, 'T-23', 'test-23', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 35, 85, 1, 1, 0, ''),
(34, 'T-24', 'Test-24', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 35, 85, 1, 1, 0, ''),
(35, 'T-25', 'Test-25', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 41, 91, 1, 1, 0, ''),
(36, 'Test-26', 'Test-26', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 46, 96, 1, 1, 0, ''),
(37, 'T-27', 'Test-27', '5', '5', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', -2, 3, 1, 1, 0, ''),
(38, 'T-28', 'Test-28', '90', '5', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 84, 174, 1, 1, 0, ''),
(39, 'T-29', 'Test-29', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 44, 94, 1, 1, 0, ''),
(40, 'T-30', 'Test-30', '50', '10', '10', '1000.00', '100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 45, 95, 1, 1, 0, ''),
(41, 'T-31', 'Test-31', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Fixed', '', '', '', '', '', 45, 95, 1, 1, 0, ''),
(42, 'T-32', 'T-32', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 48, 98, 1, 1, 0, ''),
(43, 'T-33', 'T-33', '50', '10', '10', '1000.00', '1100.00', 5, 'no_image.jpg', 1, 0, 'Variable', '', '', '', '', '', 49, 99, 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(55) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT '0.00',
  `inv_total` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `warehouse_id`, `supplier_id`, `supplier_name`, `date`, `note`, `total`, `user`, `updated_by`, `total_tax`, `inv_total`) VALUES
(1, 'PO-0001', 1, 2, 'selaz', '2015-03-30', '', '4000.00', 'Owner Owner', NULL, '0.00', '4000.00'),
(2, 'PO-0002', 1, 2, 'selaz', '2015-03-31', '', '37.50', 'Owner Owner', NULL, '0.00', '37.50'),
(3, 'PO-0003', 1, 2, 'selaz', '2015-03-31', '', '27.50', 'Owner Owner', NULL, '0.00', '27.50'),
(4, 'PO-0004', 1, 2, 'selaz', '2015-03-31', '', '85000.00', 'Owner Owner', 'Owner Owner', '0.00', '85000.00'),
(5, 'PO-0005', 1, 2, 'selaz', '2015-03-31', '', '55000.00', 'Owner Owner', NULL, '0.00', '55000.00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE IF NOT EXISTS `purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `tax_amount` decimal(25,2) DEFAULT NULL,
  `gross_total` decimal(25,2) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `val_tax` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `product_code`, `product_name`, `quantity`, `unit_price`, `tax_amount`, `gross_total`, `tax_rate_id`, `tax`, `val_tax`) VALUES
(1, 1, 20, 'J00190', 'Jack Fruit', 50, '80.00', NULL, '4000.00', 1, '0.00', '0.00'),
(2, 2, 21, '2001', 'Lichi', 75, '0.50', NULL, '37.50', 1, '0.00', '0.00'),
(3, 3, 21, '2001', 'Lichi', 55, '0.50', NULL, '27.50', 1, '0.00', '0.00'),
(8, 4, 17, '56', 'Tomato', 50, '100.00', NULL, '5000.00', 1, '0.00', '0.00'),
(9, 4, 11, '11', 'Fish', 80, '1000.00', NULL, '80000.00', 1, '0.00', '0.00'),
(10, 5, 11, '11', 'Fish', 55, '1000.00', NULL, '55000.00', 1, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller_name` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `inv_total` decimal(25,2) NOT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `total` decimal(25,2) NOT NULL,
  `invoice_type` int(11) DEFAULT NULL,
  `in_type` varchar(55) DEFAULT NULL,
  `total_tax2` decimal(25,2) DEFAULT NULL,
  `tax_rate2_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `inv_discount` decimal(25,2) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `shipping` decimal(25,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `quotes`
--


-- --------------------------------------------------------

--
-- Table structure for table `quote_items`
--

DROP TABLE IF EXISTS `quote_items`;
CREATE TABLE IF NOT EXISTS `quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_unit` varchar(50) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `gross_total` decimal(25,2) NOT NULL,
  `val_tax` decimal(25,2) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `discount_val` decimal(25,2) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `quote_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller_name` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `customer_balance` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `inv_total` decimal(25,2) NOT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `total` decimal(25,2) NOT NULL,
  `invoice_type` int(11) DEFAULT NULL,
  `in_type` varchar(55) DEFAULT NULL,
  `total_tax2` decimal(25,2) DEFAULT NULL,
  `tax_rate2_id` int(11) DEFAULT NULL,
  `inv_discount` decimal(25,2) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `paid_by` varchar(55) DEFAULT 'cash',
  `count` int(11) DEFAULT NULL,
  `shipping` decimal(25,2) DEFAULT '0.00',
  `pos` tinyint(4) NOT NULL DEFAULT '0',
  `paid` decimal(25,2) DEFAULT NULL,
  `order_note` text NOT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `transaction_history_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `warehouse_id`, `creator_id`, `biller_id`, `biller_name`, `customer_id`, `customer_name`, `customer_balance`, `date`, `note`, `internal_note`, `inv_total`, `total_tax`, `total`, `invoice_type`, `in_type`, `total_tax2`, `tax_rate2_id`, `inv_discount`, `discount_id`, `user`, `updated_by`, `paid_by`, `count`, `shipping`, `pos`, `paid`, `order_note`, `cc_no`, `cc_holder`, `cheque_no`, `transaction_history_id`) VALUES
(1, 'SL-0001', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-01', '', '', '600.00', '0.00', '600.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'Invoice', 5, '0.00', 1, '0.00', '', '', '', '', 0),
(2, 'SL-0002', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-02', NULL, NULL, '4125.00', '264.00', '4389.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 6, '0.00', 1, '0.00', '', '', '', '', 0),
(3, 'SL-0003', 1, 0, 1, 'Mian Saleem', 2, 'saleah', '0.00', '2015-04-02', '', '', '482.50', '0.00', '482.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 0),
(4, 'SL-0004', 1, 0, 1, 'Mian Saleem', 3, 'sayem', '0.00', '2015-04-02', '', '', '482.50', '0.00', '482.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 0),
(5, 'SL-0005', 1, 0, 1, 'Mian Saleem', 4, 'monir', '0.00', '2015-04-02', '', '', '495.00', '0.00', '495.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 0),
(6, 'SL-0006', 1, 0, 1, 'Mian Saleem', 5, 'faysal1', '0.00', '2015-04-02', '', '', '482.50', '0.00', '482.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 0),
(7, 'SL-0007', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', NULL, NULL, '7646.50', '792.00', '8438.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 12, '0.00', 1, '0.00', '', '', '', '', 0),
(8, 'SL-0008', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', '', '', '7746.50', '792.00', '8538.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 12, '0.00', 1, '0.00', '', '', '', '', 0),
(9, 'SL-0009', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', NULL, NULL, '7646.50', '792.00', '8438.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 12, '0.00', 1, '0.00', '', '', '', '', 0),
(10, 'SL-0010', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', NULL, NULL, '7646.50', '792.00', '8438.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 12, '0.00', 1, '0.00', '', '', '', '', 0),
(11, 'SL-0011', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 0),
(12, 'SL-0012', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-05', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 0),
(13, 'SL-0013', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-06', '', '', '2411.50', '264.00', '2675.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 4, '0.00', 1, '0.00', '', '', '', '', 0),
(15, 'SL-0015', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-06', NULL, NULL, '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(16, 'SL-0016', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '600.00', '0.00', '600.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(17, 'SL-0017', 1, 0, 1, 'Mian Saleem', 5, 'faysal1', '0.00', '2015-04-07', '', '', '2200.00', '528.00', '2728.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(18, 'SL-0018', 1, 0, 1, 'Mian Saleem', 9, 'ads saleah12', '0.00', '2015-04-07', '', '', '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(19, 'SL-0019', 1, 0, 1, 'Mian Saleem', 4, 'monir', '0.00', '2015-04-07', '', '', '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(20, 'SL-0020', 1, 0, 1, 'Mian Saleem', 4, 'monir', '0.00', '2015-04-07', '', '', '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(21, 'SL-0021', 1, 0, 1, 'Mian Saleem', 11, 'Sayem2015', '0.00', '2015-04-07', '', '&lt;p&gt;\r\n       updated\r\n&lt;/p&gt;', '4675.00', '0.00', '4675.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', 'Owner Owner', 'cash', 4, '0.00', 1, '0.00', '', '', '', '', 0),
(22, 'SL-0022', 1, 0, 1, 'Mian Saleem', 11, 'Sayem2015', '0.00', '2015-04-07', NULL, NULL, '310.00', '0.00', '310.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 0),
(23, 'SL-0023', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '600.00', '0.00', '600.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(24, 'SL-0024', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '600.00', '0.00', '600.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(25, 'SL-0025', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(26, 'SL-0026', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(27, 'SL-0027', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '105.00', '0.00', '105.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 0),
(28, 'SL-0028', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '105.00', '0.00', '105.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 39),
(29, 'SL-0029', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '1100.00', '0.00', '1100.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 40),
(30, 'SL-0030', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '3300.00', '528.00', '3828.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 3, '0.00', 1, '0.00', '', '', '', '', 41),
(31, 'SL-0031', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-07', NULL, NULL, '1.50', '0.00', '1.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 42),
(32, 'SL-0032', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 44),
(33, 'SL-0033', 1, 0, 1, 'Mian Saleem', 3, 'sayem1', '0.00', '2015-04-09', '&lt;p&gt;\r\n judjgj\r\n&lt;/p&gt;', '', '3300.00', '528.00', '3828.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(34, 'SL-0034', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '4021.50', '528.00', '4549.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 6, '0.00', 1, '0.00', '', '', '', '', 45),
(35, 'SL-0035', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 46),
(36, 'SL-0036', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '600.00', '0.00', '600.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 47),
(37, 'SL-0037', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 48),
(38, 'SL-0038', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 49),
(39, 'SL-0039', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1.50', '0.00', '1.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 50),
(40, 'SL-0040', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 51),
(41, 'SL-0041', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1100.00', '0.00', '1100.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 52),
(42, 'SL-0042', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 53),
(43, 'SL-0043', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 54),
(44, 'SL-0044', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1.50', '0.00', '1.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 55),
(45, 'SL-0045', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1100.00', '0.00', '1100.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 56),
(46, 'SL-0046', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '1100.00', '264.00', '1364.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 1, '0.00', 1, '0.00', '', '', '', '', 57),
(47, 'SL-0047', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 58),
(48, 'SL-0048', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 59),
(49, 'SL-0049', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-09', NULL, NULL, '14351.50', '792.00', '15143.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 19, '0.00', 1, '0.00', '', '', '', '', 60),
(50, 'SL-0050', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '20851.50', '792.00', '21643.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 24, '0.00', 1, '0.00', '', '', '', '', 61),
(51, 'SL-0051', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '20951.50', '792.00', '21743.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 25, '0.00', 1, '0.00', '', '', '', '', 62),
(52, 'SL-0052', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '16551.50', '792.00', '17343.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 21, '0.00', 1, '0.00', '', '', '', '', 63),
(53, 'SL-0053', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '17651.50', '792.00', '18443.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 22, '0.00', 1, '0.00', '', '', '', '', 64),
(54, 'SL-0054', 1, 0, 1, 'Mian Saleem', 3, 'sayem1', '0.00', '2015-04-12', '', '', '2200.00', '0.00', '2200.00', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', NULL, '0.00', 0, NULL, '', NULL, NULL, NULL, 0),
(55, 'SL-0055', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '23151.50', '792.00', '23943.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 27, '0.00', 1, '0.00', '', '', '', '', 65),
(56, 'SL-0056', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '28751.50', '792.00', '29543.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 33, '0.00', 1, '0.00', '', '', '', '', 66),
(57, 'SL-0057', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '24351.50', '792.00', '25143.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 29, '0.00', 1, '0.00', '', '', '', '', 67),
(58, 'SL-0058', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '16551.50', '792.00', '17343.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 21, '0.00', 1, '0.00', '', '', '', '', 68),
(59, 'SL-0059', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '17651.50', '792.00', '18443.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 22, '0.00', 1, '0.00', '', '', '', '', 69),
(60, 'SL-0060', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '24251.50', '792.00', '25043.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 28, '0.00', 1, '0.00', '', '', '', '', 70),
(61, 'SL-0061', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '18751.50', '792.00', '19543.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 23, '0.00', 1, '0.00', '', '', '', '', 71),
(62, 'SL-0062', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '25451.50', '792.00', '26243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 30, '0.00', 1, '0.00', '', '', '', '', 72),
(63, 'SL-0063', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '26551.50', '792.00', '27343.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 31, '0.00', 1, '0.00', '', '', '', '', 73),
(64, 'SL-0064', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 74),
(65, 'SL-0065', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '19851.50', '792.00', '20643.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 24, '0.00', 1, '0.00', '', '', '', '', 75),
(66, 'SL-0066', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '16551.50', '792.00', '17343.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 21, '0.00', 1, '0.00', '', '', '', '', 76),
(67, 'SL-0067', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '25451.50', '792.00', '26243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 30, '0.00', 1, '0.00', '', '', '', '', 77),
(68, 'SL-0068', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '17651.50', '792.00', '18443.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 22, '0.00', 1, '0.00', '', '', '', '', 78),
(69, 'SL-0069', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '15451.50', '792.00', '16243.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 20, '0.00', 1, '0.00', '', '', '', '', 79),
(70, 'SL-0070', 1, 0, 1, 'Mian Saleem', 1, 'bangla town', '0.00', '2015-04-12', NULL, NULL, '16551.50', '792.00', '17343.50', NULL, NULL, '0.00', 1, '0.00', 0, 'Owner Owner', NULL, 'cash', 21, '0.00', 1, '0.00', '', '', '', '', 80);

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `variprod_note` text,
  `product_unit` varchar(50) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `gross_total` decimal(25,2) NOT NULL,
  `val_tax` decimal(25,2) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `discount_val` decimal(25,2) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `sale_product_weight` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=923 ;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `variprod_note`, `product_unit`, `tax_rate_id`, `tax`, `quantity`, `unit_price`, `gross_total`, `val_tax`, `serial_no`, `discount_val`, `discount`, `discount_id`, `sale_product_weight`) VALUES
(2, 2, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(3, 2, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(4, 2, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(5, 2, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(6, 2, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(7, 2, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(8, 1, 20, 'J00190', 'Jack Fruit', '9+8.5+6.5', '0', 1, '0.00', 5, '100.00', '600.00', '0.00', '', '0.00', '0.00', 1, '24'),
(11, 3, 20, 'J00190', 'Jack Fruit', '6.5+8', '0', 1, '0.00', 2, '100.00', '362.50', '0.00', '', '0.00', '0.00', 1, '14.5'),
(12, 3, 16, '36', 'Poteto', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(19, 4, 20, 'J00190', 'Jack Fruit', '6.5+8', '0', 1, '0.00', 2, '100.00', '362.50', '0.00', '', '0.00', '0.00', 1, '14.5'),
(20, 4, 16, '36', 'Poteto', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(49, 5, 20, 'J00190', 'Jack Fruit', '7+8', '0', 1, '0.00', 2, '100.00', '375.00', '0.00', '', '0.00', '0.00', 1, '15'),
(50, 5, 16, '36', 'Poteto', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(53, 6, 20, 'J00190', 'Jack Fruit', '6.5+8', '0', 1, '0.00', 2, '100.00', '362.50', '0.00', '', '0.00', '0.00', 1, '14.5'),
(54, 6, 16, '36', 'Poteto', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(55, 7, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(56, 7, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(57, 7, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(58, 7, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(59, 7, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(60, 7, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(61, 7, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(62, 7, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(63, 7, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(64, 7, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(65, 7, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(66, 7, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(79, 8, 11, '11', 'Fish', '', '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(80, 8, 21, '2001', 'Lichi', '', '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(81, 8, 12, '22', 'Meat', '', '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(82, 8, 22, '258', 'Test1', '', '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(83, 8, 13, '33', 'Sweet', '', '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(84, 8, 16, '36', 'Poteto', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(85, 8, 20, 'J00190', 'Jack Fruit', '4+4', '0', 1, '0.00', 1, '100.00', '200.00', '0.00', '', '0.00', '0.00', 1, '8'),
(86, 8, 19, '96', 'Vegetable', '', '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(87, 8, 14, '66', 'Vege', '', '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(88, 8, 17, '56', 'Tomato', '', '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(89, 8, 15, '55', 'Fruit', '', '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(90, 8, 18, '43', 'Oil', '', '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(91, 9, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(92, 9, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(93, 9, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(94, 9, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(95, 9, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(96, 9, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(97, 9, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(98, 9, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(99, 9, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(100, 9, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(101, 9, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(102, 9, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(103, 10, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(104, 10, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(105, 10, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(106, 10, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(107, 10, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(108, 10, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(109, 10, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(110, 10, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(111, 10, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(112, 10, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(113, 10, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(114, 10, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(115, 11, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(116, 11, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(117, 11, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(118, 11, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(119, 11, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(120, 11, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(121, 11, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(122, 11, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(123, 11, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(124, 11, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(125, 11, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(126, 11, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(127, 11, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(128, 11, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(129, 11, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(130, 11, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(131, 11, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(132, 11, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(133, 11, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(134, 11, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(135, 12, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(136, 12, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(137, 12, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(138, 12, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(139, 12, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(140, 12, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(141, 12, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(142, 12, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(143, 12, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(144, 12, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(145, 12, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(146, 12, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(147, 12, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(148, 12, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(149, 12, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(150, 12, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(151, 12, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(152, 12, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(153, 12, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(154, 12, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(169, 15, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(170, 16, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(203, 13, 12, '22', 'Meat', '', '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(204, 13, 21, '2001', 'Lichi', '', '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(205, 13, 22, '258', 'Test1', '', '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(206, 13, 17, '56', 'Tomato', '5+5+5+5', '0', 1, '0.00', 1, '105.00', '210.00', '0.00', '', '0.00', '0.00', 1, '20'),
(207, 17, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 2, '1100.00', '2200.00', '528.00', '', '0.00', '0.00', 1, '0'),
(208, 18, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '0'),
(209, 19, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '0'),
(210, 20, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '0'),
(217, 22, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 2, '105.00', '210.00', '0.00', '', '0.00', '0.00', 1, '20'),
(218, 22, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(221, 23, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(222, 24, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(223, 26, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(224, 27, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(225, 28, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(226, 29, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(227, 30, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(228, 30, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(229, 30, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(230, 31, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(231, 32, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(232, 32, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(233, 32, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(234, 32, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(235, 32, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(236, 32, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(237, 32, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(238, 32, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(239, 32, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(240, 32, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(241, 32, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(242, 32, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(243, 32, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(244, 32, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(245, 32, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(246, 32, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(247, 32, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(248, 32, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(249, 32, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(250, 32, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(251, 33, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 2, '1100.00', '2200.00', '528.00', '', '0.00', '0.00', 1, '0'),
(252, 33, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '0'),
(253, 34, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(254, 34, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(255, 34, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(256, 34, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(257, 34, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(258, 34, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(259, 35, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(260, 35, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(261, 35, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(262, 35, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(263, 35, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(264, 35, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(265, 35, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(266, 35, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(267, 35, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(268, 35, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(269, 35, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(270, 35, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(271, 35, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(272, 35, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(273, 35, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(274, 35, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(275, 35, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(276, 35, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(277, 35, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(278, 35, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(279, 36, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(280, 37, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(281, 37, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(282, 37, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(283, 37, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(284, 37, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(285, 37, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(286, 37, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(287, 37, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(288, 37, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(289, 37, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(290, 37, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(291, 37, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(292, 37, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(293, 37, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(294, 37, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(295, 37, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(296, 37, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(297, 37, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(298, 37, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(299, 37, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(300, 38, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(301, 38, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(302, 38, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(303, 38, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(304, 38, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(305, 38, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(306, 38, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(307, 38, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(308, 38, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(309, 38, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(310, 38, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(311, 38, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(312, 38, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(313, 38, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(314, 38, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(315, 38, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(316, 38, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(317, 38, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(318, 38, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(319, 38, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(320, 39, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(321, 40, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(322, 40, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(323, 40, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(324, 40, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(325, 40, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(326, 40, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(327, 40, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(328, 40, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(329, 40, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(330, 40, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(331, 40, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(332, 40, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(333, 40, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(334, 40, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(335, 40, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(336, 40, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(337, 40, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(338, 40, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(339, 40, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(340, 40, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(341, 21, 15, '55', 'Fruit', '', '0', 1, '0.00', 3, '1100.00', '3300.00', '0.00', '', '0.00', '0.00', 1, '30'),
(342, 21, 20, 'J00190', 'Jack Fruit', '5+6', '0', 1, '0.00', 2, '100.00', '275.00', '0.00', '', '0.00', '0.00', 1, '11'),
(343, 21, 13, '33', 'Sweet', '0', '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(344, 41, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(345, 42, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(346, 42, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(347, 42, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(348, 42, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(349, 42, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(350, 42, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(351, 42, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(352, 42, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(353, 42, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(354, 42, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(355, 42, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(356, 42, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(357, 42, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(358, 42, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(359, 42, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(360, 42, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(361, 42, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(362, 42, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(363, 42, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(364, 42, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(365, 43, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(366, 44, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(367, 45, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(368, 46, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(369, 47, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(370, 47, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(371, 47, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(372, 47, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(373, 47, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(374, 47, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(375, 47, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(376, 47, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(377, 47, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(378, 47, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(379, 47, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(380, 47, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(381, 47, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(382, 47, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(383, 47, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(384, 47, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(385, 47, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(386, 47, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(387, 47, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(388, 47, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(389, 48, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(390, 48, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(391, 48, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(392, 48, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(393, 48, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(394, 48, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(395, 48, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(396, 48, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(397, 48, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(398, 48, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(399, 48, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(400, 48, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(401, 48, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(402, 48, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(403, 48, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(404, 48, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(405, 48, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(406, 48, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(407, 48, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(408, 48, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(409, 49, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(410, 49, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(411, 49, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(412, 49, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(413, 49, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(414, 49, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(415, 49, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(416, 49, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(417, 49, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(418, 49, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(419, 49, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(420, 49, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(421, 49, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(422, 49, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(423, 49, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(424, 49, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(425, 49, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(426, 49, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(427, 49, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(428, 50, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(429, 50, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(430, 50, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(431, 50, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(432, 50, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(433, 50, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(434, 50, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(435, 50, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(436, 50, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(437, 50, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(438, 50, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(439, 50, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(440, 50, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(441, 50, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(442, 50, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(443, 50, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(444, 50, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(445, 50, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(446, 50, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(447, 50, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(448, 50, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(449, 50, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(450, 50, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(451, 50, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(452, 51, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(453, 51, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(454, 51, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(455, 51, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(456, 51, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(457, 51, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(458, 51, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(459, 51, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(460, 51, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(461, 51, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(462, 51, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(463, 51, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(464, 51, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(465, 51, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(466, 51, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(467, 51, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(468, 51, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(469, 51, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(470, 51, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(471, 51, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(472, 51, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(473, 51, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(474, 51, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(475, 51, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(476, 51, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(477, 52, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(478, 52, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(479, 52, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(480, 52, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(481, 52, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(482, 52, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(483, 52, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(484, 52, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(485, 52, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(486, 52, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(487, 52, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(488, 52, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(489, 52, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(490, 52, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(491, 52, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(492, 52, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(493, 52, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(494, 52, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(495, 52, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(496, 52, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(497, 52, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(498, 53, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(499, 53, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(500, 53, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(501, 53, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(502, 53, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(503, 53, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(504, 53, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(505, 53, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(506, 53, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(507, 53, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(508, 53, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(509, 53, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(510, 53, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(511, 53, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(512, 53, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(513, 53, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(514, 53, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(515, 53, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(516, 53, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(517, 53, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(518, 53, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(519, 53, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(520, 54, 36, 'Test-26', 'Test-26', NULL, '50', 1, '0.00', 2, '1100.00', '2200.00', '0.00', '', '0.00', '0.00', 1, '0'),
(521, 55, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(522, 55, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(523, 55, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(524, 55, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(525, 55, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(526, 55, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(527, 55, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(528, 55, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(529, 55, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(530, 55, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(531, 55, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(532, 55, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(533, 55, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(534, 55, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(535, 55, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(536, 55, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(537, 55, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(538, 55, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(539, 55, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(540, 55, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(541, 55, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(542, 55, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10');
INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `variprod_note`, `product_unit`, `tax_rate_id`, `tax`, `quantity`, `unit_price`, `gross_total`, `val_tax`, `serial_no`, `discount_val`, `discount`, `discount_id`, `sale_product_weight`) VALUES
(543, 55, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(544, 55, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(545, 55, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(546, 55, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(547, 55, 36, 'Test-26', 'Test-26', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(548, 56, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(549, 56, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(550, 56, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(551, 56, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(552, 56, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(553, 56, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(554, 56, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(555, 56, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(556, 56, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(557, 56, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(558, 56, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(559, 56, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(560, 56, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(561, 56, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(562, 56, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(563, 56, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(564, 56, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(565, 56, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(566, 56, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(567, 56, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(568, 56, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(569, 56, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(570, 56, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(571, 56, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(572, 56, 41, 'T-31', 'Test-31', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(573, 56, 40, 'T-30', 'Test-30', NULL, '50', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(574, 56, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(575, 56, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(576, 56, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(577, 56, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(578, 56, 42, 'T-32', 'T-32', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(579, 56, 43, 'T-33', 'T-33', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(580, 56, 36, 'Test-26', 'Test-26', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(581, 57, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(582, 57, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(583, 57, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(584, 57, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(585, 57, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(586, 57, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(587, 57, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(588, 57, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(589, 57, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(590, 57, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(591, 57, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(592, 57, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(593, 57, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(594, 57, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(595, 57, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(596, 57, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(597, 57, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(598, 57, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(599, 57, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(600, 57, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(601, 57, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(602, 57, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(603, 57, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(604, 57, 41, 'T-31', 'Test-31', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(605, 57, 40, 'T-30', 'Test-30', NULL, '50', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(606, 57, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(607, 57, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(608, 57, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(609, 57, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(610, 58, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(611, 58, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(612, 58, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(613, 58, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(614, 58, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(615, 58, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(616, 58, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(617, 58, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(618, 58, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(619, 58, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(620, 58, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(621, 58, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(622, 58, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(623, 58, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(624, 58, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(625, 58, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(626, 58, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(627, 58, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(628, 58, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(629, 58, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(630, 58, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(631, 59, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(632, 59, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(633, 59, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(634, 59, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(635, 59, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(636, 59, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(637, 59, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(638, 59, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(639, 59, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(640, 59, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(641, 59, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(642, 59, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(643, 59, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(644, 59, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(645, 59, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(646, 59, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(647, 59, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(648, 59, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(649, 59, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(650, 59, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(651, 59, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(652, 59, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(653, 60, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(654, 60, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(655, 60, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(656, 60, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(657, 60, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(658, 60, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(659, 60, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(660, 60, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(661, 60, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(662, 60, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(663, 60, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(664, 60, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(665, 60, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(666, 60, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(667, 60, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(668, 60, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(669, 60, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(670, 60, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(671, 60, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(672, 60, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(673, 60, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(674, 60, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(675, 60, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(676, 60, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(677, 60, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(678, 60, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(679, 60, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(680, 60, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(681, 61, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(682, 61, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(683, 61, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(684, 61, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(685, 61, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(686, 61, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(687, 61, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(688, 61, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(689, 61, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(690, 61, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(691, 61, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(692, 61, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(693, 61, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(694, 61, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(695, 61, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(696, 61, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(697, 61, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(698, 61, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(699, 61, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(700, 61, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(701, 61, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(702, 61, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(703, 61, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(704, 62, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(705, 62, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(706, 62, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(707, 62, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(708, 62, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(709, 62, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(710, 62, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(711, 62, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(712, 62, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(713, 62, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(714, 62, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(715, 62, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(716, 62, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(717, 62, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(718, 62, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(719, 62, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(720, 62, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(721, 62, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(722, 62, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(723, 62, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(724, 62, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(725, 62, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(726, 62, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(727, 62, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(728, 62, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(729, 62, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(730, 62, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(731, 62, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(732, 62, 40, 'T-30', 'Test-30', NULL, '50', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(733, 62, 41, 'T-31', 'Test-31', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(734, 63, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(735, 63, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(736, 63, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(737, 63, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(738, 63, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(739, 63, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(740, 63, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(741, 63, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(742, 63, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(743, 63, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(744, 63, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(745, 63, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(746, 63, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(747, 63, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(748, 63, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(749, 63, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(750, 63, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(751, 63, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(752, 63, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(753, 63, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(754, 63, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(755, 63, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(756, 63, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(757, 63, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(758, 63, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(759, 63, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(760, 63, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(761, 63, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(762, 63, 40, 'T-30', 'Test-30', NULL, '50', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(763, 63, 41, 'T-31', 'Test-31', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(764, 63, 42, 'T-32', 'T-32', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(765, 64, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(766, 64, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(767, 64, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(768, 64, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(769, 64, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(770, 64, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(771, 64, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(772, 64, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(773, 64, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(774, 64, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(775, 64, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(776, 64, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(777, 64, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(778, 64, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(779, 64, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(780, 64, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(781, 64, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(782, 64, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(783, 64, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(784, 64, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(785, 65, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(786, 65, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(787, 65, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(788, 65, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(789, 65, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(790, 65, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(791, 65, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(792, 65, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(793, 65, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(794, 65, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(795, 65, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(796, 65, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(797, 65, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(798, 65, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(799, 65, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(800, 65, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(801, 65, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(802, 65, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(803, 65, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(804, 65, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(805, 65, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(806, 65, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(807, 65, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(808, 65, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(809, 66, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(810, 66, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(811, 66, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(812, 66, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(813, 66, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(814, 66, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(815, 66, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(816, 66, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(817, 66, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(818, 66, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(819, 66, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(820, 66, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(821, 66, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(822, 66, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(823, 66, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(824, 66, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(825, 66, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(826, 66, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(827, 66, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(828, 66, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(829, 66, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(830, 67, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(831, 67, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(832, 67, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(833, 67, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(834, 67, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(835, 67, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(836, 67, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(837, 67, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(838, 67, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(839, 67, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(840, 67, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(841, 67, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(842, 67, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(843, 67, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(844, 67, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(845, 67, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(846, 67, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(847, 67, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(848, 67, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(849, 67, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(850, 67, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(851, 67, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(852, 67, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(853, 67, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(854, 67, 35, 'T-25', 'Test-25', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(855, 67, 37, 'T-27', 'Test-27', NULL, '5', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(856, 67, 38, 'T-28', 'Test-28', NULL, '90', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '5'),
(857, 67, 39, 'T-29', 'Test-29', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(858, 67, 40, 'T-30', 'Test-30', NULL, '50', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(859, 67, 41, 'T-31', 'Test-31', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(860, 68, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(861, 68, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(862, 68, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(863, 68, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(864, 68, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(865, 68, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(866, 68, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(867, 68, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(868, 68, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(869, 68, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(870, 68, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(871, 68, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(872, 68, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(873, 68, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(874, 68, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(875, 68, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(876, 68, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(877, 68, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(878, 68, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(879, 68, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(880, 68, 32, 'T-22', 'Test-22', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(881, 68, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(882, 69, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(883, 69, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(884, 69, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(885, 69, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(886, 69, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(887, 69, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(888, 69, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(889, 69, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(890, 69, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(891, 69, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(892, 69, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(893, 69, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(894, 69, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(895, 69, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(896, 69, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(897, 69, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(898, 69, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(899, 69, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(900, 69, 34, 'T-24', 'Test-24', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(901, 69, 33, 'T-23', 'test-23', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(902, 70, 11, '11', 'Fish', NULL, '0', 1, '0.00', 1, '600.00', '600.00', '0.00', '', '0.00', '0.00', 1, '10'),
(903, 70, 21, '2001', 'Lichi', NULL, '0', 1, '0.00', 1, '1.50', '1.50', '0.00', '', '0.00', '0.00', 1, '2'),
(904, 70, 12, '22', 'Meat', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(905, 70, 22, '258', 'Test1', NULL, '55', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(906, 70, 13, '33', 'Sweet', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '5'),
(907, 70, 16, '36', 'Poteto', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '10'),
(908, 70, 20, 'J00190', 'Jack Fruit', NULL, '0', 1, '0.00', 1, '100.00', '100.00', '0.00', '', '0.00', '0.00', 1, '4'),
(909, 70, 19, '96', 'Vegetable', NULL, '0', 2, '24.00%', 1, '1100.00', '1100.00', '264.00', '', '0.00', '0.00', 1, '10'),
(910, 70, 17, '56', 'Tomato', NULL, '0', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(911, 70, 15, '55', 'Fruit', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(912, 70, 18, '43', 'Oil', NULL, '0', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '15'),
(913, 70, 14, '66', 'Vege', NULL, '0', 1, '0.00', 1, '120.00', '120.00', '0.00', '', '0.00', '0.00', 1, '0'),
(914, 70, 26, 'T-16', 'Test-16', NULL, '50', 1, '0.00', 1, '105.00', '105.00', '0.00', '', '0.00', '0.00', 1, '10'),
(915, 70, 27, 'T-17', 'Test-17', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(916, 70, 28, 'T-18', 'Test-18', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(917, 70, 25, 'T-15', 'Test-15', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(918, 70, 24, 'T-14', 'Test-14', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(919, 70, 23, 'T-13', 'Test-13', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(920, 70, 29, 'T-19', 'Test-19', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(921, 70, 30, 'T-20', 'Test-20', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10'),
(922, 70, 31, 'T-21', 'test-21', NULL, '50', 1, '0.00', 1, '1100.00', '1100.00', '0.00', '', '0.00', '0.00', 1, '10');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_invoice_type` int(2) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `no_of_rows` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `version` varchar(5) NOT NULL DEFAULT '2.3',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) NOT NULL,
  `quote_prefix` varchar(55) NOT NULL,
  `purchase_prefix` varchar(55) NOT NULL,
  `transfer_prefix` varchar(55) NOT NULL,
  `barcode_symbology` varchar(20) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `discount_option` tinyint(4) NOT NULL,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `restrict_sale` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `bstatesave` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `currency_prefix`, `default_invoice_type`, `default_tax_rate`, `rows_per_page`, `no_of_rows`, `total_rows`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `barcode_symbology`, `theme`, `product_serial`, `default_discount`, `discount_option`, `discount_method`, `tax1`, `tax2`, `restrict_sale`, `restrict_user`, `restrict_calendar`, `bstatesave`) VALUES
(1, 'header_logo.png', 'login_logo.png', 'Stock Manager Advance', 'english', 1, 'GBP', 2, 1, 10, 9, 30, '2.3', 1, 5, 'SL', 'QU', 'PO', 'TR', 'code128', 'blue', 1, 1, 2, 1, 1, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subcategories`
--


-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) NOT NULL,
  `postal_code` varchar(8) NOT NULL,
  `country` varchar(55) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `creator_id`, `name`, `company`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`) VALUES
(1, 0, 'Test Supplier', 'Supplier Company Name', 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-'),
(2, 0, 'selaz', 'Service On', 'Mirpur', 'Dhaka', 'Dhaka', '1207', 'United Kingdom', '01722702590', 'abu_saleah32@yahoo.com', '', '', '', '', '', ''),
(3, 2, 'Sayem', 'Service On', 'Mirpur', 'Dhaka', 'Dhaka', '1207', 'United Kingdom', '01722702590', 'abu_salea1h@yahoo.com', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `suspended_bills`
--

DROP TABLE IF EXISTS `suspended_bills`;
CREATE TABLE IF NOT EXISTS `suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `tax1` float(25,2) DEFAULT NULL,
  `tax2` float(25,2) DEFAULT NULL,
  `discount` decimal(25,2) DEFAULT NULL,
  `inv_total` decimal(25,2) NOT NULL,
  `total` float(25,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `suspended_bills`
--

INSERT INTO `suspended_bills` (`id`, `date`, `customer_id`, `count`, `tax1`, `tax2`, `discount`, `inv_total`, `total`) VALUES
(1, '2015-03-02', 1, 2, 2400.00, 0.00, '250.00', '10000.00', 12150.00);

-- --------------------------------------------------------

--
-- Table structure for table `suspended_items`
--

DROP TABLE IF EXISTS `suspended_items`;
CREATE TABLE IF NOT EXISTS `suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_unit` varchar(50) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `gross_total` decimal(25,2) NOT NULL,
  `val_tax` decimal(25,2) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `discount_val` decimal(25,2) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `suspended_items`
--

INSERT INTO `suspended_items` (`id`, `suspend_id`, `product_id`, `product_code`, `product_name`, `product_unit`, `tax_rate_id`, `tax`, `quantity`, `unit_price`, `gross_total`, `val_tax`, `discount`, `discount_id`, `discount_val`, `serial_no`) VALUES
(1, 1, 6, '33', 'CPU', '12', 2, '24.00%', 1, '5000.00', '5000.00', '1200.00', '2.50%', 2, '125.00', ''),
(2, 1, 6, '33', 'CPU', '12', 2, '24.00%', 1, '5000.00', '5000.00', '1200.00', '2.50%', 2, '125.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `name`, `rate`, `type`) VALUES
(1, 'No Tax', '0.00', '2'),
(2, 'VAT', '24.00', '1'),
(3, 'GST', '6.00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `transaction_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `bill_amount` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `paid_by` varchar(50) NOT NULL,
  `less` decimal(10,2) DEFAULT NULL,
  `charge` decimal(10,2) DEFAULT NULL,
  `action_type` varchar(200) NOT NULL,
  `note` text,
  `total_balance` decimal(10,2) NOT NULL,
  `pre_balance` decimal(10,2) NOT NULL,
  `curr_balance` decimal(10,2) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `commence_date` varchar(200) DEFAULT NULL,
  `date` varchar(200) NOT NULL,
  `update_date` varchar(200) NOT NULL,
  PRIMARY KEY (`transaction_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_history_id`, `customer_id`, `bill_amount`, `payment`, `paid_by`, `less`, `charge`, `action_type`, `note`, `total_balance`, `pre_balance`, `curr_balance`, `sale_id`, `commence_date`, `date`, `update_date`) VALUES
(1, 1, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '01/04/2015', ''),
(2, 1, '500.00', '0.00', 'Invoice', NULL, NULL, '', NULL, '500.00', '0.00', '0.00', 1, NULL, '01/04/2015', ''),
(3, 1, '4389.00', '0.00', 'cash', NULL, NULL, '', NULL, '4889.00', '0.00', '0.00', 2, NULL, '02/04/2015', ''),
(4, 2, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '02/04/2015', ''),
(5, 2, '320.00', '0.00', 'cash', NULL, NULL, '', NULL, '320.00', '0.00', '0.00', 3, NULL, '02/04/2015', ''),
(6, 3, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '02/04/2015', ''),
(7, 3, '320.00', '0.00', 'cash', NULL, NULL, '', NULL, '320.00', '0.00', '0.00', 4, NULL, '02/04/2015', ''),
(8, 4, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '02/04/2015', ''),
(9, 4, '320.00', '0.00', 'cash', NULL, NULL, '', NULL, '320.00', '0.00', '0.00', 5, NULL, '02/04/2015', ''),
(10, 5, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '02/04/2015', ''),
(11, 5, '320.00', '0.00', 'cash', NULL, NULL, '', NULL, '320.00', '0.00', '0.00', 6, NULL, '02/04/2015', ''),
(12, 6, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '02/04/2015', ''),
(13, 1, '8438.50', '0.00', 'cash', NULL, NULL, '', NULL, '13327.50', '0.00', '0.00', 7, NULL, '05/04/2015', ''),
(14, 1, '8538.50', '0.00', 'cash', NULL, NULL, '', NULL, '21666.00', '0.00', '0.00', 8, NULL, '05/04/2015', '2015-04-05'),
(15, 1, '8438.50', '0.00', 'cash', NULL, NULL, '', NULL, '30104.50', '0.00', '0.00', 9, NULL, '05/04/2015', ''),
(16, 1, '8438.50', '0.00', 'cash', NULL, NULL, '', NULL, '38543.00', '0.00', '0.00', 10, NULL, '05/04/2015', ''),
(17, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '54786.50', '0.00', '0.00', 11, NULL, '05/04/2015', ''),
(18, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '71030.00', '0.00', '0.00', 12, NULL, '05/04/2015', ''),
(19, 1, '2675.50', '0.00', 'cash', NULL, NULL, '', NULL, '73600.50', '0.00', '0.00', 13, NULL, '06/04/2015', '2015-04-07'),
(20, 1, '1664.00', '0.00', 'cash', NULL, NULL, '', NULL, '74959.50', '0.00', '0.00', 14, NULL, '06/04/2015', '2015-04-07'),
(21, 1, '1364.00', '0.00', 'cash', NULL, NULL, '', NULL, '76323.50', '0.00', '0.00', 15, NULL, '06/04/2015', ''),
(22, 7, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(23, 8, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(24, 9, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(25, 1, '600.00', '0.00', 'cash', NULL, NULL, '', NULL, '77023.50', '0.00', '0.00', 16, NULL, '07/04/2015', '2015-04-07'),
(26, 10, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(27, 5, '2728.00', NULL, '', NULL, NULL, '', NULL, '3048.00', '0.00', '0.00', 17, NULL, '07/04/2015', ''),
(28, 9, '1364.00', NULL, '', NULL, NULL, '', NULL, '1364.00', '0.00', '0.00', 18, NULL, '07/04/2015', ''),
(29, 4, '1364.00', NULL, '', NULL, NULL, '', NULL, '1684.00', '0.00', '0.00', 19, NULL, '07/04/2015', ''),
(30, 4, '1364.00', NULL, '', NULL, NULL, '', NULL, '3048.00', '0.00', '0.00', 20, NULL, '07/04/2015', ''),
(31, 11, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(32, 11, '4675.00', '0.00', 'cash', NULL, NULL, '', NULL, '3775.00', '0.00', '0.00', 21, NULL, '07/04/2015', '2015-04-09'),
(33, 11, '310.00', '0.00', 'cash', NULL, NULL, '', NULL, '4985.00', '0.00', '0.00', 22, NULL, '07/04/2015', '2015-04-09'),
(34, 1, '600.00', '0.00', 'cash', NULL, NULL, '', NULL, '77623.50', '0.00', '0.00', 23, NULL, '07/04/2015', ''),
(35, 1, '600.00', '0.00', 'cash', NULL, NULL, '', NULL, '78223.50', '0.00', '0.00', 24, NULL, '07/04/2015', ''),
(36, 1, '1364.00', '0.00', 'cash', NULL, NULL, '', NULL, '79587.50', '0.00', '0.00', 25, NULL, '07/04/2015', ''),
(37, 1, '1364.00', '0.00', 'cash', NULL, NULL, '', NULL, '80951.50', '0.00', '0.00', 26, NULL, '07/04/2015', ''),
(38, 1, '105.00', '0.00', 'cash', NULL, NULL, '', NULL, '81056.50', '0.00', '0.00', 27, NULL, '07/04/2015', ''),
(39, 1, '105.00', '0.00', 'cash', NULL, NULL, '', NULL, '81161.50', '0.00', '0.00', 28, NULL, '07/04/2015', ''),
(40, 1, '1100.00', '0.00', 'cash', NULL, NULL, '', NULL, '82261.50', '0.00', '0.00', 29, NULL, '07/04/2015', ''),
(41, 1, '3828.00', '0.00', 'cash', NULL, NULL, '', NULL, '86089.50', '0.00', '0.00', 30, NULL, '07/04/2015', ''),
(42, 1, '1.50', '0.00', 'cash', NULL, NULL, '', NULL, '86091.00', '0.00', '0.00', 31, NULL, '07/04/2015', ''),
(43, 12, NULL, NULL, '', NULL, NULL, '', NULL, '0.00', '0.00', '0.00', NULL, NULL, '07/04/2015', ''),
(44, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '102334.50', '0.00', '0.00', 32, NULL, '09/04/2015', ''),
(45, 1, '4549.50', '0.00', 'cash', NULL, NULL, '', NULL, '106884.00', '0.00', '0.00', 34, NULL, '09/04/2015', ''),
(46, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '123127.50', '0.00', '0.00', 35, NULL, '09/04/2015', ''),
(47, 1, '600.00', '0.00', 'cash', NULL, NULL, '', NULL, '123727.50', '0.00', '0.00', 36, NULL, '09/04/2015', ''),
(48, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '139971.00', '0.00', '0.00', 37, NULL, '09/04/2015', ''),
(49, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '156214.50', '0.00', '0.00', 38, NULL, '09/04/2015', ''),
(50, 1, '1.50', '0.00', 'cash', NULL, NULL, '', NULL, '156216.00', '0.00', '0.00', 39, NULL, '09/04/2015', ''),
(51, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '172459.50', '0.00', '0.00', 40, NULL, '09/04/2015', ''),
(52, 1, '1100.00', '0.00', 'cash', NULL, NULL, '', NULL, '173559.50', '0.00', '0.00', 41, NULL, '09/04/2015', ''),
(53, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '189803.00', '0.00', '0.00', 42, NULL, '09/04/2015', ''),
(54, 1, '1364.00', '0.00', 'cash', NULL, NULL, '', NULL, '191167.00', '0.00', '0.00', 43, NULL, '09/04/2015', ''),
(55, 1, '1.50', '0.00', 'cash', NULL, NULL, '', NULL, '191168.50', '0.00', '0.00', 44, NULL, '09/04/2015', ''),
(56, 1, '1100.00', '0.00', 'cash', NULL, NULL, '', NULL, '192268.50', '0.00', '0.00', 45, NULL, '09/04/2015', ''),
(57, 1, '1364.00', '0.00', 'cash', NULL, NULL, '', NULL, '193632.50', '0.00', '0.00', 46, NULL, '09/04/2015', ''),
(58, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '209876.00', '0.00', '0.00', 47, NULL, '09/04/2015', ''),
(59, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '226119.50', '0.00', '0.00', 48, NULL, '09/04/2015', ''),
(60, 1, '15143.50', '0.00', 'cash', NULL, NULL, '', NULL, '241263.00', '0.00', '0.00', 49, NULL, '09/04/2015', ''),
(61, 1, '21643.50', '0.00', 'cash', NULL, NULL, '', NULL, '262906.50', '0.00', '0.00', 50, NULL, '12/04/2015', ''),
(62, 1, '21743.50', '0.00', 'cash', NULL, NULL, '', NULL, '284650.00', '0.00', '0.00', 51, NULL, '12/04/2015', ''),
(63, 1, '17343.50', '0.00', 'cash', NULL, NULL, '', NULL, '301993.50', '0.00', '0.00', 52, NULL, '12/04/2015', ''),
(64, 1, '18443.50', '0.00', 'cash', NULL, NULL, '', NULL, '320437.00', '0.00', '0.00', 53, NULL, '12/04/2015', ''),
(65, 1, '23943.50', '0.00', 'cash', NULL, NULL, '', NULL, '344380.50', '0.00', '0.00', 55, NULL, '12/04/2015', ''),
(66, 1, '29543.50', '0.00', 'cash', NULL, NULL, '', NULL, '373924.00', '0.00', '0.00', 56, NULL, '12/04/2015', ''),
(67, 1, '25143.50', '0.00', 'cash', NULL, NULL, '', NULL, '399067.50', '0.00', '0.00', 57, NULL, '12/04/2015', ''),
(68, 1, '17343.50', '0.00', 'cash', NULL, NULL, '', NULL, '416411.00', '0.00', '0.00', 58, NULL, '12/04/2015', ''),
(69, 1, '18443.50', '0.00', 'cash', NULL, NULL, '', NULL, '434854.50', '0.00', '0.00', 59, NULL, '12/04/2015', ''),
(70, 1, '25043.50', '0.00', 'cash', NULL, NULL, '', NULL, '459898.00', '0.00', '0.00', 60, NULL, '12/04/2015', ''),
(71, 1, '19543.50', '0.00', 'cash', NULL, NULL, '', NULL, '479441.50', '0.00', '0.00', 61, NULL, '12/04/2015', ''),
(72, 1, '26243.50', '0.00', 'cash', NULL, NULL, '', NULL, '505685.00', '0.00', '0.00', 62, NULL, '12/04/2015', ''),
(73, 1, '27343.50', '0.00', 'cash', NULL, NULL, '', NULL, '533028.50', '0.00', '0.00', 63, NULL, '12/04/2015', ''),
(74, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '549272.00', '0.00', '0.00', 64, NULL, '12/04/2015', ''),
(75, 1, '20643.50', '0.00', 'cash', NULL, NULL, '', NULL, '569915.50', '0.00', '0.00', 65, NULL, '12/04/2015', ''),
(76, 1, '17343.50', '0.00', 'cash', NULL, NULL, '', NULL, '587259.00', '0.00', '0.00', 66, NULL, '12/04/2015', ''),
(77, 1, '26243.50', '0.00', 'cash', NULL, NULL, '', NULL, '613502.50', '0.00', '0.00', 67, NULL, '12/04/2015', ''),
(78, 1, '18443.50', '0.00', 'cash', NULL, NULL, '', NULL, '631946.00', '0.00', '0.00', 68, NULL, '12/04/2015', ''),
(79, 1, '16243.50', '0.00', 'cash', NULL, NULL, '', NULL, '648189.50', '0.00', '0.00', 69, NULL, '12/04/2015', ''),
(80, 1, '17343.50', '0.00', 'cash', NULL, NULL, '', NULL, '665533.00', '0.00', '0.00', 70, NULL, '12/04/2015', '');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE IF NOT EXISTS `transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` date NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `total` decimal(25,2) DEFAULT NULL,
  `tr_total` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transfers`
--


-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

DROP TABLE IF EXISTS `transfer_items`;
CREATE TABLE IF NOT EXISTS `transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_unit` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `tax_val` decimal(25,2) DEFAULT NULL,
  `unit_price` decimal(25,2) DEFAULT NULL,
  `gross_total` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transfer_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `creator_id`) VALUES
(1, '\0\0', 'owner', '54af4ba64ec0a86f4f3e1e45159df08902ab8f40', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, '6d51ca3212f297271477fb4f3ec312d68dfd1702', 1351661704, 1428840187, 1, 'Owner', 'Owner', 'Stock Manager', '0105292122', 0),
(2, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'abu saleah', 'ab3c057639214e400e660e9c5f8281ac4edc0a42', NULL, 'abu_saleah@yahoo.com', NULL, NULL, NULL, NULL, 1425890951, 1425974040, 1, 'abu', 'saleah', 'Service On', '01722702590', 0),
(3, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'md. monir hasan', 'fbb7fe3801adfc6f157bfdd6eb9c4bb7f5ec159f', NULL, 'monir@yahoo.com', NULL, NULL, NULL, NULL, 1425893157, 1425973173, 1, 'Md. Monir', 'hasan', 'Service On', '01722702590', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `code`, `name`, `address`, `city`) VALUES
(1, 'WHI', 'Warehouse 1', 'Address', 'City');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses_products`
--

DROP TABLE IF EXISTS `warehouses_products`;
CREATE TABLE IF NOT EXISTS `warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `warehouses_products`
--

INSERT INTO `warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`) VALUES
(1, 1, 1, -28),
(2, 6, 1, -31),
(3, 2, 1, -5),
(4, 4, 1, -4),
(5, 5, 1, -4),
(6, 7, 1, -11),
(7, 8, 1, -1),
(8, 9, 1, -9),
(9, 10, 1, -4),
(10, 11, 1, -203),
(11, 12, 1, -188),
(12, 13, 1, -89),
(13, 14, 1, -53),
(14, 18, 1, -80),
(15, 17, 1, -24),
(16, 15, 1, -186),
(17, 16, 1, -100),
(18, 19, 1, -51),
(19, 20, 1, -44),
(20, 21, 1, 83),
(21, 22, 1, -41),
(22, 23, 1, -31),
(23, 24, 1, -31),
(24, 25, 1, -31),
(25, 26, 1, -31),
(26, 27, 1, -31),
(27, 28, 1, -30),
(28, 30, 1, -26),
(29, 29, 1, -26),
(30, 34, 1, -15),
(31, 33, 1, -15),
(32, 32, 1, -15),
(33, 31, 1, -17),
(34, 35, 1, -9),
(35, 36, 1, -4),
(36, 37, 1, -7),
(37, 41, 1, -5),
(38, 40, 1, -5),
(39, 39, 1, -6),
(40, 38, 1, -6),
(41, 42, 1, -2),
(42, 43, 1, -1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
