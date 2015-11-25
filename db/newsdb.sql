-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2015 a las 18:03:21
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `newsdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `description` varchar(250) NOT NULL,
  `keywords` varchar(150) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `article`
--

INSERT INTO `article` (`article_id`, `title`, `description`, `keywords`, `content`) VALUES
(4, 'Many-to-Many Mapping', 'Many-to-Many XML Mapping Tutorial', 'Hibernate,Many-to-Many', 'Content of Many-to-Many XML Mapping Tutorial'),
(5, 'One-to-Many Mapping', 'One-to-Many XML Mapping Tutorial', 'Hibernate,One-to-Many', 'Content of One-to-Many XML Mapping Tutorial'),
(6, 'One-to-One Mapping', 'One-to-One XML Mapping Tutorial', 'Hibernate,One-to-One', 'Content of One-to-One XML Mapping Tutorial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(3, 'Hibernate Framework');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_article`
--

CREATE TABLE IF NOT EXISTS `category_article` (
  `category_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`article_id`),
  UNIQUE KEY `article_id_UNIQUE` (`article_id`),
  KEY `fk_category` (`category_id`),
  KEY `fk_article` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category_article`
--

INSERT INTO `category_article` (`category_id`, `article_id`) VALUES
(3, 4),
(3, 5),
(3, 6);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `category_article`
--
ALTER TABLE `category_article`
  ADD CONSTRAINT `fk_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
