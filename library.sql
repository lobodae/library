-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Cze 2023, 13:31
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(20) NOT NULL,
  `nr_polki` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr_regal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alphabet` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `category`, `nr_polki`, `nr_regal`, `alphabet`) VALUES
(10, 'Hobbit', 'Tolkien', 'fantasy', '', '', ''),
(11, 'IT', 'Ktos', 'horror', '', '', ''),
(12, 'Szybcy i wsciekli', 'wiadomo', 'sci-fi', '', '', ''),
(13, 'moje', 'życie', 'comedy', '', '', ''),
(14, 'szkoła', '1', 'documentary', '', '', ''),
(15, 'test', 'test', '1', '', '', ''),
(16, 'test00', 'test00', 'horror', '3', 'R2', 'C'),
(17, 'test4', 'test4', 'horror', '3', '', ''),
(18, 'testowy5', 'uwu', 'sci-fi', '1', '1', 'D');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', '', 'admin123'),
(2, 'filip', '', 'kox'),
(3, '1234', '', '1234'),
(4, 'user1', 'user1@wp.pl', 'user1'),
(5, 'user2', 'user2@wp.pl', 'user2'),
(6, 'user3', 'user3@wp.pl', 'user3'),
(7, 'user4', 'user3@wp.pl', 'user3'),
(8, 'userrrr', 'user44@wp.pl', 'user44'),
(9, 'userrrr4', 'user44@wp.pl', 'user44'),
(10, 'test1', 'test@wp.pl', 'test'),
(11, 'test12', 'test@wp.pl', 'test'),
(12, 'user000', 'user0@wp.pl', 'user333'),
(13, 'user1111', 'user111111@wp.pl', 'user00000'),
(14, 'ooooooooooooo', 'ooooo@wo.pl', '00000'),
(15, 'u8', 'u8@wp.pl', 'iiiiiiiiii'),
(16, 'user13', 'user13@wp.pl', 'user13'),
(17, 'user222222', 'user1@wp.pl', 'user2'),
(18, 'userrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'user15@po.pl', 'User13#'),
(19, 'userR', 'user09@wp.pl', 'User1444$'),
(20, 'testowy1', 'testowy11@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$VGhqMjU5Mmp3eEo1UGxsaQ$tbJMnaGR8RQ4iwRGUN2GyGMS7j6VvQEPt0sbBOaHM7Y');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
