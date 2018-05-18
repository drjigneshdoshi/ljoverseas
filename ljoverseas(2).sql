-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2018 at 07:52 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ljoverseas`
--
CREATE DATABASE IF NOT EXISTS `ljoverseas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ljoverseas`;

-- --------------------------------------------------------

--
-- Table structure for table `branch_master`
--

CREATE TABLE IF NOT EXISTS `branch_master` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `branch_master`
--

INSERT INTO `branch_master` (`branch_id`, `branch_name`) VALUES
(1, 'Mechanical Engineering'),
(2, 'Manufacturing Engineering'),
(3, 'Automobile Engineering'),
(4, 'Electrical Engineering'),
(5, 'Electronics and Communication Engineering'),
(6, 'Instrumentation and Control Engineering'),
(7, 'Civil Engineering'),
(8, 'Architecture'),
(9, 'Computer Engineering'),
(10, 'Information Technology'),
(11, 'Information and Communications Technology'),
(12, 'Master of Computer Applications'),
(13, 'Pharmacy'),
(14, 'Applied Sciences'),
(15, 'Inter Disciplinary'),
(16, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_details`
--

CREATE TABLE IF NOT EXISTS `inquiry_details` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_date` date DEFAULT NULL,
  `student_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `inquiry_purpose` varchar(50) NOT NULL,
  `inquiry_description` varchar(100) NOT NULL,
  `inquiry_contact_no` int(10) NOT NULL,
  `inquiry_stream` varchar(50) NOT NULL,
  `inquiry_status` enum('Active','Close') DEFAULT NULL,
  `replied_by` int(11) DEFAULT NULL,
  `replied_on` date DEFAULT NULL,
  `replied_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `inquiry_details`
--

INSERT INTO `inquiry_details` (`inquiry_id`, `inquiry_date`, `student_name`, `emailid`, `inquiry_purpose`, `inquiry_description`, `inquiry_contact_no`, `inquiry_stream`, `inquiry_status`, `replied_by`, `replied_on`, `replied_remark`) VALUES
(118, '2018-05-17', 'Kishore Patel', 'kishore@gmail.com', 'Testing', 'Testing ', 2147483647, 'BECIVIL', 'Active', 0, '0000-00-00', ''),
(117, '2018-05-17', 'Jignesh C Doshi', 'jd@gmail.com', 'jijij jijiji', 'jijij jijij', 2147483647, 'BECIVIL', 'Active', 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `institute_master`
--

CREATE TABLE IF NOT EXISTS `institute_master` (
  `inst_id` int(3) NOT NULL AUTO_INCREMENT,
  `inst_name` varchar(100) NOT NULL,
  `inst_shrt_name` varchar(10) NOT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=562 ;

--
-- Dumping data for table `institute_master`
--

INSERT INTO `institute_master` (`inst_id`, `inst_name`, `inst_shrt_name`) VALUES
(517, 'LJ Institute of Computer Applications', 'LJICA'),
(518, 'LJ Institute of Engineering and Technology - MCA', 'LJIET'),
(519, 'LJ Institute of Management Studies - MCA', 'LJIMS'),
(561, 'LJ Institute of Engineering and Technology', 'LJICA (SF)');

-- --------------------------------------------------------

--
-- Table structure for table `mentor_master`
--

CREATE TABLE IF NOT EXISTS `mentor_master` (
  `mentor_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `mentor_type` enum('Faculty','Industry') DEFAULT NULL,
  `mentor_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `inst_id` int(3) NOT NULL,
  `branch` int(11) DEFAULT NULL,
  `photo` varchar(70) NOT NULL,
  `specialization_name` varchar(50) NOT NULL,
  PRIMARY KEY (`mentor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_master`
--

CREATE TABLE IF NOT EXISTS `student_master` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_no` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `photo` varchar(70) NOT NULL,
  `inst_id` int(3) DEFAULT NULL,
  `resi_address` varchar(100) NOT NULL,
  `resi_city` varchar(30) NOT NULL,
  `resi_state` varchar(30) NOT NULL,
  `resi_pin` varchar(10) NOT NULL,
  `branch` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `enrlno` (`enrollment_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `student_master`
--

INSERT INTO `student_master` (`student_id`, `enrollment_no`, `user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `photo`, `inst_id`, `resi_address`, `resi_city`, `resi_state`, `resi_pin`, `branch`) VALUES
(111, 0, 160, 'Abhinav', 'K', 'Shah', 'Male', 'abstract-background-design_1297-73.jpg', NULL, 'abd', 'Ahmedabad', 'Gujarat', '380009', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `user_type` enum('Admin','Student','Mentor','DeptAdmin') DEFAULT NULL,
  `user_status` enum('1','0') DEFAULT NULL,
  `created_dtm` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modify_by` int(11) DEFAULT NULL,
  `last_modify_dtm_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact` (`contact`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `email`, `contact`, `passwd`, `user_type`, `user_status`, `created_dtm`, `created_by`, `last_modify_by`, `last_modify_dtm_at`) VALUES
(161, 'jd@gmail.com', 9889000000, '25d55ad283aa400af464c76d713c07ad', 'Student', '1', '2018-05-14 00:38:54', NULL, NULL, NULL),
(160, 'ab@gmail.com', 9427021031, '1bbd886460827015e5d605ed44252251', 'Student', '1', '2018-05-14 00:36:29', NULL, NULL, NULL),
(162, 'jcd@gmail.com', 9889000001, '25d55ad283aa400af464c76d713c07ad', 'Student', '1', '2018-05-14 00:39:22', NULL, NULL, NULL),
(163, 'admin@gmail.com', 9428350490, '25d55ad283aa400af464c76d713c07ad', 'Admin', '1', NULL, NULL, NULL, NULL),
(164, 'mentor@gmail.com', 1238350480, '25d55ad283aa400af464c76d713c07ad', 'Mentor', '1', NULL, NULL, NULL, NULL),
(165, 'dept@gmail.com', 2138350480, '25d55ad283aa400af464c76d713c07ad', 'DeptAdmin', '1', NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
