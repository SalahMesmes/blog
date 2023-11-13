-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 26 Mars 2010 à 13:57
-- Version du serveur: 5.1.36
-- Version de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `billets`
--

DROP TABLE IF EXISTS `billets`;
CREATE TABLE IF NOT EXISTS `billets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Contenu de la table `billets`
--

INSERT INTO `billets` (`id`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'Bienvenue sur mon blog !', 'Je vous souhaite à toutes et à tous la bienvenue sur mon blog qui parlera de... PHP bien sûr !', '2010-03-25 16:28:41'),
(2, 'Le PHP à la conquête du monde !', 'C''est officiel, l''éléPHPant a annoncé à la radio hier soir "J''ai l''intention de conquérir le monde !".\r\nIl a en outre précisé que le monde serait à sa botte en moins de temps qu''il n''en fallait pour dire "éléPHPant". Pas dur, ceci dit entre nous...', '2010-03-27 18:31:11'),
(3, 'Le combat asymétrique entre marques traditionnelles et DNVB', 'L\’espoir d’une réouverture probable des commerces le mois prochain ne changera pas la situation très délicate dans laquelle se retrouve les marques traditionnelles : un modèle BtoBtoC qui démontre ses limites dans un quotidien sans contact et qui laisse libre-court aux nouveaux entrants numériques pour grignoter petit à petit un marché verrouillé depuis trop longtemps.', '2020-11-27 18:31:11'),
(4, 'Mythes et réalités du commerce en ligne en 2020', 'Avec le reconfinement et la fermeture administrative des commerces non essentiels, une hystérie collective est en train de se propager autour du e-commerce et du grand méchant Amazon. Comme c\’est trop souvent le cas, les médias traditionnels massacrent un sujet que visiblement ils connaissent à peine. Une très bonne occasion pour faire le point sur les pratiques de commerce en ligne et faire tomber quelques idées reçues.', '2020-12-01 18:31:11'),
(5, 'La vérité sur l\’intelligence artificielle en entreprise', 'L\’intelligence artificielle était sensée révolutionner notre quotidien et sauver des millions de vie ; pourtant elle n\’a pas été capable de prédire la pandémie, d\’en ralentir la progression ou d’aider les scientifiques à mettre plus rapidement un vaccin au point. Se pourrait-il que l\’on nous ait menti sur son potentiel réel ? Comme souvent, les promesses n\’engagent que ceux qui y croient… Aussi est-il largement temps de clarifier la nature et le rôle que peut jouer l\’intelligence artificielle dans la croissance des entreprises pour en faciliter l\’adoption.', '2020-12-02 15:31:11');
-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_billet` int(11) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  `date_commentaire` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `id_billet`, `auteur`, `commentaire`, `date_commentaire`) VALUES
(1, 1, 'M@teo21', 'Un peu court ce billet !', '2010-03-25 16:49:53'),
(2, 1, 'Maxime', 'Oui, ça commence pas très fort ce blog...', '2010-03-25 16:57:16'),
(3, 1, 'MultiKiller', '+1 !', '2010-03-25 17:12:52'),
(4, 2, 'John', 'Preum''s !', '2010-03-27 18:59:49'),
(5, 2, 'Maxime', 'Excellente analyse de la situation !\r\nIl y arrivera plus tôt qu''on ne le pense !', '2010-03-27 22:02:13'),
(6, 3, 'Fred', 'Tout à fait d\’accord, excellent article', '2020-11-29 22:02:13'),
(7, 3, 'Brousse', 'Vous n’avez pas de chance concernant les relations avec les vendeurs ! ', '2012-11-29 22:02:13'),
(8, 3, 'Nico', 'Tout à fait d\’accord, de nombreux retailers se racontent des histoires quant à la prétendue qualité de l’expérience humaine vécue dans leurs boutiques.', '2020-11-30 22:02:13'),
(9, 4, 'Thomas', 'Dans votre 10eme point concernant le e-commerce municipal, vois évoquez une étude de l\’Observatoire des Usages Internet', '2020-12-01 22:02:13'),
(10, 4, 'Nico', 'Pour moi, c’est nos facilités de déplacements (voitures ou transports en commun) qui nous permettent d’excentrer nos zones commerciales et d\’étendre nos villes', '2020-12-02 17:02:13'),
(11, 4, 'Nico', 'Pour moi, c’est nos facilités de déplacements (voitures ou transports en commun) qui nous permettent d\’excentrer nos zones commerciales et d\’étendre nos villes', '2020-12-02 17:02:13'),
(12, 5, 'Claude', 'Merci Fred pour cet article. Avec le terme Intelligence Artificielle, M. ou Mme Toulemonde à la impression qu\’on va vivre dans le monde des robots de Isaac Asimov capable d\’agir en toute autonomie.', '2020-12-03 17:02:13'),
(13, 5, 'Jack', 'Bon travail de synthèse, utile, on n\’insistera en effet jamais assez sur l\’importance des données tant au niveau quantitatif que qualitatif. L’IA a faim et il faut l\’alimenter pour qu\’elle soit efficace.', '2020-12-03 18:12:13'),
(14, 5, 'Raoul', 'Merci pour cet article, ça fait plaisir de voir enfin ce terme intelligence artificielle remis à sa place ;) et oui ce ne sont que des programmes informatiques pour réaliser et automatiser des tâches de plus en plus complexes, et il faudra toujours des humains intelligents pour les concevoir ou les contrôler…', '2020-12-03 18:22:13'),
(15, 5, 'Nico', 'Il manque le sujet de l\’IA le plus prometteur de cette décennie : le mix des IA symboliques avec les IA connexionnistes. Par exemple les GAN, sont le meilleur exemple mais dommage, je ne les ai pas approfondies.', '2020-12-04 18:22:13');

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
