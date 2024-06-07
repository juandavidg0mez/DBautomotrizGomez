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

INSERT INTO cliente (DNI_cliente, NIT, nombre1, nombre2, apellido1, direccion, email, id_vehiculo) VALUES
(00000000, 'A1234567', 'Juan', 'Carlos', 'González', 'Calle 45 #12-34', 'juan.gonzalez@example.com', 'UHK946'),
(00000001, 'B2345678', 'María', NULL, 'Rodríguez', 'Calle 56 #23-45', 'maria.rodriguez@example.com', 'BOA229'),
(00000002, 'C3456789', 'Luis', 'Fernando', 'López', 'Calle 67 #34-56', 'luis.lopez@example.com', 'YSR328'),
(00000003, NULL, 'Ana', 'María', 'Fernández', 'Calle 78 #45-67', 'ana.fernandez@example.com', 'CSU573'),
(00000004, 'R5678901', 'Carlos', NULL, 'Pérez', 'Calle 89 #56-78', 'carlos.perez@example.com', 'OOO529'),
(00000005, 'R6789012', 'Laura', 'Isabel', 'Sánchez', 'Calle 90 #67-89', 'laura.sanchez@example.com', 'LPS177'),
(00000006, NULL, 'José', 'Miguel', 'Martínez', 'Calle 12 #78-90', 'jose.martinez@example.com', 'NFV108'),
(00000007, 'Y8901234', 'Marta', NULL, 'Gómez', 'Calle 23 #89-01', 'marta.gomez@example.com', 'JQT791'),
(00000008, 'I9012345', 'Pedro', 'Antonio', 'Ruiz', 'Calle 34 #90-12', 'pedro.ruiz@example.com', 'GRU810'),
(00000009, 'O1234567', 'Lucía', NULL, 'Díaz', 'Calle 45 #01-23', 'lucia.diaz@example.com', 'YYP173'),
(00000010, 'P2345678', 'Juan', 'Carlos', 'González', 'Calle 56 #12-34', 'juan.gonzalez2@example.com', 'OBN836'),
(00000011, 'Q3456789', 'María', 'Elena', 'Rodríguez', 'Calle 67 #23-45', 'maria.rodriguez2@example.com', 'JSW375'),
(00000012, NULL, 'Luis', 'Miguel', 'López', 'Calle 78 #34-56', 'luis.lopez2@example.com', 'BSA281'),
(00000013, 'A5678901', 'Ana', 'Lucía', 'Fernández', 'Calle 89 #45-67', 'ana.fernandez2@example.com', 'TOO924'),
(00000014, NULL, 'Carlos', 'Andrés', 'Pérez', 'Calle 90 #56-78', 'carlos.perez2@example.com', 'HXC839'),
(00000015, 'K7890123', 'Laura', 'Paola', 'Sánchez', 'Calle 12 #67-89', 'laura.sanchez2@example.com', 'XYZ123'),
(00000016, NULL, 'José', NULL, 'Martínez', 'Calle 23 #78-90', 'jose.martinez2@example.com', 'ABC456'),
(00000017, 'O9012345', 'Marta', 'Isabel', 'Gómez', 'Calle 34 #89-01', 'marta.gomez2@example.com', 'DEF789'),
(00000018, NULL, 'Pedro', 'Alejandro', 'Ruiz', 'Calle 45 #90-12', 'pedro.ruiz2@example.com', 'GHI012'),
(00000019, 'Y2345678', 'Lucía', 'María', 'Díaz', 'Calle 56 #01-23', 'lucia.diaz2@example.com', 'JKL345'),
(00000020, NULL, 'Juan', NULL, 'González', 'Calle 67 #12-34', 'juan.gonzalez3@example.com', 'MNO678'),
(00000021, 'U4567890', 'María', 'Luisa', 'Rodríguez', 'Calle 78 #23-45', 'maria.rodriguez3@example.com', 'PQR901'),
(00000022, NULL, 'Luis', 'Antonio', 'López', 'Calle 89 #34-56', 'luis.lopez3@example.com', 'STU234'),
(00000023, NULL, 'Ana', 'María', 'Fernández', 'Calle 90 #45-67', 'ana.fernandez3@example.com', 'VWX567'),
(00000024, NULL, 'Carlos', 'José', 'Pérez', 'Calle 12 #56-78', 'carlos.perez3@example.com', 'YZA890');


-- inserciones a tabla factura
INSERT INTO factura (id_factura, DNI_cliente, fecha, total) VALUES
(1, 00000000, '2023-06-06', 100.00),
(2, 00000001, '2023-07-16', 150.00),
(3, 00000002, '2023-12-16', 200.00),
(4, 00000003, '2023-4-06', 75.50),
(5, 00000004, '2023-12-14', 300.00),
(6, 00000005, '2023-01-12', 125.75),
(7, 00000006, '2023-07-23', 90.25),
(8, 00000007, '2022-08-22', 180.50),
(9, 00000008, '2024-09-12', 210.00),
(10, 00000009, '2024-05-16', 50.00),
(11, 00000010, '2022-02-09', 175.25),
(12, 00000011, '2023-03-12', 225.75),
(13, 00000012, '2018-05-09', 80.00),
(14, 00000013, '2023-06-24', 120.50),
(15, 00000014, '2024-09-17', 300.00),
(16, 00000014, '2024-10-16', 150.00),
(17, 00000016, '2023-11-12', 200.25),
(18, 00000017, '2023-11-03', 180.00),
(19, 00000018, '2014-12-02', 90.75),
(20, 00000019, '2015-07-01', 175.50),
(21, 00000020, '2018-09-09', 250.00),
(22, 00000021, '2024-09-16', 300.25),
(23, 00000022, '2024-03-12', 175.00),
(24, 00000023, '2024-02-26', 50.75),
(25, 00000024, '2024-01-23', 125.50);

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

INSERT INTO provedor (DNI_provedor, NIT, nombre1, nombre2, apellido1, direccion, email, id_marca_pieza) VALUES
(12355678, 'X133456X', 'Juan', 'Manuel', 'González', 'Calle 123, Ciudad', 'juan@example.com', 1),
(20456789, 'X230956X', 'María', NULL, 'López', 'Av. Principal, Pueblo', 'maria@example.com', 2), 
(34367890, 'X345678X', 'Pedro', 'José', 'Martínez', 'Carrera 45, Villa', 'pedro@example.com', 3), 
(45678901, 'X406789X', 'Ana', 'Sofía', 'García', 'Av. Libertadores, Barrio', 'ana@example.com', 4), 
(50789012, 'X567490X', 'Luis', NULL, 'Pérez', 'Calle 56, Aldea', 'luis@example.com', 5),
(67800123, 'X678901X', 'Marcela', 'Isabel', 'Rodríguez', 'Calle 67, Pueblo Nuevo', 'marcela@example.com', 6), 
(08901234, 'X789012X', 'David', NULL, 'Hernández', 'Av. Bolívar, Villa Real', 'david@example.com', 7), 
(89012345, 'X890123X', 'Carolina', 'Elena', 'Vargas', 'Calle 89, Colina', 'carolina@example.com', 8),
(90123456, 'X901234X', 'Jorge', NULL, 'Sánchez', 'Av. Principal, Urbanización', 'jorge@example.com', 9),
(36567890, 'X233567X', 'Marcelo', 'Antonio', 'López', 'Av. Bolívar, Pueblo', 'marcelo@example.com', 10), 
(12345678, 'X023456X', 'Juan', 'Manuel', 'González', 'Calle 123, Ciudad', 'juan@example.com', 11), 
(03056789, 'X034567X', 'María', NULL, 'López', 'Av. Principal, Pueblo', 'maria@example.com', 12), 
(34567890, 'X305678X', 'Pedro', 'José', 'Martínez', 'Carrera 45, Villa', 'pedro@example.com', 13), 
(45078901, 'X456789X', 'Ana', 'Sofía', 'García', 'Av. Libertadores, Barrio', 'ana@example.com', 14),
(56709012, 'X567890X', 'Luis', NULL, 'Pérez', 'Calle 56, Aldea', 'luis@example.com', 15); 

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

INSERT INTO repuestopieza (id_pieza, id_categoria, nombre_pieza) VALUES
-- Motor y componentes
(1, 1, 'Bloque de motor'),
(2, 1, 'Cigüeñal'),
(3, 1, 'Bujías'),
-- Transmisión y embrague
(4, 2, 'Caja de cambios'),
(5, 2, 'Embrague'),
(6, 2, 'Convertidor de par'),
-- Sistema de escape
(7, 3, 'Silenciador'),
(8, 3, 'Catalizador'),
(9, 3, 'Tubos de escape'),
-- Sistema de frenos
(10, 4, 'Discos de freno'),
(11, 4, 'Pastillas de freno'),
(12, 4, 'Bombas de freno'),
-- Suspensión y dirección
(13, 5, 'Amortiguadores'),
(14, 5, 'Muelles de suspensión'),
(15, 5, 'Brazos de suspensión'),
-- Sistema de enfriamiento
(16, 6, 'Radiador'),
(17, 6, 'Termostato'),
(18, 6, 'Bomba de agua'),
-- Sistema eléctrico
(19, 7, 'Alternador'),
(20, 7, 'Batería'),
(21, 7, 'Motor de arranque'),
-- Sistema de combustible
(22, 8, 'Inyector de combustible'),
(23, 8, 'Bomba de combustible'),
(24, 8, 'Filtro de combustible'),
-- Sistema de aire acondicionado y calefacción
(25, 9, 'Compresor de aire acondicionado'),
(26, 9, 'Evaporador'),
(27, 9, 'Condensador'),
-- Carrocería y cristales
(28, 10, 'Parachoques'),
(29, 10, 'Guardabarros'),
(30, 10, 'Parabrisas'),
-- Sistema de iluminación
(31, 11, 'Faros delanteros'),
(32, 11, 'Luces traseras'),
(33, 11, 'Intermitentes'),
-- Interior del vehículo
(34, 12, 'Asientos'),
(35, 12, 'Alfombras'),
(36, 12, 'Volante'),
-- Accesorios y componentes adicionales
(37, 13, 'Espejos retrovisores'),
(38, 13, 'Sensores de estacionamiento'),
(39, 13, 'Portaequipajes'),
-- Neumáticos y ruedas
(40, 14, 'Neumáticos'),
(41, 14, 'Llantas'),
(42, 14, 'Tapacubos'),
-- Sistemas de seguridad
(43, 15, 'Airbags'),
(44, 15, 'Cinturones de seguridad'),
(45, 15, 'Sistemas de alarma'),
-- Mantenimiento general y fluidos
(46, 16, 'Aceite de motor'),
(47, 16, 'Líquido de frenos'),
(48, 16, 'Refrigerante'),
-- Sistemas de audio y navegación
(49, 17, 'Radio'),
(50, 17, 'Sistema de navegación GPS'),
(51, 17, 'Altavoces'),
-- Sistema de dirección asistida
(52, 18, 'Bomba de dirección asistida'),
(53, 18, 'Manguera de dirección'),
(54, 18, 'Líquido de dirección asistida'),
-- Componentes de transmisión automática
(55, 19, 'Convertidor de par'),
(56, 19, 'Válvula de transmisión'),
(57, 19, 'Solenoide de transmisión'),
-- Sistema de suspensión neumática
(58, 20, 'Compresor de suspensión neumática'),
(59, 20, 'Amortiguador neumático'),
(60, 20, 'Válvula de suspensión'),
-- Sistema de mantenimiento y fluidos
(61, 21, 'Aceite de transmisión'),
(62, 21, 'Limpiador de inyectores'),
(63, 21, 'Anticongelante');


-- ordencompra 
INSERT INTO ordencompra (id_orden, fecha_orden, DNI_provedor, DNI_empleado, total) VALUES
(101, '2024-01-15 10:30:00', 3056789,  'AIM913R', 17000.00),
(102, '2024-01-16 11:00:00', 12345678, 'ALR321D', 1600.00),
(103, '2024-01-17 09:45:00', 34367890, 'CAP665F', 900.00),
(104, '2024-01-18 14:20:00', 34567890, 'MXF824P', 2640.00),
(105, '2024-01-19 08:30:00', 36567890, 'PMG789N', 1080.00),
(106, '2024-01-20 12:15:00', 45678901, 'PAM789C', 3850.00),
(107, '2024-01-21 16:40:00', 56709012, 'PMR852L' 4050.00),
(108, '2024-01-22 10:05:00', 67800123, 'PMR852L', 1100.00),
(109, '2024-01-23 15:55:00', 08901234, 'SXH736J', 660.00),
(110, '2024-01-24 11:50:00', 89012345, 'LGX896G', 220.00);

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

SELECT * FROM historiareparacion;
-- CREATE VIEW vistaparainsercion AS
-- SELECT  CL.DNI_cliente AS Cliente,
--         FAC.fecha AS Factura_fecha_cliente,
--         VE.id_vehiculo AS PLACA
-- FROM vehiculo AS VE 
-- INNER JOIN cliente AS CL ON VE.id_vehiculo = CL.id_vehiculo
-- INNER JOIN factura AS FAC ON CL.`DNI_cliente` = FAC.`DNI_cliente`;

-- INSERCIONES A historia_empelado

CREATE VIEW historia_empleado_insercion AS
SELECT EM.DNI_empleado AS empleado,
        TP.nombre_cargo AS CARGO
FROM empleado AS EM
INNER JOIN tipocargoempleado AS TP ON EM.id_tipo_cargo= TP.id_tipo_cargo;

INSERT INTO historia_empleado (id_historia_reparacion, DNI_empleado) VALUES
(1, 1234567890),
(2, 2345678901),
(3, 3456789012),
(4, 4567890123),
(5, 5678901234),
(6, 6789012345),
(7, 7890123456),
(8, 8901234567),
(9, 9012345678),
(10, 1023456789);