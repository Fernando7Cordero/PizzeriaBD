-- EJECUCION DE LAS FUNCIONES DEL SEGUNDO PARCIAL

use pizzeria;

-- EJERCICIO 1

	-- EJECUCION DE LA VISTA
	SELECT * FROM complementosMenosVendidos;

 
-- EJERCICIO 2

	-- EJECUCION DE LA FUNCION

	-- (Entregas del repartidor #1 desde el primero de agosto de 2015 hasta finales de 2024)
	SELECT totalDeEntregasPorPeriodo(1, '2015-08-01', '2024-12-31');

	-- (Entregas del repartidor #6 desde el mes de agosto hasta finales de diciembre de 2024)
	SELECT totalDeEntregasPorPeriodo(6, '2024-08-01', '2024-12-31');

	-- (Entregas del repartidor #11 en 2024)
	SELECT totalDeEntregasPorPeriodo(11, '2024-01-01', '2024-12-31');


-- EJERCICIO 3

	-- EJECUCION DEL TRIGGER

	UPDATE entrega_a_domicilio SET estadoEntrega = 'accidente' WHERE idEntregaADomicilio = 11;
	
    -- COMPROBACION DE LA EJECUCION DEL TRIGGER
		
    SELECT * FROM aviso_de_siniestro;
    
		-- Despues de ejecutar el trigger, se podra observar que se ha agregado 
		-- una nueva fila en la tabla aviso de siniestro, con los siguientes datos:
		-- Repartidor: Jose Martinez Gonzalez, Motocicleta: 132-COA, Aseguradora: AXA
    
    -- MAS EJEMPLOS...
    
    UPDATE entrega_a_domicilio SET estadoEntrega = 'accidente' WHERE idEntregaADomicilio = 2;
    UPDATE entrega_a_domicilio SET estadoEntrega = 'accidente' WHERE idEntregaADomicilio = 21;
    UPDATE entrega_a_domicilio SET estadoEntrega = 'accidente' WHERE idEntregaADomicilio = 9;
    UPDATE entrega_a_domicilio SET estadoEntrega = 'accidente' WHERE idEntregaADomicilio = 5;
    
    SELECT * FROM aviso_de_siniestro;


-- EJERCICIO 4

	-- EJECUCION DEL STORE PROCEDURE
    
	CALL complementosPorComprar();
    

-- EJERCICIO 5

	-- EJECUCION DE LA VISTA
    
    SELECT * FROM clientesConAmbosPedidos;
    
    
-- EJERCICIO 6

	-- EJECUCION DE LA VISTA
    
	CALL productoCartesianoPizza_Tamaño();

    
-- EJERCICIO 7

	SELECT * FROM clientesQueHanPedidoTodasLasPizzas;
    

-- EJERCICIO 8

	-- EJECUCION DE LA VISTA
    
    SELECT * FROM todosLosRepartidores;
    

-- EJERCICIO 9

	-- EJECUCION DE LA VISTA
    
    SELECT * FROM repartidoresSinEntregas;
    

-- EJERCICIO 10

	-- EJECUCION DE LA VISTA
    
    SELECT * FROM repartidoresConSusOrdenes;
    

-- EJERCICIO 11

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM ordenesCanceladasPrimeraSucursal;
    
    
-- EJERCICIO 12

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM promedioDeCompras;
    

-- EJERCICIO 13

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM gerenteConMasEmpleados;
    

-- EJERCICIO 14

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM desviacionEstandarRenta;
    

-- EJERCICIO 15

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM pizzaConIngresosMayores;
    
    
-- EJERCICIO 16

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM clientesQueNoHanPedidoEnsalada;
    
    
-- EJERCICIO 17

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM litrosConsumidosPorMotocicleta;
    
    
-- EJERCICIO 18

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM repartidoresConAccidentes;
    

-- EJERCICIO 19

	-- Crea un usuario supervisor_repartidor en la base de datos de pizzeria con contraseña y que pueda tener 
	-- todos los permisos sobre la tabla repartidor.


CREATE USER 'supervisor_repartidor'@'localhost' IDENTIFIED BY 'supervisor';

GRANT ALL PRIVILEGES ON pizzeria.repartidor TO 'supervisor_repartidor'@'localhost';

FLUSH PRIVILEGES;


-- EJERCICIO 20

	-- Conéctate con el usuario gerente y realiza alguna actualización de algún registro sobre la tabla repartidor.
    
		-- Para realizar este ejercicio, tuvimos que ejecutar el siguiente comando desde el CMD ():
			
			-- mysql -u supervisor_repartidor -p -h localhost
			
		-- Posteriormente la consola solicita la contraseña del usuario, la cual es "supervisor"

		-- Una vez que conseguimos acceder con el usuario creado, ejecutamos los siguientes comandos:
			
            USE pizzeria;
			UPDATE repartidor SET vigenciaLicencia = '2027-12-12' WHERE idRepartidor = 1;

		-- Finalmente verificamos el cambio realizado 
        
			SELECT * FROM repartidor WHERE idRepartidor = 1;


-- EJERCICIO 21

	-- Ahora revoca solo el privilegio de “actualización” del usuario supervisor_repartidor sobre la tabla de repartidor.
    
REVOKE UPDATE ON pizzeria.repartidor FROM 'supervisor_repartidor'@'localhost';

	-- Verificamos los privilegios del usuario
    
SHOW GRANTS FOR 'supervisor_repartidor'@'localhost';


-- EJERCICIO 22

	-- Y finalmente con el mismo usuario trata de hacer una actualización sobre la tabla de repartidor.

	-- Al ejecutar una actualizacion sobre la tabla repartidor con el usuario supervisor_repartidor desde el CMD, 
    -- nos ha mostrado el siguiente mensaje de error:
    
		-- ERROR 1142 (42000): UPDATE command denied to user 'supervisor_repartidor'@'localhost' for table 'repartidor'
    
    -- Esto significa que el usuario no tiene permisos para hacer UPDATE en la base de datos
    
    
-- EJERCICIO 23

	-- EJECUCION DE LA VISTA 
    
    SELECT * FROM motocicletasConIndex;
    

-- EJERCICIO 23

	-- PASO 1: crear el respaldo de la base de datos, para ello ejecutamos el siguiente comando en la consola
    
		-- mysqldump -u root -p pizzeria > pizzeria_respaldo.sql


	-- PASO 2: Eliminar la base de datos con el siguiente comando: 
    
		DROP DATABASE pizzeria;


	-- PASO 3: Crear la base de datos nuevamente
    
		CREATE DATABASE pizzeria;
		USE pizzeria;
        

	-- PASO 4: Restauramos la base de datos usando el respaldo
    
        -- mysql -u root -p pizzeria < pizzeria_respaldo.sql


	-- PASO 5: CONFIRMAR LA RESTAURACION
    
		USE pizzeria;
		SHOW TABLES;