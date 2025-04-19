--inserts terminal norte
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
-- inserts terminal sur
INSERT INTO Tipo_mercancia (id_tipo_mercancia, Nombre, Descripcion) VALUES
(171, 'Maleta', 'Maletas de tamaño personal o mediano, aptas para viajes en bus'),
(172, 'Mochila', 'Mochilas medianas para uso personal durante el viaje'),
(173, 'Bolso', 'Bolsos de tamaño personal que los pasajeros pueden llevar consigo'),
(174, 'Equipaje de mano', 'Equipaje pequeño que puede ir a bordo del bus'),
(175, 'Carro de bebé', 'Carritos pequeños para niños que acompañan a los pasajeros'),
(176, 'Bicicleta', 'Bicicletas plegables o desmontadas, que pueden ser transportadas'),
(177, 'Instrumentos musicales', 'Instrumentos de tamaño mediano, como guitarras o violines'),
(178, 'Equipos electrónicos', 'Equipos como laptops o cámaras que los pasajeros pueden llevar'),
(179, 'Sillas de ruedas', 'Sillas de ruedas que los pasajeros pueden necesitar para su movilidad'),
(180, 'Cajas personales', 'Cajas de tamaño pequeño o mediano que los pasajeros pueden llevar consigo');

INSERT INTO Mercancia (id_mercancia, descripcion, peso, valor_estimado, id_tipo_mercancia, id_cliente, id_viaje, id_boleto) VALUES
(171, 'Maleta de mano', 10.5, 250000, 171, 171, 171, 171),
(172, 'Mochila escolar', 5.0, 100000, 172, 172, 172, 172),
(173, 'Bolso de mano', 3.0, 50000, 173, 173, 173, 173),
(174, 'Equipaje de mano', 8.0, 150000, 174, 174, 174, 174),
(175, 'Carro de bebé', 12.0, 350000, 175, 175, 175, 175),
(176, 'Bicicleta plegable', 15.0, 500000, 176, 176, 176, 176),
(177, 'Guitarra acústica', 6.5, 300000, 177, 177, 177, 177),
(178, 'Laptop', 2.0, 1500000, 178, 178, 178, 178),
(179, 'Silla de ruedas', 12.0, 1000000, 179, 179, 179, 179),
(180, 'Caja con ropa', 20.0, 100000, 180, 180, 180, 180),
(181, 'Mochila deportiva', 7.0, 80000, 172, 181, 181, 181),
(182, 'Maleta pequeña', 9.0, 200000, 171, 182, 182, 182),
(183, 'Bolso de viaje', 4.5, 70000, 173, 183, 183, 183),
(184, 'Carro de bebé pequeño', 8.0, 200000, 175, 184, 184, 184),
(185, 'Bicicleta de montaña', 18.0, 600000, 176, 185, 185, 185);

-- inserts Terminal Centro
INSERT INTO Tipo_mercancia ("id_tipo_mercancia", "Nombre", "Descripcion") VALUES
(201, 'Maleta', 'Maletas de tamaño personal o mediano, aptas para viajes en bus'),
(202, 'Mochila', 'Mochilas medianas para uso personal durante el viaje'),
(203, 'Bolso', 'Bolsos de tamaño personal que los pasajeros pueden llevar consigo'),
(204, 'Equipaje de mano', 'Equipaje pequeño que puede ir a bordo del bus'),
(205, 'Carro de bebé', 'Carritos pequeños para niños que acompañan a los pasajeros'),
(206, 'Bicicleta', 'Bicicletas plegables o desmontadas, que pueden ser transportadas'),
(207, 'Instrumentos musicales', 'Instrumentos de tamaño mediano, como guitarras o violines'),
(208, 'Equipos electrónicos', 'Equipos como laptops o cámaras que los pasajeros pueden llevar'),
(209, 'Sillas de ruedas', 'Sillas de ruedas que los pasajeros pueden necesitar para su movilidad'),
(210, 'Cajas personales', 'Cajas de tamaño pequeño o mediano que los pasajeros pueden llevar consigo');

INSERT INTO Mercancia ("id_mercancia", "descripcion", "peso", "valor_estimado", "id_tipo_mercancia", "id_cliente", "id_viaje", "id_boleto") VALUES
(201, 'Maleta de mano', 10.5, 250000, 201, 101, 201, 201),
(202, 'Mochila escolar', 5.0, 100000, 202, 102, 202, 202),
(203, 'Bolso de mano', 3.0, 50000, 203, 103, 203, 203),
(204, 'Equipaje de mano', 8.0, 150000, 204, 104, 204, 204),
(205, 'Carro de bebé', 12.0, 350000, 205, 105, 205, 205),
(206, 'Bicicleta plegable', 15.0, 500000, 206, 106, 206, 206),
(207, 'Guitarra acústica', 6.5, 300000, 207, 107, 207, 207),
(208, 'Laptop', 2.0, 1500000, 208, 108, 208, 208),
(209, 'Silla de ruedas', 12.0, 1000000, 209, 109, 209, 209),
(210, 'Caja con ropa', 20.0, 100000, 210, 110, 210, 210),
(211, 'Mochila deportiva', 7.0, 80000, 202, 111, 111, 211),
(212, 'Maleta pequeña', 9.0, 200000, 201, 112, 112, 212),
(213, 'Bolso de viaje', 4.5, 70000, 203, 113, 113, 213),
(214, 'Carro de bebé pequeño', 8.0, 200000, 205, 114, 114, 214),
(215, 'Bicicleta de montaña', 18.0, 600000, 206, 115, 115, 215);

-- inserts terminal occidente

INSERT INTO "Tipo_mercancia" (id_tipo_mercancia, Nombre, Descripcion) VALUES
(181, 'Maleta', 'Maletas de tamaño personal o mediano, aptas para viajes en bus'),
(182, 'Mochila', 'Mochilas medianas para uso personal durante el viaje'),
(183, 'Bolso', 'Bolsos de tamaño personal que los pasajeros pueden llevar consigo'),
(184, 'Equipaje de mano', 'Equipaje pequeño que puede ir a bordo del bus'),
(185, 'Carro de bebé', 'Carritos pequeños para niños que acompañan a los pasajeros'),
(186, 'Bicicleta', 'Bicicletas plegables o desmontadas, que pueden ser transportadas'),
(187, 'Instrumentos musicales', 'Instrumentos de tamaño mediano, como guitarras o violines'),
(188, 'Equipos electrónicos', 'Equipos como laptops o cámaras que los pasajeros pueden llevar'),
(189, 'Sillas de ruedas', 'Sillas de ruedas que los pasajeros pueden necesitar para su movilidad'),
(190, 'Cajas personales', 'Cajas de tamaño pequeño o mediano que los pasajeros pueden llevar consigo');

INSERT INTO "Mercancia" (id_mercancia, descripcion, peso, valor_estimado, id_tipo_mercancia, id_cliente, id_viaje, id_boleto) VALUES
(181, 'Maleta de mano', 10.5, 250000, 181, 181, 181, 181),  -- Con cliente
(182, 'Mochila escolar', 5.0, 100000, 182, 182, 182, 182),  -- Con cliente
(183, 'Bolso de mano', 3.0, 50000, 183, 183, 183, 183),  -- Con cliente
(184, 'Equipaje de mano', 8.0, 150000, 184, 184, 184, 184),  -- Con cliente
(185, 'Carro de bebé', 12.0, 350000, 185, 185, 185, 185),  -- Con cliente
(186, 'Bicicleta plegable', 15.0, 500000, 186, 186, 186, 186),  -- Con cliente
(187, 'Guitarra acústica', 6.5, 300000, 187, 187, 187, 187),  -- Con cliente
(188, 'Laptop', 2.0, 1500000, 188, 188, 188, 188),  -- Con cliente
(189, 'Silla de ruedas', 12.0, 1000000, 189, 189, 189, 189),  -- Con cliente
(190, 'Caja con ropa', 20.0, 100000, 190, 190, 190, 190),  -- Con cliente
(191, 'Mochila deportiva', 7.0, 80000, 182, 191, 191, 191),  -- Con cliente
(192, 'Maleta pequeña', 9.0, 200000, 181, 192, 192, 192),  -- Con cliente
(193, 'Bolso de viaje', 4.5, 70000, 183, 193, 193, 193),  -- Con cliente
(194, 'Carro de bebé pequeño', 8.0, 200000, 185, 194, 194, 194),  -- Con cliente
(195, 'Bicicleta de montaña', 18.0, 600000, 186, 195, 195, 195),  -- Con cliente
(196, 'Silla plegable', 3.0, 150000, 189, NULL, 196, 196),  -- Sin cliente
(197, 'Caja de herramientas', 25.0, 400000, 190, NULL, 197, 197),  -- Sin cliente
(198, 'Set de pinturas', 2.0, 50000, 187, NULL, 198, 198),  -- Sin cliente
(199, 'Bicicleta para niños', 10.0, 250000, 186, NULL, 199, 199),  -- Sin cliente
(200, 'Guitarra eléctrica', 7.0, 800000, 187, NULL, 200, 200);  -- Sin cliente
