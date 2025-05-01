-- INSERTS REQUERIDOS PARA PROBAR LAS FUNCIONES DEL SEGUNDO PARCIAL

use pizzeria;


-- EJERCICIO 1

	-- Creamos inserts con muchas ventas de complementos en el mismo mes para probar la vista

INSERT INTO ORDEN (fkSucursal, fkCliente, fechaOrden, horaOrden, tipoOrden, estado, montoFinal, fkPromocion) VALUES

	-- SUCURSAL CENTRO (31 - 35)
(1, 1, '2024-08-07', '11:16:00', 'domicilio', 'finalizado', 557.52, 1),
(1,2,'2024-08-06','16:21:00','domicilio', 'finalizado',100.00,null),
(1,3,'2024-08-09','21:56:00','domicilio', 'finalizado',100.00,null),
(1,4,'2024-08-11','17:23:00','domicilio', 'finalizado',100.00,null),
(1,5,'2024-08-15','13:34:00','domicilio', 'finalizado',100.00,null),

	-- SUCURSAL NORTE (36 - 40)
(2,6,CURDATE(),'09:26:00','domicilio', 'finalizado',100.00,null),
(2,7,CURDATE(),'12:41:00','domicilio', 'finalizado',100.00,2),
(2,8,CURDATE(),'15:45:00','domicilio', 'finalizado',100.00,2),
(2,9,CURDATE(),'14:57:00','domicilio', 'finalizado',100.00,1),
(2,10,CURDATE(),'18:23:00','domicilio', 'finalizado',100.00,null),

	-- SUCURSAL SUR (41 - 45)
(3,11,'2024-08-18','19:31:00','domicilio', 'finalizado',100.00,2),
(3,12,'2024-08-09','12:46:00','domicilio', 'finalizado',100.00,null),
(3,13,'2024-08-16','10:51:00','domicilio', 'finalizado',100.00,null),
(3,14,'2024-08-02','09:32:00','domicilio', 'finalizado',100.00,null),
(3,15,'2024-08-01','13:14:00','domicilio', 'finalizado',100.00,null);

INSERT INTO ORDEN_has_COMPLEMENTO (fkOrden,fkComplemento) VALUES

	-- SUCURSAL CENTRO 
(31,1),
(32,1),
(33,1),
(34,4),
(35,4),
(31,3),
(32,4),
(33,4),
(34,8),
(35,10),

	-- SUCURSAL NORTE
(36,3),
(37,6),
(38,6),
(39,5),
(40,7),
(36,10),
(37,1),
(38,2),
(39,2),
    
	-- SUCURSAL SUR
(41,7),
(42,8),
(43,9),
(44,2),
(45,2)
;


-- EJERCICIO 2

	-- Creamos inserts con muchas entregas para tres repartidores en un mismo mes para probar la funcion

INSERT INTO entrega_a_domicilio (fkOrden,fkRepartidor,fkMotocicleta,estadoEntrega,horaDeEntrega, kilometrosRecorridos) VALUES

-- Repartidor 1, mes Agosto(8), 
-- (11 - 15)
(31,1,3,'entregado','11:29:00', 12.30),
(32,1,3,'entregado','16:36:00', 9.80),
(33,1,3,'entregado','22:20:00', 14.50),
(34,1,3,'entregado','17:45:00', 6.90),
(35,1,3,'entregado','13:50:00', 17.20),

-- Repartidor 6, mes Agosto(8),
-- (16 - 20)
(36,6,8,'entregado','09:55:00', 13.10),
(37,6,8,'entregado','13:06:00', 8.70),
(38,6,8,'entregado','16:40:00', 19.00),
(39,6,8,'entregado','15:25:00', 7.40),
(40,6,8,'entregado','19:00:00', 16.80),

-- Repartidor 11, mes Agosto(8),
-- (21 - 25)
(41,11,13,'entregado','19:51:00', 10.50),
(42,11,13,'entregado','13:20:00', 18.20),
(43,11,13,'entregado','11:21:00', 14.30),
(44,11,13,'entregado','10:05:00', 15.00),
(45,11,13,'entregado','13:50:00', 12.40);



-- EJERCICIO 3

	-- Para probar el trigger, usamos las entregas a domicilio con los id (11 - 15), 
	-- que fueron insertados anteriormente en este mismo archivo, por lo tanto, no fue necesario añadir nuevos inserts


-- EJERCICIO 4

	-- Para probar el Store Procedure, usamos algunas de las ordenes insertadas en este mismo archivo.
    -- A las cuales les pusimos como fecha, la funcion CURDATE, para que el StoreProcedure 
    -- pueda ser probado cualquier dia que se ejecute
    -- Por lo tanto, para este ejercicio no necesitamos hacer mas inserts


-- EJERCICIO 5

	-- Para saber cuales son los 8 clientes que han hecho mas pedidos tanto en sucursal como a domicilio, creamos ordenes
    -- en tienda para clientes que ya han hecho pedidos a domicilio. Estos seran los clientes con id del 1 al 10

INSERT INTO ORDEN (fkSucursal, fkCliente, fechaOrden, horaOrden, tipoOrden, estado, montoFinal, fkPromocion) VALUES

	-- SUCURSAL CENTRO (46 - 50)
(1, 1, '2024-09-05', '11:56:00', 'tienda', 'finalizado', 194.77, null),
(1,2,'2024-03-21','14:31:00','tienda', 'finalizado',194.77,null),
(1,3,'2024-07-09','15:46:00','tienda', 'finalizado',194.77,null),
(1,4,'2024-11-11','16:13:00','tienda', 'finalizado',194.77,null),
(1,5,'2024-09-14','15:24:00','tienda', 'finalizado',194.77,null),

	-- SUCURSAL NORTE (51 - 55)
(2,6,'2024-03-21','09:16:00','tienda', 'finalizado',194.77,null),
(2,7,'2024-09-14','11:31:00','tienda', 'finalizado',194.77,null),
(2,8,'2024-11-07','12:55:00','tienda', 'finalizado',194.77,null),
(2,9,'2024-03-29','13:27:00','tienda', 'finalizado',194.77,null),
(2,10,'2024-07-25','19:33:00','tienda', 'finalizado',194.77,null);

INSERT INTO ORDEN_has_PIZZA (fkOrden,fkPizza) VALUES

	-- SUCURSAL CENTRO
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),

	-- SUCURSAL NORTE
(51,1),
(52,1),
(53,1),
(54,1),
(55,1);


INSERT INTO entrega_en_tienda (fkOrden,`fkCocinero(entrego)`) VALUES

	-- SUCURSAL CENTRO
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),

	-- SUCURSAL NORTE
(51,6),
(52,6),
(53,6),
(54,6),
(55,6);


-- EJERCICIO 6

	-- Para realizar esta consulta, no necesitamos agregar mas inserts

-- EJERCICIO 7

	-- Para realizar este ejercicio, creamos una orden en la que el cliente con id 1 compra todas las pizzas en un dia normal,
    -- y otra orden en la que el cliente con id 2 compra todas las pizzas en un dia con promocion.
    -- De esta manera, la consulta deberia mostrarnos unicamente al cliente con id 1
    
    INSERT INTO ORDEN (fkSucursal,fkCliente,fechaOrden,horaOrden,tipoOrden,estado,montoFinal,fkPromocion) VALUES
    (1,1,'2024-11-25', '17:05:00', 'tienda', 'finalizado', '2000.00',null),
    (1,2,'2024-11-25', '17:05:00', 'tienda', 'finalizado', '2000.00',1);
    
    INSERT INTO orden_has_pizza (fkOrden, fkPizza) VALUES
	(56,1),
    (56,2),
    (56,3),
    (56,4),
    (56,5),
    (56,6),
    (56,7),
    (56,8),
    (56,9),
    (56,10),
    (56,11),
    (56,12),
    (56,13),
    (56,14),
    (56,15),
    (56,16),
    (56,17),
    (56,18),
    (56,19),
    (56,20),
    (56,21),
    (56,22),
    (56,23),
    (56,24),
    (56,25),
    (56,26),
    (56,27),
    (56,28),
    (56,29),
    (56,30),
    
	(57,1),
    (57,2),
    (57,3),
    (57,4),
    (57,5),
    (57,6),
    (57,7),
    (57,8),
    (57,9),
    (57,10),
    (57,11),
    (57,12),
    (57,13),
    (57,14),
    (57,15),
    (57,16),
    (57,17),
    (57,18),
    (57,19),
    (57,20),
    (57,21),
    (57,22),
    (57,23),
    (57,24),
    (57,25),
    (57,26),
    (57,27),
    (57,28),
    (57,29),
    (57,30);

-- EJERCICIO 8

	-- Para realizar esta consulta, no necesitamos agregar mas inserts
    
-- EJERCICIO 9 

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    

-- EJERCICIO 10

	-- Para realizar esta consulta, necesitamos crear ordenes a domicilio 
    -- sin repartidor asignado, ya que no existen actualmente en la base

INSERT INTO orden (fkSucursal,fkCliente,fechaOrden,horaOrden,tipoOrden,estado,montoFinal,fkPromocion) VALUES

	(1, 1, '2024-11-16', '15:00:00', 'domicilio', 'pendiente', 300.00, null),
    (1, 2, '2024-11-16', '15:00:00', 'domicilio', 'pendiente', 300.00, null),
    (1, 3, '2024-11-16', '15:00:00', 'domicilio', 'pendiente', 300.00, null);

INSERT INTO entrega_a_domicilio (fkOrden,fkRepartidor,fkMotocicleta,estadoEntrega,horaDeEntrega) VALUES

	(58,null,3,'fallido',null),
    (59,null,3,'fallido',null),
    (60,null,3,'fallido',null);

-- EJERCICIO 11

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 12

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 13

	-- Para realizar esta consulta, decidimos agregar algunos empleados extra para el gerente con el id 1,
    -- ya que originalmente, asignamos 15 empleados para cada sucursal. 
    
INSERT INTO persona (nombre, apellidoPaterno, apellidoMaterno, sexo, fechaNacimiento, telefono, email, domicilio, curp, rfc, nss) VALUES

	('Juan', 'Pérez', 'Hernández', 'hombre', '1985-03-12', '5523456789', 'juan.perez@example.com', 'Calle Falsa 123, CDMX', 'PEHJ850312HDFRZN09', 'PEHJ850312K34', '12345678901'),
	('María', 'López', 'Gómez', 'mujer', '1990-07-25', '5534567890', 'maria.lopez@example.com', 'Avenida Siempre Viva 456, Monterrey', 'LOGM900725MNLPRZ03', 'LOGM900725Q12', '23456789012'),
	('Andrea', 'Sánchez', 'Martínez', 'mujer', '2000-11-15', '5545678901', 'andrea.sanchez@example.com', 'Boulevard Reforma 789, Guadalajara', 'SAMM001115MDFNRN04', 'SAMM001115H56', '34567890123'),
	('Carlos', 'Hernández', 'Ramírez', 'hombre', '1980-01-01', '5556789012', 'carlos.hernandez@example.com', 'Calle Juárez 1010, Puebla', 'HERC800101HPLRMZ05', 'HERC800101T78', '45678901234'),
	('Alex', 'García', 'Fernández', 'otro', '1995-09-30', '5567890123', 'alex.garcia@example.com', 'Colonia Centro 2020, Oaxaca', 'GAFE950930HOCNRX06', 'GAFE950930N90', '56789012345');

INSERT INTO empleado (fkPersona, fkGerente, fkSucursal, horaEntrada, horaSalida, estado, sueldo, fechaContratacion, puesto) VALUES

	(85,1,1,'08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero'),
    (86,1,1,'08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero'),
    (87,1,1,'08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero'),
    (88,1,1,'08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero'),
    (89,1,1,'08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero');

INSERT INTO cocinero (fkEmpleado) VALUES

	(46),
    (47),
    (48),
    (49),
    (50);
    

-- EJERCICIO 14

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 15

	-- Para realizar esta consulta, hicimos inserts de ordenes con las pizzas con id 3 durante el periodo del ultimo mes, 
    -- para ello tomaremos la funcion curdate y le restaremos 30 dias. 
    

INSERT INTO ORDEN (fkSucursal, fkCliente, fechaOrden, horaOrden, tipoOrden, estado, montoFinal, fkPromocion) VALUES 
    (1, 1, '2024-11-06', '10:25:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 2, '2024-11-18', '14:50:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 3, '2024-11-10', '19:35:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 4, '2024-11-15', '09:45:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 5, '2024-11-20', '13:15:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 6, '2024-11-07', '17:05:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 7, '2024-11-22', '21:00:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 8, '2024-11-13', '15:40:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 9, '2024-11-25', '11:10:00', 'tienda', 'finalizado', 394.77, NULL),
    (1, 10, '2024-11-09', '20:20:00', 'tienda', 'finalizado', 394.77, NULL);


INSERT INTO orden_has_pizza (fkOrden, fkPizza) VALUES 

	(61,3),
    (62,3),
    (63,3),
    (64,3),
    (65,3),
    (66,3),
    (67,3),
    (68,3),
    (69,3),
    (70,3);


-- EJERCICIO 16

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 17

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 18

	-- Para realiza este ejercicio, decidimos crear 3 ordenes con accidentes para el repartidor con id 4
    
    INSERT INTO orden (fkSucursal,fkCliente,fechaOrden,horaOrden,tipoOrden,estado,montoFinal,fkPromocion) VALUES
    
		(1, 1, '2024-11-28', '11:15:00', 'domicilio', 'cancelado', 0, NULL),
		(1, 1, '2024-11-27', '14:45:00', 'domicilio', 'cancelado', 0, NULL),
		(1, 1, '2024-11-26', '18:30:00', 'domicilio', 'cancelado', 0, NULL);

	INSERT INTO entrega_a_domicilio (fkOrden, fkRepartidor, fkMotocicleta, estadoEntrega, horaDeEntrega, kilometrosRecorridos) VALUES
		
        (71, 4, 3, 'accidente', NULL, NULL),
		(72, 4, 3, 'accidente', NULL, NULL),
		(73, 4, 3, 'accidente', NULL, NULL);
        
	INSERT INTO aviso_de_siniestro (fkEntregaADomicilio, fkAjustador, nombreRepartidor, apellidoPaternoRepartidor, apellidoMaternoRepartidor, placaMotocicleta, nombreAseguradora, numeroDePoliza, fechaAccidente, horaAccidente, descripcion, dictamen) VALUES
		
        (29, 1, 'José', 'Martínez', 'González', '132-COA', 'AXA', 'MOTO-2024-001234', '2024-11-28', '11:45:00', 
		 'El repartidor perdió el control de la motocicleta debido a una curva cerrada y condiciones resbalosas en la carretera.', 
		 'responsabilidad del repartidor'),
		(30, 1, 'José', 'Martínez', 'González', '132-COA', 'AXA', 'MOTO-2024-001234', '2024-11-27', '15:20:00', 
		 'Un vehículo impactó la motocicleta del repartidor al no respetar una señal de alto.', 
		 'responsabilidad del repartidor'),
		(31, 1, 'José', 'Martínez', 'González', '132-COA', 'AXA', 'MOTO-2024-001234', '2024-11-26', '18:50:00', 
		 'El repartidor chocó con un poste mientras intentaba evitar a un peatón cruzando fuera del paso peatonal.', 
		 'no responsabilidad');



-- EJERCICIO 19

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 20

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 21

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    


-- EJERCICIO 22
    
	-- Para realizar esta consulta, no necesitamos agregar mas inserts    
    
    
-- EJERCICIO 23

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    

        
-- EJERCICIO 24

	-- Para realizar esta consulta, no necesitamos agregar mas inserts    

    
    
    
    
    
    
