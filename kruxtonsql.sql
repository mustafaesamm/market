-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 04:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kruxton`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'عصائر', ''),
(2, 'البان ولحوم', ''),
(3, 'بقوليات', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `casee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`, `casee`) VALUES
(11, '334080447790', 12000, 12000, 15877978, '2023-08-23 21:29:35', 1),
(12, '218317417732', 12000, 12000, 1272156, '2023-08-24 18:25:56', 1),
(13, '457916079965', 8000, 8000, 94609944, '2023-08-24 18:29:35', 1),
(14, '379558055836', 8000, 8000, 85121256, '2023-08-24 19:00:04', 1),
(15, '460419493539', 500, 250, 15110040, '2023-08-24 19:05:35', 1),
(16, '277332934026', 8000, 8000, 60588326, '2023-09-06 21:32:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL,
  `casee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`, `casee`) VALUES
(21, 11, 2, 2, 4000, 8000, 1),
(25, 11, 2, 1, 4000, 4000, 1),
(26, 11, 2, 1, 4000, 4000, 0),
(27, 12, 2, 2, 4000, 8000, 1),
(28, 13, 2, 2, 4000, 8000, 1),
(29, 14, 2, 2, 4000, 8000, 1),
(30, 15, 3, 2, 250, 500, 1),
(31, 16, 2, 2, 4000, 8000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `QrCode` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Unavailable,1=Available',
  `qtyOfItem` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `QrCode`, `status`, `qtyOfItem`) VALUES
(1, 1, 'داليا', 'ته', 250, '177', 1, '30000'),
(2, 2, 'همبركر العطار - لحم', 'وزن نص كيلو', 4000, '8697924593941', 1, '10'),
(3, 3, 'فاصوليا', 'ابو الربع', 1000, '1212', 1, '20');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'jfjfj', 'mayuri.infospace@gmail.com', '9000000000', '', '&lt;p&gt;ماركت &lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(3, 'مصطفى عصام', 'mayuri.infospace@gmail.com', 'cd92a26534dba48cd785cdcc0b3e6bd1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
