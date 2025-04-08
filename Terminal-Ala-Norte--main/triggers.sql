DELIMITER //

CREATE TRIGGER trg_before_insert_boleto
BEFORE INSERT ON Boletos
FOR EACH ROW
BEGIN
    DECLARE asiento_ocupado INT;

    SELECT COUNT(*) INTO asiento_ocupado
    FROM Boletos
    WHERE Numero_asiento = NEW.Numero_asiento
      AND id_bus = NEW.id_bus
      AND id_ruta = NEW.id_ruta;

    IF asiento_ocupado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este asiento ya está ocupado en esta ruta y bus.';
    END IF;
END;
//

CREATE TRIGGER trg_before_insert_viaje
BEFORE INSERT ON Viajes
FOR EACH ROW
BEGIN
    DECLARE viajes INT;

    SELECT COUNT(*) INTO viajes
    FROM Viajes
    WHERE id_conductor = NEW.id_conductor
      AND Fecha_salida = NEW.Fecha_salida;

    IF viajes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El conductor ya tiene un viaje programado a esa hora.';
    END IF;
END;
//

CREATE TRIGGER trg_before_insert_factura
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
    DECLARE valor_viaje DECIMAL(10,2);
    DECLARE valor_seguro DECIMAL(10,2);
    DECLARE valor_equipaje DECIMAL(10,2);

    IF NEW.Valor_total IS NULL THEN
        SELECT Valor INTO valor_viaje FROM Viajes WHERE id_viaje = NEW.id_viaje;
        SELECT IFNULL((SELECT 100 FROM Seguro WHERE id_seguro = NEW.id_seguro), 0) INTO valor_seguro;
        SELECT IFNULL((SELECT peso FROM Equipaje WHERE id_equipaje = NEW.id_equipaje), 0) * 5 INTO valor_equipaje;

        SET NEW.Valor_total = valor_viaje + valor_seguro + valor_equipaje;
    END IF;
END;
//

CREATE TRIGGER trg_before_insert_mantenimiento
BEFORE INSERT ON Mantenimientos
FOR EACH ROW
BEGIN
    DECLARE duplicado INT;

    SELECT COUNT(*) INTO duplicado
    FROM Mantenimientos
    WHERE id_bus = NEW.id_bus
      AND Fecha_mantenimiento = NEW.Fecha_mantenimiento;

    IF duplicado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este bus ya tiene mantenimiento registrado para esa fecha.';
    END IF;
END;
//

CREATE TRIGGER trg_before_insert_equipaje
BEFORE INSERT ON Equipaje
FOR EACH ROW
BEGIN
    IF NEW.peso > 25 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El peso del equipaje excede el límite permitido.';
    END IF;
END;
//

CREATE TABLE Log_Mercancia (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_mercancia INT,
    accion VARCHAR(50),
    fecha DATETIME
);
//

CREATE TRIGGER trg_after_insert_mercancia
AFTER INSERT ON Mercancia
FOR EACH ROW
BEGIN
    INSERT INTO Log_Mercancia (id_mercancia, accion, fecha)
    VALUES (NEW.id_mercancia, 'INSERT', NOW());
END;
//

CREATE TABLE Log_Clientes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nombre_completo VARCHAR(255),
    fecha_eliminacion DATETIME
);
//

CREATE TRIGGER trg_before_delete_cliente
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO Log_Clientes (id_cliente, nombre_completo, fecha_eliminacion)
    VALUES (OLD.id_cliente, CONCAT(OLD.Nombres, ' ', OLD.Apellidos), NOW());
END;
//

CREATE TABLE Log_Equipaje (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_equipaje INT,
    peso DECIMAL(10,2),
    fecha DATETIME
);
//

CREATE TRIGGER trg_after_insert_equipaje
AFTER INSERT ON Equipaje
FOR EACH ROW
BEGIN
    INSERT INTO Log_Equipaje (id_equipaje, peso, fecha)
    VALUES (NEW.id_equipaje, NEW.peso, NOW());
END;
//

CREATE TRIGGER trg_before_insert_factura_fecha
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
    IF NEW.Fecha_facturacion IS NULL THEN
        SET NEW.Fecha_facturacion = CURDATE();
    END IF;
END;
//

DELIMITER ;
