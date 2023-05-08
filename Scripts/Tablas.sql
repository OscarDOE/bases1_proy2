-- Creando tablas independientes

CREATE TABLE tipo_producto(
	id varchar(5) not null primary key,
	descripcion varchar(20) not null
);
SELECT * FROM tipo_producto;
DROP TABLE tipo_producto;

CREATE TABLE estado(
	id int not null primary key auto_increment,
	descripcion varchar(20) not null
);
DROP TABLE estado;

CREATE TABLE cliente(
	dpi bigint not null primary key,
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	fecha_nacimiento date not null,
	correo varchar(30) not null,
	telefono int not null,
	nit int
);
DROP TABLE cliente;

CREATE TABLE puesto(
	id int not null primary key auto_increment,
	nombre varchar(30) not null,
	descripcion varchar(100) not null,
	salario float not null
);
DROP TABLE puesto;

CREATE TABLE restaurante(
	id varchar(20) not null primary key,
	direccion varchar(40) not null,
	municipio varchar(30) not null,
	zona int not null,
	telefono int not null,
	personal int not null,
	parqueo bool not null
);
DROP TABLE restaurante;

CREATE TABLE historial(
	id int not null primary key auto_increment,
	fecha date not null,
	descripcion varchar(100) not null,
	tipo varchar(20) not null
);
DROP TABLE historial;

-- Creando tablas dependientes

CREATE TABLE direccion(
	id int not null primary key auto_increment,
	direccion varchar(40) not null,
	municipio varchar(30) not null,
	zona int not null,
	dpi bigint not null,
	foreign key (dpi) references cliente(dpi)
);
DROP TABLE direccion;

CREATE TABLE producto(
	id varchar(5) not null primary key,
	descripcion varchar(40) not null,
	precio float not null,
	tipo varchar(5) not null,
	foreign key(tipo) references tipo_producto(id)
);
SELECT * FROM producto;
DROP TABLE producto;

CREATE TABLE empleado(
	id int(8) not null primary key auto_increment,
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	fecha_nacimiento date not null,
	correo varchar(30) not null,
	telefono int not null,
	direccion varchar(30) not null,
	dpi bigint not null,
	puesto int not null,
	fecha_inicio date not null,
	restaurante varchar(20) not null,
	foreign key (puesto) references puesto(id),
	foreign key (restaurante) references restaurante(id)
);
DROP TABLE empleado;

CREATE TABLE orden(
	id int not null primary key auto_increment,
	canal varchar(5) not null,
	fecha_inicio datetime not null,
	fecha_entrega datetime,
	estado int not null,
	dpi bigint not null,
	direccion_cliente int not null,
	restaurante varchar(50),
	foreign key (estado) references estado(id),
	foreign key (dpi) references cliente(dpi),
	foreign key (direccion_cliente) references direccion(id),
	foreign key (restaurante) references restaurante(id)
);

DROP TABLE orden;

CREATE TABLE producto_orden(
	id int not null primary key auto_increment,
	cantidad int not null,
	observacion varchar(100),
	orden int not null,
	producto varchar(10),
	foreign key (orden) references orden(id),
	foreign key (producto) references producto(id)
);
DROP TABLE producto_orden ;

CREATE TABLE factura(
	serie varchar(30) not null primary key,
	total float not null,
	fecha datetime not null,
	pago varchar(5) not null,
	nit varchar(20) not null,
	municipio varchar(30) not null,
	repartidor int not null,
	orden int not null,
	foreign key (orden) references orden(id)
);
DROP TABLE factura;