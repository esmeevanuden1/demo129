-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 01:30 PM
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
-- Database: `bezorgdthuis`
--

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(160) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `vehicle_method` enum('bike','scooter','car','walk') NOT NULL,
  `rating` decimal(3,2) DEFAULT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `full_name`, `email`, `phone`, `vehicle_method`, `rating`) VALUES
(1, 'Ahmed Ali', 'ahmed.ali@couriers.example.com', '+31 6 22305701', 'car', 4.03),
(2, 'Bo ter Horst', 'bo.ter.horst@couriers.example.com', '+31 6 22449902', 'bike', 4.47),
(3, 'Chung Wei', 'chung.wei@couriers.example.com', '+31 6 22317803', 'scooter', 3.98),
(4, 'Dora Kok', 'dora.kok@couriers.example.com', '+31 6 22584404', 'scooter', 4.55),
(5, 'Erik van Bommel', 'erik.van.bommel@couriers.example.com', '+31 6 22173905', 'bike', 4.69);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(160) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `address` varchar(220) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `default_payment` enum('ideal','creditcard','paypal','cash') DEFAULT NULL,
  `password_hash` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `email`, `phone`, `address`, `birth_date`, `default_payment`, `password_hash`) VALUES
(1, 'Sanne Jansen', 'sanne.jansen@example.com', '+31 6 12912401', 'Randomstraat 11, 5611 AB Eindhoven', '1988-04-08', 'creditcard', NULL),
(2, 'Daan de Vries', 'daan.devries@example.com', '+31 6 12239602', 'Randomstraat 12, 5619 AB Eindhoven', '1982-10-14', 'ideal', NULL),
(3, 'Lotte Bakker', 'lotte.bakker@example.com', '+31 6 12132103', 'Randomstraat 13, 5614 AB Eindhoven', '1987-09-20', 'ideal', NULL),
(4, 'Milan van Dijk', 'milan.vandijk@example.com', '+31 6 12813504', 'Randomstraat 14, 5619 AB Eindhoven', '1993-04-15', 'paypal', NULL),
(5, 'Julia Smit', 'julia.smit@example.com', '+31 6 12103005', 'Randomstraat 15, 5617 AB Eindhoven', '1990-05-05', 'creditcard', NULL),
(6, 'Noah Bos', 'noah.bos@example.com', '+31 6 12532306', 'Randomstraat 16, 5612 AB Eindhoven', '1992-02-12', 'paypal', NULL),
(7, 'Emma Meijer', 'emma.meijer@example.com', '+31 6 12874307', 'Randomstraat 17, 5611 AB Eindhoven', '1994-09-04', 'cash', NULL),
(8, 'Finn Mulder', 'finn.mulder@example.com', '+31 6 12208008', 'Randomstraat 18, 5615 AB Eindhoven', '1999-06-19', 'creditcard', NULL),
(9, 'Tess Visser', 'tess.visser@example.com', '+31 6 12181509', 'Randomstraat 19, 5614 AB Eindhoven', '1989-02-28', 'creditcard', NULL),
(10, 'Sem Peters', 'sem.peters@example.com', '+31 6 12225810', 'Randomstraat 20, 5615 AB Eindhoven', '1994-11-27', 'paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `dropoff_time` datetime DEFAULT NULL,
  `address` varchar(220) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `order_id`, `courier_id`, `pickup_time`, `dropoff_time`, `address`) VALUES
(1, 1, 4, '2025-11-04 06:21:00', '2025-11-04 06:35:00', '(snapshot) 68 Teststraat, 5613 CD Eindhoven'),
(2, 2, 4, '2025-11-02 07:35:00', '2025-11-02 07:57:00', '(snapshot) 98 Teststraat, 5618 CD Eindhoven'),
(3, 3, 1, '2025-11-04 05:47:00', '2025-11-04 06:17:00', '(snapshot) 130 Teststraat, 5614 CD Eindhoven'),
(4, 4, 1, '2025-11-05 08:21:00', '2025-11-05 08:33:00', '(snapshot) 195 Teststraat, 5619 CD Eindhoven'),
(5, 5, 2, '2025-10-28 07:58:00', '2025-10-28 08:20:00', '(snapshot) 172 Teststraat, 5616 CD Eindhoven'),
(6, 6, 3, '2025-10-31 09:30:00', '2025-10-31 09:56:00', '(snapshot) 61 Teststraat, 5615 CD Eindhoven'),
(7, 7, 3, '2025-11-01 21:48:00', '2025-11-01 22:11:00', '(snapshot) 120 Teststraat, 5611 CD Eindhoven'),
(8, 8, 4, '2025-11-02 06:56:00', '2025-11-02 07:07:00', '(snapshot) 167 Teststraat, 5619 CD Eindhoven'),
(9, 9, 2, '2025-11-03 03:46:00', '2025-11-03 03:56:00', '(snapshot) 100 Teststraat, 5615 CD Eindhoven'),
(10, 10, 5, '2025-10-29 22:20:00', '2025-10-29 22:40:00', '(snapshot) 15 Teststraat, 5611 CD Eindhoven'),
(11, 11, 5, '2025-11-04 01:11:00', '2025-11-04 01:29:00', '(snapshot) 53 Teststraat, 5616 CD Eindhoven'),
(12, 12, 5, '2025-10-21 21:09:00', '2025-10-21 21:21:00', '(snapshot) 138 Teststraat, 5614 CD Eindhoven');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL CHECK (`price` >= 0),
  `item_type` enum('dish','drink') NOT NULL DEFAULT 'dish',
  `is_alcoholic` tinyint(1) DEFAULT NULL CHECK (`item_type` = 'dish' and `is_alcoholic` is null or `item_type` = 'drink' and `is_alcoholic` is not null),
  `size_ml` int(11) DEFAULT NULL,
  `weight_g` int(11) DEFAULT NULL,
  `allergens` varchar(200) DEFAULT NULL,
  `size` enum('S','M','L','XL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `restaurant_id`, `name`, `description`, `price`, `item_type`, `is_alcoholic`, `size_ml`, `weight_g`, `allergens`, `size`) VALUES
(1, 1, 'Margherita', 'Klassieke pizza met tomaat, mozzarella en basilicum.', 8.50, 'dish', NULL, NULL, 500, 'melk,gluten', 'L'),
(2, 1, 'Pepperoni', 'Tomaat, mozzarella en pepperoni.', 9.95, 'dish', NULL, NULL, 520, 'melk,gluten', 'L'),
(3, 1, 'Cola', 'Frisdrank', 2.50, 'drink', 0, 330, NULL, NULL, NULL),
(4, 2, 'Sake Nigiri (2st)', 'Zalmballetjes op rijst.', 4.80, 'dish', NULL, NULL, 90, 'vis', 'S'),
(5, 2, 'California Maki (8st)', 'Krab, avocado, komkommer.', 7.90, 'dish', NULL, NULL, 180, 'sesam,gluten', 'M'),
(6, 2, 'Green Tea', 'Iced green tea.', 2.80, 'drink', 0, 500, NULL, NULL, NULL),
(7, 3, 'Butter Chicken', 'Romige tomatencurry met kip.', 12.50, 'dish', NULL, NULL, 450, 'melk,notentraces', 'L'),
(8, 3, 'Chana Masala', 'Kikkererwten curry.', 9.90, 'dish', NULL, NULL, 400, NULL, 'L'),
(9, 3, 'Mango Lassi', 'Yoghurt-drank met mango.', 3.50, 'drink', 0, 300, NULL, 'melk', NULL),
(10, 4, 'Classic Smash', 'Dubbele smashed beef burger.', 10.90, 'dish', NULL, NULL, 380, 'gluten,melk', 'L'),
(11, 4, 'Veggie Burger', 'Vegetarische burger met kaas.', 9.90, 'dish', NULL, NULL, 360, 'gluten,melk', 'L'),
(12, 4, 'Fanta', 'Frisdrank', 2.50, 'drink', 0, 330, NULL, NULL, NULL),
(13, 5, 'Vegan Bowl', 'Quinoa, falafel, groenten en tahin.', 11.50, 'dish', NULL, NULL, 420, 'sesam', 'M'),
(14, 5, 'Vegan Pizza', 'Plantaardige kaas en groenten.', 10.90, 'dish', NULL, NULL, 510, 'gluten', 'L'),
(15, 5, 'Kombucha', 'Gefermenteerde drank.', 3.20, 'drink', 0, 250, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_options`
--

CREATE TABLE `item_options` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `option_type` varchar(60) NOT NULL,
  `choice` varchar(100) NOT NULL,
  `extra_price` decimal(6,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_options`
--

INSERT INTO `item_options` (`id`, `item_id`, `option_type`, `choice`, `extra_price`) VALUES
(1, 1, 'Toppings', 'Extra kaas', 1.00),
(2, 1, 'Toppings', 'Olijven', 0.80),
(3, 2, 'Toppings', 'Extra pepperoni', 1.20),
(4, 4, 'Saus', 'Sojasaus', 0.00),
(5, 7, 'Pittigheid', 'Mild', 0.00),
(6, 7, 'Pittigheid', 'Medium', 0.00),
(7, 7, 'Pittigheid', 'Hot', 0.00),
(8, 10, 'Kaas', 'Cheddar', 0.50),
(9, 11, 'Kaas', 'Geen kaas', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` enum('placed','confirmed','preparing','out_for_delivery','delivered','cancelled') NOT NULL DEFAULT 'placed',
  `order_time` datetime NOT NULL,
  `payment_method` enum('ideal','creditcard','paypal','cash') NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `delivery_fee` decimal(8,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `restaurant_id`, `customer_id`, `status`, `order_time`, `payment_method`, `subtotal`, `delivery_fee`, `total_amount`) VALUES
(1, 3, 7, 'delivered', '2025-11-04 06:02:00', 'paypal', 7.00, 2.00, 9.00),
(2, 3, 7, 'delivered', '2025-11-02 07:28:00', 'cash', 12.50, 2.00, 14.50),
(3, 3, 5, 'delivered', '2025-11-04 05:33:00', 'creditcard', 67.20, 2.00, 69.20),
(4, 4, 6, 'delivered', '2025-11-05 08:01:00', 'paypal', 13.40, 2.50, 15.90),
(5, 4, 3, 'delivered', '2025-10-28 07:44:00', 'cash', 7.50, 2.50, 10.00),
(6, 1, 4, 'delivered', '2025-10-31 09:23:00', 'creditcard', 37.95, 2.50, 40.45),
(7, 4, 10, 'delivered', '2025-11-01 21:30:00', 'cash', 10.90, 2.50, 13.40),
(8, 1, 6, 'delivered', '2025-11-02 06:48:00', 'cash', 11.15, 2.50, 13.65),
(9, 2, 2, 'delivered', '2025-11-03 03:29:00', 'cash', 7.90, 2.00, 9.90),
(10, 3, 8, 'delivered', '2025-10-29 22:14:00', 'cash', 25.00, 2.00, 27.00),
(11, 2, 2, 'delivered', '2025-11-04 00:56:00', 'creditcard', 22.80, 2.00, 24.80),
(12, 3, 8, 'delivered', '2025-10-21 21:01:00', 'ideal', 29.70, 2.00, 31.70);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` >= 1),
  `base_price` decimal(8,2) NOT NULL,
  `options_note` varchar(255) DEFAULT NULL,
  `options_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `quantity`, `base_price`, `options_note`, `options_total`, `line_total`) VALUES
(1, 1, 9, 2, 3.50, NULL, 0.00, 7.00),
(2, 2, 7, 1, 12.50, 'Pittigheid: Hot', 0.00, 12.50),
(3, 3, 7, 3, 12.50, NULL, 0.00, 37.50),
(4, 3, 8, 3, 9.90, NULL, 0.00, 29.70),
(5, 4, 10, 1, 10.90, NULL, 0.00, 10.90),
(6, 4, 12, 1, 2.50, NULL, 0.00, 2.50),
(7, 5, 12, 3, 2.50, NULL, 0.00, 7.50),
(8, 6, 1, 3, 8.50, NULL, 0.00, 25.50),
(9, 6, 3, 1, 2.50, NULL, 0.00, 2.50),
(10, 6, 2, 1, 9.95, NULL, 0.00, 9.95),
(11, 7, 10, 1, 10.90, NULL, 0.00, 10.90),
(12, 8, 2, 1, 9.95, 'Toppings: Extra pepperoni', 1.20, 11.15),
(13, 9, 5, 1, 7.90, NULL, 0.00, 7.90),
(14, 10, 7, 2, 12.50, 'Pittigheid: Hot', 0.00, 25.00),
(15, 11, 4, 3, 4.80, 'Saus: Sojasaus', 0.00, 14.40),
(16, 11, 6, 3, 2.80, NULL, 0.00, 8.40),
(17, 12, 8, 3, 9.90, NULL, 0.00, 29.70);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `cuisine_type` varchar(80) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price_category` tinyint(4) NOT NULL CHECK (`price_category` between 1 and 5),
  `rating` decimal(3,2) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `min_order` decimal(8,2) DEFAULT 0.00,
  `delivery_fee` decimal(8,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `cuisine_type`, `address`, `phone`, `description`, `price_category`, `rating`, `min_order`, `delivery_fee`) VALUES
(1, 'Pizza Piazza', 'Pizza', 'Kleine Berg 12, Eindhoven', '+31 40 123 4567', 'Dunne bodem Napolitaanse pizza.', 2, 4.50, 10.00, 2.50),
(2, 'Sushi Sakura', 'Sushi', 'Stationsplein 5, Eindhoven', '+31 40 234 5678', 'Dagverse sushi en sashimi.', 3, 4.70, 15.00, 2.00),
(3, 'Curry Corner', 'Indisch', 'Geldropseweg 150, Eindhoven', '+31 40 345 6789', 'Kruidige curry\'s en naan.', 2, 4.20, 12.50, 2.00),
(4, 'Burger Bros', 'Burgers', 'Stratumseind 23, Eindhoven', '+31 40 456 7890', 'Smashed burgers en friet.', 2, 4.30, 12.00, 2.50),
(5, 'Viva Vegan', 'Vegan', 'Wilhelminaplein 8, Eindhoven', '+31 40 567 8901', '100% plantaardig menu.', 2, 4.60, 12.00, 1.50);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_rating` tinyint(4) NOT NULL CHECK (`food_rating` between 1 and 5),
  `delivery_rating` tinyint(4) NOT NULL CHECK (`delivery_rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `customer_id`, `order_id`, `food_rating`, `delivery_rating`, `comment`, `created_at`) VALUES
(1, 7, 1, 5, 5, 'Knapperige friet en warme burger.', '2025-11-04 07:35:00'),
(2, 7, 2, 4, 4, 'Knapperige friet en warme burger.', '2025-11-02 08:57:00'),
(3, 5, 3, 4, 4, 'Knapperige friet en warme burger.', '2025-11-04 07:17:00'),
(4, 3, 5, 5, 4, 'Heerlijk eten, aanrader.', '2025-10-28 09:20:00'),
(5, 4, 6, 4, 4, 'Knapperige friet en warme burger.', '2025-10-31 10:56:00'),
(6, 10, 7, 4, 4, 'Erg smaakvol.', '2025-11-01 23:11:00'),
(7, 8, 10, 4, 4, 'Knapperige friet en warme burger.', '2025-10-29 23:40:00'),
(8, 2, 11, 5, 4, 'Top service.', '2025-11-04 02:29:00'),
(9, 8, 12, 4, 5, 'Lekker en snel bezorgd!', '2025-10-21 22:21:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `idx_deliveries_courier` (`courier_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_restaurant` (`restaurant_id`);

--
-- Indexes for table `item_options`
--
ALTER TABLE `item_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_item_options_item` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_orders_customer_time` (`customer_id`,`order_time`),
  ADD KEY `idx_orders_restaurant_time` (`restaurant_id`,`order_time`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_items_item` (`item_id`),
  ADD KEY `idx_order_items_order` (`order_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_review_per_order_customer` (`customer_id`,`order_id`),
  ADD KEY `fk_reviews_order` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item_options`
--
ALTER TABLE `item_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `fk_deliveries_courier` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  ADD CONSTRAINT `fk_deliveries_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_items_rest` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_options`
--
ALTER TABLE `item_options`
  ADD CONSTRAINT `fk_item_options_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_cust` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_orders_rest` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_reviews_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
