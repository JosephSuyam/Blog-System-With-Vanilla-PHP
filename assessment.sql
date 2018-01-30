-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2018 at 05:55 AM
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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
