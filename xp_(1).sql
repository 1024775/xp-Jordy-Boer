-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 01 jun 2017 om 09:08
-- Serverversie: 10.1.19-MariaDB
-- PHP-versie: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xp`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `best_id` int(11) NOT NULL,
  `best_datum` datetime NOT NULL,
  `klant_id` int(11) NOT NULL,
  `pc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `klant_id` int(11) NOT NULL,
  `klant_voornaam` varchar(100) NOT NULL,
  `klant_tussenvoegsel` varchar(25) NOT NULL,
  `klant_achternaam` varchar(100) NOT NULL,
  `klant_email` varchar(100) NOT NULL,
  `klant_telefoon` varchar(15) NOT NULL,
  `klant_adres` varchar(25) NOT NULL,
  `klant_postcode` varchar(10) NOT NULL,
  `klant_woonplaats` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelen`
--

CREATE TABLE `onderdelen` (
  `ond_id` int(11) NOT NULL,
  `ond_soort` varchar(25) NOT NULL,
  `ond_naam` varchar(255) NOT NULL,
  `ond_socket` varchar(255) NOT NULL,
  `ond_prijs` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `onderdelen`
--

INSERT INTO `onderdelen` (`ond_id`, `ond_soort`, `ond_naam`, `ond_socket`, `ond_prijs`) VALUES
(3, 'CPU', 'Intel Core i7-7700K', '1151', '352.50'),
(4, 'CPU', 'Intel Core i7-6700K', '1151', '330'),
(5, 'CPU', 'AMD Ryzen 5 1600', 'AM4', '226'),
(6, 'CPU', 'AMD Ryzen 5 1500X', 'AM4', '189'),
(7, 'GPU', 'MSI Radeon RX 580 Gaming X 8GB', '', '292.95'),
(8, 'GPU', 'MSI Radeon RX 480 Gaming X 8G', '', '470.69'),
(9, 'GPU', 'MSI GeForce GTX 1060 Gaming X 6G', '', '301.77'),
(10, 'GPU', 'MSI GeForce GTX 1070 GAMING X 8G', '', '450'),
(11, 'Behuizing', 'Cooler Master MasterBox Lite 5', '', '47'),
(12, 'Behuizing', 'Thermaltake View 27', '', '65.95'),
(13, 'Behuizing', 'NZXT S340 Colour Edition Zwart/Rood', '', '65.95'),
(14, 'Behuizing', 'NZXT S340 Elite Zwart/Rood', '', '89.95'),
(15, 'RAM', 'Corsair Vengeance 8GB DDR4', '', '120.50'),
(16, 'RAM', 'Corsair Vengeance 16GB DDR4', '', '186.50'),
(17, 'RAM', 'Corsair Vengeance 32GB DDR4', '', '269'),
(18, 'RAM', 'Corsair Vengeance 64GB DDR4', '', '498.95'),
(19, 'HDD', 'Seagate 1TB HDD', '', '52.01'),
(20, 'HDD', 'Seagate 2TB HDD', '', '73.50'),
(21, 'SSD', '120GB Kingston V300 SSD', '', '57.26'),
(22, 'SSD', '240gb Kingston V300 SSD', '', '91.95'),
(23, 'SSD', 'Samsung EVO 120GB SSD', '', '89'),
(24, 'SSD', 'Samsung EVO 240GB SSD', '', '177.62'),
(25, 'Voeding', 'Cooler Master GM G550M', '', '64'),
(26, 'Voeding', 'Seasonic S12II-Bronze 520W', '', '50.95'),
(27, 'Voeding', 'Seasonic M12II Evo 620W', '', '71'),
(28, 'Voeding', 'Cooler Master GM G750M', '', '80.30'),
(29, 'Moederbord INTEL', 'MSI B250M Mortar', '1151', '89.59'),
(30, 'Moederbord INTEL', 'MSI B150A GAMING PRO', '1151', '117.95'),
(31, 'Moederbord AMD', 'MSI B350M Mortar Arctic', 'AM4', '98.95'),
(32, 'Moederbord AMD', 'MSI B350 Tomahawk', 'AM4', '114.24'),
(33, 'Optische drive Blu-Ray', 'Asus BC-12D2HT Bulk Zwart', '', '58.50'),
(34, 'Optische drive Blu-Ray', 'Asus BW-16D1HT Zwart', '', '75.95'),
(35, 'Optische drive DVD', 'Asus DRW-24D5MT (bulk) Zwart', '', '14.95'),
(36, 'Optische drive DVD', 'Asus DRW-24D5MT (retail) Zwart', '', '16.88');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orderrow`
--

CREATE TABLE `orderrow` (
  `pc_id` int(11) NOT NULL,
  `ond_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pc`
--

CREATE TABLE `pc` (
  `pc_id` int(11) NOT NULL,
  `pc_naam` varchar(255) NOT NULL,
  `pc_afbeelding` varchar(25) NOT NULL,
  `pc_omschrijving` text NOT NULL,
  `pc_soort` varchar(25) NOT NULL,
  `pc_prijs` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `pc`
--

INSERT INTO `pc` (`pc_id`, `pc_naam`, `pc_afbeelding`, `pc_omschrijving`, `pc_soort`, `pc_prijs`) VALUES
(1, 'Game PC Budget', 'images/budget.jpg', 'Deze Budget Game PC laat zien dat een Game PC niet duur hoeft te zijn. Speel de leukste games en houdt geld over om games te kopen. De betaalbare basis Game PC voor elke gamer.', 'Game PC', '299'),
(2, 'Intel Game PC', 'images/intel.jpg', 'De Intel Game PC draait met gemak al jouw favoriete games. Hij is uitermate geschikt om de nieuwste games mee te spelen, films te kijken en foto''s te bewerken. De Game PC waar elke gamer blij van wordt.', 'Game PC', '549'),
(3, 'Intel Game PC PRO', 'images/intelpro.jpg', 'De Intel Game PC PRO is de ultieme game computer. Of je nu de nieuwste en zwaarste games wilt spelen of op professionele wijze foto''s en video''s wilt bewerken, het kan allemaal!', 'Game PC', '749'),
(4, 'Game PC MAX', 'images/max.jpg', 'Deze Game PC MAX is een zeer uitgebreide game computer die alle games moeiteloos aan kan. Dit is voor iedere gamer de ultieme game computer.', 'Game PC', '1249'),
(5, 'Ethereum Miner 150MH', 'images/150mh.jpeg', 'Ethereum de potentiele opvolger van Bitcoin, een cryptocurrency welke in populariteit stijgt en waarvan het minen erg winstgevend is en men verwacht dat de waarde van deze munt nog zal oplopen.\n\nOnze mining rigs zijn special voor Ethereum ontworpen en geinstalleerd. Met deze miner zult u ongeveer 150 MH/s (+- 5%) minen wat gelijk staat aan ongeveer &euro;12,00 per dag! (Berekent op : 03-10-2016, Dit is uiteraard volledig afhankelijk van de munt waarde en de hash snelheid van het netwerk en veranderd dagelijks)', 'Mining Rig', '2799'),
(6, 'Ethereum Miner 450MH', 'images/450mh.jpg', 'Ethereum de potentiele opvolger van Bitcoin, een cryptocurrency welke in populariteit stijgt en waarvan het minen erg winstgevend is en men verwacht dat de waarde van deze munt nog zal oplopen.\n\nOnze mining rigs zijn special voor Ethereum ontworpen en geinstalleerd. Met deze miner zult u ongeveer 450 MH/s (+- 5%) minen wat gelijk staat aan ongeveer &euro;35,00 per dag! (Berekent op : 03-10-2016, Dit is uiteraard volledig afhankelijk van de munt waarde en de hash snelheid van het netwerk en veranderd dagelijks)', 'Mining Rig', '8350'),
(7, 'Ethereum Miner 100MH', 'images/100mh.jpeg', 'Ethereum de potentiele opvolger van Bitcoin, een cryptocurrency welke in populariteit stijgt en waarvan het minen erg winstgevend is en men verwacht dat de waarde van deze munt nog zal oplopen.\n\nOnze mining rigs zijn special voor Ethereum ontworpen en geinstalleerd. Met deze miner zult u ongeveer 100 MH/s (+- 5%) minen wat gelijk staat aan ongeveer &euro;8,00 per dag! (Berekent op : 03-10-2016, Dit is uiteraard volledig afhankelijk van de munt waarde en de hash snelheid van het netwerk en veranderd dagelijks)', 'Mining Rig', '2149'),
(8, 'Ethereum Miner 125MH', 'images/125mh.jpeg', 'Ethereum de potentiele opvolger van Bitcoin, een cryptocurrency welke in populariteit stijgt en waarvan het minen erg winstgevend is en men verwacht dat de waarde van deze munt nog zal oplopen.\n\nOnze mining rigs zijn special voor Ethereum ontworpen en geinstalleerd. Met deze miner zult u ongeveer 125 MH/s (+- 5%) minen wat gelijk staat aan ongeveer &euro;10,00 per dag! (Berekent op : 03-10-2016, Dit is uiteraard volledig afhankelijk van de munt waarde en de hash snelheid van het netwerk en veranderd dagelijks)', 'Mining Rig', '2499'),
(9, 'HTPC AMD ML03', 'images/ml03.jpg', 'Een fantastische allround multimedia computer (HTPC) op basis van de AMD Godavari processor A8-7670K (4 x 3600MHz)* met 8GB intern geheugen, 128GB SSD*, 1TB data schijf*, 867Mbit/s Wifi en Bluetooth4.0, in een eenvoudige, maar robuuste en netjes afgewerkte slim-line Hifi behuizing. Met aan de voorkant het optisch station, geschikt voor het afspelen en opnemen van CD/DVD/Blu-ray (3D). Maar ook twee USB 3.0 aansluitingen voor het snel koppelen van een externe harde schijf, USB-stick of voor het snel opladen van uw smartphone of tablet. Verder heeft deze behuizing aan de voorkant een aansluiting voor een hoofdtelefoon en een microfoon.\n\nDe multimedia computer wordt volledig ge&iuml;nstalleerd geleverd met Microsoft Windows 10, media center software Kodi (met een aantal leuke/handige apps) voor het afspelen van al uw media, Cyberlink PowerDVD 12 voor het afspelen van Blu-ray en Blu-ray 3D en een Nederlandstalige handleiding met extra tips en trucs.', 'Home Theatre', '799'),
(10, 'HTPC AMD ML04', 'images/ml04.jpg', 'Een fantastische allround multimedia computer (HTPC) op basis van de AMD Godavari processor A8-7670K (4 x 3600MHz)* met 8GB intern geheugen, 128GB SSD*, 1TB data schijf*, 867Mbit/s Wifi en Bluetooth4.0, in een eenvoudige, maar robuuste en netjes afgewerkte slim-line Hifi behuizing. Met aan de voorkant achter de frontklep het optisch station, geschikt voor het afspelen en opnemen van CD/DVD/Blu-ray (3D). Maar ook twee USB 3.0 aansluitingen voor het snel koppelen van een externe harde schijf, USB-stick of voor het snel opladen van uw smartphone of tablet. Verder heeft de behuizing aan de voorkant een aansluiting voor een hoofdtelefoon en een microfoon, een schuifje om de behuizingledjes te dimmen, een slotje om het front af te sluiten en een kinderbeveiliging voor de aan/uit knop.\n\nDe multimedia computer wordt volledig ge&iuml;nstalleerd geleverd met Microsoft Windows 10, media center software Kodi (met een aantal leuke/handige apps) voor het afspelen van al uw media, Cyberlink PowerDVD 12 voor het afspelen van Blu-ray en Blu-ray 3D en een Nederlandstalige handleiding met extra tips en trucs.', 'Home Theatre', '819'),
(11, 'HTPC Intel Kaby Lake ML03', 'images/ml03.jpg', 'Een fantastische allround multimedia computer (HTPC) op basis van de Intel Kaby Lake processor, in een eenvoudige, maar robuuste en netjes afgewerkte slim-line Hifi behuizing. Met aan de voorkant het optisch station, geschikt voor het afspelen en opnemen van CD/DVD/Blu-ray (3D). Maar ook twee USB 3.0 aansluitingen voor het snel koppelen van een externe harde schijf, USB-stick of voor het snel opladen van uw smartphone of tablet. Verder heeft deze behuizing aan de voorkant een aansluiting voor een hoofdtelefoon en een microfoon.\n\nDe multimedia computer wordt volledig ge&iuml;nstalleerd geleverd met Microsoft Windows 10, media center software Kodi (met een aantal leuke/handige apps) voor het afspelen van al uw media, Cyberlink PowerDVD 12 voor het afspelen van Blu-ray en Blu-ray 3D en een Nederlandstalige handleiding met extra tips en trucs.', 'Home Theatre', '889'),
(12, 'HTPC Intel Kaby Lake ML04', 'images/ml04.jpg', 'Een fantastische allround multimedia computer (HTPC) op basis van de Intel Kaby Lake processor, in een strakke, robuuste en netjes afgewerkte slim-line Hifi behuizing. Met aan de voorkant achter de frontklep het optisch station, geschikt voor het afspelen en opnemen van CD/DVD/Blu-ray (3D). Maar ook twee USB 3.0 aansluitingen voor het snel koppelen van een externe harde schijf, USB-stick of voor het snel opladen van uw smartphone of tablet. Verder heeft de behuizing aan de voorkant een aansluiting voor een hoofdtelefoon en een microfoon, een schuifje om de behuizingledjes te dimmen, een slotje om het front af te sluiten en een kinderbeveiliging voor de aan/uit knop.\n\nDe multimedia computer wordt volledig ge&iuml;nstalleerd geleverd met Microsoft Windows 10, media center software Kodi (met een aantal leuke/handige apps) voor het afspelen van al uw media, Cyberlink PowerDVD 12 voor het afspelen van Blu-ray en Blu-ray 3D en een Nederlandstalige handleiding met extra tips en trucs.', 'Home Theatre', '899');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`best_id`),
  ADD KEY `fk_bestellingen_klant1_idx` (`klant_id`),
  ADD KEY `fk_bestellingen_pc1_idx` (`pc_id`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klant_id`);

--
-- Indexen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD PRIMARY KEY (`ond_id`);

--
-- Indexen voor tabel `orderrow`
--
ALTER TABLE `orderrow`
  ADD KEY `pc_id` (`pc_id`,`ond_id`),
  ADD KEY `ond_id` (`ond_id`);

--
-- Indexen voor tabel `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`pc_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `best_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `klant_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  MODIFY `ond_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT voor een tabel `pc`
--
ALTER TABLE `pc`
  MODIFY `pc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD CONSTRAINT `fk_bestellingen_klant1` FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bestellingen_pc1` FOREIGN KEY (`pc_id`) REFERENCES `pc` (`pc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `orderrow`
--
ALTER TABLE `orderrow`
  ADD CONSTRAINT `orderrow_ibfk_1` FOREIGN KEY (`ond_id`) REFERENCES `onderdelen` (`ond_id`),
  ADD CONSTRAINT `orderrow_ibfk_2` FOREIGN KEY (`pc_id`) REFERENCES `pc` (`pc_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
