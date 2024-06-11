# Creacion Base De Datos Automotriz
## Consultas Requeridas
1. Obtener el historial de reparaciones de un vehículo específico
~~~~mysql
SELECT SR.descrip AS Descripcion, SR.costo AS Valor_Serviio
FROM historiareparacion AS HR
INNER JOIN servicio_reparacion AS  S_R ON HR.id_historia_reparacion = S_R.id_historia_reparacion
INNER JOIN servico AS SR ON S_R.id_servicio = SR.id_servicio
WHERE HR.id_vehiculo = 'VWX567';
~~~~
## Resultado:
<pre>
+---------------------------------------------------+---------------+
| Descripcion                                       | Valor_Serviio |
+---------------------------------------------------+---------------+
| Servicio de diagnóstico y evaluación inicial      |        100.00 |
| Servicio de diagnóstico y reparación eléctrica    |        120.00 |
| Servicio de mantenimiento de motor y componentes  |        150.00 |
| Servicio de alineación y balanceo de ruedas       |         80.00 |
| Servicio de cambio de aceite y lubricantes        |         70.00 |
+---------------------------------------------------+---------------+
</pre>
## Explicacion:
<pre>
<strong>Hice una combinacion de 3 tablas teniendo en cuenta mi diseno de base de datos con ello hago match con cada PK y FK de cada tabla y filtro por la placa del Vehiculo
</strong>
</pre>
2. Calcular el costo total de todas las reparaciones realizadas por un empleado
específico en un período de tiempo
~~~~mysql
SELECT 
    CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado , OC.fecha_orden AS Fecha, SUM(OC.total) AS Total
    FROM empleado AS EM
    INNER JOIN ordencompra AS OC ON EM.DNI_empleado = OC.DNI_empleado
    WHERE YEAR(OC.fecha_orden) = 2024 AND EM.DNI_empleado = 'AIM913R'
    GROUP BY Empleado , Fecha;
~~~~
## Resultado:
<pre>
+-------------------------+---------------------+--------+
| Empleado                | Fecha               | Total  |
+-------------------------+---------------------+--------+
| Andrea Isabel Martínez  | 2024-01-15 10:30:00 | 700.00 |
| Andrea Isabel Martínez  | 2024-06-10 11:00:00 | 700.00 |
+-------------------------+---------------------+--------+
</pre>
## Explicacion:
<pre>
<strong>
Hice una combinacion de 2 tablas teniendo en cuenta mi diseno de base de datos con ello hago match con cada PK y FK, en este caso utilizo la sentencia COALCASE para poder unir lo nombre del empleado y asi darlo completo en caso tal que el Empleado no tengo uno de estos sera reemplezado por un espacio
</strong>
</pre>
3. Listar todos los clientes y los vehículos que poseen
~~~~mysql
SELECT  CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado , VH.id_vehiculo AS PLACA , M.nombre AS Marca_Vehiculo
FROM marcavehiculo AS M
INNER JOIN vehiculo AS VH ON M.id_marca =  VH.id_marca
INNER JOIN cliente AS EM ON VH.id_vehiculo = EM.id_vehiculo;
~~~~
## Resultado:
<pre>
+-------------------------+--------+----------------+
| Empleado                | PLACA  | Marca_Vehiculo |
+-------------------------+--------+----------------+
| María  Rodríguez        | BOA229 | Toyota         |
| Ana María Fernández     | CSU573 | Toyota         |
| Luis Miguel López       | BSA281 | Honda          |
| Pedro Alejandro Ruiz    | GHI012 | Honda          |
| Juan  González          | MNO678 | Ford           |
| Carlos  Pérez           | OOO529 | Ford           |
| Juan Carlos González    | UHK946 | Ford           |
| Laura Paola Sánchez     | XYZ123 | Chevrolet      |
| Lucía  Díaz             | YYP173 | Chevrolet      |
| Pedro Antonio Ruiz      | GRU810 | Nissan         |
| María Luisa Rodríguez   | PQR901 | Nissan         |
| José  Martínez          | ABC456 | Hyundai        |
| Luis Fernando López     | YSR328 | Hyundai        |
| María Elena Rodríguez   | JSW375 | Kia            |
| Lucía María Díaz        | JKL345 | Volkswagen     |
| Juan Carlos González    | OBN836 | Volkswagen     |
| Carlos José Pérez       | YZA890 | Volkswagen     |
| Marta Isabel Gómez      | DEF789 | Mercedes-Benz  |
| Marta  Gómez            | JQT791 | Mercedes-Benz  |
| Laura Isabel Sánchez    | LPS177 | Mazda          |
| Luis Antonio López      | STU234 | Mazda          |
| Ana Lucía Fernández     | TOO924 | Subaru         |
| Ana Lucía Fernández     | TOO924 | Subaru         |
| José Miguel Martínez    | NFV108 | Tesla          |
| Ana María Fernández     | VWX567 | Tesla          |
+-------------------------+--------+----------------+
</pre>
## Explicacion:
<pre>
<strong>
Este es un caso simple de JOIN, donde los carros que son comunes entre ambos se muestran, asi mismo la marca de cada uno de ellos.
</strong>
</pre>
4. Obtener la cantidad de piezas en inventario para cada pieza
~~~~mysql
SELECT RP.nombre_pieza AS PIEZA_DESC, INV.stock
FROM repuestopieza AS RP
INNER JOIN inventario AS INV ON RP.id_pieza = INV.id_pieza;
~~~~
## Resultado:
<pre>
+-------------------------------------+-------+
| PIEZA_DESC                          | stock |
+-------------------------------------+-------+
| Bloque de motor                     |    50 |
| Cigüeñal                            |    30 |
| Bujías                              |    40 |
| Caja de cambios                     |    20 |
| Embrague                            |    25 |
| Convertidor de par                  |    15 |
| Silenciador                         |    10 |
| Catalizador                         |    35 |
| Tubos de escape                     |    12 |
| Discos de freno                     |    45 |
| Pastillas de freno                  |    20 |
| Bombas de freno                     |    50 |
| Amortiguadores                      |    10 |
| Muelles de suspensión               |    25 |
| Brazos de suspensión                |    30 |
| Radiador                            |    60 |
| Termostato                          |    22 |
| Bomba de agua                       |    35 |
| Alternador                          |    20 |
| Batería                             |    25 |
| Motor de arranque                   |    15 |
| Inyector de combustible             |    18 |
| Bomba de combustible                |    20 |
| Filtro de combustible               |    40 |
| Compresor de aire acondicionado     |    30 |
| Evaporador                          |    18 |
| Condensador                         |    22 |
| Parachoques                         |    12 |
| Guardabarros                        |    25 |
| Parabrisas                          |    30 |
| Faros delanteros                    |    20 |
| Luces traseras                      |    15 |
| Intermitentes                       |    25 |
| Asientos                            |    50 |
| Alfombras                           |    10 |
| Volante                             |     2 |
| Espejos retrovisores                |    20 |
| Sensores de estacionamiento         |    30 |
| Portaequipajes                      |    25 |
| Neumáticos                          |    35 |
| Llantas                             |    18 |
| Tapacubos                           |    22 |
| Airbags                             |    12 |
| Cinturones de seguridad             |    25 |
| Sistemas de alarma                  |    30 |
| Aceite de motor                     |    20 |
| Líquido de frenos                   |    15 |
| Refrigerante                        |    25 |
| Radio                               |    50 |
| Sistema de navegación GPS           |    10 |
| Altavoces                           |    45 |
| Bomba de dirección asistida         |    20 |
| Manguera de dirección               |    30 |
| Líquido de dirección asistida       |    25 |
| Convertidor de par                  |    35 |
| Válvula de transmisión              |    18 |
| Solenoide de transmisión            |    22 |
| Compresor de suspensión neumática   |    12 |
| Amortiguador neumático              |    25 |
| Válvula de suspensión               |    30 |
| Aceite de transmisión               |    20 |
| Aceite de transmisión               |    12 |
| Anticongelante                      |    25 |
+-------------------------------------+-------+
</pre>
## Explicacion:
<pre>
<strong>
Un JOIN sencillo donde se muestra el estock de cada pieza de repuesto en su respectivo inventario y su nombre
</strong>
</pre>
5. Obtener las citas programadas para un día específico

~~~~mysql
SELECT  CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente , C.fecha_cita AS Fecha
FROM cita AS C
INNER JOIN cliente AS EM ON C.DNI_cliente = EM.DNI_cliente;
~~~~
## Resultado:
<pre>
+-------------------------+---------------------+
| Cliente                 | Fecha               |
+-------------------------+---------------------+
| María Luisa Rodríguez   | 2024-09-12 09:30:00 |
| Ana Lucía Fernández     | 2024-09-17 08:45:00 |
+-------------------------+---------------------+
</pre>
## Explicacion:
<pre>
<strong>
Filtro las Citas por medio de un JOIN donde puedo tambien Agregar la Sentencia WHERE y especificar aun mas la consulta.
</strong>
</pre>
6. Generar una factura para un cliente específico en una fecha determinada
~~~~mysql
SELECT F.fecha AS Fecha , VF.Cliente AS Cliente , VF.Cantidad_servicos_adquiridos AS Cantidad , VF.total_servicio AS Total
FROM factura AS F
INNER JOIN vista_factura_detalles AS VF ON F.DNI_cliente = VF.DNI
WHERE YEAR(F.fecha) = 2023;
~~~~
## Resultado:
<pre>
+------------+-------------------------+----------+--------+
| Fecha      | Cliente                 | Cantidad | Total  |
+------------+-------------------------+----------+--------+
| 2023-06-06 | Juan Carlos González    |        4 | 420.00 |
| 2023-07-16 | María  Rodríguez        |        3 | 300.00 |
| 2023-12-16 | Luis Fernando López     |        1 | 150.00 |
| 2023-04-06 | Ana María Fernández     |        2 | 220.00 |
| 2023-12-14 | Carlos  Pérez           |        2 | 380.00 |
| 2023-01-12 | Laura Isabel Sánchez    |        2 | 190.00 |
| 2023-07-23 | José Miguel Martínez    |        1 | 150.00 |
| 2023-03-12 | María Elena Rodríguez   |        3 | 400.00 |
| 2023-06-24 | Ana Lucía Fernández     |        1 | 130.00 |
| 2023-11-12 | José  Martínez          |        1 | 130.00 |
| 2023-11-03 | Marta Isabel Gómez      |        2 | 250.00 |
+------------+-------------------------+----------+--------+
</pre>
## Explicacion:
<pre>
<strong>
En este caso utilice el filtro de fecha especifica, donde por medio de una vista puedo visualizar los totales de los servicios de cada cliente
</strong>
</pre>

7. Listar todas las órdenes de compra y sus detalles
~~~~mysql
SELECT *
FROM ordencompra AS O
INNER JOIN detallecompra AS DO ON O.id_orden = DO.id_orden;
~~~~
## Resultado:
<pre>
+----------+---------------------+--------------+--------------+--------+------------------+----------+----------+----------+--------+
| id_orden | fecha_orden         | DNI_provedor | DNI_empleado | total  | id_detalle_orden | id_orden | id_pieza | cantidad | precio |
+----------+---------------------+--------------+--------------+--------+------------------+----------+----------+----------+--------+
|      101 | 2024-01-15 10:30:00 |     98765432 | AIM913R      | 700.00 |                1 |      101 |        1 |       34 | 500.00 |
|      102 | 2024-01-16 11:00:00 |     12345678 | ALR321D      | 700.00 |                2 |      102 |        5 |        8 | 200.00 |
|      103 | 2024-01-17 09:45:00 |     45678901 | CAP665F      | 700.00 |                3 |      103 |       10 |       12 |  75.00 |
|      104 | 2024-01-18 14:20:00 |     34567890 | MXF824P      | 700.00 |                4 |      104 |       15 |       22 | 120.00 |
|      105 | 2024-01-19 08:30:00 |     89012345 | PMG789N      | 700.00 |                5 |      105 |       20 |       12 |  90.00 |
|      106 | 2024-01-20 12:15:00 |     57924680 | PAM789C      | 700.00 |                6 |      106 |       25 |       11 | 350.00 |
|      107 | 2024-01-21 16:40:00 |     67890123 | PMR852L      | 700.00 |                7 |      107 |       30 |        9 | 450.00 |
|      108 | 2024-01-22 10:05:00 |     13579246 | PMR852L      | 700.00 |                8 |      108 |       35 |       10 | 110.00 |
|      109 | 2024-01-23 15:55:00 |     24681357 | SXH736J      | 700.00 |                9 |      109 |       37 |        6 | 110.00 |
|      110 | 2024-01-24 11:50:00 |     90123456 | LGX896G      | 700.00 |               10 |      110 |       39 |        2 | 110.00 |
|      111 | 2024-06-10 11:00:00 |     98765432 | AIM913R      | 700.00 |               11 |      111 |       50 |        2 | 350.00 |
+----------+---------------------+--------------+--------------+--------+------------------+----------+----------+----------+--------+
</pre>
## Explicacion:
<pre>
<strong>
En este caso puntual no quice complicar la consulta asi mismo liste con un JOIN ambas tamblas
</strong>
</pre>
8. Obtener el costo total de piezas utilizadas en una reparación específica

~~~~mysql
SELECT HR.id_vehiculo AS PLACA, HR.cantidad AS Cantidad_utilizada_Piezas, (R.precio_unidad * HR.cantidad  ) AS Costo_NETO
FROM historiareparacion AS HR
INNER JOIN repuestopieza AS R ON HR.id_pieza = R.id_pieza
WHERE YEAR(fecha_finalizacion) = 2024;
~~~~
## Resultado:
<pre>
+--------+---------------------------+------------+
| PLACA  | Cantidad_utilizada_Piezas | Costo_NETO |
+--------+---------------------------+------------+
| CSU573 |                         1 |     350.00 |
| UHK946 |                         1 |     250.00 |
| GRU810 |                         4 |     800.00 |
| PQR901 |                         1 |     350.00 |
| ABC456 |                         2 |     800.00 |
| YSR328 |                         3 |     450.00 |
| JSW375 |                         1 |      20.00 |
| HXC839 |                         2 |      30.00 |
| DEF789 |                         1 |    1200.00 |
| VWX567 |                         1 |     150.00 |
| STU234 |                         8 |     400.00 |
+--------+---------------------------+------------+
</pre>
## Explicacion:
<pre>
<strong>
El resultado de esta consulta se debe a la sentecia JOIN y un filtro WHERE que a su vez tiene la sentencia YEAR() que preferi filtrar por el aino presente.
</strong>
</pre>

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)
~~~~mysql
SELECT INV.id_inventario AS NUM_INV, INV.stock AS Stock, R.nombre_pieza AS Nombre_Pieza
FROM repuestopieza AS R
INNER JOIN inventario AS INV ON R.id_pieza = INV.id_pieza
WHERE INV.stock = 15;
~~~~
## Resultado:
<pre>
+---------+-------+--------------------+
| NUM_INV | Stock | Nombre_Pieza       |
+---------+-------+--------------------+
| INV006  |    15 | Convertidor de par |
| INV021  |    15 | Motor de arranque  |
| INV032  |    15 | Luces traseras     |
| INV047  |    15 | Líquido de frenos  |
+---------+-------+--------------------+
</pre>
## Explicacion:
<pre>
<strong>
La consulta genera la diferencia entre un stock inicial o critico u/o minimo y el actual con esto especifica el Stock que es 15 para cada una de las piezas
</strong>
</pre>
10. Obtener la lista de servicios más solicitados en un período específico
~~~~mysql
WITH servio_X_solicitado AS (
            SELECT  S.descrip AS Descrip_servicio,
                    COUNT(SR.id_servicio) AS Cant_Servios_X_Servicio,
                    HR.fecha_ejecucion AS fecha_ejecucion
            FROM servico AS S
            INNER JOIN servicio_reparacion AS SR ON S.id_servicio = SR.id_servicio
            INNER JOIN historiareparacion AS HR ON SR.id_historia_reparacion = HR.id_historia_reparacion
            WHERE   YEAR(HR.fecha_ejecucion) = 2023
            GROUP BY Descrip_servicio, fecha_ejecucion
)
SELECT Cant_Servios_X_Servicio, Descrip_servicio
FROM servio_X_solicitado
WHERE Cant_Servios_X_Servicio = (SELECT MAX(Cant_Servios_X_Servicio) FROM servio_X_solicitado);
~~~~
## Resultado:
<pre>
+-------------------------+--------------------------------------------------+
| Cant_Servios_X_Servicio | Descrip_servicio                                 |
+-------------------------+--------------------------------------------------+
|                       2 | Servicio de mantenimiento de motor y componentes |
+-------------------------+--------------------------------------------------+
</pre>
## Explicacion:
<pre>
<strong>
Este caso puntual Utilice la centencia WITH que genera una consulta temporal donde almacena la consulta y puedo sobre esa misma consulta, es mucho mas facil hacer subconsultas por medio de este metodo
</strong>
</pre>
11. Obtener el costo total de reparaciones para cada cliente en un período
específico
~~~~mysql
SELECT VF.Cliente AS CLIENTE ,
VF.`PLACA` AS PLACA,
VF.`Cantidad_servicos_adquiridos` AS Caant_Servicio,
VF.total_servicio AS Total,
FT.fecha AS Fecha_2022
FROM vista_factura_detalles AS VF
INNER JOIN factura AS FT ON VF.DNI = FT.`DNI_cliente`
WHERE YEAR(FT.fecha) = 2022;
~~~~
## Resultado:
<pre>
+-----------------------+--------+----------------+--------+------------+
| CLIENTE               | PLACA  | Caant_Servicio | Total  | Fecha_2022 |
+-----------------------+--------+----------------+--------+------------+
| Marta  Gómez          | JQT791 |              1 | 150.00 | 2022-08-22 |
| Juan Carlos González  | OBN836 |              2 | 190.00 | 2022-02-09 |
+-----------------------+--------+----------------+--------+------------+
</pre>
## Explicacion:
<pre>
<strong>
Este es uno de los benefcios de manejar vistas o tambien tabnlas temporales, dado que almacenan informacion que recurrentemente estamos consultado y asi podremos acceder a ella mucho mas facil en este caso lo unico que se hizo como tal fue adquierir la fecha de la tabla factura.
</strong>
</pre>
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
período específico
~~~~mysql
SELECT   CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Empleado, 
        COUNT(HE.DNI_empleado) AS Cantitad_Reparacion_X_Empleado
FROM empleado AS EM
INNER JOIN historia_empelado AS HE ON EM.`DNI_empleado` = HE.`DNI_empleado`
INNER JOIN historiareparacion AS HR ON HE.id_historia_reparacion = HR.id_historia_reparacion
GROUP BY Empleado;
~~~~
## Resultado:
<pre>
+------------------------------+--------------------------------+
| Empleado                     | Cantitad_Reparacion_X_Empleado |
+------------------------------+--------------------------------+
| Andrea Isabel Martínez       |                              3 |
| Ana Luisa Rodríguez          |                              4 |
| Carlos Andrés Pérez          |                              3 |
| David Alejandro González     |                              3 |
| Gabriel Alejandro Hernández  |                              3 |
| Gabriel Jesús Díaz           |                              3 |
| Javier Andrés Ramírez        |                              3 |
| Juan Carlos López            |                              3 |
| Luis  García                 |                              3 |
| Luis Miguel González         |                              3 |
| Laura María Sánchez          |                              2 |
| Luisa  García                |                              2 |
| Marco Ausencio Ramírez       |                              2 |
| María Isabel Gómez           |                              2 |
| Marcela  Fernández           |                              2 |
| Pedro Antonio Martínez       |                              2 |
| Patricio Medina Garcia       |                              2 |
| Patricia María Ramírez       |                              2 |
| Raul Luis Rodríguez          |                              2 |
| Sofía  Hernández             |                              2 |
+------------------------------+--------------------------------+
</pre>
## Explicacion:
<pre>
<strong>
Este es un caso puntal donde podemos utlizar el la sentencia WITH y esta sacar aun mas informacion, mucho mas especifica
</strong>
</pre>
13. Obtener las piezas más utilizadas en reparaciones durante un período
específico
~~~~mysql

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
~~~~
## Resultado:
<pre>
+----------------------+-----------------------+
| Cantidad_X_Reparcion | Nombre                |
+----------------------+-----------------------+
|                    3 | Brazos de suspensión  |
+----------------------+-----------------------+
</pre>
## Explicacion:
<pre>
<strong>
Mismo caso en el cual ya empezamos con las consultal SubConsultas que en este caso, hacemos un consultada de esa consulta temporal tambein podemos utilizar las sentencias WHERE
</strong>
</pre>
~~~~mysql
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
GROUP BY PLACA , Cliente;
~~~~
## Resultado:
<pre>+-------------------------+--------+------------------------------+-------------------+
| Cliente                 | PLACA  | Cantidad_servicos_adquiridos | promedio_servicio |
+-------------------------+--------+------------------------------+-------------------+
| Juan Carlos González    | UHK946 |                            4 | 105.0             |
| María  Rodríguez        | BOA229 |                            3 | 100.0             |
| Luis Fernando López     | YSR328 |                            1 | 150.0             |
| Ana María Fernández     | CSU573 |                            2 | 110.0             |
| Carlos  Pérez           | OOO529 |                            2 | 190.0             |
| Laura Isabel Sánchez    | LPS177 |                            2 | 95.0              |
| José Miguel Martínez    | NFV108 |                            1 | 150.0             |
| Marta  Gómez            | JQT791 |                            1 | 150.0             |
| Pedro Antonio Ruiz      | GRU810 |                            2 | 110.0             |
| Lucía  Díaz             | YYP173 |                            4 | 150.0             |
| Juan Carlos González    | OBN836 |                            2 | 95.0              |
| María Elena Rodríguez   | JSW375 |                            3 | 133.3             |
| Luis Miguel López       | BSA281 |                            3 | 160.0             |
| Ana Lucía Fernández     | TOO924 |                            1 | 130.0             |
| Carlos Andrés Pérez     | HXC839 |                            1 | 150.0             |
| Laura Paola Sánchez     | XYZ123 |                            1 | 90.0              |
| José  Martínez          | ABC456 |                            1 | 130.0             |
| Marta Isabel Gómez      | DEF789 |                            2 | 125.0             |
| Pedro Alejandro Ruiz    | GHI012 |                            2 | 90.0              |
| Lucía María Díaz        | JKL345 |                            1 | 150.0             |
| Juan  González          | MNO678 |                            2 | 85.0              |
| María Luisa Rodríguez   | PQR901 |                            2 | 175.0             |
| Luis Antonio López      | STU234 |                            1 | 150.0             |
| Ana María Fernández     | VWX567 |                            5 | 104.0             |
| Carlos José Pérez       | YZA890 |                            2 | 90.0              |
+-------------------------+--------+------------------------------+-------------------+</pre>
## Explicacion:
<pre>
<strong>
Utilice funciones de agrgacion en esta tabla, generando una escalera de JOINs que me permita moverme entre diferentes tablas
</strong>
</pre>

15. Obtener el inventario de piezas por proveedor

~~~~mysql
SELECT  EM.NIT AS Provedor,
        RP.nombre_pieza AS Nombre,
        INV.stock AS STOCK_Pieza_INV
FROM provedor AS EM
INNER JOIN marcapieza AS MP ON EM.id_marca_pieza = MP.id_marca_pieza
INNER JOIN inventario AS INV ON MP.id_marca_pieza = INV.id_marca_pieza
INNER JOIN repuestopieza AS RP ON INV.id_pieza = RP.id_pieza;
~~~~
## Resultado:
<pre>+----------+-------------------------------------+-----------------+
| Provedor | Nombre                              | STOCK_Pieza_INV |
+----------+-------------------------------------+-----------------+
| X678901X | Convertidor de par                  |              15 |
| X678901X | Motor de arranque                   |              15 |
| X678901X | Volante                             |               2 |
| X678901X | Altavoces                           |              45 |
| X023456X | Pastillas de freno                  |              20 |
| X023456X | Evaporador                          |              18 |
| X023456X | Llantas                             |              18 |
| X023456X | Válvula de transmisión              |              18 |
| X230956X | Cigüeñal                            |              30 |
| X230956X | Termostato                          |              22 |
| X230956X | Luces traseras                      |              15 |
| X230956X | Líquido de frenos                   |              15 |
| X230956X | Limpiador de inyectores             |              15 |
| X034567X | Bombas de freno                     |              50 |
| X034567X | Condensador                         |              22 |
| X034567X | Tapacubos                           |              22 |
| X034567X | Solenoide de transmisión            |              22 |
| X789012X | Silenciador                         |              10 |
| X789012X | Inyector de combustible             |              18 |
| X789012X | Espejos retrovisores                |              20 |
| X789012X | Bomba de dirección asistida         |              20 |
| X305678X | Amortiguadores                      |              10 |
| X305678X | Parachoques                         |              12 |
| X305678X | Airbags                             |              12 |
| X305678X | Compresor de suspensión neumática   |              12 |
| X345678X | Bujías                              |              40 |
| X345678X | Bomba de agua                       |              35 |
| X345678X | Intermitentes                       |              25 |
| X345678X | Refrigerante                        |              25 |
| X345678X | Anticongelante                      |              25 |
| X456789X | Muelles de suspensión               |              25 |
| X456789X | Guardabarros                        |              25 |
| X456789X | Cinturones de seguridad             |              25 |
| X456789X | Amortiguador neumático              |              25 |
| X890123X | Catalizador                         |              35 |
| X890123X | Bomba de combustible                |              20 |
| X890123X | Sensores de estacionamiento         |              30 |
| X890123X | Manguera de dirección               |              30 |
| X567890X | Brazos de suspensión                |              30 |
| X567890X | Parabrisas                          |              30 |
| X567890X | Sistemas de alarma                  |              30 |
| X567890X | Válvula de suspensión               |              30 |
| X406789X | Caja de cambios                     |              20 |
| X406789X | Alternador                          |              20 |
| X406789X | Asientos                            |              50 |
| X406789X | Radio                               |              50 |
| X901234X | Tubos de escape                     |              12 |
| X901234X | Filtro de combustible               |              40 |
| X901234X | Portaequipajes                      |              25 |
| X901234X | Líquido de dirección asistida       |              25 |
| X567490X | Embrague                            |              25 |
| X567490X | Batería                             |              25 |
| X567490X | Alfombras                           |              10 |
| X567490X | Sistema de navegación GPS           |              10 |
| X233567X | Discos de freno                     |              45 |
| X233567X | Compresor de aire acondicionado     |              30 |
| X233567X | Neumáticos                          |              35 |
| X233567X | Convertidor de par                  |              35 |
| X133456X | Bloque de motor                     |              50 |
| X133456X | Radiador                            |              60 |
| X133456X | Faros delanteros                    |              20 |
| X133456X | Aceite de motor                     |              20 |
| X133456X | Aceite de transmisión               |              20 |
+----------+-------------------------------------+-----------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilice el stock actual del inventario para generar la consulta por medio de JOINs haciendo con sus respectivas PK y FK
</strong>
</pre>
16. Listar los clientes que no han realizado reparaciones en el último año
~~~~mysql
SELECT  
CONCAT(EM.nombre1, ' ', COALESCE(EM.nombre2, ''), ' ', COALESCE(EM.apellido1, '')) AS Cliente,
HR.id_vehiculo AS PLACA,
HR.fecha_ejecucion AS Ultima_Reparacion
FROM cliente AS EM
INNER JOIN vehiculo AS V ON EM.id_vehiculo = V.id_vehiculo
INNER JOIN historiareparacion AS HR ON V.id_vehiculo = HR.id_vehiculo
WHERE HR.fecha_ejecucion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
~~~~
## Resultado:
<pre>+------------------------+--------+---------------------+
| Cliente                | PLACA  | Ultima_Reparacion   |
+------------------------+--------+---------------------+
| Luis Miguel López      | BSA281 | 2022-02-09 09:00:00 |
| Pedro Alejandro Ruiz   | GHI012 | 2023-06-06 13:15:00 |
| Juan  González         | MNO678 | 2022-08-22 07:45:00 |
| Laura Paola Sánchez    | XYZ123 | 2015-07-01 14:00:00 |
| Lucía María Díaz       | JKL345 | 2023-04-06 10:00:00 |
| Juan Carlos González   | OBN836 | 2023-01-12 09:15:00 |
| Marta  Gómez           | JQT791 | 2018-09-09 10:30:00 |
| Luis Antonio López     | STU234 | 2023-03-12 11:45:00 |
| Ana Lucía Fernández    | TOO924 | 2018-05-09 09:00:00 |
| José Miguel Martínez   | NFV108 | 2014-12-02 12:30:00 |
+------------------------+--------+---------------------+
</pre>
## Explicacion:
<pre>
<strong>
Aca utilice la sentencia DATE_SUB que utilizo para restar el año del mismo con INTERVAL y por medio este sacar el ultimos años donde no se han realizado en el ultimo Año
</strong>
</pre>
17. Obtener las ganancias totales del taller en un período específico
~~~~mysql
SELECT  
        SUM(FV.total_servicio) AS Total_ingresos_2024
FROM historiareparacion AS HR
INNER JOIN vista_factura_detalles AS FV ON HR.id_vehiculo = FV.`PLACA`
WHERE HR.fecha_ejecucion BETWEEN '2024-01-01' AND '2024-12-31';
~~~~
## Resultado:
<pre>+---------------------+
| Total_ingresos_2024 |
+---------------------+
|             2810.00 |
+---------------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilice la vista que cree donde consulto la fecha y genero un BETWEEN para que por medio de este me genere un intervalo de fechas
</strong>
</pre>
18. Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación)

~~~~mysql
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
~~~~
## Resultado:
<pre>+--------------+-----------+------------------------------+
| Turnos_X_Dia | Horas_JOB | Empleado                     |
+--------------+-----------+------------------------------+
| 10           |        76 | Ana Luisa Rodríguez          |
| 13           |       100 | David Alejandro González     |
| 19           |       148 | Gabriel Alejandro Hernández  |
| 10           |        80 | Javier Andrés Ramírez        |
| 37           |       296 | Luis Miguel González         |
| 39           |       315 | Laura María Sánchez          |
| 13           |       104 | Luisa  García                |
| 22           |       172 | Marco Ausencio Ramírez       |
| 1            |         4 | María Isabel Gómez           |
| 19           |       151 | Marcela  Fernández           |
| 39           |       315 | Pedro Antonio Martínez       |
| 13           |       100 | Patricio Medina Garcia       |
| 22           |       172 | Patricia María Ramírez       |
| 13           |       104 | Raul Luis Rodríguez          |
| 0            |         3 | Sofía  Hernández             |
+--------------+-----------+------------------------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilice una diferencia de fechas donde aparer
</strong>
</pre>


~~~~mysql

~~~~
## Resultado:

## Explicacion:
<pre>
<strong>

</strong>
</pre>
