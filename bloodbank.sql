-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2024 at 04:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodstock`
--

CREATE TABLE `bloodstock` (
  `stockID` int(11) NOT NULL,
  `hospitalID` int(11) DEFAULT NULL,
  `A_POSITIVE` int(11) DEFAULT NULL,
  `B_POSITIVE` int(11) DEFAULT NULL,
  `AB_POSITIVE` int(11) DEFAULT NULL,
  `O_POSITIVE` int(11) DEFAULT NULL,
  `A_NEGATIVE` int(11) DEFAULT NULL,
  `B_NEGATIVE` int(11) DEFAULT NULL,
  `AB_NEGATIVE` int(11) DEFAULT NULL,
  `O_NEGATIVE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodstock`
--

INSERT INTO `bloodstock` (`stockID`, `hospitalID`, `A_POSITIVE`, `B_POSITIVE`, `AB_POSITIVE`, `O_POSITIVE`, `A_NEGATIVE`, `B_NEGATIVE`, `AB_NEGATIVE`, `O_NEGATIVE`) VALUES
(1, 1, 100, 150, 50, 200, 30, 40, 20, 60),
(2, 2, 80, 120, 40, 180, 25, 35, 15, 50),
(3, 3, 120, 180, 60, 250, 35, 45, 25, 70),
(4, 4, 10, 15, 5, 20, 8, 12, 3, 18),
(5, 5, 8, 12, 6, 15, 10, 18, 4, 22),
(6, 6, 15, 10, 8, 25, 6, 14, 5, 20),
(7, 7, 18, 10, 7, 23, 9, 16, 6, 25),
(8, 8, 12, 18, 8, 30, 7, 20, 5, 28),
(9, 9, 15, 12, 10, 25, 8, 14, 7, 22),
(10, 10, 20, 8, 6, 18, 10, 12, 4, 20),
(11, 11, 22, 15, 7, 28, 6, 18, 5, 24),
(12, 12, 17, 20, 9, 35, 8, 22, 6, 30),
(13, 13, 14, 18, 8, 30, 7, 20, 5, 28),
(14, 14, 16, 14, 10, 28, 9, 16, 7, 26),
(15, 15, 19, 10, 6, 22, 11, 14, 4, 18);

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donationID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `donateDate` date DEFAULT NULL,
  `donateTime` time DEFAULT NULL,
  `location` text DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donationID`, `userID`, `donateDate`, `donateTime`, `location`, `remark`) VALUES
(2, 1, '2024-01-03', '13:43:00', 'Hospital UMS', 'No remark'),
(3, 1, '2024-01-02', '15:42:00', 'Hospital Likas', 'Donate 1L');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL,
  `state` varchar(15) DEFAULT NULL,
  `hospname` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phonenum` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `state`, `hospname`, `address`, `email`, `phonenum`) VALUES
(1, 'Sabah', 'Sabah General Hospital', '123 Main Street, Kota Kinabalu', 'sabahhospital@example.com', '123456789'),
(2, 'Terengganu', 'Terengganu Medical Center', '456 First Avenue, Kuala Terengganu', 'terengganuhospital@example.com', '987654321'),
(3, 'Selangor', 'Selangor Regional Hospital', '789 Oak Lane, Petaling Jaya', 'selangorhospital@example.com', '456789012'),
(4, 'Sabah', 'Kota Kinabalu Medical Center', '456 Ocean Avenue, Kota Kinabalu', 'kkmedical@example.com', '111222333'),
(5, 'Terengganu', 'Terengganu General Hospital', '789 Palm Street, Kuala Terengganu', 'terengganugeneral@example.com', '444555666'),
(6, 'Selangor', 'Petaling Jaya Community Hospital', '123 Forest Road, Petaling Jaya', 'pjcommunity@example.com', '777888999'),
(7, 'Sabah', 'Sabah Medical Center', '123 Sabah St', 'sabahmedical@example.com', '987654321'),
(8, 'Sabah', 'Borneo General Hospital', '456 Borneo St', 'borneogh@example.com', '876543210'),
(9, 'Sabah', 'Mount Kinabalu Hospital', '789 Kinabalu St', 'mountkinabalu@example.com', '765432109'),
(10, 'Terengganu', 'Terengganu Medical Center 2', '123 Terengganu St', 'terengganumedical@example.com', '111222333'),
(11, 'Terengganu', 'East Coast General Hospital', '456 East Coast St', 'eastcoastgh@example.com', '222333444'),
(12, 'Terengganu', 'Sultanah Nur Zahirah Hospital', '789 SNZH St', 'snzh@example.com', '333444555'),
(13, 'Selangor', 'Selangor Medical Center', '123 Selangor St', 'selangormedical@example.com', '444555666'),
(14, 'Selangor', 'Sunway Medical Hospital', '456 Sunway St', 'sunwaymedical@example.com', '555666777'),
(15, 'Selangor', 'Assunta Hospital', '789 Assunta St', 'assuntahospital@example.com', '666777888');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `historyID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `allergies` varchar(255) NOT NULL,
  `medications` varchar(255) NOT NULL,
  `past_surgeries` varchar(255) NOT NULL,
  `family_history` varchar(255) NOT NULL,
  `medical_conditions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`historyID`, `userID`, `allergies`, `medications`, `past_surgeries`, `family_history`, `medical_conditions`) VALUES
(1, 1, 'Nut', 'None', 'None', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `IsRead` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `UserID`, `Content`, `Timestamp`, `IsRead`) VALUES
(1, 1, 'Thank you for your recent blood donation! Your contribution will help save lives.', '2024-01-13 10:00:00', 1),
(2, 1, 'Urgent: Blood supplies are low. Consider donating blood to the local blood bank today!', '2024-01-13 12:30:00', 0),
(3, 1, 'Your recent blood donation has been acknowledged by the blood bank. Thank you for your generosity! Your support means a lot to us.', '2024-01-13 14:45:00', 0),
(4, 2, 'Thank you for your recent blood donation! Your contribution is saving lives.', '2024-01-15 10:30:00', 0),
(5, 3, 'Blood stock levels are low. Please coordinate with donors and organize a blood drive.', '2024-01-15 11:45:00', 0),
(6, 4, 'Good news! A compatible blood donor has been found for you. Please visit the hospital for the transfusion.', '2024-01-15 12:15:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(4) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `bloodtype` varchar(6) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phonenum` varchar(12) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `img_path` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `userID`, `firstname`, `lastname`, `gender`, `height`, `weight`, `bloodtype`, `dob`, `phonenum`, `address`, `img_path`) VALUES
(1, 1, 'John', 'Doe', 'male', 180, 75, 'A+', '1990-06-15', '1234567890', '123 Main St', 'Profile.jpg'),
(2, 2, 'Jane', 'Smith', 'Female', 160, 55, 'B-', '1985-05-15', '9876543210', '456 Oak St', ''),
(3, 3, 'Mike', 'Johnson', 'Male', 175, 80, 'O+', '1978-08-22', '5551234567', '789 Maple St', ''),
(4, 4, 'Sarah', 'Williams', 'Female', 165, 68, 'AB+', '1993-12-10', '1112223333', '101 Pine St', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `registrationDate` date NOT NULL DEFAULT (CURDATE())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userEmail`, `userPwd`, `registrationDate`) VALUES
(1, 'user1@example.com', '$2y$10$x0DK.Agj065KttRpb6gHk.omFZ0ao..cWARPa2kJylf.gOLIxyzLS', '2024-01-12'),
(2, 'user2@example.com', '$2y$10$tjhBZviZjej7rEIKlwibyORNK6AkIfJrUJ4ADjBrzh63qeLFKiJD2', '2024-01-12'),
(3, 'user3@example.com', '$2y$10$T4Zp6bmt8AF8SuUAoXQLZeEJ1ExP5jc7dLAzJw.WoaKynYP1cBhf.', '2024-01-12'),
(4, 'user4@example.com', '$2y$10$4/lFCOi1AJFz9M47qMBA/ub0qonypJpj4rB/NCRFRLK8XPER0gVOG', '2024-01-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodstock`
--
ALTER TABLE `bloodstock`
  ADD PRIMARY KEY (`stockID`),
  ADD KEY `hospitalID` (`hospitalID`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`historyID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodstock`
--
ALTER TABLE `bloodstock`
  MODIFY `stockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `donationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `historyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodstock`
--
ALTER TABLE `bloodstock`
  ADD CONSTRAINT `bloodstock_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`) ON DELETE CASCADE;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
