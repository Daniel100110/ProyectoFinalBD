  create table accesos(
    no_acceso int primary key not null,
    tipo_acceso varchar(35),
    status_acceso varchar(30)
   );
    
    create table cuentas(
    no_cuenta int primary key not null,
    nom_usuario varchar(50),
    apll_paterno varchar(35),
    apll_materno varchar(35),
    tel_usuario varchar(30),
    dir_usuario varchar(75),
    correo_cuenta varchar(55),
    contra_cuenta varchar(55),
    no_acceso int not null,
    foreign key (no_acceso) references accesos(no_acceso),
    status_cuenta varchar(30)
  );

    create table materiales(
    no_material int primary key not null,
    nom_material varchar(50),
    cant_material INT,
    status_material varchar(30)
  );

  create table arreglos(
    no_arreglo int primary key not null,
    nom_arreglo varchar(50),
    status_arreglo varchar(30)
  );

  create table materiales_arreglos(
    no_lista int primary key not null,
    no_material int not null,
    cant_material int,
    no_arreglo int not null,
    foreign key (no_material) references materiales(no_material),
    foreign key (no_arreglo) references arreglos(no_arreglo)
  );

  create table transporte(
    no_transporte int primary key not null,
    capacidad_num_personas int,
    velocidad int,
    no_cuenta int,
    foreign key(no_cuenta) references cuentas(no_cuenta),
    status_transporte varchar(30)
  );

  CREATE TABLE pedido(
    no_pedido int primary key not null,
    no_distribuidor int,
    no_cliente int,
    cantidad int,
    precio varchar(25),
    fecha_pedido DATE,
    fecha_entrega DATE,
    foreign key(no_distribuidor) references cuentas(no_cuenta),
    foreign key(no_cliente) references cuentas(no_cuenta),
    status_pedido VARCHAR(25)
  );



