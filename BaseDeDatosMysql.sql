create database SoftwareDeDefensa;
use SoftwareDeDefensa;

create table tipoEdificios(
id_tipo_edificio int not null,
nom_tipo_edificio varchar(50),
status_tipo_edificio varchar(30),
PRIMARY KEY (id_tipo_edificio)
);
create table edificios(
id_edificio int not null,
nom_edificio varchar(50),
id_tipo_edificio int,
status_edificio varchar(30),
PRIMARY KEY (id_edificio),
FOREIGN KEY (id_tipo_edificio) REFERENCES tipoEdificios(id_tipo_edificio)
);
create table secciones(
id_seccion int not null,
nom_seccion varchar(50),
id_edificio int,
status_seccion varchar(30),
PRIMARY KEY (id_seccion),
FOREIGN KEY (id_edificio) REFERENCES Edificios(id_edificio)
);
create table pisos(
id_piso int not null,
nom_piso varchar(50),
id_seccion int,
status_piso varchar(30),
PRIMARY KEY (id_piso),
FOREIGN KEY (id_seccion) REFERENCES secciones(id_seccion)
);
create table pasillos(
id_pasillo int  not null,
nom_pasillo varchar(50),
id_piso int,
status_pasillo varchar(30),
PRIMARY KEY (id_pasillo),
FOREIGN KEY (id_piso) REFERENCES pisos(id_piso)
);
create table tipoHabitaciones(
id_tipo_habitacion int not null,
nom_tipo_habitacion varchar(50),
status_tipo_habitacion varchar(30),
PRIMARY KEY (id_tipo_habitacion)
);
create table habitaciones(
id_habitacion int not null,
nom_habitacion varchar(50),
id_tipo_habitacion int,
id_pasillo int,
status_habitacion varchar(30),
PRIMARY KEY (id_habitacion),
FOREIGN KEY (id_tipo_habitacion) REFERENCES tipoHabitaciones(id_tipo_Habitacion),
FOREIGN KEY (id_pasillo) REFERENCES pasillos(id_pasillo)
);
create table tipoCelda(
id_tipo_celda int not null,
nom_tipo_celda varchar(50),
status_tipo_celda varchar(30),
PRIMARY KEY (id_tipo_celda)
);
create table celdas(
id_celda int not null,
nom_celda varchar(50),
id_tipo_celda int,
id_pasillo int,
status_celda varchar(30),
PRIMARY KEY (id_celda),
FOREIGN KEY (id_tipo_celda) REFERENCES tipoCelda(id_tipo_celda),
FOREIGN KEY (id_pasillo) REFERENCES pasillos(id_pasillo)
);
create table prisioneros(
id_prisionero int not null,
nom_prisionero varchar(50),
id_celda int,
status_prisionero varchar(30),
PRIMARY KEY (id_prisionero),
FOREIGN KEY (id_celda) REFERENCES celdas(id_celda)
);
create table personal(
id_personal int not null,
nom_personal varchar(50),
id_habitacion int,
status_personal varchar(30),
PRIMARY KEY (id_personal),
FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);
create table puertasHabitaciones(
id_puertaH int not null,
nom_puertaH varchar(50),
id_habitacion int,
status_puertaH varchar(30),
PRIMARY KEY (id_puertaH),
FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);
create table puertasCeldas(
id_puertaC int not null,
nom_puertaC varchar(50),
id_celda int,
status_puertaC varchar(30),
PRIMARY KEY (id_puertaC),
FOREIGN KEY (id_celda) REFERENCES celdas(id_celda)
);
create table historialSistema (
id_historial int not null,
accion varchar(50) not null,
descripcion varchar(50) not null,
usuario varchar(50) not null,
fecha datetime,
PRIMARY KEY (id_historial)
);




