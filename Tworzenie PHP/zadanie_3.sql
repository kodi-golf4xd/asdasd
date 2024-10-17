-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Lis 2023, 13:07
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zadanie_3`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ocena`
--

CREATE TABLE `ocena` (
  `id` int(10) UNSIGNED NOT NULL,
  `przedmiot_id` int(10) UNSIGNED NOT NULL,
  `uczen_id` int(10) UNSIGNED NOT NULL,
  `ocena` int(10) UNSIGNED DEFAULT NULL,
  `dataWystawienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `ocena`
--

INSERT INTO `ocena` (`id`, `przedmiot_id`, `uczen_id`, `ocena`, `dataWystawienia`) VALUES
(1, 1, 2, 5, '2015-09-03'),
(2, 1, 2, 6, '2015-09-03'),
(3, 1, 1, 5, '2015-09-03'),
(4, 1, 1, 6, '2015-09-03'),
(5, 1, 2, 1, '2015-09-03'),
(6, 1, 2, 1, '2015-09-03'),
(7, 1, 2, 4, '2015-09-03'),
(8, 4, 1, 3, '2015-09-10'),
(9, 4, 1, 4, '2015-09-15'),
(10, 4, 1, 3, '2015-09-10'),
(11, 4, 1, 4, '2015-09-15'),
(12, 4, 1, 5, '2015-09-10'),
(13, 4, 1, 5, '2015-09-15'),
(14, 4, 2, 3, '2015-09-22'),
(15, 4, 2, 1, '2015-09-15'),
(16, 4, 2, 3, '2015-09-22'),
(17, 4, 2, 1, '2015-09-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`id`, `nazwa`) VALUES
(1, 'język polski'),
(2, 'matematyka'),
(3, 'język angielski'),
(4, 'biologia'),
(5, 'chemia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `PESEL` text DEFAULT NULL,
  `klasa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `uczen`
--

INSERT INTO `uczen` (`id`, `imie`, `nazwisko`, `PESEL`, `klasa`) VALUES
(1, 'Ewa', 'Kowalska', '00000000001', '1a'),
(2, 'Jan', 'Kowalski', '00000000002', '1a');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ocena`
--
ALTER TABLE `ocena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `przedmiot_id` (`przedmiot_id`,`uczen_id`),
  ADD KEY `uczen_id` (`uczen_id`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `ocena`
--
ALTER TABLE `ocena`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uczen`
--
ALTER TABLE `uczen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ocena`
--
ALTER TABLE `ocena`
  ADD CONSTRAINT `ocena_ibfk_1` FOREIGN KEY (`uczen_id`) REFERENCES `uczen` (`id`),
  ADD CONSTRAINT `ocena_ibfk_2` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
