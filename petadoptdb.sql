-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2025 at 04:12 PM
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
-- Database: `petadoptdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoptapp_tbl`
--

CREATE TABLE `adoptapp_tbl` (
  `ApplicationID` int(10) NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `ApplicationDate` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `PetID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adopter_tbl`
--

CREATE TABLE `adopter_tbl` (
  `AdopterID` int(10) NOT NULL,
  `ContactNo` int(15) DEFAULT NULL,
  `Fname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `ApplicationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_tbl`
--

CREATE TABLE `pet_tbl` (
  `PetID` int(10) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Age` int(5) DEFAULT NULL,
  `Size` varchar(25) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Addoptstatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shelter_tbl`
--

CREATE TABLE `shelter_tbl` (
  `ShelterID` int(10) NOT NULL,
  `Contactnumb` int(15) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PetID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptapp_tbl`
--
ALTER TABLE `adoptapp_tbl`
  ADD PRIMARY KEY (`ApplicationID`),
  ADD KEY `PetID` (`PetID`);

--
-- Indexes for table `adopter_tbl`
--
ALTER TABLE `adopter_tbl`
  ADD PRIMARY KEY (`AdopterID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `pet_tbl`
--
ALTER TABLE `pet_tbl`
  ADD PRIMARY KEY (`PetID`);

--
-- Indexes for table `shelter_tbl`
--
ALTER TABLE `shelter_tbl`
  ADD PRIMARY KEY (`ShelterID`),
  ADD KEY `PetID` (`PetID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoptapp_tbl`
--
ALTER TABLE `adoptapp_tbl`
  MODIFY `ApplicationID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adopter_tbl`
--
ALTER TABLE `adopter_tbl`
  MODIFY `AdopterID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_tbl`
--
ALTER TABLE `pet_tbl`
  MODIFY `PetID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shelter_tbl`
--
ALTER TABLE `shelter_tbl`
  MODIFY `ShelterID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoptapp_tbl`
--
ALTER TABLE `adoptapp_tbl`
  ADD CONSTRAINT `adoptapp_tbl_ibfk_1` FOREIGN KEY (`PetID`) REFERENCES `pet_tbl` (`PetID`);

--
-- Constraints for table `adopter_tbl`
--
ALTER TABLE `adopter_tbl`
  ADD CONSTRAINT `adopter_tbl_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `adoptapp_tbl` (`ApplicationID`);

--
-- Constraints for table `shelter_tbl`
--
ALTER TABLE `shelter_tbl`
  ADD CONSTRAINT `shelter_tbl_ibfk_1` FOREIGN KEY (`PetID`) REFERENCES `pet_tbl` (`PetID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
