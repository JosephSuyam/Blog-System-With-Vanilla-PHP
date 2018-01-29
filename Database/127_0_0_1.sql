-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2018 at 04:51 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assessment`
--
CREATE DATABASE IF NOT EXISTS `assessment` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `assessment`;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(100) NOT NULL,
  `blog` text NOT NULL,
  `blogger_id` decimal(21,0) NOT NULL,
  `blog_date` datetime DEFAULT NULL,
  `allow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_title`, `blog`, `blogger_id`, `blog_date`, `allow`) VALUES
(3, 'Rain', 'Rain is liquid water in the form of droplets that have condensed from atmospheric water vapor and then becomes heavy enough to fall under gravity. Rain is a major component of the water cycle and is responsible for depositing most of the fresh water on the Earth.', '115494738411308184762', '2018-01-24 18:16:52', 1),
(8, 'Google OAuth 2.0', 'The Google OAuth 2.0 system supports server-to-server interactions such as those between a web application and a Google service. For this scenario you need a service account , which is an account that belongs to your application instead of to an individual end user.', '115494738411308184762', '2018-01-25 20:28:37', 1),
(10, 'Thunder', 'Song by American rock band Imagine Dragons. The song was released on April 27, 2017 through Interscope Records, as the second single from their third studio album, Evolve. Thunder has peaked at number four on the Billboard Hot 100,', '109489249546440000611', '2018-01-26 12:00:32', 1),
(11, 'Aaa new blog', 'Import all the files, including the revision history, from another version control system.', '115494738411308184762', '2018-01-26 16:12:17', 0),
(12, 'got new bacons?', 'i''d like to think so.', '108082854147177015891', '2018-01-26 16:18:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `commented_blog` int(11) NOT NULL,
  `commentor_name` varchar(60) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `commented_blog`, `commentor_name`, `comment`, `comment_date`) VALUES
(7, 1, 'jose', 'yeah yeah', '2018-01-24 21:15:41'),
(9, 2, 'jojo', 'alright', '2018-01-25 08:53:02'),
(10, 1, 'jojo', 'testing', '2018-01-25 08:59:21'),
(11, 2, 'jose', 'oh yeah', '2018-01-25 09:00:05'),
(15, 1, 'jojo', 'alright', '2018-01-25 09:10:30'),
(16, 1, 'jose', 'oh yeah', '2018-01-25 09:53:16'),
(17, 1, 'jojo', 'alright', '2018-01-25 09:56:02'),
(18, 1, 'jose', 'oh yeah', '2018-01-25 09:56:32'),
(20, 3, 'jose', 'oh yeah', '2018-01-25 22:38:24'),
(21, 3, 'Jojo', 'Wow!', '2018-01-26 12:05:43'),
(22, 8, 'Jose', 'Sugoi', '2018-01-26 12:06:03'),
(23, 10, 'Jose', 'Thunder!', '2018-01-26 12:06:22'),
(24, 10, 'JoJo', 'Feel the thunder', '2018-01-26 12:06:33'),
(25, 10, 'Jose', 'Lightning then the thunder', '2018-01-26 12:07:28'),
(26, 10, 'JoJo', 'thunder', '2018-01-26 12:07:38'),
(27, 3, 'Jose', 'comment', '2018-01-26 16:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `google_users`
--

CREATE TABLE `google_users` (
  `google_id` decimal(21,0) NOT NULL,
  `google_name` varchar(60) NOT NULL,
  `google_email` varchar(60) NOT NULL,
  `google_picture_link` varchar(60) NOT NULL,
  `user_type` int(11) NOT NULL,
  `access` tinyint(1) DEFAULT NULL,
  `date_join` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `google_users`
--

INSERT INTO `google_users` (`google_id`, `google_name`, `google_email`, `google_picture_link`, `user_type`, `access`, `date_join`) VALUES
('108082854147177015891', 'NMS Dev Shed', 'nmsdevshed@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/A', 0, 0, NULL),
('108549864188689839029', 'Suyam Joseph', 'suyamjoseph@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/A', 0, 1, '2018-01-24 18:16:52'),
('109489249546440000611', 'Jose Phu', 'yohosephu@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/A', 0, 1, NULL),
('115494738411308184762', 'Jose Yep', 'joseiyep@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/A', 1, 1, '2018-01-25 20:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `usertype`, `email`, `password`) VALUES
(1, 1, 'josephsuyam@gmail.com', '7510d498f23f5815d3376ea7bad64e29'),
(2, 2, 'joseph@gmail.com', '7510d498f23f5815d3376ea7bad64e29'),
(3, 2, 'suyam@gmail.com', '7510d498f23f5815d3376ea7bad64e29');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(60) NOT NULL,
  `type_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`type_id`, `type_name`, `type_desc`) VALUES
(0, 'User', 'Bloggers and Visitors'),
(1, 'Admin', 'Administration');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `google_users`
--
ALTER TABLE `google_users`
  ADD PRIMARY KEY (`google_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;--
-- Database: `db_production`
--
CREATE DATABASE IF NOT EXISTS `db_production` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_production`;

-- --------------------------------------------------------

--
-- Table structure for table `course_offerings`
--

CREATE TABLE `course_offerings` (
  `SUB_SEC_INDEX` int(11) NOT NULL,
  `CUR_INDEX` int(11) DEFAULT NULL,
  `SUB_INDEX` int(11) DEFAULT NULL,
  `SECTION` varchar(32) DEFAULT NULL,
  `OFFERING_SY_FROM` smallint(6) DEFAULT NULL,
  `OFFERING_SY_TO` smallint(6) DEFAULT NULL,
  `OFFERING_SEM` tinyint(4) DEFAULT NULL,
  `IS_LEC` tinyint(4) DEFAULT NULL,
  `ENCODED_BY` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `LAST_MOD_DATE` datetime DEFAULT NULL,
  `LAST_MOD_BY` int(11) DEFAULT NULL,
  `IS_DEL` tinyint(4) NOT NULL,
  `IS_VALID` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_offerings`
--

INSERT INTO `course_offerings` (`SUB_SEC_INDEX`, `CUR_INDEX`, `SUB_INDEX`, `SECTION`, `OFFERING_SY_FROM`, `OFFERING_SY_TO`, `OFFERING_SEM`, `IS_LEC`, `ENCODED_BY`, `CREATE_DATE`, `LAST_MOD_DATE`, `LAST_MOD_BY`, `IS_DEL`, `IS_VALID`) VALUES
(10001, 20001, 1, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1),
(10002, 20002, 2, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1),
(10003, 20003, 3, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1),
(10004, 20004, 4, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1),
(10005, 20005, 5, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1),
(10006, 20006, 6, 'ABM-A', 2016, 2017, 1, 1, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `curriculums`
--

CREATE TABLE `curriculums` (
  `CUR_INDEX` int(11) NOT NULL,
  `COURSE_INDEX` int(11) DEFAULT NULL,
  `MAJOR_INDEX` int(11) DEFAULT NULL,
  `SUB_INDEX` int(11) DEFAULT NULL,
  `LEC_UNIT` float DEFAULT NULL,
  `LAB_UNIT` float DEFAULT NULL,
  `SY_FROM` smallint(6) DEFAULT NULL,
  `SY_TO` smallint(6) DEFAULT NULL,
  `YEAR` tinyint(4) DEFAULT NULL,
  `SEMESTER` tinyint(4) DEFAULT NULL,
  `ENCODED_BY` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `LAST_MOD_DATE` datetime DEFAULT NULL,
  `LAST_MOD_BY` int(11) DEFAULT NULL,
  `IS_DEL` tinyint(4) NOT NULL,
  `IS_VALID` tinyint(4) NOT NULL,
  `ORDER_N0` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curriculums`
--

INSERT INTO `curriculums` (`CUR_INDEX`, `COURSE_INDEX`, `MAJOR_INDEX`, `SUB_INDEX`, `LEC_UNIT`, `LAB_UNIT`, `SY_FROM`, `SY_TO`, `YEAR`, `SEMESTER`, `ENCODED_BY`, `CREATE_DATE`, `LAST_MOD_DATE`, `LAST_MOD_BY`, `IS_DEL`, `IS_VALID`, `ORDER_N0`) VALUES
(20001, 0, 0, 1, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 1),
(20002, 0, 0, 2, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 2),
(20003, 0, 0, 3, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 3),
(20004, 0, 0, 4, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 4),
(20005, 0, 0, 5, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 5),
(20006, 0, 0, 6, 1, 0, 2016, 2017, 18, 1, NULL, NULL, NULL, NULL, 0, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `enroll_details`
--

CREATE TABLE `enroll_details` (
  `ENROLL_INDEX` int(11) NOT NULL,
  `USER_INDEX` int(11) NOT NULL,
  `CUR_INDEX` int(11) NOT NULL,
  `SY_FROM` smallint(6) NOT NULL,
  `SY_TO` smallint(6) NOT NULL,
  `CURRENT_YEAR_LEVEL` tinyint(4) DEFAULT NULL,
  `CURRENT_SEMESTER` tinyint(4) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL,
  `SUB_SEC_INDEX` int(11) DEFAULT NULL,
  `UNIT_ENROLLED` float DEFAULT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `LAST_MOD_DATE` datetime DEFAULT NULL,
  `LAST_MOD_BY` int(11) DEFAULT NULL,
  `IS_DEL` smallint(6) NOT NULL,
  `IS_VALID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enroll_details`
--

INSERT INTO `enroll_details` (`ENROLL_INDEX`, `USER_INDEX`, `CUR_INDEX`, `SY_FROM`, `SY_TO`, `CURRENT_YEAR_LEVEL`, `CURRENT_SEMESTER`, `IS_CONFIRMED`, `SUB_SEC_INDEX`, `UNIT_ENROLLED`, `CREATED_BY`, `CREATE_DATE`, `LAST_MOD_DATE`, `LAST_MOD_BY`, `IS_DEL`, `IS_VALID`) VALUES
(0, 1, 20001, 2016, 2017, 18, 1, 1, 10001, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1),
(11, 2, 20002, 2016, 2017, 18, 1, 1, 10002, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1),
(12, 3, 20003, 2016, 2017, 18, 1, 1, 10003, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1),
(13, 4, 20004, 2016, 2017, 18, 1, 1, 10004, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1),
(14, 5, 20005, 2016, 2017, 18, 1, 1, 10005, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1),
(15, 6, 20006, 2016, 2017, 18, 1, 1, 10006, 1, 0, '0000-00-00 00:00:00', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_assign`
--

CREATE TABLE `room_assign` (
  `R_ASSIGN_INDEX` int(11) NOT NULL,
  `SUB_SEC_INDEX` int(11) DEFAULT NULL,
  `WEEK_DAY` char(1) DEFAULT NULL,
  `HOUR_FROM` tinyint(4) DEFAULT NULL,
  `MINUTE_FROM` tinyint(4) DEFAULT NULL,
  `AMPM_FROM` tinyint(4) NOT NULL,
  `HOUR_TO` tinyint(4) DEFAULT NULL,
  `MINUTE_TO` tinyint(4) DEFAULT NULL,
  `AMPM_TO` tinyint(4) NOT NULL,
  `ROOM_NUMBER` varchar(25) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `LAST_MOD_DATE` datetime DEFAULT NULL,
  `LAST_MOD_BY` int(11) DEFAULT NULL,
  `IS_DEL` tinyint(4) NOT NULL,
  `IS_VALID` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_assign`
--

INSERT INTO `room_assign` (`R_ASSIGN_INDEX`, `SUB_SEC_INDEX`, `WEEK_DAY`, `HOUR_FROM`, `MINUTE_FROM`, `AMPM_FROM`, `HOUR_TO`, `MINUTE_TO`, `AMPM_TO`, `ROOM_NUMBER`, `CREATED_BY`, `CREATE_DATE`, `LAST_MOD_DATE`, `LAST_MOD_BY`, `IS_DEL`, `IS_VALID`) VALUES
(21, 10001, '1', 7, 30, 0, 8, 30, 0, 'S201', NULL, NULL, NULL, NULL, 0, 1),
(22, 10001, '2', 7, 30, 0, 8, 30, 0, 'S201', NULL, NULL, NULL, NULL, 0, 1),
(23, 10001, '3', 7, 30, 0, 8, 30, 0, 'S201', NULL, NULL, NULL, NULL, 0, 1),
(24, 10001, '4', 7, 30, 0, 8, 30, 0, 'S201', NULL, NULL, NULL, NULL, 0, 1),
(25, 10001, '5', 7, 30, 0, 8, 30, 0, 'S201', NULL, NULL, NULL, NULL, 0, 1),
(26, 10002, '1', 8, 30, 0, 9, 30, 0, 'S202', NULL, NULL, NULL, NULL, 0, 1),
(27, 10002, '2', 8, 30, 0, 9, 30, 0, 'S202', NULL, NULL, NULL, NULL, 0, 1),
(28, 10002, '3', 8, 30, 0, 9, 30, 0, 'S202', NULL, NULL, NULL, NULL, 0, 1),
(29, 10002, '4', 8, 30, 0, 9, 30, 0, 'S202', NULL, NULL, NULL, NULL, 0, 1),
(30, 10002, '5', 8, 30, 0, 9, 30, 0, 'S202', NULL, NULL, NULL, NULL, 0, 1),
(31, 10003, '1', 9, 30, 0, 10, 30, 0, 'S203', NULL, NULL, NULL, NULL, 0, 1),
(32, 10003, '2', 9, 30, 0, 10, 30, 0, 'S203', NULL, NULL, NULL, NULL, 0, 1),
(33, 10003, '3', 9, 30, 0, 10, 30, 0, 'S203', NULL, NULL, NULL, NULL, 0, 1),
(34, 10003, '4', 9, 30, 0, 10, 30, 0, 'S203', NULL, NULL, NULL, NULL, 0, 1),
(35, 10003, '5', 9, 30, 0, 10, 30, 0, 'S203', NULL, NULL, NULL, NULL, 0, 1),
(36, 10004, '1', 10, 30, 0, 11, 30, 0, 'S204', NULL, NULL, NULL, NULL, 0, 1),
(37, 10004, '2', 10, 30, 0, 11, 30, 0, 'S204', NULL, NULL, NULL, NULL, 0, 1),
(38, 10004, '3', 10, 30, 0, 11, 30, 0, 'S204', NULL, NULL, NULL, NULL, 0, 1),
(39, 10004, '4', 10, 30, 0, 11, 30, 0, 'S204', NULL, NULL, NULL, NULL, 0, 1),
(40, 10004, '5', 10, 30, 0, 11, 30, 0, 'S204', NULL, NULL, NULL, NULL, 0, 1),
(41, 10005, '1', 11, 30, 0, 12, 30, 1, 'S205', NULL, NULL, NULL, NULL, 0, 1),
(42, 10005, '3', 11, 30, 0, 12, 30, 1, 'S205', NULL, NULL, NULL, NULL, 0, 1),
(43, 10005, '5', 11, 30, 0, 12, 30, 1, 'S205', NULL, NULL, NULL, NULL, 0, 1),
(44, 10006, '1', 1, 30, 1, 2, 30, 1, 'S206', NULL, NULL, NULL, NULL, 0, 1),
(45, 10006, '2', 1, 30, 1, 2, 30, 1, 'S206', NULL, NULL, NULL, NULL, 0, 1),
(46, 10006, '3', 1, 30, 1, 2, 30, 1, 'S206', NULL, NULL, NULL, NULL, 0, 1),
(47, 10006, '4', 1, 30, 1, 2, 30, 1, 'S206', NULL, NULL, NULL, NULL, 0, 1),
(48, 10006, '5', 1, 30, 1, 2, 30, 1, 'S206', NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SUB_INDEX` int(11) NOT NULL,
  `SUB_CODE` varchar(64) DEFAULT NULL,
  `SUB_NAME` varchar(128) DEFAULT NULL,
  `IS_DEL` tinyint(4) NOT NULL,
  `ENCODED_BY_` int(11) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `LMD_BY` int(11) DEFAULT NULL,
  `LMD_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SUB_INDEX`, `SUB_CODE`, `SUB_NAME`, `IS_DEL`, `ENCODED_BY_`, `CREATE_DATE_`, `LMD_BY`, `LMD_DATE`) VALUES
(1, 'MATH', 'MATHEMATICS', 0, NULL, NULL, NULL, NULL),
(2, 'ENGLISH', 'ENGLISH', 0, NULL, NULL, NULL, NULL),
(3, 'FIL', 'FILIPINO', 0, NULL, NULL, NULL, NULL),
(4, 'SCIENCE', 'SCIENCE AND TECHNOLOGY', 0, NULL, NULL, NULL, NULL),
(5, 'PE', 'PHYSICAL SCIENCE', 0, NULL, NULL, NULL, NULL),
(6, 'AP', 'ARALING PANLIPUNAN', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grades`
--

CREATE TABLE `tbl_grades` (
  `GS_INDEX` int(11) NOT NULL,
  `quarter` int(11) DEFAULT NULL,
  `SUB_SEC_INDEX` int(11) DEFAULT NULL,
  `CUR_INDEX` int(11) DEFAULT NULL,
  `CREDIT_EARNED` float DEFAULT NULL,
  `GRADE` decimal(10,0) DEFAULT NULL,
  `REMARK_INDEX` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `IS_VALID` tinyint(4) NOT NULL,
  `IS_DEL` tinyint(4) NOT NULL,
  `USER_INDEX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_grades`
--

INSERT INTO `tbl_grades` (`GS_INDEX`, `quarter`, `SUB_SEC_INDEX`, `CUR_INDEX`, `CREDIT_EARNED`, `GRADE`, `REMARK_INDEX`, `CREATED_BY`, `CREATE_DATE`, `IS_VALID`, `IS_DEL`, `USER_INDEX`) VALUES
(5, 1, 10001, 2001, 1, '85', 1, 0, '0000-00-00 00:00:00', 1, 0, 1),
(6, 2, 10001, 2001, 1, '86', 1, 0, '0000-00-00 00:00:00', 1, 0, 1),
(7, 1, 10001, 2001, 1, '87', 1, 0, '0000-00-00 00:00:00', 1, 0, 2),
(8, 2, 10001, 2001, 1, '89', 1, 0, '0000-00-00 00:00:00', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stud_lrn`
--

CREATE TABLE `tbl_stud_lrn` (
  `USER_INDEX` bigint(20) NOT NULL,
  `LRN_NUMBER` varchar(50) NOT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODIFY_DATE` date DEFAULT NULL,
  `MOFIFIED_BY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_stud_lrn`
--

INSERT INTO `tbl_stud_lrn` (`USER_INDEX`, `LRN_NUMBER`, `CREATE_DATE`, `CREATED_BY`, `MODIFY_DATE`, `MOFIFIED_BY`) VALUES
(1, '100001', NULL, NULL, NULL, NULL),
(2, '100002', NULL, NULL, NULL, NULL),
(3, '100003', NULL, NULL, NULL, NULL),
(4, '100004', NULL, NULL, NULL, NULL),
(5, '100005', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_curriculums`
--

CREATE TABLE `tbl_student_curriculums` (
  `CUR_HIST_INDEX` int(11) NOT NULL,
  `USER_INDEX` int(11) NOT NULL,
  `STATUS_INDEX` int(11) DEFAULT NULL,
  `CY_FROM` smallint(6) NOT NULL,
  `CY_TO` smallint(6) NOT NULL,
  `MAJOR_INDEX` int(11) DEFAULT NULL,
  `IS_VALID` tinyint(1) NOT NULL,
  `COURSE_TYPE` tinyint(4) NOT NULL,
  `SY_FROM` smallint(6) DEFAULT NULL,
  `SY_TO` smallint(6) DEFAULT NULL,
  `YEAR_LEVEL` tinyint(4) DEFAULT NULL,
  `SEMESTER` tinyint(4) DEFAULT NULL,
  `DATE_OF_ENROLLMENT` datetime DEFAULT NULL,
  `DATE_ENROLLED` datetime DEFAULT NULL,
  `SECTION_NAME` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_student_curriculums`
--

INSERT INTO `tbl_student_curriculums` (`CUR_HIST_INDEX`, `USER_INDEX`, `STATUS_INDEX`, `CY_FROM`, `CY_TO`, `MAJOR_INDEX`, `IS_VALID`, `COURSE_TYPE`, `SY_FROM`, `SY_TO`, `YEAR_LEVEL`, `SEMESTER`, `DATE_OF_ENROLLMENT`, `DATE_ENROLLED`, `SECTION_NAME`) VALUES
(1, 1, 1, 2016, 2017, NULL, 1, 0, 2016, 2017, 18, 1, NULL, NULL, 'ABM-A'),
(2, 2, 1, 2016, 2017, NULL, 1, 0, 2016, 2017, 18, 1, NULL, NULL, 'ABM-B'),
(3, 3, 1, 2016, 2017, NULL, 1, 0, 2016, 2017, 19, 1, NULL, NULL, 'HUMMS-A'),
(4, 4, 1, 2016, 2017, NULL, 1, 0, 2016, 2017, 19, 1, NULL, NULL, 'HUMMS-B'),
(5, 5, 1, 2016, 2017, NULL, 1, 0, 2016, 2017, 19, 1, NULL, NULL, 'HUMMS-A');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_info`
--

CREATE TABLE `tbl_student_info` (
  `user_index` bigint(20) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `bod` date DEFAULT NULL,
  `religion` char(32) DEFAULT NULL,
  `nationality` char(32) DEFAULT NULL,
  `place_of_birth` varchar(160) DEFAULT NULL,
  `civil_stat` varchar(32) DEFAULT NULL,
  `maiden_name` varchar(64) DEFAULT NULL,
  `spouse_name` varchar(64) DEFAULT NULL,
  `no_of_children` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `birth_order` tinyint(2) DEFAULT NULL,
  `contact_mob_no` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_student_info`
--

INSERT INTO `tbl_student_info` (`user_index`, `gender`, `bod`, `religion`, `nationality`, `place_of_birth`, `civil_stat`, `maiden_name`, `spouse_name`, `no_of_children`, `email`, `birth_order`, `contact_mob_no`) VALUES
(1, 'M', '1998-06-30', 'Baptist', 'Filipino', 'Baguio City', 'Single', 'Cagas', NULL, NULL, 'josephsuyam@gmail.com', 8, '09123825484'),
(2, 'M', '1999-06-30', 'Baptist', 'Filipino', 'Baguio City', 'Single', 'Once', NULL, NULL, 'juant@gmail.com', 7, '09123456780'),
(3, 'F', '2000-06-30', 'Baptist', 'Filipino', 'Baguio City', 'Single', 'Claro', NULL, NULL, 'maria@gmail.com', 6, '09123456781'),
(4, 'F', '2001-06-30', 'Baptist', 'Filipino', 'Baguio City', 'Single', 'And', NULL, NULL, 'maryjane@gmail.com', 5, '09123456782'),
(5, 'M', '2002-06-30', 'Baptist', 'Filipino', 'Baguio City', 'Single', 'Sir', NULL, NULL, 'junjun@gmail.com', 4, '09123456783');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `user_index` bigint(20) UNSIGNED NOT NULL,
  `id_number` char(11) DEFAULT NULL,
  `lname` varchar(80) DEFAULT NULL,
  `fname` varchar(80) DEFAULT NULL,
  `mname` varchar(80) DEFAULT NULL,
  `barcode_id` char(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `modify_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`user_index`, `id_number`, `lname`, `fname`, `mname`, `barcode_id`, `is_active`, `is_del`, `is_valid`, `create_date`, `modify_date`, `created_by`, `modified_by`) VALUES
(1, '14-2513-634', 'Suyam', 'Joseph', 'Cagas', '0000010001', 1, 0, 1, NULL, NULL, NULL, NULL),
(2, '14-2513-002', 'Tamad', 'Juan', 'Once', '0000010002', 1, 0, 1, NULL, NULL, NULL, NULL),
(3, '14-2513-003', 'Clara', 'Maria', 'Claro', '0000010003', 1, 0, 1, NULL, NULL, NULL, NULL),
(4, '14-2513-004', 'Juana', 'Mary', 'And', '0000010004', 1, 0, 1, NULL, NULL, NULL, NULL),
(5, '14-2513-005', 'Tabas', 'Junior', 'Sir', '0000010005', 1, 0, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sy_default_term`
--

CREATE TABLE `tbl_sy_default_term` (
  `id` int(11) NOT NULL,
  `sy_from` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `date_fr` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sy_default_term`
--

INSERT INTO `tbl_sy_default_term` (`id`, `sy_from`, `semester`, `date_fr`, `date_to`, `is_valid`) VALUES
(1, 2016, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_track_info`
--

CREATE TABLE `tbl_track_info` (
  `EDU_LEVEL` tinyint(4) NOT NULL DEFAULT '0',
  `EDU_LEVEL_NAME` varchar(50) DEFAULT NULL,
  `G_LEVEL` tinyint(4) DEFAULT NULL,
  `LEVEL_NAME` varchar(50) DEFAULT NULL,
  `college_code_` varchar(32) DEFAULT NULL,
  `g_level_uc` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_track_info`
--

INSERT INTO `tbl_track_info` (`EDU_LEVEL`, `EDU_LEVEL_NAME`, `G_LEVEL`, `LEVEL_NAME`, `college_code_`, `g_level_uc`) VALUES
(3, 'SHS', 18, 'Grade 11-ABM', 'HS', 11),
(3, 'SHS', 19, 'Grade 11-HUMSS', 'HS', 11),
(3, 'SHS', 20, 'Grade 11-STEM', 'HS', 11),
(3, 'SHS', 21, 'Grade 11-GAS', 'HS', 11),
(3, 'SHS', 22, 'Grade 11-SPORTS', 'HS', 11),
(3, 'SHS', 23, 'Grade 11-HE (Tour Guiding Services)', 'HS', 11),
(3, 'SHS', 24, 'Grade 11-HE (Housekeeping, TGS, TPS & BPP)', 'HS', 11),
(3, 'SHS', 25, 'Grade 11-HE (Caregiving, HK & FBS)', 'HS', 11),
(3, 'SHS', 26, 'Grade 11-ICT', 'HS', 11),
(3, 'SHS', 27, 'Grade 11-IA', 'HS', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `student_id` char(11) DEFAULT NULL,
  `retries` int(11) DEFAULT '0',
  `usertype` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `student_id`, `retries`, `usertype`, `create_date`, `created_by`, `modify_date`, `modified_by`) VALUES
(1, 'Admin', '21232f297a57a5a743894a0e4a801fc3', '14-2513-634', 0, 0, '2017-02-28', NULL, NULL, NULL),
(2, 'Juan', 'a94652aa97c7211ba8954dd15a3cf838', '14-2513-002', 0, 0, '2017-02-28', NULL, NULL, NULL),
(3, 'Maria', '263bce650e68ab4e23f28263760b9fa5', '14-2513-003', 0, 0, '2017-02-28', NULL, NULL, NULL),
(4, 'Mary', 'e39e74fb4e80ba656f773669ed50315a', '14-2513-004', 0, 0, '2017-02-28', NULL, NULL, NULL),
(5, 'Junior', 'b03e3fd2b3d22ff6df2796c412b09311', '14-2513-005', 0, 0, '2017-02-28', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_offerings`
--
ALTER TABLE `course_offerings`
  ADD PRIMARY KEY (`SUB_SEC_INDEX`),
  ADD KEY `CUR_INDEX` (`CUR_INDEX`) USING BTREE,
  ADD KEY `SUB_INDEX` (`SUB_INDEX`) USING BTREE,
  ADD KEY `ENCODED_BY` (`ENCODED_BY`) USING BTREE,
  ADD KEY `LAST_MOD_BY` (`LAST_MOD_BY`) USING BTREE;

--
-- Indexes for table `curriculums`
--
ALTER TABLE `curriculums`
  ADD PRIMARY KEY (`CUR_INDEX`),
  ADD KEY `SUB_INDEX` (`SUB_INDEX`) USING BTREE;

--
-- Indexes for table `enroll_details`
--
ALTER TABLE `enroll_details`
  ADD PRIMARY KEY (`ENROLL_INDEX`),
  ADD KEY `USER_INDEX` (`USER_INDEX`) USING BTREE,
  ADD KEY `SUB_SEC_INDEX` (`SUB_SEC_INDEX`) USING BTREE,
  ADD KEY `CUR_INDEX` (`CUR_INDEX`) USING BTREE;

--
-- Indexes for table `room_assign`
--
ALTER TABLE `room_assign`
  ADD PRIMARY KEY (`R_ASSIGN_INDEX`),
  ADD KEY `SUB_SEC_INDEX` (`SUB_SEC_INDEX`) USING BTREE;

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SUB_INDEX`);

--
-- Indexes for table `tbl_grades`
--
ALTER TABLE `tbl_grades`
  ADD PRIMARY KEY (`GS_INDEX`),
  ADD KEY `SUB_SEC_INDEX` (`SUB_SEC_INDEX`) USING BTREE,
  ADD KEY `USER_INDEX` (`USER_INDEX`) USING BTREE;

--
-- Indexes for table `tbl_stud_lrn`
--
ALTER TABLE `tbl_stud_lrn`
  ADD PRIMARY KEY (`USER_INDEX`);

--
-- Indexes for table `tbl_student_curriculums`
--
ALTER TABLE `tbl_student_curriculums`
  ADD PRIMARY KEY (`CUR_HIST_INDEX`),
  ADD KEY `USER_INDEX` (`USER_INDEX`) USING BTREE;

--
-- Indexes for table `tbl_student_info`
--
ALTER TABLE `tbl_student_info`
  ADD PRIMARY KEY (`user_index`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`user_index`);

--
-- Indexes for table `tbl_sy_default_term`
--
ALTER TABLE `tbl_sy_default_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_grades`
--
ALTER TABLE `tbl_grades`
  MODIFY `GS_INDEX` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_sy_default_term`
--
ALTER TABLE `tbl_sy_default_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;--
-- Database: `db_technolearn`
--
CREATE DATABASE IF NOT EXISTS `db_technolearn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_technolearn`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lessons`
--

CREATE TABLE `tbl_lessons` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` varchar(200) NOT NULL,
  `lesson_desc` varchar(1000) DEFAULT NULL,
  `lesson` longblob NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lessons`
--

INSERT INTO `tbl_lessons` (`lesson_id`, `lesson_name`, `lesson_desc`, `lesson`, `created_by`, `date_created`) VALUES
(27, 'Adjectives', 'A part of speech that describes a noun or pronoun. Adjectives are usually placed just before or after the words they describe.', 0x687474703a2f2f6c6f63616c686f73742f546563686e6f6c6561726e2f4c6573736f6e2f41646a656374697665732e6d7034, 1, '2017-08-11'),
(28, 'Pronouns', 'Pronouns are used in place of a noun that has already been mentioned or that is already known, often to avoid repeating the noun.', 0x687474703a2f2f6c6f63616c686f73742f546563686e6f6c6561726e2f4c6573736f6e2f50726f6e6f756e732e6d7034, 1, '2017-08-11'),
(29, 'Test', 'Testing', 0x687474703a2f2f6c6f63616c686f73742f546563686e6f6c6561726e2f4c6573736f6e2f746573742e6d7034, 1, '2017-08-12'),
(30, 'Null', 'Empty', 0x687474703a2f2f6c6f63616c686f73742f546563686e6f6c6561726e2f4c6573736f6e2f746573742e6d7034, 1, '2017-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ques_types`
--

CREATE TABLE `tbl_ques_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ques_types`
--

INSERT INTO `tbl_ques_types` (`id`, `type_name`) VALUES
(1, 'Multiple Choice'),
(2, 'True or False'),
(3, 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE `tbl_questions` (
  `question_id` int(11) NOT NULL,
  `ques_type` int(11) NOT NULL,
  `lesson_no` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `correct_ans` varchar(400) NOT NULL,
  `fchoice` varchar(400) DEFAULT NULL,
  `schoice` varchar(400) DEFAULT NULL,
  `tchoice` varchar(400) DEFAULT NULL,
  `result` smallint(3) DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_questions`
--

INSERT INTO `tbl_questions` (`question_id`, `ques_type`, `lesson_no`, `question`, `correct_ans`, `fchoice`, `schoice`, `tchoice`, `result`, `user`) VALUES
(91, 1, 27, 'Her hair is long and _________.', 'curly', 'curly', 'happy', 'late', NULL, NULL),
(92, 1, 27, 'He drives a bright red sports car. It''s very _________.', 'fast', 'wild', 'shallow', 'fast', NULL, NULL),
(93, 1, 27, 'Today, the weather''s going to be ___________.', 'warm', 'urgent', 'warm', 'large', NULL, NULL),
(94, 1, 27, 'This house is _________ and old.', 'large', 'awkward', 'large', 'fat', NULL, NULL),
(95, 1, 27, 'I''m feeling really ________ today', 'happy', 'long', 'round', 'happy', NULL, NULL),
(96, 1, 27, 'The food at this supermarket is always _________.', 'fresh', 'hopeful', 'gentle', 'fresh', NULL, NULL),
(97, 1, 27, 'Her new husband is very ________.', 'smart', 'high', 'smart', 'urgent', NULL, NULL),
(98, 1, 27, 'I had a brilliant holiday. It was really _______.', 'relaxing', 'relaxing', 'low', 'straight', NULL, NULL),
(99, 1, 27, 'I have fallen in love with a _________ woman.', 'beautiful', 'closed', 'beautiful', 'handsome', NULL, NULL),
(100, 1, 27, 'Which word is an adjective?', 'pretty', 'after', 'pretty', 'taste', NULL, NULL),
(101, 1, 28, '_________ need to follow me closely.', 'You', 'You', 'Them', 'Us', NULL, NULL),
(102, 1, 28, 'Lewis, Luke and Thomas were mad because ________ had waited ages for the bus.', 'they', 'them', 'he', 'they', NULL, NULL),
(103, 1, 28, 'John watched the children carefully as _________ crossed the road.', 'they', 'him', 'they', 'us', NULL, NULL),
(104, 1, 28, 'Hold the bag please while I put the groceries in ________.', 'it', 'it', 'I', 'she', NULL, NULL),
(105, 1, 28, 'Melanie and I are going soon so you can come with _________.', 'us', 'we', 'they', 'us', NULL, NULL),
(106, 1, 28, 'Thank you for collecting ________.', 'me', 'me', 'he', 'she', NULL, NULL),
(107, 1, 28, 'I wonder why John rushed off. Did you upset _______?', 'him', 'he', 'him', 'they', NULL, NULL),
(108, 1, 28, '_______ hope those flowers are for me.', 'I', 'Them', 'I', 'Him', NULL, NULL),
(109, 1, 28, 'Open the door. It''s ______.', 'me', 'I', 'she', 'me', NULL, NULL),
(110, 1, 28, 'Sarah wanted Lisa to follow ________.', 'her', 'she', 'they', 'her', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_scores`
--

CREATE TABLE `tbl_scores` (
  `score` int(11) NOT NULL,
  `user_id_score` char(14) NOT NULL,
  `lesson_no_score` int(11) NOT NULL,
  `date_answered` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_scores`
--

INSERT INTO `tbl_scores` (`score`, `user_id_score`, `lesson_no_score`, `date_answered`) VALUES
(2, '22-2222-222', 24, '2017-08-03'),
(10, '22-2222-222', 27, '2017-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user_id` char(14) NOT NULL,
  `usertype` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `retries` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user_id`, `usertype`, `username`, `password`, `retries`) VALUES
(1, '14-2513-634', 1, 'Admin', '7510d498f23f5815d3376ea7bad64e29', 0),
(3, '22-2222-222', 3, 'Student', 'b9ac0988cdd72928bc964d81d5858bb7', 3),
(19, '11-1111-111', 2, 'Teacher', '38cc16707c6795b8016cda508226ca54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_info`
--

CREATE TABLE `tbl_users_info` (
  `users_info_id` char(14) NOT NULL,
  `ques_result` smallint(3) DEFAULT '0',
  `lname` varchar(80) NOT NULL,
  `fname` varchar(80) NOT NULL,
  `mname` varchar(80) DEFAULT NULL,
  `gender` varchar(6) DEFAULT 'Male',
  `bod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users_info`
--

INSERT INTO `tbl_users_info` (`users_info_id`, `ques_result`, `lname`, `fname`, `mname`, `gender`, `bod`) VALUES
('11-1111-111', 0, 'Instructor', 'Teacher', '', 'Male', '1990-08-27'),
('14-2513-634', 0, 'Suyam', 'Joseph', 'Cagas', 'Male', '1998-06-30'),
('22-2222-222', 0, 'User', 'Student', '', 'Female', '2000-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usertypes`
--

CREATE TABLE `tbl_usertypes` (
  `usertype_id` int(11) NOT NULL,
  `type_name` varchar(40) NOT NULL,
  `type_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usertypes`
--

INSERT INTO `tbl_usertypes` (`usertype_id`, `type_name`, `type_desc`) VALUES
(1, 'Admin', 'System Administrator'),
(2, 'Teacher', 'Instructor'),
(3, 'Student', 'Students');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_lessons`
--
ALTER TABLE `tbl_lessons`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `tbl_ques_types`
--
ALTER TABLE `tbl_ques_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_users_info`
--
ALTER TABLE `tbl_users_info`
  ADD PRIMARY KEY (`users_info_id`);

--
-- Indexes for table `tbl_usertypes`
--
ALTER TABLE `tbl_usertypes`
  ADD PRIMARY KEY (`usertype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_lessons`
--
ALTER TABLE `tbl_lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tbl_ques_types`
--
ALTER TABLE `tbl_ques_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;--
-- Database: `db_wis`
--
CREATE DATABASE IF NOT EXISTS `db_wis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_wis`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colleges`
--

CREATE TABLE `tbl_colleges` (
  `ID` int(11) NOT NULL,
  `College_Code` char(15) DEFAULT NULL,
  `College_Desc` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_colleges`
--

INSERT INTO `tbl_colleges` (`ID`, `College_Code`, `College_Desc`) VALUES
(1, 'CITCS', 'College of Information Technology and Computer Science'),
(5, 'COA', 'College of Accountancy'),
(6, 'CON', 'College of Nursing'),
(7, 'CBA', 'College of Business Administration');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `ID` int(11) NOT NULL,
  `Course_Code` char(15) NOT NULL,
  `Course_Desc` varchar(150) DEFAULT NULL,
  `College` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`ID`, `Course_Code`, `Course_Desc`, `College`) VALUES
(18, 'BSIT', 'Bachelor of Science in Information Technology', 1),
(19, 'BSCS', 'Bachelor of Science in Computer Sciences', 1),
(20, 'BSA', 'Bachelor of Science in Accountancy', 5),
(21, 'BSN', 'Bachelor of Science in Nursing', 1),
(25, 'test', 'test', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(80) NOT NULL,
  `module_desc` varchar(180) NOT NULL,
  `file_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`id`, `module_name`, `module_desc`, `file_name`) VALUES
(1, 'User Management', 'Managing users', 'user_mgmt.php'),
(2, 'Add User Management', 'Add a user management', 'user_add.php'),
(5, 'Edit User', 'Edit User', 'user_edit.php');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `IDNo` char(11) NOT NULL,
  `LName` varchar(80) NOT NULL,
  `FName` varchar(80) NOT NULL,
  `MName` varchar(80) DEFAULT NULL,
  `Gender` char(6) DEFAULT 'Male',
  `Course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`IDNo`, `LName`, `FName`, `MName`, `Gender`, `Course`) VALUES
('11-1111-111', 'test', 'test', 'test', 'Female', 20),
('14-1141-144', 'Dasen', 'Michael', 'A.', 'Male', 20),
('14-2513-634', 'Suyam', 'Joseph', 'Cagas', 'Male', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(180) DEFAULT NULL,
  `retries` tinyint(1) DEFAULT '0',
  `usertype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `fullname`, `retries`, `usertype`) VALUES
(1, 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'System Administrator Jose', 4, 1),
(6, 'Test', '098f6bcd4621d373cade4e832627b4f6', 'Test', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usertype_access`
--

CREATE TABLE `tbl_usertype_access` (
  `id` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `can_add` tinyint(1) DEFAULT '0',
  `can_edit` tinyint(1) DEFAULT '0',
  `can_delete` tinyint(1) DEFAULT '0',
  `can_print` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usertype_access`
--

INSERT INTO `tbl_usertype_access` (`id`, `usertype`, `module`, `can_add`, `can_edit`, `can_delete`, `can_print`) VALUES
(4, 1, 1, 1, 1, 1, 1),
(6, 5, 5, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usertypes`
--

CREATE TABLE `tbl_usertypes` (
  `id` int(11) NOT NULL,
  `type_name` varchar(30) DEFAULT NULL,
  `type_desc` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usertypes`
--

INSERT INTO `tbl_usertypes` (`id`, `type_name`, `type_desc`) VALUES
(1, 'Admin', 'System Administrator Jose'),
(6, 'test', 'test'),
(7, 'student', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_colleges`
--
ALTER TABLE `tbl_colleges`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `College_Code` (`College_Code`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Course_Code` (`Course_Code`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_usertype_access`
--
ALTER TABLE `tbl_usertype_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usertype` (`usertype`),
  ADD UNIQUE KEY `module` (`module`);

--
-- Indexes for table `tbl_usertypes`
--
ALTER TABLE `tbl_usertypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_colleges`
--
ALTER TABLE `tbl_colleges`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_usertype_access`
--
ALTER TABLE `tbl_usertype_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_usertypes`
--
ALTER TABLE `tbl_usertypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;--
-- Database: `db_yii_finals`
--
CREATE DATABASE IF NOT EXISTS `db_yii_finals` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_yii_finals`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(100) NOT NULL,
  `post_description` text NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_title`, `post_description`, `author_id`) VALUES
(2, 'SUCCESS CRUDE GENERATION', 'ADD, EDIT, DELETE', 1000001);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(2, 'test', 111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{"angular_direct":"direct","snap_to_grid":"off","relation_lines":"true"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"assessment","table":"google_users"},{"db":"assessment","table":"blog"},{"db":"assessment","table":"comment"},{"db":"assessment","table":"usertype"},{"db":"db_technolearn","table":"tbl_users"},{"db":"db_technolearn","table":"tbl_scores"},{"db":"db_technolearn","table":"tbl_lessons"},{"db":"db_technolearn","table":"tbl_ques_types"},{"db":"db_technolearn","table":"tbl_questions"},{"db":"assessment","table":"users"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_technolearn', 'tbl_lessons', '{"sorted_col":"`lesson_id`  ASC"}', '2017-08-11 01:51:36'),
('root', 'db_technolearn', 'tbl_questions', '{"sorted_col":"`question_id` ASC"}', '2017-08-11 01:51:25'),
('root', 'db_technolearn', 'tbl_users', '{"sorted_col":"`tbl_users`.`id` ASC"}', '2017-06-07 14:43:16'),
('root', 'prototype5', 'cart_items', '{"sorted_col":"`cart_items`.`order_id`  DESC"}', '2017-04-21 03:19:00'),
('root', 'prototype5', 'item', '{"sorted_col":"`item`.`product_id`  DESC"}', '2017-04-21 18:44:03'),
('root', 'prototype5.1', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-04-23 16:26:06'),
('root', 'prototype5.1', 'payment', '{"sorted_col":"`payment`.`order_id`  DESC"}', '2017-04-23 11:03:36'),
('root', 'prototype5.1', 'shipped_by', '{"sorted_col":"`shipped_by`.`order_id`  DESC"}', '2017-04-23 14:41:26'),
('root', 'prototype5.2', 'return_items', '{"sorted_col":"`return_items`.`order_id`  DESC"}', '2017-04-25 16:07:08'),
('root', 'prototype5.2.1', 'return_items', '{"sorted_col":"`return_items`.`order_id`  DESC"}', '2017-04-26 04:27:06'),
('root', 'prototype5.3', 'return_items', '{"sorted_col":"`return_items`.`order_id`  DESC"}', '2017-04-27 07:42:14'),
('root', 'prototype5.3.2', 'shipped_by', '{"sorted_col":"`shipped_by`.`shipping_id`  DESC"}', '2017-04-27 13:12:37'),
('root', 'prototype5.3.3', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-04-27 19:31:40'),
('root', 'prototype5.3.3', 'shipped_by', '{"sorted_col":"`shipped_by`.`shipping_id`  DESC"}', '2017-04-27 19:23:10'),
('root', 'prototype5.3.4', 'bank', '{"sorted_col":"`bank`.`order_id`  DESC"}', '2017-04-30 23:25:28'),
('root', 'prototype5.3.4', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-04-30 04:55:16'),
('root', 'prototype5.3.4', 'payment', '{"sorted_col":"`payment`.`order_id`  DESC"}', '2017-04-30 23:15:47'),
('root', 'prototype5.4', 'cart_items', '{"sorted_col":"`cart_items`.`order_id`  DESC"}', '2017-05-02 07:19:51'),
('root', 'prototype5.4', 'composed_of', '{"sorted_col":"`composed_of`.`promo_id`  DESC"}', '2017-05-01 02:52:31'),
('root', 'prototype5.4', 'item', '{"sorted_col":"`item`.`product_id`  DESC"}', '2017-05-01 02:54:14'),
('root', 'prototype5.5', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-05-05 04:10:50'),
('root', 'prototype5.5.5', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-05-05 04:21:46'),
('root', 'prototype5.6', 'cart_items', '{"sorted_col":"`cart_items`.`order_id`  DESC"}', '2017-05-05 14:24:39'),
('root', 'prototype5.6', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-05-05 11:54:39'),
('root', 'prototype5.6', 'reservation', '{"sorted_col":"`reservation`.`order_id`  DESC"}', '2017-05-30 21:06:21'),
('root', 'prototype5.7', 'cart_items', '{"sorted_col":"`cart_items`.`order_id`  DESC"}', '2017-05-06 03:37:18'),
('root', 'prototype5.7', 'item_info', '{"sorted_col":"`item_info`.`product_id` ASC"}', '2017-05-09 05:23:41'),
('root', 'prototype5.7', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-05-09 22:09:24'),
('root', 'prototype5.7', 'payment', '{"sorted_col":"`payment`.`payment_id`  DESC"}', '2017-05-09 10:22:35'),
('root', 'prototype5.7', 'return_items', '{"sorted_col":"`return_items`.`order_id`  DESC"}', '2017-05-09 07:09:51'),
('root', 'prototype5.7', 'supplies', '{"sorted_col":"`supplies`.`supply_id`  DESC"}', '2017-05-09 16:23:44'),
('root', 'prototype5.8', 'orders', '{"sorted_col":"`orders`.`order_id`  DESC"}', '2017-05-07 09:39:53'),
('root', 'prototype5.8', 'payment', '{"sorted_col":"`payment`.`order_id`  DESC"}', '2017-05-07 09:34:46'),
('root', 'prototype5.8', 'return_items', '{"sorted_col":"`return_items`.`order_id`  DESC"}', '2017-05-06 10:31:36'),
('root', 'prototype6.2', 'supplies', '{"sorted_col":"`supplies`.`supply_id`  DESC"}', '2017-05-12 22:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-11-26 08:37:22', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `prototype6.2`
--
CREATE DATABASE IF NOT EXISTS `prototype6.2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prototype6.2`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_fname` varchar(40) NOT NULL,
  `admin_lname` varchar(40) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `active_admin` tinyint(4) NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_fname`, `admin_lname`, `title`, `phone`, `email`, `username`, `password`, `active_admin`, `supervisor_id`) VALUES
(1, 'juanito', 'juanster', 'BOSS', '09859485948', 'juan@gmail.com', 'juan123', 'juan123', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `aud_id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `action` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`aud_id`, `user_id`, `user_name`, `action`, `time`) VALUES
(1, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:16:43'),
(2, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:17:14'),
(3, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:17:45'),
(4, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:18:18'),
(5, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:18:42'),
(6, 1, 'juanito', 'Admin Create New Category', '2017-05-10 20:19:03'),
(7, 1, 'juanito', 'Admin Create New Supplier', '2017-05-10 20:21:07'),
(8, 1, 'juanito', 'Admin Create New Supplier', '2017-05-10 20:21:39'),
(9, 1, 'juanito', 'Admin Create New Supplier', '2017-05-10 20:22:22'),
(10, 1, 'juanito', 'Admin Create New Supplier', '2017-05-10 20:23:29'),
(11, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:23:56'),
(12, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:24:19'),
(13, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:24:33'),
(14, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:24:49'),
(15, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:25:03'),
(16, 1, 'juanito', 'Admin Create New Courrier', '2017-05-10 20:25:31'),
(17, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:26:37'),
(18, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:28:44'),
(19, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:31:27'),
(20, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:33:22'),
(21, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:34:31'),
(22, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:35:49'),
(23, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:37:21'),
(24, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:38:21'),
(25, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:40:05'),
(26, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:41:37'),
(27, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:43:48'),
(28, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:45:18'),
(29, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:48:35'),
(30, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:50:57'),
(31, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:53:22'),
(32, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:54:16'),
(33, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:55:35'),
(34, 1, 'juanito', 'Admin Create New Item', '2017-05-10 20:57:39'),
(35, 1, 'juanito', 'Admin Create New Promo', '2017-05-10 21:01:09'),
(36, 1, 'juanito', 'Admin Create New Promo', '2017-05-10 21:03:44'),
(37, 1, 'juanito', 'Admin Create New Promo', '2017-05-10 21:05:02'),
(38, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:31:11'),
(39, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:31:22'),
(40, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:31:50'),
(41, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:32:10'),
(42, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:33:53'),
(43, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:34:26'),
(44, 1, 'juanito', 'Admin Update Courrier', '2017-05-10 21:34:35'),
(45, 1, 'juanito', 'Admin Update Supplier', '2017-05-10 21:35:35'),
(46, 1, 'juanito', 'Admin Log-in', '2017-05-10 22:13:20'),
(47, 1, 'juanito', 'Admin Log-in', '2017-05-12 23:39:29'),
(48, 1, 'juanito', 'Admin Log-in', '2017-05-13 00:31:44'),
(49, 1, 'juanito', 'Admin Create New Item', '2017-05-14 01:14:12'),
(50, 1, 'juanito', 'Admin Log-in', '2017-07-22 23:10:20'),
(51, 1, 'juanito', 'Admin Log-in', '2017-07-23 00:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `proof_of_payment` varchar(255) DEFAULT NULL,
  `verification` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`order_id`, `payment_id`, `proof_of_payment`, `verification`) VALUES
(5, 7, '59133a3eeba65.jpg', 1),
(10, 5, 'download.jpg', 1),
(14, 1, '591390f2d3a5c.jpg', 1),
(15, 2, '18387064_436950386665265_1807161605_n.jpg', 1),
(16, 3, '18426715_436951279998509_300638915_o.jpg', 1),
(17, 4, '18387075_436952046665099_2034238751_n.jpg', 1),
(18, 5, '591659d84d1d1.jpg', 1),
(19, 6, '5917ac385f224.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `bannerImg` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `bannerText` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `bannerImg`, `Title`, `bannerText`, `status`) VALUES
(2, 'bg-Aspire_S7_banner-desk-1200x400.jpg', 'Oh Laptop', 'oohh...', 1),
(4, 'b5.jpg', 'somethin like this', 'wow', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `warranty` datetime DEFAULT NULL,
  `item_status` varchar(50) NOT NULL,
  `releaseDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`order_id`, `product_id`, `color_description`, `promo_id`, `quantity`, `subtotal`, `discount`, `warranty`, `item_status`, `releaseDate`) VALUES
(14, 14, 'Default', 3, 1, '650.00', NULL, '2017-08-04 12:17:24', 'Delivered', '2017-05-11 12:17:24'),
(14, 17, 'Default', 3, 1, '800.00', NULL, '2017-08-06 12:17:26', 'Delivered', '2017-05-11 12:17:26'),
(14, 23, 'Violet', 3, 1, '450.00', NULL, '2017-08-02 12:17:29', 'Delivered', '2017-05-11 12:17:29'),
(15, 14, 'Default', 3, 4, '2600.00', NULL, '2017-08-15 12:27:53', 'Delivered', '2017-05-12 12:27:53'),
(15, 17, 'Default', 3, 4, '3200.00', NULL, '2017-08-17 12:29:49', 'Delivered', '2017-05-12 12:29:49'),
(15, 23, 'Violet', 3, 4, '1800.00', NULL, '2017-08-13 12:29:52', 'Delivered', '2017-05-12 12:29:52'),
(16, 14, 'Default', 0, 1, '650.00', NULL, '2017-05-25 12:34:22', 'Delivered', '2017-05-12 12:34:22'),
(16, 16, 'Default', 0, 1, '600.00', NULL, NULL, 'For Delivery', NULL),
(16, 22, 'Default', 0, 1, '450.00', NULL, NULL, 'For Delivery', NULL),
(17, 28, 'Default', 0, 50, '32500.00', NULL, '2017-08-13 12:45:33', 'Delivered', '2017-05-13 12:45:33'),
(18, 11, 'Default', 0, 1, '350.00', NULL, '2017-05-18 02:58:00', 'Delivered', '2017-05-13 02:58:00'),
(18, 15, 'Default', 0, 1, '450.00', NULL, '2017-05-19 02:58:02', 'Delivered', '2017-05-13 02:58:02'),
(18, 19, 'Default', 0, 1, '1300.00', NULL, '2017-05-22 02:58:05', 'Delivered', '2017-05-13 02:58:05'),
(18, 22, 'Default', 0, 1, '450.00', NULL, '2017-05-18 02:58:07', 'Delivered', '2017-05-13 02:58:07'),
(18, 24, 'Default', 0, 1, '1650.00', NULL, '2017-05-21 02:58:10', 'Delivered', '2017-05-13 02:58:10'),
(18, 25, 'Default', 0, 11, '14300.00', NULL, '2017-05-19 02:58:12', 'Delivered', '2017-05-13 02:58:12'),
(18, 26, 'Default', 0, 1, '1200.00', NULL, '2017-05-19 02:58:15', 'Delivered', '2017-05-13 02:58:15'),
(19, 25, 'Default', 0, 10, '13000.00', NULL, '2017-05-20 03:01:27', 'Delivered', '2017-05-14 03:01:27'),
(20, 29, 'white', 0, 1, '500.00', NULL, NULL, 'processing', NULL),
(21, 21, 'Black', 0, 2, '9000.00', NULL, '2017-05-22 03:25:36', 'PICKED UP', '2017-05-14 03:25:36'),
(21, 21, 'White', 0, 1, '0.00', NULL, '2017-05-22 03:29:42', 'Exchanged Item', '2017-05-14 03:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` text,
  `cat_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`, `cat_pic`) VALUES
(3, 'Mouse', 'Mouse here', '5913752bb6834.jpg'),
(4, 'Keyboard', 'keyboard here', '59137549ec165.jpg'),
(5, 'Headset', 'Headset here', '591375699aa8e.png'),
(6, 'Monitor', 'Monitor here', '5913758a451ef.jpg'),
(7, 'System Unit Case', 'System Unit Case Here', '591375a29bbee.jpg'),
(8, 'RAM', 'RAM Here', '591375b7d29f0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `composed_of`
--

CREATE TABLE `composed_of` (
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `composed_of`
--

INSERT INTO `composed_of` (`product_id`, `color_description`, `promo_id`, `item_qty`) VALUES
(1, 'Black', 0, 1),
(1, 'White', 0, 1),
(2, 'Black', 0, 1),
(2, 'White', 0, 1),
(3, 'Black', 0, 1),
(3, 'White', 0, 1),
(4, 'Black', 0, 1),
(4, 'White', 0, 1),
(5, 'Blue', 0, 1),
(5, 'Red', 0, 1),
(6, 'Black', 0, 1),
(6, 'White', 0, 1),
(7, 'Default', 0, 1),
(8, 'Pink', 0, 1),
(9, 'Red', 0, 1),
(9, 'White', 0, 1),
(10, 'red', 0, 1),
(11, 'Default', 0, 1),
(12, 'Default', 0, 1),
(13, 'Black', 0, 1),
(13, 'Blue', 0, 1),
(13, 'Red', 0, 1),
(13, 'White', 0, 1),
(14, 'Default', 0, 1),
(14, 'Default', 3, 1),
(15, 'Default', 0, 1),
(16, 'Default', 0, 1),
(17, 'Default', 0, 1),
(17, 'Default', 3, 1),
(18, 'Default', 0, 1),
(18, 'Default', 1, 1),
(19, 'Default', 0, 1),
(20, 'Default', 0, 1),
(21, 'Black', 0, 1),
(21, 'Black', 2, 1),
(21, 'White', 0, 1),
(21, 'White', 2, 1),
(22, 'Default', 0, 1),
(23, 'Blue', 0, 1),
(23, 'Blue', 1, 1),
(23, 'Green', 0, 1),
(23, 'Violet', 0, 1),
(23, 'Violet', 3, 1),
(23, 'White', 0, 1),
(24, 'Default', 0, 1),
(25, 'Default', 0, 1),
(26, 'Default', 0, 1),
(27, 'Default', 0, 1),
(28, 'Default', 0, 1),
(29, 'white', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `message` text NOT NULL,
  `timeSent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`contact_id`, `name`, `email`, `phone`, `message`, `timeSent`) VALUES
(92, 'asdad', 'taichikenren@yahoo.com', 2147483647, 'Lorem ipsum dolor sit amet, et has everti corpora scriptorem,viris exerci euripidis ius cu. Pri et ', '2017-05-06 11:21:36'),
(93, 'trest', 'taichikenren@yahoo.com', 2147483647, 'Lorem ipsum dolor sit amet, et has everti corpora scriptorem,viris exerci euripidis ius cu. Pri et quot cibo novum, laboresinvenire ad ius. Et velit possim interpretaris est. Eu eosrebum scripta referrentur, et quo illum veniam deterruisset.Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri.Cum ad mollis legimus. Prompta perfecto te his, vis graeceputent singulis ut, at has rebum nostrud temporibus. Meiserroribus an sit, ea vix populo dolores, pri erat possimceteros ad.Lorem ipsum dolor sit amet, et has everti corpora scriptorem,viris exerci euripidis ius cu. Pri et quot cibo novum, laboresinvenire ad ius. Et velit possim interpretaris est. Eu eosrebum scripta referrentur, et quo illum veniam deterruisset.Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri.Cum ad mollis legimus. Prompta perfecto te his, vis graeceputent singulis ut, at has rebum nostrud temporibus. Meiserroribus an sit, ea vix populo dolores, pri erat possimceteros ad.', '2017-05-06 11:22:53'),
(94, 'ta', 'taichikenren@yahoo.com', 2147483647, 'Lorem ipsum dolor sit amet, et has everti corpora scriptorem, viris exerci euripidis ius cu. Pri et quot cibo novum, labores invenire ad ius. Et velit possim interpretaris est. Eu eos rebum scripta referrentur, et quo illum veniam deterruisset. Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri. Cum ad mollis legimus. Prompta perfecto te his, vis graece putent singulis ut, at has rebum nostrud temporibus. Meis erroribus an sit, ea vix populo dolores, pri erat possim ceteros ad.Lorem ipsum dolor sit amet, et has everti corpora scriptorem, viris exerci euripidis ius cu. Pri et quot cibo novum, labores invenire ad ius. Et velit possim interpretaris est. Eu eos rebum scripta referrentur, et quo illum veniam deterruisset. Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri. Cum ad mollis legimus. Prompta perfecto te his, vis graece putent singulis ut, at has rebum nostrud temporibus. Meis erroribus an sit, ea vix populo dolores, pri erat possim ceteros ad.', '2017-05-06 11:29:44'),
(95, 'trest', 'abdul_jakul24@yahoo.com', 2147483647, 'Lorem ipsum dolor sit amet, et has everti corpora scriptorem, viris exerci euripidis ius cu. Pri et quot cibo novum, labores invenire ad ius. Et velit possim interpretaris est. Eu eos rebum scripta referrentur, et quo illum veniam deterruisset. Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri. Cum ad mollis legimus. Prompta perfecto te his, vis graece putent singulis ut, at has rebum nostrud temporibus. Meis erroribus an sit, ea vix populo dolores, pri erat possim ceteros ad.Lorem ipsum dolor sit amet, et has everti corpora scriptorem, viris exerci euripidis ius cu. Pri et quot cibo novum, labores invenire ad ius. Et velit possim interpretaris est. Eu eos rebum scripta referrentur, et quo illum veniam deterruisset. Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri. Cum ad mollis legimus. Prompta perfecto te his, vis graece putent singulis ut, at has rebum nostrud temporibus. Meis erroribus an sit, ea vix populo dolores, pri erat possim ceteros ad.Lorem ipsum dolor sit amet, et has everti corpora scriptorem, viris exerci euripidis ius cu. Pri et quot cibo novum, labores invenire ad ius. Et velit possim interpretaris est. Eu eos rebum scripta referrentur, et quo illum veniam deterruisset. Cu iudicabit moderatius nam, pri ad quod graecis gubergren.Dicit civibus interpretaris ut sit. At dicat epicuri assueverit pri. Cum ad mollis legimus. Prompta perfecto te his, vis graece putent singulis ut, at has rebum nostrud temporibus. Meis erroribus an sit, ea vix populo dolores, pri erat possim ceteros ad.', '2017-05-06 11:30:26'),
(97, 'asdasd', 'taichikenren@yahoo.com', 2147483647, 'aqwfqwidoqwqdqasddddddddddddddddddddddddddddddd qqwdqwdqwdqwdqwdqwd', '2017-05-08 02:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `courrier`
--

CREATE TABLE `courrier` (
  `courrier_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `forTracking` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courrier`
--

INSERT INTO `courrier` (`courrier_id`, `company_name`, `phone`, `forTracking`) VALUES
(4, 'LBC', '09876543212', 'https://www.facebook.com/'),
(5, 'Genesis Transportation', '09876543289', 'https://www.facebook.com/'),
(6, 'JRS Express', '09128734657', 'http://www.lbcexpress.com/'),
(7, 'Air21', '09128734657', 'http://www.lbcexpress.com/'),
(8, 'Victory Liner', '09128734657', 'http://www.lbcexpress.com/'),
(9, 'Dagupan Bus Co.', '09128734657', 'http://www.lbcexpress.com/');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `f_name` varchar(40) DEFAULT NULL,
  `l_name` varchar(40) DEFAULT NULL,
  `organization` varchar(40) DEFAULT NULL,
  `Event` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `f_name`, `l_name`, `organization`, `Event`) VALUES
(9, 'Japot', 'pot', NULL, NULL),
(10, 'venancio', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_monitoring`
--

CREATE TABLE `customer_monitoring` (
  `monitoring_id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `name_customer` text NOT NULL,
  `action` varchar(255) NOT NULL,
  `timeexecute` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_monitoring`
--

INSERT INTO `customer_monitoring` (`monitoring_id`, `id_customer`, `name_customer`, `action`, `timeexecute`) VALUES
(15, 9, 'japot123', 'New Registered Customer', '2017-05-10 22:02:41'),
(16, 9, 'japot123', 'Customer Log In', '2017-05-10 22:02:55'),
(17, 9, 'japot123', 'Customer Log In', '2017-05-10 22:07:24'),
(18, 9, 'japot123', 'Customer Update Info', '2017-05-10 22:07:50'),
(19, 9, 'japot123', 'Customer Log Out', '2017-05-10 22:08:12'),
(20, 9, 'japot123', 'Customer Log In', '2017-05-10 22:12:14'),
(21, 9, 'japot123', 'Customer Confirm Details', '2017-05-10 22:14:09'),
(22, 9, 'japot123', 'Customer Request Shipping', '2017-05-10 22:14:46'),
(23, 9, 'japot123', 'Customer Confirm Details', '2017-05-10 22:17:58'),
(24, 9, 'japot123', 'Customer Request Shipping', '2017-05-10 22:18:07'),
(25, 9, 'japot123', 'Customer Send Payment', '2017-05-10 22:26:02'),
(26, 9, 'japot123', 'Customer Confirm Details', '2017-05-11 22:32:06'),
(27, 9, 'japot123', 'Customer Request Shipping', '2017-05-11 22:32:16'),
(28, 9, 'japot123', 'Customer Send Payment', '2017-05-11 22:33:22'),
(29, 9, 'japot123', 'Customer Confirm Details', '2017-05-12 22:43:11'),
(30, 9, 'japot123', 'Customer Request Shipping', '2017-05-12 22:43:25'),
(31, 9, 'japot123', 'Customer Send Payment', '2017-05-12 22:44:24'),
(32, 9, 'japot123', 'Customer Log In', '2017-05-13 00:20:20'),
(33, 9, 'japot123', 'Customer Log Out', '2017-05-13 00:20:27'),
(34, 9, 'japot123', 'Customer Log In', '2017-05-13 00:21:35'),
(35, 9, 'japot123', 'Customer Log Out', '2017-05-13 00:21:52'),
(36, 9, 'japot123', 'Customer Log In', '2017-05-13 00:28:12'),
(37, 9, 'japot123', 'Customer Log Out', '2017-05-13 00:28:23'),
(38, 9, 'japot123', 'Customer Log In', '2017-05-13 00:29:51'),
(39, 9, 'japot123', 'Customer Log Out', '2017-05-13 00:30:03'),
(40, 9, 'japot123', 'Customer Log In', '2017-05-13 00:34:19'),
(41, 9, 'japot123', 'Customer Confirm Details', '2017-05-13 00:53:31'),
(42, 9, 'japot123', 'Customer Request Shipping', '2017-05-13 00:54:15'),
(43, 9, 'japot123', 'Customer Confirm Details', '2017-05-14 00:59:51'),
(44, 9, 'japot123', 'Customer Request Shipping', '2017-05-14 00:59:58'),
(45, 9, 'japot123', 'Customer Send Payment', '2017-05-14 01:00:40'),
(46, 9, 'japot123', 'Customer Confirm Details', '2017-05-14 01:18:07'),
(47, 9, 'japot123', 'Customer Request Shipping', '2017-05-14 01:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `daycount`
--

CREATE TABLE `daycount` (
  `today` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `start_instock` int(11) DEFAULT NULL,
  `end_instock` int(11) DEFAULT NULL,
  `new_supply` int(11) DEFAULT NULL,
  `sold_item` int(11) DEFAULT NULL,
  `return_items` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daycount`
--

INSERT INTO `daycount` (`today`, `product_id`, `start_instock`, `end_instock`, `new_supply`, `sold_item`, `return_items`) VALUES
('2017-05-08', 11, 10, 10, 0, 0, 0),
('2017-05-08', 12, 20, 20, 0, 0, 0),
('2017-05-08', 13, 80, 80, 0, 0, 0),
('2017-05-08', 14, 9, 9, 0, 0, 0),
('2017-05-08', 15, 20, 20, 0, 0, 0),
('2017-05-08', 16, 8, 8, 0, 0, 0),
('2017-05-08', 17, 0, 0, 0, 0, 0),
('2017-05-08', 18, 5, 5, 0, 0, 0),
('2017-05-08', 19, 2, 2, 0, 0, 0),
('2017-05-08', 20, 1, 1, 0, 0, 0),
('2017-05-08', 21, 6, 6, 0, 0, 0),
('2017-05-08', 22, 10, 10, 0, 0, 0),
('2017-05-08', 23, 40, 40, 0, 0, 0),
('2017-05-08', 24, 15, 15, 0, 0, 0),
('2017-05-08', 25, 0, 0, 0, 0, 0),
('2017-05-08', 26, 3, 3, 0, 0, 0),
('2017-05-08', 27, 3, 3, 0, 0, 0),
('2017-05-08', 28, 0, 0, 0, 0, 0),
('2017-05-10', 11, 10, 10, 0, 0, 0),
('2017-05-10', 12, 20, 20, 0, 0, 0),
('2017-05-10', 13, 80, 80, 0, 0, 0),
('2017-05-10', 14, 15, 15, 0, 0, 0),
('2017-05-10', 15, 20, 20, 0, 0, 0),
('2017-05-10', 16, 8, 8, 0, 0, 0),
('2017-05-10', 17, 5, 5, 0, 0, 0),
('2017-05-10', 18, 5, 5, 0, 0, 0),
('2017-05-10', 19, 2, 2, 0, 0, 0),
('2017-05-10', 20, 1, 1, 0, 0, 0),
('2017-05-10', 21, 6, 6, 0, 0, 0),
('2017-05-10', 22, 10, 10, 0, 0, 0),
('2017-05-10', 23, 45, 45, 0, 0, 0),
('2017-05-10', 24, 5, 15, 10, 0, 0),
('2017-05-10', 25, 0, 0, 0, 0, 0),
('2017-05-10', 26, 3, 3, 0, 0, 0),
('2017-05-10', 27, 3, 3, 0, 0, 0),
('2017-05-10', 28, 50, 50, 0, 0, 0),
('2017-05-11', 11, 10, 10, 0, 0, 0),
('2017-05-11', 12, 20, 20, 0, 0, 0),
('2017-05-11', 13, 80, 80, 0, 0, 0),
('2017-05-11', 14, 15, 14, 0, 1, 0),
('2017-05-11', 15, 20, 20, 0, 0, 0),
('2017-05-11', 16, 8, 8, 0, 0, 0),
('2017-05-11', 17, 5, 4, 0, 1, 0),
('2017-05-11', 18, 5, 5, 0, 0, 0),
('2017-05-11', 19, 2, 2, 0, 0, 0),
('2017-05-11', 20, 1, 1, 0, 0, 0),
('2017-05-11', 21, 6, 6, 0, 0, 0),
('2017-05-11', 22, 10, 10, 0, 0, 0),
('2017-05-11', 23, 45, 44, 0, 1, 0),
('2017-05-11', 24, 15, 15, 0, 0, 0),
('2017-05-11', 25, 0, 0, 0, 0, 0),
('2017-05-11', 26, 3, 3, 0, 0, 0),
('2017-05-11', 27, 3, 3, 0, 0, 0),
('2017-05-11', 28, 50, 50, 0, 0, 0),
('2017-05-12', 11, 10, 10, 0, 0, 0),
('2017-05-12', 12, 20, 20, 0, 0, 0),
('2017-05-12', 13, 80, 80, 0, 0, 0),
('2017-05-12', 14, 14, 9, 0, 5, 0),
('2017-05-12', 15, 20, 20, 0, 0, 0),
('2017-05-12', 16, 8, 8, 0, 0, 0),
('2017-05-12', 17, 4, 0, 0, 4, 0),
('2017-05-12', 18, 5, 5, 0, 0, 0),
('2017-05-12', 19, 2, 2, 0, 0, 0),
('2017-05-12', 20, 1, 1, 0, 0, 0),
('2017-05-12', 21, 6, 6, 0, 0, 0),
('2017-05-12', 22, 10, 10, 0, 0, 0),
('2017-05-12', 23, 44, 40, 0, 4, 0),
('2017-05-12', 24, 15, 15, 0, 0, 0),
('2017-05-12', 25, 0, 0, 0, 0, 0),
('2017-05-12', 26, 3, 3, 0, 0, 0),
('2017-05-12', 27, 3, 3, 0, 0, 0),
('2017-05-12', 28, 50, 50, 0, 0, 0),
('2017-05-13', 11, 10, 9, 0, 1, 0),
('2017-05-13', 12, 20, 20, 0, 0, 0),
('2017-05-13', 13, 80, 80, 0, 0, 0),
('2017-05-13', 14, 9, 9, 0, 0, 0),
('2017-05-13', 15, 20, 19, 0, 1, 0),
('2017-05-13', 16, 8, 8, 0, 0, 0),
('2017-05-13', 17, 0, 0, 0, 0, 0),
('2017-05-13', 18, 5, 5, 0, 0, 0),
('2017-05-13', 19, 2, 1, 0, 1, 0),
('2017-05-13', 20, 1, 1, 0, 0, 0),
('2017-05-13', 21, 6, 6, 0, 0, 0),
('2017-05-13', 22, 10, 9, 0, 1, 0),
('2017-05-13', 23, 40, 40, 0, 0, 0),
('2017-05-13', 24, 15, 24, 10, 1, 0),
('2017-05-13', 25, 0, 10, 21, 11, 0),
('2017-05-13', 26, 3, 2, 0, 1, 0),
('2017-05-13', 27, 3, 3, 0, 0, 0),
('2017-05-13', 28, 50, 0, 0, 50, 0),
('2017-05-14', 11, 9, 9, 0, 0, 0),
('2017-05-14', 12, 20, 20, 0, 0, 0),
('2017-05-14', 13, 80, 80, 0, 0, 0),
('2017-05-14', 14, 9, 9, 0, 0, 0),
('2017-05-14', 15, 19, 19, 0, 0, 0),
('2017-05-14', 16, 8, 8, 0, 0, 0),
('2017-05-14', 17, 0, 0, 0, 0, 0),
('2017-05-14', 18, 5, 5, 0, 0, 0),
('2017-05-14', 19, 1, 1, 0, 0, 0),
('2017-05-14', 20, 1, 1, 0, 0, 0),
('2017-05-14', 21, 6, 3, 0, 3, 0),
('2017-05-14', 22, 9, 9, 0, 0, 0),
('2017-05-14', 23, 40, 40, 0, 0, 0),
('2017-05-14', 24, 24, 24, 0, 0, 0),
('2017-05-14', 25, 10, 0, 0, 10, 0),
('2017-05-14', 26, 2, 2, 0, 0, 0),
('2017-05-14', 27, 3, 3, 0, 0, 0),
('2017-05-14', 28, 0, 0, 0, 0, 0),
('2017-05-14', 29, 0, 1, 1, 0, 0),
('2017-07-23', 11, 9, 9, 0, 0, 0),
('2017-07-23', 12, 20, 20, 0, 0, 0),
('2017-07-23', 13, 80, 80, 0, 0, 0),
('2017-07-23', 14, 9, 9, 0, 0, 0),
('2017-07-23', 15, 19, 19, 0, 0, 0),
('2017-07-23', 16, 8, 8, 0, 0, 0),
('2017-07-23', 17, 0, 0, 0, 0, 0),
('2017-07-23', 18, 5, 5, 0, 0, 0),
('2017-07-23', 19, 1, 1, 0, 0, 0),
('2017-07-23', 20, 1, 1, 0, 0, 0),
('2017-07-23', 21, 3, 3, 0, 0, 0),
('2017-07-23', 22, 9, 9, 0, 0, 0),
('2017-07-23', 23, 40, 40, 0, 0, 0),
('2017-07-23', 24, 24, 24, 0, 0, 0),
('2017-07-23', 25, 0, 0, 0, 0, 0),
('2017-07-23', 26, 2, 2, 0, 0, 0),
('2017-07-23', 27, 3, 3, 0, 0, 0),
('2017-07-23', 28, 0, 0, 0, 0, 0),
('2017-07-23', 29, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_pic` varchar(255) DEFAULT NULL,
  `availability` smallint(6) NOT NULL,
  `unit_price` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`product_id`, `color_description`, `supplier_id`, `quantity`, `item_pic`, `availability`, `unit_price`) VALUES
(11, 'Default', 2, 9, '5913777db9215.jpg', 1, '0.00'),
(12, 'Default', 5, 20, '591377fc26e4c.jpg', 1, '0.00'),
(13, 'Black', 3, 20, '5913789f647d0.jpg', 1, '0.00'),
(13, 'Blue', 3, 20, '5913789f6bd02.jpg', 1, '0.00'),
(13, 'Red', 3, 20, '5913789f7ab4d.jpg', 1, '0.00'),
(13, 'White', 3, 20, '5913789f85f00.png', 1, '0.00'),
(14, 'Default', 2, 9, '5913791236ba7.jpg', 1, '0.00'),
(15, 'Default', 4, 19, '591379571ad5f.gif', 1, '0.00'),
(16, 'Default', 4, 8, '591379a5d0d7e.png', 1, '0.00'),
(17, 'Default', 4, 0, '59137a01a10d9.jpg', 1, '0.00'),
(18, 'Default', 2, 5, '59137a3da5dea.png', 1, '0.00'),
(19, 'Default', 2, 1, '59137aa59edc6.jpg', 1, '0.00'),
(20, 'Default', 3, 1, '59137b01172cc.jpg', 1, '0.00'),
(21, 'Black', 4, 1, '59137b84bd2f5.jpg', 1, '0.00'),
(21, 'White', 4, 2, '59137b84c3c6e.jpg', 1, '0.00'),
(22, 'Default', 2, 9, '59137bde4e0b5.jpg', 1, '0.00'),
(23, 'Blue', 3, 10, '59137ca36786a.jpg', 1, '0.00'),
(23, 'Green', 3, 10, '59137ca35ad47.jpg', 1, '0.00'),
(23, 'Violet', 3, 10, '59137ca37820e.jpg', 1, '0.00'),
(23, 'White', 3, 10, '59137ca382df0.jpg', 1, '0.00'),
(24, 'Default', 2, 24, '59137d3142a17.jpg', 1, '0.00'),
(25, 'Default', 3, 0, '59137dc1f119f.jpg', 1, '0.00'),
(26, 'Default', 3, 2, '59137df8b2a22.jpg', 1, '0.00'),
(27, 'Default', 5, 3, '59137e47c35cd.jpg', 1, '0.00'),
(28, 'Default', 3, 0, '59137ec34f927.jpg', 1, '0.00'),
(29, 'white', 2, 1, '5917af6448e93.jpg', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_info`
--

CREATE TABLE `item_info` (
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `unit_price` decimal(9,2) NOT NULL,
  `unit_instock` int(11) NOT NULL,
  `unit_onorder` int(11) DEFAULT NULL,
  `reorder_level` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` text,
  `model_number` varchar(50) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `warranty_days` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `malfunctioning_item` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_info`
--

INSERT INTO `item_info` (`product_id`, `supplier_id`, `product_name`, `unit_price`, `unit_instock`, `unit_onorder`, `reorder_level`, `picture`, `description`, `model_number`, `serial_number`, `warranty_days`, `brand`, `malfunctioning_item`, `category_id`, `supplier_remarks`) VALUES
(11, 2, 'Bluejoy Headset', '350.00', 9, 0, 5, '5913777d9d8a6.jpg', '', '', '', 3, 'Bluejoy', NULL, 5, NULL),
(12, 5, 'Monster Beats Headset', '999.00', 20, 0, 3, '591377fc11e57.jpg', '', '6578909uhkj', '', 3, 'Beats', NULL, 5, NULL),
(13, 3, 'Tritton Headset', '450.00', 80, 0, 10, '5913789f50b63.jpg', '', '', '', 3, 'Tritton', NULL, 5, NULL),
(14, 2, 'Valore HS0001 Headset', '650.00', 9, 0, 5, '591379121602f.jpg', '', '', '', 5, 'Valore', NULL, 5, NULL),
(15, 4, 'Acer Keyboard', '450.00', 19, 0, 10, '5913795709fd3.gif', '', '', 'gvakdg70', 4, 'Acer', NULL, 4, NULL),
(16, 4, 'Corsair StrafeKeyboard', '600.00', 8, 1, 5, '591379a5ba231.png', '', '', '', 6, 'Corsair', NULL, 4, NULL),
(17, 4, 'Enhance GXK3 Keyboard', '800.00', 0, 0, 5, '59137a0197497.jpg', '', '', '', 7, 'Enhance', NULL, 4, NULL),
(18, 2, 'Razer Tron', '750.00', 5, 0, 3, '59137a3d92d35.png', '', '', '', 6, 'Razer', NULL, 4, NULL),
(19, 2, 'Acer PC Monitor', '1300.00', 1, 0, 3, '59137aa591303.jpg', '', '', '', 7, 'Acer', NULL, 6, NULL),
(20, 3, 'Dell PC Monitor', '1500.00', 1, 0, 3, '59137b0103a47.jpg', '', '', '', 7, 'Dell', NULL, 6, NULL),
(21, 4, 'Samsung Curved QHD Monitor', '4500.00', 3, 0, 2, '59137b84b426b.jpg', '', '', '', 8, 'Samsung', 1, 6, NULL),
(22, 2, 'A4Tech Bloody Mouse', '450.00', 9, 1, 5, '59137bde32747.jpg', '', '', '', 3, 'A4Tech', NULL, 3, NULL),
(23, 3, 'Razer Deathadder Mouse', '450.00', 40, 0, 5, '59137ca34690a.jpg', '', '', '', 3, 'Razer', NULL, 3, NULL),
(24, 2, 'Wichmann WorkX AG RAM', '1650.00', 24, 0, 5, '59137d3133bcc.jpg', '', '', '', 6, 'Wichmann', NULL, 8, NULL),
(25, 3, 'Corsair Obsidian Series 900D Super Tower', '1300.00', 0, 0, 5, '59137dc1e1f6b.jpg', '', 'ethy5', 'jegn45345', 4, 'Corsair', NULL, 7, NULL),
(26, 3, 'Maingear S Ivy Bridge', '1200.00', 2, 0, 5, '59137df89af35.jpg', '', '', '', 4, 'Maingear', NULL, 7, NULL),
(27, 5, 'QDIY PC-C004 Transparent Acrylic Personalized Water Cooled', '2500.00', 3, 0, 3, '59137e47b5ef1.jpg', '', '', '', 7, 'QDIY', NULL, 7, NULL),
(28, 3, 'Acer Wireless Optical', '650.00', 0, 0, 5, '59137ec341694.jpg', '', '', '356eth', 4, 'Acer', NULL, 3, NULL),
(29, 2, 'power supply', '500.00', 1, 1, 10, 'promo3.jpg', '', '', '', 30, 'generic', NULL, 3, '5 months');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `transaction_status` varchar(20) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_total` decimal(9,2) NOT NULL,
  `total_discount` decimal(9,0) DEFAULT NULL,
  `grand_total` decimal(9,0) DEFAULT NULL,
  `classification` varchar(30) NOT NULL,
  `comments` text,
  `order_date` datetime NOT NULL,
  `sales_person` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `transaction_status`, `balance`, `customer_id`, `item_total`, `total_discount`, `grand_total`, `classification`, `comments`, `order_date`, `sales_person`) VALUES
(8, 'Canceled', 199, 1, '200.00', '0', '200', ' Walk In ', '<br><strong style="color:red;">Order Canceled by:Admin juanito juanster</strong><br>	fghjk', '2017-05-10 01:30:10', NULL),
(14, 'partial paid', 90, 9, '1900.00', '100', '1890', 'Order', '<b>Customer Info comments: </b><br>mayat aya?', '2017-05-11 12:13:48', NULL),
(15, 'finished', 0, 9, '7600.00', '400', '7290', 'Order', NULL, '2017-05-11 12:17:54', NULL),
(16, 'finished', 0, 9, '1700.00', '0', '1790', 'Order', '<b>Customer Info comments: </b><br>pintasak <br><b> Shipping Comments: </b><br>', '2017-05-12 12:31:55', NULL),
(17, 'finished', 0, 9, '32500.00', '0', '33399', 'Order', NULL, '2017-05-13 12:43:02', NULL),
(18, 'finished', 0, 9, '19700.00', '18000', '1800', 'Order', '<b>Customer Info comments: </b><br>paorder', '2017-05-13 02:53:11', NULL),
(19, 'finished', 0, 9, '13000.00', '0', '13150', 'Order', NULL, '2017-05-14 02:59:48', NULL),
(20, 'Request Shipping', 500, 9, '500.00', '0', '500', 'Order', NULL, '2017-05-14 03:17:58', NULL),
(21, 'finished', 0, 10, '9000.00', '0', '9000', ' Walk In ', '', '2017-05-14 03:25:35', 'juanito juanster');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `date_paid` datetime NOT NULL,
  `amount_paid` decimal(9,2) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `money_change` decimal(9,2) DEFAULT NULL,
  `OR_number` varchar(50) DEFAULT NULL,
  `OR_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`order_id`, `payment_id`, `date_paid`, `amount_paid`, `method`, `money_change`, `OR_number`, `OR_picture`) VALUES
(14, 1, '2017-05-11 12:15:14', '1800.00', 'Bank', NULL, NULL, '3.jpg'),
(15, 2, '2017-05-11 12:26:01', '7290.00', 'Bank', NULL, NULL, 'download.jpg'),
(16, 3, '2017-05-12 12:33:22', '1790.00', 'Bank', NULL, NULL, '5914e6ce9fc0a.jpg'),
(17, 4, '2017-05-13 12:44:24', '33399.00', 'Bank', NULL, NULL, '59163aed3a727.jpg'),
(18, 5, '2017-05-13 02:56:56', '1900.00', 'Bank', NULL, NULL, 'promo1.jpg'),
(19, 6, '2017-05-14 03:00:40', '13150.00', 'Bank', NULL, NULL, 'promo3.jpg'),
(21, 7, '2017-05-14 03:26:02', '9000.00', 'cash', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

CREATE TABLE `personal_info` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(4) DEFAULT NULL,
  `customer_status` varchar(15) NOT NULL,
  `account_balance` int(11) DEFAULT NULL,
  `question` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_info`
--

INSERT INTO `personal_info` (`customer_id`, `username`, `password`, `email`, `phone`, `city`, `address`, `postal_code`, `customer_status`, `account_balance`, `question`, `answer`) VALUES
(9, 'japot123', 'japot123', 'japhethbsu@gmail.cm', '09121234567', 'Baguio', 'Pinsao', '2600', '0', NULL, 'What city were you born in?', 'Tokyo');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promo_id` int(11) NOT NULL,
  `promo_worth` decimal(9,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `promo_name` varchar(50) DEFAULT NULL,
  `promo_difference` decimal(9,2) DEFAULT NULL,
  `promo_difference_type` varchar(15) DEFAULT NULL,
  `promo_status` varchar(15) DEFAULT NULL,
  `promo_warranty` int(11) DEFAULT NULL,
  `promo_pic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promo_id`, `promo_worth`, `start_date`, `end_date`, `promo_name`, `promo_difference`, `promo_difference_type`, `promo_status`, `promo_warranty`, `promo_pic`) VALUES
(1, '1000.00', '2017-05-11', '2017-05-14', 'Gaming Promo', '200.00', 'discount', NULL, NULL, 'promo-razer.jpg'),
(2, '8000.00', '2017-05-11', '2017-05-31', 'Samsung Curved QHD Monitor Promo', '1000.00', 'discount', NULL, NULL, '5913802ff169a.jpg'),
(3, '1800.00', '2017-05-11', '2017-05-13', 'Razer Starcraft Promo', '100.00', 'discount', NULL, NULL, '5913807e51638.png');

-- --------------------------------------------------------

--
-- Table structure for table `remitance`
--

CREATE TABLE `remitance` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `proof_of_payment` varchar(255) DEFAULT NULL,
  `tracking_num` varchar(50) NOT NULL,
  `verification` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `order_id` int(11) DEFAULT NULL,
  `confirm_reservation_status` tinyint(4) DEFAULT NULL,
  `confirmation_date` datetime DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`order_id`, `confirm_reservation_status`, `confirmation_date`, `fine`) VALUES
(8, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text NOT NULL,
  `proof_pic` varchar(255) DEFAULT NULL,
  `malfunctioning` int(11) DEFAULT NULL,
  `return_date` datetime NOT NULL,
  `return_bill_of_ladding` varchar(255) DEFAULT NULL,
  `confirmation` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_items`
--

INSERT INTO `return_items` (`order_id`, `product_id`, `color_description`, `promo_id`, `quantity`, `reason`, `proof_pic`, `malfunctioning`, `return_date`, `return_bill_of_ladding`, `confirmation`) VALUES
(21, 21, 'Black', 0, 1, 'defect', 'monitor-acer aspire.jpg', 1, '2017-05-14 03:28:04', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_supply`
--

CREATE TABLE `return_supply` (
  `product_id` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `remarks` text,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_supply`
--

INSERT INTO `return_supply` (`product_id`, `return_date`, `quantity`, `remarks`, `supplier_id`) VALUES
(4, '2017-05-10', 5, 'inya mut datuy', 1),
(4, '2017-05-10', 10, 'asdasdasd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipped_by`
--

CREATE TABLE `shipped_by` (
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courrier_id` int(11) NOT NULL,
  `fee` decimal(9,2) DEFAULT NULL,
  `bill_of_ladding` varchar(255) DEFAULT NULL,
  `plate_number` varchar(7) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipped_by`
--

INSERT INTO `shipped_by` (`shipping_id`, `order_id`, `courrier_id`, `fee`, `bill_of_ladding`, `plate_number`, `delivery_date`, `delivery_days`) VALUES
(4, 14, 5, '90.00', '3.jpg', NULL, '2017-05-11', 80),
(5, 15, 6, '90.00', '2.jpg', NULL, '2017-05-12', 90),
(6, 16, 4, '90.00', '4.jpg', NULL, '2017-05-12', 8),
(7, 17, 5, '899.00', '59163b0b27659.jpg', NULL, '2017-05-13', 88),
(8, 18, 4, '100.00', 'promo3.jpg', NULL, '2017-05-13', 2),
(9, 19, 6, '150.00', '5917ac646d8bc.jpg', NULL, '2017-05-14', 2),
(10, 20, 4, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `contact_fname` varchar(40) DEFAULT NULL,
  `contact_lname` varchar(40) DEFAULT NULL,
  `contact_title` varchar(50) DEFAULT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company_name`, `contact_fname`, `contact_lname`, `contact_title`, `phone`) VALUES
(2, 'Computer Parts Shop', 'Leila', 'De Quatro', 'Supplier', '09128734657'),
(3, 'Juancho''s Computers', 'Juancho', 'Lucho', 'Manager', '09876543211'),
(4, 'All Items Shopping ', 'Rody', 'Dugs', 'CEO', '09876543212'),
(5, 'Buy and Sell Baguio', 'Jaxon', 'Sparrot', 'Manager', '09876543289');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `supply_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `supply_date` datetime NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `returned_items` int(11) DEFAULT NULL,
  `remarks` text,
  `requested_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`supply_id`, `supplier_id`, `product_id`, `color_description`, `supply_date`, `quantity`, `returned_items`, `remarks`, `requested_qty`) VALUES
(1, 2, 11, 'Default', '2017-05-10 10:26:58', 10, NULL, '', 10),
(2, 5, 12, 'Default', '2017-05-10 10:29:13', 20, NULL, '', 20),
(3, 3, 13, 'Black', '2017-05-10 10:32:23', 20, NULL, '', 20),
(3, 3, 13, 'Blue', '2017-05-10 10:32:23', 20, NULL, '', 20),
(3, 3, 13, 'Red', '2017-05-10 10:32:23', 20, NULL, '', 20),
(3, 3, 13, 'White', '2017-05-10 10:32:23', 20, NULL, '', 20),
(7, 2, 14, 'Default', '2017-05-10 10:33:43', 15, NULL, '', 15),
(8, 4, 15, 'Default', '2017-05-10 10:34:55', 20, NULL, '', 20),
(9, 4, 16, 'Default', '2017-05-10 10:36:14', 8, NULL, '', 8),
(10, 4, 17, 'Default', '2017-05-10 10:37:39', 5, NULL, '', 5),
(11, 2, 18, 'Default', '2017-05-10 10:38:37', 5, NULL, '', 5),
(12, 2, 19, 'Default', '2017-05-10 10:40:30', 2, NULL, '', 2),
(13, 3, 20, 'Default', '2017-05-10 10:41:58', 1, NULL, '', 1),
(14, 4, 21, 'Black', '2017-05-10 10:44:19', 3, NULL, '', 3),
(14, 4, 21, 'White', '2017-05-10 10:44:19', 3, NULL, '', 3),
(16, 2, 22, 'Default', '2017-05-10 10:45:50', 10, NULL, '', 10),
(17, 3, 23, 'Blue', '2017-05-10 10:49:27', 10, NULL, '', 10),
(17, 3, 23, 'Green', '2017-05-10 10:49:27', 10, NULL, '', 10),
(17, 3, 23, 'Violet', '2017-05-10 10:49:27', 15, NULL, '', 15),
(17, 3, 23, 'White', '2017-05-10 10:49:27', 10, NULL, '', 10),
(21, 2, 24, 'Default', '2017-05-10 10:51:20', 5, NULL, '', 5),
(22, 3, 26, 'Default', '2017-05-10 10:54:33', 3, NULL, '', 3),
(23, 5, 27, 'Default', '2017-05-10 10:55:53', 3, NULL, '', 3),
(24, 3, 28, 'Default', '2017-05-10 10:58:02', 50, NULL, '', 50),
(25, 2, 24, 'Default', '2017-05-10 11:35:59', 10, NULL, '', 10),
(26, 2, 24, 'Default', '2017-05-13 02:43:44', 10, NULL, '', 10),
(26, 3, 25, 'Default', '2017-05-13 02:43:44', 15, NULL, '', 15),
(28, 3, 25, 'Default', '2017-05-13 02:49:19', 6, NULL, 'kulang ng apat', 10),
(29, 2, 29, 'white', '2017-05-14 03:16:18', 1, NULL, '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`aud_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`order_id`,`product_id`,`color_description`,`promo_id`,`item_status`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `composed_of`
--
ALTER TABLE `composed_of`
  ADD PRIMARY KEY (`product_id`,`color_description`,`promo_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `courrier`
--
ALTER TABLE `courrier`
  ADD PRIMARY KEY (`courrier_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_monitoring`
--
ALTER TABLE `customer_monitoring`
  ADD PRIMARY KEY (`monitoring_id`);

--
-- Indexes for table `daycount`
--
ALTER TABLE `daycount`
  ADD PRIMARY KEY (`today`,`product_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`product_id`,`color_description`,`supplier_id`,`unit_price`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `item_info`
--
ALTER TABLE `item_info`
  ADD PRIMARY KEY (`product_id`,`supplier_id`,`unit_price`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `personal_info`
--
ALTER TABLE `personal_info`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `remitance`
--
ALTER TABLE `remitance`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`order_id`,`product_id`,`color_description`,`promo_id`,`return_date`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `shipped_by`
--
ALTER TABLE `shipped_by`
  ADD PRIMARY KEY (`shipping_id`,`order_id`,`courrier_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `courrier_id` (`courrier_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`supply_id`,`supplier_id`,`product_id`,`color_description`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `aud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `courrier`
--
ALTER TABLE `courrier`
  MODIFY `courrier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customer_monitoring`
--
ALTER TABLE `customer_monitoring`
  MODIFY `monitoring_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `item_info`
--
ALTER TABLE `item_info`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shipped_by`
--
ALTER TABLE `shipped_by`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
--
-- Database: `prototypetest`
--
CREATE DATABASE IF NOT EXISTS `prototypetest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prototypetest`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_fname` varchar(40) NOT NULL,
  `admin_lname` varchar(40) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `active_admin` tinyint(4) NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_fname`, `admin_lname`, `title`, `phone`, `email`, `username`, `password`, `active_admin`, `supervisor_id`) VALUES
(1, 'juan', 'tamad', 'BOSS', '09636589623', 'juan@gamil.com', 'juan123', 'juan123', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `proof_of_payment` varchar(255) DEFAULT NULL,
  `verification` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `warranty` datetime DEFAULT NULL,
  `item_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` text,
  `cat_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `composed_of`
--

CREATE TABLE `composed_of` (
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courrier`
--

CREATE TABLE `courrier` (
  `courrier_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `f_name` varchar(40) DEFAULT NULL,
  `l_name` varchar(40) DEFAULT NULL,
  `organization` varchar(40) DEFAULT NULL,
  `Event` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_pic` varchar(255) DEFAULT NULL,
  `availability` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_info`
--

CREATE TABLE `item_info` (
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `unit_price` decimal(9,2) NOT NULL,
  `unit_instock` int(11) NOT NULL,
  `unit_onorder` int(11) DEFAULT NULL,
  `reorder_level` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` text,
  `model_number` varchar(50) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `warranty_days` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `malfunctioning_item` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `transaction_status` varchar(20) NOT NULL,
  `balance` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_total` decimal(9,2) NOT NULL,
  `total_discount` decimal(9,0) DEFAULT NULL,
  `grand_total` decimal(9,0) DEFAULT NULL,
  `classification` varchar(30) NOT NULL,
  `comments` text,
  `order_date` datetime NOT NULL,
  `sales_person` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `date_paid` datetime NOT NULL,
  `amount_paid` decimal(9,2) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `money_change` decimal(9,2) DEFAULT NULL,
  `OR_number` varchar(50) DEFAULT NULL,
  `OR_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

CREATE TABLE `personal_info` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(4) DEFAULT NULL,
  `customer_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promo_id` int(11) NOT NULL,
  `promo_worth` decimal(9,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `promo_name` varchar(50) DEFAULT NULL,
  `promo_difference` decimal(9,2) DEFAULT NULL,
  `promo_difference_type` varchar(15) DEFAULT NULL,
  `promo_status` varchar(15) DEFAULT NULL,
  `promo_warranty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `remitance`
--

CREATE TABLE `remitance` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `proof_of_payment` varchar(255) DEFAULT NULL,
  `tracking_num` varchar(50) NOT NULL,
  `verification` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text NOT NULL,
  `proof_pic` varchar(255) NOT NULL,
  `malfunctioning` int(11) DEFAULT NULL,
  `return_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipped_by`
--

CREATE TABLE `shipped_by` (
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courrier_id` int(11) NOT NULL,
  `fee` decimal(9,2) NOT NULL,
  `bill_of_ladding` varchar(255) DEFAULT NULL,
  `plate_number` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `contact_fname` varchar(40) DEFAULT NULL,
  `contact_lname` varchar(40) DEFAULT NULL,
  `contact_title` varchar(50) DEFAULT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `supply_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_description` varchar(40) NOT NULL,
  `supply_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`order_id`,`product_id`,`color_description`,`promo_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `composed_of`
--
ALTER TABLE `composed_of`
  ADD PRIMARY KEY (`product_id`,`color_description`,`promo_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `courrier`
--
ALTER TABLE `courrier`
  ADD PRIMARY KEY (`courrier_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`product_id`,`color_description`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `item_info`
--
ALTER TABLE `item_info`
  ADD PRIMARY KEY (`product_id`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `personal_info`
--
ALTER TABLE `personal_info`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `remitance`
--
ALTER TABLE `remitance`
  ADD PRIMARY KEY (`order_id`,`payment_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`order_id`,`product_id`,`color_description`,`promo_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `shipped_by`
--
ALTER TABLE `shipped_by`
  ADD PRIMARY KEY (`shipping_id`,`order_id`,`courrier_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `courrier_id` (`courrier_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`supply_id`,`supplier_id`,`product_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courrier`
--
ALTER TABLE `courrier`
  MODIFY `courrier_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_info`
--
ALTER TABLE `item_info`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shipped_by`
--
ALTER TABLE `shipped_by`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `admin` (`admin_id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
