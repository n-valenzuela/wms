-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2018 at 07:37 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nvalen-wms`
--
CREATE DATABASE IF NOT EXISTS `nvalen-wms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nvalen-wms`;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `company_initial` varchar(5) NOT NULL,
  `company_id` int(10) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `company_license` int(5) NOT NULL,
  `company_licensekey` varchar(12) NOT NULL,
  `company_warehousename` enum('Warehouse1','warehouse2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`company_initial`, `company_id`, `company_name`, `company_address`, `company_license`, `company_licensekey`, `company_warehousename`) VALUES
('SPLI', 600001, 'Susumi Philippine Logistics, Inc.', 'Lot 4E Bldg. H1&H2, First Philippine Industrial park, Santo Tomas, Batangas', 2, '600001S21803', 'Warehouse1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `customer_code` int(50) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_address` varchar(150) DEFAULT NULL,
  `customer_contactperson` varchar(50) DEFAULT NULL,
  `customer_contactnumber` varchar(12) DEFAULT NULL,
  `customer_tin` varchar(12) DEFAULT NULL,
  `customer_paymentterms` int(120) DEFAULT NULL,
  `customer_remarks` varchar(200) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`customer_code`, `customer_name`, `customer_address`, `customer_contactperson`, `customer_contactnumber`, `customer_tin`, `customer_paymentterms`, `customer_remarks`, `company_id`) VALUES
(1000000, 'Tann Philippines, Inc.', '1st St. First Philippine Industrial Park, Santo Tomas Batangas', 'Abelardo Tayag', '171771234', '000729123123', 30, 'Test Customer Only', 600001),
(1000001, 'Nissin Precision Philippines, Inc.', '2nd St. Frist Philippine Industrial Park', 'Juan Luna', '434301128', '000123456789', 15, 'Test Customer Only', 600001);

-- --------------------------------------------------------

--
-- Table structure for table `item_details`
--

CREATE TABLE `item_details` (
  `customer_code` int(50) NOT NULL,
  `item_code` varchar(15) NOT NULL,
  `item_description` varchar(150) DEFAULT NULL,
  `item_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_details`
--

INSERT INTO `item_details` (`customer_code`, `item_code`, `item_description`, `item_remarks`) VALUES
(1000000, 'TPI-0001', 'White Base Paper Rolls', 'added 2018-03-08'),
(1000000, 'TPI-0002', 'Off-White Base Paper Rolls', 'added 2018-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `trans_id` int(12) NOT NULL,
  `trans_lpn` int(12) NOT NULL,
  `trans_customerreference` varchar(50) DEFAULT NULL,
  `trans_transactiontype` enum('incoming','outgoing','sortout') NOT NULL,
  `trans_receivedate` datetime DEFAULT '0000-00-00 00:00:00',
  `trans_expecteddate` datetime DEFAULT NULL,
  `trans_deliverydate` datetime DEFAULT '0000-00-00 00:00:00',
  `trans_orderdate` datetime DEFAULT NULL,
  `trans_itemqty` decimal(10,4) NOT NULL,
  `trans_itemuom` enum('plt/s','rol/s','drm/s','box/s','pc/s','btl/s','can/s') NOT NULL,
  `trans_breakdownqty` double(5,4) DEFAULT NULL,
  `trans_breakdownuom` enum('plt/s','rol/s','drm/s','box/s','pc/s','btl/s','can/s') DEFAULT NULL,
  `trans_length` decimal(10,4) DEFAULT NULL,
  `trans_width` decimal(10,4) DEFAULT NULL,
  `trans_height` decimal(10,4) DEFAULT NULL,
  `trans_weight` decimal(10,4) DEFAULT NULL,
  `trans_mfgdate` datetime DEFAULT NULL,
  `trans_expdate` datetime DEFAULT NULL,
  `trans_limitdays` int(4) DEFAULT NULL,
  `trans_locationid` varchar(10) NOT NULL,
  `trans_Remarks` varchar(200) DEFAULT NULL,
  `customer_code` int(50) NOT NULL,
  `item_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`trans_id`, `trans_lpn`, `trans_customerreference`, `trans_transactiontype`, `trans_receivedate`, `trans_expecteddate`, `trans_deliverydate`, `trans_orderdate`, `trans_itemqty`, `trans_itemuom`, `trans_breakdownqty`, `trans_breakdownuom`, `trans_length`, `trans_width`, `trans_height`, `trans_weight`, `trans_mfgdate`, `trans_expdate`, `trans_limitdays`, `trans_locationid`, `trans_Remarks`, `customer_code`, `item_code`) VALUES
(5000000, 18030900, 'Test Transaction', 'incoming', '2018-03-09 10:00:00', NULL, '0000-00-00 00:00:00', NULL, '5.0000', 'rol/s', NULL, NULL, '9.9999', '9.9999', '9.9999', '9.9999', NULL, NULL, NULL, 'STAGE', NULL, 1000000, 'TPI-0001');

-- --------------------------------------------------------

--
-- Table structure for table `transport_details`
--

CREATE TABLE `transport_details` (
  `transport_id` varchar(12) NOT NULL,
  `trans_id` int(12) NOT NULL,
  `transport_shipper` varchar(50) DEFAULT NULL,
  `transport_shipfrom` varchar(50) DEFAULT NULL,
  `transport_shipfromaddress` varchar(200) DEFAULT NULL,
  `transport_shipto` varchar(50) DEFAULT NULL,
  `transport_shiptoaddress` varchar(200) DEFAULT NULL,
  `transport_trailernum` varchar(10) DEFAULT NULL,
  `transport_trailertype` varchar(10) DEFAULT NULL,
  `transport_consignee` varchar(50) DEFAULT NULL,
  `transport_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transport_details`
--

INSERT INTO `transport_details` (`transport_id`, `trans_id`, `transport_shipper`, `transport_shipfrom`, `transport_shipfromaddress`, `transport_shipto`, `transport_shiptoaddress`, `transport_trailernum`, `transport_trailertype`, `transport_consignee`, `transport_remarks`) VALUES
('SPLI(NEWGEN)', 5000000, 'New Gen Trucking Service', 'TANN PHILIPPINES, INC.', 'First Philippine Industrial Park, Santo Tomas Batangas', 'SUSUMI PHILIPPINE LOGISTICS, INC.', 'Lot4E Bldg. H1&H2, First Philippine Industrial Park', 'TES1001', '6 Wheeler', NULL, 'Test Transaction only');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(12) NOT NULL,
  `company_id` int(10) NOT NULL,
  `company_initial` varchar(5) NOT NULL,
  `user_username` varchar(12) NOT NULL,
  `user_password` varchar(12) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `user_firstname` varchar(20) NOT NULL,
  `user_middlename` varchar(20) NOT NULL,
  `user_lastname` varchar(20) NOT NULL,
  `user_privilege` enum('administrator','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `company_id`, `company_initial`, `user_username`, `user_password`, `user_email`, `user_firstname`, `user_middlename`, `user_lastname`, `user_privilege`) VALUES
(800001, 600001, 'SPLI', 'admin', 'admin', 'nvalenzuela@spli.ph', 'Nomer', 'Villanueva', 'Valenzuela', 'administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`company_id`,`company_initial`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`customer_code`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `item_details`
--
ALTER TABLE `item_details`
  ADD PRIMARY KEY (`item_code`),
  ADD KEY `customer_code` (`customer_code`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `customer_code` (`customer_code`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `transport_details`
--
ALTER TABLE `transport_details`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `company_id` (`company_id`,`company_initial`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `company_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600002;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `customer_code` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000002;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `trans_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5000001;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=800002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD CONSTRAINT `customer_details_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`);

--
-- Constraints for table `item_details`
--
ALTER TABLE `item_details`
  ADD CONSTRAINT `item_details_ibfk_1` FOREIGN KEY (`customer_code`) REFERENCES `customer_details` (`customer_code`);

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`customer_code`) REFERENCES `customer_details` (`customer_code`),
  ADD CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `item_details` (`item_code`);

--
-- Constraints for table `transport_details`
--
ALTER TABLE `transport_details`
  ADD CONSTRAINT `transport_details_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transaction_details` (`trans_id`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`company_id`,`company_initial`) REFERENCES `company_details` (`company_id`, `company_initial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
