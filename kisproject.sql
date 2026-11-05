-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Okt 07. 20:42
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
CREATE DATABASE IF NOT EXISTS `kisproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `kisproject`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reg`
--

CREATE TABLE `reg` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `LoginName` varchar(255) DEFAULT NULL,
  `Password` varchar(25) DEFAULT NULL,
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
(3, 'as', 'asa', 'sd', 'User', 1, 1, '06738423423', 'asd@gmail.com'),
(4, 'Teszt Ember', 'Teszter', 'Teszt!', 'Admin', 0, 1, '+36708958374', 'Teszter@gmail.com'),
(5, 'Teszt', 'Teszta', 'asdfs', 'User', 1, 0, '06708734321', 'Bteszter@gmail.com'),
(6, 'ReloadTeszt', 'ReloadTeszt01', 'azts!', 'Kar', 1, 0, '06708234210', 'Reload@gmail.com'),
(7, 'tesztasd', 'asd', 'asd', 'Kar', 1, 1, '067123234212', 'sa@gmail.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
