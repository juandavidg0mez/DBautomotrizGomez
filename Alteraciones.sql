USE db_automotrizgomez;

UPDATE cita
SET DNI_cliente = '00000021'
WHERE id_cita = 'CITA01';

UPDATE cita
SET DNI_cliente = '00000014'
WHERE id_cita = 'CITA02';

DELETE FROM `inventario` WHERE `id_inventario` IN ('INV064','INV065','INV066','INV067','INV068','INV069','INV070');


UPDATE inventario
SET stock = 2
WHERE id_inventario = 'INV036';
