--
-- Base de datos: `rinho`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
	`estado` int(11) NOT NULL AUTO_INCREMENT,
	`descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`estado`),
	UNIQUE KEY `idestados_UNIQUE` (`estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
	`municipio` int(11) NOT NULL AUTO_INCREMENT,
	`estado` int(11) NOT NULL,
	`descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`municipio`),
	UNIQUE KEY `idmunicipios_UNIQUE` (`municipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE IF NOT EXISTS `localidades` (
	`localidad` int(11) NOT NULL AUTO_INCREMENT,
	`municipio` int(11) DEFAULT NULL,
	`descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`localidad`),
	UNIQUE KEY `id_UNIQUE` (`localidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
	`empresa` int(11) NOT NULL AUTO_INCREMENT,
	`razonSocial` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
	`rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
	`domicilioFiscal` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `empresasContactos`
--

CREATE TABLE IF NOT EXISTS `empresasContactos` (
	`empresaContacto` int(11) NOT NULL AUTO_INCREMENT,
	`empresa` int(11) NOT NULL,
	`nombre` varchar(150) NOT NULL,
	`telefono` varchar(15) NOT NULL,
	`correo` varchar(150) NOT NULL,
	PRIMARY KEY (`empresaContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contactos del cliente' ;

-- --------------------------------------------------------

--
-- Table structure for table `puestos`
--

CREATE TABLE IF NOT EXISTS `puestos` (
	`puesto` int(11) NOT NULL AUTO_INCREMENT,
	`empresa` int(11) NOT NULL,
	`clave` char(10) NOT NULL,
	`nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
	`descripcion` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (`puesto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
	`departamento` int(11) NOT NULL AUTO_INCREMENT,
	`empresa` int(11) NOT NULL,
	`clave` char(10) NOT NULL,
	`nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
	`empleado` int(11) NOT NULL AUTO_INCREMENT,
	`empresa` int(11) NULL,
	`clave` char(10) NULL,
	`nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
	`apellidos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
	`nacionalidad` enum('Mexicana', 'Extranjera') COLLATE utf8_spanish_ci NOT NULL,
	`genero` enum('Masculino','Femenino') COLLATE utf8_spanish_ci NOT NULL,
	`nacimiento` date NOT NULL,
	`estadoCivil` enum('Soltero','Casado','Union Libre','Viudo','Divorciado') COLLATE utf8_spanish_ci DEFAULT NULL,
	`direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
	`estado` int(11) NOT NULL,
	`municipio` int(11) NOT NULL,
	`localidad` int(11) NOT NULL,
	`codigoPostal` char(6) NOT NULL,
	`telefonoPrincipal` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
	`correo` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
	`ingreso` date NOT NULL,
	`salida` date NOT NULL,
	PRIMARY KEY (`empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `experiencias`
--

CREATE TABLE IF NOT EXISTS `experiencias` (
	`experiencia` int(11) NOT NULL AUTO_INCREMENT,
	`puesto` varchar(45)  NOT NULL,
	`fechaDesde` date NOT NULL,
	`fechaHasta` date NOT NULL,
	`detalle` tinytext  DEFAULT NULL,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`experiencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `educacion`
--

CREATE TABLE IF NOT EXISTS `educacion` (
	`educacion` int(11) NOT NULL AUTO_INCREMENT,
	`nivel` enum('Bachillerato','Superior','Posgrado','Certificacion')  NOT NULL,
	`fechaDesde` date NOT NULL,
	`fechaHasta` date NOT NULL,
	`documento` enum('Certificado','Diploma','Titulo') NOT NULL,
	`nombre` varchar(75) NOT NULL,
	`institucion` varchar(75) NOT NULL,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`educacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `habilidades`
--

CREATE TABLE IF NOT EXISTS `hablidades` (
	`habilidad` int(11) NOT NULL AUTO_INCREMENT,
	`tags` tinytext DEFAULT NULL,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`habilidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

/*
-- --------------------------------------------------------

--
-- Table structure for table `familiares`
--

CREATE TABLE IF NOT EXISTS `familiares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60)  NOT NULL,
  `PARENTESCO` varchar(45)  NOT NULL COMMENT 'Hijo, Hija, Padre, Madre, Hermano, Hermana',
  `DISCAPACIDAD` varchar(2)  NOT NULL DEFAULT 'No' COMMENT 'Si o No',
  `INSTRUCCION` varchar(45)  NOT NULL DEFAULT 'Ninguna',
  `FECHA` date NOT NULL,
  `FECHA_EFEC` date NOT NULL COMMENT 'Fecha en la que se hace efectivo para el sistema',
  `empleado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_familiares_empleados1` (`empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


-- --------------------------------------------------------

--
-- Table structure for table `contratos`
--

CREATE TABLE IF NOT EXISTS `contratos` (
	`contrato` int(11) NOT NULL AUTO_INCREMENT,
	`fechaDesde` date NOT NULL,
	`fechaHasta` date DEFAULT NULL,
	`modalidad` enum('A Prueba','Capacitacion Inicial', 'Por Temporada', 'Salario Por Unidad De Tiempo') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Fijo , Contratado , Eventuales',
	`departamento_id` int(11) NOT NULL,
	`cargo_id` int(11) NOT NULL,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`contrato`),
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `ausencias`
--

CREATE TABLE IF NOT EXISTS `ausencias` (
	`ausencia` int(11) NOT NULL AUTO_INCREMENT,
	`tipo` ENUM('Injustificada', 'Permiso Con Goce', 'Permiso Sin Goce') NOT NULL COMMENT 'Remunerada , No Remunerada',
	`fecha` date NOT NULL,
	`descripcion` text ,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`ausencia`),
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `historiales`
--

CREATE TABLE IF NOT EXISTS `historiales` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`SUELDO_BASE` decimal(19,5) NOT NULL,
	`fechaDesde` date NOT NULL COMMENT 'Inicio ',
	`fechaHasta` date DEFAULT NULL COMMENT 'Fin',
	`FECHA_RET` date DEFAULT NULL COMMENT 'Fecha desde donde se va a pagar el sueldo retroactivo',
	`cargo_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `horas_extras`
--

CREATE TABLE IF NOT EXISTS `horas_extras` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`TIPO` varchar(45)  NOT NULL COMMENT 'Nocturno, Domingos y Feriados',
	`FECHA` date NOT NULL,
	`COMENTARIO` varchar(45)  DEFAULT NULL,
	`empleado` int(11) NOT NULL,
	PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Table structure for table `nominas`
--

CREATE TABLE IF NOT EXISTS `nominas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL,
  `QUINCENA` varchar(45)  NOT NULL COMMENT 'Primera Quincena , Segunda',
  `FECHA_ELA` datetime NOT NULL COMMENT 'Fecha de Elaboracion de la nomina',
  `SUELDO_MINIMO` decimal(19,5) NOT NULL,
  `BLOQUEAR` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `prestamos`
--

CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD` decimal(19,5) NOT NULL,
  `FECHA` date NOT NULL,
  `empleado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestamos_empleados1` (`empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
*/