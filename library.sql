-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Cze 2023, 23:38
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
(14, 'Romeo bez Julii', 'Szekspir', 'fantasy', '1', 'R2', 'B');

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
(5, 'user2', 'user2@wp.pl', 'user2', 2),
(6, 'user3', 'user3@wp.pl', 'user3', 2),
(21, 'userekserek', 'userek1@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$eXJKQ1ZNQUg0T25PbXdSeA$mLAHuEkv4gqNtXEL7JU5mLucNvDclUhcyZbTQxaEaVI', 2),
(22, 'nienowyuser', 'nienowy@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$MmU3c0RueFh6Rm1BNzJwNg$V6Ud/honmCtTaQVxmVFAu4bc5gDxcxO9V2SzlbtNiWk', 1),
(23, 'xyz', 'zyx@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$SlpHdU1xR1dpUE1HbHo4eA$cgRUmtvxFOuySwIR6avB1KD2RAOwfaLNgpI/hVKm6Do', 1),
(24, 'qwerty', 'qwerty@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$Ulc2M04yWkdMTElGUlhaWg$7UpgY2kJcKsDXXDCeK2wgVyzmX/wz1OjIRiNYPsjybY', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
