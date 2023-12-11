-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 05:48:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intradroxinet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_Categoria` int(20) NOT NULL,
  `Categorias` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_Categoria`, `Categorias`) VALUES
(1, 'Salud'),
(2, 'Belleza'),
(3, 'Cuidado personal'),
(4, 'Alimentos y bebidas '),
(5, 'Mamás y bebes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `Id_documento` int(20) NOT NULL COMMENT 'el id del documento sera la llave primaria, la cual genera que le dato no se repita durante la ejecucion',
  `tipo_documento` varchar(20) DEFAULT NULL COMMENT 'Nos permitira saber que tipo de documento tiene el usuario ( Cedula de ciudadania, cedula extranjera, etc...) '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`Id_documento`, `tipo_documento`) VALUES
(1, 'Cedula'),
(2, 'Cedula extrangera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id_estado` int(20) NOT NULL COMMENT 'sera la llave primaria, la cual genera que le dato no se repita.',
  `estado` varchar(20) NOT NULL COMMENT 'Este campo nos hace saber que estado tiene el usuario( activo,inactivo, inactivo vacacional)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(20) NOT NULL,
  `EVENTO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `EVENTO`) VALUES
(1, 'Entrada_producto'),
(2, 'Salida_producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Id_inventario` int(20) NOT NULL,
  `ID_PRODUCTO` varchar(20) NOT NULL,
  `ID_EVENTO` varchar(20) DEFAULT NULL,
  `Fecha_evento` date NOT NULL,
  `Can_productos` int(200) NOT NULL,
  `total` int(40) DEFAULT NULL,
  `id_Usurol` int(20) NOT NULL,
  `Id_categorias` int(11) NOT NULL,
  `Id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`Id_inventario`, `ID_PRODUCTO`, `ID_EVENTO`, `Fecha_evento`, `Can_productos`, `total`, `id_Usurol`, `Id_categorias`, `Id_proveedor`) VALUES
(1, '6', '2', '2023-06-17', 23, 127, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(20) NOT NULL,
  `nombre_producto` varchar(20) NOT NULL,
  `precio` int(20) DEFAULT NULL,
  `id_Categoria` varchar(50) NOT NULL,
  `id_proveedor` varchar(50) NOT NULL,
  `Cantidad_productos` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_producto`, `nombre_producto`, `precio`, `id_Categoria`, `id_proveedor`, `Cantidad_productos`) VALUES
(1, 'Acetaminofen ', 1500, '1', '2', 100),
(2, 'Acetato de aluminio', 5500, '1', '1', 180),
(3, 'Pestañina \"Maybellin', 42500, '2', '7', 110),
(4, 'Esmalte Vogue', 9000, '2', '8', 200),
(5, 'Crema dental', 13500, '3', '9', 100),
(6, 'Condones today', 13000, '3', '1', 150),
(7, 'Artesanal', 1500, '4', '3', 70),
(8, 'helado jet', 3500, '4', '3', 50),
(9, 'crema N4', 35000, '5', '2', 50),
(10, 'Pañales pequeñin 03', 2000, '5', '2', 200),
(19, 'a', 1, '2', '2', 1111),
(20, 'aaaaaa', 10, '1', '1', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(20) NOT NULL,
  `proveedores` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `proveedores`) VALUES
(1, 'Farmalisto'),
(2, 'mediservis'),
(3, 'Cremelado'),
(4, 'Cocacola'),
(6, 'Medimantis'),
(7, 'Maybelline'),
(8, 'Vogue'),
(9, 'Colgate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id_ROL` int(20) NOT NULL COMMENT 'La llave primaria que nos permite que el valor no se repita ',
  `Roles` varchar(20) NOT NULL COMMENT 'Este campo nos permite ver dentrol del programa que tipo de rol tiene el usuario registrado (Cajero, Administrador)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id_ROL`, `Roles`) VALUES
(1, 'Administrador '),
(2, 'Cajero'),
(3, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usu` int(20) NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Num_celular` varchar(20) NOT NULL,
  `Id_documento` varchar(20) NOT NULL,
  `Numero_documento` int(20) NOT NULL,
  `Contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usu`, `Nombres`, `Apellidos`, `Email`, `Num_celular`, `Id_documento`, `Numero_documento`, `Contraseña`) VALUES
(1, 'YON', 'VILLA', 'villajhon54@gmail.com', '3227137135', '1', 1010174546, '$2y$10$3W4kW6zp0gRhfp/HpMKQg.HdJ8/OlmS2FcI..YlHn7k0euhaUrL4m');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `id_Usurol` int(20) NOT NULL,
  `Numero_documento` varchar(50) DEFAULT NULL,
  `id_rol` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`id_Usurol`, `Numero_documento`, `id_rol`) VALUES
(1, '1010174546', 1),
(2, '1010174546', 2),
(3, '1010174546', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_Categoria`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`Id_documento`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id_estado`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id_inventario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id_ROL`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usu`),
  ADD KEY `ID_DOCUMENTO` (`Id_documento`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`id_Usurol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_Categoria` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `Id_inventario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usu` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  MODIFY `id_Usurol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
