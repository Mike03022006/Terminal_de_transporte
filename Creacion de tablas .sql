
CREATE TABLE Sedes (
    IdSede INT AUTO_INCREMENT PRIMARY KEY,
    NombreSede VARCHAR(255) NOT NULL,
    Ubicación TEXT NOT NULL,
    CapacidadAlmacenamiento INT NOT NULL,
    ContactoSede VARCHAR(255)
);

CREATE TABLE Categorías (
    IdCategoria INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR(255) NOT NULL,
    DescripciónCategoria TEXT
);

CREATE TABLE Proveedores (
    IdProveedor INT AUTO_INCREMENT PRIMARY KEY,
    NombreProveedor VARCHAR(255) NOT NULL,
    CondicionesSuministro TEXT,
    TiempoEntrega VARCHAR(255),
    ContactoClave VARCHAR(255),
    TelefonoContacto VARCHAR(20),
    EmailContacto VARCHAR(255)
);


CREATE TABLE Clientes (
    IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    NombreCliente VARCHAR(255) NOT NULL,
    ApellidoCliente VARCHAR(255),
    Email VARCHAR(255),
    Telefono VARCHAR(20),
    Direccion TEXT,
    FechaRegistro DATE,
    Preferencias TEXT
);

CREATE TABLE RolesAcceso (
    IdRol INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(255) NOT NULL,
    DescripciónRol TEXT
);

CREATE TABLE Productos (
    IdProducto INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    IdCategoria INT,
    StockDisponible INT NOT NULL,
    IdSede INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categorías(IdCategoria),
    FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede)
);
CREATE TABLE ProductosProveedores (
    IdProductoProveedor INT AUTO_INCREMENT PRIMARY KEY,
    IdProducto INT,
    IdProveedor INT,
    PrecioProveedor DECIMAL(10, 2),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
);

CREATE TABLE Empleados (
    IdEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    NombreEmpleado VARCHAR(255) NOT NULL,
    ApellidoEmpleado VARCHAR(255),
    Rol VARCHAR(100),
    HorarioTrabajo VARCHAR(255),
    IdSede INT,
    FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede)
);

CREATE TABLE Ventas (
    IdVenta INT AUTO_INCREMENT PRIMARY KEY,
    FechaVenta DATETIME NOT NULL,
    IdCliente INT,
    IdEmpleado INT,
    TotalVenta DECIMAL(10, 2) NOT NULL,
    MetodoPago VARCHAR(50),
    IdSede INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede)
);

CREATE TABLE DetalleVentas (
    IdDetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    Cantidad INT NOT NULL,
    PrecioVenta DECIMAL(10, 2) NOT NULL,
    DescuentoAplicado DECIMAL(10, 2) NULL,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

CREATE TABLE Inventarios (
    IdInventario INT AUTO_INCREMENT PRIMARY KEY,
    IdProducto INT,
    IdSede INT,
    StockInicial INT NOT NULL,
    StockDisponible INT NOT NULL,
    FechaActualizacion DATETIME NOT NULL,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede)
);

CREATE TABLE MovimientosInventario (
    IdMovimiento INT AUTO_INCREMENT PRIMARY KEY,
    IdProducto INT,
    IdSede INT,
    TipoMovimiento ENUM('Entrada', 'Salida') NOT NULL,
    Cantidad INT NOT NULL,
    FechaMovimiento DATETIME NOT NULL,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede)
);


CREATE TABLE Promociones (
    IdPromoción INT AUTO_INCREMENT PRIMARY KEY,
    NombrePromoción VARCHAR(255) NOT NULL,
    DescripciónPromoción TEXT,
    FechaInicio DATETIME,
    FechaFin DATETIME,
    IdProducto INT NULL,
    IdCategoria INT NULL,
    Descuento DECIMAL(5, 2),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdCategoria) REFERENCES Categorías(IdCategoria)
);

CREATE TABLE Devoluciones (
    IdDevolución INT AUTO_INCREMENT PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    CantidadDevuelta INT NOT NULL,
    MotivoDevolución TEXT,
    FechaDevolución DATETIME NOT NULL,
    MontoReembolsado DECIMAL(10, 2),
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

CREATE TABLE Facturas (
    IdFactura INT AUTO_INCREMENT PRIMARY KEY,
    IdVenta INT,
    FechaFactura DATETIME NOT NULL,
    MontoTotal DECIMAL(10, 2) NOT NULL,
    Impuestos DECIMAL(10, 2) NOT NULL,
    MontoFinal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta)
);

CREATE TABLE ReportesVentas (
    IdReporte INT AUTO_INCREMENT PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    IdCategoria INT,
    Cantidad INT NOT NULL,
    PrecioTotal DECIMAL(10, 2) NOT NULL,
    FechaVenta DATETIME NOT NULL,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdCategoria) REFERENCES Categorías(IdCategoria)
);


CREATE TABLE SegmentosClientes (
    IdSegmento INT AUTO_INCREMENT PRIMARY KEY,
    NombreSegmento VARCHAR(255) NOT NULL,
    DescripciónSegmento TEXT,
    CriteriosSegmento TEXT
);

CREATE TABLE puntosClientes (
    IdpuntosClientes INT AUTO_INCREMENT PRIMARY KEY,
    IdCliente INT,
    PuntosAcumulados INT NOT NULL,
    FechaUltimaActualización DATETIME NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

CREATE TABLE ControlCalidad (
    IdControl INT AUTO_INCREMENT PRIMARY KEY,
    IdProducto INT,
    FechaControl DATETIME NOT NULL,
    Resultado VARCHAR(255) NOT NULL,
    AccionesCorrectivas TEXT,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

CREATE TABLE MantenimientoBD (
    IdMantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    FechaMantenimiento DATETIME NOT NULL,
    TipoMantenimiento VARCHAR(50),
    Descripción TEXT
);

CREATE TABLE Permisos (
    IdPermiso INT AUTO_INCREMENT PRIMARY KEY,
    IdRol INT,
    Modulo VARCHAR(255),
    AccesoLectura BOOLEAN,
    AccesoEscritura BOOLEAN,
    FOREIGN KEY (IdRol) REFERENCES RolesAcceso(IdRol)
);

CREATE TABLE Auditoría (
    IdAuditoria INT AUTO_INCREMENT PRIMARY KEY,
    FechaActividad DATETIME NOT NULL,
    IdUsuario INT,
    Actividad TEXT,
    FOREIGN KEY (IdUsuario) REFERENCES Empleados(IdEmpleado)
);

CREATE TABLE IntegracionesExternas (
    IdIntegración INT AUTO_INCREMENT PRIMARY KEY,
    NombreSistema VARCHAR(255) NOT NULL,
    Descripción TEXT,
    FechaIntegración DATETIME NOT NULL
);

CREATE TABLE Paqueteria (
    PaqueteID INT AUTO_INCREMENT PRIMARY KEY,
    RemitenteID INT NOT NULL,
    DestinatarioID INT NOT NULL,
    Origen VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    Peso DECIMAL(10,2) NOT NULL,
    Dimensiones VARCHAR(50),
    Costo DECIMAL(10,2) NOT NULL,
    Estado ENUM('En tránsito', 'Entregado', 'Devuelto', 'Extraviado') DEFAULT 'En tránsito',
    FechaEnvio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FechaEntrega DATETIME,
    TransportistaID INT,
    IdSedeOrigen INT NOT NULL,
    IdSedeDestino INT NOT NULL,
    FOREIGN KEY (RemitenteID) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (DestinatarioID) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (TransportistaID) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdSedeOrigen) REFERENCES Sedes(IdSede),
    FOREIGN KEY (IdSedeDestino) REFERENCES Sedes(IdSede)
);

INSERT INTO Paqueteria (PaqueteID, RemitenteID, DestinatarioID, Origen, Destino, Peso, Dimensiones, Costo, Estado, FechaEnvio, FechaEntrega, TransportistaID, IdSedeOrigen, IdSedeDestino) VALUES
(01, 10, 25, 'Ciudad A', 'Ciudad B', 3.50, '30x20x10', 120.50, 'En tránsito', NOW(), NULL, 2, 1, 3),
(02, 5, 14, 'Ciudad C', 'Ciudad D', 2.20, '25x15x10', 95.00, 'Entregado', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 4 DAY, 4, 2, 4),
(03, 7, 12, 'Ciudad B', 'Ciudad A', 4.75, '40x30x20', 140.00, 'Devuelto', NOW() - INTERVAL 10 DAY, NOW() - INTERVAL 7 DAY, 1, 3, 1),
(04, 22, 9, 'Ciudad D', 'Ciudad C', 1.80, '20x20x20', 70.00, 'Extraviado', NOW() - INTERVAL 5 DAY, NULL, 6, 4, 2),
(05, 30, 8, 'Ciudad A', 'Ciudad D', 6.30, '35x25x15', 160.00, 'En tránsito', NOW(), NULL, 8, 1, 4),
(06, 3, 45, 'Ciudad B', 'Ciudad C', 3.00, '28x18x12', 110.00, 'Entregado', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 3, 2, 3),
(07, 15, 33, 'Ciudad C', 'Ciudad A', 2.90, '22x22x15', 105.00, 'En tránsito', NOW(), NULL, 7, 3, 1),
(08, 27, 21, 'Ciudad D', 'Ciudad B', 5.40, '45x35x25', 180.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 5 DAY, 1, 4, 2),
(09, 6, 19, 'Ciudad A', 'Ciudad C', 2.50, '30x30x15', 100.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, 5, 1, 3),
(10, 13, 7, 'Ciudad B', 'Ciudad D', 4.10, '33x22x18', 135.00, 'En tránsito', NOW(), NULL, 9, 2, 4),
(11, 11, 41, 'Ciudad C', 'Ciudad B', 2.75, '25x25x10', 90.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 6 DAY, 2, 3, 2),
(12, 18, 16, 'Ciudad D', 'Ciudad A', 5.90, '50x30x20', 175.00, 'En tránsito', NOW(), NULL, 4, 4, 1),
(13, 29, 20, 'Ciudad A', 'Ciudad C', 3.60, '28x28x28', 115.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 1 DAY, 6, 1, 3),
(14, 2, 5, 'Ciudad B', 'Ciudad A', 2.10, '20x15x10', 85.00, 'Extraviado', NOW() - INTERVAL 12 DAY, NULL, 3, 2, 1),
(15, 17, 32, 'Ciudad C', 'Ciudad D', 6.80, '40x40x40', 195.00, 'Entregado', NOW() - INTERVAL 10 DAY, NOW() - INTERVAL 6 DAY, 8, 3, 4),
(16, 23, 13, 'Ciudad D', 'Ciudad B', 4.25, '32x32x20', 130.00, 'En tránsito', NOW(), NULL, 10, 4, 2),
(17, 4, 36, 'Ciudad A', 'Ciudad C', 3.95, '35x30x25', 145.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 7, 1, 3),
(18, 12, 11, 'Ciudad B', 'Ciudad D', 1.50, '20x20x10', 75.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 1, 2, 4),
(19, 9, 27, 'Ciudad C', 'Ciudad A', 3.35, '28x28x20', 108.00, 'Extraviado', NOW() - INTERVAL 8 DAY, NULL, 6, 3, 1),
(20, 26, 6, 'Ciudad D', 'Ciudad B', 5.60, '40x35x30', 165.00, 'En tránsito', NOW(), NULL, 5, 4, 2),
(21, 8, 23, 'Ciudad A', 'Ciudad C', 2.85, '27x27x15', 98.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 1 DAY, 3, 1, 3),
(22, 19, 24, 'Ciudad B', 'Ciudad D', 6.00, '45x30x30', 170.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 6 DAY, 4, 2, 4),
(23, 31, 2, 'Ciudad C', 'Ciudad B', 3.10, '30x25x20', 115.00, 'Entregado', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 2, 3, 2),
(24, 34, 10, 'Ciudad D', 'Ciudad A', 2.95, '25x25x15', 105.00, 'En tránsito', NOW(), NULL, 9, 4, 1),
(25, 1, 37, 'Ciudad A', 'Ciudad C', 3.85, '35x30x25', 125.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 4 DAY, 7, 1, 3),
(26, 16, 18, 'Ciudad B', 'Ciudad A', 4.50, '38x28x22', 138.00, 'Extraviado', NOW() - INTERVAL 5 DAY, NULL, 10, 2, 1),
(27, 20, 35, 'Ciudad C', 'Ciudad D', 3.40, '33x22x18', 132.00, 'En tránsito', NOW(), NULL, 2, 3, 4),
(28, 14, 44, 'Ciudad D', 'Ciudad B', 5.75, '50x35x25', 190.00, 'Entregado', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 6, 4, 2),
(29, 24, 26, 'Ciudad A', 'Ciudad C', 3.30, '30x30x15', 120.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 5 DAY, 1, 1, 3),
(30, 33, 17, 'Ciudad B', 'Ciudad D', 2.60, '28x28x20', 100.00, 'En tránsito', NOW(), NULL, 3, 2, 4),
(31, 21, 29, 'Ciudad C', 'Ciudad A', 4.70, '40x30x30', 150.00, 'Extraviado', NOW() - INTERVAL 6 DAY, NULL, 4, 3, 1),
(32, 25, 15, 'Ciudad D', 'Ciudad B', 3.90, '35x25x25', 140.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 2 DAY, 5, 4, 2),
(33, 17, 30, 'Ciudad A', 'Ciudad C', 2.70, '25x25x15', 95.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 3 DAY, 7, 1, 3),
(34, 6, 40, 'Ciudad B', 'Ciudad A', 4.00, '38x28x20', 130.00, 'En tránsito', NOW(), NULL, 8, 2, 1),
(35, 28, 22, 'Ciudad C', 'Ciudad D', 5.20, '45x30x25', 165.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 9, 3, 4),
(36, 32, 39, 'Ciudad D', 'Ciudad B', 3.25, '30x20x20', 118.00, 'Devuelto', NOW() - INTERVAL 10 DAY, NOW() - INTERVAL 6 DAY, 10, 4, 2),
(37, 36, 4, 'Ciudad A', 'Ciudad C', 2.80, '27x27x18', 99.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 3, 1, 3),
(38, 35, 31, 'Ciudad B', 'Ciudad D', 3.65, '32x28x20', 125.00, 'En tránsito', NOW(), NULL, 1, 2, 4),
(39, 38, 28, 'Ciudad C', 'Ciudad A', 4.85, '40x35x30', 155.00, 'Extraviado', NOW() - INTERVAL 8 DAY, NULL, 6, 3, 1),
(40, 39, 43, 'Ciudad D', 'Ciudad B', 5.10, '45x40x25', 185.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 5 DAY, 2, 4, 2),
(41, 40, 42, 'Ciudad A', 'Ciudad C', 3.45, '33x30x20', 127.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 2 DAY, 5, 1, 3),
(42, 41, 34, 'Ciudad B', 'Ciudad A', 2.95, '25x25x18', 104.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 3 DAY, 7, 2, 1),
(43, 42, 38, 'Ciudad C', 'Ciudad D', 3.20, '30x28x22', 119.00, 'En tránsito', NOW(), NULL, 4, 3, 4),
(44, 43, 46, 'Ciudad D', 'Ciudad B', 4.15, '38x30x20', 136.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 10, 4, 2),
(45, 44, 47, 'Ciudad A', 'Ciudad C', 2.65, '24x20x15', 88.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 8, 1, 3),
(46, 45, 48, 'Ciudad B', 'Ciudad A', 5.35, '50x35x30', 172.00, 'En tránsito', NOW(), NULL, 9, 2, 1),
(47, 46, 49, 'Ciudad C', 'Ciudad D', 3.85, '33x25x25', 123.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 3, 3, 4),
(48, 47, 50, 'Ciudad D', 'Ciudad B', 2.40, '22x22x18', 92.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 2 DAY, 1, 4, 2),
(49, 48, 1, 'Ciudad A', 'Ciudad C', 4.60, '38x30x28', 149.00, 'Entregado', NOW() - INTERVAL 6 DAY, NOW(), 6, 1, 3),
(50, 49, 3, 'Ciudad B', 'Ciudad A', 3.15, '30x30x20', 112.00, 'Extraviado', NOW() - INTERVAL 7 DAY, NULL, 7, 2, 1);
(51, 50, 2, 'Ciudad C', 'Ciudad D', 3.60, '28x20x20', 114.00, 'En tránsito', NOW(), NULL, 5, 3, 4),
(52, 1, 4, 'Ciudad D', 'Ciudad B', 4.20, '35x25x22', 130.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 2, 4, 2),
(53, 2, 6, 'Ciudad A', 'Ciudad C', 3.00, '30x25x18', 110.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW(), 7, 1, 3),
(54, 3, 8, 'Ciudad B', 'Ciudad A', 2.50, '25x25x15', 90.00, 'Extraviado', NOW() - INTERVAL 9 DAY, NULL, 3, 2, 1),
(55, 4, 10, 'Ciudad C', 'Ciudad D', 4.85, '40x30x25', 150.00, 'En tránsito', NOW(), NULL, 6, 3, 4),
(56, 5, 12, 'Ciudad D', 'Ciudad B', 2.95, '28x22x18', 108.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 3 DAY, 9, 4, 2),
(57, 6, 14, 'Ciudad A', 'Ciudad C', 3.25, '32x25x20', 118.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 1, 1, 3),
(58, 7, 16, 'Ciudad B', 'Ciudad A', 2.65, '24x24x20', 96.00, 'En tránsito', NOW(), NULL, 10, 2, 1),
(59, 8, 18, 'Ciudad C', 'Ciudad D', 5.10, '40x35x30', 160.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 8, 3, 4),
(60, 9, 20, 'Ciudad D', 'Ciudad B', 3.75, '33x30x22', 124.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW(), 4, 4, 2),
(61, 10, 22, 'Ciudad A', 'Ciudad C', 3.40, '28x28x20', 115.00, 'En tránsito', NOW(), NULL, 5, 1, 3),
(62, 11, 24, 'Ciudad B', 'Ciudad A', 4.00, '35x30x25', 135.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 4 DAY, 2, 2, 1),
(63, 12, 26, 'Ciudad C', 'Ciudad D', 2.85, '27x25x15', 100.00, 'Extraviado', NOW() - INTERVAL 7 DAY, NULL, 6, 3, 4),
(64, 13, 28, 'Ciudad D', 'Ciudad B', 4.30, '38x30x25', 145.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 3, 4, 2),
(65, 14, 30, 'Ciudad A', 'Ciudad C', 3.95, '34x30x20', 122.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 9, 1, 3),
(66, 15, 32, 'Ciudad B', 'Ciudad A', 2.90, '26x25x18', 98.00, 'En tránsito', NOW(), NULL, 7, 2, 1),
(67, 16, 34, 'Ciudad C', 'Ciudad D', 5.50, '45x35x30', 170.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 3 DAY, 10, 3, 4),
(68, 17, 36, 'Ciudad D', 'Ciudad B', 3.60, '30x28x20', 112.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 1, 4, 2),
(69, 18, 38, 'Ciudad A', 'Ciudad C', 2.70, '28x24x18', 102.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 5, 1, 3),
(70, 19, 40, 'Ciudad B', 'Ciudad A', 4.10, '35x30x20', 130.00, 'En tránsito', NOW(), NULL, 8, 2, 1),
(71, 20, 42, 'Ciudad C', 'Ciudad D', 3.35, '29x26x22', 110.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 4 DAY, 2, 3, 4),
(72, 21, 44, 'Ciudad D', 'Ciudad B', 4.50, '38x32x28', 148.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 3, 4, 2),
(73, 22, 46, 'Ciudad A', 'Ciudad C', 3.00, '30x30x25', 120.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 6, 1, 3),
(74, 23, 48, 'Ciudad B', 'Ciudad A', 2.80, '27x27x20', 105.00, 'En tránsito', NOW(), NULL, 7, 2, 1),
(75, 24, 50, 'Ciudad C', 'Ciudad D', 5.25, '42x35x30', 162.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() -
(78, 27, 5, 'Ciudad B', 'Ciudad A', 2.95, '25x25x20', 101.00, 'En tránsito', NOW(), NULL, 1, 2, 1),
(79, 28, 7, 'Ciudad C', 'Ciudad D', 4.60, '36x33x29', 144.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 2 DAY, 5, 3, 4),
(80, 29, 9, 'Ciudad D', 'Ciudad B', 3.10, '29x25x20', 110.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 2, 4, 2),
(81, 30, 11, 'Ciudad A', 'Ciudad C', 2.60, '26x23x19', 98.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 3, 1, 3),
(82, 31, 13, 'Ciudad B', 'Ciudad A', 3.90, '34x29x25', 129.00, 'En tránsito', NOW(), NULL, 6, 2, 1),
(83, 32, 15, 'Ciudad C', 'Ciudad D', 5.00, '42x36x30', 160.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 7, 3, 4),
(84, 33, 17, 'Ciudad D', 'Ciudad B', 3.70, '30x27x23', 120.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 8, 4, 2),
(85, 34, 19, 'Ciudad A', 'Ciudad C', 2.85, '27x24x20', 103.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 9, 1, 3),
(86, 35, 21, 'Ciudad B', 'Ciudad A', 4.20, '36x31x28', 138.00, 'En tránsito', NOW(), NULL, 10, 2, 1),
(87, 36, 23, 'Ciudad C', 'Ciudad D', 3.20, '28x26x22', 109.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 2 DAY, 1, 3, 4),
(88, 37, 25, 'Ciudad D', 'Ciudad B', 4.40, '37x32x26', 142.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 4, 4, 2),
(89, 38, 27, 'Ciudad A', 'Ciudad C', 2.75, '25x23x21', 100.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 2, 1, 3),
(90, 39, 29, 'Ciudad B', 'Ciudad A', 3.80, '32x29x24', 124.00, 'En tránsito', NOW(), NULL, 3, 2, 1),
(91, 40, 31, 'Ciudad C', 'Ciudad D', 5.30, '44x38x31', 168.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 6, 3, 4),
(92, 41, 33, 'Ciudad D', 'Ciudad B', 3.55, '29x27x23', 116.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 7, 4, 2),
(93, 42, 35, 'Ciudad A', 'Ciudad C', 2.90, '26x24x22', 105.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 8, 1, 3),
(94, 43, 37, 'Ciudad B', 'Ciudad A', 4.00, '35x30x26', 132.00, 'En tránsito', NOW(), NULL, 9, 2, 1),
(95, 44, 39, 'Ciudad C', 'Ciudad D', 3.10, '28x25x21', 108.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 2 DAY, 10, 3, 4),
(96, 45, 41, 'Ciudad D', 'Ciudad B', 4.60, '39x34x29', 146.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 1, 4, 2),
(97, 46, 43, 'Ciudad A', 'Ciudad C', 2.65, '25x23x20', 99.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 5, 1, 3),
(98, 47, 45, 'Ciudad B', 'Ciudad A', 3.95, '33x30x26', 127.00, 'En tránsito', NOW(), NULL, 2, 2, 1),
(99, 48, 47, 'Ciudad C', 'Ciudad D', 5.15, '43x37x30', 165.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 3, 3, 4),
(100, 49, 49, 'Ciudad D', 'Ciudad B', 3.40, '30x28x24', 115.00, 'Entregado', 
(101, 50, 1, 'Ciudad A', 'Ciudad D', 3.20, '29x25x21', 112.00, 'En tránsito', NOW(), NULL, 1, 1, 4),
(102, 2, 3, 'Ciudad B', 'Ciudad C', 2.80, '27x24x22', 105.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 2, 2, 3),
(103, 4, 5, 'Ciudad C', 'Ciudad B', 3.60, '30x28x24', 120.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 3, 3, 2),
(104, 6, 7, 'Ciudad D', 'Ciudad A', 4.10, '32x30x25', 130.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 3 DAY, 4, 4, 1),
(105, 8, 9, 'Ciudad A', 'Ciudad B', 2.95, '26x24x20', 102.00, 'En tránsito', NOW(), NULL, 5, 1, 2),
(106, 10, 11, 'Ciudad B', 'Ciudad D', 5.00, '38x36x30', 155.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 4 DAY, 6, 2, 4),
(107, 12, 13, 'Ciudad C', 'Ciudad A', 3.30, '28x26x23', 115.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW(), 7, 3, 1),
(108, 14, 15, 'Ciudad D', 'Ciudad C', 3.75, '31x29x25', 122.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 8, 4, 3),
(109, 16, 17, 'Ciudad A', 'Ciudad D', 4.40, '34x32x28', 140.00, 'En tránsito', NOW(), NULL, 9, 1, 4),
(110, 18, 19, 'Ciudad B', 'Ciudad C', 2.60, '25x23x20', 95.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 2 DAY, 10, 2, 3),
(111, 20, 21, 'Ciudad C', 'Ciudad B', 3.90, '30x27x24', 128.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 1, 3, 2),
(112, 22, 23, 'Ciudad D', 'Ciudad A', 3.15, '29x25x22', 110.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 2, 4, 1),
(113, 24, 25, 'Ciudad A', 'Ciudad B', 2.85, '26x24x21', 100.00, 'En tránsito', NOW(), NULL, 3, 1, 2),
(114, 26, 27, 'Ciudad B', 'Ciudad D', 5.20, '39x37x31', 160.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 3 DAY, 4, 2, 4),
(115, 28, 29, 'Ciudad C', 'Ciudad A', 3.40, '28x26x24', 114.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW(), 5, 3, 1),
(116, 30, 31, 'Ciudad D', 'Ciudad C', 3.80, '31x28x25', 125.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 1 DAY, 6, 4, 3),
(117, 32, 33, 'Ciudad A', 'Ciudad D', 4.25, '33x30x26', 135.00, 'En tránsito', NOW(), NULL, 7, 1, 4),
(118, 34, 35, 'Ciudad B', 'Ciudad C', 2.75, '25x24x20', 97.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 8, 2, 3),
(119, 36, 37, 'Ciudad C', 'Ciudad B', 3.60, '30x28x23', 120.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 9, 3, 2),
(120, 38, 39, 'Ciudad D', 'Ciudad A', 3.10, '28x26x22', 109.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 10, 4, 1),
(121, 40, 41, 'Ciudad A', 'Ciudad B', 2.90, '26x25x21', 101.00, 'En tránsito', NOW(), NULL, 1, 1, 2),
(122, 42, 43, 'Ciudad B', 'Ciudad D', 5.35, '40x36x32', 165.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 2, 2, 4),
(123, 44, 45, 'Ciudad C', 'Ciudad A', 3.50, '29x27x24', 117.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 3, 3, 1),
(124, 46, 47, 'Ciudad D', 'Ciudad C', 3.70, '30x28x25', 122.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 4, 4, 3),
(125, 48, 49, 'Ciudad A', 'Ciudad D', 4.15, '32x30x26', 133.00, 'En tránsito', NOW(), NULL, 5, 1, 4),
(126, 1, 2, 'Ciudad B', 'Ciudad C', 2.65, '24x23x20', 94.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 1 DAY, 6, 2, 3),
(127, 3, 4, 'Ciudad C', 'Ciudad B', 3.95, '31x29x25', 126.00, 'Entregado', NOW() - INTERVAL 5 DAY, NOW(), 7, 3, 2),
(128, 5, 6, 'Ciudad D', 'Ciudad A', 3.25, '28x26x22', 113.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 8, 4, 1),
(129, 7, 8, 'Ciudad A', 'Ciudad B', 2.80, '25x24x21', 98.00, 'En tránsito', NOW(), NULL, 9, 1, 2),
(130, 9, 10, 'Ciudad B', 'Ciudad D', 5.10, '38x35x31', 158.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 3 DAY, 10, 2, 4),
(131, 11, 12, 'Ciudad C', 'Ciudad A', 3.45, '29x27x24', 118.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 1, 3, 1),
(132, 13, 14, 'Ciudad D', 'Ciudad C', 3.60, '30x28x25', 121.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 2 DAY, 2, 4, 3),
(133, 15, 16, 'Ciudad A', 'Ciudad D', 4.00, '33x31x27', 132.00, 'En tránsito', NOW(), NULL, 3, 1, 4),
(134, 17, 18, 'Ciudad B', 'Ciudad C', 2.70, '25x24x20', 96.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 4, 2, 3),
(135, 19, 20, 'Ciudad C', 'Ciudad B', 3.70, '30x28x23', 123.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 5, 3, 2),
(136, 21, 22, 'Ciudad D', 'Ciudad A', 3.05, '27x25x22', 108.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 6, 4, 1),
(137, 23, 24, 'Ciudad A', 'Ciudad B', 2.95, '26x25x21', 102.00, 'En tránsito', NOW(), NULL, 7, 1, 2),
(138, 25, 26, 'Ciudad B', 'Ciudad D', 5.25, '39x36x32', 162.00, 'Devuelto', NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 3 DAY, 8, 2, 4),
(139, 27, 28, 'Ciudad C', 'Ciudad A', 3.55, '29x28x24', 116.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 9, 3, 1),
(140, 29, 30, 'Ciudad D', 'Ciudad C', 3.85, '31x29x25', 124.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 10, 4, 3),
(141, 31, 32, 'Ciudad A', 'Ciudad D', 4.20, '33x30x26', 137.00, 'En tránsito', NOW(), NULL, 1, 1, 4),
(142, 33, 34, 'Ciudad B', 'Ciudad C', 2.70, '25x23x20', 95.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 1 DAY, 2, 2, 3),
(143, 35, 36, 'Ciudad C', 'Ciudad B', 3.85, '30x28x23', 125.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 3, 3, 2),
(144, 37, 38, 'Ciudad D', 'Ciudad A', 3.20, '28x26x22', 112.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 4, 4, 1),
(145, 39, 40, 'Ciudad A', 'Ciudad B', 2.85, '25x24x21', 99.00, 'En tránsito', NOW(), NULL, 5, 1, 2),
(146, 41, 42, 'Ciudad B', 'Ciudad D', 5.15, '38x35x31', 159.00, 'Devuelto', NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 3 DAY, 6, 2, 4),
(147, 43, 44, 'Ciudad C', 'Ciudad A', 3.50, '28x26x23', 115.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 7, 3, 1),
(148, 45, 46, 'Ciudad D', 'Ciudad C', 3.65, '30x28x25', 119.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 8, 4, 3),
(149, 47, 48, 'Ciudad A', 'Ciudad D', 4.10, '32x30x26', 131.00, 'En tránsito', NOW(), NULL, 9, 1, 4),
(150, 49, 50, 'Ciudad B', 'Ciudad C', 2.60, '24x23x20', 93.00, 'Devuelto', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 1 DAY, 10, 2, 3);
(151, 1, 3, 'Ciudad C', 'Ciudad D', 3.45, '30x25x23', 118.00, 'En tránsito', NOW(), NULL, 1, 3, 4),
(152, 2, 4, 'Ciudad A', 'Ciudad B', 2.90, '26x22x20', 102.00, 'Entregado', NOW() - INTERVAL 4 DAY, NOW(), 2, 1, 2),
(153, 3, 5, 'Ciudad B', 'Ciudad C', 3.70, '29x27x24', 120.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 2 DAY, 3, 2, 3),
(154, 4, 6, 'Ciudad D', 'Ciudad A', 4.25, '34x30x26', 135.00, 'En tránsito', NOW(), NULL, 4, 4, 1),
(155, 5, 7, 'Ciudad A', 'Ciudad C', 2.75, '25x23x21', 98.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 5, 1, 3),
(156, 6, 8, 'Ciudad C', 'Ciudad B', 3.85, '31x28x25', 125.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 6, 3, 2),
(157, 7, 9, 'Ciudad B', 'Ciudad D', 4.00, '33x31x27', 130.00, 'En tránsito', NOW(), NULL, 7, 2, 4),
(158, 8, 10, 'Ciudad D', 'Ciudad B', 3.30, '28x26x22', 112.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 2 DAY, 8, 4, 2),
(159, 9, 11, 'Ciudad C', 'Ciudad A', 3.60, '30x27x24', 118.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 9, 3, 1),
(160, 10, 12, 'Ciudad A', 'Ciudad D', 3.95, '32x29x26', 128.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 10, 1, 4),
(161, 11, 13, 'Ciudad B', 'Ciudad A', 2.85, '26x24x21', 100.00, 'En tránsito', NOW(), NULL, 1, 2, 1),
(162, 12, 14, 'Ciudad D', 'Ciudad C', 4.15, '33x30x27', 133.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 2, 4, 3),
(163, 13, 15, 'Ciudad C', 'Ciudad B', 3.75, '30x28x25', 122.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 3, 3, 2),
(164, 14, 16, 'Ciudad A', 'Ciudad C', 2.95, '27x25x22', 104.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 1 DAY, 4, 1, 3),
(165, 15, 17, 'Ciudad B', 'Ciudad D', 4.35, '34x32x28', 138.00, 'En tránsito', NOW(), NULL, 5, 2, 4),
(166, 16, 18, 'Ciudad D', 'Ciudad A', 3.50, '29x26x23', 115.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 6, 4, 1),
(167, 17, 19, 'Ciudad C', 'Ciudad B', 3.80, '31x29x24', 124.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 7, 3, 2),
(168, 18, 20, 'Ciudad A', 'Ciudad B', 2.65, '25x23x20', 96.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 8, 1, 2),
(169, 19, 21, 'Ciudad B', 'Ciudad C', 3.40, '28x26x22', 110.00, 'En tránsito', NOW(), NULL, 9, 2, 3),
(170, 20, 22, 'Ciudad D', 'Ciudad A', 4.05, '33x31x27', 132.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 10, 4, 1),
(171, 21, 23, 'Ciudad A', 'Ciudad C', 3.10, '27x25x23', 108.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 1, 1, 3),
(172, 22, 24, 'Ciudad C', 'Ciudad D', 4.20, '34x30x28', 137.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 2, 3, 4),
(173, 23, 25, 'Ciudad B', 'Ciudad A', 2.75, '26x24x21', 99.00, 'En tránsito', NOW(), NULL, 3, 2, 1),
(174, 24, 26, 'Ciudad D', 'Ciudad B', 3.60, '30x27x24', 118.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 1 DAY, 4, 4, 2),
(175, 25, 27, 'Ciudad A', 'Ciudad D', 4.00, '32x30x26', 130.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 5, 1, 4),
(176, 26, 28, 'Ciudad C', 'Ciudad B', 3.25, '28x25x23', 112.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 6, 3, 2),
(177, 27, 29, 'Ciudad B', 'Ciudad C', 3.90, '31x28x25', 127.00, 'En tránsito', NOW(), NULL, 7, 2, 3),
(178, 28, 30, 'Ciudad D', 'Ciudad A', 3.00, '27x26x22', 106.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 1 DAY, 8, 4, 1),
(179, 29, 31, 'Ciudad A', 'Ciudad C', 2.85, '26x24x21', 101.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 9, 1, 3),
(180, 30, 32, 'Ciudad C', 'Ciudad B', 3.55, '30x27x24', 119.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 2 DAY, 10, 3, 2),
(181, 31, 33, 'Ciudad B', 'Ciudad D', 4.10, '33x31x27', 131.00, 'En tránsito', NOW(), NULL, 1, 2, 4),
(182, 32, 34, 'Ciudad D', 'Ciudad C', 3.35, '29x26x23', 113.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 2, 4, 3),
(183, 33, 35, 'Ciudad A', 'Ciudad B', 2.70, '25x24x20', 95.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 3, 1, 2),
(184, 34, 36, 'Ciudad C', 'Ciudad A', 3.65, '30x28x24', 122.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 4, 3, 1),
(185, 35, 37, 'Ciudad B', 'Ciudad C', 3.95, '32x29x25', 128.00, 'En tránsito', NOW(), NULL, 5, 2, 3),
(186, 36, 38, 'Ciudad D', 'Ciudad B', 3.20, '28x25x23', 110.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 6, 4, 2),
(187, 37, 39, 'Ciudad A', 'Ciudad D', 4.30, '34x32x28', 136.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 7, 1, 4),
(188, 38, 40, 'Ciudad C', 'Ciudad B', 3.45, '30x27x24', 118.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 1 DAY, 8, 3, 2),
(189, 39, 41, 'Ciudad B', 'Ciudad A', 2.95, '27x24x22', 103.00, 'En tránsito', NOW(), NULL, 9, 2, 1),
(190, 40, 42, 'Ciudad D', 'Ciudad C', 3.75, '31x28x25', 123.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 10, 4, 3),
(191, 41, 43, 'Ciudad A', 'Ciudad C', 3.10, '27x25x22', 107.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 1, 1, 3),
(192, 42, 44, 'Ciudad C', 'Ciudad D', 4.05, '33x30x27', 132.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 2, 3, 4),
(193, 43, 45, 'Ciudad B', 'Ciudad A', 2.80, '26x24x21', 100.00, 'En tránsito', NOW(), NULL, 3, 2, 1),
(194, 44, 46, 'Ciudad D', 'Ciudad B', 3.60, '30x27x24', 119.00, 'Devuelto', NOW() - INTERVAL 4 DAY, NOW() - INTERVAL 2 DAY, 4, 4, 2),
(195, 45, 47, 'Ciudad A', 'Ciudad D', 3.90, '32x29x25', 126.00, 'Entregado', NOW() - INTERVAL 2 DAY, NOW(), 5, 1, 4),
(196, 46, 48, 'Ciudad C', 'Ciudad B', 3.30, '29x26x23', 114.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 6, 3, 2),
(197, 47, 49, 'Ciudad B', 'Ciudad C', 3.85, '31x28x24', 124.00, 'En tránsito', NOW(), NULL, 7, 2, 3),
(198, 48, 50, 'Ciudad D', 'Ciudad A', 3.00, '27x25x22', 106.00, 'Devuelto', NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 2 DAY, 8, 4, 1),
(199, 49, 1, 'Ciudad A', 'Ciudad C', 3.55, '30x27x24', 120.00, 'Entregado', NOW() - INTERVAL 3 DAY, NOW(), 9, 1, 3),
(200, 50, 2, 'Ciudad C', 'Ciudad B', 3.15, '28x26x22', 111.00, 'Devuelto', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY, 10, 3, 2);