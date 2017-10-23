-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017 m. Spa 23 d. 21:38
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediapark`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `postDate` datetime NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `advertisement`
--

INSERT INTO `advertisement` (`id`, `title`, `description`, `postDate`, `userId`) VALUES
(1, 'Car rent', 'descriptionIf you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2017-10-19 18:42:54', 2),
(2, 'PC', 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source', '2017-10-19 18:58:04', 1),
(3, 'Keyboard', 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-10-19 18:59:44', 3),
(4, 'Ring golden', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\"', '2017-10-19 19:03:14', 3),
(5, 'Honda RX', 'Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2017-10-19 20:44:33', 4),
(6, 'House', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '2017-10-19 20:54:05', 4),
(7, 'Shoes', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2017-10-23 00:29:08', 5),
(8, 'New Ad', 'Some detailed information about product', '2017-10-23 00:40:53', 3),
(9, 'House for sale', 'Details about house. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.', '2017-10-23 00:44:41', 6),
(10, 'Audi A5', 'Details about car. \r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '2017-10-23 00:48:00', 1),
(11, 'Motocycle', 'If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2017-10-23 00:49:42', 2),
(12, 'New Ad', 'Details about new Ad. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.', '2017-10-23 13:05:50', 5),
(13, 'Mouse', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', '2017-10-23 21:33:00', 6),
(14, 'Sport shorts', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.', '2017-10-23 21:33:34', 3),
(15, 'Gift boxes', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire.', '2017-10-23 21:34:07', 2);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `regDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `regDate`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$13$82e0/bHISMHPNiMWzxmWfO7vTXE8Fna4Hbk1DdLMpwwfwVzhb7xnW', '2017-09-11 00:51:58'),
(2, 'kenedy', 'email@email.com', '$2y$13$5gRL53uU0GZkqmF1jSuusOzMLMz2c9.CwKDRpuLJjDzPhL/9BG4tq', '2017-09-11 02:51:08'),
(3, 'johnson', 'email@test.com', '$2y$13$yvKAgL9KCc5RfniEicvRuOH9FoWWy1kaQr/CvvwpM/qPxFIWGO4mC', '2017-09-15 21:59:02'),
(4, 'john', 'john@mail.vom', '$2y$13$N2MVNBcfALpSwqsoYgPB9OQ7PA52JdFUEkWva9LD0AB1l1ZuXrNNG', '2017-10-23 21:25:07'),
(5, 'georg', 'geor@mail.com', '$2y$13$zoRSTC73qu2FECyZ5dTgr.DdwnwS07LcrTJeqcTnrpuOV6on7.m5K', '2017-10-23 21:25:36'),
(6, 'monica', 'moon@mail.com', '$2y$13$VURsozFJkYasmxDcrpiPSOZ68c57YyYm693epqA0AmK168WRrF8Ou', '2017-10-23 21:25:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
