-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2020 at 10:21 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeebugs`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

USE employeebugs;

CREATE TABLE `account` (
  `idAccount` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`idAccount`, `username`) VALUES
(1, 'motocdiana'),
(2, 'johnsnow');

-- --------------------------------------------------------

--
-- Table structure for table `bug`
--

CREATE TABLE `bug` (
  `idBug` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idBugFixer` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bug`
--

INSERT INTO `bug` (`idBug`, `idAccount`, `description`, `priority`, `status`, `idProduct`, `idBugFixer`, `name`) VALUES
(4, 1, 'It is defined as the bug in which the API is broken or invalid response is coming.', 2, 3, 1, 3, 'API Bug'),
(5, 1, 'Sometimes latest updates are available and the program may not be compatible with the same.', 3, 3, 1, 3, 'Browser Compatibility');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `idThread` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `text` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `idCompany` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`idCompany`, `name`) VALUES
(1, 'CompanyX');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `idEmployee` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`idEmployee`, `idAccount`, `idCompany`, `name`) VALUES
(3, 1, 1, 'George Nicholas'),
(4, 2, 1, 'John Snow');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `idCompany`, `name`) VALUES
(1, 1, 'ProductZ'),
(2, 1, 'ProductY'),
(3, 1, 'CompanyY');

-- --------------------------------------------------------

--
-- Table structure for table `screenshot`
--

CREATE TABLE `screenshot` (
  `idScreenshot` int(11) NOT NULL,
  `idBug` int(11) NOT NULL,
  `pathImage` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screenshot`
--

INSERT INTO `screenshot` (`idScreenshot`, `idBug`, `pathImage`) VALUES
(1, 4, 'noneatthismoment');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `idTag` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`idTag`, `type`) VALUES
(1, 'api'),
(2, 'compatibility');

-- --------------------------------------------------------

--
-- Table structure for table `tagbug`
--

CREATE TABLE `tagbug` (
  `idTagBug` int(11) NOT NULL,
  `idTag` int(11) NOT NULL,
  `idBug` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagbug`
--

INSERT INTO `tagbug` (`idTagBug`, `idTag`, `idBug`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `idThread` int(11) NOT NULL,
  `idBug` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`idThread`, `idBug`, `name`) VALUES
(1, 4, 'Th1'),
(2, 5, 'Th2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`idAccount`);

--
-- Indexes for table `bug`
--
ALTER TABLE `bug`
  ADD PRIMARY KEY (`idBug`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idBugFixer` (`idBugFixer`),
  ADD KEY `idAccount` (`idAccount`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD KEY `idThread` (`idThread`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`idCompany`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idEmployee`),
  ADD KEY `idAccount` (`idAccount`),
  ADD KEY `idCompany` (`idCompany`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCompany` (`idCompany`);

--
-- Indexes for table `screenshot`
--
ALTER TABLE `screenshot`
  ADD PRIMARY KEY (`idScreenshot`),
  ADD KEY `idBug` (`idBug`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`idTag`);

--
-- Indexes for table `tagbug`
--
ALTER TABLE `tagbug`
  ADD PRIMARY KEY (`idTagBug`),
  ADD KEY `idTag` (`idTag`),
  ADD KEY `idBug` (`idBug`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`idThread`),
  ADD KEY `idBug` (`idBug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `idAccount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bug`
--
ALTER TABLE `bug`
  MODIFY `idBug` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `idCompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `idEmployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `screenshot`
--
ALTER TABLE `screenshot`
  MODIFY `idScreenshot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tagbug`
--
ALTER TABLE `tagbug`
  MODIFY `idTagBug` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `idThread` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `bug_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  ADD CONSTRAINT `bug_ibfk_2` FOREIGN KEY (`idBugFixer`) REFERENCES `employee` (`idEmployee`),
  ADD CONSTRAINT `bug_ibfk_3` FOREIGN KEY (`idAccount`) REFERENCES `account` (`idAccount`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idThread`) REFERENCES `thread` (`idThread`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`idAccount`) REFERENCES `account` (`idAccount`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`idCompany`) REFERENCES `company` (`idCompany`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCompany`) REFERENCES `company` (`idCompany`);

--
-- Constraints for table `screenshot`
--
ALTER TABLE `screenshot`
  ADD CONSTRAINT `screenshot_ibfk_1` FOREIGN KEY (`idBug`) REFERENCES `bug` (`idBug`);

--
-- Constraints for table `tagbug`
--
ALTER TABLE `tagbug`
  ADD CONSTRAINT `tagbug_ibfk_1` FOREIGN KEY (`idTag`) REFERENCES `tag` (`idTag`),
  ADD CONSTRAINT `tagbug_ibfk_2` FOREIGN KEY (`idBug`) REFERENCES `bug` (`idBug`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`idBug`) REFERENCES `bug` (`idBug`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
