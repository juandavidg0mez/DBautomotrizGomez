-- Consulta de cuandos servios tiene cada carro y su costo total Factura



-- ==========================================================


/*
Consultas requeridas
1. Obtener el historial de reparaciones de un vehículo específico
*/

SELECT SR.descrip AS Descripcion, SR.costo AS Valor_Serviio
FROM historiareparacion AS HR
INNER JOIN servicio_reparacion AS  S_R ON HR.id_historia_reparacion = S_R.id_historia_reparacion
INNER JOIN servico AS SR ON S_R.id_servicio = SR.id_servicio
WHERE HR.id_vehiculo = 'VWX567';

/*
2. Calcular el costo total de todas las reparaciones realizadas por un empleado
específico en un período de tiempo
*/

SELECT 
    CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado , OC.fecha_orden AS Fecha, SUM(OC.total) AS Total
    FROM empleado AS EM
    INNER JOIN ordencompra AS OC ON EM.DNI_empleado = OC.DNI_empleado
    WHERE YEAR(OC.fecha_orden) = 2024 AND EM.DNI_empleado = 'AIM913R'
    GROUP BY Empleado , Fecha;


/*
3. Listar todos los clientes y los vehículos que poseen
*/

SELECT  CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado , VH.id_vehiculo AS PLACA , M.nombre AS Marca_Vehiculo
FROM marcavehiculo AS M
INNER JOIN vehiculo AS VH ON M.id_marca =  VH.id_marca
INNER JOIN cliente AS EM ON VH.id_vehiculo = EM.id_vehiculo;

/*
4. Obtener la cantidad de piezas en inventario para cada pieza
*/

SELECT RP.nombre_pieza AS PIEZA_DESC, INV.stock
FROM repuestopieza AS RP
INNER JOIN inventario AS INV ON RP.id_pieza = INV.id_pieza;

/*
5. Obtener las citas programadas para un día específico
*/

SELECT  CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente , C.fecha_cita AS Fecha
FROM cita AS C
INNER JOIN cliente AS EM ON C.DNI_cliente = EM.DNI_cliente;

/*
6. Generar una factura para un cliente específico en una fecha determinada
*/

SELECT F.fecha AS Fecha , VF.Cliente AS Cliente , VF.Cantidad_servicos_adquiridos AS Cantidad , VF.total_servicio AS Total
FROM factura AS F
INNER JOIN vista_factura_detalles AS VF ON F.DNI_cliente = VF.DNI
WHERE YEAR(F.fecha) = 2023;

/*
7. Listar todas las órdenes de compra y sus detalles
*/

SELECT *
FROM ordencompra AS O
INNER JOIN detallecompra AS DO ON O.id_orden = DO.id_orden;


/*
8. Obtener el costo total de piezas utilizadas en una reparación específica
*/

SELECT HR.id_vehiculo AS PLACA, HR.cantidad AS Cantidad_utilizada_Piezas, (R.precio_unidad * HR.cantidad  ) AS Costo_NETO
FROM historiareparacion AS HR
INNER JOIN repuestopieza AS R ON HR.id_pieza = R.id_pieza
WHERE YEAR(fecha_finalizacion) = 2024;

/*
9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)
*/

SELECT INV.id_inventario AS NUM_INV, INV.stock AS Stock, R.nombre_pieza AS Nombre_Pieza
FROM repuestopieza AS R
INNER JOIN inventario AS INV ON R.id_pieza = INV.id_pieza
WHERE INV.stock = 15;

/*
10. Obtener la lista de servicios más solicitados en un período específico
*/

SELECT SR.descrip AS Tipo_Servicio_Solicitado, C.fecha_cita AS Fecha_Citas, COUNT(TS.id_tipo_servicio) AS MAX_C
FROM tiposervicio AS TS
INNER JOIN servico AS SR ON TS.id_tipo_servicio = SR.id_tipo_servicio
INNER JOIN cita AS C ON SR.id_servicio = C.id_servicio
GROUP BY Tipo_Servicio_Solicitado, Fecha_Citas;

/*
11. Obtener el costo total de reparaciones para cada cliente en un período
específico
*/

SELECT VF.Cliente AS CLIENTE ,
VF.`PLACA` AS PLACA,
VF.`Cantidad_servicos_adquiridos` AS Caant_Servicio,
VF.total_servicio AS Total,
FT.fecha AS Fecha_2022
FROM vista_factura_detalles AS VF
INNER JOIN factura AS FT ON VF.DNI = FT.`DNI_cliente`
WHERE YEAR(FT.fecha) = 2022;

/*
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
período específico
*/

-- se puede utyilizar la especificacion de la PLACA para saber que cantiad de empleados trabajaron ella.
-- Crear una tabla temporal o vista donde viuzulice el DIFF de tiempo trabajo por cada placa y sus empleados azociados en este caso el DNI del mismo

SELECT   CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado, 
        COUNT(HE.DNI_empleado) AS Cantitad_Reparacion_X_Empleado
FROM empleado AS EM
INNER JOIN historia_empelado AS HE ON EM.`DNI_empleado` = HE.`DNI_empleado`
INNER JOIN historiareparacion AS HR ON HE.id_historia_reparacion = HR.id_historia_reparacion
GROUP BY Empleado;

/*
13. Obtener las piezas más utilizadas en reparaciones durante un período
específico
*/

WITH tem_query AS (
    SELECT
        COUNT(HR.id_pieza) AS Cantidad_X_Reparcion,
        RP.nombre_pieza AS Nombre
    FROM historiareparacion AS HR
    INNER JOIN 
        repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    GROUP BY Nombre
)
SELECT 
    Cantidad_X_Reparcion, Nombre
FROM 
    tem_query
WHERE Cantidad_X_Reparcion = (SELECT MAX(Cantidad_X_Reparcion) FROM tem_query)
GROUP BY Nombre

/*
14. Calcular el promedio de costo de reparaciones por vehículo
*/

SELECT 
CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente,
VH.id_vehiculo AS PLACA , 
COUNT(SR.id_historia_reparacion) AS Cantidad_servicos_adquiridos, 
FORMAT(AVG(SV.costo), 1) AS promedio_servicio
FROM cliente AS EM
INNER JOIN vehiculo AS V ON EM.id_vehiculo = V.id_vehiculo
INNER JOIN historiareparacion AS VH ON V.id_vehiculo = VH.id_vehiculo
INNER JOIN servicio_reparacion AS SR ON VH.id_historia_reparacion = SR.id_historia_reparacion
INNER JOIN servico AS SV ON SR.id_servicio = SV.id_servicio
GROUP BY PLACA , Cliente ;


/*
15. Obtener el inventario de piezas por proveedor
*/

SELECT  EM.NIT AS Provedor,
        RP.nombre_pieza AS Nombre,
        INV.stock AS STOCK_Pieza_INV
FROM provedor AS EM
INNER JOIN marcapieza AS MP ON EM.id_marca_pieza = MP.id_marca_pieza
INNER JOIN inventario AS INV ON MP.id_marca_pieza = INV.id_marca_pieza
INNER JOIN repuestopieza AS RP ON INV.id_pieza = RP.id_pieza;


/*
16. Listar los clientes que no han realizado reparaciones en el último año
*/

SELECT  
CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente,
HR.id_vehiculo AS PLACA,
HR.fecha_ejecucion AS Ultima_Reparacion
FROM cliente AS EM
INNER JOIN vehiculo AS V ON EM.id_vehiculo = V.id_vehiculo
INNER JOIN historiareparacion AS HR ON V.id_vehiculo = HR.id_vehiculo
WHERE HR.fecha_ejecucion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

/*
17. Obtener las ganancias totales del taller en un período específico
*/

SELECT  
        SUM(FV.total_servicio) AS Total_ingresos_2024
FROM historiareparacion AS HR
INNER JOIN vista_factura_detalles AS FV ON HR.id_vehiculo = FV.`PLACA`
WHERE HR.fecha_ejecucion BETWEEN '2024-01-01' AND '2024-12-31';

/*
18. Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación)
*/

WITH tiempo_trabajado_X_empleado AS(
    SELECT   CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado, 
        EM.`DNI_empleado` AS Empleado_DNI,
        ABS(SUM(TIMESTAMPDIFF(HOUR, HR.fecha_ejecucion, HR.fecha_finalizacion ))) AS Horas_JOB,
        ABS(SUM(DATEDIFF(HR.fecha_ejecucion, HR.fecha_finalizacion))) AS Dias_JOB
FROM empleado AS EM
INNER JOIN historia_empelado AS HE ON EM.`DNI_empleado` = HE.`DNI_empleado`
INNER JOIN historiareparacion AS HR ON HE.id_historia_reparacion = HR.id_historia_reparacion
WHERE YEAR(HR.fecha_ejecucion) = 2024
GROUP BY Empleado, Empleado_DNI
)
SELECT FORMAT((Horas_JOB / 8),0) AS Turnos_X_Dia, Horas_JOB, Empleado
FROM tiempo_trabajado_X_empleado;

/*
19. Obtener el listado de servicios prestados por cada empleado en un período
específico
*/

SELECT SR.descrip AS Descripcion_Servicio,
CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado,
TEM.nombre_cargo AS Cargo_Empleado,
EM.`DNI_empleado`
FROM tiposervicio AS TS
INNER JOIN servico AS SR ON TS.id_tipo_servicio = SR.id_tipo_servicio
INNER JOIN servicio_reparacion AS SP ON SR.id_servicio = SP.id_servicio
INNER JOIN historiareparacion AS HR ON SP.id_historia_reparacion = HR.id_historia_reparacion
INNER JOIN historia_empelado AS HM ON HR.id_historia_reparacion = HM.id_historia_reparacion
INNER JOIN empleado AS EM ON HM.DNI_empleado = EM.DNI_empleado
INNER JOIN tipocargoempleado AS TEM ON EM.id_tipo_cargo = TEM.id_tipo_cargo
WHERE YEAR(HR.fecha_ejecucion) = 2024;

-- Subconsultas

/*
1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
*/

SELECT MAX(VF.total_servicio) AS Max_gasto , 
HR.fecha_ejecucion AS Fecha, 
VF.cliente AS Nombre_cliente
FROM vista_factura_detalles AS VF
INNER JOIN historiareparacion AS HR ON VF.`PLACA` = HR.id_vehiculo
GROUP BY fecha, Nombre_cliente
HAVING YEAR(HR.fecha_ejecucion) = 2024;

/*
2. Obtener la pieza más utilizada en reparaciones durante el último mes
*/

WITH tem_query AS (
    SELECT
        COUNT(HR.id_pieza) AS Cantidad_X_Reparcion,
        RP.nombre_pieza AS Nombre,
        HR.fecha_ejecucion AS Fecha
    FROM historiareparacion AS HR
    INNER JOIN repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    GROUP BY Nombre, Fecha
    HAVING MONTH(HR.fecha_ejecucion) = 5 AND YEAR(HR.fecha_ejecucion) = 2024
)
SELECT 
    Cantidad_X_Reparcion, Nombre, Fecha
FROM 
    tem_query
WHERE Cantidad_X_Reparcion = (SELECT MAX(Cantidad_X_Reparcion) FROM tem_query)
GROUP BY Nombre, Fecha;

/*
3. Obtener los proveedores que suministran las piezas más caras
*/

WITH precio_MAX AS (
    SELECT  EM.NIT AS Provedor,
        RP.nombre_pieza AS Nombre,
        INV.stock AS STOCK_Pieza_INV,
        RP.precio_unidad AS Precio_unidad
FROM provedor AS EM
INNER JOIN marcapieza AS MP ON EM.id_marca_pieza = MP.id_marca_pieza
INNER JOIN inventario AS INV ON MP.id_marca_pieza = INV.id_marca_pieza
INNER JOIN repuestopieza AS RP ON INV.id_pieza = RP.id_pieza
)
SELECT Precio_unidad, Nombre
FROM precio_MAX
WHERE Precio_unidad = (SELECT MAX(precio_unidad) FROM precio_MAX);

/*
4. Listar las reparaciones que no utilizaron piezas específicas durante el último
año
*/
SELECT
        RP.nombre_pieza AS Nombre
    FROM historiareparacion AS HR
    RIGHT JOIN repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    WHERE HR.fecha_ejecucion is NULL;

SELECT
        RP.nombre_pieza AS Nombre,
        HR.fecha_ejecucion AS Fecha
    FROM historiareparacion AS HR
    LEFT JOIN repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    WHERE HR.fecha_ejecucion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY Nombre, Fecha;

/*
5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
*/

WITH lista_stock_pieza AS(
    
    SELECT
        RP.nombre_pieza AS Nombre_pieza,
        INV.stock AS STOCK
FROM repuestopieza AS RP
INNER JOIN inventario AS INV ON RP.id_pieza = INV.id_pieza
)
SELECT  STOCK, Nombre_pieza
FROM lista_stock_pieza
WHERE STOCK < (STOCK * 0.10);


-- Procedimientos Almacenados

/*
1. Crear un procedimiento almacenado para insertar una nueva reparación.
*/


DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_producto;
CREATE PROCEDURE insertar_producto(
IN id_historia_reparacion INT,
IN id_vehiculo VARCHAR(6),
IN id_pieza INT,
IN cantidad SMALLINT,
IN fecha_ejecucion DATETIME,
IN fecha_finalizacion DATETIME)
BEGIN
INSERT INTO historiareparacion(id_historia_reparacion, id_vehiculo, id_pieza, cantidad, fecha_ejecucion, fecha_finalizacion) VALUES
(id_historia_reparacion, id_vehiculo, id_pieza, cantidad, fecha_ejecucion, fecha_finalizacion);
END $$
DELIMITER ;

CALL insertar_producto(26,'STU234',17,8,'2024-6-16 08:00:00','2024-6-22 12:00:00');

/*
2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_INV_pieza;
CREATE PROCEDURE actualizar_INV_pieza(
    IN N_id_inventario VARCHAR(10),
    IN N_id_pieza INT,
    IN N_id_marca_pieza INT,
    IN N_id_taller INT,
    IN N_stock INT
)
BEGIN
DECLARE mensaje VARCHAR(100);
UPDATE  inventario
SET
    id_pieza =  N_id_pieza,
    id_marca_pieza =  N_id_marca_pieza,
    id_taller = N_id_taller,
    stock = N_stock
WHERE id_inventario = N_id_inventario;
IF ROW_COUNT() > 0 THEN
SET mensaje = CONCAT('El producto con ID ', N_id_inventario, ' ha sido
actualizado exitosamente.');
ELSE
SET mensaje = 'No se encontró ningún producto con el ID proporcionado
para actualizar.';
END IF;
SELECT mensaje AS 'Mensaje';
END $$
DELIMITER ;

CALL actualizar_INV_pieza('INV062', 61, 3 , 9, 12 );

/*
3. Crear un procedimiento almacenado para eliminar una cita
*/


DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_cita;
CREATE PROCEDURE eliminar_cita(
    IN id VARCHAR(6)
)
BEGIN
DELETE FROM cita
WHERE id_cita = id;
    IF ROW_COUNT() > 0 THEN
        SELECT 'Registro eliminado exitosamente' AS resultado;
    ELSE
        SELECT 'No se encontró el registro' AS resultado;
    END IF;
END$$
DELIMITER ;
CALL eliminar_cita('CITA04');

/*
4. Crear un procedimiento almacenado para generar una factura
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS generar_factura;
CREATE PROCEDURE generar_factura(
    IN codec_cliente VARCHAR(16)
)
BEGIN
SELECT  VF.DNI AS DNI,
        VF.Cliente AS Cliente, 
        VF.PLACA AS PLACA,
        VF.Cantidad_servicos_adquiridos AS Cantidad_servicos,
        F.fecha AS Fecha_Fact,
        VF.total_servicio AS Total
FROM vista_factura_detalles AS VF
INNER JOIN factura AS F ON VF.DNI = F.DNI_cliente
WHERE VF.DNI = codec_cliente;
END$$

DELIMITER;

CALL generar_factura('00000019');

/*
5. Crear un procedimiento almacenado para obtener el historial de reparaciones
de un vehículo
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS repaciones_vehiculo;
CREATE PROCEDURE repaciones_vehiculo(
    IN codec_vehiculo VARCHAR(6)
)
BEGIN
SELECT SR.descrip AS Descripcion, SR.costo AS Valor_Serviio
FROM historiareparacion AS HR
INNER JOIN servicio_reparacion AS  S_R ON HR.id_historia_reparacion = S_R.id_historia_reparacion
INNER JOIN servico AS SR ON S_R.id_servicio = SR.id_servicio
WHERE HR.id_vehiculo = codec_vehiculo;
END$$
DELIMITER ;
CALL repaciones_vehiculo('VWX567');



/*
6. Crear un procedimiento almacenado para calcular el costo total de
reparaciones de un cliente en un período
*/

/*

DELIMITER $$
DROP PROCEDURE IF EXISTS repaciones_vehiculo_aino;
CREATE PROCEDURE repaciones_vehiculo_aino(
    IN codec_cliente VARCHAR(16),
    IN aino INT
)
BEGIN
SELECT 
EM.DNI_cliente AS DNI,
CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente,
VH.id_vehiculo AS PLACA , 
COUNT(SR.id_historia_reparacion) AS Cantidad_servicos_adquiridos, 
SUM(SV.costo) AS total_servicio
FROM cliente AS EM
INNER JOIN vehiculo AS V ON EM.id_vehiculo = V.id_vehiculo
INNER JOIN historiareparacion AS VH ON V.id_vehiculo = VH.id_vehiculo
INNER JOIN servicio_reparacion AS SR ON VH.id_historia_reparacion = SR.id_historia_reparacion
INNER JOIN servico AS SV ON SR.id_servicio = SV.id_servicio
WHERE YEAR(VH.fecha_ejecucion) = aino AND EM.DNI_cliente = codec_cliente
GROUP BY PLACA , Cliente, DNI;
END$$
DELIMITER ;
CALL repaciones_vehiculo_aino('00000017', 2023);

*/



DELIMITER $$
DROP PROCEDURE IF EXISTS repaciones_vehiculo_aino;
CREATE PROCEDURE repaciones_vehiculo_aino(
    IN codec_cliente VARCHAR(16),
    IN aino INT
)
BEGIN
    DECLARE total_registros INT;

    CREATE TEMPORARY TABLE IF NOT EXISTS temp_resultados (
        DNI VARCHAR(16),
        Cliente VARCHAR(255),
        PLACA VARCHAR(20),
        Cantidad_servicios_adquiridos INT,
        total_servicio DECIMAL(10, 2)
    );

    INSERT INTO temp_resultados
    SELECT 
        EM.DNI_cliente AS DNI,
        CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente,
        VH.id_vehiculo AS PLACA , 
        COUNT(SR.id_historia_reparacion) AS Cantidad_servicos_adquiridos, 
        SUM(SV.costo) AS total_servicio
    FROM 
        cliente AS EM
    INNER JOIN 
        vehiculo AS V ON EM.id_vehiculo = V.id_vehiculo
    INNER JOIN 
        historiareparacion AS VH ON V.id_vehiculo = VH.id_vehiculo
    INNER JOIN 
        servicio_reparacion AS SR ON VH.id_historia_reparacion = SR.id_historia_reparacion
    INNER JOIN 
        servico AS SV ON SR.id_servicio = SV.id_servicio
    WHERE 
        YEAR(VH.fecha_ejecucion) = aino AND EM.DNI_cliente = codec_cliente
    GROUP BY 
        PLACA, Cliente, DNI;


    SELECT COUNT(*) INTO total_registros FROM temp_resultados;

    
    IF total_registros = 0 THEN
        
        SELECT 'No se encontraron reparaciones para el cliente especificado en el año especificado.' AS mensaje;
    ELSE

        SELECT * FROM temp_resultados;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_resultados;
END$$

DELIMITER ;

CALL repaciones_vehiculo_aino('00000017', 2022);


/*
7. Crear un procedimiento almacenado para obtener la lista de vehículos que
requieren mantenimiento basado en el kilometraje.
*/

/*
8. Crear un procedimiento almacenado para insertar una nueva orden de compra
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_nueva_compra;

CREATE PROCEDURE insertar_nueva_compra(
    -- parametros tabla orden compra
    IN id_orden INT,
    IN fecha_orden DATETIME,
    IN DNI_provedor INT,
    IN DNI_empleado VARCHAR(16),
    -- parametros tabla detalles compra
    IN id_detalle_orden INT,
    iN id_orden_2 INT,
    IN id_pieza INT,
    IN cantidad SMALLINT,
    IN precio DECIMAL(10,2) 
)
BEGIN
DECLARE total_precio DECIMAL(10,2);

SET total_precio = cantidad * precio;



    -- Insertar datos en la tabla ordencompra
    INSERT INTO ordencompra(id_orden, fecha_orden, DNI_provedor, DNI_empleado) VALUES
    (id_orden, fecha_orden, DNI_provedor, DNI_empleado); -- prametros

    -- Insertar datos en la tabla detallecompra
    INSERT INTO detallecompra(id_detalle_orden, id_orden, id_pieza, cantidad, precio) VALUES
    (id_detalle_orden, id_orden_2, id_pieza, cantidad, precio);

UPDATE ordencompra
SET total = total_precio
WHERE id_orden = id_orden;

END$$

DELIMITER ;
CALL insertar_nueva_compra(111, '2024-06-10 11:00:00', 98765432, 'AIM913R', 11, 111, 50, 2, 350.00);

/*
9. Crear un procedimiento almacenado para actualizar los datos de un cliente
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_cliente;

CREATE PROCEDURE actualizar_cliente(
    IN N_DNI_cliente VARCHAR(16),
    IN N_NIT VARCHAR(16),
    IN N_nombre1 VARCHAR(20),
    IN N_nombre2 VARCHAR(20),
    IN N_apellido1 VARCHAR(20),
    IN N_direccion VARCHAR(200),
    IN N_email VARCHAR(200),
    IN N_id_vehiculo VARCHAR(6)

)
BEGIN
DECLARE mensaje VARCHAR(100);
UPDATE cliente
SET 
    DNI_cliente = N_DNI_cliente,
    NIT = N_NIT,
    nombre1 = N_nombre1,
    nombre2 = N_nombre2,
    apellido1 = N_apellido1,
    direccion = N_direccion,
    email = N_email,
    id_vehiculo = N_id_vehiculo
WHERE
    DNI_cliente = N_DNI_cliente;


    IF ROW_COUNT() > 0 THEN
SET mensaje = CONCAT('El cliente con ID ', N_DNI_cliente, ' ha sido
actualizado exitosamente.');
ELSE
SET mensaje = 'No se encontró ningún producto con el ID proporcionado
para actualizar.';
END IF;
SELECT mensaje AS 'Mensaje';
END$$

DELIMITER ;

CALL actualizar_cliente('00000014','A567123','Ana','Lucía','Fernández','Calle 20 #34-12','ana.fernandez2@example.com','TOO924');

/*
10. Crear un procedimiento almacenado para obtener los servicios más solicitados
en un período
*/

DELIMITER $$ 
DROP PROCEDURE IF EXISTS servicios_solicitados;
CREATE PROCEDURE servicios_solicitados(
    IN aino INT
)
BEGIN
WITH servio_X_solicitado AS (
            SELECT  S.descrip AS Descrip_servicio,
                    COUNT(SR.id_servicio) AS Cant_Servios_X_Servicio,
                    HR.fecha_ejecucion AS fecha_ejecucion
            FROM servico AS S
            INNER JOIN servicio_reparacion AS SR ON S.id_servicio = SR.id_servicio
            INNER JOIN historiareparacion AS HR ON SR.id_historia_reparacion = HR.id_historia_reparacion
            WHERE   YEAR(HR.fecha_ejecucion) = aino
            GROUP BY Descrip_servicio, fecha_ejecucion
)
SELECT Cant_Servios_X_Servicio, Descrip_servicio
FROM servio_X_solicitado
WHERE Cant_Servios_X_Servicio = (SELECT MAX(Cant_Servios_X_Servicio) FROM servio_X_solicitado);
END$$
CALL servicios_solicitados(2024);