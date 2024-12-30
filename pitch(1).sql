-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2024 at 10:51 AM
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
-- Database: `pitch`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `pitch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_status` enum('Paid','Unpaid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`pitch_id`, `user_id`, `pay_status`) VALUES
(1, 3, 'Paid'),
(2, 3, 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `e_title` varchar(255) NOT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `e_title`, `pitch_id`, `start_date`, `end_date`) VALUES
(1, 'Friendly Match', 1, '2025-01-10', '2025-01-10'),
(2, 'Friendly Match', 2, '2025-01-12', '2025-01-12'),
(3, 'Weekend Warriors Cup', 2, '2025-01-13', '2025-01-15'),
(4, 'Youth Football Festival', 2, '2025-01-20', '2025-01-25'),
(5, 'Five-a-Side Championship', 1, '2025-01-14', '2025-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `participates`
--

CREATE TABLE `participates` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goals_scored` int(11) DEFAULT 0,
  `matches_played` int(11) DEFAULT 0,
  `wins` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participates`
--

INSERT INTO `participates` (`event_id`, `user_id`, `goals_scored`, `matches_played`, `wins`) VALUES
(1, 3, 2, 1, 1),
(2, 3, 3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pitch`
--

CREATE TABLE `pitch` (
  `pitch_id` int(11) NOT NULL,
  `p_type` text NOT NULL,
  `size` varchar(50) NOT NULL,
  `weather_update` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `capacity` varchar(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pitch`
--

INSERT INTO `pitch` (`pitch_id`, `p_type`, `size`, `weather_update`, `price`, `description`, `capacity`, `location`) VALUES
(1, 'Indoor', '30m x 15m (standard futsal size)', NULL, 5000.00, 'Climate-controlled indoor football facility with professional artificial turf, LED lighting system, and dedicated changing rooms. Perfect for year-round play regardless of weather conditions. Features high-quality synthetic grass and cushioned surface for player safety.', '7a side', 'Gulshan-2, Dhaka'),
(2, 'Outdoor', '90m x 45m', NULL, 7000.00, 'Spacious outdoor football field with natural grass surface and floodlight system for evening matches. Includes covered player benches, proper drainage system, and panoramic view of the city. Ideal for larger teams and competitive matches.', '11a side', 'Dhanmondi-27, Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `player_flag` tinyint(1) DEFAULT 0,
  `admin_flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `phone`, `password`, `player_flag`, `admin_flag`) VALUES
(3, 'Mahdi', 'mahdi10@gmail.com', '01875027822', '$2y$10$uh7uWqs9EU1wfpAd/V7.cuqtIRmRXEuichCB4LVrmpwX9jKeQlZ0C', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`pitch_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `pitch_id` (`pitch_id`);

--
-- Indexes for table `participates`
--
ALTER TABLE `participates`
  ADD PRIMARY KEY (`event_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pitch`
--
ALTER TABLE `pitch`
  ADD PRIMARY KEY (`pitch_id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pitch`
--
ALTER TABLE `pitch`
  MODIFY `pitch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`pitch_id`) REFERENCES `pitch` (`pitch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`pitch_id`) REFERENCES `pitch` (`pitch_id`) ON DELETE CASCADE;

--
-- Constraints for table `participates`
--
ALTER TABLE `participates`
  ADD CONSTRAINT `participates_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `participates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
