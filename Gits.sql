-- TODOS LOS CODIGOS O CUNSULTAS INTEREANTES O PENSAMIENTOS DE PROCEDIMIENTO O DE VIDA LOS VAMOS A ALMACENAS ACA , CON UNA BREBE DESCRIPCION DE LO QUE PUEDE HACER Y COMO EMPLEARLO, ACOMPA;ADO DE LA EPIFANIA QUE SALIO DEL MOMENTO.


-- Diferencia en días
SELECT DATEDIFF('2024-06-10 12:00:00', '2024-06-09 12:00:00') AS diff_in_days;

-- Diferencia en horas
SELECT TIMESTAMPDIFF(HOUR, '2024-06-09 12:00:00', '2024-06-10 12:00:00') AS diff_in_hours;

-- Diferencia en minutos
SELECT TIMESTAMPDIFF(MINUTE, '2024-06-09 12:00:00', '2024-06-10 12:00:00') AS diff_in_minutes;


TIMESTAMPDIFF(HOUR,HR.fecha_ejecucion, HR.fecha_finalizacion) AS Horas_Trabajadas

-- Duracion de Horas
  AND TIMESTAMPDIFF(HOUR, HR.fecha_ejecucion, HR.fecha_finalizacion) BETWEEN 1 AND 8\



-- Esto devuelve la fecha actual 
-- esto resta un anio

/*
DATE_SUB: Es una función en MySQL que se utiliza para restar una cantidad específica de tiempo a una fecha dada.
*/
DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
SELECT CURDATE();


-- =========================================================
                -- PROCEDIMIENTO DE INSERCION
-- =========================================================

DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_reparacion;
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

-- RECORDEMOS QUE AL INSERTAR DEBEN TENER Y LLAMAR LOS MISMO CAMPOS QUE EN LA TABLA Y REVISAR SI SON NULOS O NO