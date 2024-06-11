-- Inserciones a la tabla marca Vehiculo
INSERT INTO marcavehiculo (id_marca, nombre) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Ford'),
(4, 'Chevrolet'),
(5, 'Nissan'),
(6, 'Hyundai'),
(7, 'Kia'),
(8, 'Volkswagen'),
(9, 'BMW'),
(10, 'Mercedes-Benz'),
(11, 'Audi'),
(12, 'Mazda'),
(13, 'Subaru'),
(14, 'Lexus'),
(15, 'Tesla');

INSERT INTO vehiculo (id_vehiculo, id_marca) VALUES
('UHK946', 3),
('BOA229', 1),
('YSR328', 6),
('CSU573', 1),
('OOO529', 3),
('LPS177', 12),
('NFV108', 15),
('JQT791', 10),
('GRU810', 5),
('YYP173', 4),
('OBN836', 8),
('JSW375', 7),
('BSA281', 2),
('TOO924', 13),
('HXC839', 8),
('XYZ123', 4),
('ABC456', 6),
('DEF789', 10),
('GHI012', 2),
('JKL345', 8),
('MNO678', 3),
('PQR901', 5),
('STU234', 12),
('VWX567', 15),
('YZA890', 8);
/*
Marcas Faltantes que se pueden utilizar para los procedimientos almacenados

INSERT INTO vehiculo (id_vehiculo, id_marca) VALUES
('XYZ123', 9),
('ABC456', 11),
('DEF789', 14);
*/
SELECT * FROM cliente;
DELETE FROM cliente;
INSERT INTO cliente (DNI_cliente, NIT, nombre1, nombre2, apellido1, direccion, email, id_vehiculo) VALUES
('00000000', 'A1234567', 'Juan', 'Carlos', 'González', 'Calle 45 #12-34', 'juan.gonzalez@example.com', 'UHK946'),
('00000001', 'B2345678', 'María', NULL, 'Rodríguez', 'Calle 56 #23-45', 'maria.rodriguez@example.com', 'BOA229'),
('00000002', 'C3456789', 'Luis', 'Fernando', 'López', 'Calle 67 #34-56', 'luis.lopez@example.com', 'YSR328'),
('00000003', NULL, 'Ana', 'María', 'Fernández', 'Calle 78 #45-67', 'ana.fernandez@example.com', 'CSU573'),
('00000004', 'R5678901', 'Carlos', NULL, 'Pérez', 'Calle 89 #56-78', 'carlos.perez@example.com', 'OOO529'),
('00000005', 'R6789012', 'Laura', 'Isabel', 'Sánchez', 'Calle 90 #67-89', 'laura.sanchez@example.com', 'LPS177'),
('00000006', NULL, 'José', 'Miguel', 'Martínez', 'Calle 12 #78-90', 'jose.martinez@example.com', 'NFV108'),
('00000007', 'Y8901234', 'Marta', NULL, 'Gómez', 'Calle 23 #89-01', 'marta.gomez@example.com', 'JQT791'),
('00000008', 'I9012345', 'Pedro', 'Antonio', 'Ruiz', 'Calle 34 #90-12', 'pedro.ruiz@example.com', 'GRU810'),
('00000009', 'O1234567', 'Lucía', NULL, 'Díaz', 'Calle 45 #01-23', 'lucia.diaz@example.com', 'YYP173'),
('00000010', 'P2345678', 'Juan', 'Carlos', 'González', 'Calle 56 #12-34', 'juan.gonzalez2@example.com', 'OBN836'),
('00000011', 'Q3456789', 'María', 'Elena', 'Rodríguez', 'Calle 67 #23-45', 'maria.rodriguez2@example.com', 'JSW375'),
('00000012', NULL, 'Luis', 'Miguel', 'López', 'Calle 78 #34-56', 'luis.lopez2@example.com', 'BSA281'),
('00000013', 'A5678901', 'Ana', 'Lucía', 'Fernández', 'Calle 89 #45-67', 'ana.fernandez2@example.com', 'TOO924'),
('00000014', NULL, 'Carlos', 'Andrés', 'Pérez', 'Calle 90 #56-78', 'carlos.perez2@example.com', 'HXC839'),
('00000015', 'K7890123', 'Laura', 'Paola', 'Sánchez', 'Calle 12 #67-89', 'laura.sanchez2@example.com', 'XYZ123'),
('00000016', NULL, 'José', NULL, 'Martínez', 'Calle 23 #78-90', 'jose.martinez2@example.com', 'ABC456'),
('00000017', 'O9012345', 'Marta', 'Isabel', 'Gómez', 'Calle 34 #89-01', 'marta.gomez2@example.com', 'DEF789'),
('00000018', NULL, 'Pedro', 'Alejandro', 'Ruiz', 'Calle 45 #90-12', 'pedro.ruiz2@example.com', 'GHI012'),
('00000019', 'Y2345678', 'Lucía', 'María', 'Díaz', 'Calle 56 #01-23', 'lucia.diaz2@example.com', 'JKL345'),
('00000020', NULL, 'Juan', NULL, 'González', 'Calle 67 #12-34', 'juan.gonzalez3@example.com', 'MNO678'),
('00000021', 'U4567890', 'María', 'Luisa', 'Rodríguez', 'Calle 78 #23-45', 'maria.rodriguez3@example.com', 'PQR901'),
('00000022', NULL, 'Luis', 'Antonio', 'López', 'Calle 89 #34-56', 'luis.lopez3@example.com', 'STU234'),
('00000023', NULL, 'Ana', 'María', 'Fernández', 'Calle 90 #45-67', 'ana.fernandez3@example.com', 'VWX567'),
('00000024', NULL, 'Carlos', 'José', 'Pérez', 'Calle 12 #56-78', 'carlos.perez3@example.com', 'YZA890');


-- inserciones a tabla factura
INSERT INTO factura (id_factura, DNI_cliente, fecha) VALUES
(1, '00000000', '2023-06-06'),
(2, '00000001', '2023-07-16'),
(3, '00000002', '2023-12-16'),
(4, '00000003', '2023-04-06'),
(5, '00000004', '2023-12-14'),
(6, '00000005', '2023-01-12'),
(7, '00000006', '2023-07-23'),
(8, '00000007', '2022-08-22'),
(9, '00000008', '2024-09-12'),
(10, '00000009', '2024-05-16'),
(11, '00000010', '2022-02-09'),
(12, '00000011', '2023-03-12'),
(13, '00000012', '2018-05-09'),
(14, '00000013', '2023-06-24'),
(15, '00000014', '2024-09-17'),
(16, '00000014', '2024-10-16'),
(17, '00000016', '2023-11-12'),
(18, '00000017', '2023-11-03'),
(19, '00000018', '2014-12-02'),
(20, '00000019', '2015-07-01'),
(21, '00000020', '2018-09-09'),
(22, '00000021', '2024-09-16'),
(23, '00000022', '2024-03-12'),
(24, '00000023', '2024-02-26'),
(25, '00000024', '2024-01-23');

-- inserciones a tabla cargo empleado

INSERT INTO tipocargoempleado (id_tipo_cargo, nombre_cargo) VALUES
(1, 'Mecánico de Motor'),
(2, 'Mecánico de Carrocería'),
(3, 'Electricista Automotriz'),
(4, 'Técnico en Suspensión y Dirección'),
(5, 'Técnico en Aire Acondicionado'),
(6, 'Asistente de Repuestos'),
(7, 'Recepcionista y Atención al Cliente'),
(8, 'Gerente de Taller'),
(9, 'Lavador de Autos'),
(10, 'Inspector Técnico'),
(11, 'Mecanico patinador');

-- insercioens a tabla empleado

INSERT INTO empleado (DNI_empleado, nombre1, nombre2, apellido1, direccion, email, id_tipo_cargo) VALUES
('JCL123A', 'Juan', 'Carlos', 'López', 'Calle Principal 123', 'juan.lopez@example.com', 1),
('MIG456B', 'María', 'Isabel', 'Gómez', 'Avenida Central 456', 'maria.gomez@example.com', 2),
('PAM789C', 'Pedro', 'Antonio', 'Martínez', 'Calle Secundaria 789', 'pedro.martinez@example.com', 3),
('ALR321D', 'Ana', 'Luisa', 'Rodríguez', 'Carrera 10 #20-30', 'ana.rodriguez@example.com', 4),
('RLR789E', 'Raul', 'Luis', 'Rodríguez', 'Novena 10 #40-30', 'Raul.rodriguez@example.com', 4),
('CAP665F', 'Carlos', 'Andrés', 'Pérez', 'Avenida Sur 345', 'carlos.perez@example.com', 5),
('LGX896G', 'Luis', NULL, 'García', 'Calle Este 678', 'luis.garcia@example.com', 6),
('LMS456H', 'Laura', 'María', 'Sánchez', 'Calle Oeste 901', 'laura.sanchez@example.com', 7),
('DAG145I', 'David', 'Alejandro', 'González', 'Carrera 15 #25-35', 'david.gonzalez@example.com', 8),
('SXH736J', 'Sofía', NULL, 'Hernández', 'Avenida Norte 123', 'sofia.hernandez@example.com', 9),
('GJD963K', 'Gabriel', 'Jesús', 'Díaz', 'Calle Principal 234', 'gabriel.diaz@example.com', 10),
('PMR852L', 'Patricia', 'María', 'Ramírez', 'Avenida Central 567', 'patricia.ramirez@example.com', 11),
('MAR741M', 'Marco', 'Ausencio', 'Ramírez', 'Avenida Sin 567', 'Marco.Ausencio@example.com', 11),
('PMG789N', 'Patricio', 'Medina', 'Garcia', 'Octava Sin 45', 'Patricio.Medina@example.com', 11),
('LMG987O', 'Luis', 'Miguel', 'González', 'Calle Principal 345', 'luis.gonzalez@example.com', 1),
('MXF824P', 'Marcela', NULL, 'Fernández', 'Avenida Central 678', 'marcela.fernandez@example.com', 1),
('JAR919Q', 'Javier', 'Andrés', 'Ramírez', 'Calle Secundaria 901', 'javier.ramirez@example.com', 2),
('AIM913R', 'Andrea', 'Isabel', 'Martínez', 'Carrera 20 #30-40', 'andrea.martinez@example.com', 2),
('GAH371S', 'Gabriel', 'Alejandro', 'Hernández', 'Avenida Sur 456', 'gabriel.hernandez@example.com', 9),
('LXG798T', 'Luisa', NULL, 'García', 'Calle Este 789', 'luisa.garcia@example.com', 9);
-- inserciones a Tipo de telefono

INSERT INTO tipotelefono (id_tipo_telefono, nombre) VALUES
(1, 'Móvil'),
(2, 'Fijo'),
(3, 'Trabajo'),
(4, 'Fax');

-- inserciones a global telefono
-- Inserciones para los números de teléfono de empleados
INSERT INTO globaltelefono (id_telefono_global, id_tipo_telefono, telefono) VALUES
(1, 1, '555-123-4567'), -- Móvil
(2, 2, '555-234-5678'), -- Fijo
(3, 3, '555-345-6789'), -- Trabajo
(4, 4, '555-456-7890'), -- Casa
(5, 1, '555-567-8901'), -- Fax
(6, 2, '555-678-9012'), -- Otro
(7, 3, '555-789-0123'), -- Móvil
(8, 4, '555-890-1234'), -- Fijo
(9, 4, '555-901-2345'), -- Trabajo
(10, 2, '555-012-3456'), -- Casa
(11, 3, '555-123-4568'), -- Fax
(12, 1, '555-234-5679'), -- Otro
(13, 1, '555-345-6780'), -- Móvil
(14, 2, '555-456-7891'), -- Fijo
(15, 3, '555-567-8902'), -- Trabajo
(16, 4, '555-678-9013'), -- Casa
(17, 3, '555-789-0124'), -- Fax
(18, 2, '555-890-1235'), -- Otro
(19, 1, '555-901-2346'), -- Móvil
(20, 2, '555-012-3457'), -- Fijo
(21, 3, '555-987-6543'), -- Trabajo
(22, 4, '555-876-5432'), -- Casa
(23, 1, '555-765-4321'), -- Móvil
(24, 2, '555-654-3210'), -- Fijo
(25, 3, '555-543-2109'), -- Otro
(26, 4, '555-432-1098'), -- Fax
(27, 1, '555-321-0987'), -- Móvil
(28, 2, '555-210-9876'), -- Fijo
(29, 3, '555-109-8765'), -- Trabaj
(30, 4, '555-098-7654'), -- Casa
(31, 2, '555-987-4321'), -- Fax
(32, 1, '555-876-3210'), -- Otro
(33, 1, '555-765-2109'), -- Móvil
(34, 2, '555-654-1098'), -- Fijo
(35, 3, '555-543-0987'), -- Trabajo
(36, 4, '555-432-9876'), -- Casa
(37, 3, '555-321-8765'), -- Fax
(38, 4, '555-210-7654'), -- Otro
(39, 1, '555-109-6543'), -- Móvil
(40, 1, '555-098-9875'), -- Móvil
(41, 2, '555-109-8764'), -- Fijo
(42, 3, '555-210-7653'), -- Trabajo
(43, 4, '555-321-6542'), -- Casa
(44, 2, '555-432-5431'), -- Fax
(45, 1, '555-543-4320'), -- Otro
(46, 1, '555-654-3218'), -- Móvil
(47, 2, '555-765-2107'), -- Fijo
(48, 3, '555-876-1096'), -- Trabajo
(49, 4, '555-987-0985'), -- Casa
(50, 2, '555-098-7656'), -- Fax
(51, 1, '555-109-8763'), -- Otro
(52, 1, '555-210-7652'), -- Móvil
(53, 2, '555-876-5433'), -- Fijo
(54, 3, '555-765-4322'), -- Trabajo
(55, 4, '555-654-3211'), -- Casa
(56, 3, '555-543-2100'), -- Fax
(57, 4, '555-432-1099'), -- Otro
(58, 2, '555-321-0988'), -- Móvil
(59, 3, '555-210-9877'), -- Fijo
(60, 4, '555-109-8766'), -- Trabajo
(61, 1, '555-098-7655'), -- Casa
(62, 2, '555-987-6544'), -- Fax
(63, 3, '555-876-5434'), -- Otro
(64, 4, '555-765-4323'), -- Móvil
(65, 2, '555-654-3212'); -- Fijo

-- incerciones de marcas
INSERT INTO marcapieza (id_marca_pieza, nombre) VALUES
(1, 'Bosch'),
(2, 'Denso'),
(3, 'Delphi'),
(4, 'Valeo'),
(5, 'NGK'),
(6, 'MagnaFlow'),
(7, 'Brembo'),
(8, 'Michelin'),
(9, 'Goodyear'),
(10, 'Continental'),
(11, 'KYB'),
(12, 'Hella'),
(13, 'Monroe'),
(14, 'Sachs'),
(15, 'TRW');

-- inserciones a tabla provedores

INSERT INTO provedor (DNI_provedor, NIT, nombre1, apellido1, email, id_marca_pieza) VALUES
(98765432, 'X133456X', 'Juan', 'González', 'juan@example.com', 1),
(23456789, 'X230956X', 'María', 'López', 'maria@example.com', 2), 
(45678901, 'X345678X', 'Pedro', 'Martínez', 'pedro@example.com', 3), 
(67890123, 'X406789X', 'Ana', 'García', 'ana@example.com', 4), 
(89012345, 'X567490X', 'Luis', 'Pérez', 'luis@example.com', 5),
(12345678, 'X678901X', 'Marcela', 'Rodríguez', 'marcela@example.com', 6), 
(34567890, 'X789012X', 'David', 'Hernández', 'david@example.com', 7), 
(56789012, 'X890123X', 'Carolina', 'Vargas', 'carolina@example.com', 8),
(78901234, 'X901234X', 'Jorge', 'Sánchez', 'jorge@example.com', 9),
(90123456, 'X233567X', 'Marcelo', 'López', 'marcelo@example.com', 10), 
(13579246, 'X023456X', 'Juan', 'González', 'juan@example.com', 11), 
(24681357, 'X034567X', 'María', 'López', 'maria@example.com', 12), 
(35792468, 'X305678X', 'Pedro', 'Martínez', 'pedro@example.com', 13), 
(46813579, 'X456789X', 'Ana', 'García', 'ana@example.com', 14),
(57924680, 'X567890X', 'Luis', 'Pérez', 'luis@example.com', 15);


-- categoria repuesto

INSERT INTO categoriarepuesto (id_categoria, nombre) VALUES
(1, 'Motor y componentes'),
(2, 'Transmisión y embrague'),
(3, 'Sistema de escape'),
(4, 'Sistema de frenos'),
(5, 'Suspensión y dirección'),
(6, 'Sistema de enfriamiento'),
(7, 'Sistema eléctrico'),
(8, 'Sistema de combustible'),
(9, 'Sistema de aire acondicionado y calefacción'),
(10, 'Carrocería y cristales'),
(11, 'Sistema de iluminación'),
(12, 'Interior del vehículo'),
(13, 'Accesorios y componentes adicionales'),
(14, 'Neumáticos y ruedas'),
(15, 'Sistemas de seguridad'),
(16, 'Mantenimiento general y fluidos'),
(17, 'Sistemas de audio y navegación'),
(18, 'Sistema de dirección asistida'),
(19, 'Componentes de transmisión automática'),
(20, 'Sistema de suspensión neumática'),
(21, 'Sistema de mantenimiento y fluidos');

INSERT INTO repuestopieza (id_pieza, id_categoria, nombre_pieza, precio_unidad) VALUES
-- Motor y componentes
(1, 1, 'Bloque de motor', 1000.00),
(2, 1, 'Cigüeñal', 450.00),
(3, 1, 'Bujías', 15.00),
-- Transmisión y embrague
(4, 2, 'Caja de cambios', 1200.00),
(5, 2, 'Embrague', 350.00),
(6, 2, 'Convertidor de par', 500.00),
-- Sistema de escape
(7, 3, 'Silenciador', 200.00),
(8, 3, 'Catalizador', 600.00),
(9, 3, 'Tubos de escape', 150.00),
-- Sistema de frenos
(10, 4, 'Discos de freno', 100.00),
(11, 4, 'Pastillas de freno', 40.00),
(12, 4, 'Bombas de freno', 180.00),
-- Suspensión y dirección
(13, 5, 'Amortiguadores', 220.00),
(14, 5, 'Muelles de suspensión', 80.00),
(15, 5, 'Brazos de suspensión', 140.00),
-- Sistema de enfriamiento
(16, 6, 'Radiador', 300.00),
(17, 6, 'Termostato', 50.00),
(18, 6, 'Bomba de agua', 120.00),
-- Sistema eléctrico
(19, 7, 'Alternador', 250.00),
(20, 7, 'Batería', 180.00),
(21, 7, 'Motor de arranque', 220.00),
-- Sistema de combustible
(22, 8, 'Inyector de combustible', 120.00),
(23, 8, 'Bomba de combustible', 150.00),
(24, 8, 'Filtro de combustible', 25.00),
-- Sistema de aire acondicionado y calefacción
(25, 9, 'Compresor de aire acondicionado', 400.00),
(26, 9, 'Evaporador', 250.00),
(27, 9, 'Condensador', 180.00),
-- Carrocería y cristales
(28, 10, 'Parachoques', 300.00),
(29, 10, 'Guardabarros', 100.00),
(30, 10, 'Parabrisas', 250.00),
-- Sistema de iluminación
(31, 11, 'Faros delanteros', 150.00),
(32, 11, 'Luces traseras', 80.00),
(33, 11, 'Intermitentes', 30.00),
-- Interior del vehículo
(34, 12, 'Asientos', 500.00),
(35, 12, 'Alfombras', 60.00),
(36, 12, 'Volante', 200.00),
-- Accesorios y componentes adicionales
(37, 13, 'Espejos retrovisores', 70.00),
(38, 13, 'Sensores de estacionamiento', 90.00),
(39, 13, 'Portaequipajes', 120.00),
-- Neumáticos y ruedas
(40, 14, 'Neumáticos', 100.00),
(41, 14, 'Llantas', 150.00),
(42, 14, 'Tapacubos', 20.00),
-- Sistemas de seguridad
(43, 15, 'Airbags', 300.00),
(44, 15, 'Cinturones de seguridad', 50.00),
(45, 15, 'Sistemas de alarma', 200.00),
-- Mantenimiento general y fluidos
(46, 16, 'Aceite de motor', 30.00),
(47, 16, 'Líquido de frenos', 15.00),
(48, 16, 'Refrigerante', 20.00),
-- Sistemas de audio y navegación
(49, 17, 'Radio', 150.00),
(50, 17, 'Sistema de navegación GPS', 350.00),
(51, 17, 'Altavoces', 100.00),
-- Sistema de dirección asistida
(52, 18, 'Bomba de dirección asistida', 250.00),
(53, 18, 'Manguera de dirección', 50.00),
(54, 18, 'Líquido de dirección asistida', 15.00),
-- Componentes de transmisión automática
(55, 19, 'Convertidor de par', 400.00),
(56, 19, 'Válvula de transmisión', 200.00),
(57, 19, 'Solenoide de transmisión', 100.00),
-- Sistema de suspensión neumática
(58, 20, 'Compresor de suspensión neumática', 350.00),
(59, 20, 'Amortiguador neumático', 250.00),
(60, 20, 'Válvula de suspensión', 150.00),
-- Sistema de mantenimiento y fluidos
(61, 21, 'Aceite de transmisión', 25.00),
(62, 21, 'Limpiador de inyectores', 10.00),
(63, 21, 'Anticongelante', 20.00);

SELECT * FROM ordencompra

-- ordencompra 
INSERT INTO ordencompra (id_orden, fecha_orden, DNI_provedor, DNI_empleado, total) VALUES
(101, '2024-01-15 10:30:00', 98765432, 'AIM913R', 17000.00),
(102, '2024-01-16 11:00:00', 12345678, 'ALR321D', 1600.00),
(103, '2024-01-17 09:45:00', 45678901, 'CAP665F', 900.00),
(104, '2024-01-18 14:20:00', 34567890, 'MXF824P', 2640.00),
(105, '2024-01-19 08:30:00', 89012345, 'PMG789N', 1080.00),
(106, '2024-01-20 12:15:00', 57924680, 'PAM789C', 3850.00),
(107, '2024-01-21 16:40:00', 67890123, 'PMR852L', 4050.00),
(108, '2024-01-22 10:05:00', 13579246, 'PMR852L', 1100.00),
(109, '2024-01-23 15:55:00', 24681357, 'SXH736J', 660.00),
(110, '2024-01-24 11:50:00', 90123456, 'LGX896G', 220.00);


SELECT * FROM empleado;


INSERT INTO detallecompra (id_detalle_orden, id_orden, id_pieza, cantidad, precio) VALUES
(1, 101, 1, 34, 500.00),
(2, 102, 5, 8, 200.00),
(3, 103, 10, 12, 75.00),
(4, 104, 15, 22, 120.00),
(5, 105, 20, 12, 90.00),
(6, 106, 25, 11, 350.00),
(7, 107, 30, 9, 450.00),
(8, 108, 35, 10, 110.00),
(9, 109, 37, 6, 110.00),
(10, 110, 39, 2, 110.00);

-- inserciones a historia reparacion 

INSERT INTO historiareparacion (id_historia_reparacion, id_vehiculo, id_pieza, cantidad, fecha_ejecucion, fecha_finalizacion) VALUES
(1, 'BOA229', 1, 2, '2023-12-14 08:00:00', '2023-12-30 12:00:00'),
(2, 'CSU573', 5, 1, '2024-05-16 10:30:00', '2024-05-19 15:00:00'),
(3, 'BSA281', 10, 4, '2022-02-09 09:00:00', '2022-02-15 13:45:00'),
(4, 'GHI012', 15, 2, '2023-06-06 13:15:00', '2023-06-15 17:30:00'),
(5, 'MNO678', 32, 3, '2022-08-22 07:45:00', '2022-08-30 11:00:00'),
(6, 'OOO529', 32, 2, '2023-06-24 11:00:00', '2023-06-30 14:30:00'),
(7, 'UHK946', 30, 1, '2024-01-21 08:30:00', '2024-01-21 12:45:00'),
(8, 'XYZ123', 35, 3, '2015-07-01 14:00:00', '2015-07-11 18:00:00'),
(9, 'YYP173', 40, 2, '2023-12-16 10:15:00', '2023-12-20 15:30:00'),
(10, 'GRU810', 45, 4, '2024-03-12 12:45:00', '2024-03-18 17:15:00'),
(11, 'PQR901', 50, 1, '2024-09-12 09:30:00', '2024-01-25 13:00:00'),
(12, 'ABC456', 55, 2, '2024-09-16 08:00:00', '2024-09-20 12:00:00'),
(13, 'YSR328', 60, 3, '2024-01-23 11:30:00', '2024-01-30 15:45:00'),
(14, 'JSW375', 63, 1, '2024-01-28 13:00:00', '2024-01-28 17:30:00'),
(15, 'HXC839', 54, 2, '2024-09-17 08:45:00', '2024-09-17 12:30:00'),
(16, 'JKL345', 47, 4, '2023-04-06 10:00:00', '2023-04-16 14:15:00'),
(17, 'OBN836', 21, 1, '2023-01-12 09:15:00', '2023-01-22 13:45:00'),
(18, 'YZA890', 20, 1, '2023-11-03 07:30:00', '2023-11-13 11:00:00'),
(19, 'DEF789', 4, 1, '2024-02-26 12:00:00', '2024-03-01 16:30:00'),
(20, 'JQT791', 7, 3, '2018-09-09 10:30:00', '2018-09-19 14:45:00'),
(21, 'LPS177', 11, 6, '2023-11-12 08:15:00', '2023-11-22 12:45:00'),
(22, 'STU234', 17, 1, '2023-03-12 11:45:00', '2023-04-02 16:00:00'),
(23, 'TOO924', 15, 4, '2018-05-09 09:00:00', '2018-05-19 13:30:00'),
(24, 'NFV108', 15, 4, '2014-12-02 12:30:00', '2014-12-22 17:00:00'),
(25, 'VWX567', 49, 1, '2024-10-16 08:00:00', '2024-10-22 12:00:00');

SELECT * FROM historia_empelado;

SELECT * FROM historiareparacion;
-- CREATE VIEW vistaparainsercion AS
-- SELECT  CL.DNI_cliente AS Cliente,
--         FAC.fecha AS Factura_fecha_cliente,
--         VE.id_vehiculo AS PLACA
-- FROM vehiculo AS VE 
-- INNER JOIN cliente AS CL ON VE.id_vehiculo = CL.id_vehiculo
-- INNER JOIN factura AS FAC ON CL.`DNI_cliente` = FAC.`DNI_cliente`;

-- INSERCIONES A historia_empelado

-- CREATE VIEW historia_empleado_insercion AS
-- SELECT EM.DNI_empleado AS empleado,
--         TP.nombre_cargo AS CARGO
-- FROM empleado AS EM
-- INNER JOIN tipocargoempleado AS TP ON EM.id_tipo_cargo= TP.id_tipo_cargo
-- ORDER BY EM.DNI_empleado;

INSERT INTO historia_empelado (id_historia_reparacion, DNI_empleado) VALUES
(1, 'AIM913R'),
(2, 'ALR321D'),
(3, 'CAP665F'),
(3, 'ALR321D'),
(4, 'DAG145I'),
(5, 'GAH371S'),
(6, 'GJD963K'),
(7, 'JAR919Q'),
(8, 'JCL123A'),
(9, 'LGX896G'),
(10, 'LMG987O'),
(11, 'LMS456H'),
(12, 'LXG798T'),
(13, 'MAR741M'),
(14, 'MIG456B'),
(15, 'MXF824P'),
(16, 'PAM789C'),
(17, 'PMG789N'),
(18, 'PMR852L'),
(19, 'RLR789E'),
(20, 'SXH736J'),
(21, 'AIM913R'),
(22, 'ALR321D'),
(23, 'CAP665F'),
(24, 'DAG145I'),
(25, 'GAH371S'),
(1, 'GJD963K'),
(2, 'JAR919Q'),
(3, 'JCL123A'),
(4, 'LGX896G'),
(5, 'LMG987O'),
(6, 'LMS456H'),
(7, 'LXG798T'),
(8, 'MAR741M'),
(9, 'MIG456B'),
(10, 'MXF824P'),
(11, 'PAM789C'),
(12, 'PMG789N'),
(13, 'PMR852L'),
(14, 'RLR789E'),
(15, 'SXH736J'),
(16, 'AIM913R'),
(17, 'ALR321D'),
(18, 'CAP665F'),
(19, 'DAG145I'),
(20, 'GAH371S'),
(21, 'GJD963K'),
(22, 'JAR919Q'),
(23, 'JCL123A'),
(24, 'LGX896G'),
(25, 'LMG987O');

-- INSERCIONES AREA TALLER
INSERT INTO areataller (id_taller, nombre) VALUES
(1, 'Recepción y Atención al Cliente'),
(2, 'Diagnóstico y Evaluación'),
(3, 'Mecánica General'),
(4, 'Electricidad y Electrónica Automotriz'),
(5, 'Reparación de Transmisiones'),
(6, 'Frenos y Suspensión'),
(7, 'Alineación y Balanceo'),
(8, 'Cambio de Aceite y Lubricantes'),
(9, 'Carrocería y Pintura'),
(10, 'Vidrios y Cristales'),
(11, 'Accesorios y Personalización'),
(12, 'Inspección y Certificación'),
(13, 'Almacén de Repuestos'),
(14, 'Área de Espera para Clientes'),
(15, 'Administración y Gestión');

INSERT INTO inventario (id_inventario, id_pieza, id_marca_pieza, id_taller, stock) VALUES
('INV001', 1, 1, 1, 50),  -- Bloque de motor, Bosch, Recepción y Atención al Cliente
('INV002', 2, 2, 2, 30),  -- Cigüeñal, Denso, Diagnóstico y Evaluación
('INV003', 3, 3, 3, 40),  -- Bujías, Delphi, Mecánica General
('INV004', 4, 4, 4, 20),  -- Caja de cambios, Valeo, Electricidad y Electrónica Automotriz
('INV005', 5, 5, 5, 25),  -- Embrague, NGK, Reparación de Transmisiones
('INV006', 6, 6, 6, 15),  -- Convertidor de par, MagnaFlow, Frenos y Suspensión
('INV007', 7, 7, 7, 10),  -- Silenciador, Brembo, Alineación y Balanceo
('INV008', 8, 8, 8, 35),  -- Catalizador, Michelin, Cambio de Aceite y Lubricantes
('INV009', 9, 9, 9, 12),  -- Tubos de escape, Goodyear, Carrocería y Pintura
('INV010', 10, 10, 10, 45), -- Discos de freno, Continental, Vidrios y Cristales
('INV011', 11, 11, 11, 20), -- Pastillas de freno, KYB, Accesorios y Personalización
('INV012', 12, 12, 12, 50), -- Bombas de freno, Hella, Inspección y Certificación
('INV013', 13, 13, 13, 10), -- Amortiguadores, Monroe, Almacén de Repuestos
('INV014', 14, 14, 14, 25), -- Muelles de suspensión, Sachs, Área de Espera para Clientes
('INV015', 15, 15, 15, 30), -- Brazos de suspensión, TRW, Administración y Gestión
('INV016', 16, 1, 1, 60),  -- Radiador, Bosch, Recepción y Atención al Cliente
('INV017', 17, 2, 2, 22),  -- Termostato, Denso, Diagnóstico y Evaluación
('INV018', 18, 3, 3, 35),  -- Bomba de agua, Delphi, Mecánica General
('INV019', 19, 4, 4, 20),  -- Alternador, Valeo, Electricidad y Electrónica Automotriz
('INV020', 20, 5, 5, 25),  -- Batería, NGK, Reparación de Transmisiones
('INV021', 21, 6, 6, 15),  -- Motor de arranque, MagnaFlow, Frenos y Suspensión
('INV022', 22, 7, 7, 18),  -- Inyector de combustible, Brembo, Alineación y Balanceo
('INV023', 23, 8, 8, 20),  -- Bomba de combustible, Michelin, Cambio de Aceite y Lubricantes
('INV024', 24, 9, 9, 40),  -- Filtro de combustible, Goodyear, Carrocería y Pintura
('INV025', 25, 10, 10, 30), -- Compresor de aire acondicionado, Continental, Vidrios y Cristales
('INV026', 26, 11, 1, 18),  -- Evaporador, KYB, Recepción y Atención al Cliente
('INV027', 27, 12, 2, 22),  -- Condensador, Hella, Diagnóstico y Evaluación
('INV028', 28, 13, 3, 12),  -- Parachoques, Monroe, Mecánica General
('INV029', 29, 14, 4, 25),  -- Guardabarros, Sachs, Electricidad y Electrónica Automotriz
('INV030', 30, 15, 5, 30),  -- Parabrisas, TRW, Reparación de Transmisiones
('INV031', 31, 1, 6, 20),   -- Faros delanteros, Bosch, Frenos y Suspensión
('INV032', 32, 2, 7, 15),   -- Luces traseras, Denso, Alineación y Balanceo
('INV033', 33, 3, 8, 25),   -- Intermitentes, Delphi, Cambio de Aceite y Lubricantes
('INV034', 34, 4, 9, 50),   -- Asientos, Valeo, Carrocería y Pintura
('INV035', 35, 5, 10, 10),  -- Alfombras, NGK, Vidrios y Cristales
('INV036', 36, 6, 11, 45),  -- Volante, MagnaFlow, Accesorios y Personalización
('INV037', 37, 7, 12, 20),  -- Espejos retrovisores, Brembo, Inspección y Certificación
('INV038', 38, 8, 13, 30),  -- Sensores de estacionamiento, Michelin, Almacén de Repuestos
('INV039', 39, 9, 14, 25),  -- Portaequipajes, Goodyear, Área de Espera para Clientes
('INV040', 40, 10, 15, 35), -- Neumáticos, Continental, Administración y Gestión
('INV041', 41, 11, 1, 18),  -- Llantas, KYB, Recepción y Atención al Cliente
('INV042', 42, 12, 2, 22),  -- Tapacubos, Hella, Diagnóstico y Evaluación
('INV043', 43, 13, 3, 12),  -- Airbags, Monroe, Mecánica General
('INV044', 44, 14, 4, 25),  -- Cinturones de seguridad, Sachs, Electricidad y Electrónica Automotriz
('INV045', 45, 15, 5, 30),  -- Sistemas de alarma, TRW, Reparación de Transmisiones
('INV046', 46, 1, 6, 20),   -- Aceite de motor, Bosch, Frenos y Suspensión
('INV047', 47, 2, 7, 15),   -- Líquido de frenos, Denso, Alineación y Balanceo
('INV048', 48, 3, 8, 25),   -- Refrigerante, Delphi, Cambio de Aceite y Lubricantes
('INV049', 49, 4, 9, 50),   -- Radio, Valeo, Carrocería y Pintura
('INV050', 50, 5, 10, 10),  -- Sistema de navegación GPS, NGK, Vidrios y Cristales
('INV051', 51, 6, 11, 45),  -- Altavoces, MagnaFlow, Accesorios y Personalización
('INV052', 52, 7, 12, 20),  -- Bomba de dirección asistida, Brembo, Inspección y Certificación
('INV053', 53, 8, 13, 30),  -- Manguera de dirección, Michelin, Almacén de Repuestos
('INV054', 54, 9, 14, 25),  -- Líquido de dirección asistida, Goodyear, Área de Espera para Clientes
('INV055', 55, 10, 15, 35), -- Convertidor de par, Continental, Administración y Gestión
('INV056', 56, 11, 1, 18),  -- Válvula de transmisión, KYB, Recepción y Atención al Cliente
('INV057', 57, 12, 2, 22),  -- Solenoide de transmisión, Hella, Diagnóstico y Evaluación
('INV058', 58, 13, 3, 12),  -- Compresor de suspensión neumática, Monroe, Mecánica General
('INV059', 59, 14, 4, 25),  -- Amortiguador neumático, Sachs, Electricidad y Electrónica Automotriz
('INV060', 60, 15, 5, 30),  -- Válvula de suspensión, TRW, Reparación de Transmisiones
('INV061', 61, 1, 6, 20),   -- Aceite de transmisión, Bosch, Frenos y Suspensión
('INV062', 62, 2, 7, 15),   -- Limpiador de inyectores, Denso, Alineación y Balanceo
('INV063', 63, 3, 8, 25),   -- Anticongelante, Delphi, Cambio de Aceite y Lubricantes
('INV064', 24, 5, 9, 50),   -- Filtro de combustible, NGK, Carrocería y Pintura
('INV065', 22, 6, 10, 10),  -- Inyector de combustible, MagnaFlow, Vidrios y Cristales
('INV066', 23, 7, 11, 45),  -- Bomba de combustible, Brembo, Accesorios y Personalización
('INV067', 21, 8, 12, 20),  -- Motor de arranque, Michelin, Inspección y Certificación
('INV068', 20, 9, 13, 30),  -- Batería, Goodyear, Almacén de Repuestos
('INV069', 19, 10, 14, 25), -- Alternador, Continental, Área de Espera para Clientes
('INV070', 18, 11, 15, 35); -- Bomba de agua, KYB, Administración y Gestión

-- inserciones en la tabla tiposervicio
INSERT INTO tiposervicio (id_tipo_servicio, nombre_servicio) VALUES
(1, 'Servicio de Mantenimiento Preventivo'),
(2, 'Servicio de Diagnóstico de Fallas'),
(3, 'Servicio de Reparación de Frenos'),
(4, 'Servicio de Alineación y Balanceo'),
(5, 'Servicio de Reparación de Carrocería'),
(6, 'Servicio de Instalación de Accesorios'),
(7, 'Servicio de Inspección Técnica Vehicular (ITV)'),
(8, 'Servicio de Cambio de Neumáticos'),
(9, 'Servicio de Reparación de Sistemas Eléctricos'),
(10, 'Servicio de Reparación de Transmisiones');

--Inserciones en la tabla servicio 
INSERT INTO servico (id_servicio, id_taller, id_tipo_servicio, descrip, costo) VALUES
(1, 2, 1, 'Servicio de recepción y atención al cliente', 50.00),
(2, 2, 2, 'Servicio de diagnóstico y evaluación inicial', 100.00),
(3, 3, 3, 'Servicio de mantenimiento de motor y componentes', 150.00),
(4, 4, 4, 'Servicio de diagnóstico y reparación eléctrica', 120.00),
(5, 5, 5, 'Servicio de revisión y reparación de transmisiones', 200.00),
(6, 6, 6, 'Servicio de revisión y reparación de frenos y suspensión', 180.00),
(7, 7, 7, 'Servicio de alineación y balanceo de ruedas', 80.00),
(8, 8, 8, 'Servicio de cambio de aceite y lubricantes', 70.00),
(9, 9, 9, 'Servicio de reparación y pintura de carrocería', 250.00),
(10, 10, 6, 'Servicio de reparación y reemplazo de vidrios y cristales', 130.00),
(11, 11, 6, 'Servicio de instalación de accesorios y personalización', 150.00),
(12, 12, 1, 'Servicio de inspección y certificación vehicular', 90.00);

SELECT * FROM areataller;


SELECT * FROM historiareparacion;
SELECT * FROM servico;

-- Servicios relacionados con cada reparación
INSERT INTO servicio_reparacion (id_servicio_reparacion, id_servicio, id_historia_reparacion) VALUES
(1, 1, 1),    -- Servicio de recepción y atención al cliente para la reparación 1
(2, 2, 1),    -- Servicio de diagnóstico y evaluación inicial para la reparación 1
(3, 3, 1),    -- Servicio de mantenimiento de motor y componentes para la reparación 1
(4, 4, 2),
(5, 2, 2),    -- Servicio de diagnóstico y reparación eléctrica para la reparación 2
(6, 5, 3),
(7, 2, 3),    -- Servicio de revisión y reparación de transmisiones para la reparación 3
(8, 6, 3),    -- Servicio de revisión y reparación de frenos y suspensión para la reparación 3
(9, 7, 4),
(10, 2, 4),    -- Servicio de alineación y balanceo de ruedas para la reparación 4
(11, 8, 5),
(12, 2, 5),    -- Servicio de cambio de aceite y lubricantes para la reparación 5
(13, 9, 6),    -- Servicio de reparación y pintura de carrocería para la reparación 6
(14, 10, 6),  -- Servicio de reparación y reemplazo de vidrios y cristales para la reparación 6
(15, 11, 7),  -- Servicio de instalación de accesorios y personalización para la reparación 7
(16, 12, 7),
(17, 2, 7),  -- Servicio de inspección y certificación vehicular para la reparación 7
(18, 7, 7),
(19, 12, 8),
(20, 5, 9),
(21, 2, 9),
(22, 3, 9),
(23, 3, 9),
(24, 2, 10),
(25, 4, 10),
(26, 2, 11),
(27, 9, 11),
(28, 10, 12),
(29, 11, 13),
(30, 6, 14),
(31, 2, 14),
(32, 4, 14),
(33, 11, 15),
(34, 11, 16),
(35, 2, 17),
(36, 12, 17),
(37, 7, 18),
(38, 2, 18),
(39, 2, 19),
(40, 3, 19),
(41, 11, 20),
(42, 12, 21),
(43, 2, 21),
(44, 11, 22),
(45, 10, 23),
(46, 11, 24),
(47, 2, 25),
(48, 4, 25),
(49, 3, 25),
(50, 7, 25),
(51, 8, 25);


INSERT INTO estadocita (id_esta_cita, estado_cita) VALUES
(1, 'Cancelada'),
(2, 'Confirmada'),
(3, 'Pospuesta');

INSERT INTO cita (id_cita, DNI_cliente, id_vehiculo, id_servicio, fecha_cita, id_esta_cita) VALUES
('CITA01', '21', 'PQR901', 2, '2024-09-12 09:30:00', 2),
('CITA02', '14', 'HXC839', 3, '2024-09-17 08:45:00', 2),
('CITA04', 'xx', 'xxxxxx', NULL, NULL, 1);

-- Inserciones a la tabla detalle facctura

INSERT INTO detallefactura (id_servicio_reparacion, id_factura) VALUES
(38, 25),
(37, 25),
(51, 24),
(50, 24),
(49, 24),
(48, 24),
(47, 24),
(44, 23),
(27, 22),
(26, 22),
(12, 21),
(11, 21),
(34, 20),
(10, 19),
(9, 19),
(40, 18),
(39, 18),
(28, 17),
(33, 16),
(33, 15),
(45, 14),
(8, 13),
(7, 13),
(6, 13),
(32, 12),
(31, 12),
(30, 12),
(36, 11),
(35, 11),
(23, 10),
(22, 10),
(21, 10),
(20, 10),
(25, 9),
(24, 9),
(41, 8),
(46, 7),
(43, 6),
(42, 6),
(14, 5),
(13, 5),
(5, 4),
(4, 4),
(29, 3),
(3, 2),
(2, 2),
(1, 2),
(18, 1),
(17, 1),
(16, 1),
(15, 1);


SELECT COUNT(*) FROM provedor;
SELECT COUNT(*) FROM cliente;

SELECT COUNT(*) FROM empleado;

SELECT COUNT(*) FROM globaltelefono;

INSERT INTO provedortelefono (DNI_provedor, id_telefono_global) VALUES
(98765432, 1),
(23456789, 2),
(45678901, 3),
(67890123, 4),
(89012345, 5),
(12345678, 6),
(34567890, 7),
(56789012, 8),
(78901234, 9),
(90123456, 10),
(13579246, 11),
(24681357, 12),
(35792468, 13),
(46813579, 14),
(57924680, 15);

INSERT INTO clientetelefono (DNI_cliente, id_telefono_global) VALUES
('00000000', 16),
('00000001', 17),
('00000002', 18),
('00000003', 19),
('00000004', 20),
('00000005', 21),
('00000006', 22),
('00000007', 23),
('00000008', 24),
('00000009', 25),
('00000010', 26),
('00000011', 27),
('00000012', 28),
('00000013', 29),
('00000014', 30),
('00000015', 31),
('00000016', 32),
('00000017', 33),
('00000018', 34),
('00000019', 35),
('00000020', 36),
('00000021', 37),
('00000022', 38),
('00000023', 39),
('00000024', 40);

INSERT INTO empleadotelefono (DNI_empleado, id_telefono_global) VALUES
('JCL123A', 41),
('MIG456B', 42),
('PAM789C', 43),
('ALR321D', 44),
('RLR789E', 45),
('CAP665F', 46),
('LGX896G', 47),
('LMS456H', 48),
('DAG145I', 49),
('SXH736J', 50),
('GJD963K', 51),
('PMR852L', 52),
('MAR741M', 53),
('PMG789N', 54),
('LMG987O', 55),
('MXF824P', 56),
('JAR919Q', 57),
('AIM913R', 58),
('GAH371S', 59),
('LXG798T', 60);
