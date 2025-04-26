INSERT INTO Departamentos (id_departamento,Nombre) VALUES
(001,'Valle del Cauca'),
(002,'Cauca'),
(003,'Nariño'),
(004,'Chocó'),
(005,'Risaralda'),
(006,'Quindío'),
(007,'Caldas'),
(008,'Putumayo');

INSERT INTO Ciudades (id_ciudad,Nombre,id_departamento) VALUES
(001,'Cali',1),
(002,'Popayán',2),
(003,'Pasto',3),
(004,'Quibdó',4),
(005,'Pereira',5),
(006,'Armenia',6),
(007,'Manizales',7),
(008,'Mocoa',8),
(009,'Buenaventura',1),
(010,'Ipiales',3),
(011,'Tuluá',1),
(012,'Palmira',1),
(013,'Santuario',5),
(014,'La Virginia',5),
(015,'Silvia',2),
(016,'Tumaco',3),
(017,'Guapi',2),
(018,'Cartago',1),
(019,'Istmina',4);

INSERT INTO Sedes (id_sede,Nombre,direccion,id_ciudad) VALUES
(001,'Terminal Cali Sur','Carrera 23 #10-55',1),
(002,'Terminal Popayán Norte','Calle 12 #4-78',2),
(003,'Estación Central Pasto','Avenida Colombia #15-10',3),
(004,'Punto de Atención Quibdó','Calle 20 #8-12',4),
(005,'Centro Logístico Pereira','Carrera 7 #45-30',5),
(006,'Terminal Armenia Sur','Diagonal 18 #27-50',6),
(007,'Estación Manizales','Carrera 25 #15-15',7),
(008,'Sucursal Mocoa Centro','Calle 3 #2-20',8);
(009, 'Terminal Buenaventura', 'Carrera 1 #15-23', 9),
(010, 'Sucursal Cartago', 'Calle 8 #10-45', 10),
(011, 'Estación Tuluá', 'Carrera 18 #25-14', 11),
(012, 'Punto de Atención Buga', 'Calle 6 #9-20', 12),
(013, 'Terminal Jamundí', 'Carrera 3 #17-60', 13),
(014, 'Sucursal Ipiales', 'Calle 10 #8-25', 14),
(015, 'Estación Palmira', 'Carrera 14 #11-40', 15),
(016, 'Sucursal La Virginia', 'Calle 7 #6-38', 16),
(017, 'Terminal Montenegro', 'Carrera 5 #4-22', 17),
(018, 'Sucursal Dosquebradas', 'Avenida del Ferrocarril #45-55', 18),
(019, 'Punto de Atención Roldanillo', 'Calle 2 #3-10', 19),
(020, 'Sucursal Yumbo', 'Carrera 7 #15-60', 20),
(021, 'Terminal Zarzal', 'Calle 18 #6-24', 21),
(022, 'Sucursal Sevilla', 'Carrera 20 #19-75', 22),
(023, 'Terminal Calarcá', 'Calle 5 #6-10', 23),
(024, 'Sucursal Santander de Quilichao', 'Carrera 9 #10-33', 24),
(025, 'Estación Guapi', 'Calle 14 #11-45', 25),
(026, 'Sucursal Villa Rica', 'Carrera 12 #13-56', 26),
(027, 'Terminal Tumaco', 'Calle 25 #14-21', 27),
(028, 'Sucursal El Bordo', 'Carrera 10 #8-50', 28),
(029, 'Estación La Plata', 'Calle 4 #3-60', 29),
(030, 'Sucursal Toribío', 'Carrera 1 #2-18', 30);


INSERT INTO Tipo_empresa (id_tipo_empresa,Descripcion) VALUES
(001, 'Transporte Urbano'),
(002, 'Intermunicipal'),
(003, 'Carga Pesada'),
(004, 'Turismo'),
(005, 'Servicios Especiales'),
(006, 'Envíos Rápidos'),
(007, 'Mensajería Empresarial'),
(008, 'Carga Liviana'),
(009, 'Encomiendas Nacionales'),
(010, 'Paquetería Internacional'),
(011, 'Transporte Escolar'),
(012, 'Turismo Aventura'),
(013, 'Transporte de Personal'),
(014, 'Mudanzas'),
(015, 'Logística Empresarial'),
(016, 'Distribución de Documentos'),
(017, 'Carga Refrigerada'),
(018, 'Transporte de Mascotas'),
(019, 'Transporte Ejecutivo'),
(020, 'Transporte Nocturno'),
(021, 'Servicios VIP'),
(022, 'Transporte Rural'),
(023, 'Envío de Muestras Médicas'),
(024, 'Servicios de Courier'),
(025, 'Transporte de Valores'),
(026, 'Logística de Eventos'),
(027, 'Transporte para Turismo Religioso'),
(028, 'Cargas Agroindustriales'),
(029, 'Envíos Ecológicos'),
(030, 'Transporte de Arte y Antigüedades');


INSERT INTO Empresas (id_empresa, Nombre, Telefono, Correo, Direccion, id_tipo_empresa) VALUES
INSERT INTO Empresas (id_empresa, nombre, nit, telefono, id_tipo_empresa, id_sede) VALUES
(001, 'Expreso Occidente S.A.', '900123001', '3124567890', 1, 1),
(002, 'Transportes del Valle LTDA', '900123002', '3107894561', 2, 2),
(003, 'Cargas Surandinas', '900123003', '3112345678', 3, 3),
(004, 'Turismo Pacífico', '900123004', '3004567891', 4, 4),
(005, 'Servicios Especiales Cali', '900123005', '3123456789', 5, 5),
(006, 'Rápido Quindío', '900123006', '3109876543', 6, 6),
(007, 'Mensajería Express Popayán', '900123007', '3012345678', 7, 7),
(008, 'Logística Nariño S.A.S.', '900123008', '3024567890', 8, 8),
(009, 'Envíos Buenaventura Express', '900123009', '3204567891', 9, 9),
(010, 'Paquetería del Litoral', '900123010', '3132345678', 10, 10),
(011, 'TransEscolar del Valle', '900123011', '3120001122', 11, 11),
(012, 'Aventura Travel S.A.S.', '900123012', '3101122334', 12, 12),
(013, 'Personal Transport S.A.', '900123013', '3112233445', 13, 13),
(014, 'Mudanzas Valle Grande', '900123014', '3123344556', 14, 14),
(015, 'Logística Andina S.A.S.', '900123015', '3134455667', 15, 15),
(016, 'Docs Express', '900123016', '3145566778', 16, 16),
(017, 'Fríos del Sur', '900123017', '3156677889', 17, 17),
(018, 'Pet Cargo Services', '900123018', '3167788990', 18, 18),
(019, 'Ejecutivo Plus', '900123019', '3178899001', 19, 19),
(020, 'Rutas Nocturnas', '900123020', '3189900112', 20, 20),
(021, 'VIP Travel Express', '900123021', '3191011123', 21, 21),
(022, 'Transporte Campesino', '900123022', '3101112233', 22, 22),
(023, 'BioEnvía Médica', '900123023', '3112223344', 23, 23),
(024, 'Courier del Sur', '900123024', '3123334455', 24, 24),
(025, 'Seguridad y Transporte Ltda.', '900123025', '3134445566', 25, 25),
(026, 'Eventos Móviles S.A.S.', '900123026', '3145556677', 26, 26),
(027, 'Ruta Mística Travel', '900123027', '3156667788', 27, 27),
(028, 'AgroCargas del Cauca', '900123028', '3167778899', 28, 28),
(029, 'EcoEnvíos Express', '900123029', '3178889900', 29, 29),
(030, 'ArteMovil S.A.S.', '900123030', '3189990011', 30, 30);


INSERT INTO Modulos (id_modulo,Nombre,id_sede) VALUES
(001,'Módulo Occibuses Cali',1),
(002,'Módulo TransAndes Popayán',2),
(003,'Módulo Cafeteros Pasto',3),
(004,'Módulo Pacífico Quibdó',4),
(005,'Módulo CaucaExpress Pereira',5),
(006,'Módulo Putumayo Armenia',6),
(007,'Módulo Chocó Viajero Manizales',7),
(008,'Módulo Risaralda Mocoa',8),
(009,'Módulo Expreso Cafetero Tuluá',9),
(010,'Módulo Valle Rutas Palmira',10),
(011,'Módulo AndesBus Ibagué',11),
(012,'Módulo Suroccidente Florencia',12),
(013,'Módulo Cordillera Tours Tumaco',13),
(014,'Módulo Pereira Travel Cartago',14),
(015,'Módulo Armenia Express Neiva',15),
(016,'Módulo Montaña Azul Ipiales',16),
(017,'Módulo Quindío Bus Buga',17),
(018,'Módulo Tuluá Transportes Leticia',18),
(019,'Módulo Palmira Móvil Guapi',19),
(020,'Módulo Nariño Rutas Mitú',20),
(021,'Módulo Pacífico Viajero Timbiquí',21),
(022,'Módulo Occidente Travel La Plata',22),
(023,'Módulo Transportes Bolívar Candelaria',23),
(024,'Módulo InterCauca La Virginia',24),
(025,'Módulo ZonaSur Buses Santander Quilichao',25),
(026,'Módulo Rutas del Chocó Puerto Asís',26),
(027,'Módulo Expreso Nariñense San Vicente',27),
(028,'Módulo Putumayo Travel Puerto Leguízamo',28),
(029,'Módulo Amazonía Express Pitalito',29),
(030,'Módulo Occidental Buses Cali',30);


INSERT INTO Tipo_empleado (id_tipo_empleado, Nombre, Descripcion)  

VALUES  

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

INSERT INTO empleados (cedula_empleado, Nombres, Apellidos, Telefono, correo, id_ciudad_origen, id_ciudad_residencia, id_tipo_empleado, id_Sede) VALUES
(100001, 'Andrés', 'Valencia', '3101234567', 'andres.valencia@empresa.com', 1, 2, 1, 1),
(100002, 'Paola', 'Muñoz', '3112345678', 'paola.munoz@empresa.com', 3, 4, 2, 2),
(100003, 'Luis', 'Cardona', '3123456789', 'luis.cardona@empresa.com', 5, 6, 3, 3),
(100004, 'Natalia', 'Ríos', '3134567890', 'natalia.rios@empresa.com', 7, 8, 4, 4),
(100005, 'Santiago', 'López', '3145678901', 'santiago.lopez@empresa.com', 9, 10, 5, 5),
(100006, 'Juliana', 'Castaño', '3156789012', 'juliana.castano@empresa.com', 11, 12, 6, 6),
(100007, 'Camilo', 'Mosquera', '3167890123', 'camilo.mosquera@empresa.com', 13, 14, 1, 7),
(100008, 'Andrea', 'Salazar', '3178901234', 'andrea.salazar@empresa.com', 15, 16, 2, 8),
(100009, 'Jorge', 'González', '3189012345', 'jorge.gonzalez@empresa.com', 17, 18, 3, 9),
(100010, 'Mariana', 'Ramírez', '3190123456', 'mariana.ramirez@empresa.com', 19, 20, 4, 10),
(100011, 'Daniel', 'Herrera', '3102233445', 'daniel.herrera@empresa.com', 21, 22, 5, 11),
(100012, 'Laura', 'Gutiérrez', '3113344556', 'laura.gutierrez@empresa.com', 23, 24, 6, 12),
(100013, 'Sebastián', 'Martínez', '3124455667', 'sebastian.martinez@empresa.com', 25, 26, 1, 13),
(100014, 'Valeria', 'Morales', '3135566778', 'valeria.morales@empresa.com', 27, 28, 2, 14),
(100015, 'Juan', 'Pineda', '3146677889', 'juan.pineda@empresa.com', 29, 30, 3, 15),
(100016, 'Catalina', 'Castillo', '3157788990', 'catalina.castillo@empresa.com', 1, 3, 4, 16),
(100017, 'Carlos', 'Ortiz', '3168899001', 'carlos.ortiz@empresa.com', 4, 5, 5, 17),
(100018, 'Luisa', 'Mejía', '3179900112', 'luisa.mejia@empresa.com', 6, 7, 6, 18),
(100019, 'Fernando', 'Córdoba', '3180011223', 'fernando.cordoba@empresa.com', 8, 9, 1, 19),
(100020, 'Diana', 'Nieto', '3191122334', 'diana.nieto@empresa.com', 10, 11, 2, 20),
(100021, 'Mateo', 'Zapata', '3102233445', 'mateo.zapata@empresa.com', 12, 13, 3, 21),
(100022, 'Sara', 'Benítez', '3113344556', 'sara.benitez@empresa.com', 14, 15, 4, 22),
(100023, 'Esteban', 'Mendoza', '3124455667', 'esteban.mendoza@empresa.com', 16, 17, 5, 23),
(100024, 'Manuela', 'Rodríguez', '3135566778', 'manuela.rodriguez@empresa.com', 18, 19, 6, 24),
(100025, 'Pedro', 'Quintero', '3146677889', 'pedro.quintero@empresa.com', 20, 21, 1, 25),
(100026, 'Carolina', 'Bermúdez', '3157788990', 'carolina.bermudez@empresa.com', 22, 23, 2, 26),
(100027, 'David', 'Ruiz', '3168899001', 'david.ruiz@empresa.com', 24, 25, 3, 27),
(100028, 'Sofía', 'Roldán', '3179900112', 'sofia.roldan@empresa.com', 26, 27, 4, 28),
(100029, 'Felipe', 'Vargas', '3180011223', 'felipe.vargas@empresa.com', 28, 29, 5, 29),
(100030, 'Isabella', 'Navarro', '3191122334', 'isabella.navarro@empresa.com', 30, 1, 6, 30);




INSERT INTO Tipo_bus (id_tipo_bus, Nombre) VALUES
(001, 'Microbús Urbano'),
(002, 'Bus Intermunicipal'),
(003, 'Bus de Turismo'),
(004, 'Bus Escolar'),
(005, 'Bus Articulado'),
(006, 'Busetón'),
(007, 'Minibús'),
(008, 'Bus Ejecutivo'),
(009, 'Bus Colectivo'),
(010, 'Bus Transversal'),
(011, 'Bus Panorámico'),
(012, 'Bus de Relevo'),
(013, 'Bus Rural'),
(014, 'Bus Estándar'),
(015, 'Bus de Lujo'),
(016, 'Bus Expreso'),
(017, 'Bus Adaptado'),
(018, 'Bus Escolar Rural'),
(019, 'Bus Mixto'),
(020, 'Bus Comunitario'),
(021, 'Bus de Montaña'),
(022, 'Bus de Servicio Especial'),
(023, 'Bus a Gas'),
(024, 'Bus Eléctrico'),
(025, 'Bus de Carga Ligera'),
(026, 'Bus Doble Piso'),
(027, 'Bus de Pasajeros Rural'),
(028, 'Bus de Largo Recorrido'),
(029, 'Bus Refrigerado'),
(030, 'Bus Híbrido');



INSERT INTO Buses (placa, Modelo, capacidad, id_tipo_bus, id_empresa) VALUES
('OCC001', 2015, 40, 1, 1),
('OCC002', 2017, 45, 2, 2),
('OCC003', 2019, 38, 3, 3),
('OCC004', 2020, 50, 4, 4),
('OCC005', 2018, 44, 5, 5),
('OCC006', 2016, 42, 6, 6),
('OCC007', 2022, 48, 7, 7),
('OCC008', 2021, 36, 8, 8),
('OCC009', 2020, 47, 9, 9),
('OCC010', 2019, 49, 10, 10),
('OCC011', 2018, 35, 11, 11),
('OCC012', 2020, 50, 12, 12),
('OCC013', 2021, 52, 13, 13),
('OCC014', 2022, 33, 14, 14),
('OCC015', 2017, 40, 15, 15),
('OCC016', 2016, 38, 16, 16),
('OCC017', 2023, 55, 17, 17),
('OCC018', 2019, 46, 18, 18),
('OCC019', 2021, 42, 19, 19),
('OCC020', 2020, 37, 20, 20),
('OCC021', 2018, 50, 21, 21),
('OCC022', 2017, 39, 22, 22),
('OCC023', 2022, 45, 23, 23),
('OCC024', 2021, 46, 24, 24),
('OCC025', 2015, 40, 25, 25),
('OCC026', 2023, 56, 26, 26),
('OCC027', 2022, 38, 27, 27),
('OCC028', 2020, 43, 28, 28),
('OCC029', 2019, 41, 29, 29),
('OCC030', 2023, 60, 30, 30);


INSERT INTO Tipo_mantenimiento (id_tipo_mantenimiento, descripcion) VALUES
(001, 'Cambio de aceite'),
(002, 'Revisión de frenos'),
(003, 'Alineación y balanceo'),
(004, 'Cambio de llantas'),
(005, 'Revisión de suspensión'),
(006, 'Cambio de filtros'),
(007, 'Ajuste de motor'),
(008, 'Mantenimiento del sistema eléctrico'),
(009, 'Revisión de luces'),
(010, 'Cambio de batería'),
(011, 'Lavado de inyectores'),
(012, 'Cambio de correas'),
(013, 'Revisión de transmisión'),
(014, 'Mantenimiento de aire acondicionado'),
(015, 'Engrase general'),
(016, 'Revisión de dirección hidráulica'),
(017, 'Inspección técnico-mecánica'),
(018, 'Cambio de bujías'),
(019, 'Chequeo de sistema ABS'),
(020, 'Sincronización de motor'),
(021, 'Mantenimiento preventivo'),
(022, 'Cambio de pastillas de freno'),
(023, 'Ajuste de válvulas'),
(024, 'Chequeo de sensores'),
(025, 'Revisión de sistema de escape'),
(026, 'Calibración de neumáticos'),
(027, 'Cambio de líquido de frenos'),
(028, 'Mantenimiento del sistema de refrigeración'),
(029, 'Revisión de catalizador'),
(030, 'Revisión general anual');


INSERT INTO Mantenimientos (id_mantenimiento, fecha, costo, id_tipo_mantenimiento, id_empresa) VALUES
(001, '2024-01-10', 250000, 1, 1),
(002, '2024-01-12', 180000, 2, 2),
(003, '2024-01-15', 200000, 3, 3),
(004, '2024-01-18', 600000, 4, 4),
(005, '2024-01-20', 350000, 5, 5),
(006, '2024-01-25', 220000, 6, 6),
(007, '2024-01-28', 800000, 7, 7),
(008, '2024-02-01', 400000, 8, 8),
(009, '2024-02-03', 100000, 9, 9),
(010, '2024-02-06', 300000, 10, 10),
(011, '2024-02-09', 450000, 11, 11),
(012, '2024-02-11', 280000, 12, 12),
(013, '2024-02-15', 650000, 13, 13),
(014, '2024-02-18', 480000, 14, 14),
(015, '2024-02-22', 230000, 15, 15),
(016, '2024-02-26', 410000, 16, 16),
(017, '2024-03-01', 120000, 17, 17),
(018, '2024-03-03', 270000, 18, 18),
(019, '2024-03-06', 390000, 19, 19),
(020, '2024-03-09', 520000, 20, 20),
(021, '2024-03-12', 310000, 21, 21),
(022, '2024-03-15', 240000, 22, 22),
(023, '2024-03-18', 360000, 23, 23),
(024, '2024-03-21', 150000, 24, 24),
(025, '2024-03-25', 280000, 25, 25),
(026, '2024-03-27', 170000, 26, 26),
(027, '2024-03-29', 260000, 27, 27),
(028, '2024-04-01', 330000, 28, 28),
(029, '2024-04-03', 290000, 29, 29),
(030, '2024-04-05', 500000, 30, 30);


INSERT INTO Seguro (id_seguro, nombre) VALUES
(001, 'Occiseguro Cali'),
(002, 'Protección Nariño'),
(003, 'Andina Seguros'),
(004, 'Occidente Protegido'),
(005, 'Seguros del Valle'),
(006, 'Confiseguro'),
(007, 'Caucana de Seguros'),
(008, 'Quindío Asistencia'),
(009, 'Risaralda Protege'),
(010, 'Putumayo Seguro'),
(011, 'Chocó Previsiones'),
(012, 'Nariño Total'),
(013, 'Popayán Seguro'),
(014, 'Pacífico Vida'),
(015, 'Seguros Santuario'),
(016, 'Manizales Protegido'),
(017, 'Armenia Asistencia'),
(018, 'Pasto Protección'),
(019, 'Cali Segura'),
(020, 'Tuluá Previene'),
(021, 'Buenaventura Asistencia'),
(022, 'Jamundí Protegido'),
(023, 'Palmira Seguro'),
(024, 'Cartago Vida'),
(025, 'Ipiales Seguro Total'),
(026, 'Guapi Seguro'),
(027, 'La Virginia Protege'),
(028, 'Sevilla Segura'),
(029, 'Yumbo Protección'),
(030, 'Roldanillo Seguro');

INSERT INTO Destinos (id_destino, nombre) VALUES
(001, 'Cali Centro'),
(002, 'Popayán Colonial'),
(003, 'Pasto Urbano'),
(004, 'Quibdó Río Atrato'),
(005, 'Pereira Industrial'),
(006, 'Armenia Cafetera'),
(007, 'Manizales Panorama'),
(008, 'Mocoa Natural'),
(009, 'Buenaventura Puerto'),
(010, 'Ipiales Frontera'),
(011, 'Tuluá Comercial'),
(012, 'Palmira Universitaria'),
(013, 'Santuario Campestre'),
(014, 'La Virginia Fluvial'),
(015, 'Silvia Indígena'),
(016, 'Tumaco Costero'),
(017, 'Guapi Tradicional'),
(018, 'Cartago Histórico'),
(019, 'Istmina Tropical'),
(020, 'Jamundí Residencial'),
(021, 'Sevilla Mirador'),
(022, 'Yumbo Industrial'),
(023, 'Calarcá Jardín Botánico'),
(024, 'Santander de Quilichao Central'),
(025, 'Roldanillo Cultural'),
(026, 'Zarzal Agroindustrial'),
(027, 'Dosquebradas Moderna'),
(028, 'Montenegro Parque del Café'),
(029, 'El Bordo Cauca'),
(030, 'Puerto Asís Putumayo');
 
INSERT INTO Rutas (id_ruta, nombre, tipo_transporte) VALUES
(001, 'Cali - Popayán', 'Terrestre'),
(002, 'Pasto - Ipiales', 'Terrestre'),
(003, 'Pereira - Manizales', 'Terrestre'),
(004, 'Armenia - Cali', 'Terrestre'),
(005, 'Buenaventura - Tuluá', 'Terrestre'),
(006, 'Palmira - Buga', 'Terrestre'),
(007, 'Cartago - Pereira', 'Terrestre'),
(008, 'Popayán - Santander de Quilichao', 'Terrestre'),
(009, 'Jamundí - Cali', 'Terrestre'),
(010, 'Tulúa - Palmira', 'Terrestre'),
(011, 'Guapi - Popayán', 'Mixto'),
(012, 'Quibdó - Istmina', 'Terrestre'),
(013, 'La Virginia - Pereira', 'Terrestre'),
(014, 'Santuario - Armenia', 'Terrestre'),
(015, 'Sevilla - Zarzal', 'Terrestre'),
(016, 'Dosquebradas - Manizales', 'Terrestre'),
(017, 'Montenegro - Calarcá', 'Terrestre'),
(018, 'Mocoa - Puerto Asís', 'Terrestre'),
(019, 'Yumbo - Cali', 'Terrestre'),
(020, 'Jamundí - Palmira', 'Terrestre'),
(021, 'Roldanillo - Cartago', 'Terrestre'),
(022, 'Zarzal - Bugalagrande', 'Terrestre'),
(023, 'Ipiales - Túquerres', 'Terrestre'),
(024, 'Tumaco - Pasto', 'Terrestre'),
(025, 'Cali - Buenaventura', 'Terrestre'),
(026, 'Pasto - Mocoa', 'Terrestre'),
(027, 'Popayán - Silvia', 'Terrestre'),
(028, 'Guapi - Timbiquí', 'Fluvial'),
(029, 'Puerto Asís - Orito', 'Terrestre'),
(030, 'Pereira - Armenia', 'Terrestre');
  

INSERT INTO Detalle_Destinos_Rutas (id_ruta, id_destino, orden) VALUES
(001, 001, 1), (001, 002, 2),
(002, 018, 1), (002, 010, 2),
(003, 005, 1), (003, 007, 2),
(004, 006, 1), (004, 001, 2),
(005, 009, 1), (005, 011, 2),
(006, 012, 1), (006, 011, 2),
(007, 008, 1), (007, 005, 2),
(008, 002, 1), (008, 024, 2),
(009, 020, 1), (009, 001, 2),
(010, 011, 1), (010, 012, 2),
(011, 017, 1), (011, 002, 2),
(012, 013, 1), (012, 019, 2),
(013, 014, 1), (013, 005, 2),
(014, 013, 1), (014, 006, 2),
(015, 021, 1), (015, 026, 2),
(016, 027, 1), (016, 007, 2),
(017, 028, 1), (017, 023, 2),
(018, 008, 1), (018, 030, 2),
(019, 029, 1), (019, 001, 2),
(020, 020, 1), (020, 012, 2),
(021, 025, 1), (021, 008, 2),
(022, 026, 1), (022, 015, 2),
(023, 010, 1), (023, 018, 2),
(024, 016, 1), (024, 018, 2),
(025, 001, 1), (025, 009, 2),
(026, 018, 1), (026, 008, 2),
(027, 002, 1), (027, 015, 2),
(028, 017, 1), (028, 028, 2),
(029, 030, 1), (029, 030, 2),
(030, 005, 1), (030, 006, 2);


INSERT INTO Detalle_Buses_Rutas (id_ruta, placa_bus) VALUES
(001, 'ABC-001'),
(002, 'ABC-002'),
(003, 'ABC-003'),
(004, 'ABC-004'),
(005, 'ABC-005'),
(006, 'ABC-006'),
(007, 'ABC-007'),
(008, 'ABC-008'),
(009, 'ABC-009'),
(010, 'ABC-010'),
(011, 'ABC-001'),
(012, 'ABC-002'),
(013, 'ABC-003'),
(014, 'ABC-004'),
(015, 'ABC-005'),
(016, 'ABC-006'),
(017, 'ABC-007'),
(018, 'ABC-008'),
(019, 'ABC-009'),
(020, 'ABC-010'),
(021, 'ABC-001'),
(022, 'ABC-002'),
(023, 'ABC-003'),
(024, 'ABC-004'),
(025, 'ABC-005'),
(026, 'ABC-006'),
(027, 'ABC-007'),
(028, 'ABC-008'),
(029, 'ABC-009'),
(030, 'ABC-010');
 

INSERT INTO paradas_intermedias (id_parada, Nombre_parada, id_ciudad) VALUES  

(001, 'Jamundí', 1), (001, 'Puerto Tejada', 2),
(002, 'Túquerres', 1), (002, 'Pupiales', 2),
(003, 'Santa Rosa de Cabal', 1), (003, 'Chinchiná', 2),
(004, 'La Tebaida', 1), (004, 'El Cerrito', 2),
(005, 'Zarzal', 1), (005, 'Sevilla', 2),
(006, 'Florida', 1), (006, 'Candelaria', 2),
(007, 'La Virginia', 1), (007, 'Belén de Umbría', 2),
(008, 'Cajibío', 1), (008, 'Piendamó', 2),
(009, 'La Buitrera', 1), (009, 'Villa Rica', 2),
(010, 'Andalucía', 1), (010, 'La Victoria', 2),
(011, 'El Bordo', 1), (011, 'Patía', 2),
(012, 'Bajo Baudó', 1), (012, 'Nóvita', 2),
(013, 'Marsella', 1), (013, 'Balboa', 2),
(014, 'Filandia', 1), (014, 'Circasia', 2),
(015, 'La Unión', 1), (015, 'Toro', 2),
(016, 'Santa Rosa', 1), (016, 'Villamaría', 2),
(017, 'Quimbaya', 1), (017, 'Génova', 2),
(018, 'Villagarzón', 1), (018, 'Sibundoy', 2),
(019, 'La Dolores', 1), (019, 'Candelaria', 2),
(020, 'Puerto Tejada', 1), (020, 'Corinto', 2),
(021, 'La Unión', 1), (021, 'El Dovio', 2),
(022, 'Trujillo', 1), (022, 'Roldanillo', 2),
(023, 'Sandoná', 1), (023, 'Consacá', 2),
(024, 'El Charco', 1), (024, 'Barbacoas', 2),
(025, 'Dagua', 1), (025, 'Loboguerrero', 2),
(026, 'Puerto Caicedo', 1), (026, 'Sibundoy', 2),
(027, 'Totoró', 1), (027, 'Inzá', 2),
(028, 'Santa Bárbara de Iscuandé', 1), (028, 'El Charco', 2),
(029, 'Puerto Guzmán', 1), (029, 'Puerto Caicedo', 2),
(030, 'Circasia', 1), (030, 'Calarcá', 2);
  

INSERT INTO Viaje (id_viaje, cedula_cliente, id_ruta, placa_bus, fecha, hora_salida) VALUES
(001, 100000001, 001, 'ABC-001', '2025-04-01', '08:00'),
(002, 100000002, 002, 'ABC-002', '2025-04-01', '09:00'),
(003, 100000003, 003, 'ABC-003', '2025-04-02', '10:00'),
(004, 100000004, 004, 'ABC-004', '2025-04-02', '11:00'),
(005, 100000005, 005, 'ABC-005', '2025-04-03', '08:30'),
(006, 100000006, 006, 'ABC-006', '2025-04-03', '09:30'),
(007, 100000007, 007, 'ABC-007', '2025-04-04', '10:30'),
(008, 100000008, 008, 'ABC-008', '2025-04-04', '11:30'),
(009, 100000009, 009, 'ABC-009', '2025-04-05', '08:45'),
(010, 100000010, 010, 'ABC-010', '2025-04-05', '09:45'),
(011, 100000011, 011, 'ABC-001', '2025-04-06', '10:15'),
(012, 100000012, 012, 'ABC-002', '2025-04-06', '11:15'),
(013, 100000013, 013, 'ABC-003', '2025-04-07', '12:00'),
(014, 100000014, 014, 'ABC-004', '2025-04-07', '13:00'),
(015, 100000015, 015, 'ABC-005', '2025-04-08', '08:00'),
(016, 100000016, 016, 'ABC-006', '2025-04-08', '09:00'),
(017, 100000017, 017, 'ABC-007', '2025-04-09', '10:00'),
(018, 100000018, 018, 'ABC-008', '2025-04-09', '11:00'),
(019, 100000019, 019, 'ABC-009', '2025-04-10', '08:30'),
(020, 100000020, 020, 'ABC-010', '2025-04-10', '09:30'),
(021, 100000021, 021, 'ABC-001', '2025-04-11', '10:30'),
(022, 100000022, 022, 'ABC-002', '2025-04-11', '11:30'),
(023, 100000023, 023, 'ABC-003', '2025-04-12', '08:45'),
(024, 100000024, 024, 'ABC-004', '2025-04-12', '09:45'),
(025, 100000025, 025, 'ABC-005', '2025-04-13', '10:15'),
(026, 100000026, 026, 'ABC-006', '2025-04-13', '11:15'),
(027, 100000027, 027, 'ABC-007', '2025-04-14', '12:00'),
(028, 100000028, 028, 'ABC-008', '2025-04-14', '13:00'),
(029, 100000029, 029, 'ABC-009', '2025-04-15', '08:00'),
(030, 100000030, 030, 'ABC-010', '2025-04-15', '09:00');
 


INSERT INTO Cliente (cedula, nombre, apellido, telefono, correo) VALUES
(100000001, 'Carlos', 'Martínez', '3001000001', 'carlos.martinez1@mail.com'),
(100000002, 'Ana', 'López', '3001000002', 'ana.lopez2@mail.com'),
(100000003, 'Luis', 'Rodríguez', '3001000003', 'luis.rodriguez3@mail.com'),
(100000004, 'Diana', 'García', '3001000004', 'diana.garcia4@mail.com'),
(100000005, 'Pedro', 'Morales', '3001000005', 'pedro.morales5@mail.com'),
(100000006, 'Laura', 'Vargas', '3001000006', 'laura.vargas6@mail.com'),
(100000007, 'Andrés', 'Castillo', '3001000007', 'andres.castillo7@mail.com'),
(100000008, 'María', 'Ríos', '3001000008', 'maria.rios8@mail.com'),
(100000009, 'Jorge', 'Romero', '3001000009', 'jorge.romero9@mail.com'),
(100000010, 'Sofía', 'Cortés', '3001000010', 'sofia.cortes10@mail.com'),
(100000011, 'Mateo', 'Luna', '3001000011', 'mateo.luna11@mail.com'),
(100000012, 'Camila', 'Ortega', '3001000012', 'camila.ortega12@mail.com'),
(100000013, 'Daniel', 'Peña', '3001000013', 'daniel.pena13@mail.com'),
(100000014, 'Valentina', 'Ruiz', '3001000014', 'valentina.ruiz14@mail.com'),
(100000015, 'Felipe', 'Mejía', '3001000015', 'felipe.mejia15@mail.com'),
(100000016, 'Isabela', 'Navarro', '3001000016', 'isabela.navarro16@mail.com'),
(100000017, 'Sebastián', 'Muñoz', '3001000017', 'sebastian.munoz17@mail.com'),
(100000018, 'Nicole', 'Rincón', '3001000018', 'nicole.rincon18@mail.com'),
(100000019, 'Tomás', 'Arias', '3001000019', 'tomas.arias19@mail.com'),
(100000020, 'Juliana', 'Pérez', '3001000020', 'juliana.perez20@mail.com'),
(100000021, 'Emilio', 'Herrera', '3001000021', 'emilio.herrera21@mail.com'),
(100000022, 'Natalia', 'Salazar', '3001000022', 'natalia.salazar22@mail.com'),
(100000023, 'Samuel', 'Velásquez', '3001000023', 'samuel.velasquez23@mail.com'),
(100000024, 'Daniela', 'Espinosa', '3001000024', 'daniela.espinosa24@mail.com'),
(100000025, 'Cristian', 'Molina', '3001000025', 'cristian.molina25@mail.com'),
(100000026, 'Manuela', 'Zapata', '3001000026', 'manuela.zapata26@mail.com'),
(100000027, 'Esteban', 'Reyes', '3001000027', 'esteban.reyes27@mail.com'),
(100000028, 'Karol', 'Gómez', '3001000028', 'karol.gomez28@mail.com'),
(100000029, 'Oscar', 'León', '3001000029', 'oscar.leon29@mail.com'),
(100000030, 'Elena', 'Nieto', '3001000030', 'elena.nieto30@mail.com');


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
('001', '01', '001', '001', 'ABC-163', '001'),  
('002', '02', '002', '002', 'DEF-476', '002'),  
('003', '03', '003', '003', 'GHI-789', '003'),  
('004', '04', '004', '004', 'JKL-012', '004'),  
('005', '05', '005', '005', 'MNO-345', '005'),  
('006', '06', '006', '006', 'PQR-678', '006'),  
('007', '07', '007', '007', 'STU-901', '007'),  
('008', '08', '008', '008', 'VWX-234', '008'),  
('009', '09', '009', '009', 'YZA-567', '009'),  
('010', '10', '010', '010', 'BCD-390', '010'),  
('011', '11', '011', '011', 'EFG-323', '011'),  
('012', '12', '012', '012', 'HIJ-356', '012'),  
('013', '13', '013', '013', 'KLM-389', '013'),  
('014', '14', '014', '014', 'NOP-312', '014'),  
('015', '15', '015', '015', 'QRS-345', '015'),  
('016', '16', '016', '016', 'TUV-378', '016'),  
('017', '17', '017', '017', 'WXY-301', '017'),  
('018', '18', '018', '018', 'ZAB-334', '018'),  
('019', '19', '019', '019', 'CDE-767', '019'),  
('020', '20', '020', '020', 'FGH-790', '020'),  
('021', '21', '021', '021', 'HIJ-723', '021'),  
('022', '22', '022', '022', 'KLM-856', '022'),  
('023', '23', '023', '023', 'NOP-889', '023'),  
('024', '24', '024', '024', 'QRS-812', '024'),  
('025', '25', '025', '025', 'TUV-745', '025'),  
('026', '26', '026', '026', 'WXY-678', '026'),  
('027', '27', '027', '027', 'ZAB-901', '027'),  
('028', '28', '028', '028', 'RPC-756', '028'),  
('029', '29', '029', '029', 'JXK-086', '029'),  
('030', '30', '030', '030', 'HIS-063', '030');



INSERT INTO Equipaje (id_equipaje, peso, descripcion, id_cliente, id_boleto) VALUES
(001, 11.35, 'Maleta de cuero negro con cierre metálico y asas cortas', 001, 001),
(002, 13.50, 'Bolso de mano color marrón con detalles dorados', 002, 002),
(003, 9.45, 'Mochila pequeña color rojo con diseño moderno', 003, 003),
(004, 7.75, 'Cartera de mano con textura de serpiente en tono gris', 004, 004),
(005, 8.20, 'Maleta de viaje con ruedas y etiqueta de identificación', 005, 005),
(006, 6.95, 'Bolso de lona con estampado de flores y asas de cuero', 006, 006),
(007, 14.05, 'Maleta de viaje grande color verde con ruedas', 007, 007),
(008, 12.60, 'Mochila color negro con múltiples compartimentos', 008, 008),
(009, 10.80, 'Maletín profesional color gris con detalles metálicos', 009, 009),
(0010, 9.10, 'Bolso de tela con asas de madera y diseño bohemio', 0010, 0010),
(0011, 7.00, 'Cartera color vino con detalles en piel', 0011, 0011),
(0012, 11.25, 'Maleta pequeña con diseño minimalista y cremallera oculta', 0012, 0012),
(0013, 5.80, 'Bolso deportivo con compartimento para zapatillas', 0013, 0013),
(0014, 13.80, 'Mochila grande con logo en el frente y cintillas ajustables', 0014, 0014),
(0015, 8.55, 'Maleta rígida con ruedas y candado incorporado', 0015, 0015),
(0016, 6.50, 'Bolso de mano color negro con detalles metálicos en el cierre', 0016, 0016),
(0017, 12.25, 'Maleta color gris claro con diseño de rayas diagonales', 0017, 0017),
(0018, 10.50, 'Cartera pequeña con varios compartimentos y correa ajustable', 0018, 0018),
(0019, 9.90, 'Maletín de ejecutivo con detalles en cuero y compartimiento para laptop', 0019, 0019),
(0020, 7.40, 'Bolso de viaje tipo mochila con parches de colores', 0020, 0020),
(0021, 8.30, 'Mochila escolar con estampado de animales y detalles en cuero', 0021, 0021),
(0022, 10.15, 'Bolso de mano en tonos pastel con pequeños bordados', 0022, 0022),
(0023, 12.10, 'Maleta con ruedas de tamaño mediano y diseño elegante', 0023, 0023),
(0024, 9.65, 'Cartera de mano con diseño de rayas y asa corta', 0024, 0024),
(0025, 11.90, 'Maletín ejecutivo con bolsillo interior para tablet', 0025, 0025),
(0026, 13.25, 'Bolso color negro con detalles metálicos y compartimentos', 0026, 0026),
(0027, 6.80, 'Mochila pequeña con detalles reflectivos y cierres resistentes', 0027, 0027),
(0028, 7.95, 'Bolso de hombro color camel con asas de cuero trenzado', 0028, 0028),
(0029, 10.40, 'Maleta rígida de viaje con compartimentos interiores', 0029, 0029),
(0030, 9.30, 'Bolso de playa con diseño de rayas y forro interior', 0030, 0030);


INSERT INTO Factura (id_factura, Fecha_facturacion, Valor_total, id_boleto, id_seguro, id_equipaje, id_viaje, id_metodo_pago) VALUES
(001, '2024-05-01', 85000.00, 001, 001, 001, 001, 001),
(002, '2024-05-02', 87000.00, 002, 002, 002, 002, 002),
(003, '2024-05-03', 89000.00, 003, 003, 003, 003, 003),
(004, '2024-05-04', 91000.00, 004, 004, 004, 004, 004),
(005, '2024-05-05', 93000.00, 005, 005, 005, 005, 005),
(006, '2024-05-06', 95000.00, 006, 006, 006, 006, 006),
(007, '2024-05-07', 97000.00, 007, 007, 007, 007, 007),
(008, '2024-05-08', 99000.00, 008, 008, 008, 008, 008),
(009, '2024-05-09', 101000.00, 009, 009, 009, 009, 009),
(0010, '2024-05-10', 103000.00, 0010, 0010, 0010, 0010, 0010),
(0011, '2024-05-11', 105000.00, 0011, 0011, 0011, 0011, 0011),
(0012, '2024-05-12', 107000.00, 0012, 0012, 0012, 0012, 0012),
(0013, '2024-05-13', 109000.00, 0013, 0013, 0013, 0013, 0013),
(0014, '2024-05-14', 111000.00, 0014, 0014, 0014, 0014, 0014),
(0015, '2024-05-15', 113000.00, 0015, 0015, 0015, 0015, 0015),
(0016, '2024-05-16', 115000.00, 0016, 0016, 0016, 0016, 0016),
(0017, '2024-05-17', 117000.00, 0017, 0017, 0017, 0017, 0017),
(0018, '2024-05-18', 119000.00, 0018, 0018, 0018, 0018, 0018),
(0019, '2024-05-19', 121000.00, 0019, 0019, 0019, 0019, 0019),
(0020, '2024-05-20', 123000.00, 0020, 0020, 0020, 0020, 0020),
(0021, '2024-05-21', 125000.00, 0021, 0021, 0021, 0021, 0021),
(0022, '2024-05-22', 127000.00, 0022, 0022, 0022, 0022, 0022),
(0023, '2024-05-23', 129000.00, 0023, 0023, 0023, 0023, 0023),
(0024, '2024-05-24', 131000.00, 0024, 0024, 0024, 0024, 0024),
(0025, '2024-05-25', 133000.00, 0025, 0025, 0025, 0025, 0025),
(0026, '2024-05-26', 135000.00, 0026, 0026, 0026, 0026, 0026),
(0027, '2024-05-27', 137000.00, 0027, 0027, 0027, 0027, 0027),
(0028, '2024-05-28', 139000.00, 0028, 0028, 0028, 0028, 0028),
(0029, '2024-05-29', 141000.00, 0029, 0029, 0029, 0029, 0029),
(0030, '2024-05-30', 143000.00, 0030, 0030, 0030, 0030, 0030);


