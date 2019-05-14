create database SoftwareDeDefensas;
use SoftwareDeDefensa;

create table prisiones(
id_prision int primary key not null identity(1,1),
nom_prision varchar(50),
status_prision varchar(30)
);
create table tipoEdificios(
id_tipo_edificio int primary key not null identity(1,1),
nom_tipo_edificio varchar(50),
status_tipo_edificio varchar(30)
);
create table edificios(
id_edificio int primary key not null identity(1,1),
nom_edificio varchar(50),
id_tipo_edificio int foreign key references tipoEdificios(id_tipo_edificio) on delete cascade,
id_prision int foreign key references prisiones(id_prision),
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
create table tipoCelda(
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

create table historialSistema (
id_historial int primary key not null identity(1,1),
accion varchar(50) not null,
descripcion varchar(50) not null,
usuario varchar(50) not null,
fecha datetime
)

/*prisiones*/
create trigger insertTriggerPrisioneses on prisiones after insert as insert into historialSistema values ('Insert', 'Se guardo un registro en prisiones',suser_name(), sysdatetime())
create trigger updateTriggerPrisiones on prisiones after update as insert into historialSistema values ('Update', 'Se actualizo un registro en prisiones',suser_name(), sysdatetime())
create trigger deleteTriggerPrisiones on prisiones after delete as insert into historialSistema values ('Delete', 'Se borro un registro en prisiones',suser_name(), sysdatetime())

/*tipoEdificios*/
create trigger insertTriggerTipoEdificios on tipoEdificios after insert as insert into historialSistema values ('Insert', 'Se guardo un registro en tipoEdificios',suser_name(), sysdatetime())
create trigger updateTriggerTipoEdificios on tipoEdificios after update as insert into historialSistema values ('Update', 'Se actualizo un registro en tipoEdificios',suser_name(), sysdatetime())
create trigger deleteTriggerTipoEdificioson on tipoEdificios after delete as insert into historialSistema values ('Delete', 'Se borro un registro en tipoEdificios',suser_name(), sysdatetime())

/*edificios*/
create trigger insertTriggerEdificios on edificios after insert as insert into historialSistema values ('Insert', 'Se guardo un registro en edificios',suser_name(), sysdatetime())
create trigger updateTriggerEdificios on edificios after update as insert into historialSistema values ('Update', 'Se actualizo un registro en edificios',suser_name(), sysdatetime())
create trigger deleteTriggerEdificioson on edificios after delete as insert into historialSistema values ('Delete', 'Se borro un registro en edificios',suser_name(), sysdatetime())

/*secciones*/
create trigger insertTriggerSecciones on secciones after insert as insert into historialSistema values ('Insert', 'Se guardo un registro en secciones',suser_name(), sysdatetime())
create trigger updateTriggerSecciones on secciones after update as insert into historialSistema values ('Update', 'Se actualizo un registro en secciones',suser_name(), sysdatetime())
create trigger deleteTriggerSecciones on secciones after delete as insert into historialSistema values ('Delete', 'Se borro un registro en secciones',suser_name(), sysdatetime())

/*pisos*/
/*pasillos*/
/*tipoHabitaciones*/
/*habitaciones*/
/*tipoCelda*/
/*celdas*/
/*prisioneros*/
/*personal*/
/*puertasHabitaciones*/
/*puertasCeldas*/

/*---*/
create trigger createTableTrigger on database for create_table as begin insert into historialSistema values ('create_table', 'Se creo una tabla',SUSER_NAME(), SYSDATETIME()) end
create trigger dropTableTrigger on database for create_table as begin insert into historialSistema values ('drop_table', 'Se borro una tabla',SUSER_NAME(), SYSDATETIME()) end
create trigger createIndexTrigger on database for create_table as begin insert into historialSistema values ('create_index', 'Se creo un indice en una tabla',SUSER_NAME(), SYSDATETIME()) end
create trigger alterIndexTrigger on database for create_table as begin insert into historialSistema values ('alter_index', 'Se cambio un indice en una tabla',SUSER_NAME(), SYSDATETIME()) end
create trigger dropIndexTrigger on database for create_table as begin insert into historialSistema values ('drop_index', 'Se borro un indice en una tabla',SUSER_NAME(), SYSDATETIME()) end





