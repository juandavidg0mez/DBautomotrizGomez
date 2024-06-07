CREATE DATABASE IF NOT EXISTS DB_automotrizGomez;
DROP DATABASE IF EXISTS DB_automotrizGomez;
USE DB_automotrizGomez;
CREATE TABLE marcavehiculo (
    id_marca INT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE vehiculo (
    id_vehiculo VARCHAR(6) PRIMARY KEY,
    id_marca INT,
    Foreign Key (id_marca) REFERENCES marcavehiculo (id_marca)
);

CREATE TABLE cliente (
    DNI_cliente VARCHAR(16) PRIMARY KEY,
    NIT VARCHAR(16) UNIQUE,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    id_vehiculo VARCHAR(6) NOT NULL,
    Foreign Key (id_vehiculo) REFERENCES vehiculo (id_vehiculo)
);

CREATE TABLE factura (
    id_factura INT PRIMARY KEY,
    DNI_cliente VARCHAR(16) NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10,2),
    Foreign Key (DNI_cliente) REFERENCES cliente(DNI_cliente)
);

CREATE TABLE tipocargoempleado (
    id_tipo_cargo INT PRIMARY KEY,
    nombre_cargo VARCHAR(100) NOT NULL
);

CREATE TABLE empleado (
    DNI_empleado VARCHAR(16) PRIMARY KEY,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    id_tipo_cargo INT NOT NULL,
    Foreign Key (id_tipo_cargo) REFERENCES tipocargoempleado (id_tipo_cargo)
);

CREATE TABLE tipotelefono (
    id_tipo_telefono INT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE globaltelefono (
    id_telefono_global INT PRIMARY KEY,
    id_tipo_telefono INT NOT NULL,
    telefono VARCHAR(16) NOT NULL,
    Foreign Key (id_tipo_telefono) REFERENCES tipotelefono (id_tipo_telefono)
);

CREATE TABLE marcapieza (
    id_marca_pieza INT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
);

CREATE TABLE provedor (
    DNI_provedor INT(10) PRIMARY KEY,
    NIT VARCHAR(16) UNIQUE,
    nombre1 VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20),
    email VARCHAR(200) NOT NULL,
    id_marca_pieza INT NOT NULL,
    Foreign Key (id_marca_pieza) REFERENCES marcapieza (id_marca_pieza)
);

CREATE TABLE categoriarepuesto (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE repuestopieza (
    id_pieza INT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre_pieza VARCHAR(50) NOT NULL,
    Foreign Key (id_categoria) REFERENCES categoriarepuesto (id_categoria)
);

CREATE TABLE ordencompra (
    id_orden INT PRIMARY KEY,
    fecha_orden DATETIME NOT NULL,
    DNI_provedor INT(10) NOT NULL,
    DNI_empleado VARCHAR(16) NOT NULL,
    total DECIMAL(15, 2) NOT NULL,
    Foreign Key (DNI_provedor) REFERENCES provedor (DNI_provedor),
    Foreign Key (DNI_empleado) REFERENCES empleado (DNI_empleado)
);

CREATE TABLE detallecompra (
    id_detalle_orden INT PRIMARY KEY,
    id_orden INT NOT NULL,
    id_pieza INT NOT NULL,
    cantidad SMALLINT NOT NULL,
    precio DECIMAL(15, 2),
    Foreign Key (id_orden) REFERENCES ordencompra (id_orden),
    Foreign Key (id_pieza) REFERENCES repuestopieza (id_pieza)
);

CREATE TABLE historiareparacion (
    id_historia_reparacion INT PRIMARY KEY,
    id_vehiculo VARCHAR(6) NOT NULL,
    id_pieza INT NOT NULL,
    cantidad SMALLINT NOT NULL,
    fecha_ejecucion DATETIME NOT NULL,
    fecha_finalizacion DATETIME NOT NULL,
    Foreign Key (id_vehiculo) REFERENCES vehiculo (id_vehiculo),
    Foreign Key (id_pieza) REFERENCES repuestopieza (id_pieza)
);
-- Tabla de M&M entre EMPLEADO and HISTORIA_REPARACION
CREATE Table historia_empelado (
    id_historia_reparacion INT NOT NULL,
    DNI_empleado VARCHAR(16) NOT NULL,
    Foreign Key (id_historia_reparacion) REFERENCES historiareparacion (id_historia_reparacion),
    Foreign Key (DNI_empleado) REFERENCES empleado (DNI_empleado)
);

CREATE TABLE areataller (
    id_taller INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE inventario (
    id_inventario VARCHAR(10) PRIMARY KEY,
    id_pieza INT NOT NULL,
    id_marca_pieza INT NOT NULL,
    id_taller INT NOT NULL,
    stock INT NOT NULL,
    Foreign Key (id_pieza) REFERENCES repuestopieza (id_pieza),
    Foreign Key (id_marca_pieza) REFERENCES marcapieza (id_marca_pieza),
    Foreign Key (id_taller) REFERENCES areataller (id_taller)
);

CREATE TABLE tiposervicio (
    id_tipo_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(200) NOT NULL
);
CREATE TABLE servico (
    id_servicio INT PRIMARY KEY,
    id_taller INT NOT NULL,
    id_tipo_servicio INT,
    descrip TEXT NOT NULL,
    costo DECIMAL (10,2),
    Foreign Key (id_tipo_servicio) REFERENCES tiposervicio(id_tipo_servicio),
    Foreign Key (id_taller) REFERENCES areataller(id_taller)
);
CREATE TABLE servicio_reparacion(
    id_servicio_reparacion INT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_historia_reparacion INT NOT NULL,
    Foreign Key (id_servicio) REFERENCES servico(id_servicio),
    Foreign Key (id_historia_reparacion) REFERENCES historiareparacion(id_historia_reparacion)
);

CREATE TABLE DetalleFactura (
    id INT PRIMARY KEY,
    id_servicio_reparacion INT NOT NULL,
    id_factura INT,
    producto_id INT,
    cantidad INT,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
    Foreign Key (id_servicio_reparacion) REFERENCES servicio_reparacion(id_servicio_reparacion)
);

CREATE TABLE provedortelefono(
    DNI_provedor INT(10),
    id_telefono_global INT,
    Foreign Key (DNI_provedor) REFERENCES provedor(DNI_provedor),
    Foreign Key (id_telefono_global) REFERENCES globaltelefono(id_telefono_global)
);

CREATE TABLE clientetelefono(
    DNI_cliente VARCHAR(16) NOT NULL,
    id_telefono_global INT,
    Foreign Key (id_telefono_global) REFERENCES globaltelefono(id_telefono_global),
    Foreign Key (DNI_cliente) REFERENCES cliente(DNI_cliente)
);

CREATE TABLE empleadotelefono(
    DNI_empleado VARCHAR(16) NOT NULL,
    id_telefono_global INT,
    Foreign Key (id_telefono_global) REFERENCES globaltelefono(id_telefono_global),
    Foreign Key (DNI_empleado) REFERENCES empleado(DNI_empleado)
);

SHOW TABLEs;