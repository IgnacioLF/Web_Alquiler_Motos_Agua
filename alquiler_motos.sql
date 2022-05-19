-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2022 a las 13:30:33
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10
CREATE database alquiler_motos;
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
  `fecha_hora` datetime NOT NULL,
  `num_horas` int(3) DEFAULT NULL,
  `precio_total` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id_moto`, `id_cliente`, `fecha_hora`, `num_horas`, `precio_total`) VALUES
(1, 2, '2022-05-27 14:00:00', 2, 40.00),
(2, 2, '2022-05-22 14:00:00', 4, 48.00),
(2, 4, '2022-05-27 15:00:00', 4, 48.00),
(2, 9, '2022-05-21 13:00:00', 5, 60.00),
(2, 10, '2022-05-20 14:00:00', 2, 24.00),
(3, 1, '2022-05-27 14:00:00', 2, 50.00),
(3, 2, '2022-05-29 12:00:00', 5, 125.00),
(3, 5, '2022-05-15 13:00:00', 2, 50.00),
(4, 4, '2022-05-18 14:00:00', 2, 50.00),
(4, 7, '2022-05-22 12:00:00', 6, 150.00),
(5, 3, '2022-05-28 15:00:00', 3, 90.00),
(5, 3, '2022-05-29 15:00:00', 4, 120.00),
(5, 4, '2022-05-24 11:00:00', 4, 120.00),
(5, 6, '2022-05-27 14:00:00', 4, 120.00),
(5, 9, '2022-05-31 13:00:00', 6, 180.00),
(6, 4, '2022-06-05 14:00:00', 5, 175.00),
(6, 8, '2022-05-28 14:00:00', 2, 70.00);

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
(1, '73263721G', 'Bartolomo', 'Real Bartolome', 'Carrera Madrid, 61', 37799, 'Salamanca'),
(2, '43828921Y', 'Araceli', 'Valencia Alarco', 'Cami Pedralbes, 80', 31656, 'Navarra'),
(3, '86669258Z', 'Martina', 'Olmo Bonet', 'Avinguda Pedralbes, 80', 24894, 'Leon'),
(4, '81928920E', 'Francisco', 'Angulo Santana', 'Placa Horno, 32', 23530, 'Jaen'),
(5, '56944717Y', 'Alex', 'Poveda Alcaraz', 'Cami Iglesia, 64', 6641, 'Badajoz'),
(6, '62653113D', 'Juan', 'Sevilla Mateos', 'Alameda Real, 62', 17440, 'Girona'),
(7, '34032531Y', 'Marcelino', 'Ruano Arranz', 'Avinguda Nueva, 8', 9194, 'Burgos'),
(8, '22141467B', 'Matias', 'Calero Bravo', 'Avenida Iglesia, 16', 39010, 'Cantabria'),
(9, '39896632G', 'Esmeralda', 'Palma Huerta', 'Avenida Iglesia, 96', 45942, 'Toledo'),
(10, '08920813X', 'Julian', 'Acosta Olmo', 'Cuesta Real, 38', 30379, 'Murcia');

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

INSERT INTO `motos` (`id_moto`, `matricula`, `marca`, `modelo`, `cv`, `cc`, `num_plazas`, `precio_hora`) VALUES
(1, '2605NHB', 'Sea doo', 'WAKW', 170, 1630, 3, 20.00),
(2, '0494CGC', 'Sea doo', 'Spark TRIX', 90, 899, 2, 12.00),
(3, '7225MJL', 'Sea doo', 'GTI', 130, 1630, 2, 25.00),
(4, '7223MMN', 'Sea doo', 'GTI', 90, 899, 2, 25.00),
(5, '4496BDM', 'Sea doo', 'GTX 170', 125, 1630, 3, 30.00),
(6, '2447FLN', 'Sea doo', 'GTX 230', 169, 1630, 3, 35.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_moto`,`id_cliente`,`fecha_hora`) USING BTREE,
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
