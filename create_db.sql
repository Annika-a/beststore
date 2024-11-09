-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 
-- Generation Time: 08.11.2024 klo 17:37
-- Palvelimen versio: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_37641745_beststuffstore`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `ORDERS`
--

CREATE TABLE `ORDERS` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_full_price` double NOT NULL,
  `currency` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 

-- --------------------------------------------------------

--
-- Rakenne taululle `ORDER_ITEMS`
--

CREATE TABLE `ORDER_ITEMS` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_order_price` double NOT NULL,
  `currency` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `ORDER_ITEMS`
--

INSERT INTO `ORDER_ITEMS` (`order_item_id`, `order_id`, `product_id`, `item_order_price`, `currency`) VALUES
(13, 6, 17, 1160090.99, 'YEN'),
(14, 6, 14, 136009.22, 'YEN'),
(24, 11, 17, 1160090.99, 'YEN'),
(25, 12, 16, 116009.28, 'YEN'),
(26, 13, 15, 136009.22, 'YEN'),
(27, 14, 14, 136009.22, 'YEN');

-- --------------------------------------------------------

--
-- Rakenne taululle `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` varchar(1000) NOT NULL,
  `product_current_price` double NOT NULL,
  `currency` char(3) NOT NULL COMMENT 'EUR, YEN, SEK, GBP, USD, BRL',
  `inventory` int(11) NOT NULL,
  `image_bank_link` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 

-- --------------------------------------------------------

--
-- Rakenne taululle `PRODUCT_REVIEW`
--

CREATE TABLE `PRODUCT_REVIEW` (
  `product_review_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_text` varchar(300) DEFAULT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `review_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
-- --------------------------------------------------------

--
-- Rakenne taululle `SELLER_STORE`
--

CREATE TABLE `SELLER_STORE` (
  `store_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `store_name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
-- --------------------------------------------------------

--
-- Rakenne taululle `SHIPMENT`
--

CREATE TABLE `SHIPMENT` (
  `shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipment_status` varchar(25) NOT NULL COMMENT 'Options: ORDERED, PACKED, IN_TRANSIT, DELIVERED',
  `packing_time` timestamp NULL DEFAULT NULL,
  `shipment_time` timestamp NULL DEFAULT NULL,
  `delivery_time` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
-- --------------------------------------------------------

--
-- Rakenne taululle `STORE_CATALOGUE`
--

CREATE TABLE `STORE_CATALOGUE` (
  `catalogue_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_added_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
-- --------------------------------------------------------

--
-- Rakenne taululle `STORE_COUNTRY`
--

CREATE TABLE `STORE_COUNTRY` (
  `country_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
-- --------------------------------------------------------

--
-- Rakenne taululle `WAREHOUSE`
--

CREATE TABLE `WAREHOUSE` (
  `warehouse_id` int(11) NOT NULL,
  `location_country` varchar(100) NOT NULL,
  `continent_name` varchar(50) NOT NULL,
  `warehouse_address` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

 
--
-- Indexes for dumped tables
--

--
-- Indexes for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `PRODUCT_REVIEW`
--
ALTER TABLE `PRODUCT_REVIEW`
  ADD PRIMARY KEY (`product_review_id`);

--
-- Indexes for table `SELLER_STORE`
--
ALTER TABLE `SELLER_STORE`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `SHIPMENT`
--
ALTER TABLE `SHIPMENT`
  ADD PRIMARY KEY (`shipment_id`);

--
-- Indexes for table `STORE_CATALOGUE`
--
ALTER TABLE `STORE_CATALOGUE`
  ADD PRIMARY KEY (`catalogue_id`);

--
-- Indexes for table `STORE_COUNTRY`
--
ALTER TABLE `STORE_COUNTRY`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `WAREHOUSE`
--
ALTER TABLE `WAREHOUSE`
  ADD PRIMARY KEY (`warehouse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
