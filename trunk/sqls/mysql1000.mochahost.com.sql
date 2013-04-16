-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: mysql1000.mochahost.com
-- Generation Time: Apr 16, 2013 at 07:59 AM
-- Server version: 5.5.28-29.2
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+02:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `allamco1_altagamo3`
--
CREATE DATABASE `allamco1_altagamo3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `allamco1_altagamo3`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all cities of states of countries of the world' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name_ar`, `name_en`, `active_flag`, `state_id`) VALUES
(1, 'القاهرة الجديدة', 'New Cairo', '1', 1),
(2, 'الرحاب', 'Rehab', '1', 1),
(3, 'مدينتي', 'madinaty', '1', 1),
(4, 'مدينة نصر ', 'Nasr City', '1', 1),
(5, 'مصر الجديدة', 'Heliopolis', '1', 1),
(6, 'المعادي ', 'Maadi', '1', 1),
(7, 'الزمالك', 'Zmalek', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `compound`
--

CREATE TABLE IF NOT EXISTS `compound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `compound`
--

INSERT INTO `compound` (`id`, `name_ar`, `name_en`, `active_flag`, `city_id`) VALUES
(1, 'المصراويه', 'El Masraweya', '1', 1),
(2, 'مرتفعات القطاميه', 'Kattameya Heights', '1', 1),
(3, 'هايد بارك', 'Hyde Park', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_ar_UNIQUE` (`name_ar`),
  UNIQUE KEY `name_en_UNIQUE` (`name_en`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all the world countries' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name_ar`, `name_en`, `active_flag`) VALUES
(1, 'مصر', 'Egypt', '1'),
(2, 'السعودية', 'Saudi Arabia', '1'),
(3, 'الإمارات', 'United Arab Emirates', '1');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all destricts of cities of states of countries' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name_ar`, `name_en`, `active_flag`, `city_id`) VALUES
(1, 'القطاعات', 'Sectors', '1', 1),
(2, 'التجمع الأول', '1st District', '1', 1),
(5, 'ابو الهول', 'Abo Al Houl', '1', 1),
(6, 'النرجس', 'Al Nargis ', '1', 1),
(7, 'البنفسج', 'Al Banafseg', '1', 1),
(8, 'جنوب الاكاديمية', 'South The Academy', '1', 1),
(9, 'الاحياء', 'Al 2a7ya2', '1', 1),
(10, 'الشويفات', 'Al Showayfat', '1', 1),
(11, 'غرب الجولف', 'The Golf West', '1', 1),
(12, 'شرق الاكاديمية', 'East The Academy', '1', 1),
(13, 'القرنفل', 'Al Koronfel', '1', 1),
(14, 'اللوتس', 'Al Lotus', '1', 1),
(15, 'الياسمين', 'Al Yasmine', '1', 1),
(16, 'المشتل و غرب المشتل', 'Al Mashtal And West Mashtal', '1', 1),
(17, 'تمر حنة', 'Tamr Henna', '1', 1),
(18, 'غرب ارابيللا', 'West Arabella', '1', 1),
(19, 'المنطقة الصناعية', 'Industrial Area', '1', 1),
(20, 'امتداد غرب الجولف', 'The Extension Of West Golf', '1', 1),
(21, 'النخيل', 'Al Nakhel', '1', 1),
(22, 'الامن العام', 'Al Amn Al 3am', '1', 1),
(23, 'الدبلوماسيين', 'The Diplomates Area', '1', 1),
(24, 'المستثمرين و امتداداتها', 'Al Mostathmereen And Extesnsions', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `fav_property` (`property_id`),
  KEY `fav_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `row_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active_flag` char(1) DEFAULT '1',
  `video_link` varchar(100) DEFAULT NULL,
  `img_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list all the projets made by Allamco in the new cairo' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `title`, `description`, `row_order`, `created_at`, `active_flag`, `video_link`, `img_count`) VALUES
(1, 'Project 1', 'Al Tagamo3 Real Estate e', 1, '2013-02-16 03:23:22', '1', '', 1),
(2, 'Sama School', 'A new school in 5th district', 2, '2013-02-16 03:58:54', '1', '', 1),
(3, 'Project 3', 'Project 3 small description just for test', 3, '2013-02-16 04:12:39', '1', '', 0),
(4, 'Project  Towers X', 'adsg vb  fd hdfh rhst fg hfth fgh fgh dfhf fh fg fgh fh fg hfghftg hdfn h', 3, '2013-02-24 21:44:47', '1', 'Asdfghj', 0),
(5, 'Project  Towers X', 'adsg vb  fd hdfh rhst fg hfth fgh fgh dfhf fh fg fgh fh fg hfghftg hdfn h', 10, '2013-02-24 21:45:12', '1', 'Asdfghj', 0),
(6, 'Project Y', 'ert v  rth rth th trfh fg  dsrfh fg hfgbn dfnbg fgn fgn fdtnfgn fg fgn bfgn  ', 14, '2013-02-24 21:47:26', '1', '', 1),
(7, 'Project test', 'zsdv  d df ds sdfh dshfs dr hsdh sfhw hsd hbsd hsd srdh sdh dh dh dh', 13, '2013-02-27 18:30:13', '0', '', 0),
(8, 'مشروع اللوتس بالتجمع الخامس', 'مشروع اللوتس بالتجمع الخامس , القاهره الجديده', 0, '2013-03-11 12:14:23', '1', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `prop_status`
--

CREATE TABLE IF NOT EXISTS `prop_status` (
  `id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` int(11) DEFAULT NULL,
  KEY `prop_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prop_status`
--

INSERT INTO `prop_status` (`id`, `status`, `changed_at`, `changed_by`) VALUES
(10, 2, '2012-08-01 21:17:36', 1),
(9, 2, '2012-08-01 21:17:53', 1),
(13, 1, '2012-08-02 03:45:20', 1),
(13, 2, '2012-08-03 20:43:00', 1),
(12, 2, '2012-08-03 20:43:16', 1),
(11, 2, '2012-08-03 20:43:57', 1),
(2, 5, '2012-08-06 05:21:24', 1),
(2, 1, '2012-08-06 05:21:33', 1),
(2, 5, '2012-08-06 05:22:36', 1),
(2, 1, '2012-08-06 05:22:42', 1),
(2, 2, '2012-08-06 15:27:31', 1),
(4, 3, '2012-08-11 12:58:01', 1),
(14, 1, '2012-08-22 13:33:04', 18),
(14, 1, '2012-08-22 13:34:51', 1),
(14, 2, '2012-08-22 13:37:45', 1),
(15, 1, '2012-08-23 11:55:09', 18),
(16, 1, '2012-08-23 12:03:36', 18),
(17, 1, '2012-08-23 12:15:53', 18),
(18, 1, '2012-08-26 12:50:55', 18),
(19, 1, '2012-08-26 12:51:00', 18),
(15, 2, '2012-08-26 14:52:19', 1),
(20, 1, '2012-08-26 15:14:55', 18),
(16, 2, '2012-09-06 09:18:24', 1),
(18, 2, '2012-09-26 00:04:42', 1),
(19, 2, '2012-09-26 00:05:01', 1),
(20, 2, '2012-09-26 00:05:16', 1),
(21, 1, '2012-10-01 18:16:29', 17),
(22, 1, '2012-10-01 18:17:34', 17),
(23, 1, '2012-10-01 18:17:35', 17),
(21, 2, '2012-10-01 18:19:02', 1),
(22, 5, '2012-10-05 11:44:41', 1),
(23, 5, '2012-10-05 11:45:00', 1),
(17, 2, '2012-10-05 12:07:57', 1),
(24, 1, '2012-10-08 16:35:00', 12),
(25, 1, '2012-10-12 13:02:01', 12),
(26, 1, '2012-10-13 01:30:15', 12),
(27, 1, '2012-10-13 02:36:45', 12),
(28, 1, '2012-10-17 17:14:19', 12),
(29, 1, '2012-11-09 16:08:46', 17),
(30, 1, '2012-11-09 16:28:10', 17),
(31, 1, '2012-11-09 16:51:07', 17),
(29, 5, '2012-11-09 16:51:13', 1),
(29, 5, '2012-11-09 16:51:17', 1),
(30, 2, '2012-11-09 16:51:56', 1),
(31, 2, '2012-11-09 16:51:56', 1),
(32, 1, '2012-11-09 16:54:47', 17),
(33, 1, '2012-11-09 17:15:32', 17),
(34, 1, '2012-11-09 17:25:01', 17),
(35, 1, '2012-11-09 17:32:48', 17),
(24, 5, '2012-11-10 11:34:48', 1),
(25, 5, '2012-11-10 11:34:48', 1),
(26, 5, '2012-11-10 11:34:48', 1),
(27, 5, '2012-11-10 11:34:48', 1),
(28, 5, '2012-11-10 11:34:48', 1),
(32, 2, '2012-11-10 11:35:18', 1),
(33, 2, '2012-11-10 11:35:18', 1),
(34, 2, '2012-11-10 11:35:18', 1),
(35, 2, '2012-11-10 11:35:18', 1),
(8, 5, '2012-11-10 11:36:45', 1),
(9, 5, '2012-11-10 11:36:45', 1),
(10, 5, '2012-11-10 11:36:45', 1),
(11, 5, '2012-11-10 11:36:45', 1),
(12, 5, '2012-11-10 11:36:45', 1),
(16, 2, '2012-11-10 11:37:38', 1),
(17, 2, '2012-11-10 11:37:39', 1),
(21, 2, '2012-11-10 11:37:39', 1),
(1, 5, '2012-11-10 11:40:02', 1),
(2, 5, '2012-11-10 11:40:02', 1),
(5, 5, '2012-11-10 11:40:02', 1),
(6, 5, '2012-11-10 11:40:02', 1),
(7, 5, '2012-11-10 11:40:02', 1),
(13, 5, '2012-11-10 11:40:02', 1),
(20, 5, '2012-11-10 12:08:17', 1),
(36, 1, '2013-02-11 15:33:11', 17),
(37, 1, '2013-02-12 10:20:35', 17),
(38, 1, '2013-02-12 10:27:24', 17),
(39, 1, '2013-02-12 10:45:14', 17),
(40, 1, '2013-02-12 11:58:21', 17),
(41, 1, '2013-02-12 12:43:36', 17),
(42, 1, '2013-02-12 13:07:49', 17),
(36, 1, '2013-02-13 15:21:31', 1),
(37, 1, '2013-02-13 15:21:31', 1),
(38, 1, '2013-02-13 15:21:31', 1),
(39, 1, '2013-02-13 15:21:31', 1),
(40, 1, '2013-02-13 15:21:31', 1),
(41, 1, '2013-02-13 15:21:31', 1),
(42, 1, '2013-02-13 15:21:31', 1),
(36, 2, '2013-02-13 15:21:58', 1),
(37, 2, '2013-02-13 15:21:58', 1),
(38, 2, '2013-02-13 15:21:58', 1),
(39, 2, '2013-02-13 15:21:58', 1),
(40, 2, '2013-02-13 15:21:58', 1),
(41, 2, '2013-02-13 15:21:58', 1),
(42, 2, '2013-02-13 15:21:58', 1),
(8, 5, '2013-02-13 15:24:11', 1),
(9, 5, '2013-02-13 15:24:11', 1),
(10, 5, '2013-02-13 15:24:11', 1),
(11, 5, '2013-02-13 15:24:11', 1),
(12, 5, '2013-02-13 15:24:11', 1),
(1, 5, '2013-02-13 15:25:07', 1),
(2, 5, '2013-02-13 15:25:07', 1),
(4, 5, '2013-02-13 15:25:07', 1),
(5, 5, '2013-02-13 15:25:07', 1),
(6, 5, '2013-02-13 15:25:07', 1),
(7, 5, '2013-02-13 15:25:07', 1),
(8, 5, '2013-02-13 15:25:07', 1),
(9, 5, '2013-02-13 15:25:07', 1),
(10, 5, '2013-02-13 15:25:07', 1),
(11, 5, '2013-02-13 15:25:07', 1),
(43, 1, '2013-02-22 14:58:51', 17),
(44, 1, '2013-02-22 15:06:18', 17),
(45, 1, '2013-03-11 11:04:20', 17),
(1, 1, '2013-03-26 16:54:41', 12),
(2, 1, '2013-04-01 18:13:08', 12),
(46, 1, '2013-04-01 21:03:18', 12),
(47, 1, '2013-04-08 13:08:56', 17),
(48, 1, '2013-04-08 13:14:25', 17),
(49, 1, '2013-04-08 15:34:08', 17),
(50, 1, '2013-04-08 15:48:00', 17);

-- --------------------------------------------------------

--
-- Table structure for table `prop_type`
--

CREATE TABLE IF NOT EXISTS `prop_type` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_ar_UNIQUE` (`name_ar`),
  UNIQUE KEY `name_en_UNIQUE` (`name_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Property Type';

--
-- Dumping data for table `prop_type`
--

INSERT INTO `prop_type` (`id`, `name_ar`, `name_en`, `active_flag`) VALUES
(1, 'شقق', 'Apartments', '1'),
(2, 'فيلات', 'Villas', '1'),
(3, 'ستوديوهات', 'Studios', '1'),
(4, 'محلات', 'Shops', '1'),
(5, 'عيادات', 'Clinics', '1'),
(6, 'مستشفيات', 'Hospitals', '1'),
(7, 'مدارس', 'Schools', '1'),
(8, 'مباني', 'Buildings', '1'),
(9, 'مصانع', 'Factories', '1'),
(10, 'أراضي', 'Land', '1'),
(11, 'عزب و مزارع', 'Farms', '1'),
(12, 'مخازن', 'Stores', '1'),
(13, 'مكاتب', 'Offices', '1');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_type_id` int(11) NOT NULL COMMENT 'Property Type ID: 1- Apartment 2-Villa 3-...',
  `title` varchar(100) DEFAULT NULL COMMENT 'The property title to be displayed as a reference to it',
  `description` varchar(500) DEFAULT NULL COMMENT 'Arabic Property Description',
  `subarea_id` int(11) DEFAULT NULL COMMENT 'Property-Subarea ID',
  `zone_id` int(11) DEFAULT NULL,
  `compound_id` int(11) DEFAULT NULL COMMENT 'Property-Compound ID',
  `district_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `prp_for` char(1) NOT NULL DEFAULT '1' COMMENT 'Property for: 1- Sale 2-Rent 3-Any',
  `price` int(11) DEFAULT NULL COMMENT 'The property total sale value in EGP or the periodical rental value',
  `rental_period` char(1) DEFAULT NULL COMMENT 'the period for each payment in case of rent: 1-Daily 2-Weekly 3- Monthly 4- Quarterly 5- Semi-Annually 6- Annually ',
  `pay_type` char(1) DEFAULT NULL COMMENT 'Payment Type: 1-Cash 2-Installments',
  `pay_in_advance` int(11) DEFAULT NULL COMMENT 'The payment-in-advance as an initial bulk in case of sale',
  `inst_total_duration` int(11) DEFAULT NULL COMMENT 'Total Installment duration in months',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `finish_status` char(1) DEFAULT '3' COMMENT 'Finishing Status: 1- Finished 2-Semi-Finished 3- Unfinished',
  `furn_status` char(1) DEFAULT '3' COMMENT 'Furniture Status: 1- Furnished 2-Semi-Furnished 3-Unfurnished',
  `area` int(11) DEFAULT NULL COMMENT 'Property Surface Area',
  `subtype` char(1) DEFAULT NULL COMMENT 'Subtype: 1- Flat 2-Flat-Garden 3-Duplex-In-Typical-Floors 4-Duplex-Garden 5-Triplex 6-Penthouse',
  `floorNo` int(11) DEFAULT NULL,
  `bedroomsNo` int(11) DEFAULT NULL,
  `hallroomsNo` int(11) DEFAULT NULL,
  `bathroomsNo` int(11) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL COMMENT 'Link to the property video',
  `approved_by` int(11) DEFAULT NULL COMMENT 'The admin user who approves the ad',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT 'The time in which the admin approves the ad',
  `c_name` varchar(100) DEFAULT NULL COMMENT 'The name of the client having the property',
  `c_phone` varchar(100) DEFAULT NULL COMMENT 'The phone of the client having the property',
  `c_email` varchar(45) DEFAULT NULL COMMENT 'The email of the client having the property',
  `c_address` varchar(200) DEFAULT NULL COMMENT 'The address of the client having the property',
  `status` char(1) DEFAULT '1' COMMENT 'The Property Status: 1- New  2- Available 3- Sold 4- Rent 5- Inactive',
  `rent_start` date DEFAULT NULL COMMENT 'The start rent date',
  `rent_end` date DEFAULT NULL COMMENT 'The end rent date',
  `img_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prp_type` (`property_type_id`),
  KEY `prp_user_create` (`created_by`),
  KEY `prp_country` (`country_id`),
  KEY `prp_state` (`state_id`),
  KEY `prp_city` (`city_id`),
  KEY `prp_compound` (`compound_id`),
  KEY `prp_district` (`district_id`),
  KEY `prp_zone` (`zone_id`),
  KEY `prp_subarea` (`subarea_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `property_type_id`, `title`, `description`, `subarea_id`, `zone_id`, `compound_id`, `district_id`, `city_id`, `state_id`, `country_id`, `prp_for`, `price`, `rental_period`, `pay_type`, `pay_in_advance`, `inst_total_duration`, `created_at`, `created_by`, `finish_status`, `furn_status`, `area`, `subtype`, `floorNo`, `bedroomsNo`, `hallroomsNo`, `bathroomsNo`, `video_link`, `approved_by`, `approved_at`, `c_name`, `c_phone`, `c_email`, `c_address`, `status`, `rent_start`, `rent_end`, `img_count`) VALUES
(1, 1, NULL, 'شقه متميزة للجادين فقط بالحي الأول في المصراوية بالتجمع', NULL, 1, NULL, 1, 1, 1, 1, '1', 200000, '3', '1', 0, 0, '2012-07-05 18:51:02', 2, NULL, '3', 150, '1', 2, 2, 2, 2, '', NULL, NULL, 'admin', '01001728413', 'menememad@gmail.com', '28 Mohammed Hassan El Gamal St', '1', NULL, NULL, 0),
(2, 1, NULL, 'شقة 2', NULL, NULL, NULL, NULL, 1, 1, 1, '3', 400000, '3', '1', 0, 0, '2012-07-06 15:07:44', 6, NULL, '3', 200, '1', 22, 2, 2, 2, 'http://www.youtube.com?watch=1234', 1, '2012-08-06 15:27:31', 'admin', '01001728413', 'menememad@gmail.com', '28 Mohammed Hassan El Gamal St', '1', NULL, NULL, 1),
(4, 1, NULL, 'new new', NULL, NULL, 1, NULL, 1, 1, 1, '1', 5000, NULL, '1', 0, 0, '2012-07-19 02:14:10', 1, NULL, '3', 120, '2', 1, 1, 1, 1, '', 1, '2012-07-20 15:39:14', 'admin', '0111 664 9998 ', 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', '5', NULL, NULL, 1),
(5, 1, NULL, 'dsalkjlaksjlkjdj jdsal dkjldkj dklj dlaksj dlk djlkjdsadiqwoiu', NULL, NULL, 1, 8, 1, 1, 1, '1', NULL, NULL, '1', NULL, NULL, '2012-07-19 08:51:28', 1, NULL, '3', NULL, '1', NULL, NULL, NULL, NULL, '', 1, '2012-07-20 15:48:57', 'admin', '0111 664 9998 ', 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', '5', NULL, NULL, 0),
(6, 1, NULL, 'شقة جديده', NULL, NULL, NULL, 22, 1, 1, 1, '1', 200000, NULL, '1', 0, 0, '2012-07-23 21:43:29', 1, NULL, '3', 120, '1', 1, 1, 1, 1, '', 1, '2012-07-23 22:02:40', 'admin', '0111 664 9998 ', 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', '5', NULL, NULL, 1),
(7, 1, NULL, 'شقة جديده جداً', NULL, NULL, NULL, NULL, 1, 1, 1, '1', 11112222, NULL, '1', NULL, NULL, '2012-07-23 21:46:48', 1, NULL, '3', 12, '2', 1, 1, 1, 1, '', 1, '2012-07-23 22:02:25', 'admin', '0111 664 9998 ', 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', '5', NULL, NULL, 0),
(8, 1, NULL, 'ay kalam', NULL, 32, 3, 8, 1, 1, 1, '2', 2300, '3', '1', 0, 0, '2012-07-23 21:58:52', 1, '2', '3', 200, '2', 3, 3, 4, 3, '', 1, '2012-07-23 22:00:48', 'admin', '0111 664 9998 ', 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', '5', NULL, NULL, 0),
(9, 1, NULL, 'A new apartment for rent', NULL, 4, NULL, 5, 1, 1, 1, '2', 550000, '3', '1', NULL, NULL, '2012-08-01 13:39:56', 1, '1', '1', 300, '1', 3, 3, 3, 3, '', 1, '2012-08-01 21:17:53', 'Dr. Samir', '', '', '', '5', NULL, NULL, 0),
(10, 1, NULL, 'A very excellent state in cairo', NULL, 49, NULL, 14, 1, 1, 1, '2', 400000, '3', '1', NULL, NULL, '2012-08-01 13:48:09', 1, '1', '1', 290, '2', 1, 3, 3, 3, '', 1, '2012-08-01 21:17:26', 'Dr. samir', '', '', '', '5', NULL, NULL, 0),
(11, 1, NULL, 'شقه بحديقه', NULL, 29, NULL, 8, 1, 1, 1, '2', 6000, '3', '1', NULL, NULL, '2012-08-02 03:05:02', 1, '1', '1', 233, '2', 2, 3, 3, 3, '', 1, '2012-08-03 20:43:54', 'Moneim emad', '', '', '', '5', NULL, NULL, 0),
(12, 1, NULL, 'Apartment with garden', NULL, NULL, NULL, 12, 1, 1, 1, '2', 10000, '3', '1', NULL, NULL, '2012-08-02 03:30:38', 1, '1', '1', 432, '2', 1, 5, 5, 3, '', 1, '2012-08-03 20:43:15', 'Moneim Emad', '', '', '', '5', NULL, NULL, 0),
(13, 1, NULL, 'شقه بالحديقه', NULL, NULL, NULL, NULL, 1, 1, 1, '1', NULL, '3', '1', NULL, NULL, '2012-08-02 03:45:20', 1, '1', '1', NULL, '2', NULL, NULL, NULL, NULL, '', 1, '2012-08-03 20:43:00', 'د. سمير', '', '', '', '5', NULL, NULL, 0),
(14, 1, NULL, 'flat at al-loutas 180 m 3bedroom 3 receptions 3bathroom semi finished  near from 90th Road \r\nشقه باللوتس الجنوبيه تطل علي التسعيني و شارع النوادي و نادي القاهره الجديده - واجهه علي حديقه 196 م 3 ريسبشن 3 نوم 3 حمام ', NULL, 50, NULL, 14, 1, 1, 1, '1', 666400, '3', '2', 233240, 48, '2012-08-22 13:33:04', 18, '2', '3', 196, '1', 3, 3, 1, 3, '', 1, '2012-08-22 13:37:45', 'mostafa allam', '01116649998', '', '', '2', NULL, NULL, 0),
(15, 1, NULL, 'شقة فى اللوتس الجنوبية ثانى نمرة من التسعينى مساحة 180م  تقسيم داخلى مميز ', NULL, 50, NULL, 14, 1, 1, 1, '1', 580000, '3', '2', 150000, 48, '2012-08-23 11:55:09', 18, '2', '3', 180, '1', 2, 3, 1, 2, '', 1, '2012-08-26 14:52:19', 'mostafa ', '01116649998', '', '', '2', NULL, NULL, 0),
(16, 1, NULL, ' دوبلكس النرجس 2 دوبلكس ايجار ارضى مع اول 250م , 3نوم + 2حمام + 2 مطبخ  + ليفنج ,  الارضيات سيراميك ,حديقه خلفيه خاصه بها \r\n', NULL, 8, NULL, 6, 1, 1, 1, '2', 6000, '3', '1', 0, 0, '2012-08-23 12:03:36', 18, '1', '3', 250, '4', 1, 3, 1, 2, '', 1, '2012-09-06 09:18:24', 'mostafa', '01116649998', '', '', '2', NULL, NULL, 0),
(17, 1, NULL, 'دوبلكس النرجس 2  شقه ايجارارضى مع اول 200م , ارضى ولها مدخل خاص , 3نوم + 1 حمام , سيراميك , \r\n', NULL, 8, NULL, 6, 1, 1, 1, '2', 3500, '3', '1', 0, 0, '2012-08-23 12:14:54', 18, '1', '3', 200, '3', 1, 3, 1, 2, '', 1, '2012-10-05 12:07:57', 'mostafa', '01116649998', '', '', '2', NULL, NULL, 0),
(18, 1, NULL, '  شقة للبيع وجة بنوراما دور ثالث 235 م نصف تشطيب عدد 3 نوم 3 حمام 1 هول كبير 5 قطع ', NULL, 50, NULL, 14, 1, 1, 1, '1', 846000, '3', '2', 296100, 60, '2012-08-26 12:50:55', 18, '2', '3', 235, '1', 3, 3, 1, 2, '', 1, '2012-09-26 00:04:42', 'mostafA ALLAM', '01116649998', '', 'اللوتس الجنوبيه قطعة 71 اللوتس 7', '2', NULL, NULL, 0),
(19, 1, NULL, '  شقة للبيع وجة بنوراما دور ثانى 180 م نصف تشطيب عدد 3 نوم 2 حمام 1 هول كبير ', NULL, 50, NULL, 14, 1, 1, 1, '1', 580000, '3', '2', 180000, 48, '2012-08-26 12:51:00', 18, '2', '3', 180, '1', 2, 3, 1, 2, '', 1, '2012-09-26 00:05:01', 'mostafe', '01116649998', '', '', '2', NULL, NULL, 0),
(20, 1, NULL, 'flat for sale ', NULL, 50, NULL, 14, 1, 1, 1, '1', 441000, '3', '1', NULL, NULL, '2012-08-26 15:14:55', 18, '2', '3', 140, '1', 4, 2, 1, 2, '', 1, '2012-09-26 00:05:16', 'mostafa', '0123456', '', '', '5', NULL, NULL, 0),
(21, 1, NULL, 'شقه جنوب الاكاديميه  ج  < بحرى , شقه ايجار 170م  3 نوم + ليفنج + 2 حمام + ريسبشن , فيها خشب المطبخ , تشطيب فاخر ارضيات بورسلين ,المطلوب 3000 جنيه . \r\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\r\n', NULL, 5, NULL, 5, 1, 1, 1, '2', 3000, '3', '1', NULL, NULL, '2012-10-01 18:16:28', 17, '3', '3', 168, '1', 2, 2, 2, 2, '', 1, '2012-10-01 18:19:02', 'عبدالرحمن', '01154992014', 'abdo@gmail.com', 'الحى الرابع', '2', NULL, NULL, 0),
(22, 1, NULL, 'شقه جنوب الاكاديميه  ج  < بحرى , شقه ايجار 170م  3 نوم + ليفنج + 2 حمام + ريسبشن , فيها خشب المطبخ , تشطيب فاخر ارضيات بورسلين ,المطلوب 3000 جنيه . \r\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\r\n', NULL, 31, NULL, 8, 1, 1, 1, '2', 3000, '3', '1', 0, 0, '2012-10-01 18:17:34', 17, '1', '3', 168, '1', 2, 2, 2, 2, '', NULL, NULL, 'عبدالرحمن', '01154992014', 'abdo@gmail.com', 'الحى الرابع', '5', NULL, NULL, 0),
(23, 1, NULL, 'شقه جنوب الاكاديميه  ج  < بحرى , شقه ايجار 170م  3 نوم + ليفنج + 2 حمام + ريسبشن , فيها خشب المطبخ , تشطيب فاخر ارضيات بورسلين ,المطلوب 3000 جنيه . \r\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\r\n', NULL, 5, NULL, 5, 1, 1, 1, '2', 3000, '3', '1', NULL, NULL, '2012-10-01 18:17:35', 17, '3', '3', 168, '1', 2, 2, 2, 2, '', NULL, NULL, 'عبدالرحمن', '01154992014', 'abdo@gmail.com', 'الحى الرابع', '5', NULL, NULL, 0),
(24, 1, NULL, 'ana aho', NULL, 34, NULL, 8, 1, 1, 1, '1', 13232, '3', '1', NULL, NULL, '2012-10-08 16:35:00', 12, '3', '3', 200, '1', 1, 1, 1, 1, '', NULL, NULL, 'منعم', '01112234938382', '', '', '5', NULL, NULL, 0),
(25, 1, NULL, 'A new apartment with beautifull images', NULL, NULL, NULL, 20, 1, 1, 1, '1', 300000, '3', '1', NULL, NULL, '2012-10-12 13:02:01', 12, '1', '3', 125, '1', 2, 2, 2, 2, '', NULL, NULL, 'منعم عماد', '01272244799', 'menememad@gmail.com', '197 Teraet el gabal st.', '5', NULL, NULL, 2),
(26, 1, NULL, 'aswerfd', NULL, NULL, NULL, NULL, 5, 1, 1, '1', 1234, '3', '1', 0, 0, '2012-10-13 01:30:14', 12, '1', '2', 342, '1', 2, 2, 2, 2, '', NULL, NULL, 'Mono', '', '', '', '5', NULL, NULL, 0),
(27, 1, NULL, 'ay kalam', NULL, 4, NULL, 5, 1, 1, 1, '1', 120000, '3', '1', 0, 0, '2012-10-13 02:36:45', 12, '1', '2', 123, '1', 3, 3, 3, 3, '', NULL, NULL, 'Abdoun', '', '', '', '5', NULL, NULL, 2),
(28, 1, NULL, 'My Desc', NULL, NULL, 1, NULL, 1, 1, 1, '1', NULL, '3', '1', NULL, NULL, '2012-10-17 17:14:19', 12, '3', '3', NULL, '1', NULL, NULL, NULL, NULL, '', NULL, NULL, 'Moneim', '', '', '', '5', NULL, NULL, 1),
(29, 1, NULL, 'دوبلكس بالحى الاول دوبلكس ارضى مع بزمنت 4 نوم 4 حمام ليفنج 2مطبخ وصاله للالعاب مطلوب 20 الف.\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 36, NULL, 9, 1, 1, 1, '1', 20000, '3', '1', NULL, NULL, '2012-11-09 16:08:46', 17, '1', '1', 400, '4', 1, 4, 6, 4, '', NULL, NULL, 'عميد سامح', '01000128004', '', 'الحى الاول مجاوره 7 قطعه 228 ', '5', NULL, NULL, 0),
(30, 1, NULL, 'دوبلكس بالحى الاول أرضى وبزمنت 550م , الارضى 3نوم , 3حمام , ليفنج , مطبخ تحت هول وغرفه للالعاب وان وسفره وليفنج ,الارضيات سيراميك , مطلوب 12الف , والشقه فقط 8000.\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 12000, '3', '1', NULL, NULL, '2012-11-09 16:28:10', 17, '3', '1', 550, '4', 1, 4, 4, 4, '', 1, '2012-11-09 16:51:56', 'عميد سامح مصطفى', ' 01006407089', '', 'الحى الاول مجاوره 7 قطعه 228\n 01006407089- 01000128004', '2', NULL, NULL, 0),
(31, 1, NULL, 'دوبلكس بالحى الاول بزمنت وارضى400م , حديقه 150م , مدخل خاص ومكان سياره , ارضيات رخام والغرف باركيه وحمامات جاكوزى 3 نوم + 3حمام , مطلوب 10.000.\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 36, NULL, 9, 1, 1, 1, '1', 10000, '3', '1', NULL, NULL, '2012-11-09 16:51:06', 17, '1', '3', 400, '4', 1, 3, 3, 3, '', 1, '2012-11-09 16:51:56', 'ا.سمير', '01022565144', '', 'الحى الاول مجاوره 1 قطعه 48 ', '2', NULL, NULL, 0),
(32, 1, NULL, 'دوبلكس بالحى الاول  دوبلكس للايجار , ثانى وروف 320م , امام مدرسة اخناتون, الثانى : 3نوم ,ريسبشن وحمام ومطبخ , والروف 3نوم وريسبشن وحمام ومطبخ , تشطيب سوبر لوكس , الارضيات بورسلين والحمامات سيراميك وغرف النوم خشب, مطلوب 5000 جنيه.\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 5000, '3', '1', NULL, NULL, '2012-11-09 16:54:47', 17, '1', '3', 320, '3', 2, 6, 3, 2, '', 1, '2012-11-10 11:35:18', 'مدام عزه', '01222203031', '', 'الحى الاول مجاوره 6 قطعه 169', '2', NULL, NULL, 0),
(33, 1, NULL, 'شقه بالحى الثانى 400م , ع شارع التسعين مباشرةً امام المستشفى الجوى وبنزينة شل, 4 نوم , 4 حمام  مطبخ كامل تكييف مركزى , تصلح لشركات ,ثانى بلكونه دور كامل , مدخل خاص, سوبر لوكس , مفروشه, مطلوب 2500دولار.\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 37, NULL, 9, 1, 1, 1, '2', 16000, '3', '1', NULL, NULL, '2012-11-09 17:15:32', 17, '1', '1', 400, '1', 2, 4, 4, 4, '', 1, '2012-11-10 11:35:18', 'مهندس طارق معروف', '01223918635', '', '\nالحى الثانى مجاوره 6\nقطعه 155\n 01223918635 – 26176620', '2', NULL, NULL, 0),
(34, 1, NULL, 'شقة  بالحى الثالث  دور ثانى  175م 3 نوم + 2حمام + ريسبشن ,قريبه من معهدالبخارى, ارضيات سيراميك تشطيب سوبر لوكس  , مطلوب 2500 جنيه. \nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n\n', NULL, 38, NULL, 9, 1, 1, 1, '1', 2500, '3', '1', NULL, NULL, '2012-11-09 17:25:01', 17, '1', '3', 180, '1', 2, 3, 3, 2, '', 1, '2012-11-10 11:35:18', 'مدام أ. عبدالقادر', '01003620275', '', 'الحى الثالث مجاوره 6 قطعه 56  ', '2', NULL, NULL, 0),
(35, 1, NULL, 'شقة  بالحى الثالث  دور اول  350م , 3 نوم + 3حمام + 4ريسبشن ,قريبه من معهدالبخارى, تشطيب سوبر لوكس  , مطلوب 4500 جنيه. \nللاستفسار والمعاينه ت : 01154992014  -  01023770371\n', NULL, 38, NULL, 9, 1, 1, 1, '2', 4500, '3', '1', NULL, NULL, '2012-11-09 17:32:48', 17, '1', '3', 350, '1', 1, 3, 4, 3, '', 1, '2012-11-10 11:35:18', 'مدام أ.', '01000152781', '', 'الحى الثالث مجاوره 6 قطعه 152 تقريباً  ', '2', NULL, NULL, 0),
(36, 1, NULL, 'شقه 180م اول بلكونه سوبر لوكس, 3 نوم 2 حمام ريسبشن3 , موجود بها مطبخ وغرفة نوم وسفره.\r\nقريبه من الداون تاون مطلوب 4000 جنيه\r\n\r\n', NULL, 29, NULL, 8, 1, 1, 1, '1', 4000, '3', '1', NULL, NULL, '2013-02-11 15:33:11', 17, '1', '2', 132, '1', 1, 3, 3, 2, '', 1, '2013-02-13 15:21:58', 'أ. ياسر ', '01001420520', '', 'رقم وليد ابن صاحب الشقه :\r\n01227472682\r\nرقم م.محمد قاعد فى الشقه الان:\r\n01002182089\r\n', '2', NULL, NULL, 7),
(37, 1, NULL, 'للايجار بزمنت بجنينه نرجس4 100م , 2نوم وحمام ومطبخ وصاله وجنينه جميله ومدخل خاص.\r\nسوبر لوكس.\r\nمطلوب : 1500 جنيه.\r\n', NULL, 10, NULL, 6, 1, 1, 1, '2', 1500, '3', '1', NULL, NULL, '2013-02-12 10:20:35', 17, '1', '3', 100, '1', 0, 2, 1, 1, '', 1, '2013-02-13 15:21:58', 'م. ايمن', '01112166231', '', '', '2', NULL, NULL, 2),
(38, 1, NULL, 'شقه للبيع 200م , نرجس 4 بحرى على طريق عمومى فى فيلا شيك , تشطيب سوبر لوكس,\r\nمطلوب : 850000', NULL, 10, NULL, 6, 1, 1, 1, '1', 850000, '3', '1', NULL, NULL, '2013-02-12 10:27:24', 17, '1', '3', NULL, '1', 2, 3, 3, 2, '', 1, '2013-02-13 15:21:58', 'اللواء محمد سالم ', '01010896471', '', ', الغفير عاطف : 01143072718', '2', NULL, NULL, 3),
(39, 1, NULL, 'بزمنت بجنينه للايجار يصلح مكتب او سكنى, 170 م , 3نوم , 2حمام , ريسبشن سوبر لوكس.\r\nمطلوب :2000 جنيه\r\n01154992014_01023770371', NULL, 31, NULL, 8, 1, 1, 1, '2', 2000, '3', '1', NULL, NULL, '2013-02-12 10:45:14', 17, '1', '3', 170, '1', 0, 3, 2, 2, '', 1, '2013-02-13 15:21:58', 'الغير : محمد المصرى', '01282003942', '', 'جنوب ج ق 255', '2', NULL, NULL, 6),
(40, 1, NULL, 'شقه ارضى فى جنوب ج قريبه من مسجد حسن الشربتلى , 170م , 3نوم, 2حمام, ريسبشن2 , سوبر لوكس,مطلوب 2200 جنيه.\r\nللاستفسار والمعاينه : 01154992014- 0102770371', NULL, 31, NULL, 8, 1, 1, 1, '2', 2200, '3', '1', NULL, NULL, '2013-02-12 11:58:21', 17, '1', '3', 170, '1', 0, 3, 2, 2, '', 1, '2013-02-13 15:21:58', 'محمد المصرى', '01282003942', '', 'جنوب الاكاديميه منطقه ج ق:255', '2', NULL, NULL, 10),
(41, 1, NULL, 'فيلا دوبلكس حى عربيه ارضى واول 245م, سوبر لوكس, ارضيات باركيه وسيراميك, بالاضافه لحديقه خاصه 116م, الارضى اربع ريسبشن وحمام ومطبخ , والدور الاول 3نوم, وليفنج وحمام , مطلوب مليون و400 الف.\r\nللاستفسار والمعاينه ت : 01154992014  -  01023770371\r\n', NULL, NULL, 1, NULL, 1, 1, 1, '1', 1400000, '3', '1', NULL, NULL, '2013-02-12 12:43:36', 17, '1', '3', 361, '3', 1, 3, 4, 2, '', 1, '2013-02-13 15:21:58', 'أ. خالد علاء ', '012273337340', '', '', '2', NULL, NULL, 8),
(42, 1, NULL, ' Marina City ( El tagamo3 el awal )\r\nSemi finished\r\nBasement floor 173 m\r\nGround floor 184m\r\n1st floor 176m\r\nRoom on the roof 51m\r\nTotal building area : 575m\r\nTotal land area : 800m\r\nTotal land + building : 575 + 800 = 1375m \r\n01154992014 - 01023770371', NULL, 31, NULL, 8, 1, 1, 1, '1', 2700, '3', '1', NULL, NULL, '2013-02-12 13:07:49', 17, '1', '3', NULL, '1', 2, 3, 3, 2, '', 1, '2013-02-13 15:21:58', 'الحاج محمود', '01006237494', '', 'جنوب الاكاديميه ج ق 151', '2', NULL, NULL, 11),
(43, 1, NULL, 'روف للايجار فى الحى الاول  بالتجمع الخامس, 2نوم , حمام , مطبخ , تراس كبيير وبه زرع , سوبر لوكس, فى فيلا قريبه جداً من سعودى ماركت وهارديز والمولات ,.\r\nمطلوب 2500 جنيه.\r\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 2500, '3', '1', NULL, NULL, '2013-02-22 14:58:51', 17, '1', '3', 80, '1', 3, 2, 1, 1, '', NULL, NULL, 'د.حسام', '01001642315', '', 'الحى الاول مجاوره 5 قطعه 141', '1', NULL, NULL, 0),
(44, 1, NULL, 'روف للايجار فى الحى الاول  بالتجمع الخامس, 2نوم , حمام , مطبخ , تراس كبيير وبه زرع , سوبر لوكس, فى فيلا قريبه جداً من سعودى ماركت وهارديز والمولات ,.\nمطلوب 2500 جنيه.\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 2500, '3', '1', NULL, NULL, '2013-02-22 15:06:18', 17, '1', '3', 80, '1', 3, 2, 1, 1, '', NULL, NULL, 'د.حسام', '01001642315', '', 'الحى الاول مجاوره 5 قطعه 141', '1', NULL, NULL, 0),
(45, 1, NULL, 'شقه للبيع فى الحى الاول تحفه من اجمل شقق التجمع الخامس, بحرى, قريبه جدا من التسعين , لها جنينه داخليه وجنينه خارجيه,240م ,3نوم , 3حمام , ريسبشن 4 , غرفه ماستر, اول بكونه , تشطيب مميز .\r\nمطلوب : 1200,000 جنيه كاش.\r\nللاستفسار والمعاينه : 01154992014 – 01023770371\r\n', NULL, 36, NULL, 9, 1, 1, 1, '1', 1200000, '3', '1', NULL, NULL, '2013-03-11 11:04:20', 17, '3', '1', NULL, '1', 1, 3, 3, 3, '', NULL, NULL, '   د. محمد ابراهيم البدراوى ', '01111105527', '', 'شقه للبيع 240م الحى الاول م7 ق213\r\n الغفير ابو محمد : 01121528988\r\n', '1', NULL, NULL, 0),
(46, 1, NULL, 'another test', NULL, NULL, 1, NULL, 1, 1, 1, '1', 450000, '3', '2', NULL, NULL, '2013-04-01 21:03:18', 12, '3', '3', 123, '1', NULL, NULL, NULL, NULL, '', NULL, NULL, 'Moneim emad', '', '', '', '1', NULL, NULL, 2),
(47, 12, NULL, 'بزمنت للايجار مساحة 100م , على الوجهه يصلح مكتب او مخزن , له مدخل خاص على الشارع الرئيسى نصف تشطيب .\r\nمطلوب : 2000 جنيه.\r\nللاستفسار والمعاينة :- 01154992014/ 01032770371\r\n		م. محمود : 01001350036\r\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 2000, '3', '1', NULL, NULL, '2013-04-08 13:08:56', 17, '3', '3', 100, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'osama', '01154992014', 'hayathouse89@gmail.com', 'new cairo fourth quarter', '1', NULL, NULL, 1),
(48, 12, NULL, 'بزمنت للايجار مساحة 100م , على الوجهه يصلح مكتب او مخزن , له مدخل خاص على الشارع الرئيسى نصف تشطيب .\r\nمطلوب : 2000 جنيه.\r\nللاستفسار والمعاينة :- 01154992014/ 01032770371\r\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 2000, '3', '1', NULL, NULL, '2013-04-08 13:14:25', 17, '3', '3', 100, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'osama', '01111105527', 'hayathouse89@gmail.com', 'new cairo  fourth quarter', '1', NULL, NULL, 0),
(49, 1, NULL, 'شقه فى روف للايجار 200 متر  بالتجمع الخامس  فى الحى الاول على التسعين مباشرة وتطل على البنوك والداون تاون       باسانسير خاص بها  عبارة عن 2 نوم ، 2 حمام ، ريسبشتن  ليفنج  ، تراث ، ارضيات روخام  اسبانش + مصرى ،  غاز طبيعى  \nمطلوب 5500 جنية \nللاستفسار والمعاينة : 01154992014/ 014023770371', NULL, 36, NULL, 9, 1, 1, 1, '2', 5500, '3', '1', NULL, NULL, '2013-04-08 15:34:08', 17, '1', '3', 200, '1', 3, 2, 1, 2, '', NULL, NULL, 'hassan', ' 01013412079', '', 'روف الحى الاول م7 , ق41', '1', NULL, NULL, 8),
(50, 1, NULL, '\r\nشقه للايجار ارضى بجنينه فى الحى الاول على التسعين مباشرةً امام البنوك ،5نوم ،4حمام 5ريسبشن ،4بلكونة ، 400متر، تصلح ادارى او سكنى ، هاى سوبر لوكس .\r\nمطلوب :- 10000 جنية\r\nللاستفسار والمعاينة :- 01154992014/01023770371\r\n', NULL, 36, NULL, 9, 1, 1, 1, '2', 10000, '3', '1', NULL, NULL, '2013-04-08 15:48:00', 17, '1', '3', 400, '1', 1, 5, 4, 4, '', NULL, NULL, 'محمد', '01069000880', '', '', '1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_ar_UNIQUE` (`name_ar`),
  UNIQUE KEY `name_en_UNIQUE` (`name_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The roles which can be assigned to the users';

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name_ar`, `name_en`, `active_flag`) VALUES
(1, 'مدير الموقع', 'Administrator', '1'),
(2, 'عارض', 'Seller', '1'),
(3, 'زائر', 'Visitor', '1');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all states of countries of the world' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name_ar`, `name_en`, `active_flag`, `country_id`) VALUES
(1, 'القاهره', 'Cairo', '1', 1),
(2, 'الإسكندريه', 'Alexandria', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subarea`
--

CREATE TABLE IF NOT EXISTS `subarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_zone_id` (`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all areas of zones of destricts of cities of states of countries' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `subarea`
--

INSERT INTO `subarea` (`id`, `name_ar`, `name_en`, `active_flag`, `zone_id`) VALUES
(1, 'منطقه أ', 'Area A', '1', 1),
(2, 'منطقه ب', 'Area B', '1', 1),
(3, 'منطقه ج', 'Area C', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `mobile2` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `photo` mediumblob,
  `photoContentType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `role_id` (`id`),
  KEY `user_role` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `mobile`, `mobile2`, `email`, `address`, `role_id`, `photo`, `photoContentType`) VALUES
(1, 'admin', '6712fb43f632de3ff490b360ff2169d7', 'System', 'Administrator', '0111 664 9998 ', NULL, 'mallamm@altagamo3.com', '11 fardous street cairo Egypt', 1, NULL, NULL),
(2, 'menememad', '5f4dcc3b5aa765d61d8327deb882cf99', 'Moneim', 'Emad', '01272244799', NULL, 'menememad@yahoo.com', '68 El Tayaran St', 2, NULL, 'image/pjpeg'),
(6, 'memad', '7c6a180b36896a0a8c02787eeafb0e4c', 'Mohamed', 'Emad', '01001728434', NULL, 'memad@intercom.com.eg', 'xsxcvc', 2, NULL, 'image/pjpeg'),
(7, 'aesmail', '5f4dcc3b5aa765d61d8327deb882cf99', 'Ahmed', 'Esmail', '01001234567', NULL, 'aesmail@altagamo3.com', 'New Cairo', 2, NULL, 'image/pjpeg'),
(12, 'rmounir', '5f4dcc3b5aa765d61d8327deb882cf99', 'Reham', 'Mounir', '01728413', NULL, 'rmounir@asd.asd', 'sdxdscedfv   vfecdscvds cdscf sefcd sfdsv', 1, NULL, NULL);
INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `mobile`, `mobile2`, `email`, `address`, `role_id`, `photo`, `photoContentType`) VALUES
(13, 'aalnagar', '5f4dcc3b5aa765d61d8327deb882cf99', 'Amin', 'Al Naggar', '01008055802', NULL, 'aalnagar@altagamo3.com', 'Menofeya, Fayoum', 3, 0x00104a464946000101010060006000000045786966000049492a00080000000200310102000b0000002600000069040001000000320000000000000050696361736120332e30000004000204000100000040010000030400010000003e01000000070004000000303231300504000100000068000000000000000200010002000500000000000002000700040000003031303000000000202020200000001c50686f746f73686f7020332e30003842494d04040000000000000043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1e0043010505050706070e08080e1e1411141e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e001108013e014003012200021101031101001d000002020301010100000000000000000005060407020308010009006710000103020403050206090914070705010102030405110006122107133114224151613271081523421617335224253462727375182635363743535463742744456455566576464766001c0100020301010101000000000000000000050603040702010008003a1100020103020305070205040301010000010203000411052112314106135161711422322315527224333442162553000c03010002110311003f00384a322f2e66331e2312144e202412084f693cf3a797801d00cd807f097323230f7c5f2d4c3c262261345ad0b4202e5f484903453620072b2b10294dd1ad6647421a7357533a116f5c236324572d004962465051014852526d4006050b376c10331c0bd494054c0b0b5a791505dd925b1c775742770bdd913a6b3e29674c1e1a5a38254f152951234a0e50595b777c3e70000f0903537e1d3f580f43006e58745e40557d7331713a19322a70236e2b4a564e68475e1361d49e6e48c6b45e262a313f6b533172592a6e0752371b613b2ac69d46256dc5931c24251247742149294126da8102d7b9185b641a19145b734d3634121f45316d172929141a41d3a77b6c7b5571557a3323e584ae2c6241056d445874367b220063395c5bcb927f055a59733166073a6a540d42de981335472a0f2d2f2a295e6545744c1c4a2d3615395c0950da9407037153505657ca8125263c0f714b403a6f624007086b3331461c641a423050d29529000d255b177d400e7c6d6668284a2132cea6e3a1a8080c53765ecab5130c7c2f3f4c67deac2e25664c063f274666524ad38b561446db9170515909094f406707121b5f4a7a2a265675114d7d1c460138da9d6068d588020350240267143a014a351dc8bfd3887944576c47622b3a57312e2d0d51294a0f4d6d7b2fc9a97851623447535629615d4a000d4179662cc2902060401e561b6c4d623d1d3d2bd3a35f33ca8f14344a7d5e1d4ed4a43653314a4a560906d7b230473d576e2e1b470f321a1f11016f66674c7a3fc6b91101ea8b8e44541a5a7e70076f5c06cebc407b274ccca973266e137a3a224d65d0b75402490e28585941571837721d23265a34d0a768162a124a053d302c4707141151103a1a645228297624d89160361e2544c99130d2aa444e731913145c1b6c1b001b466725644f4c54466e77ccbe5f434a106e083e076c573850765f4f293e095c62395b28094b3a71413b441b604d5b015a5c616571525816411d3a616559de8e5f662c774cde93214442561d5b45001a737528647d1b33375462542254767d6d253e2a0902de974e265e39554f22452c0d784120d3955b595b2a6d47dfb710161b5b32493b556a361815c4a65f05492d6a052a06532d2fdeb15f572566daad17384d4b3d2e5b404b6f39f2808bb6746c713bef819539713a586a3a232e633e1408d7b8797e3c0a6a6a4a1b520d731d5b161c712501634a2e041b05740e543d4a56146e3b253f28055d31493a1b15dd82034c60134550666015561fc7880fd4b94a374923263d6b4879661d5b084213124549033a5a1c0d7b2a6f6d515141656f305a492d4161285d4c4f3d2e78757758d7a53132330538694d5a5401435276277b5f183839ccab2a2650296652317120021374770c2a4a142b0c1a2f3d25d0860213641b580c6dc8b3d8a8e991995349725212414e2827601c3c703b46db806a223a4e413438643d604b002c0a4b6854d9b9325256044a544848355437cdb65a6956702411373671585f09dda769021e6422c7ba3e19393b2a5b70502b755a53734a752c024a0a04026e6f795b32325d525a1935492c6a796c4a216b7ac5805dc5ac41014872421b232e3258650a10520a63671c36362a7b3b5b0d3c2f294f1262c59b504c327a5c5c7c7c4304432d1238172d4064627b34d3bf5856c49a4c15cf9b516104262c49564848244402460f644702553521716264d69e6515272c1b492a201b5f70466a785a7e63cfb3df8a7919c7a52d34766a1dc5a74a7e6b195c5b750a1d53297c41692b6f7d7d6a744813225136525b5ad1a12ad3b948093a05c8b00060670a083c4e49730b2a2a0e3e5472006e00773a172c44c9b23527251f4243617a07670b27626d6f035b5600207f4715294a5f42472b49633610071c5b513e321456513031662a117b4862cbbe777c30524c4c255574d09a5f3752d1a237e3849a3c1226435a36ed8dbc6204705c111e665b2a15361b3c006f3f26777c510003795a1e7f6d62182f7f49475f74c78d494f5b7e31151b522650730d450a530a52752b40d8bc70592a15726b13392d55792d590be891b9204d4f4e44687d6e46090240c3ae4b1653516676382ad5aa630b51245a5622ccb9730234797c1b7665394f284d4a6c3b24531c4c62522b05603112234b71252f3416291676c6aa5d41521b47677d680e2362147b7c161e6e2c6d0c19447e4c304922726a7567541e49655a7741d4941d207249503b4a4f713d18df880d3f6b3c63631b7f350c2a707f2c20461ac2920d315f327a6856103335d4ac7a0f25601d46043e2a207f2b1100527bc9bf0f32cdb61f134342307c000d1d651a1f1156117f7e37281149472e033872550f4ac3aa281e3b492d7d281e3e640037271c714869145c416a1c20570e3a1d4507197d315506c3903664204f040538547bdfb5482c3b31445d4c480c6c2d191c522a70720148497b5f0227690c50287c641249155a5b7952152d0952521e76525a602cdbae205f6f5c00592e415b4cc5af6aceba19432d4b51ee82ab04dfa90c185c7546247d4b6d2b3e6e0103080f39243a4b2c5b1d4b5124e2b5a25f643d072a7223761f7f3123665d5ed3b21c4b6826e3a2946c6e7a6169485373633662250807042355051315142d28503d46072b262261da9bd2ac18447b39622f604f1e78633824dfa52b6d5f24435e0356291f0b406e48193f1c522d125725605e73632759432d4a252e51071223494a541242070633524544525e1a182b572e5c40577553223b3b7010507d163f190d473508355839553035705771523e14313c191c401fd5a5765240646818676c1e1ccd880254490e222850003b1c397064005a4700067c7feab7840c42607150360d0f234540503f315b2d62536c55de9e1f5b1e0e193e573e196f1c1d4a005d787c7c20393c53742a547b120d2e7e36763f71426f3e7573291b553cd1976356357c0a745bf2a4a1b02c05022e77d88e7735cf9427345c1e552443eda49264325656cb9b0a03715d1c56083b6f4f1078581a307d256b0e221b6b7e400061463c715515cca87130d8860b01773cccb424d6b5222a536b5f555c5b6824365f543f747222453e5334c3af1715646d4a55467d0b31421e024b157e527f3d5049504e0970492e040b5e7f7c1ae8bd96454a3362326d6e4e72002762465376134e5c3873577d52511b3b540b5e46caaccf83192e5631475157792b6d54761539522d7d2d282b5b187f6d6f3f603f371f4a6e5a347c014e367602281168336c6dc49601655f31595c40502e596268cc960c40642764d8a9444f3a015e533c412b0d3e52564768697b2a7109097504743b04207466533676daa948075504671e14d8be1ad4b856561c0e7e2b6b315b65094171cba9425a7cd09c486719211d244e6d19076061766563661b5149410d004901741d4357c39e6a72d39d0d5a42485e7a746c134179e98ca7154a5f2d0364724d383b07304a713932344169386e446f65581c5b2e1f76657627c68e096d4c306a0c1a43287944575eee9e846f7c4c5e5d1e4664ceba326a4932241528776b7370010e22365a711b3c677a2d31441c531222285426295a1b4d66710426296c2a483622560364d3ad141f415b456ac995075a4dd7b85656604e6e64304b220b6e1a355f6a6c0a595132323906354a3b4b622b3af48480a013742b16131f371e44525c4433175228cbbe45692e033d7d35657c390c725a531c03403c4fc7b1115074c68f20773f7a617127681433da8e46653c0400dc8b0f3c4c5f14387c781f214c4c4956107f18714f4931523d5d6a293300685e62587a2e5b2ed587244925024241213b5805c788c5972c4265dcb1391435071878257166742d4a045c496f747323200e012a0dc9941d6d0b212601773e371e2e6b7d753e6853da984b2b0b0e15213e2c20cca8ca89314421c48f03707c142e0f3c1c775536746f230e1c31695366d1a32529295221292a37523a280e303d6879df8731dca81e4212760b497623d08c2338734575cb9d4b4d70521c60e6a4a727284cd696720a1b4c501272250214203b75672c37506d36375569492236386f45710f152836654a5a29293b493a45d49b1e240bd5813e146532065a42d493726f46143535cbab581d36d693540b1f113c2b22752c261c702336716a67447a740d47752d0e7b0f5249006e4e7c5453711f4f705b7b4c5a2d39496d68165414747b4840045a4d2760773a6579686a2d63797e1f5c20486d211c0c7852454a40116b123d5adaaa147571182d77013b13ddb107617c3d70461e1bd1b92e654a25092a6c3d3a7860655c3f4b690d004a401b766d682f6416724cccb9201835345512201b15036b3f5441236c7d37c2ac07526c683d6f50750e24050e0f1d383e50011c55564c4e746273211542320e141b6c38745b07352847050062694b1c57285470337651196032424c567b416d7a2d4b076d6f114e5743694f524a273e2125c7a94e500a7420dfa81c78632a3c293e704914ca8b1e443216d3842438201d4ddb8d230a5f096ced96b376627368152e10643656d29a52490141605a123dd89e110467004313077d7f2f103f1f4d0f7a70225629022b120252544f0700103b466f59622d5533794b5138285e1bd49b6b42747506107f0c00562e6fdd931a614e772d352142453669415117515833393016644d295b6a0a4203097b244b043f6c43292406656f383c75590a6b022209252e76694b7a5a5e501e6a5a2705744d3a5d08067c06291369370f0918457565c2a5693d5065507b4a764e611e5b6de1868a0f14330c3a0e64680fd6996c3c1908741043402a6d7f1f2c2bc8906e6175423b19494b29d4a52d267a6d35542d35466e2b7a6e743d361b1c3504031e43622f38d88e56133a2d325f123563196b355a534a664c675334692a6d221b0d31e9b2900234047420236a53274a4c43590c2118c9aec9a6776b076300462a7233540a546803200556161906352e47315465263a682643296e631507481a0f51611703deb16501285d210d04574248071f2c39042509202459235b6c016ad4b84271e88288ce9732212149035a7e706def8bb5135343412e0a6d49436c025464dab604192c137c4a013c470152130a4edaaa6f2316172b032563251a0e79436d0f08625b716a69163c636b6607727c407a2e3b115c157801735d3e66124e423116704b702002414f4d6a7158720953ec92a752122d48174d62c5a22b32367a6955461b1a4746761c515e0a5b2a35477e161e20cfb25c4c294b6f37711f42c2876378493a49524152641c6d2c79222378187144d3b57ae391b8194e5a5f56340d3434770f18700fcfad2a5e023309147d4c7a0f5700387a5b58171f3454576b532f6f704641077b6c760f797a476c6d580e3e2c794c474950362d5e3f4170324d6c62266f03276a280801295d4f67da941d25674e1f623f5643787d387c562449254b563607df896355091e0b5b700c7a033449304a5214d1bac293700f786978177a6fce830a465457192e2d280b25024837dbaf516f0c5c2a2f2c4c2f40c5a6235471d4a838d4920a0e01003600387c17080323154d3f670e0e6a1622371813470b49275b7603610e39cb9723313e6f254e2d0a0b1cc2944850002c036fd483016b5366114b1a00d4b712266a223e44762f295e262827033f6a6069333559c685126b5547396a510501c4800003724e1f224467546943392903705116403f48480673453548506540cb9518345c5b5c152d024f70770d2e584f636b2ed69662146a590400637c4148364fefa5905a195c62287d195e220e341c664b56302a6d5f771e541d377638003952c5a4656e50115d032e33754e223a52165375005ad28700545c41007b0c525926d4a2d9993635dd9a72395d47246f1c5d734d0f3e652905285bd4b9ce9432d49d1a1c37243a7a004e1678c996780b3d6613497f4b263315004227494e5f4760660d295326127443c8a77a5416693c21c5b72129007d261f30dd915d166d5d74617a1d26361c79535b442661492d347268674252500016d5b76f260e433554673626663616390b5a23651b3f4e466c68d9812a4001236b1f134c5469556844574a54537205242a4a50362149200416077e5b2f672f36223c5c7129486d0d4f7909236d496e01271a404c347865e4a1b849106339695c261165285e0b03781e11353f3865da86567941663bd0905c69246b4876241174525325555c187d6b45314a060d203b7042701f0c705449794c2d137b4d3b1b1f51126970021d47091e077255245c7b13556b2565306a6a1251292025165b553c0d5e602815672975d0872905d1b8045f4a13415b6f34427552143a146e0e1d5b47563f3373306929790e69131214d492d6bd75596d0025cf9e4d68004f68720f517a11485b6971624868da946d57d28a092f111544665e78c5b416710971372952375a452e4f1e285b1427045ce8ad8d4766562c531d0b1f57745c57323f72d8b1072a38331e5a2a5a4d262cdaa446314456545466037d785f143e64463f1b541d7b38eeb4971a05693b686d7b0d22712c011e38146130377c335332764b55dc8c3061317e117b6e736f6a13ca8105c38d366e12ebb5b10004c5883a606c7c36786276601e60695e123911790c6654782a54533a62221263534853456f40524675302a0ccd97de91495853495a46c8a64a6009426e4b4b240e3175740a11780e0d71544d3c5a494c36d493634023dd8b2c28717b7207307003d2b9672a39d2bd2a2661432d6c58522a765c6d4f7716172c7b117957247e1e3206546912296429526748d6b75e706d70304d6c725413cabd5c7206103931506a4830344dd49d16485b2b735e126a55007e18380747377f0d3f15394a7a4311506d4f4e77481e06d8a12a2711385a0b3834c59e44180b484d52dd9e2d7b3248774b7547792a3d7c32eca59f517b6f104662cdb70a2a50091e62133453721979766d3b325c72586e0d021604480460355338662a347e2058690c087c346b79381c40283b570975261035612b347c59505341d38f4701685c5d6b1b6a02201b15172a5063371a2664cc8c32d286daab404a37e381b94e2e45484803536f3d67047b76766f3b4959d5a7316d4d346b68723a14e29eb54a43651a6ee3a7980a756a2136065b404328eb9b8b141a367544042b045812567749d2a34009273836c293724215007c0527314d09c8ae370d2a5143167d29d085d29e135c5fc4a063351c1a542b13524d0a0a5d223c0e4b53cea44449506f43752b647e1f3b5f1e214b6329d292345d36077fc78132140e2f424e1f1b633c782ec78b1b567a4c747b4c49daa25725c88f2a32592578286f623b054d15436663311b4a4a2c004d1100436e0875d69b494b75687b5b2a4d5a7e063e006169722d26311909c7993e3d19d3b30e5f546a7372411d3ecd874237d88dd993387f5cd1976129d5b932510d5d4c1e143575497f433f35671cc99514484d311962456e252a4a024f251f3c363b4119204b0e60caa31c5b743550613d6aed87b25c002f41596f2f1e133112640047de9d6842486e115543257a72663bd29e711555655254d0855ed380d9ab2571753b73d4a92353764212147d0b093d14474b1b5d247c5e5228f0a4a2a2c38e524a435251040b6f4d6a6a637000304c54324810ebafa8151461291600002e7c37245754481c39647e184019d0a945192cd4bb39746a547e3a1b044136012424edb1be19705354536ae5b28779721b58251ad684083c46733e4e7e744071721811294d14111d4f367452566a067d73dcad2656555547d0a82d52486402754669403616206c5d0a5961552a0a291708305f78c2ab1cd4874e565803deb74e701167365418152d5502753c12480a361e0c7c1dc99d4c35372b52702df184848b25693d5652cb875f4e7067643c13035f0936103e585c0f2a35785c2e444c1e656221014b517549583d41055623df8b215769e38693795d4a4ccca47a3a39672570686f58293a7c24495c26c4a94ad29404296a3d1200dc9337c2bc387b2b19c7b0557e6b0d6e0e2825656b6c1e5625001d2f065907082e6600003f3f512b573e4c06730565ec9498527528436a1b24000008231a544d736bd5b7084855792757755e44793c6c1e667a4d10525b52d2902644000002d8843b7538716770312b5400c68c202738caad264c4d417c4a2c321c692a32584950410b524f422c051a33642a05500b3936494c424a60271b4d761d3615727c4f54641a5376361a6a061f5e24446e762c162052746fca925b2b70052b254e3a6400001550597e7a790f7509252a165b31205d39357f2f035615325a47562b5514503267454e57edbdbc0822396b4d264b38577e4a125240346d730ccc990610794443156b747c07d4a1dd8470302619d1af12505a41351949da9d2a5b4d5865232c41726a2e626b2c665a5063573144541437076c6b46684d3d724c547527392e3e2fd0a5361b1b1c093b33385f3574282c4b593e79dc8c26334b2a176c03465d3f3841246845542d436d29011d127a781c205505422f47c3ac13d4b712124d42521200020e61d3825d657a6a503b2218456336704956276e551f6e4b552c462a131d7c2c25746a285806061c00005c57e6aaa4c894436675396624746b072166346949610829d2ad2dc6bb7e236b617f3c6553735e53c3824d360477134a542f0059256908520f5e47656d3d157214676e474c453e79234d6c4e5169127965402b553a6b623f395f3c675a453d6e4c7a6b59522d316b49da971a532a6576d8807c4723dd8f411d31381c4b343b616e1b412d493b60d68b3cd89c423a79535f0e13761528370042462c420b6f32066ceb9fa244597424532434615753032425253e17d5be49423344762d52554b763525622a7f0e144e54144d425bc7b328366a483c526d7037c68a7b32194b2f484b484b2504052c246a501e17373f4e24144d6a712b76701463482c3a5b2b28415048dc917a2755690579497b4e06642c524d25247862cbac56134c2671754e4761156f590a2360246fd88e5c1c7d0f34c391475d42343cc49cd3911d71252a37556a000445265f78d69b6f3b36ca95034317605172263c571cdca625005b5006601b7766c48009271842141bd4a2093d026c3dc79350622a5b1e47741e5c707a3d1e35494e6f1fcf882063d6b8744918073f7a18741348eb81b94925597e36417f1658d6ac456f577d5918475a743c62123adfa9157e7c0d277f4c4ecebc354a38db886d4230e4bc9f053c1c6d170a457209365b65642b2652774c597c2a694b1f1c5a29482f01654f1f4f1c49665367551f4c53545a6d2b534042127c003d48447772367c4f3d2b66207358773a736f76343b0925292a04566815213822790e324a146a162117596f2a5e6bcc8dd6ba1b620e640cc68c355c58421034004c2f14d9996b245011570555592d6f03652d434f0772796c3a2e7c3e5a665d1ae39686550b0136d6a43d3d6d484d4871d1b55b69307d1c7a7d385213cc9a71682b002070544b7f792e4b682e144e3e6a4f5206386d4a3e437f435840d7b35e1ad2a66a3925486e2b5e2a64295677760ccd996207d4aa530e0e4b522bda8e64357b4f434d0d070962383c74077ddf811bc79e436a4a1f5b48426b42163618291e3cdaad6b22674372e6979416dc972e08650240774a490d51d6a243734e2a4e2770424240265d79c6893c0d3ad5ad730a223e5b001a682c72381371173370727665260e094fc4910630600946220b584563631f436f4d4770150a560310246f3b0ad0907c6c093e40127a62c99c17550e22753602d4990b52014540136d7d1a1b35784f53723428766d47351f363a582e145a1b0a1a5d5b017d58200c726bc78965181f694e1e593e4dcd95112b0f2971202741514c7b3a020a795e161618735d4a4c7b130e55077361d482751f3e094fce92262e4e754575162a3a56771629664a1e6f656171706e2f526d4148346b286e217d3c6bc8844b1e11604314691b3b4acdb816110e1e4c34d29c51191d082662752c04590427747a0c75473d444d6d3e72546a527a557e7c536c5563dfa1273b0e7465031c5a4d7b4c6b12325c7216ec99b23c5b39241f0302313a2b716366d4a50f3ec98d7a6c2e564949252d227249707f0034c7ba276a34d9860c0e36180074276a5a7421202509160948531e185400532a414911c493690477246d6fdaa713657f4141d1a558c38c462a426361d79d5f541f403738c4b6417e4d3a6a0d054972234e1e4b201d486d44056d31706877294e684467d4a0d28a46d7b01d36386d6e6a3b771f28593c73542b4b6928605240536d1516d6b7520a2e49171a7b623f0c1e716a4b7a0b0e425c1d097e4769263c28ce8e68d5b83a63655f782ac6bf71776d5a2e45637c31562a67342a4b37076a7b0a0024170e6e2d6666c2b451411b1c745f5f64432d2e6a183e620e352a4a78d99c144610764c494a664621426d4e7400471f752bd19c3f276adc8c7e6c6b7466404f643adcb20a2e0700493c785e035d0a1f327f4f181f6b18687a1c5f36363e3c17396513342a59ec97a466282e04d4b44952461b752446594155517b2773121b0b21480a2f39752d262a046241225e734f5a2a4b2f3416603b637040206230de9c5409430a4d723a1c4361514140284a5237122c2f7b2424693d4255403bc3b74732135a2d5874701b3d713217524726456b763f3e0d385e4a5151d2900074eb8f9b0e067b44375946214556454adf93544a00325b050d3855140b0424004e0e3f3b731c522c4f7c052874747618653d12386165224c6e525b7e3a5412d7a93b0807503054311c655251116560c9bc5a026c4027c3ae005de195936c47334f3628141b0a5e4e703c7a1f0f49200f6f5824372703330661655d5066147d40247b1e500148357d4e6955525627d7b25507d29778531b387745541d2a3e16756c120d427e0f290ada85304d3f29486235072d610c165d52605764042410024023732301475716591506333d65efb4b716660032530f0c6a387578071b474c5676660e20e6a994793d0ece904676253764286e5262123bc69d1156734a4c53dcb4572e39210b486b5d01511e076b6e52715f3654440255753a1c71296d03e1a58256d2a503493ac3a8cbb4c7a716c4962a6602292f59284a540d7e62646dd6a1317030debf3d17174d262b5131525b587d5dddb748dfba0f30553855427c592a23190e29205a045311c8a30c0f05d39e532e0f6c1f7d310e013c516d2e232a000356396cc89a572a2944104f5dd79b324a4272297a7946d7ae0826244f71296852463e38cea26c516534120a051b62501c78532408136e71704a5d094adbab56dbbb2351605d6bc8b46a350fc6925560012a360b60764e551e63354a44514c561d4a7e0c3852674e030075022449500a49202302c8a31f7a7173716f7123532a7225412d73017d4b150214102c4d6b355a722f1a29264c22291e7a3a4d2a2901171e647131053964057a3b0d5e415a277b24747d2adbaf3c4b3053621d212324043d3a7c45627236157a3d415e4454634c78d2a93c42373045096208685f48165c653d636b0325cf8b3f4c525f0755626015084d324a2f47566d20290547caba6f5c1cc3991b4b486707706054470633354b72333eeca3b96e390ad2aa573274360f3b4a7e2b52091f4f4c7946cab42979112d5546633b4acda82a1b6e3f1d17586d2d6a00171b195a735b515a644c0f3703565105055f58356fd8af70715c513a780a7a5976356a7e6c7e270d1e7d353e1570053e4c146129e9a8bf706e005b0c6bcbbc514e7d504918143e012a557f0e06447a3338eda9b52d0a1622246d2813487a28c8b671554729c3beec8f881c4a1a1227090a565a490a7409dcadc39c5e344929755626262d37740057023e042e2e31623740056bc994536d280b0948717777c7946811436c31502f547a527d4a4c1ed3b57170187c2acd82470b370851334e1721161409667f5d245f0b0b5065786b2200c59e17180dcfbf0e47035f0a536e17246914197f693f3b0b391737516653db994e79c7b47945452f04caafc3a63a382f1f3d69527f2e780845485603042c7314206275074e1ecc95182d21385c54002e213b637d2a6162432d3c58750e2a2950363e62725accba6406333e232a23382f372d367424d58203707412067c585f04c8b2210337c5985f321c5c50525f524827154d373376761d624f6ecb933b704b29043f6209245f50503b5a04c98f543827482022cbae102d752a4a271d451856da943526d1990d0142d7bf1900137d795f0d69792e714a6d36cfb40f76145b43207acf8d334c0564072172054939d5b71d20d0a71c5212213d5412001b2062440d52136f3f2a38437121541c41d2b527524537075c49690b3831220338710b0a01477d63620d046b595054656b4f4a7e3351533657252911652c1b1f3c732d52386b7a4dcaa224007f3e086d4e3714dabc14052f2b3a60437c5d0a78637f3e326d40137521035e360c2b444b6d2a714ad6bd2d02041b482662244e3437562b641a0a23551a6d4e2749553e4b0b21346527761b61d486730e197d6a01d4b0db896d2e14032e03246c0836dc9152c8b0673d1e1b4b1927432a643f4c2319de8c5e43057751796a0143241077383c313c243978162b35cb9c5c495a1b000bdfa5156c742a6a34d29b047f5b2c254c45707e300b53180b36d7a1e59cb9363a662b7a0159364a134030553325565573304a756a52521a49584051476f0f1f32204a65512b50ecb492413b6a1a78230a2330cdacce930632292033155e42487d69511e6c7c351b60682c5f793e743a66577c311b70310c0b30c5ab5225254e45624475751445dcb14846241c1e776a29752a594442415a6243363b770e166f001456783f5b155a7b653029545279261f00387d7f7a6f5b5f44520362250246256a7f066c44c6a94f55182548695a18692a01175829d88e500f1dc4ac474179d4b7617c3214021454d28a462d3d41363c386f7045627a623e40555a6cc8bc556f3c0463152c524e2a46d4a90c3b062b0d21240d4d17224dcd85655474545f20d2a4645e62461872266b532a04633e5f7922321d54d4840e5e1b6e5c797045673051655168492e623b11605208423a7b226b575c46407c4429711f3d635a4fd18d1538df804b086b052a4d2553297d07534a0e0042106754c8a214121a4b40117f16624f50eea48a497dd0a4ca996a5418526671316c2d093d4d71514d460f325f68454124ca9d5e4667465243382d1e63c79b313a290e720529431e5e7a15cbb03b1d21731f000c40c78f5a6c72773135086b4052664629222f241b7d784a752c5372e4879c43490643642b741b0e3d313e346d6e6116161b18565d1a0656734b5a75244b1a5a1a4c252762357875c7bc0438431550507544043e661e06607f18121645c38a5e5fec89a52d343c121c49285a4e1b192b375014183411511e24ea90967b34252a681b7a2b19686c7d6d77346b751d156456360547674d0a14543e5a2d2a53d9becab2100b3f7608d7ab74da8d0624265775297268521409010374207e660e63453d6e541a4b5b2157d5be0a5624790f2a3d362e1c535bceb92b6e451a79481b3e57de817126441a59cd94070f12c4b8da8223492013d78d62d48a2b4949752e146d117055743c5414355528407912232106412a4007736d57d0987d555237cf9e7e5146041f7861536e257c4b2d7f10687272ee9296475271704169523b0d7c25321e65c4ad0a1d5d0838672e674e20ccb56a2c51493069114350056b3e37005c7e2c0b30721e29767f695e215d51624a0c483b1428692a1a7d297d1e10271b2e5b2b6df2bcabaf477618196d4e38022d46480231431e3654724b44cf872f3c196a6b6b5e763155d3b60f2bc6b5323e7e1548546c4764cd8c5a4a18715d2a293763606f45000d4e0bcd996d14175b687832012e13602f720e2ddfa6e78f8524e6bca92a2bcdbccbb40b6d14082352312c49550066172169735cd4853a6c1e04392f212726520a6d5154790d7e2c48717235611f01702f611e3268221927573b0c613b445d20760f22357a056d427c71787c0f7f6c131f447eca8f70621d2d33643a070c5c023e761d3a585c62caac0ee3af9d3b316b3ce7b9950d2e24660565464b4a04766c4f410a070b26540c18547c2260241619695e19456330451a4c516d232544724024117d3053665b5400280a190010143a5d2002080e34664576433a526d4b2b70664f5f1a07037f1f7d4019427b3fc98aec9b8b19214a5c401d1dd6a44d1e297d28daaf7f3c08663ce99d8a3b504965de9068596940091f556960477e0214d29b32635955d5b27d333057135d25cdb8590f1e58531a1074173b786034222d6b7057596f7b4a633e5d24030b383b56cdb157391221113b0969322b4ac68bd1b8755f167f5032595339cf8c792000043e14017c073a065a104e133e15572770c4a13934684d7432e9909a7d29581d3a5f0ed59a6f084c000e5d330b11130162143b146965020d71337c1c7c281d650d38dfbe2a3c5c4d79023654732a294429c7ac4e0875c8af512f5e713d49541a22501e1a454a7a6b497f1d606e28370ac78d36706c4f4bedb7bb0e473b2f3c431e47525d2e530a255b2a293a154e7c492566cc9cd7922d71d4b44961625d27676b557b3e3a595f1921003f39134a544d7e43543400541f7a62246a74543b430c48754353382d47726e7d717548541c5b1054c583563e5346375d7614183b3568626b1c4c361c1f3370ca8364572a591537425429292a5b0ad4b4214ad5a53b0f4c314f191a153e7a65d4b23275591d4a2b2d13522f615323552a341c7540722c04775111cd8f516c4c7e642c211b532c5c227b617c68567f180f6a5f06762742290d2a6f646c7a5527425a69693f64797b2e742e5c367147056421c28a062e2e3d5126060b53622dc5b0296e135747135f13724f470b772b732318027974323b69161f136c41663306062b486c2321580f053a1101f382bf9d5f0c796f2cdea6793b243e1f44504e5b6bcdba6418292907562c076b26447a4c4641540a7955094548eaa5b86c081e642ccab559dc874f5534180d2244784c4b514825123b341249514804cf9f683c3b5167486634c89243546a7a3536314a6f366e642c6d747d52e1919b3b1f4f1f375f4400ceaa0e1c53524a3e4a5d112b2f39731b282562c484574e1923641a4670c6a1514d12534854563c5e02093c5a4f3b332e55263459721c46380743632250293d2536520c08233a4434196800285c151b7961d98f13361b3b6f414d7714df9f3f5d2c5f6854c4aa7c6a7665221c6120d8926d25586a234bc58445c988577328d6bf47041459356954d0953a3a75700e24572b38361e6ed0a7d5a9397d7c656e5c7d362c124b09506e00475c570372d19845711927272b7f2a020077152fc2bb2b3c332a05060d23231e1b6d4948060a351e2650644b696a1565437e65286c22413f5e34671900653e5a15365028216f050f352b0b11e3818b267d2a3c1cd1ae221960413e4a14517358d39605141d300f63052b144953471d1a2a29521e4f36563d102e231c4bcab548237208143e4d261b2d0d5637d4802d2d45342e4a436d573b695f07310a6a00100f314b5d4d754c3007d5aa29753a2a42746d01274f523c49382a0e5a723b2c11131a484a5b6042067f7e43003a3d5b3a563e6055686829d4a2ed90bf4f0e4d6d7549023e2d625a37630013437929735962c3aa5464401d4d1f1c49451a4a1476556d3e512b163b5f7f7e306955494f54167b09421e414a52e8949f3c631f56511b613172462e6e3770235558c5a3306d4e5760693b3037394d7f1653535408785d4a282616213b304d1d4a72780a756ad484424f507e19557e57634e0e56792b0d753647d2ad4a6664dc946a2c28291d5a1c46426e167469367f057132565b691b366d0024475d1e12d3981f35697c2e5a515d09d89f5247dbae1f7e0d2f281f79656f3b460b2a49162d650a620a7acb87cf9f3b1862362b675c737b5c1069f297989d752d3e14505864050b037d1878c3ab0b673a45007d573fd7b42f74035a056e343a7c7a7a50d0a72e1012294a205c4908d394780018776a693a490b1b2355177b0f734c294a303d73612a68253b51dfa81829221c64437254495a5c49692d3a372869375127416b63702a3f7f4a555f2f3a255862156f47cb95184c48da8436142edb8f4850dba11b3c4d6f6d17386e732952571c6645792c4a716c22100242412363447c477b30221e0a0a4a643b6d2561207a117b62cf9c43757e79792a221c142a7925372a1b59374e107a640c164c694672144ac99039052d3a0252093738226a7c6b57dd932e27722a5a5f2e1e036c3c1f4b74721e25297d0a282b54154f507132d89668155c694f0f381a4e4f2344523a5c756544155c0020005a5ecca0c4ab5a440546327f07526a6d52747e526c4a5d5b1b6b534d3511726c761e583d5645300c616117516a7d5a356dd6be37d7971525421825490dd0b07249d5becab55e57104ee5a7a9790b37010c24326c2d2e22346a63565c7a5f5a5d3f3b111f3f7601311c562d2937494a0c4f001a00255f1a5dc2aa5c6703ceba75230424127a541d4f2c4435473d55e395aa4e7e414a367f6c5075413f4a635d59516c6d345dd4a4c49b00124926043745365ce4829548120836737b6f061c0b5b6a65675c69416804692a4a4dd3bd383d33144c1f41355206434a244d0d3636c8a6191b634cca9c1c6f49317673674a222464052e2a26483e0e7a316c277e5a00362cdc951d543e06ce8c66114857650c78216f68320b736f1324d3accc930e215c1152592d7e77744c67702b0d3a1d4b792a0a2e14521869594f3066556a52331459502e481b4136201b6c333c645a53721e664a5e634977ceae3b1a6a0937287d3c4e78c8af210d4963d4a029502746276d454d587b39631f553804d29e234e394f655834681239d394464b295558617d1f1658462a0c534c017438127e485669184f4469096a5addab4b36026a1e45573e231b27705e75d7973a3371494b2a4a42234050e48daf18096f662408627700672330667475d2b268c2ae5359320444753a1546cabd04116c6a71556b3f1d4a3b132537246a091b73637f58c89c3d7a1d36390a4c340a3d742857511b777d716a262003004f27364d02efb18d0e1c226867394e54103661496b242929d4a4140372351b614337723c1f3a2e0a30662c0c32241012493e3b1d386736374d0a212a51295c42263a52124a54556e62cf992a2854ce8a72501f61292c1c31213a5271da832873c688642172284e58434c4a406a6c6e0b2945011700380840112d41467d3e49530d15145d2c5d702d4b2e0cd3a3214936513a11325f50266242124506dc8f33621973150b6e27040ddaa2110645560214d6a43c2904024a240d21400f3051dda166d7a43121282d4c145a374f7802083b116d0c0a1a2d3e36424e2c01765c283d3e1704efb9b8180133445a646d1212125215545a4d16097000683635cd844f22373459493c364b5801362d0e2f525929424a6c491d68003b384010c3984a6d0467140a433623614d5221732b064c7146716a7c7e3c7432692e3c5c016b761012511d05511a17340874d7bb3454d4857310da90405246df8762c68b6d3a6d5b3b476a43480638512a376b7740024f5623372d232141795c580b525f2f52681b752d351511c2a71d720d0e3e231045756b522b6d1e61d2b6160b0711dd9d1549d0b856782a07293f19456d207221232e3f4c78306b46df84351b74c58b68233d167c407131561a3133070dc593607d0f766f2d2f7c427e5d58280b4b38650a671b2c2e31252a722a4a547e385f503636f0a4a4a66fdc8c367b67410026142c483e335bd683021b081d2b0568007b6c2024246e2d315a2d1bd18e31465a3e1f53056934e1a9b448443756524a533a4100205c104e75243c76434c495d415b790825296e384558503d37007955192d195c712c433729652633055466daae5052751734182cd9a0570703022f776a2fe58f877e23140b123d081800334b6dc58e48751134523b4129077f4c442e4539e6b696713a103d7f5b6125282359514e2750024d5a7020e3aba7d18b3a0d3d515245094622636d1a556e75060f68223c3e2e0300461d05c6aa753e3418e1b69b0a512b5a5513d49378627e7a0667172a6f464a121f0f41017b5635751e3b7430182d34006b590e14503624732a3d162c51cd8c475bcda4437d285277524e2a3b0007526c24574145164f225368494a714b6d245c4a6f6b1d5c3a74464459184b5b703874574e4e213f2e433646284e1617dd8916715272694f0b320137167c374e0e00386100561b715f27753fd3ad517bdba0746b743a4e361514414e4b2978675f78343b52465b151f0d6c780845343b255a585c734ad8ba0a4041247512042957266a4bd591322cda8d423311132428691d4d341016147723560a3e3c793c19c9931d60695dc3b3503168643c0075d4b400142e40271b3e251153703262421a0369045b3957cab411c8b02d353234641656484d4deb8eb3305152696a5225790428492f6a442a5057296cd19b4b3422614d1b77767bd5a12127513f35493c42556401790c7975136e3361014a760e7d5e1d31195a1b6547033e7716767e135a6d18540c587c4a6d5e3704690a101149587553643a3f46264a5c61160a747b0071613f1d2d712a4e32350b1c4b2d414b567617627c7a72142e5a5a4a1150092d47645c2018c9b2544a494c390c2d1170391b6e7a621438492a071847302e3e4d6958452e134b6c756339070d23d6b2686e5cc3b74a39347126d3a9454d32212b5a2e4d701002373b781c5759453e545e4337501a726c5562480a442cd1984d1c3d12194956493d0d6d52132e3521caa6654a1101373135635a2b556f6b63003538d1a36246361e346dd9ab4a49232a2f6e41102179690d6b1a736b740b331e1a290e3840525f7825456f1420042a231ec5ae43532f261601100a6f123c4a5b472d173b2945454a264427724f527023390f574b7b5b41636a78726b2077070518133200597ede8703175b712b2c1b7f0c7b3e476806494d646123671e67725fdf8c0a6e2f5a02d7875d5d11114a73651b1551716d600f13651b0068557f240f61296a400b76694e2d47554b594cd1a80c0875414f5b082d5300214a371c687d786418216d4d3c6e68710149502046356c522a3963333654691e3132515048482036026c0a172a23341913cb9449714fdcb54a2218151e3a691d4853492d240474291648f0b5ad847f003a72001ad8afc2af5e7f0b785326386513c79c4c696e7e4c29636d2a6f245fcfb5556c556635e8bab5365101006d254754184a69353c65037c0d327e2f155704341ad096351b05037162265e552833516a171cd692c3894b6e126e454a7056546e4e5dcea86e53062a4a0809005356debe581ec6bd0f7b4a3ec68465790f740304ccae54025921d5977e071cda842c2a25790b285f703c71126a461b7e4a0e38243f19612f2f1fc9872b53145034646fdab04b3b793569713c661d7024372928732719d09b49514e4f3a106e182d7d58746936416629434310540a036b2b6e67303b64001b014972de831d4b3f14534c2078553e1922273ed18a5b4c787264377912202d3c0d6811dc9d237c052d1f6a06413c3f4622701e641967324232314d7142126908505b76374850c49c2a39296b7e2c1544e1b9ac2874386c45c5af3319203131727d7853075513031d48152b1e1e00c49146cd8a1a173d4c7a1e6e0b485acd9f4412e1ab832f00790036134f5c585c4a23132e1b4a653c21416a2025767f062b7f5f3dc3b2715a6e763c434e1a116b106969792d6d4951415f2a6f3d06304559351974d6987c48294a503a54120917c3a57c55227053525c5a523a49d5a0593a577879634b39300250714a290424557d773b7e780e5f6e2c7d2c3ec7a1527e311d423b70592e7c47463d153d1c2d53140a37d2ad4011747c2110294c493e273b0048432f0f693113157257293f1d3155356677062a5835087e54362a2c3a214b6c05364b7a2d222a524a696a143f0e2b441cd7927356731a75315f4f2e425c660a6a2a6c7a0e2d5b4724722965237f0a34675c4b5a04652812054d11294f664eceba2429325d016d30546b3b5f1bc2a4016f2a5f154a6b443a66252b3f1c6d6233243515292a7356601209511e76031c49541d0b495e706a46420804247d470e4f6ac3b1212674154bc3ab53585b642e05262311586d2c2825014e5cdca849525f31255c6f422045551d0fd286d1a3446e1a6b576975292bd4b41e162d5d23253b5a552e312a2c067c6d7d6e240575094904585b0a356edca53262153e582d27537a5d20203b744a633b2f4a7c66053449444b29525a5101495036385758203e2877672d645170401c397d65546c2c1f4c794f6270421c514103401b016a66123948536317744e0f787a147437184b597a7e1a496c58132e01622e360655544a663517cc9539021c01297b130304e1b8b0781d63247964cea167640d707351c9a679346b716a504a504a4e003a7d5dd49e1de6a09b071b5c44653c402d38da82712c241d7b1c257b2c5b557973d4a4647c6b0a0a1c221334144349dc905c5355445f37d3a5435c751b285c4520123c18332d29c88c697c3932586e2b565b2b6b4a050445010b75592d7c73464dc69a2d4a1952523b771e6816555d3f512b180a210b574027dd8f1f750c5d5a10012b52cd923a7c31560e38650b50074f2d7e356657e3bf976b366d3b4a4a20633e1a0518671f2a78247e086e252e3134625c24092903cdb12c547147264e6d25652b4ad096d0a0143650d493623a567cc9ad3847564871164816002936c7a1170713321532173765103260545a647a16697d290a091b4f40052346305d23641c4235054040403f7538422f2d5f7c6c7f3100131f0f665a3fcd973f4c3d7b24006953713c6e3d52000034703e1159644c7c0063cc850839511f495351172e4b68352eefb6ab0a3b0b6354196520576b3c6c70186602691935386952302d535a0277552d1a623d6628522009cb9b1dc5a82316494e60616c2708db8a607f5e580d2001162d7f761725e195971d682415326a4f345c0b00dea36f75084e7a1e000b59e2a698c7a42511de9c59696c547c52353205561f0270121e665f6a0d52632a3130db904a743b286245764cc8932a53c5aa7d5825e6babd401b6e7a00701f5122140b6929521b28712149753c281d3859595e566d42454b4c2b4c282e330b596e341e436bd88c020befb7a1265b6431c2a853066b592f2733054d4649131361500707740f7e1d2e7e310529291f0a5d497170657334556208227c1cdbb706294e224f714e712b254ceab19160081029461e4e3a6f08702b485d17275a383540257f313838333d4338504a2dd1a934dcba2a52751714e2ac93106d667b651c5b630013480e4f3a2f2b6f4e14510a6d4e505b35192b654d040b64294f16020610420f794835080a6e4d315248785325136e364a5a055dee93a4021f031ae184ba41351ac4992d127520696f57507f1e2e707b00cfbf05636333ce87dda0592f2c700d6f3b4b4144786372790d7fc68547150856d7a6387e2b2831513d6f1f1f641168590e0d3f706e7b3c693064390d4f3640126c5413607b0c4a3462c790db8c382e54ce9559412d14512023414d715b641b455f5a6e3971493f3ac4803e625547565f52162760e6a3a92d22403e422f1745687f53120142716765691228000769573166c3af565f5a7d5b304e50041b0d7b14c4b4dba43e752f41596f01464e2a6d7e3478663470d8a638d2816d48002e7a49c5af540ec5ad31737b0b2e3962000d64460a7f5c4336294240480002d8967f4c670e5a5663d49a362c31067e2f2a790f6606116b623f4621530a1c41573326796505213a7b2740d88f513232332c662c69752a280cc6920add9d1871271d0717775f392369392b6a72410118647c792a59605c1e6f737d09793070411e1e6b51785970682d572d4d41710e456d70274e52de99706c4dc6bf645a7c700e650d34057a0e094664ca94627473452d27556d0936172c725c6d28122b4f5669406f556230111076676d75584a58655577105b70125261240842544837365e1877c3804e0038dfaf33435d1a160cc59b70e7aca10f31537a1d5e67d3b32b1e604b0f217a7c1e6a26727d5d495d754a24040d3e3624ed8e81656971095a544904292a041045047504607a5f15031409362543006e0e295f1f36000f47593b7b63111913381c455b0f76237c650b370b0e0017181f455107747f6f696b6b00cf8f0a612a3e4d5274246a1752cd923d6315016d431f0c6836416e1a5628cca469421a71026e5b0bd5a84004017d405560047c1e5a713777501479685208490e20d88f0e63613b0f2c3e7c1c471b247c3c00466e16764e1f2b4f10771c734d6041187a585cceac0b3508d6934d1d3b604a6a0c422628785a13667148666205584240240e23d2a42f434d206a1d4600781f186871ca856c49431f353b682b462835356d2c39502d746f6549463d74547e4f622e14e0bc8247520a6d6f433b78511a2b6734403968545f5a59324a7d14071648657d5b0903706e375c5c61543f2840371537390305ea95ab55775509020d297933d78353ceb848595ad28201527d6dc3b421372b2263d9a54cdbaa0ddfb1d0b22c1b516d041e5e20793114240d03cb9e06651b414d61796c1f6b41711b0573717f03622e361ed7ab142d3d550a624f775b03752824027155002534526b15186e062330320f751a402a3736202424323a6d6e5956383652364c6161666323205c5ed28f536d1d34512a1b2a3c003a3b70f2b08f91353a3b3633662975e8aba2650c3824474b336a6e410b3f193a143d007a0c2e655008696b457155611657352166091b592a5a415274500a231a49727334653928c9880642c48d4a6f0d5a38125c21412e2f60631505c9ae145a7e5e40c3811d3147523a53146f7f050c730e483e5b1633454e0a3a50605071087054034a6d6fd58b1d3f084e173f5cd1a40b121f26492e7a1b35435d4321182e150e6b692e49200071686e412d76da9c792e5b7a4d4a6fd6a22dd88b3d1f3426343911015335725c1a0d6b283d3c7147334d1561507a72e6b8b10d3a3b016b752703626b51d5904450303a1c44786363114a48712e4219cb8e3a7f6a4f1c4743753229716a0d3b326c3e330ac9b125657a2a62542acfa55746696f293bdc860d69564d49245862081c6500755b16dd83793d6a452a332c501c4e64696364176544dfbc47c9a00f1d6f037021cb8d164721653d424d53565a547d255d305615451833221e674232674f4d35636c5bc39b0c3635ca9706625623214a40510a22244c2e4fc5aed2af6c3a73163872385815d8b424656650c28a760ac5b72a27c58b374b1f3a661f40cc9b465561694b4a4a296e29284a012e1070730a42790b55453a0e36427b33745a6c1c7f1e2953733a1c6f37cc92c382033a536e082a4e206d05dd8b5e150cca994e115c4b6a36403a413b5cdba5cc965d724177701a2f4f3b39183a72743f67127f572b34453a4af0a1b0b6764479436801c49b4b5fdd8a6b2f103c35cdb412572a133b304e4c0551595456437a12544801503a0b0653725666d2a5665426253a24d489db8129216d1f686a0a040f1077187ec98f4a0d635a46486d5a12075d0e5d622c3603633138766a45432f2a34695012743a57027acb83473139346046397dd6b4ee9fa13a51233045640071262a6e5c256200363a173154ccb159723a4e224e210d5d6e7a240d38426714691d6d4d2948141263774e1f0c55750c2e2a3661572141d2947a2e124e1d023f15133228733247caaadda35b46c783623738eba6b80a6e6c4d4b3e6a1367161b3ddaad55d290401c4f05773065267f4a1a432f62653d5b4a72011f3700721b387f291b3a6c4037434c0a547751317128102d3a56694a4c44d2964965db8d485d49426f6b6b7917665229516716157f2b52225f6e0ac7bc10561d08080e1468504a7b5209484d383e10594666345952c48a7c722e384ee594a405570a1e495f4462c29d735b2c7e592d1e22ca927212206a40290900695f15273265d4aa5d07347c646126551d652869684a06616000000f6f204e2e136579047751603045566d7c4c472e7949145c1100261e66eb889d0a1c1f7ddcb526614d666c5a454175361704583b090703396e4e692330295653094965497d5ce7b9af4ad2974a517dd4ab6e0838526212582f000d63736b60393832db8cc7a56c34633601653a2f6b285d6f585b6401643d395632362201291f50c58b395900373b3d5f57581650000339153041051a4a520f45255c0d5e206f63553963152fd6b0126c4b6563ca8a2e00171bc398782038cd810b585110695bdba038744d6ed58b30713e7215577c4c3165365610693d143c300075ca9c7ade913b041c2751321e7e4c6e38725c56716a4a4e571f4e1f3811485278494d7230480a790e6b4d6d325d1c0d5f6d123210570742525c224f6d6b307825c5ac454a4a480c15de93257b363c6e7a0318dead5f3f093f670d5929054e53465414592a081708421c29517e7c01277a614a7c17457b32466e1e6f35097e46725f222c7b3b1b6936173ed19e36546837ca8e54426a0a761c662f19415f3d6a6e174e7f714c6649214c17032d4f2f600005103a6d7c280b294e65663cc690734e6651646edea3761e4100271d7157cb997e2c6a6e7a456154654b4543494b4a740277584d454c36752d242a442446730ecd925c344adfad123724debc4ad59b2b377f11600b78754f111559696d1b71631442796638196d55790ddbb7690e292e06d2955a75100a4b56665e65715d35650b0606213e0003314531737147244a3655657d4f3c54271723c58f0e2a3b1b3b794062dfa01718d1ac733633df9a1f5a23500b30183d4629132a541cd2b9492b2a77cbb6107f4d6c664a144b6f436764057e6a127d703e0d5941414c3516402d294407030036250e2e460e5b73003fcb8d2b4f2b6530090bd5b8eda79152003d16d094040b046000c7ba56241ec7834978387848363d4b4e5d12006d7f72143451701f28004b765c5625546a51694f68254e2c7c294e1f4f6c06312b2f70caa37c695e23574d366a684b4122540f2941dbb8427113431a24417167de8060565e6e4552614842794859713e295bd2920f5025470c294924626b3811605e6a52216a59007c0137037307570a4e4657177c3a266379271a2c575742146e520e2d464167d29b114a7f70166f5c002e3cd9857f3f35d2ad5a145f784a3f63353468503d136f4c695458074f74645a71306934d79600034044202f796f3d3c026a471e521516453e352c071757111f287d411c483a2a754007006e74607d79443c476869160f207a622d473a4d3c2cc68619194fe2bd8d221b7114566d4a7f216c1752204c666eef8bab470762355d2e526a00194549564d6c0f50003e782f41773761d99b6e653e1fde844b222d6935282c13200e63042704610a335562424249205b112a02475538045672f09d88a86d69274e2e636cd5a50a063e5a59f3a29aa6de8c525b6c170a7c2c15d88d394f4d530d4e322e280f254b7a4250401a104d77702d4f18c88d49005a6246314c46636204726c78495044783f350927181a3c47026678243e2e49224f21056e0608246e451c465239451f3a783b724d6a66604f5c51312a6016322c2404785c753d704b3768d9a3721a0d3d4042194d254a4020345a7a7a4a0d2151c4aa25520c7677691d344d3c300f41540428662315721b445b107dcea379617a79312d19186c011c0d1015090473395f7f7723017e36473c4d2e09217e3c1971012b4f1a72557e76cb9c2b54da967d540a100f4718c58277071c00724e70d4ba7acfbb3c0c3805045a4dcaae05ee938300136c6d4d362f77321dc29f28d1ae352fe98b99642135296a5a475cdca8096a4e75666c7e2f53722538437c1b2d25224f435f051153735671383a7043295051452a3e0513393d4f253942503310c491d283767a02424274130e166f3f4a443f3e46235856374c3f1b674d7a3e7ce894ba48252846754a17dfae23602d767b59534a2e3b174735275d7c3029456b7e6464190a362648667544530d2315df960662485a54021f69041d1f4424535a4b347ac9b63e02041c454a7b22cc970e3351433759506d7d60660570410d59404c0d0d1672664c34133ddc941dc58dd4b9cb8d6bcb8e2a3d0f006f0c46743c3b28425d372a02c49b15643814485a157e7f42305a6a1552254d7d4c444052375006141f0474c8b4246e7b271c2b3f6d1f577674c48900301f6a1531494b09754e16d6b22700373623183a2c2a745872cb97210e275364ddb94a0a237d0602096c4d1338656c300520604a41371b464355262a155612064b4175755a590b306c76d38f791e1f4604473e7f3f286f4925266c443c69d2926d6f222f623d217521c8a62e7d76714052d8823c371e383905621e57310013082907326a7f66585e51284c4c02672f425d51096be4a3863957011a641c612e6a1c7a710f3802e3a995240a247b3e006d2f146602786d3963170b5c2a0b557736366b58110475e7a3a9d4b94d29cba4580b136f0b7e1d17561600290577785340397b7d714370df8ad4bc593ac38f0e32365a555936306e065e3c027d5e74482456691c7b7c295d72447a705c6d7252425d414e503f1d2b0e1a5715742764364e052920247e726e2f12572c673065d685273e4d6b4302286a4502571f5e650559620e3d0f3238293b324b0b11293722373b1b76247be784965207c5a0004000de8c4d3839120257226d625e442074255e4ad2b439333a2e2f65193b79d8aa12730fd2924d430f581532dba64a6951292c054b2634d5a4556f0b6733470933584c7619664e5b727c52145a2a005c2d090bd88b04136f22511f577b314927222e6a264a470d0664290004254804136d520923017314644a3e36502d534d7059594f71091b27205e121b2943171c5f3a56067dcdb617621d615def8aba005163d7a26e4b14c696503707180e656d5b12764b1163193754320e25267e594d2125052345d2a012170a0a30435033296a61050e6b040245d3b56d7bed82b2330e76321e1d6f332d3312714a7537d2a51b5d56001b1b616e0a29602e310d1b4e0b74727e6e2359150d336b19312a401e24690a2a26005e3109490432422600637a1e050a0a4e5e083707660f4c381e6920604e5ac4bf40780e2a70742b2d4846254e2b2f292776055022c2b67cc6a668421b16525e0f20282e000250221b5b6c3bc8a571171c016e174b2b31751e4779365a73d194382e650d13467b3121d0a34a0252106f736e7a54591604017450681b231d68584f78561b7e79cb905d61296a222f5642763b4970286dcca7725c6a5646705c287b1415e0b39bc2924f7400493e1817332d363a7562355054704212396a040f15103c7acb8859033de4aca92e59632f223b250d496b754b5a25250947434c566f2c4136025743710f052d05172e090062647e060c393e7f4f265c5617692f33516c62d1a7566b13db890e6c45275207d5a30978da8f1d4d19705a4f261c6e5b0d5908413e1d05cf8539723b391171190a437c5f53413bc48b0007d3873c6c4a772d6d362ae594920823042c1a1d1c2973332b406e29021d18140f395417d39b5e1e3243ce84386f5446522a4e465b62434d2a1b55781628590c700a546337183e6f436a312d5172f29c8e86374e0bdfa9270d0d126753444b312a6e1b5c7d5b495a753b0ec982762d1650626a3651dbb3480d354c3564f3a0b094e6a8bb340d006e0e63e683b5390a1d053450615462152d6f1d6121614a5a752b4a25267c266743594ad09c0952424901291f5e61474a6f6f7b31396e576a0a25325c020d3a6c3c057a607dc9b5c788186e7d326d710d08c2a60d052d654b711b753f2a6c073b607e507e1d4a4c531654250e477122343a200378c3800e05447a6d3e4378725d4a2b242c3c0e485d68e5a9946a5b0701493763214e19c493350c783d5d4d766250cc8dd5b4237f3d2e0b340d612ae5b69e4a547d4e00530b4a3bd9823a425237dbb8df90272dc3ae5750645500200e7b2f0202761d7c4d592e7014753f755323565438334fcbb975121f6e234a22136a52424dcfac1d294846d6b6184f7325564d5a4b4b694b6946da95650b00090a3ed1b9005d410d4a486a57325e68081c4ad69448d4937d1c5b48442a7e4319334ed486592407341b69c3a54ed885342e227e03136f3b415b0c541f6552140e42631f61525b0920691e46500d15714a324f526c5d24281b1e54391a6d1d4830022c67236a296b3f7d17113469475c39194f2d795d5b0c7c79522b48364dd48e7d5873c8b92a3d3334ce9c195814152b5242547828036e24056a32234a486c4f137f4e170f3d432a065c454948cba8532d142f48712b776c6b205a600c1579d2ac5c520325601642757a00713a424a40c7961971dcab46caaec4965624696016613970e9a89f5554292d5c065c4e52571cc690620d750b7e676d0823517d0e50060a67100429522f3b3a5a39567255795222220b0a6d5c006c0d495951592a4163685520335c2553521a50750a552bc7a1001a030c52122435e9b6ab710c6e0f15270178327f795f387a635476091b620128004c2a2c7c0355225a441875657a5b4b642d582e1201c6bc2c4811564b1522341b2a053d15580d5c0372c5914a4d45185c2e4a79536e55436c100909dabf235d5c333b4449d5b61adc8f784f1e542d3dd9841b17687f2e00565c7a1c51312d5d4a4b37063737002720d2becaa64206315f3a4a345a5a5c7323594e5c4ac8912a317a453d5757710e15293647d3856a5314064225535e2905c4b852455006380b305663c5ac3b17e3b6b67f79195c3716795dc79e3e6e640b7f2e07443ac5872a15211110dfb659602f4527723600e3918a0f1f01735d5b00274d070241511b771f39553c7d755c00156a363c70273026d2bc5354030233177a5e5e1e0730c3827a2745570061286349322b6662e4aa9c072d6032275a4a6e43120d3e1e414f4d15180e44227b5c2f48433c25c59400411a5200000d0e7e69255d25661b532d5d10544f0e36324918541c335a6f59372c4a3029340d6272492d1a485e1d307b2b32765a1467255321294e510952d1b90bef86bf5b2a6b0a22756b31da9c662b634b0d696b62586540341a665a4754247327e4a1b21c6428716d445528cc9708cc91553d2628011f1167231edf8f074c41ceb73b5844312a0e4f173571ca8036373d6f0fe8a28e39e5b49077666023490b633d55362b57117336301a70357b375e1942ce8e524e32796f6346352b6276557a7f4f0e167a6d122c0835497678241a3c5d51552151710b7152374d61434d5457dda067452a530e496b095a7d5f753e017305373956cbb2ccb90a4a121920403a7464164765d9946a7f0f38542a0a720147c99b15290310577f266d2944252341261bceaa181f273c7a39211a3707474ddc987e5406541419756f176571466c0c3439543921767011077b03632339460969245a43221f7d3734427b6037533c7a743a6975286a522565046c4d70546806447d4453297d34032e5370595d0e77dba6216cc4b8494c5c263a385c1f64285163c7b27f161f237d290a2dcb880a26c9bf0d000441386d23045505707e1a0f2f3b49662b215a0a7a036b556e7d2f1c121a5674405e676d0ecc8c1049364d481607610b1c5c4d2e5b4876132538cc842a55737f1b625d57594bd6ac587c79003e063d1c6b0f102078496457001d0d38593568390a35233078756d2120000e1e3f461072597363541239c4a540286e1f382b3d7a1c0a1a392ddcbf584b2ed496255c7038625a727d4965384a6d2c137d1e365c5d12c7be3c467a13c2bc2a1e0f1604dc896a1844022974050876427a6a3b6f6d76427553532a1d36380e10f1b29f9645325a392ccc984a3c146e2d230f3f2700276c5e1fc8bf386c6e384108693a6bd8b336530577004b346a740b792a60752a0961353e0153323267d3ab284579166d094a4a4136266f121b1251354e4170451e3e5c6f0a7d7d665b66327d7a6e7a5232542d716503140175045e137077364d2d515f761c72756d3e04655b38d3932969696d085f1e6252cb95031b372926e1a78c5cc39d634e424162495368747d6b1d52560106dba3011e6130027e473b6f5b4d3e565711cf9f4f523b1dc7ae06274c770e731d520a74355a10333e0e397b064432147b7b225f6a1b31d4823b2f716d627240277a397b1b7914190010464e53752a522b514d00212e4f12056f0c622a6427422f25016058cbb515697919721b4b7d6be4b492001710077327c4844c6a333e493525273b60dda011282d3e4a4dcc84697c34f48caea254c89b065036052b7d762f3d48520e592448146d7167d3b84d172c59556a25377cdb901c533a4c6e23115645482969401b347d315471110753517f094348071e132c265454464a4953361601236352096d09e894a6613f06664d2a1225427d0e0027191e0d714013d9970b7e785109f1b69dbe214b30474c1a2d25732a712800502ac9b601733e2d35523452cc8e2b7d2e294b12024addbe6d0e7f6a4e2d1a77c5a4500e7c5550156e5d257000797f282b11025955d09e6a2c05616b786c02d5ab6b57122fd6af5167155e7d6f5a7a5e000b7f63525cd5a9395e0009317e5b1f515a5c607b56cdaa454541dca721263adc8e154f5e0259373b2a0f4729477059ca994b6505293a54520d31583dc5a90f29280b54076639776d1a142d3a341c477a6908380255cea237560c5a76345228390a7b6772101a7012e78a8f51227c5e5d490e5921d584000f082b416a09395d1d49297f262bca9715334e682a3305424816604b39584937522e76187f5c290119317d0104722e14e6acbf115f1265c48e5b51501b4857397d2472772e327b19ddb762de854a7e6c032d2c23525d4a2e03671a414b2d232bc89a654129162c422b280c1a7933547e566e40c4a74a61387751525a526e0d126d7c534639737a766d1572336d296f71277aca877a4d34792bc79f12094e1b7d037b447e350e634d141a63322165dca64355457472ceb77d483d462d062c6446361a436f4f6d295037080d2c01016cd6a3cea424734252300170562b52cc971d130e055e2ad8a5467f744b3b5e28dc92dc860f5b591c017565caa76a5e25234a2e4160563236733931105d514909134e7017243954574e65461c2d637500482b253d63c293752a7660043ddd87435376546ce485834f46080f264a64545d4644590a0d321c2364146a4a2c7c2f0c081f094e625057252d154378c4a8487854120d1f592d2b5f395b70235103cc9a18671e221cdbb25925495e762e3a16506e7c4a6a753d05306b5d31c2804f696e3464241a1a3171400e412335172b760c3803474c0d1d31c7b20704472d5e1dd3b7d189e88fbb5736000d587e1f610078493b5b6c5423260d2c7f7e2b5e036358036d764d504155402a3f29232fc5b0dfbe3f560949092a52427a6c070372022f1b2a344322dcb0083e3a4dc8b64e11057e4302430e23126bc3bc497623235055602449c9bd384acaafe6be830d4d476a3b01217d1361664e5b065e3eca9c673729204f7d407f3e081e2400321a104a445a545a7d621e133d4e476579c8b5261447545a461f24157b605e507166426432cab42444104f523d305e760d246300166b1b0719c69272312a4e142e563672472a5d197d363440407d4a530e0426075c6c481d6f7b604c6e5b4e4b4131d6965043702a04405b7f0e746ccf98722c0f604f7e2e35017e08511b124924dbae0c2c530ccaac7c7010145c425b5b436978107b3e5e1c186360577e3f4dd09a071f2d3e6524654872011509d2910d621d3d2e692077426f707a1e72d2aa0b4f50203e730a2b35546276655ec3a109243b3513504d490ddaaa1b617500241d645b04234933167052cb8a4d316b722636185648666b016e1c292b3026075178365e5a726475652843490e624e6c075c442670651b57334a7407485102dbba0d024e254c06461333421f0979750023243d060028192150dda94440546b2e26214c4705721d0e18684a60411e2a591e30753d3d495d362a410a1637371e631b0f4b636f10505b6e1b3515695f044b6adcba1e5256e696976d136c3149494e186c5432daa42a424b21423018137351755a6f687d783e130333364f253f1bc28c0a371f435f1a3dd394571e334b4f31081e523c5d6f36473306336c125d01252d252a2920000e0b79626215356665154f673c6951371b0029c6a52b2f2a05615c6fef96bf314638526dd9ae4b5f1869507c4d4f0d3e441403440f0220652e525c54653cc5ba16520c7a5e6d2e244a542e3ad58d6b1f2c680877613229542a21675b6a22545a6d73483a560f5c19776a14037a7f6742132e6e25754e2d605aca9a4149237b4e4e002b036f114904d59452390dd18036077c6438741b7963227166563e18654727090b7d4f5c337066006f1c6d6158631645595c335778000046c39023016170c788d49a7a4516041a55512e1b71050e295a460c4f191f76deb900170b666eeeae9e5423040c7054cdbc36373f62215978452b263d464948792811570e4e2b74cdaa7a123c242bd1a64e006b770f57246219374f2e45d6b23371104a792902437c6f4c1d6e0f19d2821c0d7e2c7d1e3452011b6d3a294a085e1324075b0c5633532b4e60542612711d482541004e0a2a1f190a437d4b23201d4a1ac6905a5a494a0162002c31795c5f1d1a63435c5f5a3e553c50d5971d2051dfb9277d3e66636cc9966d6f161f62624d6a363d0446272001caa8c49b0e190e3503357167325d2a715034104f716a7d58cb9e3c73165a1a7f125c3b7119486e2b4a2b4304492d124dc7a2366e4b692e3858791dcabf531f041e0006121371ccb96454771b003f001655cf876d5e08556c0af489a6ba45092754694e205f0f7f0d5769716a5a1ed6a7343d3a0dc9b50016173a7100165507cfb31f38594a154150646ac7b26b160413693328203c07770e0e466d1a6b68670a6c2d4b467c5a0f7c44023265432348330e445ddc9c631d6cdc952917260dd389460d347a623b2d2e4c4b143a74085a736162771d31607f33105cc9957c2348f1b1b2a77f45494732534a6e624241dbaf183b39164d35233e7c7e2d1460e98894752e1d31355c194a164dd49424245f6c4a0b78392d5b5045666f5661640a3d4a0013597d327f2fd9987117092a7f5b610b39542a326f54523a09265a4d4223507878744e497241dea47ec79276002b022a27cf93551a3b1332540667547716593a485fcd87417e615c7128417c0867007a4c53635243211d4c25035036c6aa3e5e52472955eea89150d28d7fc38052764ccc8654040518401b6bc4a07432083e00c684d4bd3e2d50354e214a026806363717156bef83966758e89498e4abb31759d0a5480b5e201b00301b2149554b4a0a4a50221f75001633564d56321c4a7c645a74214952426e007740e98e8822702b1e2e427e5549dfa9d78c340f5c5e33676228e6acb97b1bdfa513652e7d302c56dba1413b57645526491e7666ccb6d1815352124d474f1c6d34380ccba34a19625b7120472c5d7cd2951e51272e6d71d8b65a3376d5addb975a0dc2911141075e7f3c4c5217273a51162a54476e255b5814506d5b5d4077523115540d075f436f3c5c63db9e765b1e0f7e3e4f3c780c533c3c6673620d4f4a7256642a63094e301d6c2029c4a6c48122d88148700c487a42112e3a12084a5c53254b48077002697a44294569c49b220329102b06211d5e74c39c5a2e370922370a4e157a4f40520556074e006f6c5b4a3a6720372825577a1f78c9bf734a35282134115763605e2078344a6146107f4d296a632f294a013e21207749c7a60b08474871551d12633f2052197702e1b9ae044c712a3054307925347c3b272f5e400a7266622d602d65172a2b3d2f105a704d5b0e1619, 'image/pjpeg');
INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `mobile`, `mobile2`, `email`, `address`, `role_id`, `photo`, `photoContentType`) VALUES
(14, 'mysqluser', '5f4dcc3b5aa765d61d8327deb882cf99', 'my', 'sql', '0101', NULL, 'mysql', 'as', 3, NULL, NULL),
(15, 'visitoruser', '5f4dcc3b5aa765d61d8327deb882cf99', 'Ali', 'Zowail', '01001122345', NULL, 'azowail@altagamo3.com', 'Gesr El Suez', 3, 0x00104a46494600010101006000600000004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e3334320043010909090c0b0c180d0d1832211c21323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323200110801220003012200021101031101001f0000010501010101010100000000000000000102030405060708090a0b00100002010303020403050504040000017d0102030004110512213141061351610722711432082342155224336272090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a001f0100030101010101010101010000000000000102030405060708090a0b00110002010204040304070504040001027700010203110405213106124151076171132232081442092333521562720a162434251718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a000c03010002110311003f007b2f6f2678355d213c1c1c2c027a3678352c6751d2ad5d593c39654775644e556c3507390071daaf541c11552d461330004e7d392b302e5f735c24335c0c05ec96880b067b5259101e3d3ef1acae9641ca9e187b575f05770936cfb57951432b2641734e5f175a2805156c4e4f6424365b3e567e020a2b7e26c3b44231653f4a206a280a2c700d3549cab5d58e5c6e58161c7a5619463c0f1c1e243c657a7507096b595e2b2307386b54c98d3713d8ae27596ddbad6c495e3569027e5b7463debb3d1f2c1b24320904512834753d50723e2d36133d69553c37030d720f5b1d347f607e35c493394c355021dbb864572d2f227c6d7154c293d1b80411deb9480e3f5a70776f26273b781c01182051737231183800c5b55b0e02270e31037e5e200a312a705a310ed59b7d1c2a6c384a7629002c7f1ac9ad61011f6c56357247637b445f60457757377f3b004e7d38151b4c27620f4e12707261310d3522327f76c6b426591746631c706a5d2b5133625f707d6b3249491848792c071c6546043b56153473750d456327066c71621c7751585700635569724d5d5b4e3021c8b5173c33cba737c8847d73c69e3e51607439cf9a46d9a61fc38ed794004b163d4d102a2ad59f5608384b4a463b1e4f03295b680c66491b33574a2839156469046646436a51385a572b6639233104c2ad0d3e5318027d365439001c3d290738237a54331f53de9f2d13c2ab340c411b144b46de911932027952725b740b4b3c331fcfb1d7803164dcac15d4b61e3d01754d5b5d4f711d26576c286b14473e39763b215e5e18c48045694a68024e4a7d2b345b236b1659202bd2b11b76c4b5773b4d1d5e462ad4b71b64431d4f6f2e2f116f5934d78665372f5ed2af2059202b18603d040b742b5e1b49101236d6b426723a661867c98ac5b61b5c3c194d6a2e105c575371310f6b07041adf9a622532056535283c19413c0b2679575357672a414e3e241f76d585742d390d6a752d20c6b5745d1477714e157a4813373e216a6f432c3030124b083d0577373aed85aa04385e4d793f5d47485545460e6eeca5bb625b71cfad68c7a20771784558550b735b221e4a4e471a31382829232a1ac3a86b526d1c3b6315631c4301791b6451736a4e4c442e742c0a7e536b266d1455dabd1e681724e2b3a4567e071d2861134d3571d2adc3a52b2c1038305e61f2a3969749465f3f2a3e1b293b794641031552543c4a5cc2b23c41650422cbbb577e53016a79570411dab95f4f5646207f48635268e299810724715d67732665215b7e703deb89957c7c513d4d093020231d336b7625664b67330c320ad6896d4a0d08355e10dda1774838047543d2b56b6a2214705b637345d9a2564d7b111e4c004333c8a7690744da96723f06cb9d42683b5e39013907dabbd09752ce9b256d5f2223002c630045545b305b385e05365d4cd880c7a961d293152f1b48235d2471c2ab5eea96a542451f401f3155063b6f6e2a12191e7b342b0054e6bdb771555d2f427a28562d7b732e735d2e4d597c64712c76100f5d6a4d1322247045615f674f356574263b5c094f61197f2a2d36cd93531f6c5b3f70313f78c8b030282b251342e6ae9f6e06056b05550456443701136820541c127a77485765002240dc9e6a4938526422390b3d6adaa3233c761e524c2d664b3024552538032249705f5c656420391819797a476801d3b864593720323035711d6a3134265b1c566c202b1e420720426b7b523b353d797563ce9ad0af5b770c4138353a09d3ae0174774f4c0fc6bc0d6638520e196bd1bc1d7e241846411b297533463b6315724f0b222a4d723c6b02594239663e12527c505f380349753b2113470707046c367202374a7f7c29331f336b3143727f1a2ccdb37e4b032c60372643d780573f136d58d79a7b31115b06c58116621e5c08600820deaa6a76721563763d39256c0f2ad8a35e5b680c3a3015c496560c2871573f7b3d721b6e093b7c79726d4e076715565267291249211914662c06c7a66b59541f6a23d5a614594f070403502c1618c29a6962c9b93b7d1348613773660b11c29e7974526d30572c7b7f2c551247245a60660d58167f1a4016195779242759687e555e4c7522192400323773443e133120681c584e59496e783f5a75e6b899493d3b441d595955065f761a225c184b6d4f205c1ed0b0305c2b073504165e3c730d3357350b2526411d72317d35d5a079450d3c7b737d7a1b5a29230c105b005935624e26d29a1672612c315760cf9a14055e72583e32482d6f011f5a0077716537780b5678043272dc87313b12712c5c244359d0ab1a6b46751561390b6e36601975260c416316ccb1243c02703e25cda074420f635ac9bb0bc6b10e335b314278633533d8a7745c395a7911d2a15d6b42293e4b741453620d2d4f4c7a736d0d307e2f533f7874e2b1af4446475a3b5836dd8a4b0b3b7b44240c782573d596480e7814cba2244b40724f6e2a095270795459692d564e7354491c1fc2a57b63694401380a0245092027570ad691117c6e73d28e5136341b0c320d715aed91826260135d7a583e2112583b011a330a1860601c20caab535971722303001e4f741c69364075ddb15865787d533e09252928da87dc8ed2b33e1b6b30681c18cab064036e78c2b37a367139290f6e3a5d1e4c36177657377b110d015d072824372a41516e3dd2b42f46155214382c3e0edb901278077644496ecaa45675d6a7297d624f486d4d7648d0b50b602e40601b5114021c02296b103808dbb20e0fd6a0572e10263b344b2a5b161e2955d1bb6758234c651f1f2b626b3722455c5666134962717b0e090834d984242b387c214638041b5e4666366505436b4e56310366504a352d056359637a7615557c7320327e430cc2a849186477466e3d69753837242a2371776659681b07deb775361b5c43296a52470803437376107c5966452d3d3351465450595551d8a73d0d1b6e3823d89a351f115f0b21553c55cb8f0f553a67637c2669154e4566ccbe166337232a7f01602d4a52dabb66c991560049d8b6d0ac763200cd8fd2947812224f76096918006a316e3d76677b060904e6b2973acebb7fd98d08544750492d211513162814081b0010481d536a763a2e68233d075462680b12306b08dc823c497b5b5b051bcf8549067b28133959614d135d1e6cd8a3224fd6b1757b136576060952d5b763124a630145393d07455a475f7b3d661b5c1c717a3deea2b057047966675c3f6d2e3b7f460c1b6e7a33234b7811010a36622a360f6d29707746204e391e270f1b61d0835e372e3f531d406cc6b923647c1c627539732adea1cda6131b191e52247860dfbc027f1a266b201f2953eaa6b37d4459031f6e404d0d1873682731c8ac3d0f065b09681d7652013d0d76072c702b3f5a1846421c1a145d0478e5bd92245ac3ae665e71387f2acbbc350d3e49122d62427b5a48757736297f6e132c5e30064607355d7f17497c77734317d1973732067d5634515e5c253ec48d487c397114dd83636d67121e472ad9ad1472654a433f2e1837032300d6ae73654e225d111d4715217665461c032c0c5e6ed3b86c040e4a4d154e120d2e4f0f024d03661fcab03f267451771ddf965f140e064e0827661e284e0e42d79e2537110f5c3a566a474c3b33304018031c1a2d593a13cf951d7e684a6d01385600c8ab6d26733673531217111e180e0d2a681741006362013f5534273b6246cfa2e297b47d0a54133949391d2a201971387f090f0c4e377c3ed5a96d4823cab66e003f5a396e4a0d65e1b7895d483f7416080a001562484e3a535430231d2973371476317c47106608602a24570b300823d2ac785ad5b0082407207f2a44d2b73b350f6d79576a727b516811225d3a650e471f4a7f0d444a715f31035e296139191f2f27d78e74dd911839245c7d3a59331871433e3d227654cea4772d5778655c5417da9525704e3e551c5773790d75572a6358554b6f2f3e52395c051d6349150f724e004d13194326c3b76a10646f602a0c593068495b464832024735ccb6667b4f467043712835003a733c52104fe49080724671540b40263a726b66265611407027453b0633715c0f5d72115c535536564f0f32414f406a312ad7aa133d7f134d76776173026d32577013115969027f335d774c652b755b78727929286b664c5d12320b6d1c0fc7bd6d4f606c4b5a207046317037661b2d1d2bd5903d45cfa572572e083d3156d59a39662051727a1357364e7b714d7b77693e531a0b60d496611d32365a477527c88dd3b1020f650bcaa450711454222b0aca8ccb881ce59c93dfbd655c225b3c566b3e55231e44d58c77521c66701509535c4817544f607763230354592e111510271f4a22046e7007023d5219587ddea962293b0112225b4f78552e792d6c4eed81b06c27dc8e34030d495a4705171d7b674cd2b44b5d3a2378525b003007f0ada1b1554713150504572d2065cbaf23692d47edb2a2021d326b3fd6bac3a5246e707a02793f4e7f29413d4c737616ccb0662431071f73491a1578236e776e3a571c40417b747908334a6f2432533159c3ad6a2e10791836152b5c592e167b487a2b4a0d1a08c2990b337719251b73d68bd4b44e7e673d14564a351257602d6d5f015b381924215b08dbb27ccfb87e201adc847d70267e55152d440963071c7f293b0e2c213a3f5e4b12753b1c144a6d6b62300d4a6c6958753a205307156d32c2a154155a7c5d7023deba58750c5c504f193b2f04607503640a180200527d57032a1fcab16d6c47131d3577211619233d6b124117396b573c027a3d3c311b6f3f6831513569792f460f6a6b2a081c7a546c5c11761f352be78aa9353d282f631cdeb561146c272b49255d625026475a371d697c1d2b36612f3b5b51260fc6b8691c363d7a1e181916103f212307403f1e6b585b496e470c6d037010010a485c35786e7d265d4f1a770a0e7127daba430c6b43233c493f350b671c51182d3f0600216fc2b005711f29dfb3373a1f1e7d3f7f4a196e0743572c6d444335545f48225c4606101f276d6673104648e6b19549600f1570081025622ad4af7c3b150c54717a7c427124c4965e7f6f2ad492cfba472cdea42e4c6d0a343771d3a96a7179702273571f79335d79695d6e660961624425587d2b061103211f3e7bd28537da9855db9a534b764209001a65da92332c6c3b1357c7897479132f196e2f2456e5bbb3287b75cc8672373575377a71471e6b162c731a2e56562368c9ad5d38587e60420f53473511647c4c1a394e516d101b5c5358da866f10dc833d380b2e591933551e5bd98b087b4a1d64687965231c2b623c48730c2f611c705002055c0b6f631a28dbbe5b733a4722512965202e5c4a5e5ce6869371c7a5593236645746681a0f363d1bc893774e752475142133072ac386073549330a0f62786d4868727a56645c69007777195e16d49a195b4c38393e5e7b303f6f467613714a3b79137d476a670e7f365a56334b631e0b291913483f534c48c79f7ed2b96b2e6e550b3d4e1b6273700640073c52674361666e393845d5b02c6d202652003b2b3b467c5c2bd6b6664d0b7f62232654083873526b245b6d38e6a1a6764e2a6b625608de9f1ee98b9e2b4e54343530631342143f2c0e000e095e4c57281d48023b57483a5d681b69185523625315135c227c75071543477c44d6b75cd2bb2b0dc2ac1c7b65137b4e337b1b71767d4c111fd8a23b12646f191e521b1c140f1c4f3e5468756e3009040a713320106e7a31452e5a093c2f66e587bd320839181432467e311806654e0f1f543d37300927696421540e30076a742c491460316d5ac8876523236e0f7a4e4a2ae3a0ab054b7a561623347414c89bd08c3e1477363f5a78564b002b547dd9ab636f250a175551d7a61e1e30784a41cbbd323dc481cbaf575f3e5b1d04627f641f221f666b77d2a1687b4e5a6f2b23d4924f75285f13ec91874c73005f2d4e1b6dd1805716786b5e7b58344400d8af7d315d304d6c57313d1c7f7176607d1f5ddfa8074f704a000c002b775d437b072b1f20d7a754335bc4b04731505d1f006638262c7a5d200e0f3c384d644662d6b313466d3e632118040ad6b137216824290c36731a600615333a761e0e2a4a521503cc901575691d5521232557764d5b6d730b2b7e2a531a374e33007e361f78652c4d2d395a2774512845384a686b4d25731c6c411d555f6913346b000c3a051c672a4f314a6321047a585c245a785e4e4d684a760c306a641ddc9607755d3072783c563239207a5434d39a306420655b657840123e73344a1b3e2a52433b4f460d3b3d4e6a0f2d61537278c7ad68673d4669256e07156e0b7d176e2b456c101503396f614f2d4e31537b2d113b2a047e484f6837006e51c4965c74e59ba56b180e6b1b0a5fdea7236177325dddaf1d7d7a4d0a07421b7b392ad5b2460757636c7c242b4b69005214761f6a495d3e22782f357064161f21eb8fa631d6af3558e395b227726b686132c9bf183e54ce982b1f445d785eea96b70a234f255e107e112acf8408075679d5b616171ed6ba0662422b212a331119d181781dd18570105e34523b150d6a7c4b18594779035c6d556573330f21631a275b48271a5a594b14531b197d6a2a295c0acba24d056107384e2a4d3c05124a78007509641717524b21c293396a2768560c42322add936e201f5354dfbb29d5915dca9e295f473c2a777d7f0a7d4c4f124518573c1a3b5a6372c2b83a2f342d004555385f53351c257e117a504872320115271f5e3548603b526355715c6d0b513c622c1c64567cd7a1793f03587742d69625d892304943d3bd731c1717387cd58f2c23600249077a131dd8934f03d6b77c3d192417776b5543da9d6863725c5b540000625217502207156f156e725d5c23257b57626733276d034a300f2edd94576b1aceb14d7d76e595b27d14760355157f1025e4b58f22080735536c6b085b564dd6a44926324d471c5d0920562669742357787f5655115e5208346d18482307dc992b1e13cf97640a36224f5a6d3c62553660037f744b1a1b0755422975084d736e6d3c351f312e2803795a7707091b52714f4ad795481c1f563124447753601f4d1dd5a161742e2e04722e3a1c4f236145685a6d5d3c222b513a64014b460d712a7ac9ad635963282a7a7a4f2a153e5a390036251d76e89aa25c25630b0f50793cd7945f6913425b6b631b1c723071d6bd77224d1d7648146715492023166c676e3f434e6a2959e5b3ad13706a4941395c7d2b474a693e6e6e647b3b7619412e2a21272d2c6b5236485d767b0a34152d2c3ccaba4b0c36762c431c2c38355c2f76d3825a334123403a0a6e355e24c9ad085428c9ae45424aea91a0331c002b5f75260261137e7a6f3f3fd2ac2751393f23380061057124556a5f410856373e2c71284515327a26034a0739222e390e03002f025a210307154a05473d4d5c4f5e1c75770e27705a18627e2748602f7609165753712f3f303d635718314c655ed4ae16692634762905145154301b484c441d7a0015526d4a46492650cb8d23351e2737430b350c303a5e2b02542363dbb67e246dcf8942111207763f57317d07593cc9ac192677c69608375a28091e73725627515d6e5b6b56263201dcac382a7d416b69710d632676776e00000e6b30781e272d74d79d512332c8b90326666d0a552726376f05254d626fdc8c70de8537765a514a752537791c4841157a272400517b6dc8ad23787b741365725e302b5b6d5618c7937f4e33403f53ddbe3e62392c77313d4925534b232e5d75213d5453de9e62582a54074a4c11da9c701c75492f26f0bc9fad493327614b6f095e2745756470070f4e07520303077a3c16317d6e0f0e7f063fddbf151618633e244131717561451500d9b6c5a32b4d2bdf882d74683c7c5c065d723b2038022c774f713b167739195248421c531848731a6e5c761a7352481c2933e69c984671de8146cba73cd1b4dcaa3c13014376147d384d1958d18a3a10c3b11d2ad78e541e197fcf80387963162a7b04263b7a1e21d1a20032031c751f0a4a1c5705d4be154c7c4b1d661e66686f6d6365550e21357d4f0e35096c666a1b1513183a792f136d0b4738553f2a0f325e271b221f0a1f413d4d73525b7e5a46570fc69146681c53473c55134800491a4752047003395332c7b00a2f3853dba92e3b047e00695c0c515ec29c4919341e7a727a577b034b005f0d00705d1f5a436525724b7e01181d000a4c0f5c1f44e6b3ab53581d2a5c436f241c7a28d4af534fca8f7a6a4752465c735d5a1c13162c1e3f7964453b5c073738763f1839000f4a21334a73030a48761065344373d69a16cfa86a7636310c2a01381c77367c7a20644308071f626a523731154432460c49161b236edfad735e3c182857031b15371f43564d6d597855126d774279077805224b3c062b0a6d3b38514002315d105e670f1170787b42d4a6115ada85570e64672e7b5e5bc48600585d264c591c3e3a34382751c288197f3a3f3a3146467e5fce8029192003550e22460038500962184a1420184679541e695b4f21343a5608172c03021b697f1a5314d69811385a0707776163d49e013b0e00085f7346312819393d404f1401373c6a4c44412060702813191e493f0068304f1456d8a81e1455752c6951490e0201036329ca8e411007001f00e3a2b8543d282555007533341f590c0c7936c6990e3f14575c7f00152edeb33d59312473557e34514c224508423f43507b3118d7a1514536021e1d0a2804677e22003f5a28034a43d28a2819, 'image/pjpeg'),
(16, 'mallamm', 'b858475979677428762a5ff7400b993e', 'Moustafa', 'Allam', '0114 5498 477', NULL, 'mallamm@hotmail.com', '22 dawood el zahiri nasr city cairo egypt', 3, NULL, NULL),
(17, 'A.Rahman', 'a6517486644f670301b1288de8bc30cd', 'Abd Rahman', 'Khalifa ', '01154992014', NULL, 'info@altagamo3.com', '', 2, NULL, NULL),
(18, 'omar', '5d5a31c844ffd6bad02b0d00887bebfe', 'Omar', 'Damerdash', '01154992015', '01023770370', 'omar@altagamo3.com', '117B 4th Area, 4th district, El Tagamoa El Khames, New Cairo City, Cairo, Egypt', 2, NULL, NULL),
(19, 'omohammad', '96c4fb8ce5c21bcf2716b9d079e2836a', 'Osama', 'Zayed', '01023770371', '', 'omohammad4n@gmail.com', '', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `active_flag` char(1) NOT NULL DEFAULT '1',
  `district_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zone_district_id` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List all zones of destricts of cities of states of countries' AUTO_INCREMENT=54 ;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `name_ar`, `name_en`, `active_flag`, `district_id`) VALUES
(1, 'القطاع الاول', '1st Sector', '1', 1),
(4, 'ابو الهول 1  ', 'Abo Al Houl 1 ', '1', 5),
(5, 'ابو الهول 2', 'Abo Al Houl 2', '1', 5),
(6, 'ابو الهول 3', 'Abo Al Houl 3', '1', 5),
(7, 'النرجس1 ', 'El Nargis 1', '1', 6),
(8, 'النرجس2', 'El Nargis 2', '1', 6),
(9, 'النرجس3', 'El Nargis 3', '1', 6),
(10, 'النرجس4', 'El Nargis 4', '1', 6),
(11, 'النرجس5', 'El Nargis 5', '1', 6),
(12, 'النرجس6', 'El Nargis 6', '1', 6),
(13, 'النرجس7', 'El Nargis 7', '1', 6),
(14, 'النرجس8', 'El Nargis 8', '1', 6),
(15, 'النرجس عمارات', 'El Nargis Condominums', '1', 6),
(16, 'البنفسج 1', 'Al Banafseg 1', '1', 7),
(17, 'البنفسج 2', 'Al Banafseg 2', '1', 7),
(18, 'البنفسج 3 ', 'Al Banafseg 3', '1', 7),
(19, 'البنفسج 4', 'Al Banafseg 4', '1', 7),
(20, 'البنفسج 5', 'Al Banafseg 5', '1', 7),
(21, 'البنفسج 6', 'Al Banafseg 6', '1', 7),
(22, 'البنفسج 7', 'Al Banafseg 7', '1', 7),
(23, 'البنفسج 8', 'Al Banafseg 8', '1', 7),
(24, 'البنفسج 9', 'Al Banafseg 9', '1', 7),
(25, 'البنفسج 10', 'Al Banafseg 10', '1', 7),
(26, 'البنفسج 11', 'Al Banafseg 11', '1', 7),
(27, 'البنفسج 12', 'Al Banafseg 12', '1', 7),
(28, 'البنفسج عمارات', 'Al Banafseg Condominume', '1', 7),
(29, 'جنوب ألاكاديمية  أ', 'South The Academy  A', '1', 8),
(30, 'جنوب ألاكاديمية  ب', 'South The Academy  B', '1', 8),
(31, 'جنوب ألاكاديمية  ج', 'South The Academy  G', '1', 8),
(32, 'جنوب ألاكاديمية  د', 'South The Academy  D', '1', 8),
(33, 'جنوب ألاكاديمية  ز', 'South The Academy  Z', '1', 8),
(34, 'جنوب ألاكاديمية  ه', 'South The Academy  H', '1', 8),
(35, 'جنوب ألاكاديمية  و', 'South The Academy  O', '1', 8),
(36, 'الحي الاول', 'First Quarter', '1', 9),
(37, 'الحي الثاني', 'Second Quarter', '1', 9),
(38, 'الحي الثالث', 'Third Quarter', '1', 9),
(39, 'الحي الرابع', 'Fourth Quarter', '1', 9),
(40, 'الحي الخامس', 'Fifth Quarter', '1', 9),
(41, 'الياسمين  1', 'Al Yasmine  1', '1', 15),
(42, 'الياسمين  2', 'Al Yasmine  2', '1', 15),
(43, 'الياسمين  3', 'Al Yasmine  3', '1', 15),
(44, 'الياسمين  4', 'Al Yasmine  4', '1', 15),
(45, 'الياسمين  5', 'Al Yasmine 5', '1', 15),
(46, 'الياسمين  6', 'Al Yasmine  6', '1', 15),
(47, 'الياسمين  7', 'Al Yasmine  7', '1', 15),
(48, 'الياسمين  8', 'Al Yasmine  8', '1', 15),
(49, 'اللوتس  الشمالية', 'Northern Lotus', '1', 14),
(50, 'اللوتس الجنوبية', 'Southern Lotus', '1', 14),
(51, 'القطاع الثاني', '2nd Sector', '1', 1),
(52, 'القطاع الثالث', '3rd Sector', '1', 1),
(53, 'القطاع الرابع', '4th Sector', '1', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`);

--
-- Constraints for table `compound`
--
ALTER TABLE `compound`
  ADD CONSTRAINT `compound_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `fav_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `prop_status`
--
ALTER TABLE `prop_status`
  ADD CONSTRAINT `prop_id` FOREIGN KEY (`id`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `prp_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_compound` FOREIGN KEY (`compound_id`) REFERENCES `compound` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_subarea` FOREIGN KEY (`subarea_id`) REFERENCES `subarea` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_type` FOREIGN KEY (`property_type_id`) REFERENCES `prop_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_user_create` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prp_zone` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `subarea`
--
ALTER TABLE `subarea`
  ADD CONSTRAINT `area_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
