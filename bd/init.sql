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
    deleted_at DATETIME DEFAULT NULL,
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
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
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

CREATE TABLE IF NOT EXISTS Envios(
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_remitente INT, 
    id_destinatario INT, 
    peso DECIMAL(10,2),
    id_cliente INT,
    id_ciudad_origen INT,
    id_ciudad_destino INT,
    FOREIGN KEY (id_remitente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_destinatario) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_ciudad_origen) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES Ciudades(id_ciudad)
);


CREATE TABLE IF NOT EXISTS Checkout(
    id_checkout INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,     
    id_metodo_pago INT,
    FOREIGN KEY (id_envio) REFERENCES Envios(id_envio),
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago)
);

INSERT INTO Departamentos (id_departamento,Nombre) VALUES
(001,'Atlantico'),
(002,'Bolivar'),
(003,'Magdalena'),
(004,'Guajira'),
(005,'Cesar'),
(006,'Cordoba'),
(007,'Sucre'),
(008,'Antioquia'),
(009,'Casanare'),
(0010,'Arauca'),
(0011,'Boyacá'),
(0012,'Cundinamarca'),
(0013,'Meta'),
(0014,'Norte de Santander'),
(0015, 'Bolivar'),
(0016, 'Caqueta'),
(0017, 'Cordoba'),
(0018, 'Huila'),
(0019, 'Magdalena'),
(0020, 'Putumayo'),
(0021, 'Tolima'),
(0022, 'Cundinamarca'),
(0023, 'Quindío'),
(0024, 'Risaralda'),
(0025, 'Valle del Cauca'),
(0026, 'Cauca'),
(0027, 'Valle del Cauca'),
(0028, 'Cauca'),
(0029, 'Nariño'),
(0030, 'Chocó'),
(0031, 'Risaralda'),
(0032, 'Quindío'),
(0033, 'Caldas'),
(0034, 'Putumayo');

INSERT INTO Ciudades (id_ciudad,Nombre,id_departamento) VALUES
(001,'Cartagena',002),
(002,'Caucacia',008),
(003,'Montería',006),
(004,'Apartadó',008),
(005,'Santa Marta',003),
(006,'Medellín',008),
(007,'Valledupar',005),
(008,'Rionegro',008),
(009,'Sincelejo',007),
(0010,'Santa Rosa de Osos',008),
(0011,'San Juan del Cesar',003),
(0012,'Envigado',008),
(0013,'Ciénaga',003),
(0014,'Barranquilla',001),
(0015,'Guatape',008),
(0016,'Maicao',004),
(0017,'El peñol',008),
(0018,'Uribia',004),
(0019,'Caramanta',008),
(0020,'Aracataca',003),
(0021,'Briceño',008),
(0022,'San Juan del Cesar',003),
(0023,'Riohacha',004),
(0024,'El banco',003),
(0025,'Fundación',003),
(0026,'Puerto Berrio',008),
(0027,'Marinilla',008),
(0028,'Santa Catalina',002),
(0029,'Turbaco',002),
(0030,'San Marcos',007),
(0031, 'San Luis De Gaceno', 009), -- Casanare
(0032, 'Yopal', 009),             -- Casanare
(0033, 'Sacama', 009),            -- Casanare
(0034, 'Hato Corozal', 009),      -- Casanare
(0035, 'Pore', 009),              -- Casanare
(0036, 'Paz De Ariporo', 009),    -- Casanare
(0037, 'Aguazul', 009),           -- Casanare
(0038, 'Monterrey', 009),         -- Casanare
(0039, 'Villa Nueva', 009),       -- Casanare
(0040, 'Tauramena', 009),         -- Casanare
(0041, 'Saravena', 010),          -- Arauca
(0042, 'Arauca', 010),            -- Arauca
(0043, 'Arauquita', 010),         -- Arauca
(0044, 'Panama', 010),            -- Arauca
(0045, 'Fortul', 010),            -- Arauca
(0046, 'Tame', 010),              -- Arauca
(0047, 'Granada', 013),           -- Meta
(0048, 'Villavicencio', 013),     -- Meta
(0049, 'Lejanías', 013),          -- Meta
(0050, 'Acacías', 013),           -- Meta
(0051, 'Mesetas', 013),           -- Meta
(0052, 'Guamal', 013),            -- Meta
(0053, 'La Florida', 012),        -- Cundinamarca
(0054, 'La Calera', 012),         -- Cundinamarca
(0055, 'San Bernardo', 012),      -- Cundinamarca
(0056, 'La Cabrera', 012),        -- Cundinamarca
(0057, 'Soacha', 012),            -- Cundinamarca
(0058, 'Yacopí', 012),            -- Cundinamarca
(0059, 'La Botica', 012),         -- Cundinamarca
(0060, 'Mesitas del Colegio', 012), -- Cundinamarca
(0061, 'San Antonio', 012),       -- Cundinamarca
(0062, 'San Juan del Sumapaz', 012), -- Cundinamarca
(0063, 'Pacho', 012),             -- Cundinamarca
(0064, 'San Juan', 012),          -- Cundinamarca
(0065, 'San Gabriel', 012),       -- Cundinamarca
(0066, 'Arbeláez', 012),          -- Cundinamarca
(0067, 'Vianí', 012),             -- Cundinamarca
(0068, 'Viotá', 012),             -- Cundinamarca
(0069, 'San Mateo', 011),         -- Boyacá
(0070, 'Duitama', 011),           -- Boyacá
(0071, 'Jenesano', 011),          -- Boyacá
(0072, 'Moniquira', 011),         -- Boyacá
(0073, 'Samaca', 011),            -- Boyacá
(0074, 'Santana', 011),           -- Boyacá
(0075, 'Saboya', 011),            -- Boyacá
(0076, 'Guican', 011),            -- Boyacá
(0077, 'Raquira', 011),           -- Boyacá
(0078, 'Ramiriqui', 011),         -- Boyacá
(0079, 'Guateque', 011),          -- Boyacá
(0080, 'Puerto Boyaca', 011),     -- Boyacá
(0081, 'Cocuy', 011),             -- Boyacá
(0082, 'Pauna', 011),             -- Boyacá
(0083, 'Guacamayas', 011),        -- Boyacá
(0084, 'Paipa', 011),             -- Boyacá
(0085, 'Boavita', 011),           -- Boyacá
(0086, 'Chiscas', 011),           -- Boyacá
(0087, 'Chiquinquira', 011),      -- Boyacá
(0088, 'Garagoa', 011),           -- Boyacá
(0089, 'Muzo', 011),              -- Boyacá
(0090, 'Miraflores', 011),        -- Boyacá
(0091, 'Cerinza', 011),           -- Boyacá
(0092, 'Tibana', 011),            -- Boyacá
(0093, 'Pamplona', 014),          -- Norte de Santander
(0094, 'Ocaña', 014),             -- Norte de Santander
(0095, 'Cerrito', 014),           -- Norte de Santander
(0096, 'Chitaga', 014),           -- Norte de Santander
(0097, 'La Playa', 014),          -- Norte de Santander
(0098, 'Cúcuta', 014),            -- Norte de Santander
(0099, 'Presidente', 014),        -- Norte de Santander
(0100, 'Florencia', 016),         -- Caqueta
(0101, 'Neiva', 018),             -- Huila
(0102, 'Pitalito', 018),          -- Huila
(0103, 'Mocoa', 020),             -- Putumayo
(0104, 'Ibagué', 021),            -- Tolima
(0105, 'Melgar', 021),            -- Tolima
(0106, 'Bogotá', 012),            -- Cundinamarca
(0107, 'Armenia', 023),           -- Quindío
(0108, 'Alpujarra', 021),         -- Tolima
(0109, 'Agua de Dios', 012),       -- Cundinamarca
(0110, 'Pereira', 024),           -- Risaralda
(0111, 'Girardot', 012),          -- Cundinamarca
(0112, 'Cali', 025),              -- Valle del Cauca
(0113, 'Fusagasugá', 012),        -- Cundinamarca
(0114, 'Popayán', 026),           -- Cauca
(0115, 'Cali', 025),              -- Valle del Cauca
(0116, 'Popayán', 026),           -- Cauca
(0117, 'Pasto', 029),             -- Nariño
(0118, 'Quibdó', 030),            -- Chocó
(0119, 'Pereira', 031),           -- Risaralda
(0120, 'Armenia', 032),           -- Quindío
(0121, 'Manizales', 033),         -- Caldas
(0122, 'Mocoa', 034),             -- Putumayo
(0123, 'Buenaventura', 025),      -- Valle del Cauca
(0124, 'Ipiales', 029),           -- Nariño
(0125, 'Tuluá', 025),             -- Valle del Cauca
(0126, 'Palmira', 025),           -- Valle del Cauca
(0127, 'Santuario', 024),         -- Risaralda
(0128, 'La Virginia', 024),       -- Risaralda
(0129, 'Silvia', 026),            -- Cauca
(0130, 'Tumaco', 029),            -- Nariño
(0131, 'Guapi', 026),             -- Cauca
(0132, 'Cartago', 025),           -- Valle del Cauca
(0133, 'Istmina', 030),          -- Chocó
(134, 'Buga', 025),
(135, 'Jamundí', 025),
(136, 'Montenegro', 023),
(137, 'Dosquebradas', 024),
(138, 'Roldanillo', 025),
(139, 'Yumbo', 025),
(140, 'Zarzal', 025),
(141, 'Sevilla', 025),
(142, 'Calarcá', 023),
(143, 'Santander de Quilichao', 026),
(144, 'Villa Rica', 026),
(145, 'El Bordo', 026),
(146, 'La Plata', 018),
(147, 'Toribío', 026);

INSERT INTO Sedes (id_sede, Nombre, Direccion, id_ciudad) VALUES
(001,'Terminal de Transporte Cartagena','Tv. 57 #24-236, Cartagena de Indias',001),
(002,'Tetracauca S.A.','Cl. 4a #Nº 20 - 173',002),
(003,'Terminal de transportes Monteria','Cl. 41 #15-20, Montería, Córdoba',003),
(004,'Terminal de Transporte de Apartadó','102-104 con Calle 92',004),
(005,'Terminal de Transportes de Santa Marta','Cl. 41 #31-17, Troncal del caribe',005),
(006,'Terminales de Transportes Medellín - Norte','Cra. 64c #78, Oleoducto',006),
(007,'Terminal de Transportes Valledupar','Carrera 7a Numero 44-156 Local 101',007),
(008,'Terminal Rionegro','Carrera 50 - calle 56',008),
(009,'Terminal de Transporte Sincelejo','Calle 38 #26-14',009),
(0010,'Terminal de Transporte de Santa Rosa de Osos','Calle 31 N° 30 - 10 Parque municipal',010),
(0011,'Expreso Brasilia S.A','Calle 7 No 10 - 28 Local 1',011),
(0012,'SOTRAMES S.A Terminal Las Casitas','Carrera 43A 63 S-35',012),
(0013,'Copetran Cienaga-Magdalena','Cl. 20 #21-80 ',013),
(0014,'Terminal Metropolitana de Transportes de Barranquilla S.A','Cra. 14 #54-186',014),
(0015,'Bus Terminal','Cra. 30 #311',015),
(0016,'Terminal De Transporte Maicao','Cl. 16 #10- 27',016),
(0017,'Empresa De Transporte Sotra Peñol','Cra. 17 #734',017),
(0018,'Terminal de transportes de Uribia','Cl. 4ª #5, Uribia',018),
(0019,'Terminal de Transporte VALPARAISO CARAMANTA','Carrera 65 8 B 91 Taq. 5',019),
(0020,'Terminal Berlinave','Cl 3A #1-74',020),
(0021,'Terminal de transportes Medellin','Cra. 64c #78 ',006), -- Corregido a id_ciudad de Medellín
(0022,'Terminal de San Juan Nepomuceno','Diagonal 17 #17 07',0022),
(0023,'Terminal de Riohacha','A 11-129, Cl. 15 #11-1',023),
(0024,'Paradero Bastilla','Carrera 19 # 9a – 37',024),
(0025,'Taquillas Media Luna-Piñuelas','Carrera 3 # 17-27 of. 208 ',025),
(0026,'Terminal de Transporte Puerto Berrio',' Carrera 4 # 48-59',026),
(0027,'Paradero Parque principal marinilla','Cra 64A #78-210 a 78-286',027),
(0028,'Paradero Variante Cartagena Camino de Campaña','Glorieta de El Pozón',001), -- Corregido a id_ciudad de Cartagena
(0029,'Parada Turbaco-Centro','sistema portuario del distrito de turbaco',029),
(0030,'Terminal de transporte Torcoroma','Cl. 21 San Marcos Sucre Colombia',030),
(0031,  'SALITRE',  'Direccion Salitre',0106), -- Corregido a id_ciudad de Bogotá
(0032,  'NORTE',  'Direccion Norte',0106),  -- Corregido a id_ciudad de Bogotá
(0033, 'SUR', 'Cl. 57n Bis Sur #75f-32 Bogotá Colombia', 0106), -- Corregido a id_ciudad de Bogotá
(034,'Terminal Cali Sur','Carrera 23 #10-55',0112), -- Corregido a id_ciudad de Cali
(035,'Terminal Popayán Norte','Calle 12 #4-78',0114), -- Corregido a id_ciudad de Popayán
(036,'Estación Central Pasto','Avenida Colombia #15-10',0117), -- Corregido a id_ciudad de Pasto
(037,'Punto de Atención Quibdó','Calle 20 #8-12',0118), -- Corregido a id_ciudad de Quibdó
(038,'Centro Logístico Pereira','Carrera 7 #45-30',0110), -- Corregido a id_ciudad de Pereira
(039,'Terminal Armenia Sur','Diagonal 18 #27-50',0107), -- Corregido a id_ciudad de Armenia
(040,'Estación Manizales','Carrera 25 #15-15',0121), -- Corregido a id_ciudad de Manizales
(041,'Sucursal Mocoa Centro','Calle 3 #2-20',0103), -- Corregido a id_ciudad de Mocoa
(042, 'Terminal Buenaventura', 'Carrera 1 #15-23', 0123), -- Corregido a id_ciudad de Buenaventura
(043, 'Sucursal Cartago', 'Calle 8 #10-45', 0132), -- Corregido a id_ciudad de Cartago
(044, 'Estación Tuluá', 'Carrera 18 #25-14', 0125), -- Corregido a id_ciudad de Tuluá
(045, 'Punto de Atención Buga', 'Calle 6 #9-20', 134),
(046, 'Terminal Jamundí', 'Carrera 3 #17-60', 135),
(047, 'Sucursal Ipiales', 'Calle 10 #8-25', 0124), -- Corregido a id_ciudad de Ipiales
(048, 'Estación Palmira', 'Carrera 14 #11-40', 0126), -- Corregido a id_ciudad de Palmira
(049, 'Sucursal La Virginia', 'Calle 7 #6-38', 0128), -- Corregido a id_ciudad de La Virginia
(050, 'Terminal Montenegro', 'Carrera 5 #4-22', 136),
(051, 'Sucursal Dosquebradas', 'Avenida del Ferrocarril #45-55', 137),
(052, 'Punto de Atención Roldanillo', 'Calle 2 #3-10', 138),
(053, 'Sucursal Yumbo', 'Carrera 7 #15-60', 139),
(054, 'Terminal Zarzal', 'Calle 18 #6-24', 140),
(055, 'Sucursal Sevilla', 'Carrera 20 #19-75', 141),
(056, 'Terminal Calarcá', 'Calle 5 #6-10', 142),
(057, 'Sucursal Santander de Quilichao', 'Carrera 9 #10-33', 143),
(058, 'Estación Guapi', 'Calle 14 #11-45', 0131), -- Corregido a id_ciudad de Guapi
(059, 'Sucursal Villa Rica', 'Carrera 12 #13-56', 144),
(060, 'Terminal Tumaco', 'Calle 25 #14-21', 0130), -- Corregido a id_ciudad de Tumaco
(061, 'Sucursal El Bordo', 'Carrera 10 #8-50', 145),
(062, 'Estación La Plata', 'Calle 4 #3-60', 146),
(063, 'Sucursal Toribío', 'Carrera 1 #2-18', 147);

INSERT INTO Tipo_empresa (id_tipo_empresa, Nombre, Descripcion) VALUES
(001,'Envio de carga y mensajeria','empresa de transporte nacional de carga y mensajería, especializada en cargas generales y perecederas, con un peso de 5 kg a 2,000 kg. Garantizamos seguridad, puntualidad y atención al cliente 24/7'),
(002,'Transporte Expreso','Empresa de envíos rápidos y transporte de pasajeros con cobertura nacional, especializada en servicios urgentes.'),
(003,'Carga Nacional S.A.','Servicios de transporte de carga general y mensajería, así como transporte de pasajeros a nivel nacional.'),
(004,'Distribuciones Globales','Especialistas en distribución de productos y transporte de pasajeros, con capacidad de hasta 4,000 kg.'),
(005,'Mensajería Rápida','Servicio de mensajería rápida y transporte de pasajeros, con entrega garantizada en 24 horas y confort en el viaje.'),
(006,'Logística Integral','Empresa de logística para transporte de carga pesada y transporte de pasajeros, con cobertura en todo el país.'),
(007,'Transporte Urbano','Servicios de transporte urbano de pasajeros con vehículos confortables y tarifas accesibles, especializados en rutas locales.'),
(008,'Paquetería Global','Servicio de paquetería y transporte de pasajeros, asegurando comodidad y seguridad en el viaje y entrega.'),
(009,'Servicios de Mensajería','Mensajería de documentos y transporte de pasajeros con entrega en 24 horas y seguimiento en tiempo real.'),
(0010,'Logística y Transporte','Transporte de carga general y servicios de transporte de pasajeros a nivel nacional, con atención al cliente 24/7.'),
(0011,'Carga Internacional','Transporte internacional de mercancías y servicios de pasajeros con opciones de envío marítimo, aéreo y terrestre.'),
(0012,'Transporte y Pasajeros','Transporte especializado en carga y servicios de pasajeros, garantizando seguridad y confort en el viaje.'),
(0013,'Envíos Rápidos','Empresa de envíos locales y nacionales con servicios de transporte ligero y transporte de pasajeros hasta 1,200 kg.'),
(0014,'Carga Pesada S.A.','Especialistas en transporte de carga pesada y viajes de pasajeros con capacidad de hasta 6,000 kg.'),
(0015,'Paquetería Nacional','Servicio de paquetería y transporte de pasajeros con entrega garantizada y atención al cliente 24/7.'),
(0016,'Mensajería y Carga','Servicios combinados de mensajería y transporte de pasajeros a nivel nacional, con atención personalizada.'),
(0017,'Transporte del Norte','Transporte de carga y pasajeros, con capacidad de hasta 2,000 kg y rutas hacia el norte del país.'),
(0018,'Envíos Nacionales S.A.','Transporte de carga y servicio de transporte de pasajeros, asegurando seguridad y rapidez en los envíos.'),
(0019,'Cargas y Logística','Soluciones logísticas para carga y transporte de pasajeros, con capacidad de hasta 4,000 kg y atención al cliente.'),
(0020,'Servicios de Carga','Transporte de carga y transporte de pasajeros con cobertura nacional, asegurando un servicio eficiente y confiable.'),
(0021,'Mensajería Expreso','Servicio rápido de entrega de documentos y transporte de pasajeros a nivel local y regional con seguimiento.'),
(0022,'Transporte y Distribución','Logística de transporte de carga y pasajeros, con capacidad de hasta 5,000 kg, a nivel nacional.'),
(0023,'Paquetería Express','Paquetería rápida y transporte de pasajeros con entrega garantizada en 48 horas y confort en el viaje.'),
(0024,'Logística Nacional','Transporte de mercancías no perecederas y servicios de transporte de pasajeros con atención al cliente 24/7.'),
(0025,'Envíos y Pasajeros','Empresa de transporte de carga y servicios de pasajeros con capacidad de hasta 1,200 kg, ofreciendo entregas rápidas.'),
(0026,'Carga Urgente S.A.','Transporte de carga urgente y servicios de transporte de pasajeros, manejando pesos de hasta 2,000 kg.'),
(0027,'Distribuciones Exprés','Especialistas en transporte de productos perecederos y servicios de transporte de pasajeros a nivel nacional.'),
(0028,'Mensajería y Logística','Empresa de mensajería rápida y transporte de pasajeros a nivel nacional con seguimiento en tiempo real.'),
(0029,'Carga Segura S.A.','Transporte especializado en productos delicados y servicios de transporte de pasajeros con capacidad de hasta 2,500 kg.'),
(0030,'Mensajería Nacional','Servicios de mensajería y transporte de pasajeros a nivel nacional con entregas rápidas y seguras de hasta 1,000 kg.'),
(0031,'Paquetería Global','Transporte de paquetes y carga ligera, así como servicios de transporte de pasajeros con entregas a nivel nacional.'),
(0032,'Carga Total S.A.','Especializados en transporte de carga general y servicios de transporte de pasajeros con capacidad de hasta 4,000 kg a nivel nacional.'),
(0033,  'Transporte',  'Empresas dedicadas al transporte');

INSERT INTO Empresas (id_empresa, Nombre, Telefono, Correo, Direccion, id_tipo_empresa) VALUES
(001,'Flota La Macarena','601 421 2256','servicioalcliente@flotalamacarena.com','Cr52 D 76-67 L-1111 -Palatino',001),
(002,'Transporte del Norte','601 331 5345','info@transportedelnorte.com','Av. Calle 26 # 80-29',002),
(003,'Transportes Flota Taxis Libres','601 423 0001','contacto@flotataxislibres.com','Calle 10 # 36-75',003),
(004,'Expreso Brasilia','601 745 7555','info@expresobrasilia.com','Calle 22 # 77-60',004),
(005,'Copetran','601 660 7880','atencion@copetran.com','Carrera 14 # 7-40',005),
(006,'Flota La Macarena','601 421 2256','servicioalcliente@flotalamacarena.com','Cr52 D 76-67 L-1111 - C.C. Palatino',006),
(007,'Expreso Palmira','601 328 5050','info@expresopalmira.com','Av. Jiménez # 5-70',007),
(008,'Transportes Móvil','601 326 1030','info@transportesmobil.com','Calle 34 # 19-45',008),
(009,'Flota San Jorge','601 510 7070','atencion@flotasanjorge.com','Carrera 40 # 21-30',009),
(0010,'Transportes Caribe','601 484 8240','info@transportescaribe.com','Calle 5 # 43-70',0010),
(0011,'Expreso Bolivariano','601 427 7070','contacto@expresobolivariano.com','Calle 24 # 43-30',0011),
(0012,'Flota 5 Estrellas','601 786 8787','servicio@flota5estrellas.com','Av. NQS # 80-40',0012),
(0013,'Transportes Valle','601 341 3141','info@transportesvalle.com','Calle 20 # 27-32',0013),
(0014,'Transportes Zuluaga','601 350 5050','contacto@transporteszuluaga.com','Calle 30 # 10-35',0014),
(0015,'Transportes Cootransvalle','601 345 6767','info@cootransvalle.com','Av. Las Américas # 15-20',0015),
(0016,'Flota Sultana','601 317 4777','atencion@flotasultana.com','Calle 23 # 43-50',0016),
(0017,'Transportes El Roble','601 602 1414','contacto@transporteselroble.com','Carrera 15 # 45-15',0017),
(0018,'Flotas Verdes','601 222 7878','servicio@flotaverde.com','Calle 16 # 20-40',0018),
(0019,'Transportes La Ciudad','601 305 9090','info@transporteslaciudad.com','Av. NQS # 65-40',0019),
(0020,'Expreso Valle del Cauca','601 528 5555','atencion@expresovalledelcauca.com','Calle 50 # 17-60',0020),
(0021,'Flota La Esperanza','601 420 6060','contacto@flotalaesperanza.com','Calle 13 # 38-70',0021),
(0022,'Transporte del Caribe','601 456 3333','info@transportedelcaribe.com','Carrera 80 # 10-25',0022),
(0023,'Flota Atlántico','601 515 5454','contacto@flotaatlantico.com','Calle 50 # 30-20',0023),
(0024,'Transportes El Puente','601 254 9090','info@transporteselpuente.com','Carrera 12 # 15-60',0024),
(0025,'Flota Rápida','601 452 5555','servicio@flotarapida.com','Calle 33 # 22-45',0025),
(0026,'Transporte El Dorado','601 528 7777','info@transporteelorado.com','Carrera 10 # 45-60',0026),
(0027,'Flota Suroeste','601 333 4444','contacto@flotasuroeste.com','Calle 23 # 22-10',0027),
(0028,'Transportes La Libertad','601 765 9090','info@transporteslalibertad.com','Carrera 4 # 30-40',0028),
(0029,'Expreso Panamericana','601 421 8000','atencion@expresopanamericana.com','Calle 32 # 21-50',0029),
(0030,'Flota Viajero','601 511 6767','contacto@flotaviajero.com','Av. Simón Bolívar # 12-15',0030),
(0031,'Transporte Intermunicipal','601 622 8888','info@transporteintermunicipal.com','Calle 25 # 30-50',0031),
(0032,'Flota del Caribe','601 899 7878','contacto@flotadelcaribe.com','Calle 8 # 28-80',0032);

INSERT INTO Modulos (id_modulo,Nombre,id_sede) VALUES
(001,'La Macarena',001),
(002,'Expreso Brasilia',002),
(003,'Rápido Ochoa',003),
(004,'Coomotor',004),
(005,'Expreso Bolivariano',005),
(006,'Flota Magdalena',006),
(007,'Copetran',007),
(008,'Cootranshuila',008),
(009,'Flota Occidental',009),
(0010,'Berlinas del Fonce',010),
(0011,'Rapido Tolima',011),
(0012,'Cootransmagdalena',012),
(0013,'Unitransco',013),
(0014,'Expreso Palmira',014),
(0015,'Transportes Luz',015),
(0016,'Transportes San Sebastián',016),
(0017,'Cootransince',017),
(0018,'Flota Rionegro',018),
(0019,'Transoriente',019),
(0020,'La Costeña',020),
(0021,'Transcuba',021),
(0022,'Flota Cauca',022),
(0023,'Velotax',023),
(0024,'Transportes Arimena',024),
(0025,'Expreso Pradera',025),
(0026,'Tax Belalcazar',026),
(0027,'Auto Transportes',027),
(0028,'Cootransuroccidente',028),
(0029,'Transportes Amerlujo',029),
(0030,'Expreso Santander',030),
(0031, '3 Rojo', 1),
(0032, '4 Verde', 1),
(0033, 'Modulo Taquillas', 2),
(0034, '2 Azul', 1),
(0035, '1 Amarillo', 1);

INSERT INTO Tipo_empleado (id_tipo_empleado, Nombre, Descripcion)  VALUES  
(001, 'Conductor', 'Responsable de la conducción de los buses'), 
(002, 'Supervisor', 'Encargado de supervisar operaciones'), 
(003, 'Ayudante', 'Asiste al conductor y ayuda con la carga y descarga'), 
(004, 'Mecánico', 'Encargado del mantenimiento y reparación de los vehículos'), 
(005, 'Administrativo', 'Gestión de documentación y atención al cliente'), 
(006, 'Vigilante', 'Seguridad y protección de las instalaciones'), 
(007, 'Despachador', 'Coordina la salida de los buses y la atención a los pasajeros'), 
(008, 'Gestor de Flota', 'Supervisa y gestiona el uso de los vehículos'), 
(009, 'Coordinador de Rutas', 'Planifica y coordina las rutas de los buses'), 
(010, 'Contador', 'Encargado de las finanzas y contabilidad de la empresa'), 
(011, 'Asistente de Recursos Humanos', 'Apoya en la gestión del personal'), 
(012, 'Técnico en Seguridad', 'Asegura el cumplimiento de las normas de seguridad'), 
(013, 'Operador de Sistemas', 'Gestiona el software y la tecnología utilizada en la empresa'), 
(014, 'Encargado de Marketing', 'Desarrolla estrategias de marketing y comunicación'), 
(015, 'Analista de Datos', 'Analiza datos para mejorar la eficiencia de la empresa'), 
(016, 'Jefe de Ventas', 'Lidera el equipo de ventas y estrategias comerciales'), 
(017, 'Planificador de Transporte', 'Organiza y optimiza rutas de transporte'), 
(018, 'Asistente Administrativo', 'Apoya en tareas administrativas y de oficina'), 
(019, 'Especialista en Logística', 'Optimiza la cadena de suministro y distribución'), 
(020, 'Auxiliar Contable', 'Asiste en la contabilidad y registro de operaciones'), 
(021, 'Técnico en Mantenimiento', 'Realiza mantenimiento preventivo y correctivo'), 
(022, 'Investigador de Mercado', 'Estudia el mercado y la competencia'), 
(023, 'Diseñador Gráfico', 'Crea contenido visual y gráfico para la empresa'), 
(024, 'Analista de Recursos Humanos', 'Analiza y gestiona el talento humano'), 
(025, 'Director de Operaciones', 'Supervisa las operaciones diarias de la empresa'), 
(026, 'Entrenador de Personal', 'Capacita y entrena al personal en sus funciones'), 
(027, 'Asesor Legal', 'Brinda asesoría legal a la empresa'), 
(028, 'Coordinador de Seguridad', 'Asegura el cumplimiento de normas de seguridad'), 
(029, 'Consultor de Proyectos', 'Asesora en la planificación y ejecución de proyectos'), 
(030, 'Promotor de Ventas', 'Promociona los servicios de la empresa ante los clientes'); 

INSERT INTO Empleados (cedula_empleado, Nombres, Apellidos, Telefono, correo, id_ciudad_origen, id_ciudad_residencia, id_tipo_empleado, id_Sede) VALUES 

(100001, 'Juan', 'Perez', '3001234567', 'juan.perez@empresa.com', 001, 0030, 001, 001),  
(100002, 'Maria', 'Gomez', '3002345678', 'maria.gomez@empresa.com', 002, 0029, 002, 002),  
(100003, 'Carlos', 'Lopez', '3003456789', 'carlos.lopez@empresa.com',003, 0028, 003, 003),   
(100004, 'Ana', 'Martinez', '3004567890', 'ana.martinez@empresa.com',004, 0027, 004, 004),  
(100005, 'Luis', 'Garcia', '3005678901', 'luis.garcia@empresa.com', 005, 0026, 005, 005),   
(100006, 'Laura', 'Rodriguez', '3006789012', 'laura.rodriguez@empresa.com', 006, 0025, 006, 006),  
(100007, 'Pedro', 'Hernandez', '3007890123', 'pedro.hernandez@empresa.com', 007, 0024, 007, 007),  
(100008, 'Sofia', 'Fernandez', '3008901234', 'sofia.fernandez@empresa.com',008, 0023, 008, 008),   
(100009, 'Jose', 'Ramirez', '3009012345', 'jose.ramirez@empresa.com', 009, 0022, 009, 009),  
(100010, 'Elena', 'Torres', '3000123456', 'elena.torres@empresa.com', 0010, 0021, 0010, 0010),   
(100011, 'Miguel', 'Vargas', '3011234567', 'miguel.vargas@empresa.com', 0011, 0020, 0011, 0011),  
(100012, 'Diana', 'Castro', '3012345678', 'diana.castro@empresa.com', 0012, 0019, 0012, 0012),   
(100013, 'Andres', 'Morales', '3013456789', 'andres.morales@empresa.com', 0013, 0018, 0013, 0013),   
(100014, 'Monica', 'Sanchez', '3014567890', 'monica.sanchez@empresa.com', 0014, 0017, 0014, 0014),  
(100015, 'Ricardo', 'Ortega', '3015678901', 'ricardo.ortega@empresa.com', 0015, 0016, 0015, 0015),   
(100016, 'Paula', 'Rubio', '3016789012', 'paula.rubio@empresa.com', 0016, 0015, 0016, 0016),   
(100017, 'Fernando', 'Guzman', '3017890123', 'fernando.guzman@empresa.com', 0017, 0014, 0017, 0017),   
(100018, 'Adriana', 'Mendoza', '3018901234', 'adriana.mendoza@empresa.com', 0018, 0013, 0018, 0018),   
(100019, 'Jorge', 'Silva', '3019012345', 'jorge.silva@empresa.com', 0019, 0012, 0019, 0019),   
(100020, 'Gabriela', 'Rios', '3010123456', 'gabriela.rios@empresa.com', 0020, 0011, 0020, 0020),   
(100021, 'Victor', 'Diaz', '3021234567', 'victor.diaz@empresa.com', 0021, 0010, 0021, 0021),   
(100022, 'Sara', 'Cortes', '3022345678', 'sara.cortes@empresa.com',0022, 009, 0022, 0022),   
(100023, 'Raul', 'Acosta', '3023456789', 'raul.acosta@empresa.com', 0023, 008, 0023, 0023),   
(100024, 'Isabel', 'Nunez', '3024567890', 'isabel.nunez@empresa.com', 0024, 007, 0024, 0024),   
(100025, 'Oscar', 'Molina', '3025678901', 'oscar.molina@empresa.com', 0025, 006, 0025, 0025),   
(100026, 'Claudia', 'Vega', '3026789012', 'claudia.vega@empresa.com', 0026, 005, 0026, 0026),   
(100027, 'Alberto', 'Salazar', '3027890123', 'alberto.salazar@empresa.com', 0027, 004, 0027, 0027),   
(100028, 'Julia', 'Flores', '3028901234', 'julia.flores@empresa.com', 0028, 003, 0028, 0028),   
(100029, 'Emilio', 'Ibanez', '3029012345', 'emilio.ibanez@empresa.com', 0029, 002, 0029, 0029),   
(100030, 'Carmen', 'Suarez', '3020123456', 'carmen.suarez@empresa.com', 0030, 001, 0030, 0030); 

INSERT INTO Tipo_bus (id_tipo_bus, Nombre) VALUES
(001, 'Bus de larga distancia'),
(002, 'Bus intermunicipal'),
(003, 'Bus urbano'),
(004, 'Bus turístico'),
(005, 'Bus escolar'),
(006, 'Bus para eventos'),
(007, 'Bus de transporte de mercancías'),
(008, 'Bus adaptado para personas con discapacidad'),
(009, 'Bus de lujo'),
(010, 'Minibús'),
(011, 'Microbús'),
(012, 'Bus de dos pisos'),
(013, 'Bus expreso'),
(014, 'Bus de tránsito rápido'),
(015, 'Bus de carga'),
(016, 'Bus de turismo de aventura'),
(017, 'Bus de transporte rural'),
(018, 'Bus de flota'),
(019, 'Bus de servicio nocturno'),
(020, 'Bus de transporte escolar'),
(021, 'Bus de transporte turístico'),
(022, 'Bus de asistencia médica'),
(023, 'Bus de transporte de personal'),
(024, 'Bus de conexión'),
(025, 'Bus de cercanías'),
(026, 'Bus de transporte universitario'),
(027, 'Bus turístico cultural'),
(028, 'Bus de transporte comunitario'),
(029, 'Bus de transporte de trabajadores'),
(030, 'Bus de transporte alternativo');


INSERT INTO Buses (Placa, Marca, Capacidad, id_tipo_bus, id_empresa, id_empleado) VALUES
('ABC-123', 'Mercedes-Benz', 50, 001, 001, 100001),
('DEF-456', 'Volvo', 40, 002, 002, 100002),
('GHI-789', 'Scania', 55, 003, 003, 100003),
('JKL-012', 'Iveco', 45, 004, 004, 100004),
('MNO-345', 'Renault', 60, 005, 005, 100005),
('PQR-678', 'Man', 50, 006, 006, 100006),
('STU-901', 'Toyota', 30, 007, 007, 100007),
('VWX-234', 'Isuzu', 40, 008, 008, 100008),
('YZA-567', 'Chevrolet', 35, 009, 009, 100009),
('BCD-890', 'Nissan', 30, 0010, 0010, 100010),
('EFG-123', 'Hino', 40, 0011, 0011, 100011),
('HIJ-456', 'Mitsubishi', 50, 0012, 0012, 100012),
('KLM-789', 'Kia', 30, 0013, 0013, 100013),
('NOP-012', 'Ford', 40, 0014, 0014, 100014),
('QRS-345', 'Peugeot', 35, 0015, 0015, 100015),
('TUV-678', 'Hyundai', 45, 0016, 0016, 100016),
('WXY-901', 'Tata', 50, 0017, 0017, 100017),
('ZAB-234', 'Daimler', 60, 0018, 0018, 100018),
('CDE-567', 'Fuso', 40, 0019, 0019, 100019),
('FGH-890', 'MAN', 50, 0020, 0020, 100020),
('HIJ-123', 'Volvo', 45, 0021, 0021, 100021),
('KLM-456', 'Scania', 55, 0022, 0022, 100022),
('NOP-789', 'Iveco', 30, 0023, 0023, 100023),
('QRS-012', 'Renault', 60, 0024, 0024, 100024),
('TUV-345', 'Chevrolet', 35, 0025, 0025, 100025),
('WXY-678', 'Nissan', 30, 0026, 0026, 100026),
('ZAB-901', 'Hino', 40, 0027, 0027, 100027),
('RPC-756', 'Suzuki', 15, 0028, 0028, 100028),
('JXK-086', 'Mercedes-Benz', 40, 0029, 0029, 100029),
('HIS-063', 'Suzuki', 25, 0030, 0030, 100030);

INSERT INTO Tipo_mantenimiento (id_tipo_mantenimiento, Nombre, Descripcion) VALUES
(001, 'Preventivo', 'Mantenimiento periódico para evitar fallos.'),
(002, 'Correctivo', 'Reparación de fallos imprevistos.'),
(003, 'Cambio de Aceite', 'Sustitución de lubricantes del motor.'),
(004, 'Revisión General', 'Chequeo completo del estado del vehículo.'),
(005, 'Alineación y Balanceo', 'Ajuste de las llantas para un mejor rendimiento.'),
(006, 'Revisión de Frenos', 'Verificación y ajuste del sistema de frenos.'),
(007, 'Revisión del Motor', 'Chequeo y ajuste de componentes del motor.'),
(008, 'Reparación de Carrocería', 'Reparaciones externas de la estructura del vehículo.'),
(009, 'Revisión de Suspensión', 'Ajuste y cambio de partes de la suspensión.'),
(010, 'Revisión del Sistema Eléctrico', 'Chequeo y reparación del sistema eléctrico.'),
(011, 'Revisión de Transmisión', 'Chequeo y ajuste de la caja de cambios.'),
(012, 'Cambio de Neumáticos', 'Sustitución de llantas desgastadas.'),
(013, 'Cambio de Filtros', 'Sustitución de filtros de aire y aceite.'),
(014, 'Revisión de Dirección', 'Chequeo del sistema de dirección.'),
(015, 'Revisión de Emisiones', 'Control de emisión de gases.'),
(016, 'Cambio de Batería', 'Sustitución de la batería del vehículo.'),
(017, 'Mantenimiento de Climatización', 'Revisión del sistema de aire acondicionado.'),
(018, 'Revisión de Correas', 'Chequeo y sustitución de correas del motor.'),
(019, 'Revisión de Inyectores', 'Chequeo del sistema de inyección de combustible.'),
(020, 'Revisión de Radiador', 'Chequeo y limpieza del radiador.'),
(021, 'Reparación del Sistema de Escape', 'Reparación de partes del escape.'),
(022, 'Cambio de Pastillas de Freno', 'Sustitución de pastillas de freno.'),
(023, 'Revisión de Luces', 'Chequeo y ajuste del sistema de iluminación.'),
(024, 'Revisión de Amortiguadores', 'Chequeo y ajuste de amortiguadores.'),
(025, 'Chequeo de Cables', 'Verificación de los cables eléctricos.'),
(026, 'Revisión de Caja de Cambios', 'Chequeo de cambios automáticos o manuales.'),
(027, 'Revisión del Sistema de Frenado ABS', 'Chequeo del sistema de frenos ABS.'),
(028, 'Revisión del Sistema de Combustible', 'Chequeo del tanque de combustible y mangueras.'),
(029, 'Chequeo de Transmisión Automática', 'Verificación de la transmisión automática.'),
(030, 'Revisión de Dirección Hidráulica', 'Chequeo del sistema de dirección hidráulica.');

INSERT INTO Mantenimientos (id_mantenimiento, Descripcion, Fecha_mantenimiento, id_tipo_mantenimiento, id_bus) VALUES
(001, 'Cambio de aceite y revisión general', '2024-01-10', 001, 'ABC-123'),
(002, 'Ajuste de frenos', '2024-01-15', 002, 'DEF-456'),
(003, 'Cambio de llantas', '2024-01-20', 003, 'GHI-789'),
(004, 'Ajuste de dirección', '2024-01-25', 004, 'JKL-012'),
(005, 'Alineación y balanceo', '2024-02-01', 005, 'MNO-345'),
(006, 'Cambio de pastillas de freno', '2024-02-05', 006, 'PQR-678'),
(007, 'Revisión del sistema eléctrico', '2024-02-10', 007, 'STU-901'),
(008, 'Cambio de batería', '2024-02-15', 008, 'VWX-234'),
(009, 'Chequeo de motor', '2024-02-20', 009, 'YZA-567'),
(010, 'Ajuste de suspensión', '2024-02-25', 010, 'BCD-890'),
(011, 'Revisión de radiador', '2024-03-01', 011, 'EFG-123'),
(012, 'Revisión de sistema de escape', '2024-03-05', 012, 'HIJ-456'),
(013, 'Chequeo de inyectores', '2024-03-10', 013, 'KLM-789'),
(014, 'Cambio de filtro de aire', '2024-03-15', 014, 'NOP-012'),
(015, 'Cambio de correa de distribución', '2024-03-20', 015, 'QRS-345'),
(016, 'Chequeo de luces delanteras', '2024-03-25', 016, 'TUV-678'),
(017, 'Revisión de climatización', '2024-03-30', 017, 'WXY-901'),
(018, 'Cambio de llantas traseras', '2024-04-01', 018, 'ZAB-234'),
(019, 'Chequeo del sistema ABS', '2024-04-05', 019, 'CDE-567'),
(020, 'Revisión del sistema de transmisión', '2024-04-10', 020, 'FGH-890'),
(021, 'Revisión de dirección hidráulica', '2024-04-15', 021, 'HIJ-123'),
(022, 'Chequeo del sistema de frenos', '2024-04-20', 022, 'KLM-456'),
(023, 'Cambio de aceite del motor', '2024-04-25', 023, 'NOP-789'),
(024, 'Chequeo de amortiguadores', '2024-04-30', 024, 'QRS-012'),
(025, 'Revisión de cables eléctricos', '2024-05-01', 025, 'TUV-345'),
(026, 'Chequeo de transmisión automática', '2024-05-05', 026, 'WXY-678'),
(027, 'Revisión de sistema de combustible', '2024-05-10', 027, 'ZAB-901'),
(028, 'Cambio de pastillas traseras', '2024-05-15', 028, 'RPC-756'),
(029, 'Chequeo del sistema de escape', '2024-05-20', 029, 'JXK-086'),
(030, 'Revisión del sistema de suspensión', '2024-05-25', 030, 'HIS-063');

INSERT INTO Destinos (id_destino, Nombre, id_modulo, id_ciudad_origen, id_ciudad_destino) VALUES  

(001, 'Cartagena', 002, 002, 001),  
(002, 'Caucacia', 0018, 001, 002),  
(003, 'Montería', 006, 004, 003),  
(004, 'Apartadó', 003, 003, 004),  
(005, 'Santa Marta', 0012, 006, 005),  
(006, 'Medellín', 003, 005, 006),  
(007, 'Valledupar', 020, 008, 007),  
(008, 'Rionegro', 0018, 007, 008),  
(009, 'Sincelejo', 0017, 0010, 009),  
(0010, 'Santa Rosa de Osos', 003, 009, 0010), 
(0011, 'San Juan del Cesar', 0012, 0011, 0011),  
(0012, 'Envigado', 0018, 0011, 0012),  
(0013, 'Ciénaga', 007, 0014, 0013),  
(0014, 'Barranquilla', 007, 0013, 0014),  
(0015, 'Guatape', 003, 0016, 0015),  
(0016, 'Maicao', 002, 0015, 0016),  
(0017, 'El peñol', 0018, 0018, 0017),  
(0018, 'Uribia', 003, 0017, 0018),  
(0019, 'Caramanta', 0018, 0020, 0019),  
(0020, 'Aracataca', 0020, 0019, 0020),  
(0021, 'Briceño', 003, 0022, 0021),  
(0022, 'San Juan del Cesar', 007, 0021, 0022),  
(0023, 'Riohacha', 002, 0024, 0023),  
(0024, 'El banco', 007, 0023, 0024),  
(0025, 'Fundación', 0013, 0026, 0025),  
(0026, 'Puerto Berrio', 0018, 0025, 0026),  
(0027, 'Marinilla', 003, 0028, 0027),  
(0028, 'Santa Catalina', 001, 0027, 0028),  
(0029, 'Turbaco', 0023, 0030, 0029),  
(0030, 'San Marcos', 0025, 0029, 0030);  

INSERT INTO Paradas_intermedias (id_parada, Nombre_parada, id_ciudad) VALUES  
(001,'Parada a restaurante', 001),   
(002,'Parada de gasolina', 002),   
(003,'Parada por llanta', 003),   
(004,'Parada a restaurante',004),   
(005,'Parada para descansar', 005),   
(006,'Parada por transito',006),   
(007,'Parada por calentamiento de motor',007),   
(008,'Parada a restaurante',008),   
(009,'Parada a terminal oficial',009),   
(0010,'Parada por emergencia medica', 0010),   
(0011,'Parada turistica', 0011),   
(0012,'Parada para intercambio de conductores', 0012),   
(0013,'Parada para cambio de bus',0013),  
(0014,'Parada para lavar bus',0014),  
(0015,'Parada a restaurante',0015),  
(0016,'Parada a restaurante',0016),  
(0017,'Parada a terminal oficial', 0017),  
(0018,'Parada por calentamiento de motor',0018),  
(0019,'Parada por gasolina ',0019),  
(0020,'Parada por gasolina', 0020),  
(0021,'Parada por emergencia medica', 0021),  
(0022,'Parada por llanta',0022),  
(0023,'Parada para descansar',0023),  
(0024,'Parada para intercambio de conductores', 0024),  
(0025,'Parada a restaurante ', 0025),  
(0026,'Parada por gasolina',0026),  
(0027,'Parada por transito',0027),  
(0028,'Parada por llanta',0028),  
(0029,'parada por gasolina', 0029),  
(0030,'Parada por gasolina', 0030);  

INSERT INTO Rutas (id_ruta, Nombre, id_paradas_intermedias) VALUES  
(001,'Cartagena' , 001),   
(002, 'Caucacia', 002),   
(003, 'Montería', 003),   
(004, 'Apartadó', 004),   
(005, 'Santa Marta', 005),   
(006, 'Medellín', 006),   
(007, 'Valledupar',007),   
(008, 'Rionegro', 008),   
(009, 'Sincelejo', 009),   
(0010,'Santa Rosa de Osos', 0010), 
(0011, 'San Juan del Cesar', 0011),   
(0012, 'Envigado', 0012),   
(0013, ' Ciénaga' , 0013),   
(0014, 'Barranquilla', 0014),   
(0015,'Guatape', 0015),   
(0016, 'Maicao', 0016),   
(0017, 'El peñol', 0017),   
(0018, 'Uribia', 0018),   
(0019, 'Caramanta', 0019),   
(0020, 'Aracataca', 0020),   
(0021, 'Briceño', 0021),   
(0022, 'San Juan del Cesar', 0022),   
(0023, 'Riohacha', 0023),   
(0024, 'El banco', 0024),   
(0025, 'Fundación', 0025),   
(0026, 'Puerto Berrio', 0026),  
(0027, 'Marinilla', 0027),   
(0028, 'Santa Catalina', 0028),   
(0029, 'Turbaco', 0029),   
(0030, 'San Marcos', 0030);  

INSERT INTO Detalle_Destinos_Rutas (Id_destino, id_ruta) VALUES 
(001, 001), 
(002, 002),  
(003, 003),  
(004, 004),  
(005, 005),  
(006, 006),  
(007, 007),  
(008, 008),  
(009, 009),
(0010, 0010),  
(0011, 0011),  
(0012, 0012),  
(0013, 0013),  
(0014, 0014),  
(0015, 0015),  
(0016, 0016),  
(0017, 0017),  
(0018, 0018),  
(0019, 0019),  
(0020, 0020),  
(0021, 0021),  
(0022, 0022),  
(0023, 0023),  
(0024, 0024),  
(0025, 0025),  
(0026, 0026),  
(0027, 0027),  
(0028, 0028),  
(0029, 0029),  
(0030, 0030); 

INSERT INTO Detalle_Buses_Rutas (Id_bus, id_ruta) VALUES 
('ABC-123', 001), 
('DEF-456', 002), 
('GHI-789', 003),  
('JKL-012', 004),  
('MNO-345', 005),  
('PQR-678', 006),  
('STU-901', 007),  
('VWX-234', 008),  
('YZA-567', 009),  
('BCD-890', 0010),  
('EFG-123', 0011),  
('HIJ-456', 0012),  
('KLM-789', 0013),  
('NOP-012', 0014),  
('QRS-345', 0015),  
('TUV-678', 0016),  
('WXY-901', 0017),  
('ZAB-234', 0018),  
('CDE-567', 0019),  
('FGH-890', 0020),  
('HIJ-123', 0021),  
('KLM-456', 0022),  
('NOP-789', 0023),  
('QRS-012', 0024),  
('TUV-345', 0025),  
('WXY-678', 0026),  
('ZAB-901', 0027),  
('RPC-756', 0028),  
('JXK-086', 0029),  
('HIS-063', 0030);  

INSERT INTO Viajes (id_viaje, Fecha_salida, Valor, id_bus, id_conductor, id_ruta, id_ciudad_origen, id_ciudad_destino) VALUES   
(001, '2023-01-15', 102.45, 'ABC-123', 100001, 001, 002, 001),    
(002, '2023-02-08', 215.78, 'CDE-567', 100019, 002, 001, 002),   
(003, '2023-03-22', 345.90, 'HIJ-123', 100021, 003, 004, 003),   
(004, '2023-04-18', 478.25, 'HIJ-456', 100012, 004, 003, 004),   
(005, '2023-05-07', 125.00, 'JKL-012', 100004, 005, 006, 005),   
(006, '2023-06-13', 380.15, 'JXK-086', 100029, 006, 005, 006),   
(007, '2023-07-29', 245.60, 'KLM-789', 100013, 007, 008, 007),   
(008, '2023-08-11', 400.99, 'NOP-012', 100014, 008, 007, 008),   
(009, '2023-09-03', 155.30, 'QRS-012', 100024, 009, 0010, 009),   
(0010, '2023-10-19', 210.10, 'QRS-345', 100015, 0010, 009, 0010),   
(0011, '2023-11-25', 320.85, 'STU-901', 100007, 0011, 0012, 0011),   
(0012, '2023-12-05', 150.50, 'VWX-234', 100008, 0012, 0011, 0012),   
(0013, '2022-01-10', 275.45, 'YZA-567', 100009, 0013, 0014, 0013),   
(0014, '2022-02-16', 499.99, 'ZAB-901', 100027, 0014, 0013, 0014),   
(0015, '2022-03-27', 180.75, 'ABC-123', 100001, 0015, 0016, 0015),   
(0016, '2022-04-09', 360.00, 'BCD-890', 100010, 0016, 0015, 0016),   
(0017, '2022-05-20', 298.40, 'EFG-123', 100011, 0017, 0018, 0017),   
(0018, '2022-06-08', 430.60, 'MNO-345', 100005, 0018, 0017, 0018),   
(0019, '2022-07-12', 220.25, 'KLM-789', 100013, 0019, 0020, 0019),   
(0020, '2022-08-24', 390.90, 'RPC-756', 100028, 0020, 0019, 0020),   
(0021, '2022-09-17', 135.70, 'HIS-063', 100030, 0021, 0022, 0021),   
(0022, '2022-10-06', 175.10, 'NOP-012', 100014, 0022, 0021, 0022),   
(0023, '2022-11-14', 250.00, 'WXY-678', 100026, 0023, 0024, 0023),   
(0024, '2022-12-21', 450.80, 'PQR-678', 100006, 0024, 0023, 0024),   
(0025, '2021-01-30', 380.25, 'NOP-789', 100023, 0025, 0026, 0025),   
(0026, '2021-02-18', 150.99, 'JKL-012', 100004, 0026, 0025, 0026),   
(0027, '2021-03-05', 495.50, 'WXY-901', 100017, 0027, 0028, 0027),   
(0028, '2021-04-12', 275.00, 'FGH-890', 100020, 0028, 0027, 0028),   
(0029, '2021-05-28', 150.15, 'KLM-456', 100022, 0029, 0030, 0029),   
(0030, '2021-06-15', 430.45, 'ZAB-901', 100027, 0030, 0029, 0030); 

INSERT INTO Tipo_cliente (id_tipo_cliente, Nombre, Descripcion) VALUES   
(001, 'Corporativo', 'Grandes empresas que adquieren productos o servicios a gran escala.'),  
(002, 'Pequeña empresa', 'Pequeñas empresas o startups con necesidades limitadas.'),  
(003, 'Mediana empresa', 'Empresas medianas que adquieren productos en volúmenes moderados.'),  
(004, 'Individual', 'Clientes que compran productos para uso personal.'),  
(005, 'Distribuidor', 'Compran productos para distribuir en otros mercados o minoristas.'),  
(006, 'Minorista', 'Tiendas que venden productos directamente al consumidor final.'),  
(007, 'Mayorista', 'Compradores que adquieren grandes volúmenes para reventa a minoristas.'),  
(008, 'Gobierno', 'Entidades gubernamentales que adquieren productos o servicios para uso público.'),  
(009, 'ONG', 'Organizaciones sin ánimo de lucro que requieren productos o servicios para sus proyectos.'),  
(0010, 'Educativo', 'Instituciones educativas que compran productos para uso académico.'),  
(0011, 'Cliente habitual', 'Clientes que hacen compras recurrentes de manera periódica.'),  
(0012, 'Cliente esporádico', 'Clientes que realizan compras ocasionales sin frecuencia definida.'), 
(0013, 'Cliente VIP', 'Clientes importantes que reciben atención especial por su volumen de compra.'),  
(0014, 'Cliente nuevo', 'Clientes que acaban de realizar su primera compra.'),  
(0015, 'Cliente antiguo', 'Clientes que no han comprado en mucho tiempo pero lo han hecho en el pasado.'),  
(0016, 'Cliente online', 'Clientes que realizan sus compras a través de plataformas en línea.'),  
(0017, 'Cliente offline', 'Clientes que prefieren realizar compras en tiendas físicas.'),  
(0018, 'Cliente internacional', 'Clientes que compran productos desde otros países.'),  
(0019, 'Cliente nacional', 'Clientes que realizan compras dentro del territorio nacional.'),  
(0020, 'Cliente premium', 'Clientes que adquieren productos o servicios de categoría superior.'),  
(0021, 'Cliente básico', 'Clientes que adquieren productos o servicios estándar o básicos.'),  
(0022, 'Cliente leal', 'Clientes que muestran fidelidad constante hacia la empresa.'),  
(0023, 'Cliente perdido', 'Clientes que han dejado de comprar durante un largo periodo de tiempo.'),  
(0024, 'Cliente nuevo', 'Clientes que acaban de realizar su primera compra.'),  
(0025, 'Proveedor', 'Empresas o individuos que también proveen productos y que compran para reventa.'),   
(0026, 'Cliente potencial', 'Clientes que han mostrado interés, pero aún no han realizado una compra.'),  
(0027, 'Cliente antiguo', 'Clientes que no han comprado en mucho tiempo pero lo han hecho en el pasado.'),  
(0028, 'Cliente por campaña', 'Clientes que han llegado a la empresa mediante campañas de marketing.'),  
(0029, 'Cliente de contrato', 'Clientes que adquieren productos bajo un contrato formal con la empresa.'),  
(0030, 'Cliente con suscripción', 'Clientes que tienen una suscripción para recibir productos o servicios regularmente.');  


INSERT INTO Cliente (id_cliente, Nombres, Apellidos, Telefono, Correo, id_tipo_cliente, id_ciudad_origen, id_ciudad_residencia) VALUES  
(001, 'Juan', 'Pérez', '3012345678', 'juan.perez@example.com', 001, 001, 0029),   
(002, 'María', 'Gómez', '3023456789', 'maria.gomez@example.com', 002, 002, 0028),  
(003, 'Luis', 'Hernández', '3034567890', 'luis.hernandez@example.com', 003, 003, 0027),   
(004, 'Ana', 'Ramírez', '3045678901', 'ana.ramirez@example.com', 004, 004, 0030),   
(005, 'Carlos', 'Martínez', '3056789012', 'carlos.martinez@example.com', 005, 005, 0026),  
(006, 'Laura', 'Torres', '3067890123', 'laura.torres@example.com', 006, 006, 0025),   
(007, 'David', 'Cruz', '3078901234', 'david.cruz@example.com', 007, 007, 0025),   
(008, 'Sara', 'Morales', '3089012345', 'sara.morales@example.com', 008, 008, 0027),   
(009, 'Jorge', 'Jiménez', '3090123456', 'jorge.jimenez@example.com', 009, 009, 0030),   
(0010, 'Carmen', 'Díaz', '3101234567', 'carmen.diaz@example.com', 0010, 0010, 0027),   
(0011, 'Andrés', 'Suárez', '3112345678', 'andres.suarez@example.com', 0011, 0011, 0028),   
(0012, 'Verónica', 'Vargas', '3123456789', 'veronica.vargas@example.com', 0012, 0012, 0029),   
(0013, 'Ricardo', 'Mendoza', '3134567890', 'ricardo.mendoza@example.com', 0013, 0013, 0019),   
(0014, 'Patricia', 'Castro', '3145678901', 'patricia.castro@example.com', 0014, 0014, 0011),   
(0015, 'Fernando', 'Paredes', '3156789012', 'fernando.paredes@example.com', 0015, 0015, NULL),   
(0016, 'Liliana', 'Salazar', '3167890123', 'liliana.salazar@example.com', 0016, 0016, 0014),   
(0017, 'Eduardo', 'Moreno', '3178901234', 'eduardo.moreno@example.com', 0017, 0017, 0013),   
(0018, 'Sofía', 'Rojas', '3189012345', 'sofia.rojas@example.com', 0018, 0018, 0012),   
(0019, 'Diego', 'Ochoa', '3190123456', 'diego.ochoa@example.com', 0019, 0019, 0011),   
(0020, 'Lucía', 'Guerrero', '3201234567', 'lucia.guerrero@example.com', 0020, 0020, 0010),   
(0021, 'Ángel', 'Córdoba', '3212345678', 'angel.cordoba@example.com', 0021, 0021, 005),   
(0022, 'Valentina', 'Cáceres', '3223456789', 'valentina.caceres@example.com', 0022, 0022, 004),   
(0023, 'Sebastián', 'González', '3234567890', 'sebastian.gonzalez@example.com', 0023, 0023, 003),   
(0024, 'Isabella', 'Maldonado', '3245678901', 'isabella.maldonado@example.com', 0024, 0024, 002),   
(0025, 'Nicolás', 'Bermúdez', '3256789012', 'nicolas.bermudez@example.com', 0025, 0025, 001),   
(0026, 'Mariana', 'Ceballos', '3267890123', 'mariana.ceballos@example.com', 0026, 0026, 005),   
(0027, 'Héctor', 'Rincón', '3278901234', 'hector.rincon@example.com', 0027, 0027, 004),   
(0028, 'Gabriela', 'López', '3289012345', 'gabriela.lopez@example.com', 0028, 0028, 003),   
(0029, 'Arturo', 'Alvarez', '3290123456', 'arturo.alvarez@example.com', 0029, 0029, 002),   
(0030, 'Natalia', 'Pinto', '3301234567', 'natalia.pinto@example.com', 0030, 0030, 001);  

INSERT INTO Metodo_pago (id_metodo_pago, Nombre) VALUES  
(001, 'Tarjeta de crédito'),  
(002, 'Tarjeta de débito'),  
(003, 'Transferencia bancaria'),  
(004, 'Efectivo'),  
(005, 'Transferencia bancaria'),  
(006, 'Pago móvil'),  
(007, 'Daviplata'),  
(008, 'Efectivo'),  
(009, 'Transferencia bancaria'),  
(0010, 'Tarjeta de crédito'),  
(0011, 'Nequi'),  
(0012, 'Débito automático'),  
(0013, 'Transferencia bancaria'),  
(0014, 'Efectivo'),  
(0015, 'Pago móvil'),  
(0016, 'Daviplata'),  
(0017, 'Tarjeta de crédito'),  
(0018, 'Efectivo'),  
(0019, 'Pago en oficina'),  
(0020, 'Pago por código QR'),  
(0021, 'Pago en tienda física'),  
(0022, 'Tarjeta de crédito'),  
(0023, 'Efectivo'),  
(0024, 'Pago por depósito en cuenta'),  
(0025, 'Pago por ventanilla bancaria'),  
(0026, 'Pago con tarjeta prepaga'),  
(0027, 'Nequi'),  
(0028, 'Efectivo'),  
(0029, 'Tarjeta de crédito'),  
(0030, 'Pago por factura electrónica');  

INSERT INTO Boletos (id_boleto, Numero_asiento, id_destino, id_empresa, id_bus, id_ruta) VALUES 
(001, 01, 001, 001, 'ABC-123', 001),  
(002, 02, 002, 002, 'DEF-456', 002),  
(003, 03, 003, 003, 'GHI-789', 003),  
(004, 04, 004, 004, 'JKL-012', 004),  
(005, 05, 005, 005, 'MNO-345', 005),  
(006, 06, 006, 006, 'PQR-678', 006),  
(007, 07, 007, 007, 'STU-901', 007),  
(008, 08, 008, 008, 'VWX-234', 008),  
(009, 09, 009, 009, 'YZA-567', 009),  
(0010, 10, 0010, 0010, 'BCD-890', 0010),  
(0011, 11, 0011, 0011, 'EFG-123', 0011),  
(0012, 12, 0012, 0012, 'HIJ-456', 0012),  
(0013, 13, 0013, 0013, 'KLM-789', 0013),  
(0014, 14, 0014, 0014, 'NOP-012', 0014),  
(0015, 15, 0015, 0015, 'QRS-345', 0015),  
(0016, 16, 0016, 0016, 'TUV-678', 0016),  
(0017, 17, 0017, 0017, 'WXY-901', 0017),  
(0018, 18, 0018, 0018, 'ZAB-234', 0018),  
(0019, 19, 0019, 0019, 'CDE-567', 0019),  
(0020, 20, 0020, 0020, 'FGH-890', 0020),  
(0021, 21, 0021, 0021, 'HIJ-123', 0021),  
(0022, 22, 0022, 0022, 'KLM-456', 0022),  
(0023, 23, 0023, 0023, 'NOP-789', 0023),  
(0024, 24, 0024, 0024, 'QRS-012', 0024),  
(0025, 25, 0025, 0025, 'TUV-345', 0025),  
(0026, 26, 0026, 0026, 'WXY-678', 0026),  
(0027, 27, 0027, 0027, 'ZAB-901', 0027),  
(0028, 28, 0028, 0028, 'RPC-756', 0028),  
(0029, 29, 0029, 0029, 'JXK-086', 0029),  
(0030, 30, 0030, 0030, 'HIS-063', 0030); 

INSERT INTO Equipaje (id_equipaje, peso, descripcion, id_cliente, id_boleto) VALUES 
(001, 12.55, 'Maleta color azul tres cremalleras y stiker de boleto al frente', 001, 001),  
(002, 15.44, 'Bolso de camper azul y negro con una estrella atras', 002, 002),  
(003, 8.66, 'Maleta totto negra con reflectiva, con boleto al frente', 003, 003),  
(004, 4.02, 'Cartera café claro con candado', 004, 004),  
(005, 9.41, 'Canasta con toalla encima de color verde, con el stiker del boleto en la manija', 005, 005),  
(006, 7.50, 'Mochila de lona marrón con una etiqueta grande en el lateral', 006, 006),  
(007, 10.20, 'Bolso deportivo rojo y negro con rayas horizontales', 007, 007),  
(008, 5.35, 'Maletín gris con tiras de cuero y cremallera dorada', 008, 008),  
(009, 12.85, 'Bolsa negra de viaje con diseño de rayas en los laterales', 009, 009),  
(0010, 6.75, 'Maleta pequeña verde con estampa de flores en el centro', 0010, 0010),  
(0011, 8.90, 'Bolso de mano morado con un parche de estrella', 0011, 0011),  
(0012, 7.25, 'Cartera negra con hebilla plateada en la parte frontal', 0012, 0012),  
(0013, 9.80, 'Mochila azul con estampado de montañas en la tapa', 0013, 0013),  
(0014, 13.00, 'Maletín de cuero marrón con bordes desgastados', 0014, 0014),  
(0015, 11.55, 'Bolso negro con dos cremalleras en los costados', 0015, 0015),  
(0016, 6.45, 'Mochila con diseño de camuflaje y varios bolsillos externos', 0016, 0016),  
(0017, 14.20, 'Maleta gris con detalles en color azul y cierre con clave', 0017, 0017),  
(0018, 10.90, 'Bolso deportivo verde con logo de equipo de fútbol', 0018, 0018),  
(0019, 7.80, 'Bolsa de viaje azul con estampado de lunares', 0019, 0019),  
(0020, 9.30, 'Maletín negro con asas acolchonadas y logotipo en el frente', 0020, 0020),  
(0021, 12.00, 'Bolso de lona gris con tirantes de cuero y cierre frontal', 0021, 0021),  
(0022, 11.35, 'Mochila escolar rosa con diseño de caricaturas', 0022, 0022),  
(0023, 13.25, 'Maleta rígida plateada con ruedas y etiqueta lateral', 0023, 0023),  
(0024, 8.10, 'Bolso de mano azul con cremalleras doradas', 0024, 0024),  
(0025, 14.80, 'Maleta negra grande con ruedas y asa extensible', 0025, 0025),  
(0026, 9.75, 'Bolsa de viaje morada con diseño de rayas', 0026, 0026),  
(0027, 12.40, 'Maletín gris con compartimentos adicionales', 0027, 0027),  
(0028, 10.65, 'Mochila amarilla con bolsillos laterales y parche frontal', 0028, 0028),  
(0029, 6.95, 'Cartera roja con cierre magnético y cadena dorada', 0029, 0029),  
(0030, 8.85, 'Bolsa deportiva azul con cremallera lateral y logotipo', 0030, 0030); 

INSERT INTO Factura (id_factura, Fecha_facturacion, Valor_total, id_boleto, id_seguro, id_equipaje, id_viaje, id_metodo_pago) VALUES  
(001, '2024-01-12', 71000.00, 001, 001, 001, 001, 001),   
(002, '2024-01-13', 72000.00, 002, 002, 002, 002, 002),   
(003, '2024-01-14', 73000.00, 003, 003, 003, 003, 003),   
(004, '2024-01-15', 74000.00, 004, 004, 004, 004, 004),   
(005, '2024-02-16', 75000.00, 005, 005, 005, 005, 005),   
(006, '2024-02-17', 76000.00, 006, 006, 006, 006, 006),   
(007, '2024-02-18', 77000.00, 007, 007, 007, 007, 007),   
(008, '2024-02-19', 78000.00, 008, 008, 008, 008, 008),   
(009, '2024-03-20', 79000.00, 009, 009, 009, 009, 009),   
(0010, '2024-03-12', 80000.00, 0010, 0010, 0010, 0010, 0010),   
(0011, '2024-03-16', 81000.00, 0011, 0011, 0011, 0011, 0011),   
(0012, '2024-04-18', 82000.00, 0012, 0012, 0012, 0012, 0012),   
(0013, '2024-04-19', 83000.00, 0013, 0013, 0013, 0013, 0013),   
(0014, '2024-04-30', 84000.00, 0014, 0014, 0014, 0014, 0014),   
(0015, '2024-04-29', 85000.00, 0015, 0015, 0015, 0015, 0015),   
(0016, '2024-04-20', 86000.00, 0016, 0016, 0016, 0016, 0016),   
(0017, '2024-05-21', 87000.00, 0017, 0017, 0017, 0017, 0017),   
(0018, '2024-05-22', 88000.00, 0018, 0018, 0018, 0018, 0018),   
(0019, '2024-05-25', 89000.00, 0019, 0019, 0019, 0019, 0019),   
(0020, '2024-06-01', 90000.00, 0020, 0020, 0020, 0020, 0020),   
(0021, '2024-06-02', 91000.00, 0021, 0021, 0021, 0021, 0021),   
(0022, '2024-06-04', 92000.00, 0022, 0022, 0022, 0022, 0022),   
(0023, '2024-07-04', 93000.00, 0023, 0023, 0023, 0023, 0023),   
(0024, '2024-07-06', 94000.00, 0024, 0024, 0024, 0024, 0024),   
(0025, '2024-08-27', 95000.00, 0025, 0025, 0025, 0025, 0025),   
(0026, '2024-08-30', 96000.00, 0026, 0026, 0026, 0026, 0026),   
(0027, '2024-09-27', 97000.00, 0027, 0027, 0027, 0027, 0027),   
(0028, '2024-09-28', 98000.00, 0028, 0028, 0028, 0028, 0028),   
(0029, '2024-09-29', 99000.00, 0029, 0029, 0029, 0029, 0029),   
(0030, '2024-10-08', 100000.00, 0030, 0030, 0030, 0030, 0030); 

INSERT INTO Tipo_mercancia (id_tipo_mercancia, Nombre, Descripcion) VALUES
(001, 'Maleta', 'Maletas de tamaño personal o mediano, aptas para viajes en bus'),
(002, 'Mochila', 'Mochilas medianas para uso personal durante el viaje'),
(003, 'Bolso', 'Bolsos de tamaño personal que los pasajeros pueden llevar consigo'),
(004, 'Equipaje de mano', 'Equipaje pequeño que puede ir a bordo del bus'),
(005, 'Carro de bebé', 'Carritos pequeños para niños que acompañan a los pasajeros'),
(006, 'Bicicleta', 'Bicicletas plegables o desmontadas, que pueden ser transportadas'),
(007, 'Instrumentos musicales', 'Instrumentos de tamaño mediano, como guitarras o violines'),
(008, 'Equipos electrónicos', 'Equipos como laptops o cámaras que los pasajeros pueden llevar'),
(009, 'Sillas de ruedas', 'Sillas de ruedas que los pasajeros pueden necesitar para su movilidad'),
(010, 'Cajas personales', 'Cajas de tamaño pequeño o mediano que los pasajeros pueden llevar consigo');

INSERT INTO Mercancia (id_mercancia, descripcion, peso, valor_estimado, id_tipo_mercancia, id_cliente, id_viaje, id_boleto) VALUES
(001, 'Maleta de mano', 10.5, 250000, 001, 001, 001, 001),
(002, 'Mochila escolar', 5.0, 100000, 002, 002, 002, 002),
(003, 'Bolso de mano', 3.0, 50000, 003, 003, 003, 003),
(004, 'Equipaje de mano', 8.0, 150000, 004, 004, 004, 004),
(005, 'Carro de bebé', 12.0, 350000, 005, 005, 005, 005),
(006, 'Bicicleta plegable', 15.0, 500000, 006, 006, 006, 006),
(007, 'Guitarra acústica', 6.5, 300000, 007, 007, 007, 007),
(008, 'Laptop', 2.0, 1500000, 008, 008, 008, 008),
(009, 'Silla de ruedas', 12.0, 1000000, 009, 009, 009, 009),
(010, 'Caja con ropa', 20.0, 100000, 010, 010, 010, 010);