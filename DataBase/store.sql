-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 23:03:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Nombre` varchar(30) NOT NULL,
  `Clave` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Nombre`, `Clave`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CodigoCat` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodigoCat`, `Nombre`, `Descripcion`) VALUES
('AP005', 'Conectividad WIFI', 'Dispositivos de Conectividad WIFI para Hogar y Empresas'),
('DP006', 'Pantallas / Displays', 'Pantallas Tipo Empresariales y Hogar'),
('PCS002', 'Equipos de Computo Tipo Torre', 'Equipos de Computo para Empresas y Hogar'),
('PT007', 'Equipos Portátiles', 'Equipos de Computo Portátiles para Empresas y Hogar'),
('SEG003', 'Firewalls / UTMS', 'Dispositivos de Seguridad de RED'),
('SRV001', 'Servidores', 'Infraestructura de Datos'),
('SW004', 'Equipos Conmutadores', 'Dispositivos de Conexión de Redes Cableadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `NIT` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `NombreCompleto` varchar(70) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Clave` text NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NIT`, `Nombre`, `NombreCompleto`, `Apellido`, `Clave`, `Direccion`, `Telefono`, `Email`) VALUES
('1032405115', 'yaroca', 'Yudy', 'Aroca', 'e10adc3949ba59abbe56e057f20f883e', 'carrera 7a No 2', 2147483647, 'yaroca@gmail.com'),
('1083469292', 'Ricardog', 'Ricardo Mario', 'Gonzalez Juvinao', 'e10adc3949ba59abbe56e057f20f883e', 'Carrera 8b este No 102-51 sur', 2147483647, 'ricardo.gonzalezj@cun.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `NumPedido` int(20) NOT NULL,
  `CodigoProd` varchar(30) NOT NULL,
  `CantidadProductos` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`NumPedido`, `CodigoProd`, `CantidadProductos`) VALUES
(6, '1000', 1),
(6, '2000', 1),
(6, '3004', 1),
(6, '6002', 1),
(7, '1000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodigoProd` varchar(30) NOT NULL,
  `NombreProd` varchar(30) NOT NULL,
  `CodigoCat` varchar(30) NOT NULL,
  `Precio` decimal(30,2) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Stock` int(20) NOT NULL,
  `NITProveedor` varchar(30) NOT NULL,
  `Imagen` varchar(150) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodigoProd`, `NombreProd`, `CodigoCat`, `Precio`, `Modelo`, `Marca`, `Stock`, `NITProveedor`, `Imagen`, `Nombre`) VALUES
('1000', 'Pantalla LED - DELL T4005FHD40', 'DP006', '1000000.00', 'DELL T4005-FHD90', 'DELL', 8, '100200405', 'pantalla1-Photoroom.png-Photoroom.png', 'admin'),
('1001', 'Pantalla DELL T4000K-SCR', 'DP006', '2500000.00', 'DELL T4000K-SCR', 'DELL', 10, '100200405', 'pantalla2-Photoroom.png-Photoroom.png', 'admin'),
('1002', 'Pantalla DELL FHD24RFT-45', 'DP006', '500000.00', 'DELL FHD24RFT-45', 'DELL', 10, '100200405', 'pantalla3-Photoroom.png-Photoroom.png', 'admin'),
('1003', 'Monitor HD DELL 2004TKSHD', 'DP006', '450000.00', 'DELL 2004TKSHD', 'DELL', 10, '100200405', 'pantalla5-Photoroom.png-Photoroom.png', 'admin'),
('1004', 'CURVED DELL 4K4009PSK', 'DP006', '4000000.00', 'DELL 4K4009PSK', 'DELL', 10, '100200405', 'pantalla6-Photoroom.png-Photoroom.png', 'admin'),
('2000', 'Linksys AP Turbo7000WF', 'AP005', '800000.00', 'AP Turbo7000WF', 'Linksys', 49, '1083479272', 'AP01.png', 'admin'),
('2001', 'ARUBA AP Indoor T5G-0998', 'AP005', '1200000.00', 'AP Indoor T5G-0998', 'ARUBA', 50, '1083479272', 'Ap4-Photoroom.png-Photoroom.png', 'admin'),
('2002', 'NETGEAR AP Indoor T50g25AP1', 'AP005', '1200000.00', 'NETGEAR AP Indoor T50g25AP1', 'NETGEAR', 50, '1083479272', 'Ap5-Photoroom.png-Photoroom.png', 'admin'),
('2003', 'NETGEAR AP Indoor SHATKEETS500', 'AP005', '450000.00', 'NETGEAR AP Indoor SHATKEETS500', 'NETGEAR', 50, '1083479272', 'Ap6-Photoroom.png-Photoroom.png', 'admin'),
('3000', 'Mikrotik RB3011 UIAS RM', 'SEG003', '800000.00', 'RB3011 UIAS RM', 'Mikrotik', 20, '800654993', 'FW1-Photoroom.png-Photoroom.png', 'admin'),
('3001', 'Palo Alto UTM/Firewall PA2050', 'SEG003', '45000000.00', 'Palo Alto UTM/Firewall PA2050', 'Palo Alto Networks', 10, '700654823', 'FW2-Photoroom.png-Photoroom.png', 'admin'),
('3002', 'Palo Alto UTM/Firewall PA5050', 'SEG003', '55000000.00', 'Palo Alto UTM/Firewall PA5050', 'Palo Alto Networks', 10, '700654823', 'FW3-Photoroom.png-Photoroom.png', 'admin'),
('3003', 'SonicWALL UTM-2400MX', 'SEG003', '25000000.00', 'SonicWALL UTM-2400MX', 'Sonic WALL', 10, '1083479266', 'FW4-Photoroom.png-Photoroom.png', 'admin'),
('3004', 'SonicWALL UTM-5700', 'SEG003', '25000000.00', 'SonicWALL UTM-5700', 'Sonic WALL', 9, '1083479266', 'FW5.png', 'admin'),
('3005', 'SonicWALL UTM-TZ600', 'SEG003', '5000000.00', 'SonicWALL UTM-TZ600', 'Sonic WALL', 10, '1083479266', 'FW6-Photoroom.png-Photoroom.png', 'admin'),
('4000', 'DELL Optiplex 5040', 'PCS002', '4500000.00', 'DELL Optiplex 5040', 'DELL', 40, '100200405', 'PC1-Photoroom.png-Photoroom.png', 'admin'),
('4001', 'DELL Optiplex 5000', 'PCS002', '4000000.00', 'DELL Optiplex 5000', 'DELL', 40, '100200405', 'PC2-Photoroom.png-Photoroom.png', 'admin'),
('4002', 'DELL Optiplex 7020', 'PCS002', '4200000.00', 'DELL Optiplex 7020', 'DELL', 40, '100200405', 'PC3-Photoroom.png-Photoroom.png', 'admin'),
('4003', 'DELL Optiplex 3450', 'PCS002', '4300000.00', 'DELL Optiplex 3450', 'DELL', 40, '100200405', 'PC4-Photoroom.png-Photoroom.png', 'admin'),
('4004', 'DELL Optiplex 6450', 'PCS002', '3800000.00', 'DELL Optiplex 6450', 'DELL', 40, '100200405', 'PC5-Photoroom.png-Photoroom.png', 'admin'),
('4005', 'DELL Optiplex 8450', 'PCS002', '5600000.00', 'DELL Optiplex 8450', 'DELL', 40, '100200405', 'PC6-Photoroom.png-Photoroom.png', 'admin'),
('5000', 'Lenovo T800TP', 'PT007', '5800000.00', 'Lenovo T800TP', 'Lenovo', 10, '1083475266', 'PT1-Photoroom.png-Photoroom.png', 'admin'),
('5001', 'Lenovo T810TP', 'PT007', '6000000.00', 'Lenovo T810TP', 'Lenovo', 10, '1083475266', 'PT2-Photoroom.png-Photoroom.png', 'admin'),
('5002', 'Lenovo T930TP', 'PT007', '8000000.00', 'Lenovo T930TP', 'Lenovo', 10, '1083475266', 'PT3-Photoroom.png-Photoroom.png', 'admin'),
('5003', 'Asus Book Pro510', 'PT007', '10000000.00', 'Asus Book Pro510', 'Asus', 10, '1083479274', 'PT4-Photoroom.png-Photoroom.png', 'admin'),
('5004', 'Asus Book Pro810', 'PT007', '12000000.00', 'Asus Book Pro810', 'Asus', 10, '1083479274', 'PT5-Photoroom.png-Photoroom.png', 'admin'),
('5005', 'Asus Zen Book Pro880', 'PT007', '12500000.00', 'Asus Zen Book Pro880', 'Asus', 10, '1083479274', 'PT6-Photoroom.png-Photoroom.png', 'admin'),
('6000', 'Servidor DELL EMC T340', 'SRV001', '18000000.00', 'Servidor DELL EMC T340', 'DELL EMC', 10, '100200405', 'servidor3-Photoroom.png-Photoroom.png', 'admin'),
('6001', 'Servidor DELL EMC T540', 'SRV001', '20000000.00', 'Servidor DELL EMC T540', 'DELL EMC', 10, '100200405', 'Servidor4-Photoroom.png-Photoroom.png', 'admin'),
('6002', 'Servidor DELL EMC T980', 'SRV001', '60000000.00', 'Servidor DELL EMC T980', 'DELL EMC', 9, '100200405', 'servidor5-Photoroom.png-Photoroom.png', 'admin'),
('6003', 'Servidor DELL EMC T8710', 'SRV001', '40000000.00', 'Servidor DELL EMC T8710', 'DELL EMC', 10, '100200405', 'servidor6-Photoroom.png-Photoroom.png', 'admin'),
('6004', 'Servidor DELL EMC T40', 'SRV001', '24000000.00', 'Servidor DELL EMC T40', 'DELL EMC', 10, '100200405', 'Servidores2-Photoroom.png-Photoroom.png', 'admin'),
('6005', 'Servidor DELL EMC T340', 'SRV001', '20000000.00', 'Servidor DELL EMC T340', 'DELL EMC', 10, '100200405', 'Servidores3-Photoroom.png-Photoroom.png', 'admin'),
('7000', 'Cisco Catalyst 2960 pack', 'SW004', '25000000.00', 'Cisco Catalyst 2960', 'Cisco', 60, '108347993', 'Sw1-Photoroom.png-Photoroom.png', 'admin'),
('7001', 'Cisco Catalyst 3750G pack', 'SW004', '35000000.00', 'Cisco Catalyst 3750G', 'Cisco', 60, '108347993', 'Sw2-Photoroom.png-Photoroom.png', 'admin'),
('7002', 'Cisco Catalyst 2750G pack', 'SW004', '15000000.00', 'Cisco Catalyst 2750G', 'Cisco', 60, '108347993', 'Sw3-Photoroom.png-Photoroom.png', 'admin'),
('7003', 'Cisco Catalyst 2960 24P', 'SW004', '4500000.00', 'Cisco Catalyst 2960 24P', 'Cisco', 30, '108347993', 'sw4-Photoroom.png-Photoroom.png', 'admin'),
('7004', 'Cisco Pack SW 5000', 'SW004', '4000000.00', 'Cisco Pack SW 5000', 'Cisco', 30, '108347993', 'sw6-Photoroom.png-Photoroom.png', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `NITProveedor` varchar(30) NOT NULL,
  `NombreProveedor` varchar(30) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `PaginaWeb` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NITProveedor`, `NombreProveedor`, `Direccion`, `Telefono`, `PaginaWeb`) VALUES
('100200405', 'DELL Tecnologies', 'Miami, Fl 105 Aut Center', 2147483647, 'www.dell.com'),
('1083475266', 'Lenovo', 'Miami, Fl 200 Aut. Center', 2147483647, 'www.lenovo.com'),
('1083479266', 'Sonic WALL', 'Miami, Fl 200 Aut. Center', 2147483647, 'www.sonicwall.com'),
('1083479272', 'Ubiquiti - Unifi', 'Miami, Fl 100 Aut Center', 2147483647, 'www.unifi.com'),
('1083479274', 'Asus Computers', 'Miami, Fl 200 Aut.', 2147483647, 'www.asus.com'),
('108347993', 'Cisco ', 'Miami Est Upn Autp.', 2147483647, 'www.cisco.com'),
('700654823', 'Palo Alto Networks', 'Miami FL. Oest ST', 2147483647, 'www.paloalto.com'),
('800654993', 'Mikrotik US.', 'St. Florida Coral State', 2147483647, 'www.mikrotik.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `NumPedido` int(20) NOT NULL,
  `Fecha` varchar(150) NOT NULL,
  `NIT` varchar(30) NOT NULL,
  `Descuento` int(20) NOT NULL,
  `TotalPagar` decimal(30,2) NOT NULL,
  `Estado` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`NumPedido`, `Fecha`, `NIT`, `Descuento`, `TotalPagar`, `Estado`) VALUES
(6, '24-05-2024', '1083469292', 0, '86800000.00', 'Pendiente'),
(7, '24-05-2024', '1083469292', 0, '1000000.00', 'Pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Nombre`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CodigoCat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD KEY `NumPedido` (`NumPedido`),
  ADD KEY `CodigoProd` (`CodigoProd`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodigoProd`),
  ADD KEY `CodigoCat` (`CodigoCat`),
  ADD KEY `NITProveedor` (`NITProveedor`),
  ADD KEY `Agregado` (`Nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NITProveedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`NumPedido`),
  ADD KEY `NIT` (`NIT`),
  ADD KEY `NIT_2` (`NIT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `NumPedido` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_8` FOREIGN KEY (`CodigoProd`) REFERENCES `producto` (`CodigoProd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ibfk_9` FOREIGN KEY (`NumPedido`) REFERENCES `venta` (`NumPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_7` FOREIGN KEY (`CodigoCat`) REFERENCES `categoria` (`CodigoCat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_8` FOREIGN KEY (`NITProveedor`) REFERENCES `proveedor` (`NITProveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_9` FOREIGN KEY (`Nombre`) REFERENCES `administrador` (`Nombre`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`NIT`) REFERENCES `cliente` (`NIT`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

