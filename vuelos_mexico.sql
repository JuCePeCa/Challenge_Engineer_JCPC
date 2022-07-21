CREATE DATABASE vuelos_mexico;
USE vuelos_mexico;

CREATE TABLE aerolineas (
  id_aerolinea int(11) NOT NULL AUTO_INCREMENT,
  nombre_aerolinea varchar(50) NOT NULL,
  PRIMARY KEY (id_aerolinea)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO aerolineas VALUES
(1,'Volaris'),
(2,'Aeromar'),
(3,'Interjet'),
(4,'Aeromexico');

CREATE TABLE aeropuertos (
  id_aeropuerto int(11) NOT NULL AUTO_INCREMENT,
  nombre_aeropuerto varchar(25) NOT NULL,
  PRIMARY KEY (id_aeropuerto)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO aeropuertos VALUES 
(1,'Benito Juarez'),
(2,'Guanajuato'),
(3,'La Paz'),
(4,'Oaxaca');

CREATE TABLE movimientos (
  id_movimiento int(11) NOT NULL AUTO_INCREMENT,
  descripcion tinytext NOT NULL,
  PRIMARY KEY (id_movimiento)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO movimientos VALUES 
(1,'Salida'),
(2,'Llegada');

CREATE TABLE vuelos (
  id_aerolinea int(11) NOT NULL,
  id_aeropuerto int(11) NOT NULL,
  id_movimiento int(11) NOT NULL,  
  dia date NOT NULL,
  KEY id_aerolinea (id_aerolinea),
  KEY id_aeropuerto (id_aeropuerto),
  KEY id_movimiento (id_movimiento),
  CONSTRAINT vuelos_ibfk_1 FOREIGN KEY (id_aerolinea) 
  REFERENCES aerolineas (id_aerolinea) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT vuelos_ibfk_2 FOREIGN KEY (id_aeropuerto) 
  REFERENCES aeropuertos (id_aeropuerto) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT vuelos_ibfk_3 FOREIGN KEY (id_movimiento)
  REFERENCES movimientos (id_movimiento) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO vuelos VALUES 
(1,1,1,'2021-05-02'),
(2,1,1,'2021-05-02'),
(3,2,2,'2021-05-02'),
(4,3,2,'2021-05-02'),
(1,3,2,'2021-05-02'),
(2,1,1,'2021-05-02'),
(2,3,1,'2021-05-04'),
(3,4,1,'2021-05-04'),
(3,4,1,'2021-05-04');

select A.nombre_aeropuerto as Aeropuerto, count(V.id_movimiento) as Numero_de_movimientos from vuelos V join aeropuertos A on V.id_aeropuerto=A.id_aeropuerto
join movimientos M on V.id_movimiento=M.id_movimiento group by A.nombre_aeropuerto;

select A.nombre_aerolinea as Aerolinea, count(V.id_movimiento) as Numero_de_movimientos from vuelos V join aerolineas A on V.id_aerolinea=A.id_aerolinea
join movimientos M on M.id_movimiento=V.id_movimiento group by A.nombre_aerolinea;

select V.dia as Fecha, count(V.id_movimiento) as Numero_de_movimientos from vuelos V group by V.dia;
