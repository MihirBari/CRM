-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 03:27 PM
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
-- Database: `techsaadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` int(11) NOT NULL,
  `acknowledge` varchar(255) NOT NULL,
  `po_lost` varchar(255) NOT NULL,
  `alert_description` varchar(255) NOT NULL,
  `alert_type` varchar(255) NOT NULL,
  `alert_entity` varchar(255) NOT NULL,
  `daysLeft` int(11) NOT NULL,
  `license_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`id`, `acknowledge`, `po_lost`, `alert_description`, `alert_type`, `alert_entity`, `daysLeft`, `license_to`) VALUES
(10, 'Yes', 'No', 'License ', 'SolarWinds Renew', 'Techsa', 15, 'Fri Jul 5 2024'),
(12, 'No', 'No', '100 BigFix License', 'BigFix New', 'BSE', 15, 'Fri Jul 5 2024');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `customer_entity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `customer_entity`, `name`, `designation`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(16, 'Techsa', 'Mihir bari', 'CISO', '8369593873', 'mihir.b@techsa.net', '2024-04-18 12:36:03', '2024-04-18 12:36:03'),
(17, 'Techsa1', 'Kushal', 'CTO', '8369593874', 'kushal.s@techsa.net', '2024-05-21 10:39:38', '2024-05-21 10:39:38'),
(19, 'Techsa1', 'Mihir bari', 'CISO', '8400315900', 'mihir.b@techsa.net', '2024-05-21 10:38:58', '2024-05-21 10:38:58'),
(21, 'Techsa', 'Diana', 'CTO', '8668989445', 'diana@techsa.net', '2024-04-18 12:36:10', '2024-04-18 12:36:10'),
(23, 'BSE', 'Himani', 'CTO', '868675356', 'himani.g@techsa.net', '2024-05-21 19:45:01', '2024-05-21 19:45:01'),
(24, 'SVC', 'Kajal', 'CISO', '55555555', 'kajal.u@techsa.net', '2024-05-22 10:14:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_entity` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_entity`, `email`, `address`, `city`, `state`, `website`) VALUES
(1, 'Techsa', 'mihir.b@techsa.net', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Mumbai', 'Maharashtra', 'techsa.net'),
(2, 'Google', 'gsupport@gmail.com', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Pune', 'Maharashtra', 'google.com'),
(5, 'Techsa1', 'mihir.b@techsa.net', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Surat', 'Maharashtra', 'techsa.net'),
(6, 'BSE', 'bse@gmail.com', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Mumbai', 'Maharashtra', ''),
(7, 'SVC', 'SVC@scv.com', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Mumbai', 'Maharashtra', '');

-- --------------------------------------------------------

--
-- Table structure for table `leaveapplication`
--

CREATE TABLE `leaveapplication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `days` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `history` varchar(255) DEFAULT NULL,
  `assignedTo` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaveapplication`
--

INSERT INTO `leaveapplication` (`id`, `name`, `status`, `fromDate`, `toDate`, `type`, `duration`, `days`, `description`, `history`, `assignedTo`, `createdBy`, `created_at`, `update_at`) VALUES
(27, 'Mihir ', 'request', '2024-04-19', '2024-04-21', 'paid leave', 'Full Day', 2, 'test', '', 'Mihir', 'Mihir ', '2024-04-17 11:38:25', NULL),
(28, 'Kushal', 'request', '2024-04-19', '2024-04-20', 'paid leave', 'Full Day', 3, 'Ok', '', 'Mihir', 'Kushal', '2024-04-17 11:39:08', '2024-04-17 12:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `opportunity`
--

CREATE TABLE `opportunity` (
  `id` int(11) NOT NULL,
  `customer_entity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `closure_time` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL,
  `license_from` date DEFAULT NULL,
  `license_to` date DEFAULT NULL,
  `pdf` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opportunity`
--

INSERT INTO `opportunity` (`id`, `customer_entity`, `name`, `description`, `type`, `value`, `closure_time`, `status`, `period`, `license_from`, `license_to`, `pdf`) VALUES
(1, 'Techsa', 'Mihir bari', 'Nice', 'SolarWinds New', 7000, '2024-05-25', 'Progress Sub', '3', NULL, NULL, NULL),
(3, 'Techsa1', 'Kushal', 'Nice', 'SolarWinds New', 9500, '2024-05-19', 'Won', '4', '2024-05-21', '2024-07-20', NULL),
(4, 'Techsa', 'Diana', 'License ', 'SolarWinds Renew', 800000, '2024-05-19', 'Won', '0', '2023-07-05', '2024-07-05', NULL),
(5, 'BSE', 'Himani', '100 BigFix License', 'BigFix New', 700, '2024-05-21', 'Won', '4', '2023-07-06', '2024-07-05', NULL),
(7, 'Techsa1', 'Mihir bari', '1000 BigFix License', 'BigFix Renew', 9500, '2024-05-22', 'Won', '6', '2023-07-07', '2027-07-07', NULL),
(9, 'SVC', 'Kajal', '1000 license', 'SolarWinds New', 800000, '2024-05-22', 'Won', '3', '2023-07-07', '2024-07-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Mihir', 'mihir.b@techsa.net', '$2a$10$9o5a4FJYybRpLwSk2o5kleYCTU6BYhZMx3JYcz0rHc3hr2ItgdcQW', 'admin', '2024-04-15 18:03:02'),
(2, 'Kushal', 'kushal.s@techsa.net', '$2a$10$3hCYZIIdSnMKjMqvW21G..74afR4AHl9eyOsR3OkOjvEKPMrl.iee', 'user', '2024-04-15 18:07:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_entity` (`customer_entity`);

--
-- Indexes for table `leaveapplication`
--
ALTER TABLE `leaveapplication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `leaveapplication`
--
ALTER TABLE `leaveapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `opportunity`
--
ALTER TABLE `opportunity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
