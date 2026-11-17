-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3307
-- Létrehozás ideje: 2026. Nov 17. 19:39
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kisproject`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reg`
--

CREATE TABLE `reg` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `LoginName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `Car` tinyint(1) DEFAULT NULL,
  `PC` tinyint(1) DEFAULT NULL,
  `Mobil` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `reg`
--

INSERT INTO `reg` (`id`, `Name`, `LoginName`, `Password`, `role`, `Car`, `PC`, `Mobil`, `email`) VALUES
(10, 'Nagy Máté Imre', 'Mateeeh', 'Jelszo1.', 'Admin', 1, 1, '06708036949', 'mateTester@gmail.com'),
(11, 'Kovács Lajos', 'KoviLali56', 'KurtaFarkuMalac12.', 'User', 1, 0, '06707896543', 'kovilali70@freemail.hu'),
(12, 'Lapos Lajos', 'LapPapi11', 'Admin.LL11', 'Kar', 0, 1, '06305566778', 'llcompinfo@gmail.com');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
