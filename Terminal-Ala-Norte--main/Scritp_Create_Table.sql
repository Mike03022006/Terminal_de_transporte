CREATE DATABASE TERMINALNORTE;
USE TERMINALNORTE;
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Ciudades (
    id_ciudad INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Sedes (
    id_sede INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE Modulos (
    id_modulo INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_sede INT,
    FOREIGN KEY (id_sede) REFERENCES Sedes(id_sede)
);

CREATE TABLE Tipo_empresa (
    id_tipo_empresa INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE Empresas (
    id_empresa INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Telefono VARCHAR(50),
    Correo VARCHAR(255),
    Direccion VARCHAR(255),
    id_tipo_empresa INT,
    FOREIGN KEY (id_tipo_empresa) REFERENCES Tipo_empresa(id_tipo_empresa)
);

CREATE TABLE Destinos (
    id_destino INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_modulo INT,
    id_ciudad_origen INT,
    id_ciudad_destino INT,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE Tipo_empleado (
    id_tipo_empleado INT PRIMARY KEY,
    Nombre VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE Empleados (
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

CREATE TABLE Tipo_bus (
    id_tipo_bus INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Buses (
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

CREATE TABLE Paradas_intermedias (
    id_parada INT PRIMARY KEY,
    Nombre_parada VARCHAR(255),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE Rutas (
    id_ruta INT PRIMARY KEY,
    Nombre VARCHAR(255),
    id_paradas_intermedias INT,
    FOREIGN KEY (id_paradas_intermedias) REFERENCES Paradas_intermedias(id_parada)
);

CREATE TABLE Detalle_Destinos_Rutas (
    id_destino INT,
    id_ruta INT,
    PRIMARY KEY (id_destino, id_ruta),
    FOREIGN KEY (id_destino) REFERENCES Destinos(id_destino),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE Detalle_Buses_Rutas (
    id_bus VARCHAR(50),
    id_ruta INT,
    PRIMARY KEY (id_bus, id_ruta),
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE Tipo_cliente (
    id_tipo_cliente INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE Cliente (
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

CREATE TABLE Tipo_mantenimiento (
    id_tipo_mantenimiento INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE Mantenimientos (
    id_mantenimiento INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Fecha_mantenimiento DATE,
    id_tipo_mantenimiento INT,
    id_bus VARCHAR(50),
    FOREIGN KEY (id_tipo_mantenimiento) REFERENCES Tipo_mantenimiento(id_tipo_mantenimiento),
    FOREIGN KEY (id_bus) REFERENCES Buses(Placa)
);

CREATE TABLE Metodo_pago (
    id_metodo_pago INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Seguro (
    id_seguro INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(255),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE Viajes (
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

CREATE TABLE Boletos (
    id_boleto INT PRIMARY KEY,
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

CREATE TABLE Equipaje (
    id_equipaje INT PRIMARY KEY,
    peso DECIMAL(10, 2),
    descripcion VARCHAR(255),
    id_cliente INT,
    id_boleto INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto)
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    Fecha_facturacion DATE,
    Valor_total DECIMAL(10, 2),
    id_cliente INT,
    id_empleado INT,
    id_boleto INT,
    id_seguro INT,
    id_equipaje INT,
    id_viaje INT,
    id_metodo_pago INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(cedula_empleado),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto),
    FOREIGN KEY (id_seguro) REFERENCES Seguro(id_seguro),
    FOREIGN KEY (id_equipaje) REFERENCES Equipaje(id_equipaje),
    FOREIGN KEY (id_viaje) REFERENCES Viajes(id_viaje),
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago)
);

CREATE TABLE Tipo_mercancia (
    id_tipo_mercancia INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);
CREATE TABLE Mercancia (
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


