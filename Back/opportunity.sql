-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database-1.cjkq2a464mvr.ap-south-1.rds.amazonaws.com
-- Generation Time: Jun 10, 2024 at 11:42 AM
-- Server version: 10.11.6-MariaDB-log
-- PHP Version: 8.2.19

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
-- Table structure for table `opportunity`
--

CREATE TABLE `opportunity` (
  `id` int(11) NOT NULL,
  `customer_entity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `License_type` varchar(255) NOT NULL,
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

INSERT INTO `opportunity` (`id`, `customer_entity`, `name`, `description`, `type`, `License_type`, `value`, `closure_time`, `status`, `period`, `license_from`, `license_to`, `pdf`) VALUES
(1, 'SBI DFHI Limited', 'Robin Kaleramana', 'Demo Done', 'BigFix', 'New', 100000, '2024-07-01', 'Demo Done', 'New BigFix Opportunity', NULL, NULL, NULL),
(2, 'SBI DFHI Limited', 'Robin Kaleramana', 'Demo Done', 'SolarWinds', 'New', 100000, '2024-06-28', 'Demo Done', 'New SolarWinds Opportunity', NULL, NULL, NULL),
(28, 'Yes Bank Limited', '', 'On-site annual support for BigFix ', 'Services', 'Renewal', 3600000, '2024-03-31', 'Won', '1 Year service', '2024-04-01', '2025-03-31', NULL),
(29, 'Avacend Solutions Private Limited', '', 'Cisco on-site support', 'Services', 'Renewal', 1560000, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(30, 'BSE Limited', '', 'On-site annual support for SolarWinds', 'Services', 'Renewal', 3246327, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(31, 'Mylan Inc ', '', 'BigFix Renewals', 'BigFix', 'Renewal', 7924234, '2024-03-31', 'Won', '1', '2024-05-01', '2025-04-30', NULL),
(32, 'Godrej Industries Limited', '', 'BigFix Renewals', 'BigFix', 'Renewal', 2599865, '2024-03-31', 'Won', '2', '2024-04-01', '2025-03-31', NULL),
(33, 'BSE Limited', '', 'Netscout Renewal', 'SolarWinds', 'Renew', 4181934, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(34, 'BSE Limited', '', 'SolarWinds Renewals', 'Services', 'Renew', 7767464, '2024-04-01', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(35, 'Angel One Limited ', '', 'Annual Support for SolarWinds ', 'Services', 'Renew', 400000, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(36, 'Angel One Limited ', '', 'SolarWinds Renewals ', 'SolarWinds', 'Renew', 1590118, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(37, 'Axis Bank Limited', '', 'SolarWinds Renewals', 'SolarWinds', 'Renew', 18468137, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(38, 'BSE Limited', '', 'BigFix Renewals', 'BigFix', 'Renew', 8950356, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(39, 'Karnataka Bank Limited', '', 'SolarWinds Renewal', 'SolarWinds', 'Renew', 9258151, '2024-03-31', 'Won', '1', '2024-04-01', '2025-03-31', NULL),
(40, 'DCB Bank Limited ', '', 'BigFix Renewals', 'BigFix', 'Renew', 7480226, '2024-03-30', 'Won', '3', '2024-04-01', '2025-03-31', NULL),
(41, '24/7 Customer Private Limited - Platina', '', 'BigFix Renewals ', 'BigFix', 'Renew', 2616441, '2024-03-31', 'Won', '1', '2024-04-01', '2024-03-31', NULL),
(42, 'BSE Limited', '', 'SolarWinds New Licenses', 'SolarWinds', 'New', 268566, '2024-04-01', 'Won', 'New SolarWinds Opportunity', '2024-04-01', '2025-03-31', NULL),
(43, 'Concentrix Daksh Services India Private Limited', '', 'BigFix Renewals', 'BigFix', 'Renew', 54503470, '2024-03-31', 'Won', '', '2024-04-01', '2025-03-31', NULL),
(44, 'Concentrix Daksh Services India Private Limited', '', 'BigFix New Licenses', 'BigFix', 'New', 432216473, '2024-03-31', 'Won', '3 Years', '2024-04-01', '2025-03-31', NULL),
(45, 'Adani Petronet (Dahej) Port Ltd ', '', 'SolarWinds New License', 'SolarWinds', 'New', 305230, '2024-04-01', 'Won', '1', '2024-04-14', '2025-05-13', NULL),
(46, 'National Commodity & Derivatives Exchange Limited', '', 'SolarWinds Renewals', 'SolarWinds', 'Renew', 1045053, '2024-06-19', 'Won', '1', '2024-06-19', '2025-06-18', NULL),
(47, 'ICICI Prudential Asset Management Company Limited ', '', 'Annual Support for SolarWinds', 'Services', 'Renew', 400000, '2023-09-11', 'Won', '1', '2023-09-11', '2024-09-10', NULL),
(48, 'Mahindra & Mahindra Ltd', '', '', 'SolarWinds', 'Renew', 3828152, '2024-04-30', 'Won', '1', '2023-09-30', '2024-09-30', NULL),
(49, 'DCB Bank Limited ', '', 'BigFix Renewals CD', 'BigFix', 'Renew', 7256471, '2024-04-30', 'Won', '1', '2024-04-30', '2025-04-29', NULL),
(50, 'Inniti Network Solutions LLP', '', 'Annual Support for SolarWinds', 'Services', 'Renew', 250000, '2024-04-30', 'Won', '1', '2024-01-01', '2024-09-29', NULL),
(51, 'Cowtown Software Design Pvt. Ltd', '', 'SolarWinds Renewals ', 'SolarWinds', 'Renew', 1500000, '2024-04-30', 'Won', '1', '2023-10-01', '2024-09-30', NULL),
(52, 'Karnataka Bank Limited', '', 'Annual Support for SolarWinds', 'Services', 'Renew', 450000, '2023-09-01', 'Won', '1', '2023-09-01', '2024-08-31', NULL),
(53, 'Damika Insurance Broking Company Pvt Ltd', '', '13', 'BigFix', 'Renew', 6305, '2023-08-31', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(54, 'Bharat Forge Limited ', '', '555', 'BigFix', 'Renew', 269175, '2023-09-01', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(55, 'Khed Economic Infrastructure Private Limited', '', '12', 'BigFix', 'Renew', 5820, '2023-09-01', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(56, 'KTMS Design and Engineering Private Limited', '', '31', 'BigFix', 'Renew', 15035, '2023-09-01', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(57, 'BF Utilities Limited', '', '6', 'BigFix', 'Renew', 2910, '2023-08-30', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(58, 'BF Investment Limited', '', '3', 'BigFix', 'Renew', 1455, '2023-08-30', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(59, 'Kalyani Technoforge Limited ', '', '1', 'BigFix', 'Renew', 274025, '2023-09-21', 'Won', '1', '2023-09-01', '2024-11-22', NULL),
(60, 'Mahindra & Mahindra Financial Services Limited', '', 'Patch CD: 16000\nPatch MVS: 500', 'BigFix', 'Renew', 1822291, '2023-11-01', 'Won', '1', '2023-09-24', '2024-09-23', NULL),
(61, 'Mahindra & Mahindra Financial Services Limited', '', 'Annual Support', 'Services', 'Renew', 800000, '2023-11-01', 'Won', '1', '2023-09-24', '2024-09-23', NULL),
(62, 'Bharat Forge Limited ', '', '1', 'SolarWinds', 'Renew', 777000, '2023-10-02', 'Won', '1', '2023-08-23', '2024-10-26', NULL),
(63, 'Axis Asset Management Company Limited', '', '375', 'BigFix', 'Renew', 313894, '2023-10-10', 'Won', '1', '2023-10-01', '2024-09-30', NULL),
(64, 'IDBI Bank Limited', '', '3000', 'BigFix', 'Renew', 1449999, '2023-10-11', 'Won', '1', '2023-10-01', '2024-09-30', NULL),
(65, 'CG Power and Industrial Solutions Limited', '', '2', 'SolarWinds', 'Renew', 74760, '2023-09-27', 'Won', '1', '2023-09-01', '2024-08-31', NULL),
(66, 'DCB Bank Limited ', '', '500', 'BigFix', 'Renew', 1750500, '2023-10-16', 'Won', '1', '2023-10-23', '2024-10-22', NULL),
(67, 'Excelsoft Technologies Pvt Ltd', '', 'Patch CD: 850\nPatch MVS: 150', 'BigFix', 'Renew', 2184598, '2023-08-30', 'Won', '1', '2023-08-30', '2024-08-29', NULL),
(68, 'BSE Limited', '', 'StarterKit lifecycle, Inventory, Compliance CD: 525\nInventory, Compliance MVS: 1000\n', 'BigFix', 'Renew', 11751300, '2023-10-31', 'Won', 'Upfront Payment from BSE for 3 years.', '2023-10-30', '2026-10-29', NULL),
(69, 'Mahindra & Mahindra Financial Services Limited', '', 'Patch term CD: 16000\nPatch term MVS: 500', 'BigFix', 'Renew', 1822291, '2023-11-01', 'Won', '1', '2023-09-24', '2024-09-24', NULL),
(70, 'Mahindra & Mahindra Financial Services Limited', '', 'Annual Support for BigFic', 'Services', 'Services', 800000, '2023-11-01', 'Won', '1', '2023-09-24', '2024-09-23', NULL),
(71, 'Bandhan AMC Limited', '', '1', 'SolarWinds', 'Renew', 45237, '2023-11-01', 'Won', '1', '2023-11-01', '2024-10-31', NULL),
(72, 'Axis Bank Limited', '', 'Compliance perpetual MVS: 800\n', 'BigFix', 'Renew', 1034880, '2023-11-02', 'Won', '3 years ends in 15th Oct 2026', '2023-10-16', '2024-10-15', NULL),
(73, 'Pidilite Industries Ltd', '', '1', 'SolarWinds', 'Renew', 1196774, '2023-11-01', 'Won', '1', '2023-10-29', '2024-10-29', NULL),
(74, 'Pidilite Industries Ltd', '', 'Annual Support for SolarWinds', 'Services', 'Renew', 600000, '2023-11-01', 'Won', '1', '2023-10-29', '2024-10-29', NULL),
(75, 'LTIMindtree Limited', '', 'Annual support for BigFix', 'Services', 'Renew', 400000, '2023-11-01', 'Won', '1', '2023-11-01', '2024-10-31', NULL),
(76, 'SBM Bank (India) Limited', '', 'Patch term MVS: 150\nPatch MVS: 500', 'BigFix', 'Renew', 750750, '2023-11-06', 'Won', '3 Years ends in 1st Nov 2026', '2023-11-02', '2024-11-01', NULL),
(77, 'BSE Limited', '', 'SolarWinds Expansion of 4 APE and 4 HA', 'SolarWinds', 'New', 9500000, '2024-06-28', 'Progress Sub', '', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `opportunity`
--
ALTER TABLE `opportunity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
