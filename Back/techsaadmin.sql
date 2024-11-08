-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database-1.cjkq2a464mvr.ap-south-1.rds.amazonaws.com
-- Generation Time: Nov 08, 2024 at 10:56 AM
-- Server version: 10.11.8-MariaDB-log
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
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` int(11) NOT NULL,
  `acknowledge` varchar(255) NOT NULL,
  `po_lost` varchar(255) NOT NULL,
  `alert_description` varchar(255) NOT NULL,
  `alert_type` varchar(255) NOT NULL,
  `License_type` varchar(255) NOT NULL,
  `alert_entity` varchar(255) NOT NULL,
  `daysLeft` int(11) NOT NULL,
  `license_to` varchar(255) DEFAULT NULL,
  `reminder` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`id`, `acknowledge`, `po_lost`, `alert_description`, `alert_type`, `License_type`, `alert_entity`, `daysLeft`, `license_to`, `reminder`) VALUES
(41, 'Yes', 'No', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 'Axis Securities Limited', 0, 'Thu Jul 4 2024', 'No'),
(42, 'Yes', 'No', 'Patch Term: 1500', 'BigFix', 'Renewal', 'Angel One Limited ', 0, 'Fri Jul 26 2024', 'No'),
(43, 'Yes', 'No', 'Patch Term MVS: 1000', 'BigFix', 'Renewal', 'Axis Bank Limited', 0, 'Wed Jul 31 2024', 'No'),
(44, 'Yes', 'No', 'Patch MVS: 5500\nCompliance MVS: 1000', 'BigFix', 'Renewal', 'Concentrix Daksh Services India Private Limited', 0, 'Wed Aug 14 2024', 'Yes'),
(45, 'Yes', 'No', 'StarterKit lifecycle Perpetual CD: 500', 'BigFix', 'Renewal', 'K Raheja Corporate Services Private Limited', 0, 'Tue Aug 20 2024', 'No'),
(46, 'Yes', 'No', 'HCO Advanced A250', 'SolarWinds', 'Renewal', 'Axis Securities Limited', 0, 'Tue Aug 27 2024', 'No'),
(48, 'Yes', 'No', 'SolarWinds NTA, NPM', 'SolarWinds', 'Renewal', 'Toshiba Software India Pvt Ltd', 0, 'Fri Aug 30 2024', 'No'),
(49, 'No', 'Yes', 'SolarWinds DameWare Remote: 2', 'SolarWinds', 'Renewal', 'CG Power and Industrial Solutions Limited', 0, 'Sat Aug 31 2024', 'No'),
(50, 'Yes', 'No', 'Annual Support for SolarWinds', 'Services', 'Renewal', 'Karnataka Bank Limited', 0, 'Sat Aug 31 2024', 'No'),
(51, 'Yes', 'No', 'Starterkit Lifecycle CD: 3000', 'BigFix', 'Renewal', 'DCB Bank Limited ', 0, 'Sun Sep 1 2024', 'Yes'),
(52, 'No', 'Yes', 'SolarWinds Renewal', 'SolarWinds', 'Renewal', 'L&T Finance Limited', 0, 'Wed Jul 31 2024', 'No'),
(53, 'Yes', 'No', 'Annual Support for SolarWinds', 'Services', 'Renewal', 'ICICI Prudential Asset Management Company Limited ', 0, 'Tue Sep 10 2024', 'No'),
(54, 'No', 'Yes', 'Patch CD: 850\nPatch MVS: 150', 'BigFix', 'Renewal', 'Excelsoft Technologies Pvt Ltd', 0, 'Sun Sep 1 2024', 'Yes'),
(55, 'Yes', 'No', 'Annual Support for BigFix', 'Services', 'Renewal', 'Mahindra & Mahindra Financial Services Limited', 0, 'Mon Sep 23 2024', 'Yes'),
(56, 'Yes', 'No', 'Patch term CD: 16000\nPatch term MVS: 500', 'BigFix', 'Renewal', 'Mahindra & Mahindra Financial Services Limited', 0, 'Tue Sep 24 2024', 'No'),
(57, 'Yes', 'No', 'Annual Support for SolarWinds', 'Services', 'Renewal', 'Inniti Network Solutions LLP', 0, 'Sun Sep 29 2024', 'No'),
(58, 'Yes', 'No', 'HCO Advanced A250', 'SolarWinds', 'Renewal', 'Inniti Network Solutions LLP', 0, 'Sun Sep 29 2024', 'No'),
(59, 'Yes', 'No', 'SolarWinds Renewals ', 'SolarWinds', 'Renewal', 'Cowtown Software Design Pvt. Ltd', 0, 'Mon Sep 30 2024', 'No'),
(60, 'No', 'Yes', 'DPA SRM Kiwi Syslog ', 'SolarWinds', 'Renewal', 'Mahindra & Mahindra Ltd', 0, 'Mon Sep 30 2024', 'No'),
(61, 'Yes', 'No', 'Lifecycle additional CD: 3000', 'BigFix', 'Renewal', 'IDBI Bank Limited', 0, 'Mon Sep 30 2024', 'No'),
(62, 'Yes', 'No', 'NPM, NTA, Kiwi CatTools, Kiwi Syslog Server', 'SolarWinds', 'Renewal', 'Shoppers Stop Limited', 0, 'Mon Sep 30 2024', 'No'),
(63, 'No', 'Yes', 'StarterKit for Lifecycle MVS: 375', 'BigFix', 'Renewal', 'Axis Asset Management Company Limited', 0, 'Mon Sep 30 2024', 'No'),
(64, 'Yes', 'No', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 'DCB Bank Limited ', 0, 'Mon Sep 30 2024', 'No'),
(65, 'Yes', 'No', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 'HDB Financial Services Limited', 0, 'Mon Sep 30 2024', 'No'),
(66, 'Yes', 'No', 'Compliance perpetual MVS: 800\n', 'BigFix', 'Renewal', 'Axis Bank Limited', 0, 'Tue Oct 15 2024', 'Yes'),
(67, 'Yes', 'No', 'Compliance MVS: 700 ', 'BigFix', 'Renewal', 'Axis Bank Limited', 0, 'Mon Sep 30 2024', 'No'),
(68, 'Yes', 'No', 'Compliance Term: 500', 'BigFix', 'Renewal', 'DCB Bank Limited ', 0, 'Tue Oct 22 2024', 'No'),
(69, 'No', 'No', 'SolarWinds AMC: 1', 'SolarWinds', 'Renewal', 'Bharat Forge Limited ', 0, 'Sat Oct 26 2024', 'No'),
(70, 'Yes', 'No', 'Patch term MVS: 1000', 'BigFix', 'Renewal', 'Angel One Limited ', 0, 'Mon Sep 30 2024', 'No'),
(71, 'Yes', 'No', 'Annual Support for SolarWinds', 'Services', 'Renewal', 'Pidilite Industries Ltd', 0, 'Tue Oct 29 2024', 'No'),
(72, 'Yes', 'No', 'NPM, NTA, NCM, Kiwi Syslog', 'SolarWinds', 'Renewal', 'Pidilite Industries Ltd', 0, 'Tue Oct 29 2024', 'No'),
(73, 'Yes', 'No', 'Kiwi Syslog', 'SolarWinds', 'Renewal', 'Bandhan AMC Limited', 0, 'Thu Oct 31 2024', 'Yes'),
(74, 'No', 'No', 'Annual support for BigFix', 'Services', 'Renewal', 'LTIMindtree Limited', 0, 'Thu Oct 31 2024', 'No'),
(75, 'No', 'No', 'Patch term MVS: 150\nPatch MVS: 500', 'BigFix', 'Renewal', 'SBM Bank (India) Limited', 0, 'Fri Nov 1 2024', 'No'),
(76, 'No', 'No', 'StarterKit Lifecycle CD: 500', 'BigFix', 'Renewal', 'Angel One Limited ', 1, 'Sat Nov 9 2024', 'No'),
(77, 'Yes', 'No', 'NPM SL250', 'SolarWinds', 'Renewal', 'Adani Gangavaram Port Private Limited', 9, 'Sun Nov 17 2024', 'No'),
(78, 'No', 'No', 'Patch Perpetual CD : 31', 'BigFix', 'Renewal', 'KTMS Design and Engineering Private Limited', 14, 'Fri Nov 22 2024', 'Yes'),
(79, 'No', 'No', 'Patch Perpetual CD : 3', 'BigFix', 'Renewal', 'BF Investment Limited', 14, 'Fri Nov 22 2024', 'Yes'),
(80, 'No', 'No', 'Patch CD: 555', 'BigFix', 'Renewal', 'Bharat Forge Limited ', 14, 'Fri Nov 22 2024', 'Yes'),
(81, 'No', 'No', 'Patch Perpetual CD : 12', 'BigFix', 'Renewal', 'Khed Economic Infrastructure Private Limited', 14, 'Fri Nov 22 2024', 'Yes'),
(82, 'No', 'No', 'Patch Perpetual CD : 6', 'BigFix', 'Renewal', 'BF Utilities Limited', 14, 'Fri Nov 22 2024', 'Yes'),
(83, 'Yes', 'No', 'Patch CD: 1', 'BigFix', 'Renewal', 'Kalyani Technoforge Limited ', 14, 'Fri Nov 22 2024', 'Yes'),
(84, 'No', 'No', 'Patch Perpetual :13', 'BigFix', 'Renewal', 'Damika Insurance Broking Company Pvt Ltd', 14, 'Fri Nov 22 2024', 'Yes'),
(85, 'No', 'No', 'Patch MVS: 310\nPatch CD: 1900', 'BigFix', 'Renewal', 'Bharat Forge Limited ', 14, 'Fri Nov 22 2024', 'Yes'),
(86, 'No', 'No', 'Annual support for BigFix', 'Services', 'Renewal', 'K Raheja Corp Real Estate Pvt Ltd', 22, 'Sat Nov 30 2024', 'No'),
(87, 'No', 'No', 'Patch MVS: 1000', 'BigFix', 'Renewal', 'LTIMindtree Limited', 22, 'Sat Nov 30 2024', 'No'),
(88, 'No', 'No', 'Kiwi Syslog Server', 'SolarWinds', 'Renewal', 'ICICI Prudential Life Insurance Company Limited', 22, 'Sat Nov 30 2024', 'No'),
(89, 'No', 'No', 'Patch MVS: 500\nPatch CD: 9000', 'BigFix', 'Renewal', 'Motilal Oswal Securities Limited', 22, 'Sat Nov 30 2024', 'No'),
(90, 'No', 'No', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 'HDFC Securities Limited', 41, 'Thu Dec 19 2024', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `alertlog`
--

CREATE TABLE `alertlog` (
  `id` int(11) NOT NULL,
  `EventLog` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alertlog`
--

INSERT INTO `alertlog` (`id`, `EventLog`, `created_at`) VALUES
(2, 'Axis Bank Limited PO was won', '2024-09-25 06:41:20'),
(3, 'HDB Financial Services Limited PO was won', '2024-09-26 09:32:34'),
(4, 'Axis Bank Limited PO was won', '2024-09-30 09:09:38'),
(5, 'IDBI Bank Limited PO was won', '2024-10-01 10:47:22'),
(6, 'Angel One Limited  PO was won', '2024-10-07 09:30:17'),
(7, 'Karnataka Bank Limited PO was won', '2024-10-07 10:54:05'),
(8, 'Shoppers Stop Limited PO was won', '2024-10-09 07:03:40'),
(9, 'Pidilite Industries Ltd PO was won', '2024-10-18 06:14:22'),
(10, 'Pidilite Industries Ltd PO was won', '2024-10-18 06:14:24'),
(11, 'Bandhan AMC Limited PO was won', '2024-10-24 09:38:55'),
(12, 'Adani Gangavaram Port Private Limited PO was won', '2024-11-05 10:07:22'),
(13, 'Mahindra & Mahindra Financial Services Limited PO was won', '2024-11-05 10:57:44'),
(14, 'Mahindra & Mahindra Financial Services Limited PO was won', '2024-11-05 10:57:47'),
(15, 'Kalyani Technoforge Limited  PO was won', '2024-11-07 06:53:01'),
(16, 'DCB Bank Limited  PO was won', '2024-11-07 06:54:30');

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
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `customer_entity`, `name`, `designation`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(25, 'SBI DFHI Limited', 'Chinmay Chavan ', '', '8976294142', 'cchavan@sbidfhi.com', '2024-06-06 08:01:32', NULL),
(26, 'SBI DFHI Limited', 'Robin Kaleramana', 'CTO', '9413399566', 'headsystems@sbidfhi.com', '2024-06-06 08:01:32', NULL),
(27, 'BSE Limited', 'Anuj Bhuva', '', '9920486662', 'anuj.bhuva@bseindia.com', '2024-06-10 12:12:16', NULL),
(28, 'BSE Limited', 'Vishwas Maladkar', '', '', 'vishwas.maladkar@bseindia.com', '2024-06-10 12:12:16', NULL),
(29, 'Bharat Forge Limited', 'Shrinivas Kulkarni', '', '9011054181', 'Shrinivas.Kulkarni@kalyani.in', '2024-06-10 12:21:02', NULL),
(30, 'Bharat Forge Limited', 'Kedar Hirole', '', '9822758130', 'kedar.hirole@kalyani.in', '2024-06-10 12:21:02', NULL),
(31, 'Damika Insurance Broking Company Pvt Ltd', 'Shrinivas Kulkarni', '', '9011054181', 'shrinivas.kulkarni@kalyani.in', '2024-06-10 12:23:08', NULL),
(32, 'KTMS Design and Engineering Private Limited', 'Shrinivas Kulkarni', '', '9011054181', 'shrinivas.kulkarni@kalyani.in', '2024-06-10 12:24:28', NULL),
(33, 'Tata Communications Limited', 'Novaroon Ojah', '', '7896870771', 'novaroon.ojah@tatacommunications.com', '2024-06-10 12:46:28', NULL),
(34, 'Cowtown Software Design Pvt. Ltd', 'Sujeet Prajapati', '', '9867318680', 'Sujeet.Prajapati@lodhagroup.com', '2024-06-11 04:58:08', NULL),
(35, 'ICICI Prudential Asset Management Company Limited', 'Umesh Harade', '', '7039318101', 'umesh_harade@icicipruamc.com', '2024-06-14 09:11:48', NULL),
(36, 'BSE Limited', 'Vijjukumar Pillai', '', '9833392210', 'vijjukumar.pillar@bse.com', '2024-06-14 09:13:12', NULL),
(37, 'Mylan Inc', 'Amit Rajan', '', '8860227007', 'amit.rajan@vaitris.com', '2024-06-14 09:13:56', NULL),
(38, 'Adani Petronet (Dahej) Port Ltd', 'Hemant Patel', '', '7064460417', 'hemant.patel@adani.com', '2024-06-14 09:15:07', NULL),
(39, 'Mahindra & Mahindra Financial Services Limited', 'Nikunj Panchal', '', '9820924327', 'panchal.nikunj@mahindra.com', '2024-06-14 09:16:08', NULL),
(40, 'Reliance Nippon Life Insurance Company Limited', 'Stanley  Fernandes', '', '9820860853', 'stanley.fernandes@relianceada.com', '2024-06-14 09:18:01', NULL),
(41, 'Yes Securities (India) Limited', 'Navin Keswani', '', '9920451842', 'navin.keswani@ysil.in', '2024-06-14 09:18:59', NULL),
(42, 'DCB Bank Limited', 'Sanjay Shintre', '', '9833278229', 'sanjays@dcbbank.com', '2024-06-14 09:20:08', NULL),
(43, 'Pluxee India Private Limited', 'Nikunj Vagela', '', '', 'nikunj.vagela@pluxeegroup.com', '2024-06-14 09:26:34', NULL),
(44, 'Excelsoft Technologies Pvt Ltd', 'Sudheesh Shudhakarn', '', '9839722190', 'sudheesh.s@excelsoftcorp.com', '2024-06-14 09:31:33', NULL),
(45, 'NMDC Data Centre Private Limited', 'Amit Harne  ', '', '7977249914', 'aharne@yotta.com', '2024-06-14 09:38:50', NULL),
(46, 'HDB Financial Services Limited', 'Paresh Raorane', '', '9167238380', 'paresh.raorane@hdbfs.com', '2024-06-14 09:40:10', NULL),
(47, 'Quantum Advisors Private Limited', 'Siddhesh', '', '9664546271', 'siddhesht@quantumamc.com', '2024-06-14 09:41:23', NULL),
(48, 'HDFC Securities Limited', 'Girish Oberio', '', '9322346964', 'girish.oberio@hdfcsec.com', '2024-06-14 09:42:55', NULL),
(49, 'IDBI Bank Limited', 'Riyaj Inamdar', '', '8237865030', 'riyaj.inamdar@idbi.co.in', '2024-06-14 09:45:38', NULL),
(50, 'National Commodity & Derivatives Exchange Limited', 'Malay Sen', '', '9819069766', 'malay.sen@ncdex.com', '2024-06-14 09:51:13', NULL),
(51, ' Indian Financial Technology & Allied Services', 'Vishal Pujara', '', '9819879555', 'vishal.pujara@iftas.in', '2024-06-14 09:56:26', NULL),
(52, 'Adani Hazira Port Ltd', 'Bhagirath Gohil', '', '9099903533', 'Bhagirathsinh.Gohil@adani.com', '2024-06-14 10:01:06', NULL),
(53, 'Motilal Oswal Securities Limited', 'Sehul Shah', '', '9324292105', 'sshah@motilaloswal.com', '2024-06-14 10:02:30', NULL),
(54, 'Kotak Securities Ltd', 'Vinod Kochu', '', '9892661943', 'vinod.kochu@kotak.com', '2024-06-14 10:05:32', NULL),
(55, 'K Raheja Corporate Services Private Limited', 'Swapnil Chawan', '', '9870377327', 'schawan@kraheja.com', '2024-06-14 10:09:14', NULL),
(56, 'LTIMindtree Limited', 'Nirmal Kumar', '', '7550015531', 'nirmal.kumar3@ltimindtree.com', '2024-06-14 10:13:24', NULL),
(57, 'PTC Software (India) Pvt. Ltd', 'Ramesh Fatnani', '', '7798079909', 'rfatnani@ptc.com', '2024-06-14 10:15:53', NULL),
(58, 'Axis Securities Limited', 'Vipul Kesariya', '', '9022976814', 'vipul.kesariya@axissecurities.in', '2024-06-14 10:18:15', NULL),
(59, 'WNS Global Services Private Ltd', 'Nayan Desai', '', '9820057526', 'nayan.desai@wns.com', '2024-06-14 10:19:59', NULL),
(60, 'Birlasoft Limited', 'Kunal Kaushik', '', '9999312955', 'kunal.kaushik@birlasoft.com', '2024-06-14 10:21:14', NULL),
(61, 'Mahindra & Mahindra Ltd', 'Atul Bhogte', '', '9920244568', 'bhogte.atul@mahindra.com', '2024-06-14 10:22:13', NULL),
(62, 'T-Systems Information & Communications Technology India Private Limited', 'Bharat Pise', '', '9881050074', 'bharat.pise@t-systems.com', '2024-06-14 10:23:49', NULL),
(63, 'Sharekhan Limited', 'Niraj Randeria', '', '9930992422', 'niraj.randeria@sharekhan.com', '2024-06-14 10:25:22', NULL),
(64, 'Tata Motors Finance Ltd', 'Sandeep Samant', '', '9029916050', 'sandeep.samant@tmf.co.in', '2024-06-14 10:53:07', NULL),
(65, 'Concentrix Daksh Services India Private Limited', 'Pankaj Potdar', '', '9702202345', 'pankaj.potdar@concentrix.com', '2024-06-14 10:55:04', NULL),
(66, 'Cowtown Software Design Pvt. Ltd', 'UnniKrishnan KV', '', '9821220719', 'unnikrishnan.kv@lodha.com', '2024-06-14 11:03:08', NULL),
(67, 'Medanta', 'Dinesh Kumar', '', '9811134325', 'dinesh.kumar2@medanta.org', '2024-06-14 11:04:31', NULL),
(68, 'Anand Rathi Finance', 'Priyank Sheth', '', '9833002173', 'priyanksheth@rathi.com', '2024-06-14 11:06:25', NULL),
(69, 'Axis Bank Limited', 'Rajani Kumar', '', '9892085680', 'nev.rajanikumar@axisbank.com', '2024-06-14 11:07:16', NULL),
(70, 'Avacend Solutions Private Limited', 'Dominic Fernandes', '', '', 'dominic.f@avacendsolutions.com', '2024-06-14 11:11:12', NULL),
(71, 'BSE Limited', 'Diwakar Raut', 'CISO', '9082819116', 'diwakar.raut@bseindia.com', '2024-06-17 08:53:20', NULL),
(72, 'National Stock Exchange of India Limited', 'Sampath Manickam', 'CTO', '', 'smanickam@nse.co.in', '2024-06-17 09:08:38', NULL),
(73, 'RBL Bank Limited', 'Ravi Pichan', 'CIO', '9823082281', '\'ravi.pichan@rblbank.com\'', '2024-06-21 08:39:58', NULL),
(74, 'RBL Bank Limited', '', '', '', '', '2024-06-21 08:39:58', NULL),
(75, 'Worldline India Private Limited', 'Sunil Maurya', '', '9920092207', 'sunil.maurya@worldline.com', '2024-06-28 10:28:35', NULL),
(76, 'Adani Energy Solutions Limited', 'Naman Vyas', '', '9687660904', 'naman.vyas@adani.com', '2024-06-28 12:16:14', NULL),
(77, 'Adani Energy Solutions Limited', 'Sumeet Sharma', 'CIO', '9099005648', 'sumeet.sharma@adani.com', '2024-06-28 12:16:14', NULL),
(78, 'IDFC Bank Limited', 'Veeresh Shetty', '', '9619411752', 'veeresh.shetty@idfcfirstbank.com', '2024-07-04 12:19:41', NULL),
(79, 'IDFC Bank Limited', 'umesh kadam', '', '9324146518', 'umesh.kadam@idfcfirstbank.com', '2024-07-04 12:19:41', NULL),
(80, 'JSW Steel Limited', 'Jayant Jain', '', '8097762387', 'jayant.jain@jsw.in', '2024-07-05 06:26:07', NULL),
(81, 'Au Small Finance Bank Limited', 'Naman Ghai', '', '8306700965', 'naman.ghai@aubank.in', '2024-07-05 06:29:04', NULL),
(82, 'Adani Gangavaram Port Private Limited', 'Akshaya Kumar Das', '', '7752019116', 'akshayakumar.das@adani.com', '2024-07-05 06:39:02', NULL),
(83, 'Aarti Industries Limited', 'Jatin Prajapati', '', '', '', '2024-07-05 07:48:51', NULL),
(84, 'Aarti Industries Limited', 'Pranav Raval', '', '7573016710', 'pranav.raval@aarti-industries.com', '2024-07-05 07:49:32', NULL),
(85, 'Aarti Industries Limited', '', '', '', '', '2024-07-05 07:49:32', NULL),
(86, 'Godrej Industries Limited', 'MadhuKumar', '', '', 'madhukumar@tatarealty.in', '2024-07-23 10:39:00', NULL),
(87, 'Godrej Industries Limited', 'Yogesh Manjrekar', '', '9029148363', 'itoperation@tatarealty.in', '2024-07-23 10:40:06', NULL),
(88, 'Bandhan AMC Limited', 'Vijay Raut', '', '912243422777', 'vijay.raut@bandhanamc.com', '2024-07-23 10:42:45', NULL),
(89, 'Mylan Pharmaceuticals Private Limited', 'Manohar Kanaparthi', '', '7799222077', 'Manohar.Kanaparthi@viatris.com', '2024-07-23 10:45:20', NULL),
(90, 'Larsen & Toubro Limited', 'Savita Pawar', '', '9920849389', 'savita.pawar@larsentoubro.com', '2024-09-17 09:16:31', '2024-09-17 09:16:31');

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
(1, 'BSE Limited', ' anant.potdar@bseindia.com ', '22nd Floor, PJ Towers,	Dalal Street', 'Mumbai', 'Maharashtra', 'www.bseindia.com'),
(2, 'ICICI Prudential Asset Management Company Limited ', 'umesh_harade@icicipruamc.com', '2nd Floor, 302, Block B-2, Nirlon Knowledge Park Western Express Highway, Goregaon-East', 'Mumbai', 'Maharashtra', 'www.icicipruamc.com'),
(3, 'Mylan Inc ', 'amit.rajan@vaitris.com', '1000 - Mylan Inc. Southpointe,1000 Mylan Boulevard,', 'Canonsburg', 'Pennsylvania', 'www.mylan.in'),
(4, 'Adani Petronet (Dahej) Port Ltd ', 'hemant.patel@adani.com', 'Plot No - 604, Beside GCPTCL, Near Lakha Bava Temple, Lakhi Gam, Dahej', 'Bharuch', 'Gujarat	', ''),
(5, 'Mahindra & Mahindra Financial Services Limited', 'panchal.nikunj@mahindra.com', 'Head Office, 2nd Flr, Sadhana House Behind Mahindra Towers 570 P B Marg, Worli', 'Mumbai', 'Maharashtra', 'www.mahindrafinance.com'),
(6, 'Bharat Forge Limited ', ' yzope@bharatforge.com ', 'Mundhwa-Pune Contonment', 'Pune', 'Maharashtra', 'www.bharatforge.com'),
(7, 'Reliance Nippon Life Insurance Company Limited', 'stanley.fernandes@relianceada.com', 'Unit Nos. 401B, 402, 403 & 404, 4th Floor Inspire-BKC, G Block, BKC Main Road, Bandra Kurla Complex, Bandra (E)', 'Mumbai', 'Maharashtra', 'www.reliancenipponlife.com'),
(8, 'Yes Securities (India) Limited', 'navin.keswani@ysil.in', '4th Floor, AFL House, Marol Maroshi Road Marol, Andheri East,', 'Mumbai', 'Maharashtra', 'yesinvest.in'),
(9, 'DCB Bank Limited ', 'sanjays@dcbbank.com', '9th Floor, Tower A, Peninsula Business Park, Senapati Bapat Marg, Lower Parel.', 'Mumbai', 'Maharashtra', 'www.dcbbank.com'),
(10, 'Pluxee India Private Limited', 'nikunj.vagela@pluxeegroup.com', '503 & 504, 5th Floor, B Wing, Hiranandani Fulcrum, Sahar Road, Andheri (E),', 'Mumbai', 'Maharashtra', 'www.sodexo.in'),
(11, 'Excelsoft Technologies Pvt Ltd', 'sudheesh.s@excelsoftcorp.com', '1B, Hootagalli Industrial Area', 'Mysore', 'Karnataka', 'www.excelsoftcorp.com'),
(12, 'NMDC Data Centre Private Limited ', 'aharne@yotta.com', '3rd to 12th Floor, Edinburgh Building, M/S Persipina Developers Private Limited,IT/ITES SEZ, Bhokarpada Village,', 'Panvel	', 'Maharashtra', 'www.nmdc.co.in'),
(13, 'HDB Financial Services Limited', 'paresh.raorane@hdbfs.com', 'Zenith house Ground floor Keshvrao Khadye Marg Opp Race Course Mahalaxmi', 'Mumbai', 'Maharashtra', 'www.hdbfs.com'),
(14, 'Quantum Advisors Private Limited', 'siddhesht@quantumamc.com', '503, 6th Floor,Hoechst House, Nariman Point', 'Mumbai', 'Maharashtra', 'www.qasl.com'),
(15, 'HDFC Securities Limited', 'girish.oberio@hdfcsec.com', 'DC-6, 1st Floor, Lighthall \'D\' Wing,Hiranandani Business park, Saki Vihar Road, Chandivli	', 'Mumbai', 'Maharashtra', 'www.hdfcsec.com'),
(16, 'IDBI Bank Limited', 'riyaj.inamdar@idbi.co.in', 'IT Center, Plot 39-41, Sector 11 CBD Belapur', 'Navi Mumbai', 'Maharashtra', 'www.idbibank.in'),
(17, 'National Commodity & Derivatives Exchange Limited', 'malay.sen@ncdex.com', 'Ackruti Corporate Park, LBS Marg,	Kanjurmarg( West)', 'Mumbai', 'Maharashtra', 'ncdex.com'),
(18, ' Indian Financial Technology & Allied Services', 'vishal.pujara@iftas.in', 'Unit No.4, 3rd Floor, Times Square-Phase-D, IT Park, Tower D Andheri-Kurla Road, Andheri East', 'Mumbai', 'Maharashtra', 'iftas.in'),
(19, 'Adani Hazira Port Ltd', 'Bhagirathsinh.Gohil@adani.com', 'Near LNG Terminal, AT & PO Hazira, Choryashi', 'Surat	', 'Gujarat', 'www.adaniports.com'),
(21, 'Kotak Securities Ltd', 'vinod.kochu@kotak.com', 'Kotak Infiniti-IT Park Goregaon West', 'Mumbai', 'Maharashtra', 'www.kotaksecurities.com'),
(22, 'K Raheja Corporate Services Private Limited', 'schawan@kraheja.com', 'Plot No C-30, G Block , Opp. SIDBI Bandra Kurla Complex, Bandra E', 'Mumbai', 'Maharashtra', 'www.krahejacorp.com'),
(23, 'LTIMindtree Limited', 'nirmal.kumar3@ltimindtree.com', 'Ground floor to 4th Floor and 6th Floor Gate No 5, Technology Tower - 1 saki Vihar Road Powai', 'Mumbai', 'Maharashtra', 'www.ltimindtree.com'),
(24, 'PTC Software (India) Pvt. Ltd', 'rfatnani@ptc.com', '2nd & 3rd floor \'D\' building and 2nd & 5th floor B building	Weikfield IT CITI Info Park, Nagar Road,', 'Pune', 'Maharashtra', 'www.ptc.com'),
(25, 'Axis Securities Limited', 'vipul.kesariya@axissecurities.in', 'Unit 002 A, Building - A, Agastya Corporate Park, Piramal Realty, Kamani Junction, Kurla West', 'Mumbai', 'Maharashtra', 'simplehai.axisdirect.in'),
(34, 'WNS Global Services Private Ltd', 'nayan.desai@wns.com', 'Plant 10, 11 & 5, Gate no 4 &2, Godrej & Boyce Complex, LBS Marg, Vikhroli (West),', 'Mumbai', 'Maharashtra', 'www.wns.com'),
(35, 'Birlasoft Limited', 'kunal.kaushik@birlasoft.com', 'Plot no. 35 & 36 , SDBI, MIDC Phase - 2 Main Road, Hinjewadi', 'Pune', 'Maharashtra', 'www.birlasoft.com'),
(36, 'Mahindra & Mahindra Ltd', 'bhogte.atul@mahindra.com', 'Mahindra IT Centre, Plot No. 168/B, 4th Floor,Opp. Mahindra Yellow Gate, Akurli Road, Kandivali - East	', 'Mumbai', 'Maharashtra', 'www.mahindra.com'),
(37, 'T-Systems Information & Communications Technology India Private Limited', 'bharat.pise@t-systems.com', 'T-Systems ICT India Pvt Ltd 20 Tower A, Panchshil Business Park, Balewadi High Street', 'Pune', 'Maharashtra', 'www.t-systems.com'),
(38, 'Sharekhan Limited', 'niraj.randeria@sharekhan.com', 'Gigaplex Building No.09, 10th Floor, Raheja Mindspace 2, Airoli Knowledge Park Airoli', 'Navi Mumbai', 'Maharashtra', 'diy.sharekhan.com'),
(39, 'JSW Steel Limited', 'jayant.jain@jsw.in', 'JSW Centre, BKC Bandra East', 'Mumbai', 'Maharashtra', 'www.jsw.in'),
(40, 'SVC Co-operative Bank Limited', '', '6th Floor, Dosti Pinnacle, Plot No E-7, Road No 22, Wagle Industrial Estate Thane', 'Mumbai', 'Maharashtra', 'www.svcbank.com'),
(41, 'Yes Bank Limited', '', 'Guru Narayan Rd 2 and 3 Off Western Exp Highway Prabhat Col Santacruz East', 'Mumbai', 'Maharashtra', 'www.yesbank.in'),
(42, 'Tata Motors Finance Ltd', 'sandeep.samant@tmf.co.in', 'Lodha-I Think, A Wing, Second Floor, Pokhran Road No.2 Thane', 'Mumbai', 'Maharashtra', 'www.tmf.co.in'),
(43, 'RBL Bank Limited', '', 'RBL Bank Ltd, 179 E, MAHAVEER, Shri Shahu Market Yard,', 'Kolhapur', 'Maharashtra', 'www.rblbank.com'),
(44, 'Shoppers Stop Limited', '', 'Umang, 2nd Floor, New Link Road Next/Behind to Inorbit Mall, Mindspace, Malad-West', 'Mumbai', 'Maharashtra', 'www.shoppersstop.com'),
(45, 'Eureka Forbes Limited', '', '701, 7th Floor, B1/B2, Marathon Innova, Off Ganpatrao Kadam Marg, Lower Parel,', 'Mumbai', 'Maharashtra', 'aquaguardselect.com'),
(46, 'Awfis Space Solutions Pvt Ltd', '', 'C 28 and 29 Qutab Institutional Area', 'New Delhi', 'Delhi', 'www.awfis.com'),
(47, 'SBI-SG Global Securities Services Pvt Ltd', '', 'Jeevan Seva Building Annexe, Ground Floor, S.V. Road, Santacruz', 'Mumbai', 'Maharashtra', 'www.sbisgcsl.co.in'),
(48, 'BNP Paribas India Solutions Pvt Ltd', '', 'Infinity Building No.4, B-Wing, 6th floor, Off Film City Road, Malad East,', 'Mumbai', 'Maharashtra', 'www.bnpparibas.co.in'),
(49, 'Concentrix Daksh Services India Private Limited', 'pankaj.potdar@concentrix.com', '5th Floor Tower B&C 6th Floor of Tower C&D and 17th Floor Tower C&D DLF IT SEZ Bldg no. 14 DLF Cyber City Sec 24 & 25A Ph 3	', 'Gurgaon', 'Haryana', 'www.concentrix.com'),
(50, 'Angel One Limited ', '', '6th Floor, Ackruti Star Road no.7, MIDC Marol Andheri(East)', 'Mumbai', 'Maharashtra', 'www.angelone.in'),
(51, 'Axis Asset Management Company Limited', '', '1st Floor, Axis House, Wadia International Centre, Pandurang Budhkar Marg, Worli', 'Mumbai', 'Maharashtra', 'www.axisamc.com'),
(52, 'Pidilite Industries Ltd', '', 'Kondivita Plant Kondivita Unit Ram Krishna Mandir Rd.off M.V. Road', 'Mumbai', 'Maharashtra', 'pidilite.com'),
(53, 'Adani Gangavaram Port Private Limited', 'akshayakumar.das@adani.com', 'Pedagantyada Mandal Gangavaram Post', 'Visakhapatnam', 'Andhra Pradesh', 'www.adaniports.com'),
(54, 'Pine Labs Pvt Ltd', '', 'Candor Techspace, 4th & 5th Floor, Tower # 6, Plot No. B2, Sector - 62', 'Noida', 'Uttar Pradesh', 'www.pinelabs.com'),
(55, 'Adani Ports and Special Economic Zone Limited', '', 'Post Bag No: 1 Village Dhrub Tal Mundra', 'Kutch Mundra', 'Gujarat', 'www.adaniports.com'),
(56, 'Au Small Finance Bank Limited', 'naman.ghai@aubank.in', 'AU Centre, 3rd, 5th, 6th & 7th Floor, Sunny Trade Centre New Atish Market', 'Jaipur', 'Rajasthan', 'www.aubank.in'),
(57, 'L&T Finance Limited', '', '1518/1519, 15th Floor,Rupa Solitaire, Millennium Business Park Mahape', 'Navi Mumbai', 'Maharashtra', 'www.ltfs.com'),
(58, 'Toshiba Software India Pvt Ltd', '', '#3A, \"Essae Vaishnavi Solitaire\", 3rd Block, Koramangala', 'Bangalore', 'Karnataka', 'www.toshiba-tsip.com'),
(59, 'Mylan Pharmaceuticals Private Limited', 'Manohar.Kanaparthi@viatris.com', 'Corporate Office Kadubeesanahalli Village, Varthur Hobli, Outer Ring Road, 10th Floor, Prestige Platina, Block 3', 'Bangalore', 'Karnataka', 'www.mylan.in'),
(60, 'TJSB Sahakari Bank Ltd', '', '16, Madhukar Bhavan, Wagle Estate, Thane West', 'Mumbai', 'Maharashtra', 'www.tjsbbank.co.in'),
(61, '24/7 Customer Private Limited - Platina', '', 'Prestige TechPark Platina-2, Outer Ring Road, Kadubeesanahalli Village,	Varthur Hobli, Bangalore EastTaluk ,Varthur SO,	', 'Bangalore', 'Karnataka', 'www.247.ai'),
(62, 'Inniti Network Solutions LLP', '', '10th Floor, 1002, Oriana Business Park Road No 22, Wagle Estate,', 'Mumbai', 'Maharashtra', 'inniti.in'),
(63, 'K Raheja Corp Real Estate Pvt Ltd', '', 'Plot No C-30, G Block, Opp. SIDBI, Bandra Kurla Complex, Bandra (E),', 'Mumbai', 'Maharashtra', 'www.krahejacorp.com'),
(64, 'Damika Insurance Broking Company Pvt Ltd', '', 'Industry House, Opp Kalyani Carpenter Special Steels Limited Mundhwa                   ', 'Pune', 'Maharashtra', ''),
(65, 'Bandhan AMC Limited', 'vijay.raut@bandhanamc.com', 'One World Centre, Tower 1 C 6th Floor,	Jupiter Mills compound, 841 Senapati Bapat Marg, Prabhadevi,', 'Mumbai', 'Maharashtra', 'bandhanamc.com'),
(67, 'Aegis Customer Support Services Private Limited', '', 'Renaissance Spacio, 4, International Tech Park, Muncipal no. 41 Old no. 10, St. Johns Road,', 'Bengaluru', 'Karnataka', 'www.startek.com'),
(68, 'Godrej Industries Limited', 'madhukumar@tatarealty.in', 'Pirojshanagar. E.E. Highway Vikhroli East', 'Mumbai', 'Maharashtra', 'godrejindustries.com'),
(69, 'Cowtown Software Design Pvt. Ltd', 'Sujeet.Prajapati@lodhagroup.com', '412,Floor-4, 17G Vardhaman chamber, Cawasji patel rd, Horniman Circle, Fort', 'Mumbai', 'Maharashtra', 'www.lodhagroup.in'),
(70, 'Tata Communications Limited', 'novaroon.ojah@tatacommunications.com', 'Videsh Sanchar Bhavan, MG Road, Opp Cross Maidan, Fort', 'Mumbai', 'Maharashtra', 'www.tatacommunications.com'),
(71, 'Sanghvi Beauty and Technologies Private Limited', 'nagesh.upadhyay@myglamm.com ', 'Unit GB 61 68 & 86 92, Phoenix Paragon Plaza Kurla West', 'Mumbai', 'Maharashtra', 'www.myglamm.com'),
(72, 'Savex Technologies Pvt. Ltd.', ' prashant.kumar@savex.in ', '11th Floor, Maker Chambers - III, Nariman Point', 'Mumbai', 'Maharashtra', 'savex.in'),
(73, 'Khed Economic Infrastructure Private Limited', 'shrinivas.kulkarni@kalyani.in ', 'Level 4, Amar Avinash Corporate Plaza, Survey No 11, 11/1 to 11/4, Plot No-D/2 Bund Garden Road	', 'Pune', 'Maharashtra', 'khedcity.com'),
(74, 'Aavas Financiers Limited ', ' pratyush.sharma@aavas.in ', '201-202, 2nd Floor Southend Square', 'Jaipur	', 'Rajasthan', 'www.aavas.in'),
(75, 'Espresso Financial Services Private Limited ', ' chirag.kansal@sharekhan.com ', 'Gigaplex Building No.09, 10th Floor, Raheja Mindspace 2, Airoli Knowledge Park', 'Navi Mumbai', 'Maharashtra', 'www.myespresso.com'),
(76, 'CG Power and Industrial Solutions Limited', 'ashish.patel@cgglobal.com ', 'CG House, 1st Floor, Dr. Annie Besant Road Worli', 'Mumbai', 'Maharashtra', 'www.cgglobal.com'),
(77, ' ICICI Bank Limited', ' aslam.kazi@icicibank.com ', 'T- BKC Tower Mumbai ICICI Towers, Bandra Kurla Complex Bandra East', 'Mumbai', 'Maharashtra', 'www.icicibank.com'),
(78, 'SBI General Insurance Company Limited', 'govind.nagulkar@sbigeneral.in ', '9th Floor, A & B Wing, Fulcrum Building, Sahar Road, Andheri East', 'Mumbai', 'Maharashtra', 'www.sbigeneral.in'),
(79, 'ICICI Prudential Life Insurance Company Limited', ' sudhir.mane@iciciprulife.com ', 'Unit No. 1A& 2A, Raheja Tipco Plaza Rani Sati Marg Malad East', 'Mumbai', 'Maharashtra', 'www.iciciprulife.com'),
(80, 'Kalyani Technoforge Limited ', 'mahesh.wagh@kalyani.in ', 'S N 72-76,Behind Siporex Mundhwa', 'Pune', 'Maharashtra', 'www.kalyanitechnoforge.com'),
(81, 'Avacend Solutions Private Limited', 'dominic.f@avacendsolutions.com ', '	C Wing 109/10, Mahavir Trinkets, Off LBS Road, Behind Huma Cinema Kanjurmarg West', 'Mumbai', 'Maharashtra', 'avacendsolutions.com'),
(82, 'The Saraswat Co. Operative Bank Ltd', 'mahesh.sawant@saraswatbank.com ', 'Madhushree, 3rd FJoor, District Business Centre, Sector 17 Vashi', 'Mumbai', 'Maharashtra', 'saraswatbank.com'),
(83, 'Suryoday Small Finance Bank Limited', ' maruti.shingade@suryodaybank.com  ', '1101 Sharda Terraces Plot 65, Sector 11, Belapur', 'Mumbai', 'Maharashtra', ' www.suryodaybank.com'),
(84, 'Tata Realty and Infra Limited', ' madhukumar@tatarealty.in ', '10 Veer Nariman Road Fort', 'Mumbai', 'Maharashtra', 'tatarealty.in'),
(85, 'BF Utilities Limited', ' licensing@bharatforge.com ', 'Mundhwa', 'Pune', 'Maharashtra', 'www.bfutilities.com'),
(86, 'BF Investment Limited', ' anand.patil@kalyanitechnologies.com ', 'Mundhwa-Pune Contonment', 'Pune', 'Maharashtra', 'bfilpune.com'),
(87, 'KTMS Design and Engineering Private Limited', 'shrinivas.kulkarni@kalyani.in ', 'Industry House, Opp Kalyani Steels Ltd Mundhwa', 'Pune', 'Maharashtra', 'www.ktmsdesign.com'),
(88, 'Karnataka Bank Limited', ' manjunatha.prabhu@ktkbank.com ', 'Technology & Digital Hub Artisane RPS Tech Centre No. 32, 1st Main Road 3rd Phase, J P Nagar', 'Bengaluru', 'Karnataka', 'karnatakabank.com'),
(89, 'SBM Bank (India) Limited', ' chinmay.mirjankar@sbmbank.co.in ', '1st Floor, Raheja Centre, Free Press Journal Marg Nariman Point', 'Mumbai', 'Maharashtra', 'www.sbmbank.co.in'),
(90, 'Axis Bank Limited', ' prateek11.kumar@axisbank.com ', 'NPC- 1, Gigaplex IT Park, Plot No. IT-5 | Bldg. No-1, 1st Floor, MIDC, Airoli Knowledge Park),', 'Navi Mumbai', 'Maharashtra', 'www.axisbank.com'),
(91, 'Medanta', ' dinesh.kumar2@medanta.org ', 'CH Baktawar Singh Road Sector 38', 'Mumbai', 'Maharashtra', 'www.medanta.org'),
(92, 'Anand Rathi Finance', ' priyanksheth@rathi.com ', '11th Floor, Times Tower, Kamala City, Senapati Bapat Marg Lower Parel', 'Mumbai', 'Maharashtra', 'anandrathi.com'),
(93, 'SBI DFHI Limited', 'cchavan@sbidfhi.com ', '5th Floor, Mistry Bhavan, 122 Dinshaw Vaccha Road, Churchgate', 'Mumbai', 'Maharashtra', 'www.sbidfhi.co.in'),
(94, 'Havells India', '', 'QRG Towers, 2D, Sector-126, Expressway, Noida', 'Delhi', 'Delhi', 'havells.com'),
(95, 'National Stock Exchange of India Limited', 'vpatil@nse.co.in', 'NSE Complex, G-Block, BKC, Bandra East', 'Mumbai', 'Maharashtra', 'www.nse.co.in'),
(96, 'Tata Housing Development Company limited', 'madhukumar@tatarealty.in', '\"E\" Block, Voltas Compound, T.B.Kadam Marg, Chichpokli,', 'Mumbai', 'Maharashtra', 'www.tatahousing.com'),
(97, 'Worldline India Private Limited', 'sunil.maurya@worldline.com', 'Raiskaran Tech Park, Tower 1, Second Floor, Saki Naka, ', 'Mumbai', 'Maharashtra', ''),
(98, 'National Securities Depository Limited ', 'balasahebu@nsdl.com', 'Trade World, A Wing, 4th & 5th Floors, Kamala Mills Compound, Lower Parel', 'Mumbai- 400013', 'Maharashtra', ''),
(100, 'Adani Energy Solutions Limited', 'naman.vyas@adani.com', 'Adani House, Shantigram, SG Highway', 'Ahmedabad', 'Gujarat', ''),
(103, 'IDFC Bank Limited', 'umesh.kadam@idfcfirstbank.com', '7th Floor, Bldg No.1, Gigaplex, MIDC Knowledge Corridor, Airolo', 'Navi Mumbai 400708', 'Maharashtra', 'www.idfcfirstbank.com'),
(104, 'Aarti Industries Limited', 'jatin.prajapati@aarti-industries.com', ' 4th Floor, Tower C, Embassy 247 Park, Gandhi Nagar, Vikhroli West,', 'Mumbai', 'Maharashtra', ''),
(106, 'Shapoorji Pallonji Finance', '', 'SP Centre, Courtyard 10B, 41/44 Minoo Desai Marg, Colaba,', 'Mumbai', 'Maharashtra', 'https://www.shapoorjipallonjifinance.com/'),
(107, 'Larsen & Toubro Limited', 'savita.pawar@larsentoubro.com', 'AM Naik Towers, Powai', 'Mumbai', 'Maharashtra', 'www.larsentoubro.com'),
(108, 'Ageas Federal Life Insurance Company Limited', '', '23rd Floor, IT Department, Marathon Futurex, A Wing,N M Joshi Marg, Lower Parel (E),', 'Mumbai', 'Maharashtra', '');

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

CREATE TABLE `employes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`id`, `name`, `surname`, `designation`, `joining_date`, `last_date`, `status`, `DOB`, `team`, `personal_email`) VALUES
(1024, 'Ravi', 'Khanchandani', 'Director', '2008-06-19', NULL, 'Active', '1968-12-01', NULL, 'rkhancha@gmail.com'),
(1025, 'Sanjiv', 'Sachdev', 'Director', '2008-12-01', NULL, 'Active', NULL, NULL, NULL),
(1026, 'Sameer', 'Chaukar', 'Director', '2011-01-10', '2019-08-31', 'Inactive', NULL, NULL, NULL),
(1027, 'Suresh', 'Hanchate', 'Senior Engineer ', '2010-12-01', '2017-09-27', 'Inactive', NULL, NULL, NULL),
(1028, 'Niraj', 'Gurnani', 'Senior Engineer ', '2011-01-03', '2016-08-18', 'Inactive', NULL, NULL, NULL),
(1029, 'Swapnil', 'Rakhade', 'Trainee Engineer', '2011-09-20', '2012-07-17', 'Inactive', NULL, NULL, NULL),
(1030, 'Manisha', 'Ram', 'Compute Specialist', '2012-08-01', '2015-05-31', 'Inactive', NULL, NULL, NULL),
(1031, 'Neelesh', 'Kajale', 'Account Manager', '2012-09-03', '2014-12-01', 'Inactive', NULL, NULL, NULL),
(1032, 'Avinash', 'Ingle', 'Compute Specialist', '2012-11-23', '2015-12-11', 'Inactive', NULL, NULL, NULL),
(1033, 'Sagar', 'Deshpande', 'Program Manager', '2013-02-04', NULL, 'Active', '1980-04-18', 'BigFix', ''),
(1034, 'Reena', 'Kadam', 'Associate Engineer', '2013-02-04', '2014-10-10', 'Inactive', NULL, NULL, NULL),
(1035, 'Gangadhar', 'Kiwade', 'Engineer', '2014-02-17', '2021-06-30', 'Inactive', NULL, NULL, NULL),
(1036, 'Shridhar', 'Malagi', 'Account Manager', '2015-05-22', '2015-05-10', 'Inactive', NULL, NULL, NULL),
(1037, 'Viekas', 'Aurora', 'Account Manager', '2014-12-31', '2016-01-31', 'Inactive', NULL, NULL, NULL),
(1038, 'Gaurav', 'Malik', 'Account Manager', '2015-02-13', '2016-09-30', 'Inactive', NULL, NULL, NULL),
(1039, 'Venkateshan', 'Ramamoorthy', 'Compute Engineer', '2015-02-09', '2015-11-16', 'Inactive', NULL, NULL, NULL),
(1040, 'Manoj', 'Thathera', 'Associate Engineer', '2015-07-01', '2018-02-02', 'Inactive', NULL, NULL, NULL),
(1041, 'Chinmay', 'Chavan', 'Associate Engineer', '2015-07-02', '2017-07-30', 'Inactive', NULL, NULL, NULL),
(1042, 'Prashant', 'Kadam', 'Associate Engineer', '2015-07-02', '2017-12-22', 'Inactive', NULL, NULL, NULL),
(1043, 'Mohit', 'Rau', 'Associate Engineer ', '2015-12-08', '2018-05-30', 'Inactive', NULL, NULL, NULL),
(1044, 'Mahesh', 'Goshal', 'Senior Engineer ', '2016-05-25', '2017-03-03', 'Inactive', NULL, NULL, NULL),
(1045, 'Abdhija', 'Sharma', 'Associate Engineer ', '2016-08-22', NULL, 'Active', '1995-09-14', 'SolarWinds', ''),
(1046, 'Divya', 'Pawar', 'Associate Engineer ', '2016-08-22', '2019-08-27', 'Inactive', NULL, NULL, NULL),
(1047, 'Rucha', 'Vaidya', 'Associate Engineer ', '2016-08-25', '2019-12-20', 'Inactive', NULL, NULL, NULL),
(1048, 'Deepali', 'Soni', 'Account Manager', NULL, '2014-08-01', 'Inactive', NULL, NULL, ''),
(1049, 'Sagar', 'Bandi', 'Senior Engineer', '2017-09-11', NULL, 'Active', '1987-12-29', NULL, 'sagarbandi116@yahoo.in'),
(1050, 'Karthik', 'Kamath', 'Associate', '2017-11-01', NULL, 'Active', '1990-08-17', 'BigFix', NULL),
(1051, 'Sheetal', 'Jaitpal', 'Associate Engineer', '2018-01-04', '2021-02-11', 'Inactive', NULL, NULL, NULL),
(1052, 'Devendra', 'Bharambe', 'Associate Engineer', '2017-12-18', '2021-08-25', 'Inactive', NULL, NULL, NULL),
(1053, 'Chiren', 'Mehta', 'Account Manager', '2017-12-18', '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1054, 'Nikhil', 'Nair', 'Associate Engineer', '2018-02-20', '2021-02-20', 'Inactive', NULL, NULL, NULL),
(1055, 'Vivek', 'Gupta', 'Senior Engineer', '2018-04-02', '2021-03-09', 'Inactive', NULL, NULL, NULL),
(1056, 'Prashant', 'Kadechkar', 'Senior Engineer', '2018-05-23', NULL, 'Active', '1988-04-25', 'SolarWinds', NULL),
(1057, 'Arun', 'Vishwanathan', 'Account Manager', '2018-05-23', '2018-09-10', 'Inactive', NULL, NULL, NULL),
(1058, 'Chaitrali', 'Deodhar', 'Account Manager', '2018-08-27', '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1059, 'Vicky', 'Malekar', 'Associate Engineer', NULL, NULL, 'Active', '1991-08-19', 'SolarWinds', NULL),
(1060, 'Madhu', 'Israni', 'Sales Manager', NULL, NULL, 'Active', '1974-10-26', NULL, NULL),
(1061, 'Swanand', 'Labad', 'Associate Engineer', NULL, NULL, 'Active', '1991-02-12', 'BigFix', NULL),
(1062, 'Kushal', 'Sachdev', '', NULL, NULL, 'Active', '1998-07-15', NULL, ''),
(1063, 'Arjit', 'Yadav', 'Senior Engineer', '2019-06-05', '2024-02-29', 'Inactive', NULL, NULL, NULL),
(1064, 'Siddhesh', 'Mahadeshwar', NULL, '2020-01-13', '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1065, 'Vinay', 'Gawde', NULL, NULL, '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1066, 'Diana', 'Cardoz', 'Compute Specialist', '2021-04-21', NULL, 'Active', '1994-09-05', 'SolarWinds', 'cardoz5diana@gmail.com'),
(1067, 'Shravya', 'Shetty', 'Associate Engineer', NULL, NULL, 'Active', '1995-04-29', 'SolarWinds', NULL),
(1068, 'Swapnil', 'Kadam', 'Associate Engineer', NULL, NULL, 'Active', '1984-09-22', 'BigFix', NULL),
(1069, 'Nishi', 'Puthran', 'Associate Engineer', '2021-09-20', NULL, 'Active', '1995-12-13', 'BigFix', 'nishiputhran13@gmail.com'),
(1070, 'Abhishek', 'Dubey', 'Associate Engineer', NULL, NULL, 'Active', NULL, 'BigFix', NULL),
(1071, 'Yogesh', 'Tamrakar', NULL, NULL, '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1072, 'Ankita', 'Khanloskar', NULL, NULL, '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1073, 'Bhushan', 'Mahajan', 'Associate Engineer', '2022-07-12', NULL, 'Active', '2000-03-28', 'BigFix', NULL),
(1074, 'Divya', 'Yadav', 'Associate Engineer', '2022-07-12', NULL, 'Active', '2000-09-12', 'SolarWinds', NULL),
(1075, 'Arati', 'Kamble', 'Associate Engineer', '2022-07-12', NULL, 'Active', '2000-10-16', 'SolarWinds', NULL),
(1076, 'Abhilash', 'Lonkar', 'Associate Engineer', '2022-08-02', NULL, 'Active', '1994-08-29', 'BigFix', NULL),
(1077, 'Vivek', 'Chawla', 'Sales Manager', '2022-08-24', '2022-03-14', 'Inactive', NULL, NULL, NULL),
(1078, 'Shriniwas', 'Jangam', 'Associate Engineer', NULL, NULL, 'Active', '1982-06-24', 'SolarWinds', NULL),
(1079, 'Rohit', 'Lonkar', 'Associate Engineer', NULL, NULL, 'Active', '1998-03-17', 'SolarWinds', NULL),
(1080, 'Suraj', 'Kumbhar', 'Associate Engineer', NULL, NULL, 'Active', '1994-03-07', 'SolarWinds', NULL),
(1081, 'Ganesh', 'Waykar', 'Associate Engineer', NULL, NULL, 'Active', '1985-08-05', 'BigFix', NULL),
(1082, 'Rohit', 'Hingse', 'Associate Engineer', NULL, NULL, 'Active', '1999-12-03', 'SolarWinds', NULL),
(1085, 'Kajal', 'Upadhyay', 'Associate Engineer', '2023-10-03', NULL, 'Active', '1999-11-28', 'SolarWinds', 'iamkajal2811@gmail.com'),
(1086, 'Mihir', 'Bari', 'Associate Engineer', '2023-10-03', NULL, 'Active', '2000-09-26', 'SolarWinds', 'mihir26bari@gmail.com'),
(1087, 'Himani', 'Gupte', 'Account Excutive', '2023-10-03', NULL, 'Active', '2000-06-06', NULL, 'himanigupte0408@gmail.com'),
(1088, 'Aniket', 'Jagdale', 'Associate Engineer', NULL, NULL, 'Active', '1993-07-11', 'BigFix', NULL),
(1089, 'Rutuja', 'Chavarkar', 'Associate Engineer', NULL, NULL, 'Active', '2000-09-02', 'BigFix', NULL),
(1090, 'Pawan', 'Nenwani', 'Business Development Manager', '2024-09-16', NULL, 'Active', '2003-06-09', NULL, 'nenwanipawan9@gmail.com'),
(10266, 'Rajesh', 'Seshan', 'Director', '2009-04-20', '2011-06-30', 'Inactive', NULL, NULL, ''),
(10599, 'Rohit', 'Jadhav', 'Associate Engineer', '2018-10-15', '2022-03-14', 'Inactive', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `name`, `date`) VALUES
(90, 'Maharashtra Day', '2024-05-01'),
(91, 'Independence Day', '2024-08-15'),
(92, 'Ganesh Chaturthi', '2024-09-07'),
(93, 'Shastri / Gandhi Jayanti', '2024-10-02'),
(94, 'Dusherra', '2024-10-12'),
(95, 'Diwali', '2024-10-31'),
(96, 'Christmas', '2024-12-25'),
(97, 'New Years Day', '2025-01-01'),
(98, 'Republic Day', '2025-01-26'),
(99, 'Holi', '2025-03-14'),
(100, 'Elections in Mumbai', '2024-05-20'),
(101, 'Diwali', '2024-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `leaveapplication`
--

CREATE TABLE `leaveapplication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `duration` varchar(255) NOT NULL,
  `days` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `history` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaveapplication`
--

INSERT INTO `leaveapplication` (`id`, `name`, `surname`, `status`, `fromDate`, `toDate`, `duration`, `days`, `description`, `history`, `createdBy`, `created_at`, `update_at`) VALUES
(45, 'Aniket ', 'Jagdale ', 'approved', '2024-09-26', '2024-09-27', 'Full Day', 2, 'Personal Reason.', 'approved', 'Aniket ', '2024-09-10 08:08:29', NULL),
(46, 'Aniket ', 'Jagdale ', 'approved', '2024-04-05', '2024-04-05', 'Full Day', 1, 'request leave from work to attend my cousin wedding, which is scheduled on 5th – April-2024.', 'approved', 'Aniket ', '2024-09-10 08:10:30', '2024-09-10 08:11:49'),
(47, 'Bhushan', 'Mahajan', 'approved', '2024-05-10', '2024-05-13', 'Full Day', 2, 'Jalgaon Loksabha Election ', 'Approved', 'Bhushan', '2024-09-10 08:12:51', NULL),
(48, 'Bhushan', 'Mahajan', 'approved', '2024-08-16', '2024-08-16', 'Full Day', 1, 'Family Emergency Leave', 'Approved', 'Bhushan', '2024-09-10 08:14:54', NULL),
(49, 'Suraj', 'Kumbhar', 'approved', '2024-09-13', '2024-09-13', 'Full Day', 1, 'Ganapati Visarjan', 'approved', 'Suraj', '2024-09-10 08:23:23', NULL),
(50, 'Arati', 'Kamble', 'approved', '2024-09-08', '2024-09-08', 'Full Day', 1, 'Have to go home town for close relative wedding.', 'Approved', 'Arati', '2024-09-10 09:04:06', NULL),
(51, 'Arati', 'Kamble', 'approved', '2024-04-10', '2024-04-10', 'Full Day', 1, 'Have to go home town for close relative wedding.', 'Approved', 'Arati', '2024-09-10 09:04:37', NULL),
(52, 'Arati', 'Kamble', 'approved', '2024-04-12', '2024-04-12', 'Full Day', 1, 'Have to go home town for close relative wedding.', 'approve', 'Arati', '2024-09-10 09:05:26', NULL),
(53, 'Divya', 'Yadav', 'approved', '2024-09-16', '2024-09-17', 'Full Day', 2, 'would like to request a day off on 16 and 17 September to participate in the Ganpati Visarjan festivities with my family.', 'approve', 'Divya', '2024-09-10 09:06:46', NULL),
(54, 'Arati', 'Kamble', 'approved', '2024-07-08', '2024-07-09', 'Full Day', 2, 'Due to medical emergency I’m not able to join the office.', 'Sick leave approved', 'Arati', '2024-09-10 09:07:21', NULL),
(55, 'Arati', 'Kamble', 'approved', '2024-08-12', '2024-08-12', 'Full Day', 1, 'Feeling not well taking sick leave.', 'approve', 'Arati', '2024-09-10 09:08:26', NULL),
(56, 'Arati', 'Kamble', 'approved', '2024-08-14', NULL, 'Half Day', 1, 'Feeling not well took sick leave by half day.', 'approve', 'Arati', '2024-09-10 09:09:34', NULL),
(57, 'Arati', 'Kamble', 'approved', '2024-08-20', '2024-08-20', 'Full Day', 1, 'Due to medical appointment of dad’s eye checkup took leave.', 'approve', 'Arati', '2024-09-10 09:11:35', NULL),
(58, 'Arati', 'Kamble', 'approved', '2024-08-23', '2024-08-23', 'Full Day', 1, 'Got admitted in hospital due to white platelets got decreased. Feeling feverish and weak that time. ', 'approved', 'Arati', '2024-09-10 09:13:06', NULL),
(60, 'Arati', 'Kamble', 'approved', '2024-06-03', '2024-06-03', 'Full Day', 1, 'Sick leave', 'approved', 'Arati', '2024-09-10 10:13:26', NULL),
(61, 'Arati', 'Kamble', 'approved', '2024-06-27', '2024-06-27', 'Full Day', 1, 'Due to some personal reason not able to join the office.', 'granted', 'Arati', '2024-09-10 10:14:13', '2024-09-10 11:36:27'),
(62, 'Mihir', 'Bari', 'approved', '2024-09-11', NULL, 'Half Day', 1, 'Ganpati Visarjan', 'approved', 'Mihir', '2024-09-10 10:17:49', NULL),
(64, 'Mihir', 'Bari', 'approved', '2024-06-24', '2024-06-24', 'Full Day', 1, 'Sick leave', 'approved', 'Mihir', '2024-09-10 10:36:56', NULL),
(65, 'Mihir', 'Bari', 'approved', '2024-08-22', '2024-08-23', 'Full Day', 2, 'Two day Trip to salangpur and pavagdh', 'approved', 'Mihir', '2024-09-10 10:41:11', NULL),
(66, 'Shriniwas', 'Jangam', 'approved', '2024-09-13', '2024-09-13', 'Full Day', 1, 'Ganesh Utsav Festival', 'Approved', 'Shriniwas', '2024-09-11 06:32:28', NULL),
(67, 'Rohit', 'Lonkar', 'approved', '2024-09-12', '2024-09-12', 'Full Day', 1, 'Satyanarayan Pooja at Home', 'Approved', 'Rohit', '2024-09-11 07:52:26', NULL),
(69, 'Diana', 'Cardoz', 'approved', '2024-06-17', '2024-06-17', 'Full Day', 1, 'Family member death - funeral and memorial service', 'Approved', 'Diana', '2024-09-16 09:05:52', NULL),
(70, 'Diana', 'Cardoz', 'approved', '2024-09-30', '2024-10-04', 'Full Day', 4, 'Personal Leave', 'Approved', 'Diana', '2024-09-16 09:08:06', NULL),
(71, 'Himani ', 'Gupte', 'approved', '2024-09-18', '2024-09-18', 'Full Day', 1, 'Sick Leave', 'Approved', 'Himani ', '2024-09-19 07:32:33', NULL),
(72, 'Prashant ', 'Kadechkar ', 'approved', '2024-05-29', '2024-05-31', 'Full Day', 3, '3 days leave due to the passing of my father', '', 'Prashant ', '2024-09-23 06:09:35', NULL),
(73, 'Prashant ', 'Kadechkar ', 'approved', '2024-06-10', '2024-06-10', 'Full Day', 1, '1 days leave to perform rituals of my father', '', 'Prashant ', '2024-09-23 06:10:57', NULL),
(74, 'Suraj', 'Kumbhar', 'approved', '2024-09-27', '2024-09-27', 'Full Day', 1, 'father\'s eye laser treatment', 'approved', 'Suraj', '2024-09-25 06:11:38', NULL),
(75, 'Pawan', 'Nenwani', 'approved', '2024-09-18', '2024-09-18', 'Full Day', 1, 'I was not feeling well  ', 'approved', 'Pawan', '2024-09-25 06:12:45', NULL),
(76, 'Sagar', 'Deshpande', 'approved', '2024-10-17', '2024-10-21', 'Full Day', 3, 'Going for WCRM event to Badami caves Karnataka. ', 'approved', 'Sagar', '2024-09-30 15:03:04', NULL),
(77, 'Swapnil', 'Kadam', 'approved', '2024-05-30', '2024-05-31', 'Full Day', 2, 'Visite to Native place', 'Approved', 'Swapnil', '2024-10-07 05:44:49', NULL),
(78, 'Swapnil', 'Kadam', 'approved', '2024-07-12', '2024-07-12', 'Full Day', 1, 'Daughter\'s Birthday', 'ok', 'Swapnil', '2024-10-07 05:45:43', NULL),
(79, 'Swapnil', 'Kadam', 'approved', '2024-09-06', '2024-09-06', 'Full Day', 1, 'Ganpati Fastival', 'ok', 'Swapnil', '2024-10-07 05:46:53', NULL),
(80, 'Swapnil', 'Kadam', 'approved', '2024-10-28', '2024-10-31', 'Full Day', 3, 'Pilgrimage visit to Tirupati', 'ok, pls inform HDFC Sec in advance', 'Swapnil', '2024-10-07 06:54:36', NULL),
(81, 'Bhushan', 'Mahajan', 'approved', '2024-10-08', '2024-10-08', 'Full Day', 1, 'Sick Leave', 'ok', 'Bhushan', '2024-10-09 09:14:22', NULL),
(82, 'Himani ', 'Gupte', 'approved', '2024-10-14', '2024-10-14', 'Full Day', 1, 'Family Function', 'approved', 'Himani ', '2024-10-15 05:37:11', NULL),
(83, 'Rutuja', 'Chavarkar', 'request', '2024-11-13', '2024-11-22', 'Full Day', 8, 'Need to attend my cousin\'s wedding and going for a family trip.', NULL, 'Rutuja', '2024-10-21 05:56:28', NULL),
(84, 'Mihir', 'Bari', 'approved', '2024-11-04', '2024-11-05', 'Full Day', 2, 'Family outing', 'approved', 'Mihir', '2024-10-27 12:02:57', NULL),
(85, 'Rutuja', 'Chavarkar', 'approved', '2024-09-02', NULL, 'Full Day', 1, 'Birthday', 'Approved', 'Rutuja', '2024-10-28 06:40:43', NULL),
(86, 'Rutuja', 'Chavarkar', 'approved', '2024-05-09', NULL, 'Full Day', 1, 'Went out with family.', 'Approved', 'Rutuja', '2024-10-28 06:46:18', NULL),
(87, 'Rutuja', 'Chavarkar', 'approved', '2024-03-26', NULL, 'Full Day', 1, 'Had to attend the Convocation ceremony at my college.', 'Approved', 'Rutuja', '2024-10-28 06:54:49', NULL),
(88, 'Kajal', 'Upadhyay', 'approved', '2024-10-08', '2024-10-08', 'Full Day', 1, 'Hospital', 'Approved', 'Kajal', '2024-10-28 09:01:52', NULL),
(89, 'Kajal', 'Upadhyay', 'approved', '2024-08-22', '2024-08-22', 'Full Day', 1, 'Due to family', 'Approved', 'Kajal', '2024-10-28 09:03:25', NULL),
(90, 'Kajal', 'Upadhyay', 'approved', '2024-08-01', '2024-08-01', 'Full Day', 1, 'Hospital', 'Approved', 'Kajal', '2024-10-28 09:04:18', NULL),
(91, 'Abhishek ', 'Dubey', 'approved', '2024-10-31', '2024-11-05', 'Full Day', 2, 'Going to my native place.', 'Approved', 'Abhishek ', '2024-10-29 09:36:29', NULL),
(92, 'Suraj', 'Kumbhar', 'approved', '2024-11-25', '2024-11-30', 'Full Day', 5, 'Going village for First Year Shraddha of great-grandmother and name ceremony of cousin brother daughter', 'Pls handle ICICI ', 'Suraj', '2024-11-05 05:39:20', NULL),
(93, 'Diana', 'Cardoz', 'approved', '2024-11-06', '2024-11-06', 'Full Day', 1, 'Personal Leave', 'ok', 'Diana', '2024-11-05 06:48:57', NULL),
(94, 'Abhilash', 'Lonkar', 'approved', '2024-12-26', '2024-12-27', 'Full Day', 2, 'Best friends wedding please approve ', 'ok, pls ensure Amit Randive is managed', 'Abhilash', '2024-11-05 16:07:05', NULL),
(97, 'Rohit', 'Lonkar', 'request', '2024-12-26', '2024-12-27', 'Full Day', 2, 'Friend\'s Wedding, Please Approve!', NULL, 'Rohit', '2024-11-07 12:30:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leavelogs`
--

CREATE TABLE `leavelogs` (
  `id` int(11) NOT NULL,
  `EventLog` varchar(2048) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leavelogs`
--

INSERT INTO `leavelogs` (`id`, `EventLog`, `created_at`) VALUES
(24, 'Aniket  Jagdale  added a leave', '2024-09-10'),
(25, 'Aniket  Jagdale  added a leave', '2024-09-10'),
(26, 'Aniket  Jagdale  edited a leave application', '2024-09-10'),
(27, 'Bhushan Mahajan added a leave', '2024-09-10'),
(28, 'Bhushan Mahajan added a leave', '2024-09-10'),
(29, 'Suraj Kumbhar added a leave', '2024-09-10'),
(30, 'Arati Kamble added a leave', '2024-09-10'),
(31, 'Arati Kamble added a leave', '2024-09-10'),
(32, 'Arati Kamble added a leave', '2024-09-10'),
(33, 'Divya Yadav added a leave', '2024-09-10'),
(34, 'Arati Kamble added a leave', '2024-09-10'),
(35, 'Arati Kamble added a leave', '2024-09-10'),
(36, 'Arati Kamble added a leave', '2024-09-10'),
(37, 'Arati Kamble added a leave', '2024-09-10'),
(38, 'Arati Kamble added a leave', '2024-09-10'),
(39, 'ROHIT LONKAR added a leave', '2024-09-10'),
(40, 'Arati Kamble added a leave', '2024-09-10'),
(41, 'Arati Kamble added a leave', '2024-09-10'),
(42, 'Arati Kamble edited a leave application', '2024-09-10'),
(43, 'Mihir Bari added a leave', '2024-09-10'),
(44, 'Mihir Bari added a leave', '2024-09-10'),
(45, 'Mihir Bari Deleted application from Mon Jun 24 2024 00:00:00 GMT+0000 (Coordinated Universal Time) to null', '2024-09-10'),
(46, 'Mihir Bari added a leave', '2024-09-10'),
(47, 'Mihir Bari added a leave', '2024-09-10'),
(48, 'Arati Kamble edited a leave application', '2024-09-10'),
(49, 'Shriniwas Jangam added a leave', '2024-09-11'),
(50, 'Rohit Lonkar added a leave', '2024-09-11'),
(51, 'Diana Cardoz added a leave', '2024-09-13'),
(52, 'Diana Cardoz Deleted application from Tue Sep 17 2024 00:00:00 GMT+0000 (Coordinated Universal Time) to Tue Sep 17 2024 00:00:00 GMT+0000 (Coordinated Universal Time)', '2024-09-13'),
(53, 'Diana Cardoz added a leave', '2024-09-16'),
(54, 'Diana Cardoz added a leave', '2024-09-16'),
(55, 'Himani  Gupte added a leave', '2024-09-19'),
(56, 'Prashant  Kadechkar  added a leave', '2024-09-23'),
(57, 'Prashant  Kadechkar  added a leave', '2024-09-23'),
(58, 'Suraj Kumbhar added a leave', '2024-09-25'),
(59, 'Pawan Nenwani added a leave', '2024-09-25'),
(60, 'Sagar Deshpande added a leave', '2024-09-30'),
(61, 'Swapnil Kadam added a leave', '2024-10-07'),
(62, 'Swapnil Kadam added a leave', '2024-10-07'),
(63, 'Swapnil Kadam added a leave', '2024-10-07'),
(64, 'Swapnil Kadam added a leave', '2024-10-07'),
(65, 'Bhushan Mahajan added a leave', '2024-10-09'),
(66, 'Himani  Gupte added a leave', '2024-10-15'),
(67, 'Rutuja Chavarkar added a leave', '2024-10-21'),
(68, 'Mihir Bari added a leave', '2024-10-27'),
(69, 'Rutuja Chavarkar added a leave', '2024-10-28'),
(70, 'Rutuja Chavarkar added a leave', '2024-10-28'),
(71, 'Rutuja Chavarkar added a leave', '2024-10-28'),
(72, 'Kajal Upadhyay added a leave', '2024-10-28'),
(73, 'Kajal Upadhyay added a leave', '2024-10-28'),
(74, 'Kajal Upadhyay added a leave', '2024-10-28'),
(75, 'Abhishek  Dubey added a leave', '2024-10-29'),
(76, 'Suraj Kumbhar added a leave', '2024-11-05'),
(77, 'Diana Cardoz added a leave', '2024-11-05'),
(78, 'Abhilash Lonkar added a leave', '2024-11-05'),
(79, 'Pawan Nenwani added a leave', '2024-11-06'),
(80, 'Mihir Bari added a leave', '2024-11-07'),
(81, 'Mihir Bari Deleted application from Fri Nov 08 2024 00:00:00 GMT+0000 (Coordinated Universal Time) to Fri Nov 08 2024 00:00:00 GMT+0000 (Coordinated Universal Time)', '2024-11-07'),
(82, 'Rohit Lonkar added a leave', '2024-11-07'),
(83, 'Pawan Nenwani Deleted application from Fri Nov 08 2024 00:00:00 GMT+0000 (Coordinated Universal Time) to null', '2024-11-08'),
(84, 'Pawan Nenwani Deleted application from Fri Nov 08 2024 00:00:00 GMT+0000 (Coordinated Universal Time) to null', '2024-11-08');

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
(1, 'SBI DFHI Limited', 'Robin Kaleramana', 'Demo Done', 'BigFix', 'New', 100000, '2024-07-01', 'POC Done', 'New BigFix Opportunity', NULL, NULL, NULL),
(2, 'SBI DFHI Limited', 'Robin Kaleramana', 'Demo Done', 'SolarWinds', 'New', 100000, '2024-06-28', 'Demo Done', 'New SolarWinds Opportunity', NULL, NULL, NULL),
(28, 'Yes Bank Limited', '', 'On-site annual support for BigFix ', 'Services', 'Renewal', 3600000, '2024-03-31', 'Won', '1 Year service', '2024-04-01', '2025-03-31', NULL),
(29, 'Avacend Solutions Private Limited', '', 'Cisco on-site support', 'Services', 'Renewal', 1560000, '2024-03-31', 'Won', '1 Year service', '2024-04-01', '2025-03-31', NULL),
(30, 'BSE Limited', 'Anuj Bhuva', 'On-site annual support for SolarWinds', 'Services', 'Renewal', 3246327, '2024-03-31', 'Won', '1 Year service', '2024-04-01', '2025-03-31', NULL),
(31, 'Mylan Inc ', '', 'Lifecycle MVS: 835, Lifecycle Resource Value Unit: 5743, HCL Connection authorized, Domino Collaboration: 200', 'BigFix', 'Renewal', 7924234, '2024-03-31', 'Won', '1 year Licenses', '2024-05-01', '2025-04-30', NULL),
(32, 'Godrej Industries Limited', '', 'Compliance Term MVS: 500', 'BigFix', 'Renewal', 2599865, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(33, 'BSE Limited', 'Anuj Bhuva', 'Netscout Renewal', 'Netscout', 'Renewal', 4181934, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(34, 'BSE Limited', 'Anuj Bhuva', 'AMC for SolarWinds Licenses', 'SolarWinds', 'Renewal', 7767464, '2024-04-01', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(35, 'Angel One Limited ', '', 'Annual Support for SolarWinds ', 'Services', 'Renewal', 400000, '2024-03-31', 'Won', '1 Year service', '2024-04-01', '2025-03-31', NULL),
(36, 'Angel One Limited ', '', 'NCM DL 500, IP Address manager IP16000, NPM SLX Unlimited', 'SolarWinds', 'Renewal', 1590118, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(37, 'Axis Bank Limited', '', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 18468137, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(38, 'BSE Limited', 'Vishwas Maladkar', 'BigFix Renewals', 'BigFix', 'Renewal', 8950356, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(39, 'Karnataka Bank Limited', '', 'HCO, DPA', 'SolarWinds', 'Renewal', 9258151, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(40, 'DCB Bank Limited ', '', 'BigFix Renewals', 'BigFix', 'Renewal', 2259887, '2024-03-30', 'Won', '3 Years license', '2024-04-01', '2025-03-31', NULL),
(41, '24/7 Customer Private Limited - Platina', '', 'BigFix Renewals ', 'BigFix', 'Renewal', 2616441, '2024-03-31', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(42, 'BSE Limited', 'Anuj Bhuva', 'Web Server', 'SolarWinds', 'New', 268566, '2024-04-01', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(43, 'Concentrix Daksh Services India Private Limited', '', 'BigFix Renewals', 'BigFix', 'Renewal', 18167823, '2024-03-31', 'Won', '3 years License ends in 31/03/27', '2024-04-01', '2025-03-31', NULL),
(44, 'Concentrix Daksh Services India Private Limited', '', 'BigFix New Licenses', 'BigFix', 'New', 135752158, '2024-03-31', 'Won', '3 years License ends in 31/03/27', '2024-04-01', '2025-03-31', NULL),
(45, 'Adani Petronet (Dahej) Port Ltd ', '', 'SolarWinds New License', 'SolarWinds', 'New', 305230, '2024-04-01', 'Won', '1 year Licenses', '2024-04-14', '2025-05-13', NULL),
(46, 'National Commodity & Derivatives Exchange Limited', '', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 1045053, '2024-06-19', 'Won', '1 year Licenses', '2024-06-19', '2025-06-18', NULL),
(47, 'ICICI Prudential Asset Management Company Limited ', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 425000, '2023-08-30', 'Won', '1 Year service', '2024-09-11', '2025-09-10', NULL),
(48, 'Mahindra & Mahindra Ltd', '', 'DPA SRM Kiwi Syslog ', 'SolarWinds', 'Renewal', 3828152, '2024-04-30', 'Won', '1 year Licenses', '2023-09-30', '2024-09-30', NULL),
(49, 'DCB Bank Limited ', '', 'BigFix Renewals CD', 'BigFix', 'Renewal', 7256471, '2024-04-30', 'Won', '1 year Licenses', '2024-04-30', '2025-04-29', NULL),
(50, 'Inniti Network Solutions LLP', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 333333, '2024-09-05', 'Won', '1 Year service', '2024-09-30', '2025-09-29', NULL),
(51, 'Cowtown Software Design Pvt. Ltd', '', 'SolarWinds Renewals ', 'SolarWinds', 'Renewal', 1338012, '2024-09-19', 'Won', '1 year Licenses', '2024-09-29', '2025-09-29', NULL),
(52, 'Karnataka Bank Limited', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 500000, '2024-09-30', 'Won', '1 Year service', '2024-09-01', '2025-08-31', NULL),
(53, 'Damika Insurance Broking Company Pvt Ltd', '', 'Patch Perpetual :13', 'BigFix', 'Renewal', 6305, '2023-08-31', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(54, 'Bharat Forge Limited ', 'Shrinivas Kulkarni', 'Patch CD: 555', 'BigFix', 'Renewal', 269175, '2023-09-01', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(55, 'Khed Economic Infrastructure Private Limited', '', 'Patch Perpetual CD : 12', 'BigFix', 'Renewal', 5820, '2023-09-01', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(56, 'KTMS Design and Engineering Private Limited', '', 'Patch Perpetual CD : 31', 'BigFix', 'Renewal', 15035, '2023-09-01', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(57, 'BF Utilities Limited', '', 'Patch Perpetual CD : 6', 'BigFix', 'Renewal', 2910, '2023-08-30', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(58, 'BF Investment Limited', '', 'Patch Perpetual CD : 3', 'BigFix', 'Renewal', 1455, '2023-08-30', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(59, 'Kalyani Technoforge Limited ', '', 'Patch CD: 1', 'BigFix', 'Renewal', 274025, '2023-09-21', 'Won', '1 year Licenses', '2023-09-01', '2024-11-22', NULL),
(62, 'Bharat Forge Limited ', 'Shrinivas Kulkarni', 'SolarWinds AMC: 1', 'SolarWinds', 'Renewal', 777000, '2023-10-02', 'Won', '1 year Licenses', '2023-08-23', '2024-10-26', NULL),
(63, 'Axis Asset Management Company Limited', '', 'StarterKit for Lifecycle MVS: 375', 'BigFix', 'Renewal', 313894, '2023-10-10', 'Won', '1 year Licenses', '2023-10-01', '2024-09-30', NULL),
(64, 'IDBI Bank Limited', '', 'Lifecycle additional CD: 3000', 'BigFix', 'Renewal', 1449999, '2024-09-30', 'Won', '1 year Licenses', '2024-10-01', '2025-09-30', NULL),
(65, 'CG Power and Industrial Solutions Limited', '', 'SolarWinds DameWare Remote: 2', 'SolarWinds', 'Renewal', 74760, '2023-09-27', 'Won', '1 year Licenses', '2023-09-01', '2024-08-31', NULL),
(66, 'DCB Bank Limited ', '', 'Compliance Term: 500', 'BigFix', 'Renewal', 1750500, '2023-10-16', 'Won', '1 year Licenses', '2023-10-23', '2024-10-22', NULL),
(67, 'Excelsoft Technologies Pvt Ltd', '', 'Tenable Renewal', 'Tenable', 'Renewal', 598854, '2024-09-03', 'Won', '1 year Licenses', '2024-09-07', '2025-09-06', NULL),
(68, 'BSE Limited', 'Anuj Bhuva', 'StarterKit lifecycle, Inventory, Compliance CD: 525\r\nInventory, Compliance MVS: 1000\r\n', 'BigFix', 'Renewal', 11751300, '2023-10-31', 'Won', 'Upfront Payment from BSE for 3 years.', '2023-10-30', '2026-10-29', NULL),
(69, 'Mahindra & Mahindra Financial Services Limited', '', 'Patch term CD: 16000\nPatch term MVS: 500', 'BigFix', 'Renewal', 1822291, '2023-11-01', 'Won', '1 year Licenses', '2023-09-24', '2024-09-24', NULL),
(70, 'Mahindra & Mahindra Financial Services Limited', '', 'Annual Support for BigFix', 'Services', 'Renewal', 800000, '2023-11-01', 'Won', '1 Year service', '2023-09-24', '2024-09-23', NULL),
(71, 'Bandhan AMC Limited', '', 'Kiwi Syslog', 'SolarWinds', 'Renewal', 45237, '2023-11-01', 'Won', '1 year Licenses', '2023-11-01', '2025-10-31', NULL),
(72, 'Axis Bank Limited', '', 'Compliance perpetual MVS: 800\n', 'BigFix', 'Renewal', 4928000, '2023-11-02', 'Won', '3 years ends in 15th Oct 2026', '2023-10-16', '2024-10-15', NULL),
(73, 'Pidilite Industries Ltd', '', 'NPM, NTA, NCM, Kiwi Syslog', 'SolarWinds', 'Renewal', 1297731, '2024-10-17', 'Won', '1 year Licenses', '2024-10-29', '2025-10-28', NULL),
(74, 'Pidilite Industries Ltd', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 600000, '2024-10-17', 'Won', '1 Year service', '2024-10-29', '2025-10-28', NULL),
(75, 'LTIMindtree Limited', '', 'Annual support for BigFix', 'Services', 'Renewal', 400000, '2023-11-01', 'Won', '1 Year service', '2023-11-01', '2024-10-31', NULL),
(76, 'SBM Bank (India) Limited', '', 'Patch term MVS: 150\nPatch MVS: 500', 'BigFix', 'Renewal', 750750, '2023-11-06', 'Won', '3 Years ends in 1st Nov 2026', '2023-11-02', '2024-11-01', NULL),
(77, 'BSE Limited', 'Anuj Bhuva', 'SolarWinds Expansion of 4 APE and 4 HA', 'SolarWinds', 'New', 9244350, '2024-06-03', 'Won', '1 year Licenses', '2024-10-01', '2025-09-30', NULL),
(78, 'Angel One Limited ', '', 'Patch term MVS: 1800', 'BigFix', 'Renewal', 2923200, '2024-10-07', 'Won', '1 Year Licenses', '2024-09-30', '2025-09-29', NULL),
(79, 'Angel One Limited ', '', 'StarterKit Lifecycle CD: 500', 'BigFix', 'Renewal', 800943, '2023-10-31', 'Won', '1 Year Licenses', '2023-11-10', '2024-11-09', NULL),
(80, 'DCB Bank Limited ', '', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 600000, '2023-11-07', 'Won', '1 Year service', '2023-10-01', '2024-09-30', NULL),
(81, 'Bharat Forge Limited ', 'Shrinivas Kulkarni', 'Patch MVS: 310\nPatch CD: 1900', 'BigFix', 'Renewal', 350717, '2023-11-17', 'Won', '1 year Licenses', '2023-11-23', '2024-11-22', NULL),
(82, 'ICICI Prudential Life Insurance Company Limited', '', 'Kiwi Syslog Server', 'SolarWinds', 'Renewal', 30515, '2023-11-27', 'Won', '1 year Licenses', '2023-12-01', '2024-11-30', NULL),
(83, 'Shoppers Stop Limited', '', 'NPM, NTA, Kiwi CatTools, Kiwi Syslog Server', 'SolarWinds', 'Renewal', 2355860, '2024-10-01', 'Won', '1 year Licenses', '2024-10-01', '2025-11-01', NULL),
(84, 'Shoppers Stop Limited', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 400000, '2024-05-30', 'Won', '1 Year service', '2024-06-01', '2025-05-31', NULL),
(85, 'Adani Gangavaram Port Private Limited', 'Akshaya Kumar Das', 'NPM SL250', 'SolarWinds', 'Renewal', 153000, '2024-11-05', 'Won', '1 year Licenses', '2024-11-18', '2025-11-17', NULL),
(86, 'Motilal Oswal Securities Limited', '', 'Patch MVS: 500\nPatch CD: 9000', 'BigFix', 'Renewal', 761255, '2024-11-22', 'Won', '1 year Licenses', '2023-12-01', '2024-11-30', NULL),
(87, 'Motilal Oswal Securities Limited', '', 'Annual Support Service for BigFix', 'Services', 'Renewal', 350000, '2023-11-22', 'Won', '1 Year service', '2024-01-01', '2024-12-31', NULL),
(88, 'HDFC Securities Limited', '', 'On-Site Support for BigFix', 'Services', 'Renewal', 2891958, '2023-10-21', 'Won', '1 Year service', '2024-01-01', '2024-12-31', NULL),
(89, 'ICICI Prudential Life Insurance Company Limited', '', 'SolarWinds Renewal', 'SolarWinds', 'Renewal', 3136809, '2023-11-01', 'Won', '1 year Licenses', '2023-11-01', '2024-12-31', NULL),
(90, 'K Raheja Corp Real Estate Pvt Ltd', '', 'Annual support for BigFix', 'Services', 'Renewal', 350000, '2023-12-06', 'Won', '1 Year service', '2023-12-01', '2024-11-30', NULL),
(91, 'HDFC Securities Limited', 'Girish Oberio', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 1109162, '2023-12-12', 'Won', '1 year Licenses', '2023-12-19', '2024-12-19', NULL),
(92, 'TATA Motors Finance Ltd', '', 'NPM SL2000', 'SolarWinds', 'Renewal', 410465, '2023-12-19', 'Won', '1 year Licenses', '2023-12-28', '2024-12-28', NULL),
(93, 'HDB Financial Services Limited', '', 'DPA: 16\nSAM: 25 nodes', 'SolarWinds', 'Renewal', 884595, '2023-12-26', 'Won', '1 year Licenses', '2023-12-30', '2024-12-30', NULL),
(94, 'HDB Financial Services Limited', '', 'DPA: 5', 'SolarWinds', 'Renewal', 753355, '2023-12-26', 'Won', '1 year Licenses', '2023-12-30', '2024-12-30', NULL),
(95, 'HDB Financial Services Limited', '', 'APE Unlimited', 'SolarWinds', 'Renewal', 1555006, '2023-12-26', 'Won', '1 year Licenses', '2023-12-27', '2024-12-27', NULL),
(96, 'Axis Bank Limited', '', 'Patch Term MVS: 1500', 'BigFix', 'Renewal', 2155986, '2023-12-26', 'Won', '1 year Licenses', '2023-12-29', '2024-12-28', NULL),
(97, 'The Saraswat Co. Operative Bank Ltd', '', 'Patch Term CD: 6200\nPatch Term MVS: 1125\nCompliance Term MVS:125', 'BigFix', 'Renewal', 20853801, '2023-12-26', 'Won', '5 year Licenses', '2024-01-15', '2025-01-14', NULL),
(98, 'Quantum Advisors Private Limited', '', 'Patch CD: 405\nPatch MVS: 80', 'BigFix', 'Renewal', 80953, '2023-12-29', 'Won', '1 year Licenses', '2024-01-01', '2024-12-31', NULL),
(99, 'Tata Motors Finance Ltd', '', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 275000, '2024-01-04', 'Won', '1 Year service', '2024-01-04', '2025-01-03', NULL),
(100, 'SBI General Insurance Company Limited', '', 'Remediate Term MVS', 'BigFix', 'Renewal', 2000000, '2024-01-25', 'Won', '1 year Licenses', '2024-02-01', '2025-01-31', NULL),
(101, 'HDB Financial Services Limited', '', 'Annual Support Service for BigFix & SolarWinds', 'Services', 'Renewal', 1200000, '2024-02-02', 'Won', '1 Year service', '2024-02-01', '2025-01-31', NULL),
(102, 'LTIMindtree Limited', '', 'Patch MVS: 1000', 'BigFix', 'Renewal', 360000, '2024-02-02', 'Won', '1 year Licenses', '2023-12-01', '2024-11-30', NULL),
(103, 'LTIMindtree Limited', '', 'Patch MVS: 500', 'BigFix', 'Renewal', 180000, '2024-02-02', 'Won', '1 year Licenses', '2024-02-01', '2025-01-31', NULL),
(104, 'Axis Securities Limited', '', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 600000, '2024-08-23', 'Won', '6 Months Service', '2024-08-28', '2025-08-27', NULL),
(105, 'Eureka Forbes Limited', '', 'Inventory MVS: 50\nPatch MVS: 50\nInventory CD: 2400\nPatch CD: 2400', 'BigFix', 'Renewal', 711215, '2024-02-07', 'Won', '14 Months License', '2024-01-01', '2025-03-31', NULL),
(106, 'Adani Hazira Port Ltd', '', 'NPM Sl250\nKiwi CatTool', 'SolarWinds', 'Renewal', 270470, '2024-01-24', 'Won', '1 year Licenses', '2024-03-17', '2025-03-16', NULL),
(107, 'Pidilite Industries Ltd', '', 'SolarWinds Serv-U Managed File Transfer Server Per Seat License (1 server)', 'SolarWinds', 'Renewal', 67200, '2024-02-13', 'Won', '1 year Licenses', '2024-02-16', '2025-02-16', NULL),
(108, 'Pidilite Industries Ltd', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 71000, '2024-02-13', 'Won', '1 Year service', '2024-02-16', '2025-02-16', NULL),
(109, 'Tata Communications Limited', '', 'Kiwi Syslog Server: 2', 'SolarWinds', 'Renewal', 67940, '2024-02-01', 'Won', '1 year Licenses', '2024-01-29', '2025-01-28', NULL),
(110, 'Pine Labs Pvt Ltd', '', 'DPA 50 to 74 instances\nHCO AE1000', 'SolarWinds', 'Renewal', 8258868, '2024-02-14', 'Won', '1 year Licenses', '2024-01-31', '2025-01-31', NULL),
(111, 'Pine Labs Pvt Ltd', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 1900000, '2024-02-14', 'Won', '1 Year service', '2024-01-29', '2025-01-29', NULL),
(112, 'DCB Bank Limited ', '', 'Compliance Term: 100', 'BigFix', 'Renewal', 674157, '2024-02-16', 'Won', '1 year Licenses', '2024-01-18', '2025-01-17', NULL),
(113, 'SVC Co-operative Bank Limited', '', 'Patch CD: 3200\nPatch MVS: 350\n', 'BigFix', 'Renewal', 409466, '2024-02-21', 'Won', '3 Years ends in 9th Feb 2026', '2024-02-09', '2025-02-09', NULL),
(114, 'SVC Co-operative Bank Limited', '', 'Annual Support for BigFix ', 'Services', 'Renewal', 530000, '2024-02-21', 'Won', '3 year service', '2024-02-09', '2025-02-09', NULL),
(115, 'Tata Motors Finance Ltd', 'Sandeep Samant', 'Patch CD: 4000\nStarterkit for Lifecycle MVS: 300', 'BigFix', 'Renewal', 213075, '2024-02-26', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(116, 'Tata Motors Finance Ltd', 'Sandeep Samant', 'Annual Support for BigFix', 'Services', 'Renewal', 173130, '2024-02-26', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(117, 'Cowtown Software Design Pvt. Ltd', 'Sujeet Prajapati', 'Lifecycle end user machine: 4900\nLifecycle Server: 50', 'BigFix', 'Renewal', 4050419, '2024-02-29', 'Won', '1 year Licenses 2 & 3 Year price are fixed', '2024-03-10', '2025-03-09', NULL),
(118, 'T-Systems Information & Communications Technology India Private Limited', 'Bharat Pise', 'Log Analyzer, NTA SL2000, NPM SL2000 & Kiwi Syslog Server', 'SolarWinds', 'Renewal', 950011, '2024-03-14', 'Won', '1 year Licenses', '2024-03-31', '2025-03-31', NULL),
(119, 'T-Systems Information & Communications Technology India Private Limited', 'Bharat Pise', 'Annual Support for SolarWinds', 'Services', 'Renewal', 500000, '2024-03-14', 'Won', '1 Year service', '2024-03-31', '2025-03-31', NULL),
(120, 'Toshiba Software India Pvt Ltd', '', 'Annual Support for SolarWinds', 'Services', 'Renewal', 630000, '2024-03-13', 'Won', '1 Year service', '2024-03-09', '2025-03-08', NULL),
(121, 'Mahindra & Mahindra Financial Services Limited', 'Nikunj Panchal', 'NPM SL2000\nNTA SL2000\nNCM DL500', 'SolarWinds', 'Renewal', 952255, '2024-03-15', 'Won', '1 year Licenses', '2024-03-31', '2025-03-31', NULL),
(122, 'Mahindra & Mahindra Financial Services Limited', 'Nikunj Panchal', 'Patch CD: 2540\nPatch MVS: 304', 'BigFix', 'Renewal', 200972, '2024-03-15', 'Won', '1 year Licenses', '2024-03-17', '2025-03-16', NULL),
(123, 'Medanta', 'Dinesh Kumar', 'New BigFix 5500 CD 500 MVS', 'BigFix', 'New', 7500000, '2024-09-27', 'Demo Done', '', NULL, NULL, NULL),
(124, 'Pidilite Industries Ltd', '', 'New BigFix License CD & MVS', 'BigFix', 'New', 5000000, '2024-08-07', 'Lost', '1 year Licenses', NULL, NULL, NULL),
(125, 'Anand Rathi Finance', 'Priyank Sheth', 'New SolarWinds HCO and SEM ', 'SolarWinds', 'New', 2500000, '2024-08-30', 'Demo Done', '1 year Licenses', NULL, NULL, NULL),
(126, 'Havells India', 'Vishal Pujara', 'Compliance & Lifecycle ', 'BigFix', 'New', 100000, '2024-09-17', 'POC Done', '1 year Licenses', NULL, NULL, NULL);
INSERT INTO `opportunity` (`id`, `customer_entity`, `name`, `description`, `type`, `License_type`, `value`, `closure_time`, `status`, `period`, `license_from`, `license_to`, `pdf`) VALUES
(127, 'National Stock Exchange of India Limited', 'Sampath Manickam', 'This is a Co-location RFP by NSE and Techsa is bidding to NTT & CtrlS. The opportunity involves co-locating the member connectivity device racks and NSE connectivity device racks.', 'SolarWinds', 'New', 2000000, '2024-09-26', 'Quotation Done', '1 year Licenses', NULL, NULL, 0x504b030414000600080000002100413782cf6e01000004050000130008025b436f6e74656e745f54797065735d2e786d6c20a2040228a000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ac54c96ec23010bd57ea3f44be5689a187aaaa081cba1c5b24e8079878925824b6e51928fc7d27665155b108c125516ccf5b26f33c18adda26594240e36c2efa594f24600ba78dad72f13dfd489f4582a4ac568db3908b35a0180defef06d3b5074cb8da622e6a22ff22251635b40a33e7c1f24ee942ab883f4325bd2ae6aa02f9d8eb3dc9c259024b29751862387883522d1a4ade57bcbc5132335624af9b731d552e94f78d2914b150b9b4fa1f49eacad214a05db168193a431f4069ac01a86d321f0c33860910b13114f2206780062f23ddbacab8320ac3da787c60eb4718ba9de3aeb6755ffc3b82d1908c55a04fd5b277b96ae48f0bf39973f3ec34c8a5ad892dca5a65ec4ef709fe7818657cf56f2ca4f31781cfe8209e3190f179bd840873861069dd00debaed11f41c73ad02e809f1f4563717f017fb940e8ed438388f9cda009777611791ae3af50c04810cec437268d8f68c1cf9abdb0edd9da2411fe096f10e1bfe020000ffff0300504b030414000600080000002100b5553023f40000004c0200000b0008025f72656c732f2e72656c7320a2040228a000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ac924d4fc3300c86ef48fc87c8f7d5dd9010424b774148bb21547e8049dc0fb58da3241bddbf271c10541a8303477fbd7efccadbdd3c8deac821f6e234ac8b12143b23b677ad8697fa7175072a2672964671ace1c41176d5f5d5f699474a792876bd8f2aabb8a8a14bc9df2346d3f144b110cf2e571a0913a51c86163d99815ac64d59de62f8ae01d54253edad86b0b737a0ea93cf9b7fd796a6e90d3f88394cecd29915c8736267d9ae7cc86c21f5f91a5553683969b0629e723a22795f646cc0f3449bbf13fd7c2d4e9cc852223412f832cf47c725a0f57f5ab434f1cb9d79c43709c3abc8f0c9828b1fa8de010000ffff0300504b030414000600080000002100d6a36d2df5020000c80600000f000000786c2f776f726b626f6f6b2e786d6cac55db6ea330107d5f69ff01f99d621370022aa972d556da5655db6d5f22ad1c708255c0ac6d9a5455ff7dc7a4a497bc74db45e00b638ecfcc1c0fc727dbb270eeb9d242560922471839bc4a6526aa75827e5dcfdd0172b46155c60a59f1043d708d4e86dfbf1d6fa4ba5b4a79e70040a513941b53c79ea7d39c974c1fc99a5760594955320353b5f674ad38cb74ceb9290bcfc7987a251315da21c4ea231872b512299fcab429796576208a17cc007d9d8b5a776865fa11b892a9bba6765359d600b11485300f2d2872ca343e5d5752b165016e6f49e86c15dc141e82a1f1bb9dc074b055295225b55c992380f676a40ffc27d823e44d08b68731f81852e0297e2f6c0ef7ac14fd242bbac7a22f60047f198d80b45aadc410bc4fa2857b6e3e1a1eaf44c16f76d275585d9fb3d266aa404ec1b49965c2f02c417d98ca0d7ff34235f5b8110558fd3ef507c81beee57ca19c8caf5853986b1072070f2783d2c80fed4a10c6a8305c55ccf089ac0ce8f0d9afaf6aaec59ee41214ee5cf23f8d501c0e16e80b7c8596a5315bea0b6672a751458266f162d268234b08c1e2fc6ab6383fbb5abc52253b3c02ffa04b965a673df076c768377eef39105371a7bd0ba31c189f4e7f42fcafd83d6403729e3d1fd65308f7e0f7e3b83fee93f160ea523fa46e104db11bd190b8d104d3f93c98d271449fc00b45e354b2c6e4cf19b698090a209d07a633b6ed2c04c78dc85ef67fc4cf976bfb774d677bb29eda5a7623f846bf68c14e9dedada832b949904bac821fde4e37adf1566426078d44810f4b76ef7e70b1ce8131c13d6c95af7ccb2c418f781a8e82804edc1e19f96e300f0237f207737734c7513008099d4fe62d23ef15a5b66a02b5b677aa56e957b6921228cfb6b7d185b18aed1eea34236df6bacf5256a4a06cdbb50b2382fdc8aee05bf3539bb6075109a047023cea031317cf7aa11b0c22df1d043ddf9d04537f16f667d3d938b4f9b1553ffe1fb5afd576dcfd4e2ccb9c2973ad587a073fa14bbe1a330d4ada39047c41881d6baffb6af8170000ffff0300504b030414000600080000002100813e9497f3000000ba0200001a000801786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c7320a2040128a0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ac524d4bc43010bd0bfe8730779b761511d9742f22ec55eb0f08c9b429db2621337ef4df1b2aba5d58d64b2f036f8679efcdc776f7350ee20313f5c12ba88a12047a136cef3b056fcdf3cd030862edad1e8247051312eceaebabed0b0e9a7313b93e92c82c9e1438e6f828251987a3a62244f4b9d286346ace3075326a73d01dca4d59decbb4e480fa8453ecad82b4b7b7209a2966e5ffb943dbf6069f82791fd1f31909493c0d7900d1e8d4212bf8c145f608f2bcfc664d79ce6bc1a3fa0ce51cab4b1eaa353d7c86742087c8471f7f299273e5a299bb55efe17442fbca29bfdbf22ccbf4ef66e4c9c7d5df000000ffff0300504b03041400060008000000210083d51b799d0e0000ec54000018000000786c2f776f726b7368656574732f7368656574312e786d6c9c935d6f9b301486ef27ed3f20df07b0218444a15593265aa5699ad67d5c3be69058c598d94e936cda7fdf31e4a353a529aa041c63c373def7f8787abb5775f00cc64add1484863109a011ba94cdba20dfbe2e073909ace34dc96bdd40410e60c9edcdfb77d39d364f7603e0022434b6201be7da491459b101c56da85b6870a5d2467187af661dd9d6002fbb9f541db138ce22c565437ac2c45cc3d0552505dc6bb155d0b81e62a0e60ef5db8d6ced89a6c43538c5cdd3b61d08ad5a44ac642ddda183924089c9c3bad186af6af4bda72917c1dee0c5f04e4e69baf957999414465b5db910c951aff9b5fd71348eb838935efbbf0a43d3c8c0b3f41b7841b1b749a2c3338b5d60c91b61d919e6cb65265b5916e4774ce7cb794ce3c162b6c807e96c980f66395d0cee668b84b151c66679fa87dc4c4b893bec5d0506aa82dcb1c93d8d4724ba99761df45dc2cebe18078eaf1ea106e100b3501238dd7e84cacda1ae0b326338f34b6bf528b8dfce31f6f9f9f593ef51fcc84ffab65e69fde4f10f088a5189edb05e09174e3e438fbcc30ad99f476d5e5674d6f5727cd2b8ec0ec267139450f16dede6bafe214bb7c1b4211d8db37c3424a7b52f7af701e47ae3d0080b71beebb24979b8072bb0ed5156980c7d4ea16b4c80cf40497f7eb16df9be8bbb1e4e6998d32c8d338618eb0ede3c0a175bebb43a0aa04752cfc0d58e81f1c46049980e137a3502b7bb43603c21d29065e37f1914d5aec0baa5f43effab293d02311e816972a9da55b6d07e5f9a2cc92f9817b53f52ba62445d5dff020000ffff000000ffff9c5cdb72ecb611fc15d57e80c501ef2ee95445d0437ee394a28af3103b659d38f6df870406cb41cf00c4f215dbc0f61020ba6708f2e5eb97cfcf1fefdf7f7cfff6f2fb6fff7bfafdf5e66e4f5ffff9feebd7eb8d7e1e6e4fbffcd89aa6dbd39f347cfff8f91f7fbd7f7e7d7cfeba35763ff5e3eddbcbc7dee76f7ba7d75b7f7bda7ef8da5afff8362e2fcf7f7c7b79fe60c89b86d030e7181f31b318c6e588778de8ee88e72d827b181b1719469dfe0e7ebd6dd1dee94fc7b021c2370d1957601f21cbed99437e8f0dd3de9071dbfea89ddb0e066e049756436880cbef2346908b0d9adcf808b91d0ce460c6de348406bc721123c8c5064d6e5b886a716ed8faecee9d80640f575043688415e02346908c0d9ae4b67edba7770703b901c869088db0047cc40872b141935b1e21b78381dc08e434844658023e6204b9d8a0c9ad57a677ef04242720a92134c212f0112348c6064d92ba2b2c432fa009dbdf9b81a1115683679020ca2d06537a64b269470343dcc40d0c8db0243c8324c338b4c110d4a67e2353dcfdb37d1ab69237034323ac07cf20c9300e6d300421097a78bae590968b1915c5c0d0888ac820c9b4a42af490ac04743edb33ea8a8121d475cf20c9b0242df490b604343044713130a47499419261495f0804e6643d6ad9985159c288791484e6c23348322c890b3da42e010dd710e5c5c0d084fac220c9b0a4300412d378c7682199516bc2c8782d516c18249996e486406f4e665babc88c4213464486a8340c920c4b5ae32cad3977e37bafdc8ecfa83561e41c43136a0d83aa863cfe9784141cb90335dad7c532ff74ba97867eb0865572a1b58b26d4251e685b0d779b0f53f3ce90ed0a1f90638e3313efac4489c68678b48acda86261705c47a8620ccae2019179674c16d0b114f2801e4a999c56b80515cec0106e909e41d55929499e03c96bdb6a42affce22e287d068666757ba4a4aab2a092160ac8b1e8f2eb0fead8188cceaf16544967e460b8b97a0655e721c9a608e6b82679309732b5bdd00016744141353084fbb067503598a4b0229863c7c88301cd6dac89448194459105b5d7690ce156ed1954dd85e3382dbbb0a1ce4dbbb0d6e705f5d919c9e0a46a3c291b3cae3b5c95771e27dbb48e1d3f9f1a23656c0a478bf98262ee8cb471c2ba0a83aa2b2da9bb5869c7869f57ad0cbd1fb7b693f255d46099172da8f7bdc6d0a42a5811540b86c7917333944a7086e0f70d82df6b315f50f00d0c6186e519540d2765a662351e5a90cf8d21f8f3a97be9b5da2fa8f606863019f30caaaa3d63b2c939c4208fc6c86b1b569a56fd55554a35866674e97d2a9696a59321593005e9ec2d1f706a9343afdc02afe8030c0ccdb80730a8b6411b90d25d63d880a6bb468bfc8a4660abd8a3be127a4fcfa0ea5da38d40c125f7860f685866da07ace803c2c86091d1817a065563d13ea060037ac30634c4a2cbb72bda803032c682293883aab1a49cfcb8ab0a66bf376cc0f9639ed00bee1834010686d0917a0655ef98e8131a2c4d6f7880ad7c7faa9a5ade57b40061689c18cce719549d186d018682731e0c0b40dd6934a15bce74450f6060082da967502d1a86643b73e19e192e7a80d00fc2410f6060083da96750351ced010a6e7378a85c1dd010034abf812134a29e41d518a2cdd80bdbf7ca45c1630e86f2ef65e6bac70cbd5e6fe3fde9e6dbbde5f8471af0de60d0b6fc8b3517866c14d4735243d61b98c6945b324d2d922926f3430455994688c5d410ed06a6514625d3d42299621d6b88a02ad308b1981a82dcc0348aa4649a5a2453ac500d1154651a211653436e1b984609944c538b608aa6d50f1154651a211653434c1b984681934c538b608ac9821f22a8ca34422ca696549edffb51bd24d3d42299aa23071154651a2106d35dbff151fff9350dbdb25deade2299624d824135a60cd99e76e12e351a1247e4ce0bc1a123988b0eb3290b84598a67504d2018926976c1b38f46a2db9281847e180f26541608f314cfa06a3ce981ad98d74246351a8237b5cc8f91c876ea788b01c25cc50706dbd38e8a0a32249b9f82771f2f65bba1173cf0e930a9b24098ad7806d5ccbb01294dcec57477d4292875985759a015e59441fb298aa247b1062a9489464360f7da7add5e855e78ef606a65813065f10ccad61a3e15628c71f8cbd0dca65b5f27b9d46132351a20cc513c83eaf4759a2bcebb6565aed190e6f3a25de885b381d994055a51031954bdf3a35acb3b9f0a45bbd190ef86b5a5135dea30990a4343c8ab3aa71747aa461321593485aadd64487c4bed3ef4c3d9c1c4ca00391457cfa05a3c0cc9e22964ee936104ce6727f48268085d800552b3c3a06a343ad5a5d2ec182ea0697674c19b085dc0a441aec3821783aaf16817200e97663bc174a9e01d7ae1eca00730400e8d826750359af49c5b789a425d65baf4e43bf4c268d459d898e5caa7490e8d82e791aad1e847df54709c936102ceab91a117381a420b60801cfa04cfa09aa331200547335d2a79875eafb76c9f21340006c875e8671854f533c640e2bc737edf5cb40493166912f31f4fd51b2087bec133a81e90f16f05fb3c1996a061b14595964ff389d01284a1f315e93a4c3619545d6cf1cf1a6adf93e1085a729bd00f7702f40406c8a171f00caaee048627285458e74b0fc0432f8c061d8101721d3a1c06d5a2614876a7164aadf34307b0031aa270e8040c9043bbe019548d423b01f15fd90e301b4ea0658d857e180f3a0103e4d02e780655e3d14ec01532b4d970022dce26f4c378d00b182027ec7cd8f63c83aaf1682fe00a59c16c7881f3c75fa11746835ec000396118399af363703c8ebc67c42b2cf96a032f50cf9bf75c0e4e8c91532fd0689043a3e079a46c4e306f668cf1ca0f68fe09e958f3960e8b1c6afdac410e0d8167509d741cc8206d287bc3ba31b27887a9feac410ec5df33a87a176859176f17e5ebc690f596d2c51cb5369f0c147603e450fd3d83aaf1c43f93f7812be45fb395eb6f1d4f965694dacca638d4f53034d814c2ca05836a36c580143cf162c8fa791926f4c22d0a65dd0039425967506d6a18926d5185a9592e3ed40efd209e1e05de003974019e41d578b4c0f705415caca3eca725cbd00ba3417937404ee87214100655a3d1f2de17e47031e4fddcdf875e904c8a7f88e98a01724295399aa8dcb51b87c769f0f7cb256d0fbd706a50db0d90139b1107a3b51d4febf238d99e56f0c38b95e79f2f3443e37bd4f830741eb24323e019545d68fab9821826539cc548f45b1427f4c3d951efd51af28f1ec1f348d57892fa1f3525f14a691ecfc54c7f311c418f8ec00039b40d9e41d578b4231097258fc77004e7f5d8c5f0033dfa0103e41c26fa0caa4663f881428d6cb954fb0fbd70ada11f30400e4d836750351a9de78b8b92cdcd7ab1f61ffa613c68090c9073680918548b8721992528d46357c3129c1b9cd00ba211a7e9a3e8182087aec133a81a8d91f117aa306bf104c0c77fbf7efcf6efbf7ffeeb9ffb4b30db88753b1a06c200d123182027ac4a142206edeff2de9fd2a212258c3c0427dea8ce1720b8849338d253fef46d8fb7553ff7773d966219b4bdde7bff26486ad2a7dd5690fa1346a94a7f3032eaf6b80dfbf027dbc44946c5536deb43a97840ef737d3032f26edc4a3d77db5e303eae119f5ed3676dd6a2e43eba308d147cc05a4ef837f014e8093d83ea0b33fe5b763a537c94205f98a0c227cb2069ef71d18dd4bbc763996b0465cb809b8c85093a7ac228e9e7c1482baa43ffe6d708ca96013719cbe0526ebceadcd8f54a3b2c10e6c63c52cde21b90426e1c0e77b77f3026c26155e2b9dbed5322fa7d2f870b7cfb96487ae1eb7eefa526ebbb27979e6f53975ee7ba2f88a3493ce8848f29254cf69d93a46078048fba4b196cec8697527d05230c8e2848dbb74b1933d48c6f4a5a35df87d4873a436c06cc186c141e734ea88c67aa356b9e46fa797e0a733b8815aab2e2c0e8d1744cb953df814aa8f5d082d464ad47239b6c2117d52523979a2439bce9a98ba88c5cca16f5953394aa855c548a8c5c6a92e4d47762ba88cac8950abfd45999deb6f19d7c002374cb4ed7c691f626494e7d6e873b66e4521e77bf72cfc7b7e8fe0f0000ffff000000ffff6c8f4d0e82400c85af32e901047f0685009b61e3c2952718a5c044a0a494787d07127421bbbe7e79ed7b69875ca3c1b61dd593a65e32d090a7dfad62ac32284e87a4d02104ff24f624d69b24f2e4b2418cf7984d8f89234f164ff00b96a783adf166b976fda85aac7cc8707706c5ae6ed6596858b61ad48344a85b5583b6449ed511544524abf065e6bb77946950c40e7bb1e2a8cf602016b64efc87c49519f0b5dccf3d8237f16b6c1025ff000000ffff0300504b030414000600080000002100c11710be4e070000c620000013000000786c2f7468656d652f7468656d65312e786d6cec59cd8b1b3714bf17fa3f0c7377fc35e38f25dee0cf6c93dd24649d941cb5b6ec5156333292bc1b13022539f55228a4a597426f3d94d240030dbdf48f0924b4e91fd127cdd823ade5249b6c4a5a760d8b47febda7a7f79e7e7af374f1d2bd987a47980bc292965fbe50f23d9c8cd89824d3967f6b3828347c4f48948c1165096ef90b2cfc4bdb9f7e72116dc908c7d803f9446ca1961f4939db2a16c5088691b8c0663881df268cc748c2239f16c71c1d83de98162ba552ad182392f85e8262507b7d322123ec0d954a7f7ba9bc4fe13191420d8c28df57aab125a1b1e3c3b2428885e852ee1d21daf2619e313b1ee27bd2f72812127e68f925fde717b72f16d1562644e50659436ea0ff32b94c607c58d173f2e9c16ad22008835a7ba55f03a85cc7f5ebfd5abfb6d2a70168348295a6b6d83aeb956e90610d50fad5a1bb57ef55cb16ded05f5db3b91daa8f85d7a0547fb0861f0cbae0450baf41293e5cc3879d66a767ebd7a0145f5bc3d74bed5e50b7f46b50444972b8862e85b56a77b9da1564c2e88e13de0c8341bd9229cf51900dabec52534c582237e55a8cee323e008002522449e2c9c50c4fd008b2b88b2839e0c4db25d308126f86122660b854290d4a55f8af3e81fea6238ab63032a4955d6089581b52f67862c4c94cb6fc2ba0d537202f9e3d7bfef0e9f387bf3d7ff4e8f9c35fb2b9b52a4b6e07255353eed58f5ffffdfd17de5fbffef0eaf137e9d427f1c2c4bffcf9cb97bffff13af5b0e2dc152fbe7df2f2e99317df7df5e74f8f1ddadb1c1d98f02189b1f0aee163ef268b61810efbf1013f9dc43042c4924011e876a8eecbc8025e5b20eac275b0edc2db1c58c605bc3cbf6bd9ba1ff1b9248e99af46b105dc638c7618773ae0aa9acbf0f0709e4cdd93f3b989bb89d0916bee2e4aac00f7e733a057e252d98db065e60d8a1289a638c1d253bfb1438c1dabbb4388e5d73d32e24cb089f4ee10af8388d32543726025522eb4436288cbc2652084daf2cdde6dafc3a86bd53d7c6423615b20ea307e88a9e5c6cb682e51ec52394431351dbe8b64e432727fc14726ae2f24447a8a29f3fa632c844be63a87f51a41bf0a0ce30efb1e5dc436924b72e8d2b98b1833913d76d88d503c73da4c92c8c47e260e214591778349177c8fd93b443d431c50b231dcb709b6c2fd6622b805e46a9a942788fa65ce1db1bc8c99bd1f177482b08b65da3cb6d8b5cd89333b3af3a995dabb1853748cc6187bb73e7358d06133cbe7b9d1572260951dec4aac2bc8ce55f59c60016592aa6bd6297297082b65f7f1946db0676f71827816288911dfa4f91a44dd4a5d38e59c547a9d8e0e4de03502e51fe48bd329d705e83092bbbf49eb8d085967977a16ee7c5d702b7e6fb3c7605fde3dedbe04197c6a1920f6b7f6cd10516b823c6186080a0c17dd828815fe5c449dab5a6cee949bd89b360f03144656bd1393e48dc5cf89b227fc77ca1e77017306058f5bf1fb943a9b2865e74481b309f71f2c6b7a689edcc07092ac73d67955735ed5f8fffbaa66d35e3eaf65ce6b99f35ac6f5f6f5416a99bc7c81ca26eff2e89e4fbcb1e5332194eecb05c5bb42777d04bcd18c0730a8db51ba27b96a01ce22f89a35982cdc94232de371263f2732da8fd00c5a4365ddc09c8a4cf554783326a063a487752b159fd0adfb4ef3788f8dd34e67b9acba9aa90b0592f978295c8d43974aa6e85a3defdeadd4eb7ee8547759970628d9d318614c661b517518515f0e42145e67845ed99958d17458d150ea97a15a4671e50a306d151578e5f6e045bde58741da4186661c94e76315a7b499bc8cae0ace99467a9333a9990150622f33208f7453d9ba71796a7569aabd45a42d238c74b38d30d2308217e12c3bcd96fb59c6ba9987d4324fb962b91b7233ea8d0f116b452227b881262653d0c43b6ef9b56a08b72a23346bf913e818c3d77806b923d45b17a253b87619499e6ef87761961917b28744943a5c934eca063191987b94c42d5f2d7f950d34d11ca26d2b5780103e5ae39a402b1f9b7110743bc87832c1236986dd18519e4e1f81e153ae70feaac5df1dac24d91cc2bd1f8d8fbd033ae73711a458582f2b078e89808b8372eacd31819bb01591e5f977e260ca68d7bc8ad239948e233a8b5076a298649ec23589aeccd14f2b1f184fd99ac1a1eb2e3c98aa03f6bd4fdd371fd5ca730669e667a6c52aead47493e9873be40dabf243d4b22aa56efd4e2d72ae6b2eb90e12d5794abce1d47d8b03c1302d9fcc324d59bc4ec38ab3b351dbb4332c080c4fd436f86d7546383df1ae273fc89dcc5a75402ceb4a9df8facadcbcd5660777813c7a707f38a752e850426f972328fad21bc89436608bdc93598d08dfbc39272dff7e296c07dd4ad82d941a61bf10548352a111b6ab85761856cbfdb05cea752a0fe06091515c0ed3ebfa015c61d0457669afc7d72eeee3e52dcd85118b8b4c5fcc17b5e1fae2be5cd97c71ef11209dfbb5caa0596d766a8566b53d2804bd4ea3d0ecd63a855ead5bef0d7addb0d11c3cf0bd230d0edad56e50eb370ab572b75b086a25657ea359a807954a3ba8b71bfda0fd202b6360e5297d64be00f76abbb6ff010000ffff0300504b030414000600080000002100bcf182b330040000e61600000d000000786c2f7374796c65732e786d6cd4585d8fda38147d5fa9ffc1f27b261f101610a11a868954a95bad7658a9af2671c0aa6323c7cc84aefadff7da4920d301864e8732e581c4cecdf1f1bdc7d7f11dbd2f738eeea92a981411f6af3c8ca84864cac422c2ffce62a78f51a189480997824678430bfc7efcee8f51a1379cde2d29d508204411e1a5d6aba1eb16c992e6a4b8922b2ae04926554e3434d5c22d568a92b4302fe5dc0d3cafe7e684095c210cf3e414909ca82feb9593c87c45349b33cef4c662619427c30f0b21159973a05afa5d92a0d2efa90095aa19c4f63e192767899285ccf415e0ba32cb58429fd21db80397243b24407e19921fba5ef068eea57a2152d755f49e99f0e1f12893421728916ba123dc03a2c605c32f423e88d83c8208d756e351f115dd130e3d3e76c7a34472a99086d081e76c8f2039ad2c6e086773c58c594672c6375577603a6cb46bbb9c81ef4da76b78546c5ae378cf8d73ad18e17b477904c8ccb00df916a85acc231cc79efd1998dd0c4e443e0feafc00dffdce3e91ea23501b892a82479c3063392dd027fa80fe913911df3bda06bd76b4bd141041c6f9564f1d231de8188f60e169aa440c0d54dfcf362b108e801c5109c0da3d63bd5064e307e1e92f1492b3d4b058dc58b9d6938de1e75921cceb074ca4b4a429ac81ae456f1136eab4e4ec05e638972a85fcd7ac9a10f0abaef188d34c43f0145b2ccd55cb15fccfa5d69023c6a394918514841bc1376fb4df84bc092932c27a0929ae5961df333343d4239c646fb9582a279903e586f149f6d5e47ebbb95d3e1a6f48185b2a3f1df15ad6b04812caf99d91f3e76cbb52cc56526648acf338d71f60b1c1b78349fccd2dacb2fab65a1555c3ac96365a85dd86edbf081795d9768043ac7c20b89fd5f66d44562bbe319ba5d906abd635670b91d3aa6b3c82ddb06aa2a554ec2b989a6dd42c646cbea4344b4c3b017b5aed866576d85117a0841e1459cd68696768c2718c5f77e7b200a35d208177e3f07d2e335bc3ce81139b625fc7a13fc4be7320e0cfb0bf185f70f15e81be55be87d4fb56f95e4ecd753a789a20deac9e5f87f1af54f4eb30fe959a3e2f63d88f8fe5e893b6b5f33204751c6378b13c7c4803b09ffc567c21dfbd49be87f6e573e8e1bc99f71c8a382fe37368e2c718dbef7ff8e26f1d2b1e1d2ab6c703642a3811fe644a88bc25e5f99a71cdc49e030560a6e5ee88628b02da9403ede1653b0a64c6946664cdf56cfb30c2bbfbbf68cad639a8b1b6fa9bdd4b6d2122bcbbff68ea027ecf5418e06bfa63010779b8a2b56211feef76f2e7607a1b074edf9bf49d6e8786ce209c4c9db07b33994ee381177837df5a45c99f2849da1a2a1c31fceeb0e050b854f5646bf277bbbe08b71a157d5b1f01da6dee83a0e75d87bee7c41dcf77ba3dd277fabd4ee8c4a11f4c7bddc96d18872deee10b4b979eebfb5511d4900f871a0a549c8926564d84dabd1024681e9984db44c2dd15a8c7ff030000ffff0300504b030414000600080000002100e755a1888d2a0000ca7b000014000000786c2f736861726564537472696e67732e786d6cec5dcd72db5876de4f55bf03ca8b8c5c25516ec96eb73b6d4fc994d5d68c246b4cb9bba75259802428a24d021c0094cc5e4d551e219b6497caa3e451e605f20af9be73cebdb8200099dd3553b3492a3323930470efb9e7f73b3ff8f6779f968be82e29ca34cf5e3efa72f0e4519464937c9a66b72f1f7db8393bf8fa51545671368d177996bc7cb449ca47bf7bf5c56fbe2dcb2ac2b559f9f2d1bcaa56df1c1e969379b28ccb41be4a327c33cb8b655ce19fc5ed61b92a92785ace93a45a2e0e8f9e3cf9ea7019a7d9a36892afb3eae5a3e3e3a78fa27596fe799d0cf593a3674f1ebdfab64c5f7d5bbd7a8fdb161fbf3dac5e7d7bc84ff4d3f3cbe8e5793649a7495645977116df264bfe7982cfa393b24c1a9f0edf7e17bd1ccee3ec36097ffc07fef80f597ebf48a6cd6fde9f452fdf275810f679b65eccd285dc7d74c12b464971974e92e822b94b16c1fd06db8b1ce6cbd5228db1acbd3f1d5e3ddefefa4fdb1f5cc74595c68bc5266a7d355c9755be8caa799194f37c312da3499c45e3249a26b3344ba611081ea5d934bd4ba7eb781165f93429239c1c3eac9262164f9272109d2cca3c8a174951f9eb2779364b6fd7056ec15f57457a7b9bf05fbca17f5c74172f408c88744d33bd058e0fcfabc03aad8d8ff2455cfc80e594d1aac8b124594b94aff8eba8cae53eb78b7c8c952e848ac1c6e232ba4f168b08ff1b6ca8f533aeaf7397db540d17b3882b7266cfaa72884281c5462bf7bb6a0ee1507a933aeb1204df64f1329d44e3b85c80f2c1910c7e982719b6b648261508183cf73ee57ed638c1b84a2772c2a4246e91f01e256fe20fd66fac45d6139e1cc93ec381e14ea025ee95df97d1265f3bb262c958037692569b289fe1d6899e5778fc513ce1e52d2ec2d1a49950281ee7eb4a2e4e9d98e14b1c647a9bc5dcde0a94c102c82549bc7c8805e638c918cb5e420f8042657a672b829a8996c904729996cb7ddd0b3f8b4968dc97cf2377cbb58be493ee83bf58e4b73802522a892773e15c6e79132df32cad72f2ef32012f4f5406f05d0696073562dc92c23b105a7649016f1a47259eb24884c1b8c5db225faf78bd72dc9a5f4713954970386851a5266f7a7fbda21c9c57583484ce8bc15d5ca4f91acb92b3d4638816e9c724829e4b29b8553a038ff078f6232a57c8500e3594549387884c755024934942ea96d97205518e71edac80dad035292d8af5022bddd21ee4c46944d9c44511183ce1ae3f269bfbbc8010e3244c3180d4c64ddb62769a54583f192307b34fe32a8e52280c3d0c12f5393edc40095d3be18200e5119903e6617150a57828af256967495c4127f1c19378257f4ed61011a852d8a32a2d2146e543e4303ea00a71ea4fd8c5917f1517d824be2a95f8e75787ef3edc44e355b94fce9ef049eb2a5da43fdb495ca6d9e165fce9f0e4ee567ff5a628725c4db5304dcb490c3a0da20ff525d8d52a0f14ed6d9225105a25b35f15c94c9e3235c8bb09bfe02896eb4595aec084f9f827689452590ad78f376dd66bdb1e634e23a83c104abc8be3f1acad25d4cb13b5fb30a1296fa5b1d883343eb90383c46310b5da80b541b1fb18673cc7e957f3fdfa996350e13e9de2b36878fde1f03259e6906ce8c77c8d83c101511476a2b42808e8875a2b40398b25ef30973c0a289b4a8ca59cab3b092ffd2a4787f552fb148108f4b888b30936b1c89d384f13f05dc505d82e7e91adba84d35425196e9a6047e099c09eae4bf85de41db1edd809046f05bdb9a031a24481a9c527e3c5c265c161a8b47abb53ef0fc7ba2e5423e3fe132826b09f0a2aec4b3e6d31c607518ce506924dd55e96f0cb4c0781b250261fbd2e52c723a2f6e76fa890a61048319d2a06d84a32fd65d6dc94ea47e7d3c959f36e0924147a872673b616db4773d8e30891125efa822b45181e543bde7180d15cace9f65cdd9cf0b0a074a3fb790a5e2cd72bea0578546a086630e030a1937996d3aae112619eaba43ac337fbd1883fd88f7eafff43d68f94ca30ec7047e47255df8d9b04de0749ebb4a850368b171b5cea4e043a7f0693f390947317bc8df8dbe96c433bc16be80c42892ec5b692e3c084ab1c6c0afe8e57707e95f3a9548bbccac18ff8f3fc3a3a85279466f85b1cfe02bbde8f6e8461338623b024704ef4233c292b976925ba9acb8795a3912b7a44c82d552c4fcdd9c74fc4fc5079c2a988a15b3fb7dffa9791f86fb2f74db82d4f05320cfc1ba899c6aef524477fbcd87f7b73733dda97c3fb135c359252948bf93701a922d572fb74b520b8e6e561dbc234d97a39a6cd120ec555944d7825e68984b7d9e150bd4fa22e9f4907b6327cfdc77c84a3847b0e7937e76110ddc093d4afae739cec2652930f773d45f854d10c82ff37f466a163960ce5c401355699e4f471570c1ab06aba14e2a99ab7ac3786fde78d278bb884ef3413bf761ec3a371610e9c65713ef93bca0a0901e7979adbecfcbe5c440a97099611cd5398dd6202d943b05115f88c04e303cc619367f25ee4e5397c16ddcee7d8a30e6c228487743679161ae1dca7b851a6bee90a2a90bbc58fb0426548ef6e9d5fef4727b59cec47d7500dfbd15b387cc22ddbdaef07f8c2946617b405ae932a52d3a11666f154f0f3b667095d8450854e39a33fd980d3c41d3a9d0eb8fcce9e5125886be1ca8863b85ec1d773bf801e081c1775960fa211c81e2f2d5a829357e430e3a23296f147920d226dde1d059c9102bd7db74b654c33147d14c113b00a2a6e0103a2abe165f4533e56078de084a8e078022e24ff21c6c6999851144eace2721b6520c4f14db942ecfcf2116217c42477c9a357aa59cf9bc1ad532ae6d7a71277c1b9a183e34c9cf0175959d083e6eeb6b7c5e517393d751ac562c928e87e1e57b2afd93a131316d39372d1928f52b8478a9e2819040490a4e8b5d77afb1a5bd98f8ce9933058f5fef934673402478df19adc88348bb34d7b1130a653ac117e395c5c2a432ab892b1a2ec42aed3074b7049c9f70636564f848eae484fb94d8b0f0c06ebddc8691911efd238ba4916b0643cfad1e8ed00e80c9eab91cc44984b6d0614938b2ac01338156ecd3fba45fe07dc0e0d67a96f6ed59fbf4fc612ca033309c216654867639788c54824014ce20c18cf7e945a6c388fa1dd8be420806252fcadca4d48858b5be15611df46ff142f57ff1c9d2200f58f86feaa09aa0172c9b0f84efd5e0504a02ee501c691585c4beaaf71d39c41e1d5e54882b471028d010776916f881521104b9770e78be8cd27530b4976971679469feb01f27181622c116501ec8ade5071af8ab44c0e404f78b565be40e4f530aa2467803073dba92c925bf0a0c7afccefa78a5152a97210af70b52eb8c107dd393e8607d014380881dd383a1f5dc3c8671ff7c1e66b7a28fb5109e50f7583bf666991dc03a0e187541db0dbba0aba26748cc1ac355026fe807be08dd94cba80d189f86ba09bf99182d361557011c5a3fe23003f2a824bc53eb05bb5d5de19f5a68afcf05ec25271eaa16b4fe3723ece118a09a011af343c83351c44e7c6e114268d73bcc822729ee7c00518e0ab3b0b963888de10c180413bc57faecf7f8b7d5334e679feb1ec802f0aa0bb0f6958810f678860087011b751a0b3cc6795c48d5001c9225fc961ea82e84053d151ef3050219835811cc2d7e529428323f604c00d9d89ad97343a35489616344c530407d8fb0dfd0067a7dc1a3e0c4603c8d914fec422ba5dc31f54f08e54959b91773b160726c29a26453ac6a24ce454404002feff35fe6b7c0868fb67e2ac00e29f3cc2bfe02ce3c658f812e6e74b7e529ce5d0ebf2939302b2c3cf66002361cce4c3237e7028b7ab5e5d89d9c44acf33389215b8938ecf48d07c623aca8a372ef0d84071821eb404b685d380be67444b84d9f646a3d33383b283e5ff2d97decd145e7b421aa83d03d17107149cc93f80e06f320b96859064ac806a6f46ff10a229a60fdefffbf3db9b4fe09f8ae8e3bb02224247f01c882fd07f7afb5457c2907ffdcb7f96d170c328c6c9dfde9b77d1974f9f1c7dfdf765ab57832f7ef3c56f045145beeafefe7e004b1317f7d43303f89c875501ccec80d05f523cf84315f683f1e64075cd81c7a6b62e831d582c6073e4f61382c402ed260753988609acc0e677c1a75712dcbdfcf2c5d7cfbe7ef1d5c1b13fb320ef7595bb18835a6738fa5e222002904c5e402cc640ed354458c1ec3b081121377c0f2c93418fa9a0fa330130e57aea31b1bdc8a1019c95284a809f0da3f6723da6a785801c210d9fef9fdb6770fc0f6a9cbf8ce8b4e16eb12e486f0779969bc3669c6005e0a25347a2fde8fbb4a868e3148bf5d919fc76747589088a99261a8921707f9c1e34e36e204d3e06d0003f0bc0859a8e3010d60488c496cecb502b383cbda6b3797181ffe5569c19f67709125827efb14fd89ae1c9a592c8e1e204ba9964233a2f298cc0a1e5a6e4aa774088e073e538337aabf0c7e97ca7d95d2c3914b72c405b596631b56e49e3583e6b2096ac3e067a5f9a87a213c7f420d30bb216b874b5957540bcc38d1f4cf139403fa0a758e206ae10e62194901e8b77d0107c8eed74490d71428cc0033075e01b8d5c33e5556441ab7b3aa7f0863c58b10b6cc8bd03178bc70c3d661edb22251dc1402481c61184c1b53168ee7b805c79b18fcc2f5005660037ab4441693d4f39bf77e7a78eb0720e5b0beab6711ed80b24d227c8c8ee415ed5115d64740b5374a7e7fc3441145556ce87223197e7b8dbe8ad2d9ba1b0646d243415ff27019f21b90bff416f2231007e8794b3b993d341740639483e2108010511e6936fe16f391984fa41de2ab840327aa6aa70844de77d6036aacef1fbddd6f95801e21670f1eb740043a792e91a826f2eb8960dd7a91f4924e0c02493607bae436206627263e7d583cda20fd761ea88800e91949a1d6511ea4612c10ad603f107ae80a83f679ef10146440806846f9d97606a9faf0a717acbde0a8c02d940f612e22fd82559d7a3e5d4c4a026330220363683acc93e8e8d6913641f808bc0e50d122e8021c520cb15b8d13cbd9d2ff01f026bb2510754b8d8204ab07d6cc99505c095953436d5e006160e310ad700af9c6a681b58af4b0aea2c23632a62b04ee89057b0cb101a022634a8dee3a4d857101d0b0aa118f6122e07b9cf121fc1b3088c18263b89914f6e075b16ba9408b00047e310747d722b98052c483f3f782dd95149175039300d20f11bb026d5008b44b7ae296b2631228483883510f229ea4fc401346424659189f8461a98005c413e1f610913d492947830e3c63490da2da44c819523d7ab813eb20b2ed3cd3b72ad016f904b80e03b9c7470a9e999481d1e98b2e4dea5856591bc54414b172cf227fc5b1fe273db0c5aaf915e426c31f98867f064c0560a8adb614aa6bf9590379c94e97666dbc5a398cd10be439c8deb85ea7a6787ae68a49c2c90dd1676a57319720da8e81d1fcdf16cc70e1d070eb7c84ea4751ae4e96d31be60c65e73f82e33eecb61bad2e50c85dbb0bfa4aba8bea4aa438b69f4c860a3edf6e4523a6e44440482f761bd470c8c3002c77aa8930916972da48f4b07093775b77312236e9caa7dd460d1710f2e3499ec22bf2123623f25a32bb07abe1cc36cf0b09de769825967bf91563126ad8867ce91b440665c10254908b0f640528c8224ab745b0a629f225424cc7f4375021e955a013d05e4c18048b4cea92e99619153a366c674b9980a9e9d2407c564259f686104a9840ea58c42707e8c007002b486c56335891ab79c7206e55dff884b1742e3d0e477b3827564b8c0f40a9204484d70979e6188b5d0ad91622acd8ca47484c91e46fb06e21baa458a6a6bd7ccd410b7abf21ca518ce7f14201768f647b29b55556c41c984450c7eabf39023e0c982afbe67da8d2006170095ecd584a44d0c50dba92a83797d3550caee30b8758ede55aba89748af62105da8151397d5b6b0c89143a05eadafd42be8e2f490941ce6e5c7816d010f9b80303f8b08657471c2b3b7b3c6866bb08b0033eee5960a428370fae386aff87b495cee037563e68b4014f803691e3d056e611f693482d346533b98f6997a58be554a84d8c0970c8571565d55040072a9689c80718dba226ed9970e34ca8f884f3255e2149d5b615d3148e5d194f4c60dacca6c97c4b273bd6ef21108321a22aabb7efb7a20e9736fa7033897410cac332ba9506d808494f32635e1d3fe1ac246045634406978264f708c7c1094de2df8eb1ea7e0d2d4d1deebefae5b159b81ffcd34735d07e2ce5c8ca81d10fc8f31c0c78f5a380642528b0b032371c03fbb72e8413210070610de25cd81086796052737f914f8b0b12f170acd9140ecc25c2bcb5e354b3305e246c62dd5da1ca9bad2f4055c28ad23428a800599746cf96bd6e7fd1651a9abe9486360f7cb075c2c5ffc08f3a2696b41b15de04d9456f46f333274f777a7623a0911f8bec4dfa8259070c685d9b9b8a917f106cb3c12521fd785072d360c2200a483ab082502ea64aa5a2991f782574a5dea5546a8f820386b6443347973c7a23e7121a15e5128cada1b2dac358ec3af9db24072903601f8464bcafbc2c276022cac2e05c8ce740ed285c6d8a3d13b2df2b1ac1dcdc1101945da832e27c24b18d082627ac02225b8cf6b3aac74f4e564f6de9f9c9e7f18d100de9c0c4f86a3c70a01693693f5c51637bafc6610081ad95ce028b009d9282c52b10decb938ff319f447ce5b8407a4c57b482cb275aed269ec41308c8fb789a4205ec356a6b1f6f4792dd54ed3ad820c8a06e13a2310deb4203a5a74bc06882969b13bf0457805598ac156b893078238222ee4022f0a894b26287c0df89ecb870bb23e3c9809ca510ae8a10fcc39a5e96ded02275259181663073be71411c604cf8e27a23579d9a7cb24f91295b6b9485633b4d3256764914a1302e560737da8abe261248c9aae1d7138a42e6ac4c819b283349b5ae44d0b091162b4a6132ee499f5eefce604c4ab1dc13da76a1185ce5db9f761f5ef43a9d526f832ca8289652519245ecbbcb5c3a4f86c1f2788df20b64e9d699253e58b32bd5982c678f5673842c2c10d1ac889417e35f96d509129b6d94e2d9e0f878f07af074106f9fa2ff66dcfbcda4f79b56e19bbf5bd27bcdacf79bdbde6fe6bddfa4bddffcd4fb4dab4fc3af7ad17bcdb2f79bacf79bbcf79b55ef377feefc6638f8b2c587b2687ed17da4fca6fb48f94df791f29bee23e537dd47ca6fba8f743838ea5bf451efa28f7a177dd4bbe8a3de451ff52efaa877d1c77d8b3eee5df471efa28f7b17fdb4ef317d323a84f4f61de8d3071ed377a04f7b69f3b497364f07dd323a1c3cebdbceb35eaa3debddceb3deed3ceb3dea67bddb79d6bb9d670f6ca75be570a3dd2a87df74ab9ce1e0ab3ee27cd54b9caf7a89f3bcef66cf7b6ff6fc819bf56982e7bd947ede4be9e7bd947ede4be9e7833e4a3fefa5f4f35e4a7fdd479caf7b89f3752f71beee65c3177d8f79d1fb9817bd8f79f1c063fa84f745ef19bce83d8317bd67f0a2f70c5ef49ec18bf619c483fff92ffaab02e8a0216dbd986a5d5e13bbf0ee2b1c21eb2733cf15fe1cea39d8b5f81d5b99f6a32ba40b0496d0a68a4356fb48e70370a75bc4a70888997c6471d396ddec76c8c658e1bb0c4524d270a0ee239f511e02fab0676cdf18982b014040c5cde0d34a657dba006d07ec78acebdae0b369f2427ad574a5bb39fd132cf3bd74408554acd33a2ca11678519a22f5cec47a5061077f384cce484724dd5bbfcc3043e1c98fae0396c7efb6bae943ab0b0f1701092266e0fdfee1002791f389d123c736104d50b8aecddd1eeef2d8be7c65a7736ff9e1a37743297703af691cad9e3698090ef5d1d34fcf25cc6838ead7a8a273a1fefda018540387e9b9cc83c34edbeef76bb8424752e38488c37ab55077a26d3ef66f6024f571eeb4ab13401d08395dff24cbf7b89ffd20ec00be8b9f6802e7ed054ade501060e1c387931bab42b30fa6f964cd3a35e527db227bff50e7a011c78ad5b2f8972383150aa2494a9f2080b1643bae466f84828097918e19ecc859ad6342a5e59fd72c9946e2e9a3d438a34723bf4748a58f9e002a7009241e16cee874e896d73a866e9dd07a684992f987da93fc02140a56aa383a102791123fa91beaa655e337bf76691255eb464f0fb053e46400e2c819b194ab79666e755240809661c6b980c891980060a6653ef828c96e511ee0293a6633f90abb05a4629d0b788e5610192990820a1857c06dad6d2310f5ebc4b15ce640c500552251e80564eb39eec40329915e5743f75c45ab8b9c05643bbfa98b1df5fae6511958d82519260cc01d76da12ed9e715239676abe568487d2488e73e2c16963ab165b125be371f07308cc2f239e59060fe3e29182794aa38322b828ed5d4a11ea7a2545cb2caa62c31725c6e6290003b4aff6eaef701fd4991649781c8aa3f10944db20ef92dc029bd0dcb0c9ee579ebc97704837eeba758a2d0143632ed430385a9b7404de097b24de5f9e1803f8ce4d68c005803f6db25370f846549f56eaba7e9af767d75ee7f76d31fab57aaca93089316192844196bec290c0d6b6c581ec99c5fb6504dea290606644a078f46e315673416a5a8a5b9e4e68507133f8554009c14b4a355208ed279fa7d22f15989d162b0318203048ffa2b7d41550bb5a75662a4d229a551880db1a46412d895d86521b9478ea47bfda4675684cc33dc9824015596cb213493e20f986ec9dc0b7b3f5a2a10e9dee0dcadde1ead1daa95ed34d1aaf780fc0ab22568c0b73d1eaa3274aba6d392fe5567158daeb1bb43fd9dde036a6d230a52a4b0bf71ab90247781aa036e95e6d6f058ff58b120cb68a519a00e5c5a671163584168595f1f96ca6756a5c996e514bbde00c189b32f56d6dc6324e81bc1d3650b0785e3da2ddd0daefa4f77dd1aaf0fa9c9b05eba9d307b4ef847319d66925057bce5bad9b1ed0408a6cb796db68391706cec88e1e6a03b14c8cf464d3e8e969eb5d7c132f8b6a33c0de22b552bff3cd17bff9df7ffb8f0856f03c9b15c81e156003c2d0c17af6d81d72117487b8e690ba35c43786482599b68548abc463bd7f771f88f8816cd1ac1fa63faf7b3bac3328eceeb0d22e6d5b823bbe0d87d2ce826deaae1f0936dfbdb974e22ff503e7482d1d3d7f72fc54eb5a2f2fcf239d83731c783ea66f61ea24452a59086dfab39e4bef264153b315ac5927d882001a4b6bc5c0755d1e9fcb9a688d8aeaaa577e3e5e2fd07cee0aa5b5f6154d4c1a4b4bb6c2f59f49b71a8a4c35f5092d66f167501ce0bff2191229ecad5382d60a5017487751bbb5138a5f1d8bce50a837af8b93990b93124bee86194f1104ebaef7ed479727c3c617282d906468dd96a4d953b0258a2af8dda9a7894b37efa3b013c6004317dadf499fdd267b87563d0c57f152584f607237b17a677ff3da86340b90e9edb00a72dd2edee1b177d2a8897a342b83917473a53408387d51368e86d4350b3d88b801f6d8b1ce0a674de27ef7e19cbb03599119434b8fb2068c9e071e744f5670e05947662ab1081235561913c25497acddf4d9ed3cb35ae5f61e6b0a8b14488f0d8506b54da899aa985246c9b794d4ce36bc31776156d0ea349dd761feee2de248f45e5c5b9dbe74d442ca6ef322fd9955bdd8b1cfdb5be197d6b16a8b9aa809dc0125ce22249c348122222d806e49e64963a891d441d64531ccc8b971075a7dcc3e789435601f283fbe94bfdf5d1fa3829ff5c8bfbffc119fbe3bc12fdebf19ddb0870cbf3d1d4aa5b2acc55a3d03ebca8a58974caf8b37b0c5da1394eeeb9a6a9f67339e386bc299b277d5ca630651bcc97591621e997690012941dd18ff25bdcd3872c164deb30c12dff0ccb5b00dbe0449ec8a5c781ffb1ef3ba185db2bc989f126e0b7b23a406530a65797d003f3dac227ddd4430f4e32123e833a501cfa3cc5539d97f690111953aacde348d5b8b80ecd7e62304d89acda34cb9e2dc1e6a206dddfa0c9dfb1271d5f569ae8b17480c6a463baa295e9d74b488d65b0c9a45ad9cab6dfea4c2c9f755369ca06617a9d68934f66f85744e912ce98eb86275b5cfb3b5f80c0d1f04138424c44575501d02eee4e4d6aa64c730c120e2b2e5976d2b5e27c436b2ad0697a583c45b51ed140fabe46dbe4530c7cdb54a054374ea894edbc3e03ab9bc651124b74fa68c175472d51c782b6d7545048f5215b0be48dacf49416be010f266a5ce6ecfc4e0b6d9812ffb6e3e780a93c2fa5d1befe6304c633c54194c5879a1ce7630f78e632950bf81418b32abcc4fb70b35ec6eeef699688c602a62aff3c17620a7ea64f88e0bf15d4b8096e9b3c2669c3128404d047a49b5a609153a2c7fd50141d9062325e0ff06f1aeb3b5bb3cdd812d67322543ecc329dae45060e567a1bdc5d843351c7545b43aa18d8e016b6196f90e18cbe1a60ec06393f96654bdae7d410b7405f9c3341b99b1457619b308cdd5eaf97f6085ac71ea6818f7d21250d3ed47aa23c1289c14b9a78a0a04a7eefba49f3e46cac486f589b0480d30aac5a90550763c851db272e9e6fc40913c1dd5a7b66d7b309f410b21fa1ee899dd18a94f0f781c97a91474f013e7f4dd1392ef405b15844fdadbb83c29ffc6b820cfee1d81ed1cc98faba094d5f79677665804eddb6d17d60e1fea8dc0c48bd20a27534a6bb81d894e7cb2f97c1cf88693b1568ffa002cffb41b1231c32edbb9bceef5a81a938c9a1ff1c3749270fd84da072a8fffae276dc1690b946d9091527474b7355a59d76e04abd1587d04c710ae50cd0965862924ec80699917b809361354561f743888fae0bc4d6d01905c562a4df3564ecf9c2414a554fb77f5656c73acab7327134af0144c45ecf282b11b1cbd980d4c5bcdd521a35faf94f6dd933ac5b3cb01e2ce50ba2f52300a34958f59588ae76ac5e9063925c78c81cea9b472497a002c26c5329c3af98991b29f4ea9fa0bc0842fffde4d20d8ace3109e7e2bd19dd309af0dec6a33261299122fd74d9410751c0e210bc67349d7136733e94831ba5ccf6c56a40caca5376fed0a30f20ba6c9046040cc0bdb05b30a02ec8c040e75d0105430e12f269f01e000ffd21945ea895b75be0cdf18d9380f0cf6f21a6dab8742b8d4753d594c262d24b4fc9247526cbdae5594e39429352cb204c28a0e6f1da6e29ded317204e843f5f3563802c3a5245d67a6e6a8d49514b79124e7b420edc5418b0c5cc80e4d6bd914e97fe0044e4e0cb5e70791b5ee04184e78cc6e360bbb11d96162f5a0ce89707cca853c44a5fa31d2d3b3d14580400c5ea1deb490db13436a7ed140c5a5b664ce40301088891ac7446c37960fb092ba11d425749ba28fe3711ac95d1f8e97f439f640b3d6a5ff6222f66d30ac1afab02840ac9f4c8f45785e4f8274b32183899082fb3123003c0b5346d1ae2a71d2147dc69f6002fd4cccc6585218d47c7d3b5fad51dc2a01bb9f0d1a9c5a3decb4eddc12330d233539395243872841f4746cb67cbe354c54c013b6a46a8b93a40e388652f00f6d90c1601fbae4107f3a34bc49c33c99bb1b1dfafe590b01b47785150e35a597ec51354e210892ba56c1ed6675c6027c9424cd0d2bb143d479c8ce0394f1596c82c73a0a4c4641790c05d2e67b3b906ff730b7a1e3c1cd2ee0f7a7076f14837fdac34febed374e17512d67abaa845b25890c11fc7f9eff1bf17ce078b9c33286096b7d6a015257d0bad17c1fd785f471b95eafd767a76e0a192a46507cc256454edea9d6fcf7f587704cb0eb4a6f8c0eee9af5bcedd9f4d9583f1ad0452ed44dd9818f63806a82a5a02bacb3279cbb2cf8269ad49a11711712aabd023272dbe8154cbd6040c3222a27ddae9f5c276f6f87834dd0680b347186ff8df45272aa2c4d7f335fe6e6ebed01c83d045ce9bda1432097886a1fefe61585b1c76e7eb2590d69beef6ac18312e2500d9b60150ec813cfdec01119eb173a71a27233048cc410accb1224acf59df698425361a036e6acb2e0cb8278d78bec9bf2c2fb2ad82d3dc7fe7b707949185c6ea233e1774ca9bacd07f371f526cde1bbaec134f462a99bfd580b7e612d1c9803cd9615298bd285910aaeb1446ac038a2806df4b805c00606dc7538ef9109db4d7321f503c941753fb235dc0b7e17eca503fdd7fa24d83b9dc24a53d1182e5a4aa3afbc686127000ec91371311f4cc475385fa13cdab93bdde5fc1ae7c6b0555a5c6729e5921c0507b34b5cbe15fe686e6387744b704a2c95748dc4fee64ca56cf97e20380d2c3aa869d07689db02bdec670e6b5296cd4650a3bdd38525ecd489c227233b2afc9e159c3e494646e507816328833a21096b14526a9265c9a9fbde72f7c3822e7be96450239b938b0b99cdac1520ac0e9354053ca8359ad84010695f262b165051488121b0d57a1f4c52e1c7be7845a40aa545008f6d64e1769d08bc6e49f623e92858c46721cc80baa83bcc31879170a49fd32b24d01707781fcb6a78c5e5ab07d6caab027e5146c571ea9013786db2861b60088172ef56d99379c08ff93844675a5ec7a1aab646732bfd4428370e98a7980894a771045cbb99c7f30e3cf017328f3a94db82e3fcd6b654c8d48580800e1bd701c657cdf9c4bfe4241c656e304e4846f5991bba879ee8c7688a7647c1c3c2db45ac0003fe0562088edc8ef6d8378d5f926110a61fbc0587bf4ee027c0058ff6d04e8defd0d51c412cf893ab373fde446fdf5df7c2b3c2d82ea28b35138bf3c0fc2956b9b0639ad4051ae106b9f93785c8c0154e69b22a653c5f900b37a9ea33c2543f932dd982c210f640002155ea2c27d00667b5af34044b681c92454a305b0b6a67932c56f20ae01b0c55472e3cd0faa65939441ac697afa8504c2ae8e9e69866e007f2ea88c61ce7fa435849ede0b69f8536bd0bc4d83e0c74c8ca30545f2381409df36e38700084c16409785ab4a79c038f3647f71e0f0e96d6896a6ea6b4b336e154241731cad80e2b76b737c68c310f4ed190197ba3ad28b0157d778344ae2ce054fbc2a3d7e8be64b76687eba740600d8830e95ac4f73ed3b65200dfd75978ab652de7bddc1b06b5641b1bd6fb43d7b05e6690201056ef6aaba6df0cdeb68ae5092787724e1427a990f435eee99664d7a9ca905b36390a73ec10546b04617899a4a3006d1eb06c00ec8baab29595c8c884decfea0fa77d4eb7c6012b236c9f832d0aca445f6224f3d43e6813fbf9922369119f48c33f34ab8c45b3578f60bfee49de75d41a015cd1acc6483ea9a9e7cb6704c0887ebc842994f78189deb1a679dc9216d1901e99e1b0a39f6ec784c02a68d2d018b9fd8eaf7f610ff7bfb6339cc43d9a0acee72d452edd60f2650e3567d3af8369d3879c9e463640929153d68717e7075b34b7da8af6e8308c7ec4d009d1674827116711cfdca3a392ff955e6908b4c080d63cae6fe881b01798ed8565f9fe711f1bca8eb498c96e8ddf72ba8824e7a4d599d3be64e0f21da6d6df7256811baf2dc32ba84b50bb088372cb4d4100749c36415af82c681038806d6c5c6bea51dfe0e3533ee249a2a4c66a66dc466b0d2bf315c495c1b05d94be49ffb59f1e2564d3be20a83beb08b201e12642c87f70fc9686849e92588d8ddc12bc3465b255dfce40a347cc538a111c495b1236ac2702ea8435c9393298a573e1a018e608e0b1b9d0d3eb5d7df414ef4a11fc0cce28140bbc8525275b8bb7070f70cc0211666a9ac5994c00dbdb5064f7f60e2a689ec9c74e456091f7e50714cb38f1e45424b93fe58be5063299622b622625ec2064da13464571a237324a50f5ccd1b112d0aeb4727609110fb763efb6eb87098e76e796c2b0010036b5ab0e41eb5731c9084a012448aaf0ed6ff60a1d8922357b81dd7164bfb1d7166c10f86786e3b0fa173536b842d4927fba8364b13f6656f8f016adbd110e6d4ac3648ddc0b06283e37ae943b2c0e04e88721951f39b9188e5e35e71f68c0c12b6e0a445102ea694611ea14080cc50ddab13dc4ab9311baea773c22a043d9f81e0f194cc7db76e3271268d81b74fc6b12767a5eedb019cfcae47fc807a645bf437f838dc597b046df2334d1c91800ad09bae2a546582e623279a58d447875d86f1b21f6432049ebf894f5f7cac78045384a173414cd538f39e9720cb6e9a4cf15ff296ebcbfa061df79a606eccffcdb13581f10d43a5055da9b0776b36254d9dbcbc1b460b4b2c0d4dac85d3ed80b8df77515156a59348e87b4f7e631fa1558c5668ee820441e2f4f4055d41c3927a2f13acf83b35ea43e50cea0b5b0fa7cf122499df646d446a742467ffdcb7fa3c29defa86048f0d7bffcbbe4a0f45fdc426046b60f0597321dfe1a52f851aed4bf9a1b1714cce9eb9e3be8f469a79f05f5dac80ded0bd0032bd1d24837884450007ddf2571a4060457bffe505fd1b7dba1ca76107ac9a0a6ad792afb3b76b8c83d3a07b270bdad63979f9fa3aa1fc609c18ff0ff9e79978e77b601504ede7f757e33ba5462f64da19771f21399425fdc8e5f3e3a3b7b22ffb7358afe4626de5d617ae47b8cd1ccb687d2cbe47a1b4adf33cbc52fa31e74ddfd4b3798e349bb0fd4c191f4ef7d2fb3f0bb0146f63ad704251c2eb103dfd51929148bcd66fbc1ac21efdd9e20f4b397bc12773a632fb295bc0810354ac1f45a02a3ff5ec3e2207d86c40d4704f3cdb4fc6bef2d841bcd7e1890e9df7722ddb0ac9410979bc102eef5b8eb4d8f9f23c778f7563a97dd0a5e85b155e8b16211aa0d1baabb19a93ac678e1c23d9a1ece2fa2ef65b29656447db3236bd7c717f78582fa0e092a2fff76df33b51e08b05954779914a83692fa6a79dd441df232d182f146cefd80387318315592afb0f037dd099fad973b692df7291bf283dc291c8ea06a1b068d59596e43666aca3b94ed354c5a61a283e8e8ef71a8a45499dac6e4654d0ad5870eacc356069e02fa0ed4da9fe686f3cc8fb185f5bd81e398541844cdfe15f732437d191447fe89284c7c682fcf142ba33f91b5eddb812c6d75f5e3bccbebe84e87f32e47b54e9bdc6d37f1187e1bc9276657674b33f0f02f08d61886dc47df74aaaf8b5300ded543d28b71bd962cbde6cb47740fb2edd61b738e70644e4b28eb0c1bdd82b5d6a0a2c5883d17a4d172745d80850d917ed7f7f6717894bcf860db407dd97aac2030f6e6579e3c0e52589a8f95b76991bf1dfb03c6311cd014988eafae9f72887771bffa3f000000ffff0300504b0304140006000800000021003b6d324bc10000004201000023000000786c2f776f726b7368656574732f5f72656c732f7368656574312e786d6c2e72656c73848fc18ac2301445f703fe43787b93d6850c43533722b855e70362fada06db9790f714fd7bb31c65c0e5e570cfe5369bfb3ca91b660e912cd4ba0285e4631768b0f07bda2dbf41b138eadc14092d3c9061d32ebe9a034e4e4a89c79058150bb1855124fd18c37ec4d9b18e09a9903ee6d949897930c9f98b1bd0acaa6a6df25f07b42f4eb5ef2ce47d57833a3d5259feec8e7d1f3c6ea3bfce48f2cf84493990603ea24839c845edf2806241eb77f69e6b7d0e04a66dcccbf3f6090000ffff0300504b030414000600080000002100eaeed37a77010000a404000027000000786c2f7072696e74657253657474696e67732f7072696e74657253657474696e6773312e62696eec53cd4ac43010feda551141f4013c795fd83f178feef6472aedb6a659f15ad820c1d8949a82abf846be83e0c987f0097c0875bafeb082a888070f26cccc37f926339384483074d027d9c24f86b5d058bac36dc3b9866dc1c2fd8a5e9e905dc3a16d933db41ba44308189a02e58faabcdf64bdb8b5b5492c028f347683b4371fe906a3f12612ebaab10156de3c7c567af58dac4f012cd679e7eafc42dbff29fef80dbcbef777da4c28388df85e1dbb8e1deb021eda18c0818f21fd251f4d6c93f6d123d4a3953e714de2ba241d422ee9edd96a97f836b1eeccbba48c415e54662873f8318bd278cc1c0fcc4bdd30c43897a538ad515c4a919bcc489d238919678380c3ad0a25ce70e0311e3883108e562a3302f1089198c88c4f0b81c198c7a9177a0e479215a24ce5b940e871ee318caaa26e462b5d467a229e119838d5aa9a95eab75a6e1260a8f5b11206b1ef233559a1647e3473e2ca50f3fb55a6a49962a4cb934c7d7da31b1472d073a38fdee0090000ffff0300504b03041400060008000000210016426e995f0100007902000011000801646f6350726f70732f636f72652e786d6c20a2040128a00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008c92c14f833014c6ef26fe0fa47728b0b9990a2c51b3cb5c626446e3ad69df46150a693bd8fe7b0b6cc8a2070f3db4dfd7dffbde6ba3c5a1c89d1a9416a58c51e0f9c801c94a2ee42e46af9ba57b8b1c6da8e4342f25c4e8081a2d92ebab885584950a9e5559813202b46349521356c52833a622186b964141b5671dd28adb5215d4d8addae18ab22fba031cfafe0c176028a786e216e85603119d909c0dc86aaff20ec019861c0a9046e3c00bf08fd7802af49f173a65e42c843956b6a753dc319bb35e1cdc072d0663d3345e33e962d8fc017e5f3fa55dabae90edac18a024e28c3005d4942a79a1b570569915ece2548abbd55e67347752ca320e758447e676b039d5666ddf602b80df1f9394ca4f513b69847f6bb64ed7565f0cb8638392beadb3f2367978dc2c5112fae1d4f5676e106efc399906e466f6d196beb8df06ef0f8a5380ff10e72d3198133f1811cf80a4cb7df959926f000000ffff0300504b030414000600080000002100b43bcd989a0100002703000010000801646f6350726f70732f6170702e786d6c20a2040128a00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c92c16edb300c86ef03f60e82ee8d9c6e2886405651a41d7ae8b00076bbb326d3b150591244d648f6f4936d2475b69d7623f913bf3e9194b787deb10112dae04bbe5e159c8137a1b17e5ff2e7faebd517ce90b46fb40b1e4a7e04e4b7eae307b94b2142220bc8b285c79277447123049a0e7a8dab2cfbacb421f59a729af622b4ad35701fcc5b0f9ec47551dc083810f8069aab7836e4b3e366a0ff356d8219f9f0a53ec60cace45d8cce1a4df997ea9b35296068893d1c0c382996a2cc741598b764e9a80a2996a9ac8c76b0cdc6aad50e418af7827c043d0e6da76d422507da0c60282486f6571edb35673f35c28853f24127ab3d65acb16d4ea6d845a4a47e84f48a1d00a114b9612e4ee1b27719dbcf6a3d35e4e0b271349841b27089585b7280dfdb9d4ef40fe2f59278629879679c6ae49bdf5cf24d5fce2ffde1bd0d7dd4fea86a301d6a56411af21db0dd40ec891a294eba7cb2fe159f631dee35c169c8974559753a4193f7725ec2b9201ff37c931b4db69df67b684e3d7f0be349bccc77afd637abe25391b7bda849f17ee1ea37000000ffff0300504b01022d0014000600080000002100413782cf6e010000040500001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01022d0014000600080000002100b5553023f40000004c0200000b00000000000000000000000000a70300005f72656c732f2e72656c73504b01022d0014000600080000002100d6a36d2df5020000c80600000f00000000000000000000000000cc060000786c2f776f726b626f6f6b2e786d6c504b01022d0014000600080000002100813e9497f3000000ba0200001a00000000000000000000000000ee090000786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c73504b01022d001400060008000000210083d51b799d0e0000ec5400001800000000000000000000000000210c0000786c2f776f726b7368656574732f7368656574312e786d6c504b01022d0014000600080000002100c11710be4e070000c62000001300000000000000000000000000f41a0000786c2f7468656d652f7468656d65312e786d6c504b01022d0014000600080000002100bcf182b330040000e61600000d0000000000000000000000000073220000786c2f7374796c65732e786d6c504b01022d0014000600080000002100e755a1888d2a0000ca7b00001400000000000000000000000000ce260000786c2f736861726564537472696e67732e786d6c504b01022d00140006000800000021003b6d324bc10000004201000023000000000000000000000000008d510000786c2f776f726b7368656574732f5f72656c732f7368656574312e786d6c2e72656c73504b01022d0014000600080000002100eaeed37a77010000a404000027000000000000000000000000008f520000786c2f7072696e74657253657474696e67732f7072696e74657253657474696e6773312e62696e504b01022d001400060008000000210016426e995f0100007902000011000000000000000000000000004b540000646f6350726f70732f636f72652e786d6c504b01022d0014000600080000002100b43bcd989a010000270300001000000000000000000000000000e1560000646f6350726f70732f6170702e786d6c504b0506000000000c000c0026030000b15900000000),
(128, 'BSE Limited', 'Diwakar Raut', 'Cyber Asset Attack Surface Protection (CAASP) RFP for asset discovery and vulnerability protection is floated by CISO (Diwakar)', 'Armis', 'New', 11100000, '2024-06-28', 'Won', '1 year Licenses', '2024-08-01', '2025-07-31', NULL),
(129, 'Espresso Financial Services Private Limited ', '', 'Compliance MVS: 300', 'BigFix', 'Renewal', 331986, '2024-03-19', 'Won', '1 year Licenses', '2024-06-01', '2025-05-31', NULL),
(130, 'Bandhan AMC Limited', '', 'NPM SL2000\nNTA SL2000\nKiwi CatTool', 'SolarWinds', 'Renewal', 758200, '2024-03-20', 'Won', '1 year Licenses', '2024-03-30', '2025-05-30', NULL),
(131, 'Mylan Pharmaceuticals Private Limited', '', 'Lifecycle Perpetual', 'BigFix', 'Renewal', 3588235, '2024-03-12', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(132, 'Sharekhan Limited', 'Niraj Randeria', 'Starterkit Lifecycle CD: 6000\nCompliance MVS: 1000\n', 'BigFix', 'Renewal', 2241689, '2024-03-20', 'Won', '1 year Licenses', '2024-03-01', '2025-03-31', NULL),
(133, 'Sharekhan Limited', 'Niraj Randeria', 'Annual Support Service for BigFix', 'Services', 'Renewal', 1020619, '2024-03-20', 'Won', '1 Year service', '2024-04-15', '2025-04-14', NULL),
(134, 'Mahindra & Mahindra Financial Services Limited', 'Nikunj Panchal', 'Platform Software Distribution', 'BigFix', 'Renewal', 3022000, '2024-03-22', 'Won', '1 year Licenses', '2024-03-17', '2025-03-16', NULL),
(135, 'SBI-SG Global Securities Services Pvt Ltd', '', 'Patch CD: 350\nPatch MVS: 50', 'BigFix', 'Renewal', 48693, '2024-03-22', 'Won', '1 year Licenses', '2024-03-05', '2025-03-04', NULL),
(136, 'Shoppers Stop Limited', '', 'Patch CD: 4500\nPatch MVS: 150\nPatch Resource Value unit: 1100', 'BigFix', 'Renewal', 324946, '2024-03-20', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL);
INSERT INTO `opportunity` (`id`, `customer_entity`, `name`, `description`, `type`, `License_type`, `value`, `closure_time`, `status`, `period`, `license_from`, `license_to`, `pdf`) VALUES
(137, 'Reliance Nippon Life Insurance Company Limited', 'Stanley  Fernandes', 'Lifecycle, Resource Value Unit: 1048', 'BigFix', 'Renewal', 690433, '2024-03-26', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(138, 'Tata Realty and Infra Limited', '', 'Patch Term CD: 600\nPatch Term MVS: 100', 'SolarWinds', 'Renewal', 231170, '2024-03-29', 'Won', '1 year Licenses', '2024-03-30', '2025-03-29', NULL),
(139, 'Tata Realty and Infra Limited', '', 'Advanced Service Agent Users (30-49 Users): 30\nAdvanced Asset Management (500 Asset Pack): 3', 'SolarWinds', 'Renewal', 1288636, '2024-03-29', 'Won', '1 year Licenses', '2024-03-30', '2025-03-29', NULL),
(140, 'Tata Communications Limited', 'Novaroon Ojah', 'Kiwi Syslog Server, SolarWinds Engineer\'s Toolset Per Seat License, SolarWinds Server & Application Monitor ALX, SolarWinds Network Performance Monitor SLX', 'SolarWinds', 'Renewal', 1650853, '2024-04-26', 'Won', '1 year Licenses', '2024-05-15', '2025-05-14', NULL),
(141, 'Pluxee India Private Limited', 'Nikunj Vagela', 'Network Configuration Manager DL50,  Server & Application Monitor AL300,  Network Performance Monitor SL250', 'SolarWinds', 'Renewal', 343112, '2024-04-29', 'Won', '1 year Licenses', '2024-04-29', '2025-04-29', NULL),
(142, 'DCB Bank Limited ', 'Sanjay Shintre', 'Compliance Term: 1000', 'BigFix', 'Renewal', 3728565, '2024-04-29', 'Won', '1 year Licenses', '2024-04-14', '2025-04-13', NULL),
(143, 'Sanghvi Beauty and Technologies Private Limited', '', 'CrowdStrike Renewals', 'Services', 'Renewal', 869050, '2024-05-31', 'Won', '1 year Licenses', '2024-06-01', '2025-05-31', NULL),
(144, 'WNS Global Services Private Ltd', 'Nayan Desai', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 967740, '2024-06-03', 'Won', '1 Year service', '2024-05-19', '2025-06-19', NULL),
(145, ' ICICI Bank Limited', '', 'SolarWinds NAM License', 'SolarWinds', 'Renewal', 7457421, '2024-06-06', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(146, ' ICICI Bank Limited', '', 'AMC', 'SolarWinds', 'Renewal', 8465928, '2024-06-12', 'Won', '1 year Licenses', '2024-04-30', '2025-04-30', NULL),
(147, ' Indian Financial Technology & Allied Services', 'Vishal Pujara', 'SolarWinds HCO Advance A500', 'SolarWinds', 'Renewal', 2492359, '2024-06-13', 'Won', '1 year Licenses', '2024-06-28', '2025-06-27', NULL),
(148, 'Angel One Limited ', '', 'StarterKit Lifecycle', 'BigFix', 'New', 837362, '2024-06-13', 'Won', '1 year Licenses', '2024-06-17', '2025-06-16', NULL),
(149, 'Tata Housing Development Company limited', '', 'HCO Advance A250', 'SolarWinds', 'New', 1693370, '2024-05-31', 'Won', '1 year Licenses', '2024-05-30', '2025-05-29', NULL),
(150, 'Au Small Finance Bank Limited', '', 'Patch CD: 500', 'BigFix', 'Renewal', 43905, '2024-06-11', 'Won', '1 year Licenses', '2024-07-01', '2025-06-30', NULL),
(151, 'Au Small Finance Bank Limited', '', 'Patch CD:250', 'BigFix', 'Renewal', 480106, '2024-05-24', 'Won', '1 year Licenses', '2024-03-21', '2025-03-20', NULL),
(152, 'ICICI Prudential Asset Management Company Limited ', 'Umesh Harade', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 495931, '2024-06-17', 'Won', '1 year Licenses', '2024-06-30', '2025-06-30', NULL),
(153, 'Angel One Limited ', '', 'Starterkit for lifecycle CD:2000', 'BigFix', 'Renewal', 3350000, '2024-06-21', 'Won', '1 year Licenses', '2024-06-30', '2025-06-29', NULL),
(154, 'Concentrix Daksh Services India Private Limited', 'Pankaj Potdar', 'Patch MVS: 5500\nCompliance MVS: 1000', 'BigFix', 'Renewal', 2552550, '2024-08-14', 'Won', '1 year Licenses', '2024-08-15', '2025-08-14', NULL),
(155, 'Concentrix Daksh Services India Private Limited', 'Pankaj Potdar', 'Compliance MVS: 600', 'BigFix', 'Renewal', 769800, '2024-05-29', 'Won', '1 year Licenses', '2024-05-18', '2025-05-17', NULL),
(156, 'Angel One Limited ', '', 'Patch Term: 1500', 'BigFix', 'Renewal', 2435475, '2023-07-31', 'Won', '1 year Licenses', '2024-07-27', '2025-07-28', NULL),
(157, 'Toshiba Software India Pvt Ltd', '', 'SolarWinds NTA, NPM', 'SolarWinds', 'Renewal', 1140875, '2023-07-28', 'Won', '1 year Licenses', '2024-08-31', '2025-09-30', NULL),
(158, 'Axis Bank Limited', 'Rajani Kumar', 'Patch Term MVS: 1000', 'BigFix', 'Renewal', 1437324, '2024-08-09', 'Won', '1 year Licenses', '2024-08-01', '2025-07-31', NULL),
(159, 'K Raheja Corporate Services Private Limited', 'Swapnil Chawan', 'StarterKit lifecycle Perpetual CD: 500', 'BigFix', 'Renewal', 413565, '2024-08-28', 'Won', '1 year Licenses', '2024-08-21', '2025-08-20', NULL),
(160, 'Axis Securities Limited', 'Vipul Kesariya', 'HCO Advanced A250', 'SolarWinds', 'Renewal', 1113840, '2024-08-23', 'Won', '1 year Licenses', '2024-08-28', '2025-08-27', NULL),
(161, 'DCB Bank Limited ', 'Sanjay Shintre', 'Starterkit Lifecycle CD: 3000', 'BigFix', 'Renewal', 3476890, '2023-09-05', 'Won', '3 year Licenses', '2023-09-02', '2025-09-01', NULL),
(162, 'Inniti Network Solutions LLP', '', 'HCO Advanced A250', 'SolarWinds', 'Renewal', 1332419, '2023-09-05', 'Won', '1 year Licenses', '2024-09-29', '2025-09-29', NULL),
(163, 'Awfis Space Solutions Pvt Ltd', '', 'NPM SL500, NTA SL500, \n', 'SolarWinds', 'Renewal', 2048585, '2024-06-26', 'Won', '1 year Licenses', '2024-06-29', '2025-06-29', NULL),
(164, 'Awfis Space Solutions Pvt Ltd', '', 'Annual Support Service for SolarWinds', 'Services', 'New', 500000, '2024-06-26', 'Won', '1 Year service', '2024-06-29', '2025-06-29', NULL),
(165, 'IDBI Bank Limited', 'Riyaj Inamdar', 'Lifecycle CD: 21000', 'BigFix', 'Renewal', 5800000, '2024-04-30', 'Won', '1 year Licenses', '2024-05-01', '2025-04-30', NULL),
(166, 'Birlasoft Limited', 'Kunal Kaushik', 'NPM, NCM, NTA, SAM', 'SolarWinds', 'Renewal', 2148800, '2024-05-01', 'Won', '1 year Licenses', '2024-04-30', '2025-05-29', NULL),
(167, 'Angel One Limited ', '', 'StarterKit Lifecycle CD: 300', 'BigFix', 'Renewal', 502418, '2024-05-03', 'Won', '1 year Licenses', '2024-04-01', '2025-03-31', NULL),
(168, ' Indian Financial Technology & Allied Services', 'Vishal Pujara', 'Compliance', 'BigFix', 'New', 3500000, '2024-08-28', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(169, 'HDFC Securities Limited', 'Girish Oberio', 'Additional PE, NCM and UDT', 'SolarWinds', 'New', 2324074, '2024-08-08', 'Won', '3 year Licenses', '2024-08-14', '2027-08-13', NULL),
(170, ' Indian Financial Technology & Allied Services', 'Vishal Pujara', 'SRM Upgrade from 150 to 500 disks', 'SolarWinds', 'New', 750000, '2024-07-29', 'Lost', '1 year Licenses', NULL, NULL, NULL),
(171, 'Worldline India Private Limited', 'Sunil Maurya', 'Advance Observability Scale 1000 to cater to 704 Servers and 250 Network Devices', 'SolarWinds', 'New', 7500000, '2024-07-16', 'Progress Sub', '', NULL, NULL, NULL),
(172, 'LTIMindtree Limited', 'Nirmal Kumar', 'compliance', 'BigFix', 'New', 100000, '2024-08-31', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(173, 'National Commodity & Derivatives Exchange Limited', 'Malay Sen', 'NPM Sl 2000, NTA SL2000, SolarWinds Toolset, High Availability, NCM DL 200', 'SolarWinds', 'Renewal', 1135215, '2024-06-27', 'Won', '1 year Licenses', '2024-06-19', '2025-07-18', NULL),
(174, 'National Commodity & Derivatives Exchange Limited', 'Malay Sen', 'Annual Support Service for SolarWinds', 'Services', 'Renewal', 409785, '2024-06-27', 'Won', '1 Year service', '2024-06-19', '2025-07-18', NULL),
(175, 'National Securities Depository Limited ', '', 'BigFix Patch Server Licenses', 'BigFix', 'New', 900000, '2024-06-29', 'Quotation Done', '', NULL, NULL, NULL),
(176, 'Adani Energy Solutions Limited', 'Naman Vyas', 'NMS Opp to monitor their Infrastructure of 1500 Network devices and Servers.', 'SolarWinds', 'New', 7194000, '2024-07-01', 'Won', '1 year Licenses', '2024-06-30', '2025-06-29', NULL),
(177, 'IDBI Bank Limited', '', 'Upsell Patch to Compliance Module for the Servers', 'BigFix', 'New', 7500000, '2024-10-30', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(178, 'K Raheja Corp Real Estate Pvt Ltd', '', 'Inventory CD: 1650\nStarterkit Lifecycle CD:1650\nInventory MVS: 140\nPatch MVS:140', 'BigFix', 'Renewal', 915146, '2024-06-28', 'Won', '1 year Licenses', '2024-07-01', '2025-06-30', NULL),
(179, ' Indian Financial Technology & Allied Services', 'Vishal Pujara', 'SolarWinds Rnwls', 'SolarWinds', 'Renewal', 4200000, '2024-07-15', 'Lost', '1 year Licenses', NULL, NULL, NULL),
(181, 'Cowtown Software Design Pvt. Ltd', 'Sujeet Prajapati', 'Lifecycle Server: 50', 'BigFix', 'New', 134535, '2024-05-10', 'Won', '1 year Licenses', '2024-06-05', '2025-06-04', NULL),
(182, 'IDBI Bank Limited', 'Riyaj Inamdar', 'NCM to manage Network Device compliance ', 'SolarWinds', 'New', 2000000, '2024-09-27', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(183, 'IDFC Bank Limited', 'Veeresh Shetty', 'BigFix Licenses', 'BigFix', 'New', 15000000, '2024-08-26', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(184, 'IDFC Bank Limited', 'Veeresh Shetty', 'SolarWinds Licenses ', 'SolarWinds', 'New', 15000000, '2024-08-29', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(185, 'JSW Steel Limited', 'Jayant Jain', 'Patch CD: 10000\nPatch MVS: 250', 'BigFix', 'Renewal', 270487, '2024-05-17', 'Won', '1 year Licenses', '2024-07-01', '2025-06-30', NULL),
(186, 'Aarti Industries Limited', 'Jatin Prajapati', 'Patching for 3500 CD and 500 Servers', 'BigFix', 'New', 1500000, '2024-08-29', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(187, 'Adani Energy Solutions Limited', 'Naman Vyas', 'Annual Support Services for SolarWinds', 'Services', 'New', 875000, '2024-07-15', 'Won', '1 Year service', '2024-06-30', '2025-06-29', NULL),
(188, 'HDFC Securities Limited', 'Girish Oberio', 'Annual Support Service for BigFix', 'Services', 'Renewal', 240997, '2023-10-21', 'Won', '1 Year service', '2024-01-01', '2024-12-31', NULL),
(189, 'BNP Paribas India Solutions Pvt Ltd', '', 'NPM, HA, NCM,NTA ', 'SolarWinds', 'Renewal', 7332917, '2024-07-01', 'Won', '5 Months License', '2024-07-01', '2024-12-31', NULL),
(190, 'BNP Paribas India Solutions Pvt Ltd', '', '5 Month support service', 'Services', 'Renewal', 250000, '2024-07-01', 'Won', '5 Months service', '2024-07-01', '2024-12-31', NULL),
(191, 'Yes Bank Limited', '', 'Compliance MVS', 'BigFix', 'Renewal', 8703030, '2023-04-03', 'Won', '1 year Licenses', '2024-03-31', '2025-03-31', NULL),
(192, 'Mylan Inc ', 'Amit Rajan', 'Lifecycle perpetual Resource Value Unit: 8157', 'BigFix', 'Renewal', 3837130, '2022-06-30', 'Won', '1 Year service', '2024-07-01', '2025-06-30', NULL),
(193, 'WNS Global Services Private Ltd', 'Nayan Desai', 'SolarWinds Renewal', 'SolarWinds', 'Renewal', 6601440, '2024-05-27', 'Won', '1 year Licenses', '2024-05-19', '2025-06-19', NULL),
(194, 'SBI General Insurance Company Limited', '', 'NCM 500', 'SolarWinds', 'New', 100000, '2024-09-19', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(195, 'Mahindra & Mahindra Financial Services Limited', 'Nikunj Panchal', 'BigFix Upgrade', 'BigFix', 'New', 3600000, '2024-08-28', 'Won', 'BigFix upgrade (Order loaded on HCL for 3 Years)', '2024-08-29', '2025-08-28', NULL),
(196, 'Angel One Limited ', '', 'Patch CD & MVS: 150', 'BigFix', 'New', 100000, '2024-08-19', 'Progress Sub', '1 Year Licenses', NULL, NULL, NULL),
(197, 'WNS Global Services Private Ltd', 'Nayan Desai', 'SWO', 'SolarWinds', 'New', 100000, '2024-08-19', 'Progress Sub', '1 Year Licenses', NULL, NULL, NULL),
(198, 'IDBI Bank Limited', 'Riyaj Inamdar', 'New SolarWinds Opportunity', 'SolarWinds', 'New', 100000, '2024-08-15', 'Progress Sub', '1 Year Licenses', NULL, NULL, NULL),
(199, 'BSE Limited', 'Vijjukumar Pillai', 'HCO AE 4000', 'SolarWinds', 'New', 10000000, '2024-09-30', 'Progress Sub', '1 Year Licenses', NULL, NULL, NULL),
(200, 'L&T Finance Limited', '', 'SolarWinds Renewal', 'SolarWinds', 'Renewal', 5838804, '2023-05-31', 'Won', '1 Year Licenses & 1 Year Services', '2023-05-31', '2024-07-31', NULL),
(201, 'DCB Bank Limited ', 'Sanjay Shintre', 'Opp driven by Harshit. SolarWinds upgrade NCM 3000', 'SolarWinds', 'New', 723489, '2024-08-30', 'Won', '1 year Licenses', '2024-09-01', '2025-08-31', NULL),
(202, ' ICICI Bank Limited', '', 'On-site SolarWinds Support', 'Services', 'Renewal', 5025000, '2024-07-26', 'Won', '9 month Service', '2024-04-01', '2024-12-31', NULL),
(203, 'National Securities Depository Limited ', '', 'Tenable licenses', 'Tenable', 'New', 1000000, '2024-09-30', 'Quotation Done', '', NULL, NULL, NULL),
(204, 'HDFC Securities Limited', 'Girish Oberio', 'Compliance licenses for Servers', 'BigFix', 'New', 3500000, '2024-09-30', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(205, 'WNS Global Services Private Ltd', 'Nayan Desai', 'SolarWinds Additional Web Server', 'SolarWinds', 'Renewal', 9369, '2024-08-09', 'Won', '1 year Licenses', '2024-06-19', '2025-06-19', NULL),
(206, 'HDB Financial Services Limited', 'Paresh Raorane', 'SolarWinds Renewals', 'SolarWinds', 'Renewal', 1567849, '2024-09-26', 'Won', '1 Year Licenses', '2024-09-30', '2025-10-31', NULL),
(207, 'Shapoorji Pallonji Finance', '', 'Starterkit for lifecycle CD: 130 Patch MVS: 35 Inventory CD: 130 Inventory MVS: 35', 'BigFix', 'New', 549910, '2024-10-01', 'Won', '1 year Licenses', '2024-10-15', '2025-10-14', NULL),
(209, 'DCB Bank Limited ', 'Sanjay Shintre', 'Annual Support Service for SolarWinds', 'Services', 'New', 625000, '2024-08-30', 'Won', '1 Year service', '2024-09-01', '2025-08-31', NULL),
(210, 'Axis Bank Limited', 'Rajani Kumar', 'Compliance MVS: 700 ', 'BigFix', 'Renewal', 1289473, '2022-09-30', 'Won', '1 Year service', '2024-09-02', '2025-09-01', NULL),
(211, 'TJSB Sahakari Bank Ltd', '', 'Patch MVS: 500\nPatch CD: 1700', 'BigFix', 'Renewal', 436560, '2022-02-12', 'Won', '1 Year Licenses', '2024-02-18', '2025-02-17', NULL),
(212, 'TJSB Sahakari Bank Ltd', '', 'Annual Support Service For BigFix', 'Services', 'Renewal', 600000, '2022-02-15', 'Won', '1 Year service', '2024-02-18', '2025-02-17', NULL),
(213, 'Larsen & Toubro Limited', 'Savita Pawar', 'Requirement to monitor Applications across 1000 servers', 'SolarWinds', 'New', 5000000, '2024-12-17', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(214, 'Mahindra & Mahindra Ltd', 'Atul Bhogte', 'Requirement of advance Security Compliance for 1500 Servers', 'BigFix', 'New', 7500000, '2024-10-30', 'Quotation Done', '1 year Licenses', NULL, NULL, NULL),
(215, ' ICICI Bank Limited', '', 'NAM Upgrade from 11000 to 12000 licenses', 'SolarWinds', 'New', 1400000, '2024-09-30', 'Progress Sub', '1 year Licenses', NULL, NULL, NULL),
(216, 'RBL Bank Limited', 'Ravi Pichan', 'SolarWinds renewals', 'SolarWinds', 'Renewal', 5560234, '2024-09-16', 'Won', '1 Year Licenses', '2024-09-30', '2025-09-30', NULL),
(217, ' ICICI Bank Limited', '', 'BigFix Renewals', 'BigFix', 'Renewal', 110000, '2024-09-17', 'Won', '1 Year Licenses', '2024-09-01', '2025-12-14', NULL),
(218, 'HDFC Securities Limited', 'Girish Oberio', 'Lifecycle CD: 3500\nStarterkit for lifecycle MVS: 500\nStarterkit for lifecycle  Term Lic MVS: 200\n', 'BigFix', 'Renewal', 4650498, '2024-09-20', 'Won', '1 Year Licenses', '2024-09-22', '2025-09-21', NULL),
(219, 'Ageas Federal Life Insurance Company Limited', '', 'SolarWinds Renewal', 'SolarWinds', 'Renewal', 684922, '2024-09-19', 'Won', '1 Year Licenses', '2024-09-29', '2025-09-29', NULL),
(220, 'Shapoorji Pallonji Finance', '', '6-Months services ', 'Services', 'New', 450000, '2024-10-01', 'Won', '6 month service', '2024-10-15', '2025-04-15', NULL),
(222, 'T-Systems Information & Communications Technology India Private Limited', 'Bharat Pise', 'Kiwi Syslog Server NG-Single', 'SolarWinds', 'New', 33575, '2024-10-07', 'Won', '1 Year Licenses', '2024-10-18', '2025-10-17', NULL),
(247, 'Axis Bank Limited', 'Rajani Kumar', 'Compliance MVS:950', 'BigFix', 'Renewal', 17500000, '2024-10-28', 'Won', '1 Year Licenses', '2024-10-01', '2025-09-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `opportunitylog`
--

CREATE TABLE `opportunitylog` (
  `id` int(11) NOT NULL,
  `EventLog` varchar(2048) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opportunitylog`
--

INSERT INTO `opportunitylog` (`id`, `EventLog`, `created_at`) VALUES
(1, 'Himani  Gupte added Opportunity for HDB Financial Services Limited for SolarWinds Renewal', '2024-08-21'),
(2, 'Himani  Gupte edited Opportunity for Toshiba Software India Pvt Ltd for SolarWinds Renewal', '2024-08-23'),
(3, 'Himani  Gupte edited Opportunity for Axis Securities Limited for SolarWinds Renewal', '2024-08-27'),
(4, 'Himani  Gupte edited Opportunity for Axis Securities Limited for Services Renewal', '2024-08-27'),
(5, 'Himani  Gupte edited Opportunity for Mahindra & Mahindra Financial Services Limited for BigFix New', '2024-08-28'),
(6, 'Himani  Gupte edited Opportunity for Mahindra & Mahindra Financial Services Limited for BigFix New', '2024-08-28'),
(7, 'Himani  Gupte edited Opportunity for Mahindra & Mahindra Financial Services Limited for BigFix New', '2024-08-28'),
(8, 'Himani  Gupte edited Opportunity for SBI DFHI Limited for BigFix New', '2024-08-28'),
(9, 'Himani  Gupte added Opportunity for Shapoorji Pallonji Finance for BigFix New', '2024-08-28'),
(10, 'Himani  Gupte added Opportunity for Shapoorji Pallonji Finance for BigFix New', '2024-08-28'),
(11, 'Himani  Gupte edited Opportunity for K Raheja Corporate Services Private Limited for BigFix Renewal', '2024-08-29'),
(12, 'Himani  Gupte edited Opportunity for DCB Bank Limited  for BigFix Renewal', '2024-09-02'),
(13, 'Himani  Gupte edited Opportunity for DCB Bank Limited  for SolarWinds New', '2024-09-02'),
(14, 'Himani  Gupte added Opportunity for DCB Bank Limited  for Services New', '2024-09-02'),
(15, 'Himani  Gupte added Opportunity for Axis Bank Limited for BigFix Renewal', '2024-09-05'),
(16, 'Himani  Gupte edited Opportunity for Inniti Network Solutions LLP for Services Renewal', '2024-09-05'),
(17, 'Himani  Gupte edited Opportunity for Inniti Network Solutions LLP for SolarWinds Renewal', '2024-09-05'),
(18, 'Himani  Gupte added Opportunity for TJSB Sahakari Bank Ltd for BigFix Renewal', '2024-09-05'),
(19, 'Himani  Gupte added Opportunity for TJSB Sahakari Bank Ltd for Services Renewal', '2024-09-05'),
(20, 'Himani  Gupte edited Opportunity for ICICI Prudential Asset Management Company Limited  for Services Renewal', '2024-09-09'),
(21, 'Himani  Gupte edited Opportunity for Cowtown Software Design Pvt. Ltd for SolarWinds Renewal', '2024-09-11'),
(22, 'Himani  Gupte edited Opportunity for Excelsoft Technologies Pvt Ltd for Tenable Renewal', '2024-09-11'),
(23, 'Himani  Gupte edited Opportunity for Angel One Limited  for BigFix Renewal', '2024-09-12'),
(24, 'Himani  Gupte edited Opportunity for Angel One Limited  for BigFix Renewal', '2024-09-12'),
(25, 'Himani  Gupte edited Opportunity for Angel One Limited  for BigFix Renewal', '2024-09-12'),
(26, 'Himani  Gupte edited Opportunity for Angel One Limited  for BigFix Renewal', '2024-09-12'),
(27, 'Himani  Gupte edited Opportunity for Mahindra & Mahindra Financial Services Limited for BigFix Renewal from 2023-09-24 to  2024-09-24', '2024-09-13'),
(28, 'Himani  Gupte edited Opportunity for Mahindra & Mahindra Financial Services Limited for Services Renewal from 2023-09-24 to  2024-09-23', '2024-09-13'),
(29, 'sanjiv Sachdev edited Opportunity for Pidilite Industries Ltd for BigFix New from null to  null', '2024-09-17'),
(30, 'sanjiv Sachdev edited Opportunity for BSE Limited for Netscout Renewal from 2024-04-01 to  2025-03-31', '2024-09-17'),
(31, 'sanjiv Sachdev added Opportunity for Larsen & Toubro Limited for SolarWinds New from null to  null', '2024-09-17'),
(32, 'sanjiv Sachdev added Opportunity for Mahindra & Mahindra Ltd for BigFix New from null to  null', '2024-09-17'),
(33, 'Himani  Gupte edited Opportunity for Shapoorji Pallonji Finance for BigFix New from null to  null', '2024-09-17'),
(34, 'Himani  Gupte edited Opportunity for Shapoorji Pallonji Finance for BigFix New from null to  null', '2024-09-17'),
(35, 'sanjiv Sachdev added Opportunity for  ICICI Bank Limited for SolarWinds New from null to  null', '2024-09-18'),
(36, 'Himani  Gupte added Opportunity for RBL Bank Limited for SolarWinds Renewal from 2024-09-30 to  2025-09-30', '2024-09-20'),
(37, 'Himani  Gupte added Opportunity for  ICICI Bank Limited for BigFix Renewal from 2024-09-01 to  2025-12-14', '2024-09-20'),
(38, 'Himani  Gupte added Opportunity for HDFC Securities Limited for BigFix Renewal from 2024-09-22 to  2025-09-21', '2024-09-24'),
(39, 'Himani  Gupte added Opportunity for Ageas Federal Life Insurance Company Limited for SolarWinds Renewal from 2024-09-29 to  2025-09-29', '2024-09-24'),
(40, 'Himani  Gupte edited Opportunity for Axis Bank Limited for BigFix Renewal from 2024-09-02 to  2025-09-01', '2024-09-25'),
(41, 'Himani  Gupte edited Opportunity for HDB Financial Services Limited for SolarWinds Renewal from 2024-09-30 to  2025-10-31', '2024-09-26'),
(42, 'Himani  Gupte edited Opportunity for Shapoorji Pallonji Finance for BigFix New from 2024-10-15 to  2025-10-14', '2024-10-01'),
(43, 'Himani  Gupte added Opportunity for Shapoorji Pallonji Finance for Services New from 2024-10-15 to  2025-04-15', '2024-10-01'),
(44, 'Himani  Gupte edited Opportunity for Shoppers Stop Limited for SolarWinds Renewal from 2024-10-01 to  2025-11-01', '2024-10-09'),
(45, 'Himani  Gupte edited Opportunity for IDBI Bank Limited for BigFix Renewal from 2024-10-01 to  2025-09-30', '2024-10-09'),
(46, 'Himani  Gupte edited Opportunity for Karnataka Bank Limited for Services Renewal from 2024-09-01 to  2025-08-31', '2024-10-09'),
(47, 'Himani  Gupte edited Opportunity for BSE Limited for SolarWinds New from 2024-10-01 to  2025-09-30', '2024-10-09'),
(48, 'Himani  Gupte edited Opportunity for Angel One Limited  for BigFix Renewal from 2024-09-30 to  2025-09-29', '2024-10-09'),
(49, 'Mihir Bari added Opportunity for Dummy for SolarWinds New from null to  null', '2024-10-17'),
(50, 'Himani  Gupte added Opportunity for T-Systems Information & Communications Technology India Private Limited for SolarWinds New from 2024-10-18 to  2025-10-17', '2024-10-17'),
(51, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(52, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(53, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(54, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(55, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(56, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(57, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(58, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(59, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(60, 'Mihir >\"\'><script>alert(154)</script> added Opportunity for >\"\'><script>alert(154)</script> for Services Renewal from null to  null', '2024-10-21'),
(61, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(62, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(63, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(64, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(65, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(66, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(67, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(68, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(69, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(70, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(71, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(72, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(73, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(74, 'Mihir Bari added Opportunity for dummy for Services Renewal from null to  null', '2024-10-21'),
(75, 'Himani  Gupte edited Opportunity for Bandhan AMC Limited for SolarWinds Renewal from 2023-11-01 to  2025-10-31', '2024-10-24'),
(76, 'Himani  Gupte added Opportunity for Axis Bank Limited for BigFix Renewal from 2024-10-01 to  2025-09-30', '2024-11-06'),
(77, 'Himani  Gupte edited Opportunity for Adani Gangavaram Port Private Limited for SolarWinds Renewal from 2024-11-18 to  2025-11-17', '2024-11-06'),
(78, 'Himani  Gupte edited Opportunity for Pidilite Industries Ltd for SolarWinds Renewal from 2024-10-29 to  2025-10-28', '2024-11-06'),
(79, 'Himani  Gupte edited Opportunity for Pidilite Industries Ltd for Services Renewal from 2024-10-29 to  2025-10-28', '2024-11-06'),
(80, 'Mihir Bari added Opportunity for Yes Bank Limited for Armis New from null to  null', '2024-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('-2mLPPlDwAuQZEpxeDEBQkrbL4Y0xvEe', 1731088231, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:50:31.168Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-A9CyKH7nnlyHN5g5VM-maPC0feWOoja', 1731196289, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T23:51:29.193Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-CNgp1ZhaU6OBTglP6xLBPMMcaNJfsFr', 1731270810, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T20:33:30.027Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-GnM1U5ErM8jn0imD1x59Lrm646BMohO', 1731119243, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:27:23.496Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-LsbpUBA7pJ24_Q-z8SAt5qCXeBE3krH', 1731138476, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T07:47:56.345Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-N6U67ms1zncTMhue0Hrd8zOhwyq2lhW', 1731180764, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:32:43.643Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-RClf2cXUb0mILV2FcajdFE7uAAP0AmU', 1731188080, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T21:34:39.845Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('-tU2tQKVyUYZVuVpMynr7FinfzxqESe6', 1731122474, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:21:14.423Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('0MA6k4OesLS0-xSpLPKTgdHKChBSatKV', 1731083290, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T16:28:10.107Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('0U2QNGM1A-0p_VAs81RphMpgyCph9LX7', 1731128695, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:04:55.482Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('0ZIl9tO2AFoUeixUXm5FpwsJLtVhn9C3', 1731169507, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T16:25:07.387Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('0ytTGJMJFZhjZ4WkFRHF0HmF2Ut2wlGa', 1731248943, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T14:29:02.721Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('1ERQUtG7HaZTfujLXCj0NLugDp_exV-9', 1731077360, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T14:49:20.033Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('1i0cN6tXYdEMQ-KYJQ54Zq2A7FTwi4t-', 1731069440, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T12:37:19.662Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('1qanLl9vUxnpTxAwDcUH_J23RF8hli8q', 1731170442, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T16:40:41.726Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('1xIFmsTYvIvLbdCAdufJLHtwagHynDJ3', 1731116823, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:47:03.367Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('2I0qCdpYNRwMDc8iaW1eIwacjEVWczlz', 1731287267, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T01:07:46.593Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('2_UCpmU-piEl9qSy_ngycd2x3AcFx5_5', 1731208870, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T03:21:10.493Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('4_fmcsdrJjG0IsVU7VgMYQKFv8ouKTVV', 1731225225, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T07:53:44.695Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('4fxTWsqW6Cwv5ZMw9MdYPuj9VT68_K0U', 1731069402, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T12:36:42.193Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('4tg9DCa5JzvUj7QAEjGQMsQNYKR2A3by', 1731121176, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:59:35.897Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('5rFQi8u9U-mubzJCpjL5ByCevKJzTV5G', 1731087561, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:39:21.186Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('61PSWXmGloyK7CMdh-NrdhDilHlQTf8z', 1731262109, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T18:08:29.176Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('6aVR37Cv_DkOH_VGwCRBjHmRm0qoPN5B', 1731229327, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T09:02:07.142Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('6r7AL1U7l42pBEwAkRUaZZnPz5AEX40M', 1731108332, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:25:31.832Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('6vupG69OeMY4LsWfpAo96uTbjBdPMbfX', 1731286805, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T01:00:04.825Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('6vxb162g5jbtWjFh8yjrJoSCH3YmceMf', 1731121129, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:58:48.536Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('6yAibKgQ6iu1-wdZYNQl2z3fZTxJi8Gg', 1731120670, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:51:09.773Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('7TuVEybe1wozxNsDEZpkNdKs1UQ0qMfn', 1731203440, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T01:50:40.278Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('7XEY5dNCcb4BKb704JABxUmyo48b5ap1', 1731064904, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T11:21:43.848Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('89opQUXRV49Ds3uaK3OZ5SLQDd6J1thm', 1731142277, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T08:51:17.009Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('8aW6bWxc4EB7MqTawP_5NNTOBVuQQoXo', 1731108616, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:30:16.121Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('8fHsnjcQx7VdefjaDbz9hHvRRHE5bmV1', 1731165023, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T15:10:22.989Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('9Qn6Hiz0YKc24CFSYMmo1C-mrviIbRVU', 1731246566, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T13:49:25.828Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('9SvYLpfHR29W4C18mffe30kqWhfZN3qN', 1731122781, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:26:21.334Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('9dvCGOYtFpPSIDHQ9LL0q0vSd90gXBl9', 1731281465, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T23:31:05.314Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('ATdr9PA5QLEkrwvA4LeB0s8KjTLcIhaO', 1731132645, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:10:44.599Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Bblu_DHlixzsiwGIIYeJCqB-HwMT8_RO', 1731260727, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T17:45:27.478Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('BgJtYpTZHNl1BL7cch8bxR9oagS7j6dj', 1731306963, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T06:36:03.169Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Bs6zUom0-wsxHAIaaQhnzOMsrdlelDJO', 1731098447, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T20:40:47.330Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('CCsu08aeV2zDw1rs4bPjXuoPSx06fuIC', 1731161469, '{\"cookie\":{\"originalMaxAge\":259199999,\"expires\":\"2024-11-09T14:11:09.032Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('CVWpTQNEgUILlzeGoCVhthsJ5xulmwXo', 1731181566, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:46:06.380Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('CpCPxChQfQPBnQU6hn39WySvjzPX96Pg', 1731258105, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T17:01:45.113Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('D5CxjnvPuzGb-NrYVRf4VX8H2k_QsPWw', 1731114855, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:14:15.470Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Dg-o1ab6VsNhEsHCalrU1IRHr7E_EZXm', 1731163180, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T14:39:39.928Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Dh8AZGfeZNL7EcCJTb8_OEMfAknjNz1K', 1731207015, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T02:50:14.595Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Dm2-rTnRYwfnr9jDgq60DeUO-m1m2qri', 1731164356, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T14:59:15.978Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('DnWaHEAiDPBH10DAVYHtardbLVVnCepr', 1731203254, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T01:47:34.094Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('EJ8Da0FgoFk32Yvj7hEOpmoA2htn_qQ0', 1731259991, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T17:33:10.671Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('EckjeufJeCGVy5C8njLIvx2HSjE_h8R4', 1731076195, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T14:29:54.643Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('EnLavCrA68TEYa2ZgB8ac7S_-D-7bhqx', 1731242166, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T12:36:05.747Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Eu1to0agBiUl0m879Eh5QRWbElrZgG19', 1731187484, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T21:24:43.500Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('F5AyFf1iaEofXVpStAeCaol0uuV9E9RP', 1731116045, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:34:05.383Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('F8fxPEUSN68dI8VbhEqSL7ZgBfznKVcd', 1731129452, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:17:32.459Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('FM60ZPwACP0Ryq2uhs5zgL_bbsr5ldyT', 1731080000, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T15:33:20.267Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('FPIeLwUbwNEVgfN203sVLFjtxThbRTJ_', 1731119579, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:32:59.155Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('FanKEnWFSBtpBhSKZYDLEuwQSNdj9VTO', 1731213346, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T04:35:45.826Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Fedh6yi7coETjMwESJwLo7cDiYR_v18i', 1731316483, '{\"cookie\":{\"originalMaxAge\":259199999,\"expires\":\"2024-11-11T09:14:42.526Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('FhnC7PT246EfVQQKddf1CiZV3RpdCZZU', 1731152134, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T11:35:34.284Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('FkMKPjVXw9vO_YsimzbRA1PS1aOrqItN', 1731093726, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T19:22:05.915Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('GGG8z1v4FnrFmzWDVGSRE40KjWqauxS2', 1731177762, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T18:42:42.187Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('GNlIZMA9g94_ZyLNrNRJqmL72P7jQ56k', 1731132780, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:12:59.735Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('GcAlx_zJA2fzvjjxC12GAiRhF2X46kQ3', 1731167150, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T15:45:50.449Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('H75nax3pTxfq7eg9GnhnzFWFJKsiouIS', 1731266186, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T19:16:26.134Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HFxyoZtODu1LLMYjFdqgiQUxTGNkjZQS', 1731119079, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:24:39.408Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HLXZkMEZAinzi_DKMTkFqngbgVWsJIAQ', 1731203255, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T01:47:34.753Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HXU5NQ5FKSgI6Zi9G4qcYKjUPG-LeiSF', 1731200646, '{\"cookie\":{\"originalMaxAge\":259199999,\"expires\":\"2024-11-10T01:04:05.522Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HajlZAcBvCPAFtnkymm0Y1Zk3HKkyIPr', 1731226716, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T08:18:35.838Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HhKaVSmfXE2YBuln3u0I8Rgs7QDXWH7z', 1731206726, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T02:45:25.970Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HmDcSXOVySf7DF73r9NnAiEX23Gko1PM', 1731120883, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:54:43.044Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HxHJ8ohoAvz7aGdnEqFdSADQdpMY9-39', 1731295854, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T03:30:53.574Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('HyAFNyAmRjNqNuU98uLtQSxlNF4LOcIn', 1731073047, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T13:37:26.620Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IErXZRCz0SZT6odYplJEtz_Jk6xMJi74', 1731147793, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T10:23:13.155Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IMrux0-20xzfL__GqtcOTUdZDnYUd2s2', 1731198002, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T00:20:01.596Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('ITnN_a_c14J-bfkKxZIwc1dcylT6F7Ko', 1731240922, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T12:15:21.552Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IW3kgfc7gksqVI2D0oC6gh5GPZTKyMjg', 1731065448, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T11:30:48.186Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IXLHheqY1KLzTqr6Gh8OVJ7Q5eRqsqzW', 1731073608, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T13:46:48.275Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IZPIW_AxESfjYlLlcq6ax_jC6jqeOGCs', 1731303876, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T05:44:35.781Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('IlBE-__N9vI7yAib9wyAANfW10FWwsmL', 1731129721, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:22:00.604Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Iy5HcZIT41mCjuy2DAQkQ07ynuCanb65', 1731110418, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T00:00:18.069Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('JGuUQkBgB6YeAa5aMB-aa2rlT1HWB4wg', 1731063161, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T10:52:40.506Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('JRC-yEmw8bdnkShdw5hfWYljNXuFPRAD', 1731154426, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T12:13:46.298Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('JY0WTNkj9NXdcPgNwcPtzpBByUOA62nE', 1731201473, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T01:17:52.597Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Js31MIzaZHWcsv3y9wWptGxGSJst5kyI', 1731257916, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T16:58:36.202Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('KBN6KwwV3IxB5LSE8kO8HznQ3dHHtbqd', 1731126429, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:27:08.556Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('KD6Tjs-INPjts3QfChH0YTeaKlvwOPE5', 1731122781, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:26:20.769Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('KNJVXZOgQtZnuS1ynFzvq7N5opcQY0vH', 1731228777, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T08:52:57.277Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('KgONgqhW8uvVyGAR6-3k8fMXBEwjP4Yi', 1731311602, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T07:53:22.061Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('KgdYKcrS67LUumA7OEj5DmxYUNo-CkoC', 1731257629, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T16:53:48.990Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Kico0Dbj59fI-fsCjaoqE2TAE7A5noBl', 1731216398, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T05:26:38.007Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Klh2T4JPDfkpM7by_sEU7zmN0uZd0Scn', 1731295032, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T03:17:11.927Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('L4kU4HEJ_FmvN2RAbZVFDoYz0ekNBFpu', 1731226473, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T08:14:32.853Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('L838-YE-VirxvqPPMK9YI-z_4aM0zjj8', 1731274244, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T21:30:44.486Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('LBsA4e4LQnNI9UjhmVU8xcT8IWCnac1T', 1731086587, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:23:07.023Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('LTcjn3Er-W75HmWuHhpM5rm_MYmJsreM', 1731300754, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T04:52:34.120Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('LXliQT9fBbQpxaSGh78VB362f02aeoKv', 1731141406, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T08:36:46.170Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('M9tmvz6Mk19DnnflD0W3frKB-au21TzV', 1731069172, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T12:32:51.873Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('NFwB_Om6tPp7dXODssNDXf8om84KPUTi', 1731096036, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T20:00:36.117Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('NXsRWaKu-Rr0nnPm_Wi5eaiaAXKgeF8r', 1731285610, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T00:40:09.844Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Nvt56PiBmIUovZXo41PLepqu7lPps4Qs', 1731129176, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:12:55.826Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('O8e3oCPPRkrZeU5pDg7DI4Uq3I0t0Q3h', 1731122365, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:19:24.977Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('O_XQ-zQ03jpB8Q-GNuaYtMq58iSYJM5m', 1731196345, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T23:52:24.700Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('OwCFAbISEuq54r2m4y3UBEjvDTkLeKSc', 1731121914, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:11:53.767Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('PGf8VNFcgcF6wKsyJosB-GRMVNf1RmrC', 1731308707, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T07:05:07.205Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('PfGvLdpjmRlRKvYwXk20B_Mc88k_aSSd', 1731122612, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:23:31.661Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Pgr-2jfOjJ9bP6S-zCvVlihJrHOi64zO', 1731309855, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T07:24:14.874Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('QAWhJHwktifWx4EJtheVHLuhVavPr963', 1731175660, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T18:07:40.499Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('QUyCnZh71h7b1B7APeB2EBKUwlN0tFKq', 1731084617, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T16:50:17.433Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('QigwIDZgPgX7EnrBE3ZpMBroi7PHTUgB', 1731126283, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:24:42.604Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('QkIuZY57Nt2DxHsfS4_XrpW8PIXY7rMP', 1731123381, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:36:21.136Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('QkSy8Mz9OmCi7E1bcg4Kd6MOqjP-bRkF', 1731130253, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:30:52.638Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Qu0fPkcig-B2lWHoNS1SsTBrcYMCX3PF', 1731111379, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T00:16:18.829Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('R3lCmnvIaKPTFcTkE7TLWF3RN4l1vIAs', 1731109954, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:52:34.048Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('R8UOj0VqKZw5DAapzL7oTHYjk8heGVtz', 1731185129, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:45:29.203Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('RKVKMSSMuM_bwlwi4fO8SFl4-_881Gt0', 1731216102, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T05:21:41.589Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Re62cU1_UH3YhFGuc6QUDR20yQkmtUvc', 1731153378, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T11:56:18.368Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('RexhLEBhNJ_r8tNAMr2C95m03cJLquwc', 1731117203, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:53:22.788Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Ri-IzUhuqa7-aAqP-3J_EcwpdLAtW0rf', 1731072579, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T13:29:38.679Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Rv89ZckaSUyXq8B2jBCqxOTsOrI7jkBR', 1731179052, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:04:11.937Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('SQhWrFL5ZAywsy3aS3tFRJkFiBRIN2kK', 1731254458, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T16:00:58.050Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('SR_8uwB_f8adWnF1KYwyP_F-cEpIrRRY', 1731309328, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T07:15:27.679Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('So6kHRGwUjxzxTlRj8hnvJ8Af9gAZFuk', 1731235329, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T10:42:09.384Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('SqOfKWZv2bV38DqnOEFUQmWQne301_Ed', 1731289226, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T01:40:26.419Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('TJB2HY_-rXXJ0tDPWUrr9pyLPsWFCyM-', 1731131947, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:59:07.227Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('TOyYiMid8Q0efAa04w7l8t1CCQA86GFS', 1731072512, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T13:28:32.059Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('TSbSRqf6HqN47fBFgGnwxKICFCgyLfw9', 1731286809, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T01:00:09.139Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('TpMGvLn0yF6Za16mxi5MGr9mQCSktQGT', 1731289230, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T01:40:29.564Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('UPCfq0GbdK6x4PHgp7D53OhaHaOmklri', 1731133037, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:17:16.536Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('UScjSh0614-bwrHy6q3EqDD5lwLJKF1p', 1731206727, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T02:45:26.535Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('UXICjNLqi1r3dyD9I-GhWql5icZTCKlx', 1731105383, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T22:36:23.478Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('V9vnX8IaOZJgQwkTqLW6ZyrVhy5zoLqy', 1731185024, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:43:43.821Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('VCNY1gvGtU9NKrVyCUu_lrctRRR1S_g7', 1731107935, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:18:55.460Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('VIs3_7KTsGAv1VcMHfh3BWar8eWIkSn_', 1731086948, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:29:07.760Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('VOYD41iQdiBcOvjCxn8ImGKQsd-K4y8X', 1731164357, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T14:59:16.914Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('VSCWmz6DtZnLxfE7LbtjLSR8QTWgFEvE', 1731085675, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:07:54.621Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('VUiJdv4xAKxgoKDaNW06H2EEls3uuGQ_', 1731126429, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:27:09.124Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Vo1a30PLUWt2w4HR9XlhIOr3iV3jKC9n', 1731244998, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T13:23:17.623Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('W2LNEWlTHl0Q9DyNLmO6YWRuD0LZ2Myc', 1731128094, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:54:53.952Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('W8_oTApDhC0uPcsFvqOGpSUeSnjwnJq9', 1731176466, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T18:21:06.232Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('WE4pMTmQz_qnIbwk3t4LENSYnVqAkrwI', 1731075010, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T14:10:09.836Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('WteyBCtl-T2VHbdOeSS31lYGe3SBfEUb', 1731197586, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T00:13:06.417Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('XKgiX2a5XoIBHVEz1is1UVQr57YcnQsq', 1731119342, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:29:01.700Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('XYUiOKdJJMw_EI-jd2Pa0BW5BkmmkQeY', 1731134195, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:36:35.167Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Xeb1waJsgIyKoGgHVOGLXHWba-swYAsY', 1731120997, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:56:36.716Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Xfn_2sHh03EF7Nsm-rWURZLuMdc3xXfa', 1731300661, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T04:51:01.449Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('XimDFsfJXRgWT2JM4Mdzb7Tgick_FjNg', 1731075001, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T14:10:00.656Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('XyeXmozjtK_LhvOXHFy0sNlqk-mMpd7l', 1731283340, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T00:02:20.160Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('YpOkUAP1EeEhQfuUt8EuPkMCd7FHEstf', 1731181574, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:46:14.118Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('YxBJp0_-opvEC9lwds1US10U7ojxj4rL', 1731284603, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T00:23:23.084Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Z6yge0encGhaEmSb_6sAB9O9Nhsbrdy8', 1731106775, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T22:59:35.113Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('ZO0wUVOkzr25L1fUJbrC2J4sUV_Ae-Re', 1731190855, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T22:20:55.138Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('Zus2QKvC4pI-UQ8dYMR3zQ-hihQu2mSn', 1731237302, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T11:15:02.149Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('_psWqI02TX-0S0Cw8NNmyqho9MT1FOMB', 1731109855, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:50:55.369Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('_sRvUMmTV7aFmZG5DDFIi6plj2Shkhrt', 1731184481, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:34:40.732Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('a0kgsNo2S-6zwaLWXEfZ7PCabSpCjEMw', 1731171536, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T16:58:55.998Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('a48zKBkJRcuYoAmevxoDHOM9QXTY-HUo', 1731264419, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T18:46:59.165Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('aLdeRKUYNRD7X7fTlxewZu6JuY8Y_c5O', 1731246102, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T13:41:42.261Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('b1dnoiJtSJ6Bfx1ugL390iUUDzyO89Az', 1731129058, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:10:58.409Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('bYXLTKqfqZ965aqqOiA_cLEjrNJ1FPuV', 1731119731, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:35:31.163Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('bzOj_EwMqy4ju2wmyQ-wVb0yQ7WXtCXZ', 1731138720, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T07:51:59.632Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('c1VY51_-ro__XAojBOizZ5zKbnFpSIy3', 1731219535, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T06:18:54.913Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('dpShOCrkx65BbHFX_wKL23bnNZAZ78n9', 1731290454, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T02:00:54.085Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('dr8XXQklWOMEmGs9cnUrV05LI5UUuH5c', 1731079170, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T15:19:30.349Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('e1VAFcaJyvPASFJLeloF860Jj9dWKfGa', 1731153347, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T11:55:47.280Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('eVtNV6CqDcaRuXCBFRpZOssa1Pcw8RcU', 1731219449, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T06:17:29.499Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('eZ3G5mGBfIiIdOQfix592g7LOjb1ZbMR', 1731138802, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T07:53:22.415Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('elKQZ_FBzj_5IYwFAsiruA3UYfibrQHq', 1731065602, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T11:33:22.160Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('exbmdXPmM_-6ygjguFRomT7BQ3rQAvUi', 1731295294, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T03:21:33.979Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('fU_yr9IP9mwwq9HLR7CUOKr7vPaEk4os', 1731183654, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:20:53.708Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('fVjhKMLE4k_dz7a_l_wIijAMLq5evGK_', 1731086600, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:23:20.443Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('fu2VwTa-gtR7MoDEzDpKvrCJLo3FROD3', 1731086299, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T17:18:18.636Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('gQ_Y2akTdTQEgm6V2oCxbgwAAnatW_H-', 1731146192, '{\"cookie\":{\"originalMaxAge\":259199999,\"expires\":\"2024-11-09T09:56:31.616Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('gRdjKYDm_3dG07O6cziCkZRjAH6tsw5u', 1731210407, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T03:46:46.845Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('gkQxpycha-66bUw0aeKaUdTFARFnZUz5', 1731199801, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T00:50:01.276Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('gt-Ozo3_bKQ9eiPWsVdbtYVtFtCVLK_8', 1731190259, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T22:10:58.837Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('gvfo-l0lvq-6nKUaaUwLixVklk2cVEhn', 1731112698, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T00:38:17.633Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('h1j1eaRXDaCLtiHreDiLnHzqZ8UFYTmc', 1731121923, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:12:03.359Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('hMuRw--zCfO0gBYR7g7LDT5fChvd0z8W', 1731304115, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T05:48:34.670Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('hYuVJUbSCNcS1MbEaRh6GOXKArIsvJwq', 1731316482, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T09:14:41.943Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('hjvS2VBV0V3-8d6DLHUGnmYVMr1P6Q-U', 1731177030, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T18:30:30.254Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('hnYkEMOlY5J17_bdBYX_NY0RljaIlqZm', 1731098429, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T20:40:28.608Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('huJF-55D2PtcvV3WRUM0MvHVfFKw8hM8', 1731300755, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T04:52:34.906Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('i-DzALbssM-2FVwadS-XFCtHLNnvThPy', 1731256614, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T16:36:53.504Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('i4_SEr9y8ZXOur6PFi5tpohqjvL5Hbkw', 1731236621, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T11:03:41.067Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('iYG1gZ3EqTvnWmGuMzQXWOad7t9gTdqV', 1731280558, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T23:15:58.490Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('ipxteRTF5fSsm5H8HdgL4WyVp3jTBpjO', 1731241190, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T12:19:50.181Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('jnQLot91xaFU3Tqx3SenwzrF3kn8_pOR', 1731201473, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T01:17:53.184Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('k138PfyoQ_pQNxHGiJmB30Urc-1mzMC5', 1731130895, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T05:41:35.167Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('k7IeSr0mcCPdcogVhhFFIAoYM04Zv2Lp', 1731183965, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:26:04.770Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('kCSrDoqjnNTMAsj6MmrVLXRkg51Vjnyc', 1731221240, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T06:47:20.051Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('kJnQCtkc8zfB-sabIKAjWiz2szfuhQ0h', 1731314776, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T08:46:16.427Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('kQnK_5lmTAxOzIbwyNLgf0VudhaIOt5C', 1731295298, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T03:21:38.280Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('kRcK80JQb-lF4gMJuh0rNOYntziYPsSV', 1731232404, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T09:53:23.640Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('kceEDdnmjazcJweFGNecaZcc8Zm_G_4x', 1731161567, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T14:12:47.399Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('l6mVXzhS_iy8KwtJF_ngGmFE-D7gZy5V', 1731127812, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:50:11.609Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('lAHWwR-twoG7nqMMawn7kexp1sTERayM', 1731108403, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:26:43.243Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('lF_SnQOKZNJrDsSqh1FjdPsxxY38R2Ed', 1731093441, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T19:17:20.905Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('lOxuXewuIzYnmZBZsMyIdf7Oxxou-7CF', 1731149832, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T10:57:12.096Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('lRUqSzTCuQ_TCxQRBT3tMI9VRFsxBMiR', 1731143567, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T09:12:46.765Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('m03hS3Nv4dlfFEU76fEFpQjz4K4cmMOH', 1731233616, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T10:13:35.722Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('mDlt5rncStxCqhVL6LM3cVb8AJ9bRqDL', 1731228673, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T08:51:12.842Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('mIISWwQcNUNnhFhJ_YLN_T93KVAyXbir', 1731151744, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T11:29:03.973Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('mkocfNa0wyATeJ8Lmb1cyBjOz9Nl_hI5', 1731285197, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T00:33:16.525Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('mtwRf22RVIZ8iLWBKJzHvU8SOCNb4RnF', 1731176052, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T18:14:12.376Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('njzp-28lcouIDH0UvAwDIp50Potyupzz', 1731182503, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T20:01:42.797Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('nooWxIFlRAL9cBFKby3uKDzVXX5G-Ee4', 1731128380, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:59:39.992Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('oAmoomMIeViKXJ2ifbbcfJ4HvsqLpw_N', 1731189893, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T22:04:53.049Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('oHw9-eLpZ20P4a7Flj4BPzVOydSw8Btn', 1731181566, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:46:05.735Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('odNvuVbSFxYEcZwyMT_ohkGbZ8oWZ_9o', 1731125956, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T04:19:15.934Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('pIowDsZ4b5x4nhfEVnyFP_hKi2v-1Hz9', 1731150622, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T11:10:21.668Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('pSqYeRRtkl-patosXI4Wh1H1I8fusjPX', 1731239843, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T11:57:22.552Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('qDZSxKN7Z2xi51RVw4r6COD-8u0u5HLE', 1731111787, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T00:23:07.004Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('qNVeshhX1UnpaqW6wtCDxtjUDHGppNmz', 1731145828, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T09:50:28.285Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('qQaRurTTZEKis48EI7simmP148xAeJRN', 1731165932, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T15:25:31.764Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('qiMoCPEikEw_ZL8CvRoh8nOtzBP4SEnK', 1731217926, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T05:52:05.782Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('rAp3WQXzqcwDuMcJwYuN5OwUwtSdz3cR', 1731133567, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:26:07.190Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('rVl1LliZYoAXZAAaAtkZ5BXKn3UBw3rM', 1731080414, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T15:40:13.723Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('rjIvC-8VjiyICDMbquaGAzBuQIddzcPi', 1731124248, '{\"cookie\":{\"originalMaxAge\":259199999,\"expires\":\"2024-11-09T03:50:48.137Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('s98_s_uf1onKV0WExLoXbkzySe2BHv8L', 1731117352, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:55:51.817Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('sltRcf1fN2cy8UzWqrggYcCOjypavGdE', 1731116139, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T01:35:39.499Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('svAYHQa5PjeRBbQyEKafduBr-AEqWUX9', 1731182095, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T19:54:54.759Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('swJQPdzI6EJ0BIQNHJE46B3WkGnDhk5Q', 1731074187, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T13:56:27.301Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('t0pSPyZ-nR3rsqMNMag9dOuh3_83dUg8', 1731273749, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T21:22:29.057Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('t3PLD8PCMmdAfiwMkITGv6YbhZ7kZRaZ', 1731261012, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T17:50:12.182Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('t9ziTBYXWIklT5ajCT7xLTqu9y0hWzj0', 1731080001, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T15:33:20.822Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('tfCioBun6ldiO7gnCMaSP4LMudajzxvF', 1731212132, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T04:15:31.661Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('tn9_YwDFzaYYeZR7KHKIIAAgIwiSTCC2', 1731106245, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T22:50:44.878Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('uFzw_F8txSaNUUF0ggD5nKsKxfagEo6X', 1731123108, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:31:47.512Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('uk1g_bk_QBqH-lIOHUKvhmT2MQcxWb11', 1731248864, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T14:27:44.222Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('uljwoJX8O4AV1D1S9XEfhbbLbJQaBLEU', 1731147793, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T10:23:12.586Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('umltLSfls6N2KcFQS4SJ6_i7N1XwR-KE', 1731222915, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T07:15:14.909Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('vsjS39vzQPFQF3Xsb25ediZZ0OkM_uEI', 1731166288, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T15:31:28.356Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('wIf6MraMRNJBYS_hIt04S8aPAzZ5kEUC', 1731212922, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T04:28:41.790Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('wTke1Xnrc0Fyiqt3_wpZ9W4d2rl0W0dt', 1731281387, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T23:29:46.704Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('wgig5k-u4LhfxuGuzMNIh2cvhiuhGF7y', 1731133791, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T06:29:50.674Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('wjhD9F_6FANKtrt4cRXXbJnZIXliUmrh', 1731092374, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T18:59:33.614Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('woRjM0uWQ7q1FaGHvCh6bIUSW6CdIff7', 1731217922, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T05:52:02.327Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('x7Vj78m2a92tnLDXm0vpnsB3b5CsDwTJ', 1731117807, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:03:27.195Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('xXsIlxv-_KEqkFkDChD_7PbC2Tz8NwIR', 1731118651, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T02:17:30.927Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('xhIAVnBeyD65FAx_WutHyPqCVsp2JhVI', 1731121703, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-09T03:08:22.717Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('xlpwRG1Py8GayUjSsElsA9MhUo_9Epvv', 1731286254, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-11T00:50:54.292Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('xyT-_zoyzO2_AIymiSTwDHkz7DrFUgGj', 1731213774, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T04:42:53.590Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('ybNoyD9TMD8LX_1PoUGO9-gwezg3eZIe', 1731258104, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-10T17:01:44.259Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}'),
('zh1T7nxrS3thtkqGEu-VDRiIZ3enAag1', 1731108931, '{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2024-11-08T23:35:30.902Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"views\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `holidays_taken` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `login_attempts` int(11) DEFAULT 0,
  `lockout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `holidays_taken`, `password`, `role`, `created_at`, `login_attempts`, `lockout_time`) VALUES
(1, 'Mihir', 'Bari', 'mihir.b@techsa.net', '5.5', '$2a$10$yed3UxCrgwQ8hoF6npOD1eWHpMBfgsTvArC70MrDaZy0ieGabT6bi', 'admin', '2024-04-15 18:03:02', 0, NULL),
(2, 'Kushal', 'Sachdev', 'kushal.s@techsa.net', '0', '$2a$10$1MPt8kh.ColSqdTSO6iRqe0MmglgPCMQr8DozyighSSWdNfr155H2', 'admin', '2024-04-15 18:07:02', 0, NULL),
(4, 'sanjiv', 'Sachdev', 'sanjiv.s@techsa.net', '0', '$2a$10$v4gN9EdwbHG9JhYnLPklc.oE9s2ncAps9lM4yhAI3oojPtTILcrta', 'admin', '2024-06-03 13:48:32', 0, NULL),
(5, 'Himani ', 'Gupte', 'himani.g@techsa.net', '2', '$2a$10$ZPW3Zk4dou4g7f844X6ZgOEorOTQotu.aq2kKobUP/XHl3dIFsLR2', 'moderator', '2024-06-04 06:25:10', 0, NULL),
(6, 'Madhu', 'Israni', 'madhu.i@techsa.net', '0', '$2a$10$GhgeM6zDKJmsyRI7usCNz.pb0pGLIAqpwhuIPXCNy4lTXgxqSJyum', 'moderator', '2024-06-04 06:29:12', 0, NULL),
(7, 'Ravi', 'Khanchandani', 'ravi.k@techsa.net', '0', '$2a$10$3enC/84TNwKKwNI.9HxbMOjFD6pbH0TFiSC9S24fkqDN8Q0/EFUWe', 'admin', '2024-06-25 10:42:02', 0, NULL),
(10, 'Prashant ', 'Kadechkar ', 'prashant.k@techsa.net', '4', '$2a$10$DSj9WN9uFlX0cvFFgvqXseOsI08lv.K4ZtfxsBuSHzXtD.xJQ/Q0G', 'user', '2024-09-10 08:06:36', 0, NULL),
(11, 'Aniket ', 'Jagdale ', 'aniket.j@techsa.net', '3', '$2a$10$p2ZD3FrGCz2iWl2znd36J.FXbzeA9oViOenTfig78nAAp1FBJfdxK', 'user', '2024-09-10 08:07:29', 0, NULL),
(12, 'Karthik', 'Kamath', 'karthik.k@techsa.net', '0', '$2a$10$sGCzYJvWaAetBxLi/ArcCOuA.muFY3yrpgen16JdXQGyf7r2n1xvi', 'user', '2024-09-10 08:07:35', 0, NULL),
(14, 'Bhushan', 'Mahajan', 'bhushan.m@techsa.net', '4', '$2a$10$.JRpTml31N9PnCwJJATBWuUXJIAgELnmJf2ASKG0bPp0cbFf3Q2PG', 'user', '2024-09-10 08:09:26', 0, NULL),
(15, 'Rutuja', 'Chavarkar', 'rutuja.c@techsa.net', '3', '$2a$10$8ke5DxCJIfTETeWwpzVEgu6y.NnypcHNISqmXjUaio.VYgsinx6Ai', 'user', '2024-09-10 08:10:18', 0, NULL),
(16, 'Shravya', 'Shetty', 'shravya.s@techsa.net', '0', '$2a$10$l64cox402FjGUpTFuAuWz./c9ToO3Qke6Hxh46EAkDqp7kalGuAbG', 'user', '2024-09-10 08:14:01', 0, NULL),
(17, 'Rohit', 'Hingse', 'rohit.h@techsa.net', '0', '$2a$10$6T/K.eQh8FxABOgTC1DK9u3fijSPSGtYNuPNjYnTRwTokosgIpBBS', 'user', '2024-09-10 08:19:23', 0, NULL),
(18, 'Suraj', 'Kumbhar', 'suraj.k@techsa.net', '7', '$2a$10$2K9Quxq8s.s.nRGrl7jHKebXe0V4QV3gVXlDPYLG.b4Gf5eE2Q642', 'user', '2024-09-10 08:20:48', 0, NULL),
(19, 'Divya', 'Yadav', 'divya.y@techsa.net', '2', '$2a$10$riGjAPAbOYi8qncJKr3m2OW4Ny3g/Ef2H/8hca..4xNvVcwIYKWFa', 'user', '2024-09-10 08:21:45', 0, NULL),
(20, 'Swapnil', 'Kadam', 'swapnil.k@techsa.net', '7', '$2a$10$4J8..6VFze9hK3x8sCxSROhzZVtJD6eCNLsra8df/Po6VYuAsjuvq', 'user', '2024-09-10 08:47:53', 0, NULL),
(21, 'Arati', 'Kamble', 'arati.k@techsa.net', '10.5', '$2a$10$KAw3ypfRJZWrlPelX.rk4u3X126pR3kh5fnPaatq19sVyHu1xpc6e', 'user', '2024-09-10 08:59:36', 0, NULL),
(22, 'Nishi', 'Puthran', 'nishi.p@techsa.net', '0', '$2a$10$SX.xCUlLQv37XRCKJZpere4knhyFqU/rtGT97IH/7lA4ETpyhabR6', 'user', '2024-09-10 08:59:49', 0, NULL),
(23, 'Abdhija', 'Sharma', 'abdhija.s@techsa.net', '0', '$2a$10$Qi.OTW4jBxQKnBDahb6qLOBvjqUq2dnGNQ5EXo7ZUceqrBTTQfYWW', 'user', '2024-09-10 09:00:39', 0, NULL),
(24, 'Rohit', 'Lonkar', 'rohit.l@techsa.net', '1', '$2a$10$/NwPykJjclhuF8zleJv.R.1obNaE0WfNUMhdyXBpVZKzIPNg.llda', 'user', '2024-09-10 09:27:48', 0, NULL),
(25, 'Diana', 'Cardoz', 'diana.c@techsa.net', '6', '$2a$10$NltkAplVgqH73F4aDmc6mOI3.3hTilGRFEUHKIZRB5AINBK6orNX2', 'user', '2024-09-10 09:38:07', 0, NULL),
(26, 'Abhilash', 'Lonkar', 'abhilash.l@techsa.net', '2', '$2a$10$3otlDNK7qKh/rLO1medO2uPQyZ6eI8ctxKgA5fbVL6LfPDs6U7xK.', 'user', '2024-09-10 09:52:41', 0, NULL),
(27, 'Shriniwas', 'Jangam', 'shriniwas.j@techsa.net', '1', '$2a$10$jIApZqWf0l8U70NN5QbZrOcm/gjO0B.gFHrkODLv6jTZb7O.ld/UW', 'user', '2024-09-10 09:59:41', 0, NULL),
(28, 'Sagar', 'Deshpande', 'sagar.d@techsa.net', '3', '$2a$10$tiV8aMliudq6WBxvnCOvUuIKFgkTPOf4Pwvy9WUdmhhvOZPxry6Uy', 'Ro-User', '2024-09-11 09:02:24', 0, NULL),
(29, 'Vicky', 'Malekar', 'vicky.m@techsa.net', '0', '$2a$10$q4Xv6d9O24.L0jSOoSk8yOOStOmqZBWxdrNgs9hE5665eTXE2iYKa', 'user', '2024-09-11 10:13:14', 0, NULL),
(30, 'Pawan', 'Nenwani', 'pawan.n@techsa.net', '1', '$2a$10$PGAVnyJEpedoVLYIp4uHKuPDZ70fT8j2qFb7hs3tTw1OK0V3XdKGi', 'user', '2024-09-16 07:28:17', 0, NULL),
(31, 'Kajal', 'Upadhyay', 'kajal.u@techsa.net', '3', '$2a$10$rSWAj8GmMad92Hk6t/hEd.gF5REMWHISyEv3UiO77Ml9Gjq6KGnUi', 'user', '2024-10-01 06:45:44', 0, NULL),
(32, 'Sagar', 'Bandi', 'sagar.b@techsa.net', '0', '$2a$10$krj09VI5tyteW5Pd9qNCCOxQvnOYvwH0GRpCgvsCR8j2g1ireR2ma', 'user', '2024-10-01 07:57:14', 0, NULL),
(33, 'Abhishek ', 'Dubey', 'abhishek.d@techsa.net', '2', '$2a$10$muTNp.Rhk7nG.i49hwdhpuGQi/6jIqMMrzvC0pLlzb28JPiVYQs.m', 'user', '2024-10-06 13:52:03', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alertlog`
--
ALTER TABLE `alertlog`
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
-- Indexes for table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaveapplication`
--
ALTER TABLE `leaveapplication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavelogs`
--
ALTER TABLE `leavelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opportunitylog`
--
ALTER TABLE `opportunitylog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `alertlog`
--
ALTER TABLE `alertlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `employes`
--
ALTER TABLE `employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000019;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `leaveapplication`
--
ALTER TABLE `leaveapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `leavelogs`
--
ALTER TABLE `leavelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `opportunity`
--
ALTER TABLE `opportunity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `opportunitylog`
--
ALTER TABLE `opportunitylog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
