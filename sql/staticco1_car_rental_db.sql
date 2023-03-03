-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2023 at 04:11 PM
-- Server version: 10.3.34-MariaDB-log-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staticco1_car_rental_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `car_id` int(30) NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `dropoff_datetime` datetime NOT NULL,
  `car_registration_no` varchar(200) NOT NULL,
  `car_plate_no` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= cancelled,1=Pending , 2= confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `car_id`, `pickup_datetime`, `dropoff_datetime`, `car_registration_no`, `car_plate_no`, `name`, `email`, `contact`, `address`, `status`) VALUES
(1, 2, '2023-01-01 17:30:00', '2023-01-21 18:09:00', '', '', 'Ø¹Ù…Ø§Ø¯ Ø§Ù„Ø¯ÙŠÙ† Ù…Ø­Ù…Ø¯', 'T@t.com', '01', 'ÙÙŠØµÙ„ Ù…Ø­ØªÙØ¸Ø© Ø§Ù„Ø¬ÙŠØ²Ø© ', 2),
(2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', 1),
(4, 7, '2022-10-01 15:06:00', '2022-01-30 15:08:00', '', '', 'Ù…Ø¬ØªØ¨ÙŠ Ù…ØµØ·ÙÙŠ Ù…Ø­Ù…Ø¯(Ø¬ÙˆØ¨Ø§)', '@', '', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…ÙŠ', 2),
(5, 6, '2090-12-24 12:24:00', '2091-01-07 12:25:00', '', '', 'Ù…Ø­Ù…Ø¯ Ø§Ù„Ù…Ù†Ø²Ø±', '@', '', 'Ù…Ù‡Ù†Ø¯Ø³ /Ù…Ø¬Ø¯ÙŠ', 2),
(6, 5, '2022-12-20 15:15:00', '2023-01-25 15:16:00', '', '', 'Ø¹ÙˆØ¶ Ù…Ø­Ù…Ø¯ Ø¹ÙˆØ¶', '@', '011', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…ÙŠ', 2),
(7, 4, '2091-01-16 14:56:00', '2023-01-25 14:57:00', '', '', 'Ø§Ø­Ù…Ø¯Ø§Ù„Ù…Ù†Ø²Ø±Ø§Ø¨Ùˆ Ø§Ù„Ø´ÙˆØ´', '@Ù', '', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…', 2),
(8, 3, '2023-01-25 15:19:00', '2022-01-25 15:19:00', '', '', 'Ø·Ø§Ø±Ù‚ Ø§Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø²ÙŠØ¯ Ù†Ø§ÙØ¹', '@', '011', '', 2),
(9, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'T@t.com0', '011', '', 1),
(10, 2, '2023-01-21 16:45:00', '2023-01-30 16:45:00', '', '', 'Ø¹Ù…Ø§Ø¯ Ø§Ù„Ø¯ÙŠÙ† Ù…Ø­Ù…Ø¯', '', '', 'Ø§Ø³ØªØ§ØªÙƒ', 2),
(11, 3, '2023-01-28 16:49:00', '2023-01-28 16:49:00', '', '', 'Ù…Ø­Ù…ÙˆØ¯ Ù…Ø­Ù…Ø¯ Ø§Ù„Ø³Ø± Ø§Ù„Ø­Ø³ÙŠÙ†', '@', '', '', 2),
(12, 6, '2022-12-26 17:00:00', '0000-00-00 00:00:00', '', '', 'Ø·Ø§Ø±Ù‚ Ø§Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø²ÙŠØ¯ Ù†Ø§ÙØ¹', '@', '', 'Ø§Ù„ÙƒÙˆÙŠØª', 2),
(13, 6, '2022-10-19 17:02:00', '2022-11-03 17:05:00', '', '', 'Ø¹ÙˆØ¶ Ù…Ø­Ù…Ø¯ Ø¹ÙˆØ¶', '@', '', 'Ø§Ù„Ø¬ÙŠØ²Ù‡ -Ø´Ø§Ø±Ø¹ Ø§Ø¨ÙˆØ¨ÙƒØ± Ø§Ù„ØµØ¯ÙŠÙ‚', 2),
(14, 6, '2022-12-24 17:08:00', '2023-01-07 17:08:00', '', '', 'Ù…Ø­Ù…Ø¯ Ø§Ù„Ù…Ù†Ø²Ø± Ù…Ø­Ù…Ø¯ Ù†ÙˆØ±', '@', '', 'Ø´Ø§Ø±Ø¹ Ø§Ù„Ø¬Ù…Ø¹ÙŠÙ‡', 2),
(15, 6, '2023-01-09 17:11:00', '2023-01-11 17:11:00', '', '', 'Ø¹Ù„Ø§Ø¡ Ø§Ù„Ø¯ÙŠÙ† Ù‡Ø¬Ø§Ù†Ù‡', '@', '', 'Ù…Ø¬Ø¯ÙŠ', 2),
(16, 1, '2022-12-30 17:16:00', '2023-01-10 17:16:00', '', '', 'Ø¹Ù„Ø§Ø¡ Ø§Ù„Ø¯ÙŠÙ† Ù‡Ø¬Ø§Ù†Ù‡', '@', '', 'Ù…Ø¬Ø¯ÙŠ', 2),
(17, 1, '2023-01-14 17:18:00', '2023-01-18 17:18:00', '', '', 'Ø´Ø±ÙŠÙ ØªØ§Ø¬ Ø§Ù„Ø³Ø± Ø¨Ø´ÙŠØ±', '@', '', 'Ø¨ÙˆØ±ØªØ³ÙˆØ¯Ø§Ù†', 2),
(18, 5, '2022-10-25 18:21:00', '2023-01-31 18:22:00', '', '', 'Ø¹ÙˆØ¶ Ù…Ø­Ù…Ø¯ Ø¹ÙˆØ¶', '@', '011', 'Ù…Ø¬Ø¯ÙŠ', 2),
(19, 4, '2022-12-25 18:27:00', '2023-01-04 18:28:00', '', '', 'Ø¹Ù…Ø± Ø§ÙŠÙ‡Ø§Ø¨ Ø§Ù„Ø·ÙŠØ¨', '@', '011', '', 2),
(20, 4, '2023-01-16 18:30:00', '2023-01-31 18:30:00', '', '', 'Ø§Ø­Ù…Ø¯Ø§Ù„Ù…Ù†Ø²Ø±Ø§Ø¨Ùˆ Ø§Ù„Ø´ÙˆØ´', '@', '', '', 2),
(22, 2, '2023-01-31 11:54:00', '2023-02-12 11:54:00', '', '', 'Ø¹Ù…Ø§Ø¯ Ø§Ù„Ø¯ÙŠÙ† Ù…Ø­Ù…Ø¯', '@', '', 'Ù…Ù‡Ù†Ø¯Ø³ Ù…Ø¬Ø¯ÙŠ', 2),
(23, 5, '2023-01-25 12:02:00', '2023-02-12 12:02:00', '', '', 'Ø¹ÙˆØ¶ Ù…Ø­Ù…Ø¯ Ø¹ÙˆØ¶', '@', '', 'Ù…Ù‡Ù†Ø¯Ø³ Ù…Ø¬Ø¯ÙŠ', 2),
(24, 6, '2023-01-09 12:33:00', '2023-01-20 12:33:00', '', '', '', '@', '', 'Ù…Ø¬Ø¯ÙŠ', 2),
(25, 3, '2023-01-15 12:36:00', '2023-02-03 12:37:00', '', '', 'Ø·Ø§Ø±Ù‚ Ø§Ø¨Ø±Ø§Ù‡ÙŠÙ… Ø²Ø§ÙŠØ¯', '@', '', 'Ù…Ø¬Ø¯ÙŠ', 2),
(26, 4, '2022-12-25 12:40:00', '2023-01-04 12:41:00', '', '', 'Ø¹Ù…Ø±Ùˆ Ø§ÙŠØ§Ø¨ Ø§Ù„Ø·ÙŠØ¨', '@', '', '', 2),
(27, 1, '2023-01-14 12:45:00', '2023-01-18 12:45:00', '', '', 'Ø´Ø±ÙŠÙ ØªØ§Ø¬ Ø§Ù„Ø³Ø± ', '@', '', 'Ù…Ø¬Ø¯ÙŠ', 2),
(28, 5, '2022-12-25 14:27:00', '2023-02-25 14:28:00', '', '', 'Ø¹ÙˆØ¶ Ù…Ø­Ù…Ø¯ Ø¹ÙˆØ¶', '@', '', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…ÙŠ', 2),
(29, 6, '2023-02-18 14:38:00', '2023-02-19 14:39:00', '', '', 'Ø§Ø­Ù…Ø¯ Ø§Ø¨ÙƒØ±', '@', '', 'Ø¹Ø¨Ø¯ Ø§Ù„Ù‡Ø§Ø¯ÙŠ Ø§Ù„Ø´Ø±Ù‚Ø§ÙˆÙŠ', 2),
(30, 2, '2023-02-13 14:43:00', '2023-02-22 14:43:00', '', '', 'Ø¹Ù…Ø§Ø¯ Ø§Ù„Ø¯ÙŠÙ† Ù…Ø­Ù…Ø¯', '@', '', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…ÙŠ Ø¹Ù‚Ø¯ Ø±Ù‚Ù…8', 2),
(31, 1, '2023-02-23 12:08:00', '2023-02-25 12:12:00', '', '', 'Ø¹Ù„Ø§Ø¡ Ø§Ù„Ø¯ÙŠÙ† Ø¹Ù…Ø± Ù‡ÙŠØ¬Ø§Ù†Ù‡', '', '', 'Ù…Ø¬Ø¯ÙŠ Ø¨ÙŠÙˆÙ…ÙŠ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_cars`
--

CREATE TABLE `borrowed_cars` (
  `id` int(30) NOT NULL,
  `booked_id` int(30) NOT NULL,
  `car_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=picked-up,2=drop-off'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(30) NOT NULL,
  `model` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `transmission_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `engine_id` int(30) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `qty` int(30) NOT NULL,
  `img_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `model`, `brand`, `transmission_id`, `category_id`, `engine_id`, `description`, `price`, `qty`, `img_path`) VALUES
(1, 'Ø§ÙˆØ¨ØªØ±Ø§2021(Ø§Ù„Ù„ÙˆÙ† Ø£Ø²Ø±Ù‚)-1973', 'Ø´ÙˆÙØ±Ù„ÙŠØª', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ Ø£ Ù… Ù… : 1973&lt;p&gt;Ø§Ù„Ù„ÙˆÙ† : Ø§Ø²Ø±Ù‚&lt;/p&gt;&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ : ------------------&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ± :----------------&lt;/p&gt;', 500, 1, '1674312420_org_d952d09e-0e18-41ee-9857-d09fed3d5898.jpg'),
(2, 'ØµÙŠÙ†ÙŠ2023 Ø¨Ø±ÙˆÙ†Ø²ÙŠ-2349', 'Ù†ÙŠØ³Ø§Ù†', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ :2349&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ: 138664&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ± :753096&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 450, 1, ''),
(3, 'ØµÙ†ÙŠ Ø§Ø­Ù…Ø±2023-3621', 'Ù†ÙŠØ³Ø§Ù†', 2, 0, 1, 'Ù„ÙˆØ­Ù‡ Ø±Ù‚Ù… :3621&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ:141451&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ± :766400&lt;/p&gt;', 450, 1, ''),
(4, 'Ø§ÙŠØ±Ø²ÙˆÙ†5 ÙØ¶ÙŠ 2023--3624', 'Ø´ÙŠØ±ÙŠ', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ : 3624&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ:----------------&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ±---------------&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù„ÙˆÙ† ÙØ¶ÙŠ&lt;/p&gt;', 500, 1, ''),
(5, 'Ø³Ù†ØªØ±Ø§ 2023--2348ÙÙŠØ±Ø§Ù†ÙŠ', 'Ù†ÙŠØ³Ø§Ù†', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ :2348&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ: 25216&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ±:959736&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù„ÙˆÙ† :ÙÙŠØ±Ø§Ù†ÙŠ&lt;/p&gt;', 5000, 10, ''),
(6, 'MG5--2021---9428', 'MG', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ 9428&lt;p&gt;Ù†Ù…Ø±Ù‡ Ø§Ù„Ø´Ø§Ø³ÙŠ :----------------&lt;/p&gt;&lt;p&gt;Ù†Ù…Ø±Ù‡ Ø§Ù„Ù…ÙˆØªÙˆØ±:---------------&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù„ÙˆÙ† ÙØ¶ÙŠ&lt;/p&gt;', 500, 1, ''),
(7, 'MG  2022-3619', 'MG-Z5', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ : Ø£.ÙŠ.Ù:6319&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ: 90906&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ± :100877&lt;/p&gt;&lt;p&gt;Ø§Ø§Ù„ÙˆÙ† Ø§Ø­Ù…Ø±&lt;/p&gt;', 500, 1, ''),
(8, 'Ù‡Ø§ÙØ§Ù„2022Ù†Ø¨ÙŠØªÙŠ---2347', 'H6', 2, 0, 1, 'Ø±Ù‚Ù… Ø§Ù„Ù„ÙˆØ­Ù‡ : Ø£ ÙŠ.Ù2347&lt;p&gt;Ø§Ù„Ø´Ø§Ø³ÙŠ:923404&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù…ÙˆØªÙˆØ±:224580104&lt;/p&gt;&lt;p&gt;Ø§Ù„Ù„ÙˆÙ†:Ù†Ø¨ÙŠØªÙŠ&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `engine_types`
--

CREATE TABLE `engine_types` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `engine_types`
--

INSERT INTO `engine_types` (`id`, `name`) VALUES
(1, 'Diesel'),
(2, 'Gasoline'),
(3, 'Electric Motor');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Car Rental Management System', 'info@sample.comm', '+6948 8542 623', '1603344720_1602738120_pngtree-purple-hd-business-banner-image_5493.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `transmission_types`
--

CREATE TABLE `transmission_types` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transmission_types`
--

INSERT INTO `transmission_types` (`id`, `name`, `description`) VALUES
(1, 'Manual transmission', 'Manual transmission'),
(2, 'Automatic transmission', 'Automatic transmission'),
(3, 'Continuously variable transmission', 'Continuously variable transmission (CVT)\r\n'),
(4, 'Semi-automatic and dual-clutch transmissions', 'Semi-automatic and dual-clutch transmissions');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff, 3= subscriber'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowed_cars`
--
ALTER TABLE `borrowed_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `engine_types`
--
ALTER TABLE `engine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmission_types`
--
ALTER TABLE `transmission_types`
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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `borrowed_cars`
--
ALTER TABLE `borrowed_cars`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine_types`
--
ALTER TABLE `engine_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transmission_types`
--
ALTER TABLE `transmission_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
