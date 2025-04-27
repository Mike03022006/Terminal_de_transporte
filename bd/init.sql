CREATE DATABASE IF NOT EXISTS terminal;
USE terminal;

CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Insertar Roles
INSERT INTO roles (nombre) VALUES
('Administrador');

CREATE TABLE IF NOT EXISTS usuarios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE
);

INSERT INTO usuarios (id, nombre, apellido, correo, contrasena, rol_id)
VALUES (123456789,'admin', '1', 'admin@mail.com', '$2b$04$mD24Disnzu4B7NDf2Od.OOcByVQspVfNT3qDAnvaPFsbdeleYJq6u', 1);

CREATE TABLE IF NOT EXISTS Departamentos (
    id_departamento INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Ciudades (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE IF NOT EXISTS Sedes (
    id_sede INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Modulos (
    id_modulo INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_sede INT,
    FOREIGN KEY (id_sede) REFERENCES Sedes(id_sede)
);

CREATE TABLE IF NOT EXISTS Tipo_empresa (
    id_tipo_empresa INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Empresas (
    id_empresa INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Telefono VARCHAR(50),
    Correo VARCHAR(255),
    Direccion VARCHAR(255),
    id_tipo_empresa INT,
    FOREIGN KEY (id_tipo_empresa) REFERENCES Tipo_empresa(id_tipo_empresa)
);

CREATE TABLE IF NOT EXISTS Destinos (
    id_destino INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_modulo INT,
    id_ciudad_origen INT,
    id_ciudad_destino INT,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Tipo_empleado (
    id_tipo_empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Empleados (
    cedula_empleado INT PRIMARY KEY,
    Nombres VARCHAR(255),
    Apellidos VARCHAR(255),
    Telefono VARCHAR(50),
    Correo VARCHAR(255),
    id_ciudad_origen INT,
    id_ciudad_residencia INT,
    id_tipo_empleado INT,
    id_sede INT,
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_residencia) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_tipo_empleado) REFERENCES Tipo_empleado(id_tipo_empleado),
    FOREIGN KEY (id_sede) REFERENCES Sedes(id_sede)
);

CREATE TABLE IF NOT EXISTS Tipo_bus (
    id_tipo_bus INT AUTO_INCREMENT PRIMARY KEY ,
    Nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Buses (
    Placa VARCHAR(50) PRIMARY KEY,
    Marca VARCHAR(255),
    Capacidad INT,
    id_tipo_bus INT,
    id_empresa INT,
    id_empleado INT,
    FOREIGN KEY (id_tipo_bus) REFERENCES Tipo_bus(id_tipo_bus),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(cedula_empleado)
);

CREATE TABLE IF NOT EXISTS Paradas_intermedias (
    id_parada INT PRIMARY KEY,
    Nombre_parada VARCHAR(255),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Rutas (
    id_ruta INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_paradas_intermedias INT,
    FOREIGN KEY (id_paradas_intermedias) REFERENCES Paradas_intermedias(id_parada)
);

CREATE TABLE IF NOT EXISTS Detalle_Destinos_Rutas (
    id_destino INT,
    id_ruta INT,
    PRIMARY KEY (id_destino, id_ruta),
    FOREIGN KEY (id_destino) REFERENCES Destinos(id_destino),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE IF NOT EXISTS Detalle_Buses_Rutas (
    id_bus VARCHAR(50),
    id_ruta INT,
    PRIMARY KEY (id_bus, id_ruta),
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE IF NOT EXISTS Tipo_cliente (
    id_tipo_cliente INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT PRIMARY KEY,
    Nombres VARCHAR(255),
    Apellidos VARCHAR(255),
    Telefono VARCHAR(50),
    Correo VARCHAR(255),
    id_tipo_cliente INT,
    id_ciudad_origen INT,
    id_ciudad_residencia INT,
    FOREIGN KEY (id_tipo_cliente) REFERENCES Tipo_cliente(id_tipo_cliente),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_residencia) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Tipo_mantenimiento (
    id_tipo_mantenimiento INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Mantenimientos (
    id_mantenimiento INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Fecha_mantenimiento DATE,
    id_tipo_mantenimiento INT,
    id_bus VARCHAR(50),
    FOREIGN KEY (id_tipo_mantenimiento) REFERENCES Tipo_mantenimiento(id_tipo_mantenimiento),
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa)
);

CREATE TABLE IF NOT EXISTS Metodo_pago (
    id_metodo_pago INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Viajes (
    id_viaje INT PRIMARY KEY,
    Fecha_salida DATETIME,
    Valor DECIMAL(10, 2),
    id_bus VARCHAR(50),
    id_conductor INT,
    id_ruta INT,
    id_ciudad_origen INT,
    id_ciudad_destino INT,
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa),
    FOREIGN KEY (id_conductor) REFERENCES Empleados(cedula_empleado),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Boletos (
    id_boleto INT AUTO_INCREMENT PRIMARY KEY,
    Numero_asiento INT,
    id_destino INT,
    id_empresa INT,
    id_bus VARCHAR(50),
    id_ruta INT,
    FOREIGN KEY (id_destino) REFERENCES Destinos(id_destino),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE IF NOT EXISTS Equipaje (
    id_equipaje INT PRIMARY KEY,
    peso DECIMAL(10, 2),
    descripcion VARCHAR(255),
    id_cliente INT,
    id_boleto INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto)
);

CREATE TABLE IF NOT EXISTS Tipo_mercancia (
    id_tipo_mercancia INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);
CREATE TABLE IF NOT EXISTS Mercancia (
    id_mercancia INT PRIMARY KEY,
    descripcion VARCHAR(255),
    peso DECIMAL(10,2),
    valor_estimado DECIMAL(10,2),
    id_tipo_mercancia INT,
    id_cliente INT,
    id_viaje INT,
    id_boleto INT,
    FOREIGN KEY (id_tipo_mercancia) REFERENCES Tipo_mercancia(id_tipo_mercancia),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_viaje) REFERENCES Viajes(id_viaje),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto)
);
CREATE TABLE IF NOT EXISTS Envio(
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    peso DECIMAL(10,2),
    id_cliente INT,
    id_ciudad_origen INT,
    id_ciudad_destino INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE IF NOT EXISTS Checkout(
    id_checkout INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    id_metodo_pago INT,
    FOREIGN KEY (id_envio) REFERENCES Envio(id_envio),
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago)
);
CREATE TABLE IF NOT EXISTS Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_facturacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Valor_total DECIMAL(10, 2),
    lleva_mercancia BOOLEAN, 
    id_cliente INT,
    id_empleado INT,
    id_boleto INT,
    id_equipaje INT NULL,
    id_viaje INT,
    id_metodo_pago INT,
    id_seguro INT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(cedula_empleado),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto),
    FOREIGN KEY (id_equipaje) REFERENCES Equipaje(id_equipaje),
    FOREIGN KEY (id_viaje) REFERENCES Viajes(id_viaje),
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago)
);