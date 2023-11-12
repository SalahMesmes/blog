-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 26 sep. 2023 à 19:24
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `billets`
--

DROP TABLE IF EXISTS `billets`;
CREATE TABLE IF NOT EXISTS `billets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(150) NOT NULL,
  `contenu` mediumtext NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `billets`
--

INSERT INTO `billets` (`id`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'test', 'test', '2022-01-12 13:19:08'),
(2, 'uiytui', 'uit', '2022-02-12 09:40:42'),
(3, 'upou', 'poupoui', '2022-02-12 09:43:14');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_billet` bigint(20) NOT NULL,
  `auteur` varchar(150) NOT NULL,
  `commentaire` mediumtext NOT NULL,
  `date_commentaire` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_billet` (`id_billet`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `id_billet`, `auteur`, `commentaire`, `date_commentaire`) VALUES
(1, 3, 'lkjlkj', 'jkljkljklklkl', '2022-10-12 18:37:14'),
(2, 3, 'opioppo', 'iopopiop', '2022-10-12 18:38:21'),
(3, 3, 'kljlk', 'ljlkjlk', '2022-10-12 18:39:13'),
(4, 3, 'hjkjh', 'kjhkjhj', '2022-10-13 07:28:56'),
(5, 3, 'hjkjh', 'kjhkjhj', '2022-10-13 07:28:56'),
(6, 3, 'hjkjh', 'kjhkjhj', '2022-10-13 07:28:56'),
(7, 3, 'hjkjh', 'kjhkjhj', '2022-10-13 07:28:56'),
(8, 1, 'fdsdsfsd', 'fsffff', '2022-10-19 00:00:00'),
(9, 1, 'fsf', 'ffsfsfsf', '2022-10-26 00:00:00'),
(10, 3, 'kkkkkk', 'kkkkkkkkkk', '2022-10-20 09:19:46'),
(11, 3, 'kkk', 'kkk', '2022-10-20 09:20:21'),
(12, 3, 'ooooooooooo', 'ooooooooooooo', '2022-10-20 10:11:31'),
(13, 3, 'ggggggggggggggggg', 'gggggggggggg', '2022-10-20 10:13:54'),
(14, 3, 'tttttt', 'tttttt', '2022-10-20 10:15:02'),
(15, 3, 'kkkkkk', 'kkkkkkkk', '2022-10-20 11:36:32'),
(16, 3, 'bbbbb', 'bbbb', '2022-10-20 11:37:05'),
(17, 3, 'hhhhh', 'hhhh', '2022-10-20 11:41:13'),
(18, 3, 'qqqqqqqqq', 'qqqqqqqqq', '2022-10-20 11:41:13'),
(19, 3, 'iiii', 'iii', '2022-10-20 11:43:08'),
(20, 3, 'uuuuu', 'uuu', '2022-10-20 11:43:08'),
(21, 1, 'kkkkkkkk', 'kkkkk', '2022-10-20 12:02:27'),
(22, 1, 'kkk', 'kkkk', '2022-10-20 12:02:27'),
(23, 1, 'hjkh', 'hh', '2022-10-20 12:02:27'),
(24, 1, '', '', '2022-10-20 12:08:17'),
(25, 1, 'llll', 'lll', '2022-10-20 12:16:06'),
(26, 1, 'gggggggggg', 'gggggggg', '2022-10-20 12:19:14');

-- --------------------------------------------------------

--
-- Structure de la table `users2`
--

DROP TABLE IF EXISTS `users2`;
CREATE TABLE IF NOT EXISTS `users2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users2`
--

INSERT INTO `users2` (`id`, `pseudo`, `password`, `photo`) VALUES
(20, 'test3', '356ccf8f4cffa26abbf71e5690d636a0f5d38b5fd2b05fbaea3e8e840359d75b', 'photo_profil.jpg'),
(19, 'test', 'f095b37254d089a79441fe832191030fa01c2e4a29dd84d341fc72e4a6f76305', 'photo_profil.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
