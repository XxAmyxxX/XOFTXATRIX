-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2023 a las 16:03:12
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

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
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `categorias` (
  `Id_Categorias` int(20) NOT NULL,
  `Categorias` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `categorias`:
--

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`Id_Categorias`, `Categorias`) VALUES
(1, 'Salud'),
(2, 'Belleza'),
(3, 'Cuidado personal'),
(4, 'Alimentos y bebidas '),
(5, 'Mamás y bebes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--
-- Creación: 20-06-2023 a las 12:42:53
--

CREATE TABLE `documento` (
  `Id_documento` int(20) NOT NULL COMMENT 'el id del documento sera la llave primaria, la cual genera que le dato no se repita durante la ejecucion',
  `tipo_documento` varchar(20) DEFAULT NULL COMMENT 'Nos permitira saber que tipo de documento tiene el usuario ( Cedula de ciudadania, cedula extranjera, etc...) '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `documento`:
--

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
-- Creación: 20-06-2023 a las 12:42:53
--

CREATE TABLE `estado` (
  `Id_estado` int(20) NOT NULL COMMENT 'sera la llave primaria, la cual genera que le dato no se repita.',
  `estado` varchar(20) NOT NULL COMMENT 'Este campo nos hace saber que estado tiene el usuario( activo,inactivo, inactivo vacacional)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `estado`:
--

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
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `evento` (
  `id_evento` int(20) NOT NULL,
  `EVENTO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `evento`:
--

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
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `inventario` (
  `Id_inventario` int(20) NOT NULL,
  `ID_PRODUCTO` varchar(20) NOT NULL,
  `ID_EVENTO` varchar(20) DEFAULT NULL,
  `Fecha_evento` date NOT NULL,
  `Can_productos` int(200) NOT NULL,
  `total` int(40) DEFAULT NULL,
  `id_Usurol` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `inventario`:
--   `ID_EVENTO`
--       `evento` -> `id_evento`
--   `ID_PRODUCTO`
--       `producto` -> `Id_PRODUCTO`
--   `id_Usurol`
--       `usuariorol` -> `id_Usurol`
--

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`Id_inventario`, `ID_PRODUCTO`, `ID_EVENTO`, `Fecha_evento`, `Can_productos`, `total`, `id_Usurol`) VALUES
(1, '6', '2', '2023-06-17', 23, 127, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `producto` (
  `Id_PRODUCTO` int(20) NOT NULL,
  `NOMBRE_producto` varchar(20) NOT NULL,
  `precio` int(20) DEFAULT NULL,
  `ID_CATEGORIA` varchar(50) NOT NULL,
  `ID_PROVEEDOR` varchar(50) NOT NULL,
  `Cantidad_productos` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `producto`:
--   `ID_CATEGORIA`
--       `categorias` -> `Id_Categorias`
--   `ID_PROVEEDOR`
--       `proveedor` -> `Id_PROVEEDOR`
--

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_PRODUCTO`, `NOMBRE_producto`, `precio`, `ID_CATEGORIA`, `ID_PROVEEDOR`, `Cantidad_productos`) VALUES
(1, 'Acetaminofen ', 1500, '1', '2', 100),
(2, 'Acetato de aluminio', 5500, '1', '1', 180),
(3, 'Pestañina \"Maybellin', 42500, '2', '7', 110),
(4, 'Esmalte Vogue', 9000, '2', '8', 200),
(5, 'Crema dental', 13500, '3', '9', 100),
(6, 'Condones today', 13000, '3', '1', 150),
(7, 'Artesanal', 1500, '4', '3', 70),
(8, 'helado jet', 3500, '4', '3', 50),
(9, 'crema N4', 35000, '5', '2', 50),
(10, 'Pañales pequeñin 03', 2000, '5', '2', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `proveedor` (
  `Id_PROVEEDOR` int(20) NOT NULL,
  `Proveedores` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `proveedor`:
--

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_PROVEEDOR`, `Proveedores`) VALUES
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
-- Creación: 20-06-2023 a las 12:42:53
--

CREATE TABLE `roles` (
  `Id_ROL` int(20) NOT NULL COMMENT 'La llave primaria que nos permite que el valor no se repita ',
  `Roles` varchar(20) NOT NULL COMMENT 'Este campo nos permite ver dentrol del programa que tipo de rol tiene el usuario registrado (Cajero, Administrador)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `roles`:
--

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id_ROL`, `Roles`) VALUES
(1, 'Administrador '),
(2, 'Cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
-- Creación: 20-06-2023 a las 13:39:53
-- Última actualización: 20-06-2023 a las 13:44:12
--

CREATE TABLE `usuario` (
  `Id_Usu` int(20) NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Num_celular` varchar(20) NOT NULL,
  `Id_documento` varchar(20) NOT NULL,
  `Numero_documento` int(20) NOT NULL,
  `Contraseña` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `usuario`:
--   `Id_documento`
--       `documento` -> `Id_documento`
--

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usu`, `Nombres`, `Apellidos`, `Email`, `Num_celular`, `Id_documento`, `Numero_documento`, `Contraseña`) VALUES
(1, 'Maria Paula', 'Ramirez Pinzon ', 'Maria.ramirez@gmail.com', '3132315748', '1', 21098674, 'admin123'),
(2, 'Jose Luis', 'Gonzales lopez', 'joseluisgonzales@gmail.com', '3227137135', '1', 1022789886, 'cajero12'),
(15, 'yon', 'villa', 'villajhon54@gmail.com', '3227137135', '1', 1010174546, '343'),
(16, 'Amy', 'Rodriguez', 'amytriste8@gmail.com', '3132315748', '', 1011084584, ''),
(24, 'a', 'a', 'a@a', '11', '1', 11, '11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--
-- Creación: 20-06-2023 a las 12:43:33
--

CREATE TABLE `usuariorol` (
  `id_Usurol` int(20) NOT NULL,
  `Id_usu` int(20) NOT NULL,
  `id_rol` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- RELACIONES PARA LA TABLA `usuariorol`:
--   `Id_usu`
--       `usuario` -> `Id_Usu`
--   `id_rol`
--       `roles` -> `Id_ROL`
--

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`id_Usurol`, `Id_usu`, `id_rol`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categorias`);

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
  ADD PRIMARY KEY (`Id_PRODUCTO`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_PROVEEDOR`);

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
  MODIFY `Id_Categorias` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `Id_PRODUCTO` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id_PROVEEDOR` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usu` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  MODIFY `id_Usurol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla categorias
--

--
-- Metadatos para la tabla documento
--

--
-- Metadatos para la tabla estado
--

--
-- Metadatos para la tabla evento
--

--
-- Metadatos para la tabla inventario
--

--
-- Metadatos para la tabla producto
--

--
-- Metadatos para la tabla proveedor
--

--
-- Metadatos para la tabla roles
--

--
-- Metadatos para la tabla usuario
--

--
-- Metadatos para la tabla usuariorol
--

--
-- Metadatos para la base de datos intradroxinet
--

--
-- Volcado de datos para la tabla `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('intradroxinet', 'inventario', 'ID_EVENTO', 'intradroxinet', 'evento', 'id_evento'),
('intradroxinet', 'inventario', 'ID_PRODUCTO', 'intradroxinet', 'producto', 'Id_PRODUCTO'),
('intradroxinet', 'inventario', 'id_Usurol', 'intradroxinet', 'usuariorol', 'id_Usurol'),
('intradroxinet', 'producto', 'ID_CATEGORIA', 'intradroxinet', 'categorias', 'Id_Categorias'),
('intradroxinet', 'producto', 'ID_PROVEEDOR', 'intradroxinet', 'proveedor', 'Id_PROVEEDOR'),
('intradroxinet', 'usuario', 'Id_documento', 'intradroxinet', 'documento', 'Id_documento'),
('intradroxinet', 'usuariorol', 'Id_usu', 'intradroxinet', 'usuario', 'Id_Usu'),
('intradroxinet', 'usuariorol', 'id_rol', 'intradroxinet', 'roles', 'Id_ROL');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
