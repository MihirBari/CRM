-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 08:57 AM
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
(17, 'Techsa1', 'Kushal', 'CIO', '8369593874', 'kushal.s@techsa.net', '2024-04-18 13:24:26', '2024-04-18 13:24:26'),
(19, 'Techsa1', 'Mihir bari', 'CISO', '8369593874', 'mihir.b@techsa.net', '2024-04-18 12:33:21', '2024-04-18 12:33:21'),
(21, 'Techsa', 'Diana', 'CTO', '8668989445', 'diana@techsa.net', '2024-04-18 12:36:10', '2024-04-18 12:36:10');

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
(5, 'Techsa1', 'mihir.b@techsa.net', 'DB Ozone, Bldg No 10, Flat No 602, Off WEH, Besides Thakur Mall, Mira Road', 'Surat', 'Maharashtra', 'techsa.net');

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leaveapplication`
--
ALTER TABLE `leaveapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
