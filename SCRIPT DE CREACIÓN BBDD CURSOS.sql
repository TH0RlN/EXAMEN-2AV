DROP DATABASE IF EXISTS CURSOS;
CREATE DATABASE IF NOT EXISTS CURSOS;
USE CURSOS;


DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `DNI` char(9) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(10) default NULL,
  `Nacionalidad` enum('ESPANOLA','ITALIANA','FRANCESA','INGLESA') NOT NULL default 'ESPANOLA',
  `Email` varchar(40) NOT NULL,
  `fecha_nac` date NOT NULL,
  `Aula` int unsigned  NOT NULL, /*relación obligatoria*/
  PRIMARY KEY  (`DNI`),
  UNIQUE KEY `Ak_Email_ALUMNO` (`Email`),
  KEY `fk_Alumno_tiene_Aula` (`Aula`)
) ENGINE=InnoDB; 


-- Volcar la base de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`DNI`, `Nombre`, `Direccion`, `Telefono`, `Nacionalidad`, `Email`, `fecha_nac`, `Aula`) VALUES
('111111111', 'maria lopez  fernandez', 'C/Camelias, Vigo', '986785432', 'ESPANOLA', 'maria@gmail.com', '2000-03-02', 36204),
('12121212', 'carmen fernandez p?rez', 'c/ del Pino, coruna', NULL, 'ESPANOLA', 'cfc@gmail.com', '1999-10-26', 36208),
('21212121', 'olga fuertes grande', 'c/Gran Via, Lugo', '643213456', 'ESPANOLA', 'olga@gmail.com', '1998-09-02', 36210),
('22222222', 'pepe fernandez', 'C/lopez Mora, Vigo', '986121234', 'ESPANOLA', 'pp@gmail.com', '1999-03-15', 36204),
('31313131', 'paula dominguez crespo', 'c/ uno, dos, Lugo', NULL, 'ESPANOLA', 'pdc@gmail.com', '2001-02-18', 36211),
('33333333', 'lola del puerto', 'AVDA CASTELAO 1, vigo', NULL, 'ESPANOLA', 'lola@gmail.com', '2001-03-03', 36204),
('414141414', 'fernando castro lopez', 'plaza de Vigo, coruna', '677543211', 'ESPANOLA', 'fernandocastro@gmail.com', '1998-12-27', 36210),
('44444444', 'ines gomez gomez', 'avda castrelos 123', NULL, 'ESPANOLA', 'ggi@gmail.com', '1997-05-11', 36205),
('51515151', 'maria fernanda lopez', 'plaza de la fuente, lugo', '988347890', 'ESPANOLA', 'mariallll@gmail.com', '2002-06-03', 36209),
('55555555', 'luis postigo castro', 'avda de arteixo 3, Coruna', NULL, 'ESPANOLA', 'luisp@hotmail.com', '1997-01-02', 36205),
('66666666', 'laura dominguez', 'avda Barcelona, CoruNa', '981121212', 'ESPANOLA', 'lll@gmail.com', '1988-05-15', 36205),
('7777777', 'pedro gomez gomez', 'Avda pirata, lugo', NULL, 'ESPANOLA', 'pedro@gmail.com', '1999-02-07', 36206),
('88888888', 'MARTA  G?MEZ FERN?NDEZ', 'avda de  portugal 34 , Lugo', NULL, 'ESPANOLA', 'marta@gmail.com', '1999-08-10', 36206),
('99999999', 'JUAN FERNANDO MART?NEZ', 'C/ Lopez Mora, Vigo', NULL, 'ESPANOLA', 'jjj@gmail.com', '1999-01-03', 36207);



DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `Codigo` int unsigned  NOT NULL auto_increment,
  `Nombre` varchar(30) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Direccion` varchar(30) default NULL,
  PRIMARY KEY  (`Codigo`),
  UNIQUE KEY `nombrelocalidad` (`Nombre`,`Localidad`)
) ENGINE=InnoDB   AUTO_INCREMENT=36212 ;


-- Volcar la base de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`Codigo`, `Nombre`, `Localidad`, `Direccion`) VALUES
(36204, 'aula socrates', 'Vigo', 'AVDA CASTELAO 123'),
(36205, 'aula socrates', 'Coruna', 'avda de arteixo 123'),
(36206, 'aula pitagoras', 'Vigo', 'C/Camelias'),
(36207, 'aula pitagoras', 'Coruna', 'avda Barcelona 23'),
(36208, 'aula Federico Garcia Lorca', 'Vigo', 'avda de samil, 5'),
(36209, 'aula Federico Garcia Lorca', 'Coruna', NULL),
(36210, 'aula pitagoras', 'Lugo', 'La muralla 56'),
(36211, 'aula socrates', 'Lugo', 'La muralla 57');


DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `Nombre` varchar(30) NOT NULL,
  `Libro` varchar(45) default NULL,
  `web` varchar(125) NOT NULL,
  `Horas` int NOT NULL default '100',
  `Precio_hora` float NOT NULL default '120.0',
   tutor char(9) NOT NULL, /*relación obligatoria*/
   dia_tutoria enum('lunes','martes','miercoles','jueves') not null default 'lunes',
   hora_tutoria time not null default '11:00:00',
  PRIMARY KEY  (`Nombre`),
  UNIQUE KEY `AK_WEB` (`web`),
  KEY  fk_prof_tutor (tutor) /*profesor participa a muchos en relación ser tutor*/
) ENGINE=InnoDB; 


-- Volcar la base de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`Nombre`, `Libro`, `web`, `Horas`, `Precio_hora`,tutor,dia_tutoria,hora_tutoria)
 VALUES
('administracion de SG de bases ', 'administracion de SG de bases de datos.Ra_ma',
  'www.academia./apuntes/adminbases.es', 100, 60,'675675675','lunes','16:00:00'),
('BASES DE DATOS 1', NULL, 'www.academia./bases.es', 120, 80,'900900900','jueves','12:00:00'),
('MATEMATICAS I', NULL, 'www.academia./apuntes/matematicas.es', 100, 78,'345345345','jueves','12:00:00'),
('MATEMATICAS II', 'matematiicas avanzadas . Ra_ma', 'www.academia./apuntes/matematicas2.es', 100, 60,'33333333','lunes','11:30:00'),
('programacion avanzada Java', NULL, 'www.academia./apuntes/java.es', 130, 50,'675675675','martes','11:45:00'),
('programacion procesos', NULL, 'www.academia./apuntes/procesos.es', 130, 45,'675675675','miercoles','13:00:00'),
('PROGRAMACION WEB', 'libro de programacion', 'www.academia/apuntes/bases.es', 100, 60,'89898989','lunes','10:00:00'),
('sistemas operativos ', 'sistemas operativos. Ra_ma', 'www.academia./apuntes/sistemas.es', 90, 60,'777654321','martes','11:00:00');


/*relación (N:M) registros de trabajo: profesor imparte en curso
profesor participa (0,n) en la relación impartir curso
curso participa (0,n) en la relación tener profesor que lo imparte**/

DROP TABLE IF EXISTS `cursos_profesores`;
CREATE TABLE IF NOT EXISTS `cursos_profesores` (
  `Curso` varchar(30) NOT NULL,
  `Profesor` char(9) NOT NULL,
  `numero_horas` int NOT NULL default '20',
  PRIMARY KEY  (`Curso`,`Profesor`),
  KEY `fk_Curso` (`Curso`),
  KEY `fk_Profesor` (`Profesor`)
) ENGINE=InnoDB ;



-- Volcar la base de datos para la tabla `cursos_profesores`
--

INSERT INTO `cursos_profesores` (`Curso`, `Profesor`, `numero_horas`) VALUES
('administracion de SG de bases ', '555555555', 20),
('administracion de SG de bases ', '675675675', 20),
('BASES DE DATOS 1', '89898989', 40),
('BASES DE DATOS 1', '900900900', 15),
('MATEMATICAS I', '345345345', 20),
('MATEMATICAS I', '900900900', 20),
('MATEMATICAS II', '33333333', 20),
('MATEMATICAS II','900900900',35),
('programacion avanzada Java', '230230230', 20),
('programacion avanzada Java', '777654321', 34),
('programacion procesos', '11111111', 20),
('programacion procesos', '22222222', 20),
('programacion procesos', '33333333', 20),
('PROGRAMACION WEB', '11111111', 20),
('PROGRAMACION WEB', '230230230', 70),
('PROGRAMACION WEB', '675675675', 20),
('PROGRAMACION WEB','89898989',34),
('sistemas operativos ', '33333333', 20),
('sistemas operativos ', '777654321', 20),
('MATEMATICAS II','77777777',32);



DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `Id_departamento` int unsigned  NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `director` char(9) NOT NULL,/* relación obligatoria*/
  `fecha_direccion` date NOT NULL,
   prima_direccion  float not null default 350.0,
  PRIMARY KEY  (`Id_departamento`),
  UNIQUE KEY `fk_profesor_director` (`director`),/*restricción unicidad, prof participa máx 1*/
  UNIQUE KEY AK_NOMBRE_DEP  (NOMBRE)/*restricción de unicidad , ak */
) ENGINE=InnoDB   AUTO_INCREMENT=15 ;



-- Volcar la base de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` 
(`Id_departamento`, `nombre`, `director`, `fecha_direccion`,prima_direccion) VALUES
(10, 'direccion', '11111111', '1997-03-03',400),
(11, 'administracion', '22222222', '2009-04-12',350),
(12, 'ciencias', '555555555', '2007-08-02',380),
(13, 'practicas', '89898989', '2016-03-09',350),
(14,'matemáticas','230230230','2018-02-20',450);

/* tabla para la relación (n:m), registros de matrículas: 
     alumno matriculado en curso / curso tiene matricula de alumno
     */

DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE IF NOT EXISTS `matriculas` (
  `Alumno` char(9) NOT NULL,
  `Curso` varchar(30) NOT NULL,
  `fecha_matricula` date NOT NULL,
  PRIMARY KEY  (`Alumno`,`Curso`),
  KEY `fk_Alumno` (`Alumno`),
  KEY `fk_Curso` (`Curso`)
) ENGINE=InnoDB ;

-- Volcar la base de datos para la tabla `matriculas`
--
/* relación (n:m) registros de las matriculas**/

INSERT INTO `matriculas` (`Alumno`, `Curso`, `fecha_matricula`) VALUES

('12121212', 'programacion procesos', '2016-03-02'),
('12121212', 'PROGRAMACION WEB', '2016-03-02'),
('21212121', 'administracion de SG de bases ', '2016-01-04'),
('21212121', 'MATEMATICAS II', '2016-03-20'),
('21212121', 'programacion avanzada Java', '2016-04-02'),
('22222222', 'programacion avanzada Java', '2016-02-07'),
('31313131', 'administracion de SG de bases ', '2016-08-03'),
('33333333', 'programacion procesos', '2016-03-16'),
('33333333', 'sistemas operativos ', '2016-02-15'),
('414141414', 'programacion avanzada Java', '2016-09-02'),
('44444444', 'sistemas operativos ', '2016-03-17'),
('51515151', 'BASES DE DATOS 1', '2013-03-02'),
('51515151', 'MATEMATICAS II', '2016-03-02'),
('51515151', 'sistemas operativos ', '2013-03-02'),
('55555555', 'MATEMATICAS II', '2016-03-01'),
('66666666', 'administracion de SG de bases ', '2016-05-15'),
('66666666', 'programacion procesos', '2016-03-23'),
('7777777', 'programacion avanzada Java', '2016-03-02'),
('88888888', 'administracion de SG de bases ', '2016-09-15'),
('88888888', 'BASES DE DATOS 1', '2016-03-09'),
('88888888', 'programacion avanzada Java', '2016-05-02'),
('99999999', 'sistemas operativos ', '2016-03-25');


DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `DNI` char(9) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `AdminAula` int unsigned  default NULL,/*relación optativa administrar un aula*/
  `Supervisor` char(9) default NULL,/*relación optativa tener un supervisor*/
  `departamento` int unsigned  NOT NULL,/*relación obligatoria pertenecer a un departamento*/
  PRIMARY KEY  (`DNI`),
  UNIQUE KEY `AK_EMAIL_PROFESOR` (`Email`),/*restricción de unicidad, AK*/
  KEY `fk_Profesor_administraAula` (`AdminAula`),
  KEY `fk_Profesor_tieneSupervisor` (`Supervisor`),
  KEY `FK_Profesor_pertence_departamento` (`departamento`)
) ENGINE=InnoDB ;


-- Volcar la base de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`DNI`, `Nombre`, `Email`, `AdminAula`, `Supervisor`, `departamento`) VALUES
('11111111', 'fernando el tuerto', 'fer@gmail.com', 36205, NULL, 10),
('22222222', 'ana perez perez', 'ana@gmail.com', 36207, '555555555', 11),
('230230230', 'Dolores Perez Garcia', 'dolores@gmail.com', 36208, '22222222', 12),
('33333333', 'laura perez', 'laura@gmail.com', 36207, '555555555', 13),
('345345345', 'Maria Fernandez', 'mff@gmail.com', NULL, '22222222', 10),
('555555555', 'pepe botella', 'pepe@gmail.com', 36206, NULL, 11),
('675675675', 'dolores fuertes de barriga', 'dfb@gmail.com', 36209, '11111111', 10),
('777654321', 'juan jose torradoj', 'jjt@gmail.com', NULL, '11111111', 12),
('89898989', 'joaquin garci lopez', 'fff@gmail.com', NULL, '11111111', 13),
('900900900', 'federico perez', 'fpp@gmail.com', 36210, '555555555', 13),
('44444444','mercedes fernandez lopez','mfl@gmail.com',NULL,NULL,13),
('66666666','juan carlos davila pose','jcdp@gmail.com',NULL,NULL,12),
('77777777','elvira perez grande','elvira@gmail.com',NULL,'22222222',14),
('88888888','manuel fernandez garcia','mfg23@gmail.com',36206,null,14) ;



ALTER TABLE `alumnos`
  ADD  FOREIGN KEY (`Aula`) REFERENCES `aulas` (`Codigo`)
   ON DELETE RESTRICT ON UPDATE CASCADE;
        /*mientras un aula esté asignada a un alumno no se puede eliminar*/
ALTER TABLE `cursos_profesores`
  ADD  FOREIGN KEY (`Curso`) REFERENCES `cursos` (`Nombre`)
   ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY (`Profesor`) REFERENCES `profesores` (`DNI`)
   ON DELETE CASCADE ON UPDATE CASCADE;
   /* si se elimina un profesor o un curso ,
     se eliminan en cascada los registros de IMPARTIR curso_profesor */ 

ALTER TABLE `departamentos`
  ADD FOREIGN KEY (`director`) REFERENCES `profesores` (`DNI`)
   ON DELETE RESTRICT ON UPDATE CASCADE;
   
   /*mientras un profesor esté referenciado como director, no se puede eliminar*/

ALTER TABLE `matriculas`
  ADD  FOREIGN KEY (`Alumno`) REFERENCES `alumnos` (`DNI`)
   ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY (`Curso`) REFERENCES `cursos` (`Nombre`)
  ON DELETE RESTRICT ON UPDATE CASCADE;
    
	/* mientras exista alguna matricula para un curso registrada en la base de datos,
     	 no se podrá eliminar el curso**/

ALTER TABLE `profesores`
  ADD FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`Id_departamento`)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD FOREIGN KEY (`AdminAula`) REFERENCES `aulas` (`Codigo`)
   ON DELETE SET NULL ON UPDATE CASCADE,
  ADD FOREIGN KEY (`Supervisor`) REFERENCES `profesores` (`DNI`)
   ON DELETE SET NULL ON UPDATE CASCADE;
   
   /* si se elimina un profesor que está referenciado como supervisor de otro/otros
      las tuplas de los supervisados (las que lo referencian) quedarán sin supervisor, valor null
   */	
  /* si se elimina un aula, los profesores que la referencian porque administran el aula, dejan de administrarla,
     con valor null*/

ALTER TABLE cursos
   add foreign key (tutor) references profesores(dni)
       on delete restrict on update cascade;
/* no se puede eliminar un profesor mientras esté referenciado 	 como tutor*/  


CREATE TABLE IF NOT EXISTS `libros` (
  `titulo` varchar(100) NOT NULL,
  `editorial` varchar(50) default NULL,
  `fecha_adquisicion` date default NULL
) ENGINE=MyISAM;


INSERT INTO `libros` (`titulo`, `editorial`, `fecha_adquisicion`) VALUES
('programación avanzada java', 'McMillan', '2016-05-05'),
('redes de area local', NULL, '2016-05-05'),
('curso html avanzado', 'McMillan', NULL),
('curso de programación c++', 'rama', '2016-05-05'),
('sistema operativo UNIX', NULL, NULL),
('BASES DE DATOS NIVEL AVANZADO', 'rama', '2016-05-05'),
('PROGRAMACIÓN DE BASES DE DATOS', NULL, NULL),
('LENGUAJES DE MARCAS', NULL, NULL),
('LENGUAJES DE MARCAS NIVEL AVANZADO', NULL, NULL);




