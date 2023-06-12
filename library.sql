-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Cze 2023, 22:14
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
(12, 'Szybcy i wsciekli', 'wiadomo', 'sci-fi', '', '', ''),
(13, 'moje', 'życie', 'comedy', '', '', ''),
(14, '2222', 'ssss', 'horror', '2', 'R2', 'D');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(4) NOT NULL,
  `role` enum('user','moderator','administrator') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`) VALUES
(1, 'admin', '', 'admin123', 1),
(2, 'filip', '', 'kox', 1),
(3, '1234', '', '1234', 1),
(4, 'user1', 'user1@wp.pl', 'user1', 2),
(5, 'user2', 'user2@wp.pl', 'user2', 1),
(6, 'user3', 'user3@wp.pl', 'user3', 1),
(7, 'user4', 'user3@wp.pl', 'user3', 1),
(8, 'userrrr', 'user44@wp.pl', 'user44', 1),
(9, 'userrrr4', 'user44@wp.pl', 'user44', 1),
(10, 'test1', 'test@wp.pl', 'test', 1),
(11, 'test12', 'test@wp.pl', 'test', 1),
(12, 'user000', 'user0@wp.pl', 'user333', 1),
(13, 'user1111', 'user111111@wp.pl', 'user00000', 1),
(15, 'u8', 'u8@wp.pl', 'iiiiiiiiii', 1),
(16, 'user13', 'user13@wp.pl', 'user13', 1),
(17, 'user222222', 'user1@wp.pl', 'user2', 1),
(21, 'userekserek', 'userek1@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$eXJKQ1ZNQUg0T25PbXdSeA$mLAHuEkv4gqNtXEL7JU5mLucNvDclUhcyZbTQxaEaVI', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
