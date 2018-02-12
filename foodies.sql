-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-02-2018 a las 00:44:02
-- Versión del servidor: 5.6.36
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foodies`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extras`
--

CREATE TABLE `extras` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `extras`
--

INSERT INTO `extras` (`id`, `descripcion`, `precio`) VALUES
(1, 'Sin extras', 0),
(2, 'Doble ración de patatas', 2.5),
(3, 'Alitas de pollo', 5),
(4, 'Tarrina de helado', 3.5),
(5, 'Nuggets de pollo', 3.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

CREATE TABLE `lineapedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `importe` double NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lineapedido`
--

INSERT INTO `lineapedido` (`id`, `cantidad`, `importe`, `id_pedido`, `id_plato`) VALUES
(1, 12, 19.5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_pedido`, `id_tienda`, `id_usuario`) VALUES
(1, '2018-02-05 14:23:00', 1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `existencias` int(11) NOT NULL,
  `precio` double NOT NULL,
  `id_tipoplato` int(11) NOT NULL,
  `id_extras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`id`, `descripcion`, `imagen`, `existencias`, `precio`, `id_tipoplato`, `id_extras`) VALUES
(1, 'Hamburguesa de pollo', 'http://jarris.co/wp-content/uploads/2015/11/HAMBURGUESA-DE-POLLO-jarris.png', 50, 6.5, 1, 1),
(2, 'Filete de ternera', 'https://img.recetascomidas.com/recetas/640_480/filete-de-ternera-a-la-parrilla.jpg', 35, 10.95, 1, 1),
(3, 'Salmón ahumado', 'https://www.recetin.com/wp-content/uploads/2011/01/salmon-ahumado.jpg', 20, 12.95, 2, 1),
(4, 'Bacalao al pilpil', 'https://www.miscosillasdecocina.com/wp-content/uploads/2014/02/bacalao-pilpil-e1491084486535.jpg', 23, 11.5, 2, 1),
(5, 'Espaguetis a la carbonara', 'http://sevilla.abc.es/gurme//wp-content/uploads/2009/08/670_carbonarainterior_1251742200.jpg', 60, 7.95, 3, 1),
(6, 'Ñoquis con tomate', 'https://4.bp.blogspot.com/_KVUd709Di8s/SfXLhp-2uLI/AAAAAAAABOw/EsEqmOfs5xE/s400/%C3%91oquis.jpg', 33, 6.5, 3, 1),
(7, 'Arroz tres delicias', 'https://unareceta.com/wp-content/uploads/2016/10/arroz-tres-delicias.jpg', 94, 4.95, 4, 1),
(8, 'Arroz al horno', 'https://i.ytimg.com/vi/5tKKQxlLnRY/maxresdefault.jpg', 88, 4.95, 4, 1),
(9, 'Ensalada cesar', 'https://lacocinadefrabisa.lavozdegalicia.es/wp-content/uploads/2016/04/ensalada-cesar.jpg', 22, 8.95, 5, 1),
(10, 'Ensalada mediterranea', 'https://img-global.cpcdn.com/002_recipes/recipes_16759_v1393347074_receta_foto_00016759/400x400cq70/photo.jpg', 19, 6.95, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `fecha_ticket` datetime NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `fecha_ticket`, `iva`, `descripcion`, `id_pedido`) VALUES
(1, '2018-02-05 00:00:00', 21, 'Alta de pedido', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id`, `descripcion`, `direccion`) VALUES
(1, 'Foodies Puerto', 'Avenida del Puerto, 189'),
(2, 'Foodies Manuel Candela', 'Calle Doctor Manuel Candela, 58'),
(3, 'Foodies Menorca', 'Calle de Menorca, 19'),
(4, 'Foodies Peris i Valero', 'Avenida de Peris i Valero, 145');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoplato`
--

CREATE TABLE `tipoplato` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoplato`
--

INSERT INTO `tipoplato` (`id`, `descripcion`) VALUES
(1, 'Carne'),
(2, 'Pescado'),
(3, 'Pasta'),
(4, 'Arroz'),
(5, 'Ensalada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primer_apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encargado` tinyint(1) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validado` tinyint(1) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `id_tipousuario` int(11) NOT NULL,
  `id_tienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `telefono`, `direccion`, `email`, `codigo_postal`, `login`, `password`, `encargado`, `token`, `validado`, `activo`, `id_tipousuario`, `id_tienda`) VALUES
(1, 'Ismael', 'Garcia', 'Lorenzo', NULL, NULL, 'kysuke87@gmail.com', NULL, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, NULL, NULL, 1, NULL),
(2, 'Mauricio', 'Colmenero', 'Trujillo', NULL, NULL, 'macoltru@gmail.com', NULL, 'mauro', '19e37c4dfe9a2e1570be1f4cbafca76f3ed757231c0865e02465c909d916b1d1', 1, NULL, NULL, NULL, 2, 1),
(3, 'Isabel', 'Perez', 'Gomez', NULL, NULL, 'ispego@gmail.com', NULL, 'isabel', 'eb5094069f5e287ad7cfce5fc944f1c6565da2481af83fd5c24568e2481d09e3', 1, NULL, NULL, NULL, 2, 2),
(4, 'Fernando', 'Martin', 'Cromenawer', NULL, NULL, 'fermacro@gmail.com', NULL, 'fernando', '076a89c23179cedfc61171fe400ecf01fb76b9a48a68fb82dd0cd688d684d900', 1, NULL, NULL, NULL, 2, 3),
(5, 'Carla', 'Diaz', 'Alegre', NULL, NULL, 'cardial@gmail.com', NULL, 'carla', '8813d406421e0063ef8ec81fc45170338b4cfd9547ee1ab157b90b46bcb6e2a7', 1, NULL, NULL, NULL, 2, 4),
(6, 'Antonio', 'Castillo', 'Muñoz', NULL, NULL, 'ancasmu@gmail.com', NULL, 'toni', 'bb37067afeb4ee16d668eef073ca6eea4f3b4a1fc6c68e3c0b1fd01a5fb7f5ad', 0, NULL, NULL, NULL, 2, 1),
(7, 'Adrian', 'Escriche', 'Blanco', NULL, NULL, 'adesbla@gmail.com', NULL, 'adrian', 'c23ad6f18412014673b2d04794ca038ef6767fe94afe408dffb775362fe07e68', 0, NULL, NULL, NULL, 2, 1),
(8, 'Paula', 'Ahedo', 'Gutierrez', NULL, NULL, 'pahgut@gmail.com', NULL, 'paula', '0c086cdc772aa579506fd17a735af6e7d14db0ad1d49730c301e007c3e663d36', 0, NULL, NULL, NULL, 2, 1),
(9, 'Alejandro', 'Buenafuente', 'Galdos', NULL, NULL, 'albuga@gmail.com', NULL, 'alex', '4135aa9dc1b842a653dea846903ddb95bfb8c5a10c504a7fa16e10bc31d1fdf0', 0, NULL, NULL, NULL, 2, 2),
(10, 'Judith', 'Becker', 'Andersson', NULL, NULL, 'jubean@gmail.com', NULL, 'judi', 'a1e6bf41462142e42dde5522029fb8d2d14238dc033b427cd76b7bae6842ae64', 0, NULL, NULL, NULL, 2, 2),
(11, 'Steve', 'Jobs', 'Jobs', NULL, NULL, 'stejojo@gmail.com', NULL, 'steve', 'f148389d080cfe85952998a8a367e2f7eaf35f2d72d2599a5b0412fe4094d65c', 0, NULL, NULL, NULL, 2, 2),
(12, 'Susana', 'Diaz', 'Alegre', NULL, NULL, 'sudial@gmail.com', NULL, 'susi', 'b77cee999c72f1afcaca7974345238f92e226d8f4afe19f9ced3cd72f69f05f2', 0, NULL, NULL, NULL, 2, 3),
(13, 'Nicolas', 'Blanco', 'Carrero', NULL, NULL, 'niblaca@gmail.com', NULL, 'nico', 'b18aaa6c6b929b866051b69a785a6cdce5bdd564d41be247c7d5ef7c2e2e2271', 0, NULL, NULL, NULL, 2, 3),
(14, 'David', 'Gonzalez', 'Molina', NULL, NULL, 'dagomo@gmail.com', NULL, 'david', '07d046d5fac12b3f82daf5035b9aae86db5adc8275ebfbf05ec83005a4a8ba3e', 0, NULL, NULL, NULL, 2, 3),
(15, 'Maria', 'Talgo', 'Mendoza', NULL, NULL, 'matame@gmail.com', NULL, 'maria', '94aec9fbed989ece189a7e172c9cf41669050495152bc4c1dbf2a38d7fd85627', 0, NULL, NULL, NULL, 2, 4),
(16, 'Marcos', 'Gimenez', 'Terol', '623814557', 'Calle de Carolina Alvarez, 5', 'magite@gmail.com', '46023', 'marcos', '43f1efecd33031b0ccd142b1c5cccc44ea19ad3e7a947965c5b0c16a632b5d7b', NULL, NULL, 1, 1, 3, 3),
(17, 'Eugenio', 'Albatros', 'Diaz', '623159585', 'Calle del Poeta Mas y Ros, 10', 'eualdi@gmail.com', '46021', 'eugen', 'd39cd0d270bb9906479b95fee209adf872bbc382db5ae42c45ff367451d1d473', NULL, NULL, 1, 1, 3, 4),
(18, 'Estefania', 'Lopez', 'Lopez', '621459563', 'Calle de la Noguera, 17', 'eslolo@gmail.com', '46023', 'fani', 'ec694d969ed12d52b9ad1866d62ae95988845dc2176e3f661039442b071ca219', NULL, NULL, 1, 1, 3, 1),
(19, 'Beatriz', 'Alcantara', 'Ballester', '622986532', 'Avenida de Francia, 15', 'bealba@gmail.com', '46023', 'bea', 'b6e1557a1ed3900d7be8e28bb5f137d91812f31e59a90ceddac0276bc532d18e', NULL, NULL, 1, 1, 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_pedido_pedido1_idx` (`id_pedido`),
  ADD KEY `fk_linea_pedido_plato1_idx` (`id_plato`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_tienda1_idx` (`id_tienda`),
  ADD KEY `fk_pedido_usuario1_idx` (`id_usuario`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_plato_tipo_plato1_idx` (`id_tipoplato`),
  ADD KEY `fk_plato_extras1_idx` (`id_extras`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_pedido1_idx` (`id_pedido`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoplato`
--
ALTER TABLE `tipoplato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipousuario1_idx` (`id_tipousuario`),
  ADD KEY `fk_usuario_tienda1_idx` (`id_tienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `extras`
--
ALTER TABLE `extras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipoplato`
--
ALTER TABLE `tipoplato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `fk_linea_pedido_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_linea_pedido_plato1` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_tienda1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `fk_plato_extras1` FOREIGN KEY (`id_extras`) REFERENCES `extras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plato_tipo_plato1` FOREIGN KEY (`id_tipoplato`) REFERENCES `tipoplato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tienda1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`id_tipousuario`) REFERENCES `tipousuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
