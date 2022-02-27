-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2022 at 04:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `agentdata`
--

CREATE TABLE `agentdata` (
  `Agent_id` int(11) NOT NULL,
  `Agent_name` varchar(30) NOT NULL,
  `Agent_email_id` varchar(30) NOT NULL,
  `Agent_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agentdata`
--

INSERT INTO `agentdata` (`Agent_id`, `Agent_name`, `Agent_email_id`, `Agent_password`) VALUES
(1, 'Sreenivasa', 'sreenivasa@gmail.com', '544655'),
(2, 'Abhishek', 'abhishek@gmail.com', 'nhrt4444');

-- --------------------------------------------------------

--
-- Table structure for table `agent_assignation`
--

CREATE TABLE `agent_assignation` (
  `Agent_id` int(11) DEFAULT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Complaint_status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agent_assignation`
--

INSERT INTO `agent_assignation` (`Agent_id`, `Complaint_id`, `Complaint_status`) VALUES
(2, 2, 'Not completed'),
(1, 3, 'Completed'),
(2, 4, 'Not completed');

-- --------------------------------------------------------

--
-- Table structure for table `employee_works`
--

CREATE TABLE `employee_works` (
  `Complaint_id` int(11) NOT NULL,
  `Employee_name` varchar(30) NOT NULL,
  `Work_progression` enum('Completed','In progress','Stuck') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_works`
--

INSERT INTO `employee_works` (`Complaint_id`, `Employee_name`, `Work_progression`) VALUES
(1, '	Sarath', 'Stuck'),
(2, 'Tom', 'Stuck'),
(3, 'Harsh', 'Completed'),
(4, 'Krish', 'In progress');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(30) DEFAULT NULL,
  `User_contact_number` int(10) DEFAULT NULL,
  `User_email_id` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`User_id`, `User_name`, `User_contact_number`, `User_email_id`, `Password`) VALUES
(100, 'Arno', 545445, 'arno3@gmail.com', 'fefer7g'),
(101, 'Jake', 8797797, 'jake234@gmail.com', 'd4efewr4g4'),
(102, 'Xavi', 0, 'fggh484', '[value-5]'),
(103, 'John McLeane', 7844848, 'john13@gmail.com', 'berfbeb');

-- --------------------------------------------------------

--
-- Table structure for table `user_complaints`
--

CREATE TABLE `user_complaints` (
  `Complaint_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Complaints` text NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_complaints`
--

INSERT INTO `user_complaints` (`Complaint_id`, `User_id`, `Complaints`, `Date`) VALUES
(1, 100, 'Hello this is Arno posting...', '0000-00-00 00:00:00'),
(2, 101, 'Jake is testing', '0000-00-00 00:00:00'),
(3, 102, 'Xavi testing', '0000-00-00 00:00:00'),
(4, 103, 'This is John,but there is a problem...', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agentdata`
--
ALTER TABLE `agentdata`
  ADD PRIMARY KEY (`Agent_id`),
  ADD UNIQUE KEY `Agent_email_id` (`Agent_email_id`);

--
-- Indexes for table `agent_assignation`
--
ALTER TABLE `agent_assignation`
  ADD KEY `agent_assignation_ibfk_2` (`Complaint_id`),
  ADD KEY `agent_assignation_ibfk_1` (`Agent_id`);

--
-- Indexes for table `employee_works`
--
ALTER TABLE `employee_works`
  ADD PRIMARY KEY (`Complaint_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `User_contact_number` (`User_contact_number`,`User_email_id`);

--
-- Indexes for table `user_complaints`
--
ALTER TABLE `user_complaints`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `User_id` (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agentdata`
--
ALTER TABLE `agentdata`
  MODIFY `Agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_assignation`
--
ALTER TABLE `agent_assignation`
  ADD CONSTRAINT `agent_assignation_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agentdata` (`Agent_id`),
  ADD CONSTRAINT `agent_assignation_ibfk_2` FOREIGN KEY (`Complaint_id`) REFERENCES `user_complaints` (`Complaint_id`);

--
-- Constraints for table `employee_works`
--
ALTER TABLE `employee_works`
  ADD CONSTRAINT `employee_works_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `agent_assignation` (`Complaint_id`);

--
-- Constraints for table `user_complaints`
--
ALTER TABLE `user_complaints`
  ADD CONSTRAINT `user_complaints_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `userdata` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
