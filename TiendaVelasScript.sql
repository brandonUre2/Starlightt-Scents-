drop schema if exists tiendavelas;
drop user if exists Admin_velas;

CREATE SCHEMA tiendavelas;

create user 'Admin_velas'@'%' identified by 'Adm1n_clave.';

grant all privileges on tiendavelas.* to 'Admin_velas'@'%';
flush privileges;

create table tiendavelas.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  imagen_url VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table tiendavelas.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio DOUBLE,
  existencias INT,  
  imagen_url VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_categoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendavelas.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  imagen_url VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table tiendavelas.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha DATE,  
  total DOUBLE,
  estado INT,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table tiendavelas.pedido (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio DOUBLE, 
  cantidad INT,
  PRIMARY KEY (id_pedido),
  foreign key fk_pedidos_factura (id_factura) references factura(id_factura),
  foreign key fk_pedidos_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendavelas.proveedor (
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  direccion VARCHAR(40) NULL,
  imagen_url VARCHAR(1024),
  activo BOOLEAN,
  productos_proveedor INT,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


create table tiendavelas.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20),
  id_usuario INT,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO tiendavelas.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,imagen_url,activo) VALUES 
(1,'andres','  ','Andres', 'Daniel Hernandez',    'adaniel@gmail.com',    '9472-8263', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Ffotos%2Fhombre&psig=AOvVaw0BZUUXu4E5dkKv4EhSMA4Q&ust=1710099012561000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjW8rL154QDFQAAAAAdAAAAABAE',true),
(2,'isabella',' ','Isabella',  'García Rodríguez', 'isagarcia@gmail.com', '39472-2930','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fes%2Ffotos%2Fhombre-25-a%25C3%25B1os&psig=AOvVaw0BZUUXu4E5dkKv4EhSMA4Q&ust=1710099012561000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjW8rL154QDFQAAAAAdAAAAABAJ',true);

insert into tiendavelas.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_USER',3), (3,'ROLE_ADMIN',1);




