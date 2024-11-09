
--
-- Vedos taulusta `ORDERS`
--

INSERT INTO `ORDERS` (`order_id`, `payment_id`, `customer_id`, `order_time`, `order_full_price`, `currency`) VALUES
(6, 1221, 812, '2024-11-01 17:24:35', 368027.78, 'YEN'),
(11, 998, 115, '2024-11-05 19:11:00', 1160090.99, 'YEN'),
(12, 298, 116, '2024-11-05 19:13:14', 116009.28, 'YEN'),
(13, 298, 117, '2024-11-02 18:13:14', 136009.22, 'YEN'),
(14, 298, 118, '2024-11-01 18:13:14', 136009.22, 'YEN');

-- --------------------------------------------------------


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
-- Vedos taulusta `PRODUCT`
--

INSERT INTO `PRODUCT` (`product_id`, `category_id`, `warehouse_id`, `product_name`, `product_description`, `product_current_price`, `currency`, `inventory`, `image_bank_link`) VALUES
(11, 999, 4, 'Muminpapa', 'Muminpapa biggumuminpapa, howaito', 116009.12, 'YEN', 3, NULL),
(12, 999, 4, 'Miiramumin', 'Shiroi mumin no m?ra. Taka-sa 2 metoru', 116009.28, 'YEN', 6, NULL),
(13, 999, 4, 'Mumintororu', 'Mumin, oki yo. Taka-sa 2 metoru', 116009.28, 'YEN', 12, NULL),
(14, 999, 4, 'Kagitabako-ire', 'Kagitabako-ire, taka-sa 3 metoru no okina boken-sha', 136009.22, 'YEN', 10, NULL),
(15, 999, 4, 'Numachi no kifujin', 'Numachi no kifujin, honmono no kin no ashikubi ringu.', 136009.22, 'YEN', 10, NULL),
(16, 999, 4, 'Nioi o kaida', 'Nioi', 116009.28, 'YEN', 12, NULL),
(17, 999, 4, 'BOshi', 'Tsuneni 1000-ko', 1160090.99, 'YEN', 2890, NULL);

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

--
-- Vedos taulusta `PRODUCT_REVIEW`
--

INSERT INTO `PRODUCT_REVIEW` (`product_review_id`, `customer_id`, `product_id`, `review_text`, `rating`, `review_time`) VALUES
(4, 786, 3, 'Otimo, o melhor produto ', '5', '2024-11-03 09:32:00'),
(16, 812, 17, 'Sutekina shohin mata konyu sa sete itadakimasu', '5', '2024-11-05 18:13:33'),
(17, 812, 14, 'Mei e no tanjobipurezento to shite. Kanojo wa sore ga totemo kiniirimashita', '5', '2024-11-05 18:14:30');

-- --------------------------------------------------------


--
-- Vedos taulusta `SELLER_STORE`
--

INSERT INTO `SELLER_STORE` (`store_id`, `seller_id`, `country_id`, `store_name`) VALUES
(1, 1, 2, 'Kattdräkt'),
(2, 1, 3, 'Cat suits '),
(3, 2, 4, 'Pantalones extra hermosos'),
(4, 3, 5, 'Nailpolish and Nails'),
(5, 4, 6, 'Muminsutoa'),
(6, 6, 4, 'Equipo de orientacion nocturna'),
(7, 6, 4, 'Todo por padel'),
(8, 50, 2, '50 KRONOR BUTIK');

-- --------------------------------------------------------


--
-- Vedos taulusta `SHIPMENT`
--

INSERT INTO `SHIPMENT` (`shipment_id`, `order_id`, `warehouse_id`, `customer_id`, `shipment_status`, `packing_time`, `shipment_time`, `delivery_time`) VALUES
(6, 6, 4, 812, 'DELIVERED', '2024-11-01 19:15:00', '2024-11-02 19:15:00', '2024-11-03 20:15:00'),
(11, 11, 4, 115, 'ORDERED', NULL, NULL, NULL),
(12, 12, 4, 116, 'ORDERED', NULL, NULL, NULL),
(13, 13, 4, 117, 'PACKED', '2024-11-04 15:00:00', NULL, NULL),
(14, 14, 4, 118, 'PACKED', '2024-11-03 14:00:00', NULL, NULL);

-- --------------------------------------------------------


--
-- Vedos taulusta `STORE_CATALOGUE`
--

INSERT INTO `STORE_CATALOGUE` (`catalogue_id`, `store_id`, `product_id`, `product_added_time`) VALUES
(14, 5, 11, '2024-11-05 17:43:23'),
(15, 5, 12, '2024-11-05 17:44:14'),
(16, 5, 13, '2024-11-05 17:44:14'),
(17, 5, 14, '2024-11-05 17:44:14'),
(18, 5, 15, '2024-11-05 17:44:14'),
(19, 5, 16, '2024-11-05 17:44:14'),
(20, 5, 17, '2024-11-05 17:44:14');

-- --------------------------------------------------------

--
-- Vedos taulusta `STORE_COUNTRY`
--

INSERT INTO `STORE_COUNTRY` (`country_id`, `warehouse_id`, `country_name`) VALUES
(1, 1, 'Germany'),
(2, 1, 'Sweden'),
(3, 1, 'United Kingdom'),
(4, 2, 'Brazil'),
(5, 3, 'United States'),
(6, 4, 'Japan');

-- --------------------------------------------------------


--
-- Vedos taulusta `WAREHOUSE`
--

INSERT INTO `WAREHOUSE` (`warehouse_id`, `location_country`, `continent_name`, `warehouse_address`) VALUES
(1, 'Germany', 'Europe', 'Chemnitzer Straße, 14612 Falkensee, Berlin'),
(2, 'Brazil', 'South America', 'R. Herculano Pinheiro, 153 - Pavuna, Rio de Janeiro - RJ, 21532-440, Brasilia'),
(3, 'Unites States', 'North America', '2555 E Olympic Blvd, Los Angeles, CA 90023, Yhdysvallat'),
(4, 'Japan', 'Asia', '1-5-34, Higashibefu, Settsu-shi, Osaka, Japan ');

COMMIT;
