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
Utilice una diferencia de fechas donde donde divido las horas en turnos de 8 horas y de ahi identifico que turnos hizo la persona 
</strong>
</pre>
19. Obtener el listado de servicios prestados por cada empleado en un período
específico
~~~~mysql
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
~~~~
## Resultado:
<pre>
+-------------------------------------------------------------+------------------------------+--------------------------------------+--------------+
| Descripcion_Servicio                                        | Empleado                     | Cargo_Empleado                       | DNI_empleado |
+-------------------------------------------------------------+------------------------------+--------------------------------------+--------------+
| Servicio de diagnóstico y evaluación inicial                | Ana Luisa Rodríguez          | Técnico en Suspensión y Dirección    | ALR321D      |
| Servicio de diagnóstico y evaluación inicial                | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de diagnóstico y evaluación inicial                | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de diagnóstico y evaluación inicial                | Luisa  García                | Lavador de Autos                     | LXG798T      |
| Servicio de diagnóstico y evaluación inicial                | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de diagnóstico y evaluación inicial                | Marcela  Fernández           | Mecánico de Motor                    | MXF824P      |
| Servicio de diagnóstico y evaluación inicial                | Laura María Sánchez          | Recepcionista y Atención al Cliente  | LMS456H      |
| Servicio de diagnóstico y evaluación inicial                | Pedro Antonio Martínez       | Electricista Automotriz              | PAM789C      |
| Servicio de diagnóstico y evaluación inicial                | María Isabel Gómez           | Mecánico de Carrocería               | MIG456B      |
| Servicio de diagnóstico y evaluación inicial                | Raul Luis Rodríguez          | Técnico en Suspensión y Dirección    | RLR789E      |
| Servicio de diagnóstico y evaluación inicial                | Raul Luis Rodríguez          | Técnico en Suspensión y Dirección    | RLR789E      |
| Servicio de diagnóstico y evaluación inicial                | David Alejandro González     | Gerente de Taller                    | DAG145I      |
| Servicio de diagnóstico y evaluación inicial                | Gabriel Alejandro Hernández  | Lavador de Autos                     | GAH371S      |
| Servicio de diagnóstico y evaluación inicial                | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de mantenimiento de motor y componentes            | Raul Luis Rodríguez          | Técnico en Suspensión y Dirección    | RLR789E      |
| Servicio de mantenimiento de motor y componentes            | David Alejandro González     | Gerente de Taller                    | DAG145I      |
| Servicio de mantenimiento de motor y componentes            | Gabriel Alejandro Hernández  | Lavador de Autos                     | GAH371S      |
| Servicio de mantenimiento de motor y componentes            | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de diagnóstico y reparación eléctrica              | Ana Luisa Rodríguez          | Técnico en Suspensión y Dirección    | ALR321D      |
| Servicio de diagnóstico y reparación eléctrica              | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de diagnóstico y reparación eléctrica              | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de diagnóstico y reparación eléctrica              | Marcela  Fernández           | Mecánico de Motor                    | MXF824P      |
| Servicio de diagnóstico y reparación eléctrica              | María Isabel Gómez           | Mecánico de Carrocería               | MIG456B      |
| Servicio de diagnóstico y reparación eléctrica              | Raul Luis Rodríguez          | Técnico en Suspensión y Dirección    | RLR789E      |
| Servicio de diagnóstico y reparación eléctrica              | Gabriel Alejandro Hernández  | Lavador de Autos                     | GAH371S      |
| Servicio de diagnóstico y reparación eléctrica              | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de revisión y reparación de frenos y suspensión    | María Isabel Gómez           | Mecánico de Carrocería               | MIG456B      |
| Servicio de revisión y reparación de frenos y suspensión    | Raul Luis Rodríguez          | Técnico en Suspensión y Dirección    | RLR789E      |
| Servicio de alineación y balanceo de ruedas                 | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de alineación y balanceo de ruedas                 | Luisa  García                | Lavador de Autos                     | LXG798T      |
| Servicio de alineación y balanceo de ruedas                 | Gabriel Alejandro Hernández  | Lavador de Autos                     | GAH371S      |
| Servicio de alineación y balanceo de ruedas                 | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de cambio de aceite y lubricantes                  | Gabriel Alejandro Hernández  | Lavador de Autos                     | GAH371S      |
| Servicio de cambio de aceite y lubricantes                  | Luis Miguel González         | Mecánico de Motor                    | LMG987O      |
| Servicio de reparación y pintura de carrocería              | Laura María Sánchez          | Recepcionista y Atención al Cliente  | LMS456H      |
| Servicio de reparación y pintura de carrocería              | Pedro Antonio Martínez       | Electricista Automotriz              | PAM789C      |
| Servicio de reparación y reemplazo de vidrios y cristales   | Luisa  García                | Lavador de Autos                     | LXG798T      |
| Servicio de reparación y reemplazo de vidrios y cristales   | Patricio Medina Garcia       | Mecanico patinador                   | PMG789N      |
| Servicio de instalación de accesorios y personalización     | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de instalación de accesorios y personalización     | Luisa  García                | Lavador de Autos                     | LXG798T      |
| Servicio de instalación de accesorios y personalización     | Marco Ausencio Ramírez       | Mecanico patinador                   | MAR741M      |
| Servicio de instalación de accesorios y personalización     | Patricia María Ramírez       | Mecanico patinador                   | PMR852L      |
| Servicio de instalación de accesorios y personalización     | Marcela  Fernández           | Mecánico de Motor                    | MXF824P      |
| Servicio de instalación de accesorios y personalización     | Sofía  Hernández             | Lavador de Autos                     | SXH736J      |
| Servicio de inspección y certificación vehicular            | Javier Andrés Ramírez        | Mecánico de Carrocería               | JAR919Q      |
| Servicio de inspección y certificación vehicular            | Luisa  García                | Lavador de Autos                     | LXG798T      |
+-------------------------------------------------------------+------------------------------+--------------------------------------+--------------+
</pre>
## Explicacion:
<pre>
<strong>
Cree una cadena de JOINs donde por medio de este llegue a un resultado de los servicios adquiridos
</strong>
</pre>

## SubConsultas
1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
~~~~mysql
SELECT MAX(VF.total_servicio) AS Max_gasto , 
HR.fecha_ejecucion AS Fecha, 
VF.cliente AS Nombre_cliente
FROM vista_factura_detalles AS VF
INNER JOIN historiareparacion AS HR ON VF.`PLACA` = HR.id_vehiculo
GROUP BY fecha, Nombre_cliente
HAVING YEAR(HR.fecha_ejecucion) = 2024;
~~~~
## Resultado:
<pre>
+-----------+---------------------+-------------------------+
| Max_gasto | Fecha               | Nombre_cliente          |
+-----------+---------------------+-------------------------+
|    130.00 | 2024-09-16 08:00:00 | José  Martínez          |
|    220.00 | 2024-05-16 10:30:00 | Ana María Fernández     |
|    250.00 | 2024-02-26 12:00:00 | Marta Isabel Gómez      |
|    220.00 | 2024-03-12 12:45:00 | Pedro Antonio Ruiz      |
|    400.00 | 2024-01-28 13:00:00 | María Elena Rodríguez   |
|    350.00 | 2024-09-12 09:30:00 | María Luisa Rodríguez   |
|    150.00 | 2024-06-16 08:00:00 | Luis Antonio López      |
|    420.00 | 2024-01-21 08:30:00 | Juan Carlos González    |
|    520.00 | 2024-10-16 08:00:00 | Ana María Fernández     |
|    150.00 | 2024-01-23 11:30:00 | Luis Fernando López     |
+-----------+---------------------+-------------------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilizo la vista creada previamente para generar una mejor consulta donde por medio de esta puedo seleccionar los caampos necesarios y hacer una subconsulta mucho mas clara de la misma 
</strong>
</pre>

2. Obtener la pieza más utilizada en reparaciones durante el último mes

~~~~mysql
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
~~~~
## Resultado:
<pre>
+----------------------+----------+---------------------+
| Cantidad_X_Reparcion | Nombre   | Fecha               |
+----------------------+----------+---------------------+
|                    1 | Embrague | 2024-05-16 10:30:00 |
+----------------------+----------+---------------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilizo la sentencia WITH para preparar una consulta temporar donde almaceno unos daatos y de este mismo puedo consultar, esto genera que la consulta sea mcuho mas clara a la hora de leerse
</strong>
</pre>
3. Obtener los proveedores que suministran las piezas más caras
~~~~mysql
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
~~~~
## Resultado:
<pre>
+---------------+-----------------+
| Precio_unidad | Nombre          |
+---------------+-----------------+
|       1200.00 | Caja de cambios |
+---------------+-----------------+
</pre>
## Explicacion:
<pre>
<strong>
Utilizo el mismo metodo que la anterior consulta en este caso utilizando una cadena de JOINS que me permite a pasar por la diferentes tablas para llegar al resultado deseado
</strong>
</pre>
4. Listar las reparaciones que no utilizaron piezas específicas durante el último
año
~~~~mysql
SELECT
        RP.nombre_pieza AS Nombre
    FROM historiareparacion AS HR
    RIGHT JOIN repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    WHERE HR.fecha_ejecucion is NULL;
~~~~
## Resultado:
<pre>
+-------------------------------------+
| Nombre                              |
+-------------------------------------+
| Cigüeñal                            |
| Bujías                              |
| Convertidor de par                  |
| Catalizador                         |
| Tubos de escape                     |
| Bombas de freno                     |
| Amortiguadores                      |
| Muelles de suspensión               |
| Radiador                            |
| Bomba de agua                       |
| Alternador                          |
| Inyector de combustible             |
| Bomba de combustible                |
| Filtro de combustible               |
| Compresor de aire acondicionado     |
| Evaporador                          |
| Condensador                         |
| Parachoques                         |
| Guardabarros                        |
| Faros delanteros                    |
| Intermitentes                       |
| Asientos                            |
| Volante                             |
| Espejos retrovisores                |
| Sensores de estacionamiento         |
| Portaequipajes                      |
| Llantas                             |
| Tapacubos                           |
| Airbags                             |
| Cinturones de seguridad             |
| Aceite de motor                     |
| Refrigerante                        |
| Altavoces                           |
| Bomba de dirección asistida         |
| Manguera de dirección               |
| Válvula de transmisión              |
| Solenoide de transmisión            |
| Compresor de suspensión neumática   |
| Amortiguador neumático              |
| Aceite de transmisión               |
| Limpiador de inyectores             |
+-------------------------------------+
</pre>
## Explicacion:
<pre>
<strong>
En este caso lo unico que hago es emplear LEFT JOIN que me permite listar los NULLs o los id_pieza que no estan en la tabla de las reparaciones hay otro metodo que me permite ver las puiezas que se han utilizado en reparaciones pero en el aino presente no se han vuelto a utilizar 
</strong>
</pre>
~~~~mysql
SELECT
        RP.nombre_pieza AS Nombre,
        HR.fecha_ejecucion AS Fecha
    FROM historiareparacion AS HR
    LEFT JOIN repuestopieza AS RP ON HR.id_pieza = RP.id_pieza
    WHERE HR.fecha_ejecucion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY Nombre, Fecha;
~~~~
5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial

~~~~mysql
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
~~~~
## Resultado:
<pre>

</pre>
## Explicacion:
<pre>
<strong>
En este caso puntual totas la piezas estan al dia en sus stock
</strong>
</pre>

## Procedimientos Almacenados
1. Crear un procedimiento almacenado para insertar una nueva reparación.
~~~~mysql

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
~~~~
## Resultado:
~~~~mysql
CALL insertar_producto(26,'STU234',17,8,'2024-6-16 08:00:00','2024-6-22 12:00:00');
~~~~
## Explicacion:
<pre>
<strong>
En este caso genero un procedimiento que me tome los parametros de los campos de la tabla donde queiro insertar nuevos datos asi mismo paso estos para hacer los cambios que necesito
</strong>
</pre>
2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
~~~~mysql
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
~~~~
## Resultado:
~~~~mysql
CALL actualizar_INV_pieza('INV062', 61, 3 , 9, 12 );
~~~~
## Explicacion:
<pre>
<strong>
Utilizo el mismo metodo de los parametros en este caso es actulizar un registro de las tablas de inventario 
</strong>
</pre>
3. Crear un procedimiento almacenado para eliminar una cita
~~~~mysql
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
~~~~
## Resultado:
~~~~mysql
CALL eliminar_cita('CITA04');
~~~~
## Explicacion:
<pre>
<strong>
Utilizo una forma basica de eliminar pero ahora en un procedimiento el cual toma como parametro el ID de lo que deo eliminar
</strong>
</pre>
4. Crear un procedimiento almacenado para generar una factura
~~~~mysql
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
~~~~
## Resultado:
~~~~mysql
CALL generar_factura('00000019');
~~~~
## Explicacion:
<pre>
<strong>
Utilizo el recurso de la vista creada anterior mente donde me contiene los diferentes campos y el calculo de la cantidad y costo de cada servicio adquirido solo con pasar el ID del cliente puedo traer y listar la factura correspondiente
</strong>
</pre>
5. Crear un procedimiento almacenado para obtener el historial de reparaciones
de un vehículo
~~~~mysql
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
~~~~
## Resultado:
~~~~mysql
CALL repaciones_vehiculo('VWX567');

~~~~
## Explicacion:
<pre>
<strong>
Consulto sobre la tabla que contiene el registro deseado y con ello utilizo el recurso de JOINS, esto genera que el procedimiento almacenado sea dinamico a la hora de ejecutarse
</strong>
</pre>
6. Crear un procedimiento almacenado para calcular el costo total de
reparaciones de un cliente en un período
~~~~mysql
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
END;
~~~~
## Resultado:
~~~~mysql
CALL repaciones_vehiculo_aino('00000017', 2022);
~~~~
## Explicacion:
<pre>
<strong>
Hago uso de las tablas temporales donde inserto los datos o resultados de una consulta
</strong>
</pre>

8. Crear un procedimiento almacenado para insertar una nueva orden de compra
~~~~mysql
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

~~~~
## Resultado:
~~~~mysql
CALL insertar_nueva_compra(111, '2024-06-10 11:00:00', 98765432, 'AIM913R', 11, 111, 50, 2, 350.00);
~~~~
## Explicacion:
<pre>
<strong>
En este caso puntal, al momento de insertar una orden de compra debo tener en cuenta la integridad de los campos y de los vlores donde tengo encuenta la cantidad y el precio y su operacion de multiplicacion para asi mantener la consistencia en la base de datos
</strong>
</pre>
9. Crear un procedimiento almacenado para actualizar los datos de un cliente
~~~~mysql
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
~~~~
## Resultado:
~~~~mysql
CALL actualizar_cliente('00000014','A567123','Ana','Lucía','Fernández','Calle 20 #34-12','ana.fernandez2@example.com','TOO924');
~~~~
## Explicacion:
<pre>
<strong>
Utilizo el recurso de los parametros donde hago un update sencillo y que me genera casos puntuales con el recurso IF
</strong>
</pre>
10. Crear un procedimiento almacenado para obtener los servicios más solicitados
en un período
~~~~mysql
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

DELIMITER ;
~~~~
## Resultado:
~~~~mysql
CALL servicios_solicitados(2023);
~~~~
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
Utilizo el recurso WITH para generar una consulta donde por parametro de aino podre visualizar facilmente que servicios mas solicidos de dicho aino solicitado
</strong>
</pre>