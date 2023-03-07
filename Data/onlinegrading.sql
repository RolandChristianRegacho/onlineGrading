-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2023 at 09:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinegrading`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) NOT NULL,
  `accountType` int(1) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first` varchar(50) NOT NULL,
  `middle` varchar(50) NOT NULL,
  `last` varchar(50) NOT NULL,
  `year` varchar(8) NOT NULL DEFAULT '0',
  `section` varchar(20) NOT NULL DEFAULT '0',
  `schoolYear` int(3) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `accountType`, `username`, `password`, `first`, `middle`, `last`, `year`, `section`, `schoolYear`, `is_deleted`, `date_time`) VALUES
(1, 0, 'admin', '$2y$10$.o7E/75Te4D.OiXmzd.eLO3K8C/YaEET0Bifc.zBXQSh28oxVyvbC', 'admin', 'admin', 'admin', '0', '0', 0, 0, '2023-03-06 03:12:45'),
(2, 1, 'SageGonzales', '$2y$10$/d0fCBrFTjXaEumJPKPgfOrBsLwnrWgxXRydUeogOcGIg8dYGZzre', 'Sage', 'A', 'Gonzales', '0', '0', 0, 0, '2023-03-06 03:12:45'),
(16, 1, 'RolandRegacho', '$2y$10$.o7E/75Te4D.OiXmzd.eLO3K8C/YaEET0Bifc.zBXQSh28oxVyvbC', 'Roland', 'Too', 'Regacho', '0', '0', 0, 0, '2023-03-06 03:12:45'),
(17, 1, 'RigorAbargos', '$2y$10$vUBl6I8Tp6.aqUOBXVivEOiWTHHbRol2x9Q4cUuAIo33mQz5jCJSu', 'Rigor', '', 'Abargos', '0', '0', 0, 0, '2023-03-06 03:12:45'),
(21, 2, '20123123', '$2y$10$Tx62tDSYfeInI0VswsvDUOnFJ9/IFk0wISKiSImjynxXUE6XPvOj.', 'sdadasdasdasdsa', 'asd', 'asdadad', 'Grade 2', 'second', 20, 0, '2023-03-06 03:12:45'),
(22, 2, '20123131', '$2y$10$T8DVW6hr9W45dv6KJubIyeAZY/NLdC.pU5KeifR0wBhkKehrGI1JS', 'ojklljl', 'ljljkjl', 'l', 'Grade 3', 'third', 20, 0, '2023-03-06 03:12:45'),
(23, 2, '2012323', '$2y$10$.o7E/75Te4D.OiXmzd.eLO3K8C/YaEET0Bifc.zBXQSh28oxVyvbC', 'uyyioyiu', 'dsd', 'rtrt', 'Grade 2', 'second', 20, 0, '2023-03-06 03:12:45'),
(24, 2, '23421234', '$2y$10$au3ItgZhj00Yp.Sc1DVfKuvg3dFFqmaOaJc7mqIInanMYaeNWte8m', 'sdfdf', 'sdda', 'erte', 'Grade 2', 'second', 20, 0, '2023-03-06 03:12:45'),
(25, 2, '12322323', '$2y$10$y6EF0IKQX6c.EqdC6LQVJusSz9W8agl2sqs6moUtwdYHipQW6Y3Rq', 'hjkhk', 'asd', 'ddg', 'Grade 3', 'third', 20, 0, '2023-03-06 03:12:45'),
(26, 2, '1232323', '$2y$10$5XkBW74q8DgRWg9m62KYSupTYB9u6kDYEWH/wBlawhpTp2plWRyv.', 'sh', 's', 'to', 'Grade 11', 'eleven', 20, 0, '2023-03-06 03:12:45'),
(27, 2, 'Subject Code', '$2y$10$G98bY6R3Ute.Zp70sdQh.ejYQbc6ttNRtRmU.RSlsHcIrIzadYfnK', 'Subject Description', '', '', '', '', 20, 0, '2023-03-06 03:12:45'),
(28, 2, 'Math1', '$2y$10$f10fe38J1AY6uhdr5wy7yOD3vW0UW3q/cx4FfnIUibKIs3DHRy.Xm', 'Mathematics', '', '', '', '', 20, 0, '2023-03-06 03:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) NOT NULL,
  `studentNumber` varchar(20) NOT NULL,
  `subjCode` varchar(20) NOT NULL,
  `grade` float NOT NULL,
  `section` varchar(20) NOT NULL,
  `period` varchar(11) NOT NULL,
  `schoolYear` int(3) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `studentNumber`, `subjCode`, `grade`, `section`, `period`, `schoolYear`, `date_time`) VALUES
(3, '1232323', 'Research101', 25, 'eleven', '1st Sem', 20, '2023-03-06 03:12:56'),
(4, '20123123', 'Fil2', 76, 'second', '1st Grading', 20, '2023-03-06 03:12:56'),
(5, '2012323', 'Fil2', 25, 'second', '1st Grading', 20, '2023-03-06 03:12:56'),
(6, '23421234', 'Fil2', 34, 'second', '1st Grading', 20, '2023-03-06 03:12:56'),
(7, '1232323', 'Research101', 76, 'eleven', '2nd Sem', 20, '2023-03-06 03:12:56'),
(8, '20123123', 'Fil2', 70, 'second', '2nd Grading', 20, '2023-03-06 03:12:56'),
(9, '2012323', 'Fil2', 70, 'second', '2nd Grading', 20, '2023-03-06 03:12:56'),
(10, '23421234', 'Fil2', 70, 'second', '2nd Grading', 20, '2023-03-06 03:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sectionID` int(30) NOT NULL,
  `section` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionID`, `section`, `year`, `date_time`) VALUES
(11, 'second', 'Grade 2', '2023-03-06 03:13:09'),
(12, 'third', 'Grade 3', '2023-03-06 03:13:09'),
(13, 'eleven', 'Grade 11', '2023-03-06 03:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `studentlist`
--

CREATE TABLE `studentlist` (
  `studentNumber` varchar(20) NOT NULL,
  `first` varchar(50) NOT NULL,
  `middle` varchar(50) NOT NULL,
  `last` varchar(50) NOT NULL,
  `year` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL,
  `schoolYear` int(10) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `studentlist`
--

INSERT INTO `studentlist` (`studentNumber`, `first`, `middle`, `last`, `year`, `section`, `schoolYear`, `is_deleted`, `date_time`) VALUES
('12322323', 'hjkhk', 'asd', 'ddg', 'Grade 3', 'third', 20, 0, '2023-03-06 03:13:19'),
('1232323', 'sh', 's', 'to', 'Grade 11', 'eleven', 20, 0, '2023-03-06 03:13:19'),
('20123123', 'sdadasdasdasdsa', 'asd', 'asdadad', 'Grade 2', 'second', 20, 0, '2023-03-06 03:13:19'),
('20123131', 'ojklljl', 'ljljkjl', 'l', 'Grade 3', 'third', 20, 0, '2023-03-06 03:13:19'),
('2012323', 'uyyioyiu', 'dsd', 'rtrt', 'Grade 2', 'second', 20, 0, '2023-03-06 03:13:19'),
('23421234', 'sdfdf', 'sdda', 'erte', 'Grade 2', 'second', 20, 0, '2023-03-06 03:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subjID` int(10) NOT NULL,
  `subjcode` varchar(20) NOT NULL,
  `subjdesc` varchar(255) NOT NULL,
  `year` varchar(20) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subjID`, `subjcode`, `subjdesc`, `year`, `teacher`, `is_deleted`, `date_time`) VALUES
(4, 'Fil2', 'Filipino', 'Grade 2', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(5, 'Math2', 'Mathematics', 'Grade 2', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(7, 'Sci2', 'Science', 'Grade 2', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(8, 'AP2', 'Makabayan', 'Grade 2', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(9, 'Eng2', 'English', 'Grade 2', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(10, 'Eng3', 'English', 'Grade 3', 'RolandRegacho', 0, '2023-03-06 03:13:29'),
(11, 'Sci3', 'Science', 'Grade 3', 'RigorAbargos', 0, '2023-03-06 03:13:29'),
(12, 'Research101', 'Research Methodologies', 'Grade 11', 'SageGonzales', 0, '2023-03-06 03:13:29'),
(16, 'Math1', 'Mathematics', 'Grade 1', '', 1, '2023-03-07 03:24:13'),
(17, 'test2', 'this is a test', 'Grade 3', 'RigorAbargos', 0, '2023-03-07 05:37:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sectionID`);

--
-- Indexes for table `studentlist`
--
ALTER TABLE `studentlist`
  ADD PRIMARY KEY (`studentNumber`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subjID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `sectionID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subjID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
