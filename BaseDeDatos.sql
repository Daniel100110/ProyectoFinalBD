create database SoftwareDeDefensa;
use SoftwareDeDefensa;

create table tipoEdificios(
id_tipo_edificio int primary key not null identity(1,1),
nom_tipo_edificio varchar(50),
status_tipo_edificio varchar(30)
);
create table edificios(
id_edificio int primary key not null identity(1,1),
nom_edificio varchar(50),
id_tipo_edificio int foreign key references tipoEdificios(id_tipo_edificio) on delete cascade,
status_edificio varchar(30)
);
create table secciones(
id_seccion int primary key not null identity(1,1),
nom_seccion varchar(50),
id_edificio int foreign key references edificios(id_edificio) on delete cascade,
status_seccion varchar(30)
);
create table pisos(
id_piso int primary key not null identity(1,1),
nom_piso varchar(50),
id_seccion int foreign key references secciones(id_seccion) on delete cascade,
status_piso varchar(30)
);
create table pasillos(
id_pasillo int primary key not null identity(1,1),
nom_pasillo varchar(50),
id_piso int foreign key references pisos(id_piso) on delete cascade,
status_pasillo varchar(30)
);
create table tipoHabitaciones(
id_tipo_habitacion int primary key not null identity(1,1),
nom_tipo_habitacion varchar(50),
status_tipo_habitacion varchar(30)
);
create table habitaciones(
id_habitacion int primary key not null identity(1,1),
nom_habitacion varchar(50),
id_tipo_habitacion int foreign key references tipoHabitaciones(id_tipo_habitacion) on delete cascade,
id_pasillo int foreign key references pasillos(id_pasillo) on delete cascade,
status_habitacion varchar(30)
);
create table tipo_celda(
id_tipo_celda int primary key not null identity(1,1),
nom_tipo_celda varchar(50),
status_tipo_celda varchar(30)
);
create table celdas(
id_celda int primary key not null identity(1,1),
nom_celda varchar(50),
id_tipo_celda int foreign key references tipo_celda(id_tipo_celda) on delete cascade,
id_pasillo int foreign key references pasillos(id_pasillo) on delete cascade,
status_celda varchar(30)
);
create table prisioneros(
id_prisionero int primary key not null identity(1,1),
nom_prisionero varchar(50),
no_celda int foreign key references celdas(id_celda) on delete cascade,
status_prisionero varchar(30)
);
create table personal(
id_personal int primary key not null identity(1,1),
nom_personal varchar(50),
id_habitacion int foreign key references habitaciones(id_habitacion) on delete cascade,
status_personal varchar(30)
);
create table puertasHabitaciones(
id_puertaH int primary key not null identity(1,1),
nom_puertaH varchar(50),
id_habitacion int foreign key references habitaciones(id_habitacion) on delete cascade,
status_puertaH varchar(30)
);
create table puertasCeldas(
id_puertaC int primary key not null identity(1,1),
nom_puertaC varchar(50),
id_celda int foreign key references celdas(id_celda) on delete cascade,
status_puertaC varchar(30)
);

select * from tipoEdificios;
select * from edificios;
select * from secciones;
select * from pisos;
select * from pasillos;
select * from tipoHabitaciones;
select * from habitaciones;
select * from tipo_celda;
select * from celdas;
select * from prisioneros;
select * from personal;
select * from puertasHabitaciones;
select * from puertasCeldas;

insert into tipoEdificios values('Prision','Activo');
insert into edificios values('Prisión de Tijuana',1,'Activo');
insert into secciones values('A',1,'Activo');
insert into pisos values('Piso 1',1,'Activo');
insert into pasillos values('Pasillo izquierdo',2,'Activo');
insert into tipoHabitaciones values('Administrativo','Activo');
insert into habitaciones values('Reuniones y exposiciones',1,3,'Activo');
insert into tipo_celda values('Peligroso','Activo');
insert into celdas values('A-001',1,3,'Activo');
insert into prisioneros values('Daniel Ibarra',1,'Activo');
insert into personal values('Laura Abundiz',1,'Activo');
insert into puertasHabitaciones values('Puerta_h_01_A',1,'Activo');
insert into puertasCeldas values('Puerta_c_01_A',1,'Activo');






