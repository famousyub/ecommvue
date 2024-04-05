-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 août 2023 à 18:27
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb1`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Electroniques ', '2023-05-08 08:35:28', '2023-05-29 14:16:07'),
(2, 'TV & Multimedia', '2023-05-08 08:35:28', '2023-05-08 08:35:28'),
(3, 'Maison & Equipements ', '2023-05-08 08:35:28', '2023-05-29 14:15:55'),
(6, 'Vetements ', '2023-05-08 08:35:28', '2023-05-29 14:15:02'),
(9, 'Bébé & Enfant', '2023-05-08 08:35:28', '2023-05-29 14:14:47'),
(12, 'Beauté & Hygiène', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Beauté', '2023-05-08 08:35:28', '2023-05-29 14:14:12'),
(15, 'Alimentation', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Boissons ', '2023-05-26 23:58:43', '2023-05-29 14:13:41'),
(39, 'Hygiène ', '2023-05-29 14:12:06', '2023-05-29 14:13:53'),
(40, 'Produits ménages ', '2023-05-30 12:22:27', '2023-05-30 12:22:27'),
(42, 'zied', '2023-08-03 10:59:54', '2023-08-03 10:59:54');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `motive` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `patente` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `phoneNo`, `icon`, `logo`, `code`, `header`, `motive`, `details`, `location`, `patente`, `createdAt`, `updatedAt`) VALUES
(1, 'Shopping', 'eshopcommerce11@gmail.com', '+ 216 55 4917 29', '', 'http://localhost:8084/public/company/EShopping/logo.avif', 'EShopping', 'Find what you need here', 'Comfort and convenience.,EShopping is just a software project. It is developed to learn how to build a web application. Ive included all these data from the internet from different kind of source. And this is not a real ecommerce site.', 'Created by Ahmed 3Ltic TEL', 'Sfax,Tunisie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Client', '', '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'monoprix', 'monoprix@gmail.com', '12345678', NULL, NULL, NULL, 'meilleur choix', NULL, NULL, 'sfax', '1234567899', '2023-06-05 09:00:44', '2023-06-05 09:00:44'),
(9, 'Carrefour', 'carrefour@gmail.com', '25145919', NULL, NULL, NULL, 'a votre service', NULL, NULL, 'sfax', '12345678999', '2023-06-05 09:04:33', '2023-06-05 09:04:33'),
(10, 'Magasin', 'magasin@gmail.com', '88888888', NULL, NULL, NULL, 'motivation', NULL, NULL, 'sousse', '78979895', '2023-06-05 09:12:09', '2023-06-05 09:12:09'),
(11, 'aziza', 'aziza@gmail.com', '12345678', NULL, NULL, NULL, 'sfax', NULL, NULL, 'sfax', '00000014', '2023-06-12 23:39:07', '2023-06-12 23:39:07'),
(12, 'zedna', 'zedna@gmail.com', '19999999', NULL, NULL, NULL, 'sfax', NULL, NULL, 'sfax', '00000015', '2023-06-13 00:15:15', '2023-06-13 00:15:15');

-- --------------------------------------------------------

--
-- Structure de la table `contracts`
--

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL,
  `commission` float DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `CompanyId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contracts`
--

INSERT INTO `contracts` (`id`, `commission`, `startDate`, `endDate`, `createdAt`, `updatedAt`, `CompanyId`, `ProductId`) VALUES
(1, 0.2, '2023-06-01', '2023-06-30', '1900-01-01 00:00:00', '0000-00-00 00:00:00', 5, 89),
(2, 0.2, '2023-06-01', '2023-06-30', '2023-06-01 00:30:33', '2023-06-01 00:30:33', 5, 91),
(3, 0.3, '2023-06-01', '2023-06-30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 104),
(4, 0.3, '2023-06-01', '2023-06-30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 105),
(5, 0.4, '2023-06-01', '2023-06-30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 109),
(6, 0.3, '2023-06-01', '2023-06-30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 91);

-- --------------------------------------------------------

--
-- Structure de la table `histoproducts`
--

CREATE TABLE `histoproducts` (
  `id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `CompanyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orderitems`
--

INSERT INTO `orderitems` (`id`, `quantity`, `createdAt`, `updatedAt`, `ProductId`, `OrderId`) VALUES
(1, 2, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `checkoutSessionId` varchar(255) DEFAULT NULL,
  `productCost` decimal(64,3) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `shippingCost` decimal(64,3) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phoneNo`, `email`, `address`, `status`, `variant`, `checkoutSessionId`, `productCost`, `currency`, `shippingCost`, `createdAt`, `updatedAt`) VALUES
(38, 'ali ali', '55491729', 'benmakhloufahmed1@gmail.com', '<b>line1:</b> rte tunis km10<br/><b>Postal code:</b> 3021<br/><b>city:</b> SFAX<br/><b>country:</b> Tunisie<br/><b>line2:</b> aaa<br/><b>zipCode:</b> 3021<br/><b>division:</b> d<br/>', 'en cours', 'dark', '76', '5.710', 'TND', '4.000', '2023-08-03 09:29:49', '2023-08-03 09:29:49'),
(39, 'ali ali', '55491729', 'benmakhloufahmed1@gmail.com', '<b>line1:</b> rte tunis km10<br/><b>Postal code:</b> 3021<br/><b>city:</b> SFAX<br/><b>country:</b> Tunisie<br/><b>line2:</b> aaa<br/><b>zipCode:</b> 3021<br/><b>division:</b> d<br/>', 'complète', 'success', '76', '5.710', 'TND', '4.000', '2023-08-03 09:30:58', '2023-08-03 11:05:06'),
(40, 'ali ali', '55491729', 'benmakhloufahmed1@gmail.com', '<b>line1:</b> zzzzzzzzz<br/><b>Postal code:</b> 3021<br/><b>city:</b> SFAX<br/><b>country:</b> Tunisie<br/><b>line2:</b> aaa<br/><b>zipCode:</b> 3021<br/><b>division:</b> d<br/>', 'en cours', 'dark', '76', '7.000', 'TND', '4.000', '2023-08-04 14:08:54', '2023-08-04 14:08:54');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(64,3) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `peopleRated` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `image6` varchar(255) DEFAULT NULL,
  `image7` varchar(255) DEFAULT NULL,
  `image8` varchar(255) DEFAULT NULL,
  `image9` varchar(255) DEFAULT NULL,
  `image10` varchar(255) DEFAULT NULL,
  `CompanyId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `SubSubCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `code`, `title`, `subtitle`, `description`, `amount`, `rating`, `peopleRated`, `currency`, `sales`, `image1`, `image2`, `image3`, `image4`, `image5`, `image6`, `image7`, `image8`, `image9`, `image10`, `CompanyId`, `createdAt`, `updatedAt`, `CategoryId`, `SubCategoryId`, `SubSubCategoryId`) VALUES
(1, 'ES00000001', 'Samsung Galaxy M40', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '214.000', 4.5, 2, 'TND', 10, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/1/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/1/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/1/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/1/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(2, 'ES00000002', 'Samsung Galaxy M21 6GB/128GB', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '199.000', 5, 2, 'TND', 112, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/2/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/2/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/2/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/2/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(3, 'ES00000003', 'Samsung Galaxy A21s 4GB/64GB', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '169.000', 4, 1, 'TND', 60, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/3/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/3/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/3/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/3/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(4, 'ES00000004', 'Samsung Galaxy A20', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '100.000', 0, 0, 'TND', 25, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/4/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/4/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/4/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/4/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(5, 'ES00000005', 'Samsung Galaxy J7', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '100.000', 0, 0, 'TND', 42, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/5/1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(6, 'ES00000006', 'Samsung Galaxy A01', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '100.000', 0, 0, 'TND', 61, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/6/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/6/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/6/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/6/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(7, 'ES00000007', 'Samsung Galaxy M31 8GB/128GB', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '259.000', 0, 0, 'TND', 92, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/7/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/7/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/7/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/7/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(8, 'ES00000008', 'Samsung Galaxy M11', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '139.000', 0, 0, 'TND', 35, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/8/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/8/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/8/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/8/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(9, 'ES00000009', 'Samsung Galaxy A71', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '329.000', 0, 0, 'TND', 29, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/9/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/9/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/9/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/9/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(10, 'ES00000010', 'Samsung Galaxy M01 Core 2GB/32GB', '<h5><b>Brand : </b> Samsung</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '72.000', 0, 0, 'TND', 11, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/10/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/10/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/10/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Samsung/10/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 1),
(11, 'ES00000011', 'Xiaomi Poco C3 4GB/64GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '129.000', 0, 0, 'TND', 36, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/1/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/1/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/1/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/1/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(12, 'ES00000012', 'Xiaomi Poco M3 4GB/64GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '149.000', 0, 0, 'TND', 54, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/2/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/2/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/2/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/2/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(13, 'ES00000013', 'Xiaomi Poco M2 6GB/64GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '159.000', 0, 0, 'TND', 222, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/3/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/3/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/3/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/3/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(14, 'ES00000014', 'Xiaomi Poco M3 4GB/128GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '164.000', 0, 0, 'TND', 52, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/4/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/4/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/4/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/4/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(15, 'ES00000015', 'Xiaomi Redmi Note 9 Pro 6GB/128GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '279.000', 0, 0, 'TND', 18, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/5/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/5/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/5/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/5/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(16, 'ES00000016', 'Xiaomi Mi 3 16GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '185.000', 0, 0, 'TND', 34, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/6/1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2);
INSERT INTO `products` (`id`, `code`, `title`, `subtitle`, `description`, `amount`, `rating`, `peopleRated`, `currency`, `sales`, `image1`, `image2`, `image3`, `image4`, `image5`, `image6`, `image7`, `image8`, `image9`, `image10`, `CompanyId`, `createdAt`, `updatedAt`, `CategoryId`, `SubCategoryId`, `SubSubCategoryId`) VALUES
(17, 'ES00000017', 'Xiaomi Redmi Note 9', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '199.000', 0, 0, 'TND', 61, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/7/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/7/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/7/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/7/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(18, 'ES00000018', 'Xiaomi Redmi Note 8 4GB/64GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '189.000', 0, 0, 'TND', 87, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/8/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/8/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/8/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/8/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(19, 'ES00000019', 'Xiaomi Redmi 9', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '149.000', 0, 0, 'TND', 95, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/9/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/9/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/9/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/9/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(20, 'ES00000020', 'Xiaomi Redmi 8 4GB/64GB', '<h5><b>Brand : </b> Xiaomi</h5><h5><b>Warranty : </b> 12 Months</h5><h5><b>Payment : </b> Visa card, Mastercard, Debitcard, Creditcard</h5><h5><b>Availability : </b> in Stock</h5>', '<div><div><h3> Software </h3></div><div ><div >OS</div><div >Android 9.0 (Pie); One UI</div></div><div ><h3> Hardware </h3></div><div ><div >Design</div></div><div ><div >weight</div><div >168 gm</div></div><div ><div >screen</div><div >6.3inch PLS TFT capacitive touchscreen, 16M colors, 97.4 cm2 (~84.9% screen-to-body ratio)</div></div><div ><div >dimension</div><div >155.3 x 73.9 x 7.9 mm</div></div><div ><div >protection</div><div >Corning Gorilla Glass (unspecified)</div></div><div ><div >resolution</div><div >1080 x 2340 pixels, 19.5:9 ratio (~409 ppi density)</div></div><div ><div >Memory</div></div><div ><div >expandable</div><div >1024 GB</div></div><div ><div >RAM</div><div >6 GB</div></div><div ><div >ROM</div><div >128 GB</div></div><div ><div >Processor</div></div><div ><div >number of cores</div><div >8 core</div></div><div ><div >SoC</div><div >Qualcomm SDM675 Snapdragon 675 (11 nm)</div></div><div ><div >CPU</div><div >Octa-core (2x2.0 GHz Kryo 460 Gold &amp; 6x1.7 GHz Kryo 460 Silver)</div></div><div ><div >GPU</div><div >Adreno 612</div></div><div ><div >Camera</div></div><div ><div >secondary</div><div >16 MP, f/2.0, HDR</div></div><div ><div >video</div><div >2160p@30fps, 1080p@30fps</div></div><div ><div >feature</div><div >LED flash, panorama, HDR</div></div><div ><div >primary</div><div >Triple: <br>32 MP, f/1.7, 0.8m, PDAF <br>8 MP, f/2.2, 12mm (ultrawide), 1.12m, PDAF<br>5 MP, f/2.2, depth sensor<br></div></div><div ><div >Battery</div></div><div ><div >capacity</div><div >3500mAh Li-Polymer (non-removable)</div></div><div ><div ><h3>Connectivity</h3></div></div><div ><div >Wi-Fi</div><div >Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</div></div><div ><div >internet</div><div >2G/3G/4G</div></div><div ><div >USB</div><div >2.0, Type-C 1.0 reversible connector</div></div><div ><div >bluetooth</div><div >5.0, A2DP, LE</div></div><div ><div >Audio</div></div><div ><div >radio</div><div >FM Radio</div></div><div ><div >Others</div></div><div ><div ><h3>sensors</h3></div><div >Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass</div></div><div ><div >general</div><div >Hybrid Dual SIM (Nano-SIM, dual stand-by)</div></div><div > Manufacturer </div><div ><div >first arrival</div><div >June, 2019</div></div><div ><div >Manufactured By</div><div >Samsung</div></div><div ><div >availability</div><div >available</div></div></div>', '149.000', 0, 0, 'TND', 65, 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/10/1.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/10/2.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/10/3.jpg', 'http://localhost:8084/public/product-image/Electronics/Mobiles/Xiaomi/10/4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1, 1, 2),
(21, '', 'Créme de visage', '200ml', '<p><span style=\"color: rgb(77, 81, 86);\">La formule douce, mais efficace de la crème,&nbsp;</span><span style=\"color: rgb(4, 12, 40); background-color: rgba(80, 151, 255, 0.18);\">convient aussi bien au visage qu\'au corps qui a besoin d\'une action hydratante</span><span style=\"color: rgb(77, 81, 86);\">. La crème pour la peau peut être utilisée pour apaiser, hydrater et protéger le visage et le corps.</span></p>', '13.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public/uploads/1685227300956nivea-creme-soft-visage-corps-mains-200-ml.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-27 22:41:40', '2023-05-27 22:41:40', 14, 9, 34),
(89, '', 'Dentifrice', '75ml - anti caries', '<h5>Aqua, Calcium Carbonate, Sorbitol Hydrated Silica, Sodium Lauryl Sulphate, Aroma, Sodium Monofluorophosphate, Cellulose Gum, Potassium Citrate, Trisodium Phosphate, Sodium Saccharin, Salvadora Persica Extract, Phenylcarbinol, Glycerine, CI 77492, CI 12490</h5><p>Grâce à sa formule fluorée et riche en Calcium, ce dentifrice Signal aide à protéger vos dents contre les caries dentaires mais aussi contre les effets des attaques bactériennes responsables des caries.</p>', '3.550', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\168522800682113012117.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-27 22:53:26', '2023-05-27 22:53:26', 14, 10, 35),
(90, '', 'KIWI', 'La pièce', 'Frais', '1.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685228202001Kiwi_for_sale_in_a_New_Jersey_supermarket.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-27 22:56:42', '2023-05-27 22:56:42', 15, 6, 36),
(91, '', 'TUC', '65Grammes', '<span style=\"color: rgb(102, 102, 102);\">Le fameux biscuit TUC original, croustillant et fondant à la fois !</span>', '1.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\168522881996120170201161421_IM__Tuc-Classic-3D-AP.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-27 23:06:59', '2023-05-27 23:06:59', 15, 11, 40),
(92, '', 'Spaghetti', '500 grammes', '100% semoule de blé dur , N°3 ', '0.410', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685361782205spaghetti3-list.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:03:02', '2023-05-29 12:03:02', 15, 13, 41),
(93, '', 'Coude N°2', '500 Grammes', '100% semoule de blé dur , N°2', '0.410', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\couden2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:05:49', '2023-05-29 12:05:49', 15, 13, 41),
(94, '', 'Escargot', '500 Grammes', '100% pure semoule , N°1', '0.410', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685362268543pate-escargot-1-randa-500-gr.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:11:08', '2023-05-29 12:11:08', 15, 13, 43),
(95, '', 'Petit Pois ', '800 Grammes', '800grammes , très fins', '14.580', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\168536292970911000954.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:22:09', '2023-05-29 12:22:09', 15, 14, 44),
(96, '', 'Mais', '500 Grammes', 'Succombez à son petit goût sucré et ses graines tendres et dorées qui apportent saveurs et couleurs à vos plats.', '5.740', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16853631385841.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:25:38', '2023-05-29 12:25:38', 15, 14, 44),
(97, '', 'Thon', '400 Grammes', 'Thon entier à l\'huile d\'olive Sidi Daoud', '15.320', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\thon.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:30:56', '2023-05-29 12:30:56', 15, 15, 45),
(98, '', 'Sardine Sidi Daoud', '120 Grammes', 'Sardines à la tomate naturellement riches en Oméga 3 Sidi Daoud', '1.500', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685363869125573.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:37:49', '2023-05-29 12:37:49', 15, 15, 45),
(99, '', 'Tomate Sicam', '800 Grammes', '100%Tomates fraiches concentration 28/30%', '5.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685364406943images.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:46:46', '2023-05-29 12:46:46', 15, 14, 46),
(100, '', 'Sicam Harissa', '135grammes ', 'L\'harissa est une pâte de piment fort tunisien dont les ingrédients principaux sont des poivrons rouges rôtis, des piments Baklouti', '1.270', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16853647324591 (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 12:52:12', '2023-05-29 12:52:12', 15, 14, 46),
(101, '', 'Safir ', '750ML', '<p>Huile d\'olive extra vierge </p><p>Biologique </p>', '8.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685365460764huile-d-olive-extra-vierge.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:04:20', '2023-05-29 13:04:20', 15, 17, 48),
(102, '', 'couscous fin', '<p>1KG</p>', '<p><span style=\"background-color: rgba(255, 255, 255, 0.85); color: rgb(102, 102, 102);\">Notre couscous est fabriqué dans la pure tradition à partir des meilleures semoules de blé dur .</span></p>', '0.795', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685365957970couscous-fin.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:12:37', '2023-05-29 13:12:37', 15, 13, 50),
(103, '', 'CROUSTINA', '<p>100Grammes</p>', '<p>Croustina au lait </p>', '1.380', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685366516708gaufrette.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:21:56', '2023-05-29 13:21:56', 15, 12, 51),
(104, '', 'D\'croc', '<p>110grammes</p>', '<p>A la crème gout chocolat  </p>', '1.760', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685366650808gaufrette (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:24:10', '2023-05-29 13:24:10', 15, 12, 51),
(105, '', 'Prince mini gâteau ', '<p>30grammes </p>', '<p>Mini gâteau au chocolat </p>', '0.650', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\168536695163720170201163117_IM__PMG-3D-AP.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:29:11', '2023-05-29 13:29:11', 15, 12, 53),
(106, '', 'Brownies mini gâteau ', '<p>60 grammes </p>', '<p>Fort en gout de chocolat .</p>', '0.760', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685367120492brownies.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:32:00', '2023-05-29 13:32:00', 15, 12, 53),
(107, '', 'Chips-up', '<p>70g</p>', '<p>au sel </p>', '3.520', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685367416987295.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:36:56', '2023-05-29 13:36:56', 15, 11, 54),
(108, '', 'Bugles ', '<p>75grammes </p>', '<p>smoking BBQ</p>', '3.400', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16853675011511 (2).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:38:21', '2023-05-29 13:38:21', 15, 11, 54),
(109, '', 'pop corn saveur', '<p>90grammes </p>', '<p><strong>Popcorn saveur beurre Céréalisé</strong></p>', '1.800', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685367853096pop-corn-micro-ondes.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 13:44:13', '2023-05-29 13:44:13', 15, 11, 55),
(110, '', 'tomato', '<p>1kg </p>', '<p>fraiches </p>', '1.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685368170242photo-1615393246646-5d00bd3ba0f2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-29 13:49:30', '2023-05-29 13:49:30', 15, 7, 38),
(111, '', 'poivre', '<p>1kg</p>', '<p>frais </p>', '3.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685368283881Big-Jiim-Chili-Peppers2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-29 13:51:23', '2023-05-29 13:51:23', 15, 7, 39),
(112, '', 'pomme de terre ', '<p>1kg </p>', '<p>frais </p>', '2.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685368660826iC7HBvohbJqExqvbKcV3pP.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-29 13:57:40', '2023-05-29 13:57:40', 15, 7, 56),
(114, '', 'Pommes ', '1 kilo grammes', '<p>Des pommes rouges fraiches </p>', '7.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685368851991apple-season.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-29 14:00:51', '2023-05-29 14:00:51', 15, 6, 58),
(115, '', 'Coca Cola Zero ', '50cl', '<p>Cola Zero</p>', '1.320', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685444090234coca_cola_zero_500ml-510x510.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 10:54:50', '2023-05-30 10:54:50', 38, 19, 59),
(116, '', 'Apla', '24cl', '<p>Pomme</p>', '1.240', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685444320099boissons-gazeuses-apla-canette-33-cl_0a877de2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 10:58:40', '2023-05-30 10:58:40', 38, 19, 60),
(117, '', 'Boga', '<p>1.5L</p>', '<p>Lim</p>', '3.030', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685444575951boissons-gazeuses-lime-boga_d56174ff.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:02:55', '2023-05-30 11:02:55', 38, 19, 61),
(118, '', 'Shark ', '<p>25CL</p>', '<p>Stimulation </p>', '5.550', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685444777550OIP.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:06:17', '2023-05-30 11:06:17', 38, 20, 62),
(119, '', 'Red bull', '<p>25Cl</p>', '<p>avec taurine </p>', '4.990', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685444873759R.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:07:53', '2023-05-30 11:07:53', 38, 20, 63),
(120, '', 'Delice ', '<p>1L</p>', '<p>Multivitaminé </p>', '3.120', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685445305159jus-delice-de-fruits-nectar-multivitamine-1-l.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:15:05', '2023-05-30 11:15:05', 38, 21, 64),
(121, '', 'Tropico ', '<p>20cl</p>', '<p>Cocktail </p>', '0.790', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685445577810OIP (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:19:37', '2023-05-30 11:19:37', 38, 21, 65),
(122, '', 'Safia', '<p>1.5L</p>', '<p>6 bouteilles</p>', '4.200', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685446048414eau-minerale-15l-safia-pack-de-6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:27:28', '2023-05-30 11:27:28', 38, 22, 66),
(123, '', 'Melliti', '<p>0.5cl</p>', '<p>eau minéral </p>', '0.450', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685446374107Melliti1.5-1.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:32:54', '2023-05-30 11:32:54', 38, 22, 67),
(124, '', 'Delice ', '<p>1.5L</p>', '<p>Eau de source </p>', '0.670', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685446521511Eau-De-Source-DELICE-1L.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:35:21', '2023-05-30 11:35:21', 38, 22, 68),
(125, '', 'Softy ', '<p>20 pièces </p>', '<p>Ultra doux </p>', '1.220', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685446770915lingettes-bebe.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:39:30', '2023-05-30 11:39:30', 9, 23, 69),
(126, '', 'Couches bébé Lilas ', '<p>20 Pièces </p><p>taille 1</p>', '<p>Confort max </p>', '14.200', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16854471682861.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:46:08', '2023-05-30 11:46:08', 9, 24, 70),
(127, '', 'Mixa bébé shampoing ', '<p>250ML</p>', '<p>Shampooing démêlant très doux  </p>', '14.270', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16854474750593058320005011_001-300x300.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:51:15', '2023-05-30 11:51:15', 9, 25, 71),
(128, '', 'purée Materna ', '<p>Compote pomme </p>', '<p>100% fruits </p>', '4.410', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685447815303materna-tunisie-materna-compote-pomme.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 11:56:55', '2023-05-30 11:56:55', 9, 26, 72),
(129, '', 'Chaussettes ', '<p>Pointure 22/24</p>', '<p>100% Cotton  </p>', '1.990', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685448256675727230.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:04:16', '2023-05-30 12:04:16', 9, 27, 73),
(130, '', 'Grenouillère ', '<p>nouveau né </p>', '<p>100% Cotton </p>', '21.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685448725121R (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:12:05', '2023-05-30 12:12:05', 9, 27, 74),
(131, '', 'Claquettes ', '<p>pour filles </p>', '<p>plastique </p>', '12.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\168544884078471hFcn2YGZS._AC_UL1500_.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:14:00', '2023-05-30 12:14:00', 9, 27, 75),
(132, '', 'Short plage ', '<p>âge 3/4 ans </p><p>conception Mickey </p>', '<p>polyester </p>', '21.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16854492199993752344a-5952-45de-862b-9698fb98b692.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:20:20', '2023-05-30 12:20:20', 9, 27, 76),
(133, '', 'Eau de javel ', '<p>1.5L</p>', '<p>classique </p>', '2.890', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685449551279OIP (2).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:25:51', '2023-05-30 12:25:51', 40, 28, 77),
(134, '', 'Savon Olisse ', '<p>savon de toilettes 75grammes </p>', '<p>savon hydratant </p>', '1.710', 0, 0, 'TND', 1, 'http://localhost:8084/public\\uploads\\1685450102772OIP (3).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:35:02', '2023-05-30 12:35:02', 40, 29, 78),
(135, '', 'Judy vitre ', '<p>Triples actions </p>', '<p>Triples actions</p>', '4.750', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1685450443169OIP (4).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-05-30 12:40:43', '2023-05-30 12:40:43', 40, 30, 79),
(136, '', 'Banane ', '<p>1kg </p>', '<p>Banane importés </p>', '10.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1686245462580R.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 17:31:02', '2023-06-08 17:31:02', 15, 6, 57),
(137, '', 'Déodorant pour homme  ', '<p>Pour homme </p><p>200ml </p>', '<p>minérale </p>', '6.350', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1686246130485DÃ©odorant-Souplesse-Homme-MinÃ©ral.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 17:42:10', '2023-06-08 17:42:10', 14, 33, 81),
(138, '', 'Malizia Gel douche ', '<p>Gel douche 3 en 1 </p><p>1000ml </p>', '<p>3 en 1 </p><p>1000 ml </p>', '16.750', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1686246546018Ubadb10deb1a74e6991e39063b816789bw.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 17:49:06', '2023-06-08 17:49:06', 14, 33, 83),
(139, '', 'Hycot Coton tige ', '<p>90 tiges </p><p>100% coton </p>', '<p>100% coton </p>', '2.090', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1686246806787coton-tige.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 17:53:26', '2023-06-08 17:53:26', 14, 33, 84),
(140, '', 'Colgate brosse à dents ', '<p>Couleur bleu </p><p>Double actions </p>', '<p>Couleur bleu </p><p>Double actions </p>', '2.090', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16862470996411 (1).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 17:58:19', '2023-06-08 17:58:19', 14, 10, 85),
(141, '', 'Friteuse Tefale ', '<p>&nbsp;Capacité huile 2,2 L, Capacité frites 1,5 kg, Cuve antiadhésive, Filtration des odeurs</p>', '<p>Matériaux: Plastique, Aluminium</p><p>Couleur : blanc </p>', '269.900', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\1686248174015tefal-filtra-one-ff-1631-438.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 18:16:14', '2023-06-08 18:16:14', 3, 35, 87),
(142, '', 'Mixeur Molinex ', '<p>Pied amovible: Oui</p><p> Bol hachoir: Permet de hacher et émincer les herbes aromatiques, les oignons, les viandes, les fromages à pâte dure</p>', '<p>Couleur : Gris et noir </p><p>Pied amovible: oui</p><p> Bol hachoir: Permet de hacher et émincer les herbes aromatiques, les oignons, les viandes, les fromages à pâte dure </p>', '299.000', 0, 0, 'TND', NULL, 'http://localhost:8084/public\\uploads\\16862484872741584538358.8625438.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 18:21:27', '2023-06-08 18:21:27', 3, 35, 88),
(144, '', 'eau ', '<p>zzzzzzzzzzzzzzzzzzzzzzzzzzz</p>', '<p>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>', '1.000', 0, 0, 'TND', 55, 'http://localhost:8084/public\\uploads\\16911580020311685446048414eau-minerale-15l-safia-pack-de-6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 14:06:42', '2023-08-04 14:06:42', 42, 43, 93);

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `createdAt`, `updatedAt`, `UserId`, `ProductId`) VALUES
(1, 0, 'this was nice in buy. this was nice in buy. this was nice in buy. this was nice in buy. this was nice in buy.', '2023-05-08 08:35:28', '2023-05-08 08:35:28', NULL, 1),
(2, 5, 'this was nice in buy. this was nice in buy. this was nice in buy. this was nice in buy. this was nice in buy.', '2023-05-08 08:35:28', '2023-05-08 08:35:28', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `showcases`
--

CREATE TABLE `showcases` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `routerLink` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CompanyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `showcases`
--

INSERT INTO `showcases` (`id`, `type`, `caption`, `image`, `routerLink`, `priority`, `createdAt`, `updatedAt`, `CompanyId`) VALUES
(1, 'carousel', NULL, 'http://localhost:8084/public/display-images/legume.jpg', '/products/Alimentation', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(2, 'carousel', NULL, 'http://localhost:8084/public/display-images/canned.jpg', '/products/products/Alimentation/Canned%20Vegetables', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(3, 'carousel', NULL, 'http://localhost:8084/public/display-images/ménage.jpg', '/products/Produits%20ménages', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `createdAt`, `updatedAt`, `CategoryId`) VALUES
(1, 'Mobiles', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(2, 'Mobile Accessories', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(3, 'Computer Accessories', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(4, 'Tvs Brand', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(6, 'Fruits', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(7, 'Vegetabel', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(9, 'Soin de visage ', '2023-05-27 22:35:14', '2023-06-08 17:32:35', 14),
(10, 'Soin des dents ', '2023-05-27 22:36:23', '2023-06-08 17:32:52', 14),
(11, 'Biscuits Salés', '2023-05-27 22:57:54', '2023-06-01 23:23:42', 15),
(12, 'Biscuits Sucrés', '2023-05-27 22:58:50', '2023-06-01 23:23:54', 15),
(13, ' Pate ', '2023-05-27 23:08:01', '2023-06-01 23:24:02', 15),
(14, 'Canned Vegetables', '2023-05-29 12:14:33', '2023-05-29 12:14:33', 15),
(15, 'Canned Fish', '2023-05-29 12:27:50', '2023-05-29 12:27:50', 15),
(17, 'Olive oil ', '2023-05-29 12:56:31', '2023-05-29 12:56:31', 15),
(18, 'Vegetable oil', '2023-05-29 12:57:08', '2023-05-29 12:57:08', 15),
(19, 'Boissons Gazeuses', '2023-05-30 10:50:01', '2023-05-30 10:50:01', 38),
(20, 'Boissons Energétiques', '2023-05-30 10:50:25', '2023-05-30 10:50:25', 38),
(21, 'Jus', '2023-05-30 10:50:33', '2023-05-30 10:50:33', 38),
(22, 'Eau', '2023-05-30 10:51:16', '2023-05-30 10:51:16', 38),
(23, 'Lingettes bébé ', '2023-05-30 11:37:10', '2023-05-30 11:37:10', 9),
(24, 'Couches bébés', '2023-05-30 11:41:28', '2023-05-30 11:41:28', 9),
(25, 'shampoing ', '2023-05-30 11:50:45', '2023-05-30 11:50:45', 9),
(26, 'Compotes ', '2023-05-30 11:55:07', '2023-05-30 11:55:07', 9),
(27, 'Vêtements', '2023-05-30 12:02:10', '2023-05-30 12:02:10', 9),
(28, 'Eau de javel ', '2023-05-30 12:22:59', '2023-05-30 12:22:59', 40),
(29, 'Savon ', '2023-05-30 12:23:10', '2023-05-30 12:23:10', 40),
(30, 'Vitre', '2023-05-30 12:39:34', '2023-05-30 12:39:34', 40),
(31, 'Poudre Mains', '2023-06-08 17:22:04', '2023-06-08 17:22:04', 40),
(33, 'Le corps ', '2023-06-08 17:37:29', '2023-06-08 17:37:29', 14),
(34, 'Friteuse ', '2023-06-08 18:10:30', '2023-06-08 18:10:30', 3),
(35, 'Equipement cuisine ', '2023-06-08 18:15:51', '2023-06-08 18:15:51', 3),
(36, 'okk', '2023-06-12 23:38:14', '2023-06-12 23:38:14', NULL),
(37, 'okk', '2023-06-12 23:38:18', '2023-06-12 23:38:18', NULL),
(39, 'ziii', '2023-08-03 10:59:40', '2023-08-03 10:59:40', 2),
(42, 'ok', '2023-08-04 00:20:39', '2023-08-04 00:20:39', 42),
(43, 'ammar', '2023-08-04 14:04:03', '2023-08-04 14:04:03', 42);

-- --------------------------------------------------------

--
-- Structure de la table `subsubcategories`
--

CREATE TABLE `subsubcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `SubCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subsubcategories`
--

INSERT INTO `subsubcategories` (`id`, `name`, `createdAt`, `updatedAt`, `SubCategoryId`) VALUES
(1, 'Samsung', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(2, 'Xiaomi', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(3, 'Realme', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(4, 'Nokia', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(5, 'Huawei', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(6, 'oppo', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(7, 'Apple', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(8, 'Vivo', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(9, 'Pixel', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(10, 'Walton', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(11, 'LG', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 1),
(12, 'Mobile Charger', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(13, 'Mobile Cover', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(14, 'Power Bank', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(15, 'Memory Card', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(16, 'Data Cable', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(17, 'Screenguard', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(18, 'Headphones', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 2),
(19, 'External Hard Disk', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(20, 'Pendrive', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(21, 'Laptop Skins', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(22, 'Laptop Bags', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(23, 'Mouse', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(24, 'Keyboard', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 3),
(25, 'Samsung', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(26, 'LG', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(27, 'Sony', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(28, 'Micromax', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(29, 'Mi', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(30, 'Thomson', '2023-05-08 08:35:28', '2023-05-08 08:35:28', 4),
(31, 'Fully Automatic Front', '2023-05-08 08:35:28', '2023-05-08 08:35:28', NULL),
(32, 'Semi Automatic Top', '2023-05-08 08:35:28', '2023-05-08 08:35:28', NULL),
(33, 'Fully Automatic Top', '2023-05-08 08:35:28', '2023-05-08 08:35:28', NULL),
(34, 'NIVEA', '2023-05-27 22:37:02', '2023-05-27 22:37:02', 9),
(35, 'SIGNAL', '2023-05-27 22:50:00', '2023-05-27 22:50:00', 10),
(36, 'Kiwi', '2023-05-27 22:54:14', '2023-06-05 06:10:46', 6),
(37, 'Orange', '2023-05-27 22:54:20', '2023-06-05 06:10:40', 6),
(38, 'Tomato', '2023-05-27 22:58:01', '2023-05-27 22:58:01', 7),
(39, 'Piment', '2023-05-27 22:58:38', '2023-06-05 06:10:16', 7),
(40, 'TUC', '2023-05-27 23:04:54', '2023-05-27 23:04:54', 11),
(41, 'Warda', '2023-05-29 11:58:10', '2023-05-29 11:58:10', 13),
(43, 'Randa', '2023-05-29 12:06:45', '2023-05-29 12:06:45', 13),
(44, 'Saveurs', '2023-05-29 12:15:25', '2023-05-29 12:15:25', 14),
(45, 'Sidi Daoud', '2023-05-29 12:28:10', '2023-05-29 12:28:10', 15),
(46, 'Sicam', '2023-05-29 12:38:29', '2023-05-29 12:38:29', 14),
(47, 'Safi', '2023-05-29 13:00:09', '2023-05-29 13:00:09', 18),
(48, 'Safir ', '2023-05-29 13:04:13', '2023-05-29 13:04:13', 17),
(50, 'L\'épi d\'or', '2023-05-29 13:12:28', '2023-05-29 13:12:28', 13),
(51, 'Gaufrette ', '2023-05-29 13:17:33', '2023-05-29 13:17:33', 12),
(53, 'cake ', '2023-05-29 13:29:05', '2023-05-29 13:29:05', 12),
(54, 'Chips', '2023-05-29 13:33:32', '2023-05-29 13:33:32', 11),
(55, 'Pop corn ', '2023-05-29 13:34:09', '2023-05-29 13:34:09', 11),
(56, 'Pomme de terre ', '2023-05-29 13:57:34', '2023-05-29 13:57:34', 7),
(57, 'Bananes ', '2023-05-29 13:59:38', '2023-06-05 01:27:53', 6),
(58, 'Pommes', '2023-05-29 14:00:47', '2023-06-05 01:28:10', 6),
(59, 'Coca Cola', '2023-05-30 10:54:26', '2023-05-30 10:54:26', 19),
(60, 'Apla', '2023-05-30 10:58:20', '2023-05-30 10:58:20', 19),
(61, 'Boga', '2023-05-30 11:00:53', '2023-05-30 11:00:53', 19),
(62, 'Shark', '2023-05-30 11:06:01', '2023-05-30 11:06:01', 20),
(63, 'Redbull', '2023-05-30 11:07:46', '2023-05-30 11:07:46', 20),
(64, 'Delice', '2023-05-30 11:14:55', '2023-05-30 11:14:55', 21),
(65, 'Tropico', '2023-05-30 11:19:29', '2023-05-30 11:19:29', 21),
(66, 'Safia', '2023-05-30 11:27:20', '2023-05-30 11:27:20', 22),
(67, 'Melliti', '2023-05-30 11:32:47', '2023-05-30 11:32:47', 22),
(68, 'Delice', '2023-05-30 11:34:31', '2023-05-30 11:34:31', 22),
(69, 'Softy ', '2023-05-30 11:39:24', '2023-05-30 11:39:24', 23),
(70, 'Lilas', '2023-05-30 11:43:14', '2023-05-30 11:43:14', 24),
(71, 'Mixa bébé ', '2023-05-30 11:51:08', '2023-05-30 11:51:08', 25),
(72, 'purée ', '2023-05-30 11:56:48', '2023-05-30 11:56:48', 26),
(73, 'chaussettes ', '2023-05-30 12:04:09', '2023-05-30 12:04:09', 27),
(74, 'grenouillère ', '2023-05-30 12:11:57', '2023-05-30 12:11:57', 27),
(75, 'claquette ', '2023-05-30 12:13:55', '2023-05-30 12:13:55', 27),
(76, 'short plage ', '2023-05-30 12:20:14', '2023-05-30 12:20:14', 27),
(77, 'Judy ', '2023-05-30 12:25:44', '2023-05-30 12:25:44', 28),
(78, 'Oliss', '2023-05-30 12:34:56', '2023-06-08 17:22:48', 29),
(79, 'Judy ', '2023-05-30 12:40:33', '2023-05-30 12:40:33', 30),
(81, 'Souplesse ', '2023-06-08 17:38:20', '2023-06-08 17:38:20', 33),
(83, 'Malizia', '2023-06-08 17:44:06', '2023-06-08 17:44:06', 33),
(84, 'Coton tige', '2023-06-08 17:51:20', '2023-06-08 17:51:20', 33),
(85, 'Colgate ', '2023-06-08 17:58:11', '2023-06-08 17:58:11', 10),
(86, 'Tefale', '2023-06-08 18:10:42', '2023-06-08 18:10:42', 34),
(87, 'Friteuse ', '2023-06-08 18:16:04', '2023-06-08 18:16:04', 35),
(88, 'Mixeur', '2023-06-08 18:17:36', '2023-06-08 18:17:36', 35),
(89, 'okkkk', '2023-06-12 23:38:22', '2023-06-12 23:38:22', 36),
(91, 'okk', '2023-08-04 00:18:53', '2023-08-04 00:18:53', NULL),
(92, 'daccord', '2023-08-04 00:20:48', '2023-08-04 00:20:48', 42),
(93, 'm', '2023-08-04 14:06:30', '2023-08-04 14:06:30', 43);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `registerToken` int(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CompanyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `profileImage`, `registerToken`, `email`, `phoneNo`, `password`, `resetPasswordToken`, `userType`, `variant`, `priority`, `createdAt`, `updatedAt`, `CompanyId`) VALUES
(1, NULL, 'Zied', 'Ammar', 'http://localhost:8084/public/user-image/default-man.png', 0, 'azied189@gmail.com', '55491729', '123456789', NULL, 'Admin', 'dark', 1, '2023-06-11 23:51:20', '2023-06-12 00:38:07', 1),
(70, 'Ughlu', 'Zied', 'Ammar', 'http://localhost:8084/public/user-image/default-man.png', 0, 'zied.ammar@esprit.tn', '', '123456789', '', 'Fournisseur', 'info', 2, '0000-00-00 00:00:00', '2023-08-03 09:10:15', 1),
(82, NULL, 'ali', 'ali', 'http://localhost:8084/public/user-image/default-man.png', 0, 'benmakhloufahmed1@gmail.com', '20514042', '123456789', NULL, 'Client', 'warning', 3, '2023-08-03 09:12:40', '2023-08-03 09:23:09', 4);

-- --------------------------------------------------------

--
-- Structure de la table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wishlists`
--

INSERT INTO `wishlists` (`id`, `createdAt`, `updatedAt`, `UserId`, `ProductId`) VALUES
(9, '2023-05-29 16:09:03', '2023-05-29 16:09:03', NULL, NULL),
(18, '2023-06-01 21:41:59', '2023-06-01 21:41:59', NULL, 13),
(20, '2023-06-01 22:47:23', '2023-06-01 22:47:23', NULL, 135),
(23, '2023-06-01 23:02:02', '2023-06-01 23:02:02', NULL, 89),
(27, '2023-06-01 23:26:56', '2023-06-01 23:26:56', NULL, 91),
(30, '2023-06-11 23:13:05', '2023-06-11 23:13:05', NULL, 119),
(31, '2023-06-11 23:13:08', '2023-06-11 23:13:08', NULL, 117),
(32, '2023-08-10 01:19:13', '2023-08-10 01:19:13', 1, 144);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CompanyId` (`CompanyId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Index pour la table `histoproducts`
--
ALTER TABLE `histoproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `CompanyId` (`CompanyId`);

--
-- Index pour la table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryId` (`CategoryId`),
  ADD KEY `SubCategoryId` (`SubCategoryId`),
  ADD KEY `SubSubCategoryId` (`SubSubCategoryId`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Index pour la table `showcases`
--
ALTER TABLE `showcases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CompanyId` (`CompanyId`);

--
-- Index pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Index pour la table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SubCategoryId` (`SubCategoryId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `CompanyId` (`CompanyId`);

--
-- Index pour la table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `histoproducts`
--
ALTER TABLE `histoproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `showcases`
--
ALTER TABLE `showcases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `histoproducts`
--
ALTER TABLE `histoproducts`
  ADD CONSTRAINT `histoproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `histoproducts_ibfk_2` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`SubCategoryId`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`SubSubCategoryId`) REFERENCES `subsubcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `showcases`
--
ALTER TABLE `showcases`
  ADD CONSTRAINT `showcases_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  ADD CONSTRAINT `subsubcategories_ibfk_1` FOREIGN KEY (`SubCategoryId`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
