
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

