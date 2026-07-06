-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 06 juil. 2026 à 10:15
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `enboost`
--

-- --------------------------------------------------------

--
-- Structure de la table `dictees`
--

CREATE TABLE `dictees` (
  `id` int(11) NOT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `texte` text DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `niveau` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dictees`
--

INSERT INTO `dictees` (`id`, `theme`, `texte`, `date_creation`, `niveau`) VALUES
(65, 'Great Britain', 'Great Britain is a big island in Europe. It has England, Scotland, and Wales. They are part of the United Kingdom.\n\nLondon is the capital city. It is in England. London is famous for its red buses. Buckingham Palace is also there. The King lives there.\n\nThe weather in Great Britain can be rainy. People often use umbrellas. But the sun shines sometimes too.\n\nBritish people like tea very much. They drink a lot of tea every day. It often has milk in it.\n\nThere are many nice green parks to visit. People like walking in them. Great Britain has a lot of history and beautiful places.', '2026-06-16 19:06:50', 'A1');

-- --------------------------------------------------------

--
-- Structure de la table `dictionnaire`
--

CREATE TABLE `dictionnaire` (
  `id` int(11) NOT NULL,
  `mot` varchar(100) DEFAULT NULL,
  `definition` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `niveau` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `dictees`
--
ALTER TABLE `dictees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dictionnaire`
--
ALTER TABLE `dictionnaire`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mot` (`mot`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dictees`
--
ALTER TABLE `dictees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `dictionnaire`
--
ALTER TABLE `dictionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1154;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
