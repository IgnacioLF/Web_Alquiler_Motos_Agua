-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2022 a las 16:39:12
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

create database alquiler_motos;
use alquiler_motos;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_motos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_moto` int(5) NOT NULL,
  `id_cliente` int(5) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `num_horas` int(3) DEFAULT NULL,
  `precio_total` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id_moto`, `id_cliente`, `fecha_hora`, `num_horas`,`precio_total`) VALUES
(1, 1, '2000-12-12 12:12:12', 2,0),
(6, 10,'2020-12-02 12:16:00', 7,0),
(5, 7, '2022-10-06 10:12:00', 2,0),
(5, 8, '2021-02-01 11:15:00', 3,0),
(4, 2, '2021-05-03 12:12:00', 4,0),
(1, 5, '2022-03-08 17:14:00', 5,0),
(2, 6, '2020-01-02 16:14:00', 8,0),
(2, 9, '2020-09-11 18:12:00', 6,0),
(3, 3, '2022-08-22 18:15:00', 5,0),
(6, 4, '2021-08-12 19:13:00', 11,0);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(5) NOT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `nombre` varchar(9) DEFAULT NULL,
  `apellidos` varchar(15) DEFAULT NULL,
  `direccion` varchar(25) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `provincia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `dni`, `nombre`, `apellidos`, `direccion`, `cp`, `provincia`) VALUES
(1, '73263721G', 'Bartolome', 'Real Bartolome', 'Carrera Madrid, 61', 37799, 'Salamanca'),
(2, '43828921Y', 'Araceli','Valencia Alarcon', 'Cami Pedralbes, 80',31656,'Navarra'),
(3, '86669258Z', 'Martina', 'Olmo Bonet', 'Avinguda Pedralbes, 80', 24894, 'Leon'),
(4, '81928920E', 'Francisco Jesus', 'Angulo Santana', 'Placa Horno, 32',23530 , 'Jaen'),
(5, '56944717Y', 'Alex', 'Poveda Alcaraz', 'Cami Iglesia, 64', 06641, 'Badajoz'),
(6, '62653113D', 'Eulalia', 'Sevilla Mateos', 'Alameda Real, 62', 17440, 'Girona'),
(7, '34032531Y', 'Marcelino', 'Ruano Arranz', 'Avinguda Nueva, 8',09194 , 'Burgos'),
(8, '22141467B', 'Matias', 'Calero Bravo', 'Avenida Iglesia, 16', 39010, 'Cantabria'),
(9, '39896632G', 'Esmeralda', 'Palma Huerta', 'Avenida Iglesia, 96',45942 , 'Toledo'),
(10, '08920813X', 'Julian', 'Acosta Olmo', 'Cuesta Real, 38',30379 , 'Murcia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motos`
--

CREATE TABLE `motos` (
  `id_moto` int(5) NOT NULL,
  `matricula` varchar(7) DEFAULT NULL,
  `marca` varchar(10) DEFAULT NULL,
  `modelo` varchar(10) DEFAULT NULL,
  `cv` int(5) DEFAULT NULL,
  `cc` int(10) DEFAULT NULL,
  `num_plazas` int(2) DEFAULT NULL,
  `precio_hora` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `motos`
--

INSERT INTO `motos` (`id_moto`, `matricula`, `marca`, `modelo`, `cv`, `cc`, `num_plazas`,`precio_hora`) VALUES
(1, '2605NHB', 'Sea doo', 'WAKW', 170, 1630, 3,20),
(2, '0494CGC', 'Sea doo', 'Spark TRIXX', 90, 899, 2,12),
(3, '7225MJL', 'Sea doo', 'GTI', 130, 1630, 2,25),
(4, '7223MMN', 'Sea doo', 'GTI', 90, 899, 2,25),
(5, '4496BDM', 'Sea doo', 'GTX 170', 125, 1630, 3,30),
(6, '2447FLN', 'Sea doo', 'GTX 230', 169, 1630, 3,35);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_moto`,`id_cliente`),
  ADD KEY `alquiler_fk1` (`id_cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `motos`
--
ALTER TABLE `motos`
  ADD PRIMARY KEY (`id_moto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_fk` FOREIGN KEY (`id_moto`) REFERENCES `motos` (`id_moto`),
  ADD CONSTRAINT `alquiler_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
