-- CREACION DE LAS FUNCIONES DEL SEGUNDO PARCIAL

use pizzeria;

-- EJERCICIO 1

	-- Crea una vista con la lista de los cuatro complementos que menos se venden dado un mes incluyendo las promociones
    
    -- Se uso el mes Agosto de 2024

CREATE VIEW complementosMenosVendidos AS 
SELECT 
    C.idComplemento, 
    C.nombre AS Complemento, 
    COUNT(OC.fkComplemento) AS CantidadVendida
FROM complemento AS C
LEFT JOIN orden_has_complemento AS OC ON OC.fkComplemento = C.idComplemento
LEFT JOIN orden AS O ON O.idOrden = OC.fkOrden 
                     AND O.fechaOrden >= '2024-08-01' 
                     AND O.fechaOrden <= '2024-08-31'
GROUP BY C.idComplemento, C.nombre
ORDER BY CantidadVendida ASC
LIMIT 4;


-- EJERCICIO 2

	-- Crea una función que muestre el total de entregas de realiza el repartidor, con base al número de repartidor 
	-- y un rango de fechas que se pasa como parámetros.

DELIMITER //

CREATE FUNCTION totalDeEntregasPorPeriodo(id INT, fechaInicio DATE, fechaFin DATE)
RETURNS INT
DETERMINISTIC
BEGIN 

	DECLARE totalEntregas INT;
    SELECT COUNT(R.idRepartidor) INTO totalEntregas
    FROM repartidor AS R
    
    INNER JOIN entrega_a_domicilio AS ED ON ED.fkRepartidor = R.idRepartidor
	INNER JOIN orden as O ON O.idOrden = ED.fkOrden
    
    WHERE R.idRepartidor = id
		AND O.fechaOrden >= fechaInicio 
		AND O.fechaOrden <= fechaFin;
	
    RETURN totalEntregas;
    
END //

DELIMITER ;
 
 
-- EJERCICIO 3

	-- Crea un trigger para cuando en orden de entrega se cambie el estado a: “Accidente del repartidor”, se
	-- inserte en aviso_de siniestro con el nombre del repartidor, la placa de la unidad, el nombre de la 
	-- aseguradora para la unidad, el número de póliza, la fecha y hora del percance.

DELIMITER //

CREATE TRIGGER registrarAccidente
AFTER UPDATE ON entrega_a_domicilio
FOR EACH ROW
BEGIN
	
    DECLARE nombreRepartidor VARCHAR(100);
    DECLARE apPaternoRepartidor VARCHAR(100);
    DECLARE apMaternoRepartidor VARCHAR(100);
    DECLARE placaMotocicleta VARCHAR(20);
    DECLARE nombreAseguradora VARCHAR(100);
    DECLARE numeroPoliza VARCHAR(50);
    
    SELECT P.nombre, P.apellidoPaterno, P.apellidoMaterno
    INTO nombreRepartidor, apPaternoRepartidor, apMaternoRepartidor
    FROM persona AS P
    INNER JOIN empleado AS E ON E.fkPersona = P.idPersona
    INNER JOIN repartidor AS R ON R.fkEmpleado = E.idEmpleado
    WHERE R.idRepartidor = NEW.fkRepartidor;
    
    SELECT M.placa, M.numeroDePoliza
    INTO placaMotocicleta, numeroPoliza
    FROM motocicleta AS M
    WHERE M.idMotocicleta = NEW.fkMotocicleta;
    
	SELECT A.nombre
    INTO nombreAseguradora
    FROM aseguradora AS A
    INNER JOIN motocicleta AS M ON M.fkAseguradora = A.idAseguradora
    WHERE M.idMotocicleta = NEW.fkMotocicleta;
    
    IF NEW.estadoEntrega = 'accidente' THEN
    
        INSERT INTO aviso_de_siniestro (
        
			fkEntregaADomicilio,
            nombreRepartidor, 
            apellidoPaternoRepartidor, 
            apellidoMaternoRepartidor, 
            placaMotocicleta, 
            nombreAseguradora, 
            numeroDePoliza, 
            fechaAccidente,  
            horaAccidente    
        )
        
        VALUES (
			
            NEW.idEntregaADomicilio,
			nombreRepartidor,
			apPaternoRepartidor,
			apMaternoRepartidor,
			placaMotocicleta,
			nombreAseguradora,
			numeroPoliza,
			CURDATE(),
			CURTIME()
            
        );
        
    END IF;
END//

DELIMITER ;


-- EJERCICIO 4

	--  Crea un procedimiento almacenado para que de los complementos que se vendieron al final del día, p.e.: 
	-- 40 refresco de 2lt, 20 cajas alitas boneless de 12 piezas, 15 cajas alitas con hueso de 8 piezas, 15 cajas 
	-- de papotas con 10 piezas. etc. para que se ingrese en inventario de complementos, esto será lo que se debe 
	-- de comprar para el siguiente día, al guardar cada insumo incluir la fecha actual más un día, este será el 
	-- día en que se debe realizar la compra.

DELIMITER //

CREATE PROCEDURE complementosPorComprar()
BEGIN 
    
		SELECT C.nombre AS "Complemento", 
		O.fechaOrden AS "fecha De Venta",  
		COUNT(C.idComplemento) AS "Cantidad Vendida",
		O.fechaOrden + INTERVAL 1 DAY AS "Reabastecimiento Progrado Para El Dia:"
        
    FROM complemento as C 
    INNER JOIN orden_has_complemento AS OC ON OC.fkComplemento = C.idComplemento
    INNER JOIN orden AS O ON O.idOrden = OC.fkOrden
    WHERE O.fechaOrden = CURDATE()
    GROUP BY C.nombre, O.fechaOrden;

END //

DELIMITER ;


-- EJERCICIO 5
 
	-- ¿Cuáles son los 8 clientes han realizado pedidos tanto a domicilio como en la sucursal?
    -- emplear la INTERSECCIÓN
    
CREATE VIEW clientesConAmbosPedidos AS 
SELECT 

    C.idCliente, 
    P.nombre, 
    P.apellidoPaterno, 
    P.apellidoMaterno, 
    COUNT(DISTINCT ET.idEntregaEnTienda) AS cantidadEntregasEnTienda,
    COUNT(DISTINCT ED.idEntregaADomicilio) AS cantidadEntregasADomicilio,
    COUNT(DISTINCT ET.idEntregaEnTienda) + COUNT(DISTINCT ED.idEntregaADomicilio) AS totalOrdenes
    
	FROM persona AS P

	INNER JOIN cliente AS C ON C.fkPersona = P.idPersona
	INNER JOIN orden AS O1 ON O1.fkCliente = C.idCliente
	INNER JOIN entrega_en_tienda AS ET ON ET.fkOrden = O1.idOrden
	INNER JOIN orden AS O2 ON O2.fkCliente = C.idCliente
	INNER JOIN entrega_a_domicilio AS ED ON ED.fkOrden = O2.idOrden

GROUP BY C.idCliente, P.nombre, P.apellidoPaterno, P.apellidoMaterno
HAVING 

    COUNT(DISTINCT ET.idEntregaEnTienda) > 0 
    AND COUNT(DISTINCT ED.idEntregaADomicilio) > 0
    
ORDER BY totalOrdenes DESC
LIMIT 8;


-- EJERCICIO 6

	-- Tuvimos algunos problemas para completar este ejercicio debido a una decisión tomada en el diseño original de la base de datos. 
	-- Para registrar los distintos tamaños que pueden tener las pizzas, decidimos crear tres filas separadas por cada pizza en la misma tabla, 
	-- donde cada fila corresponde a un tamaño específico (personal, mediana, familiar).
			
	-- Por lo tanto, para resolver el ejercicio, decidimos crear un procedimiento almacenado con una tabla temporal para almacenar los tres posibles tamaños de pizza. Posteriormente, 
	-- tomamos un único registro por cada pizza (recordemos que existen tres registros por cada pizza, uno por cada tamaño) para evitar redundancia en la consulta. 
	-- Este registro lo utilizamos como base para realizar el producto cartesiano requerido entre las pizzas y los tamaños almacenados en la tabla auxiliar.


DELIMITER //

CREATE PROCEDURE productoCartesianoPizza_Tamaño () 
BEGIN
		
	CREATE TEMPORARY TABLE IF NOT EXISTS tamañosDePizza (
		tamaño ENUM('personal', 'mediana', 'familiar') NOT NULL);

	INSERT INTO tamañosDePizza (tamaño)
	VALUES 
		('personal'),
		('mediana'),
		('familiar');

	SELECT 

		P.idPizza, 
		P.nombre, 
		P.descripcion, 
		T.tamaño AS nuevoTamaño
		
	FROM (SELECT * FROM pizza WHERE idPizza IN (1, 4, 7, 10, 13, 16, 19, 22, 25, 28)) AS P 
	CROSS JOIN tamañosDePizza AS T;
    
    DROP TEMPORARY TABLE IF EXISTS tamañosDePizza;
    
END // 
    
DELIMITER ;


-- EJERCICIO 7

	--  ¿Cuáles son los clientes que han pedido todos los tipos de pizzas disponibles, independientemente del 
	-- tamaño, pero que nunca las compraron en día de promoción? – emplear DIVISIÓN
 
CREATE VIEW clientesQueHanPedidoTodasLasPizzas AS 
	 
	SELECT O.fkCliente, P.nombre, P.apellidoPaterno, P.apellidoMaterno FROM orden O
	
    
    INNER JOIN cliente AS C ON C.idCliente = O.fkCliente
    INNER JOIN persona AS P ON P.idPersona = C.fkPersona
	INNER JOIN orden_has_pizza OP ON O.idOrden = OP.fkOrden
	WHERE OP.fkPizza IN (SELECT idPizza FROM pizza) AND O.fkPromocion IS null
    

	GROUP BY O.fkCliente
	HAVING COUNT(DISTINCT OP.fkPizza) = (SELECT COUNT(*) FROM pizza);


-- EJERCICIO 8

	-- Cuáles son todos los repartidores, incluyendo aquellos que no han entregado algún pedido?
	-- emplear LEFT JOIN

CREATE VIEW todosLosRepartidores AS
SELECT 

    R.idRepartidor,
    P.nombre,
    P.apellidoPaterno,
    P.apellidoMaterno,
    COUNT(ED.idEntregaADomicilio) AS totalEntregas
    
FROM persona AS p

INNER JOIN empleado AS E ON E.fkPersona = P.idPersona
INNER JOIN repartidor AS R ON R.fkEmpleado = E.idEmpleado

LEFT JOIN entrega_a_domicilio AS ED ON ED.fkRepartidor = R.idRepartidor
LEFT JOIN orden AS O ON O.idOrden = ED.fkOrden

GROUP BY R.idRepartidor, P.nombre, P.apellidoPaterno, P.apellidoMaterno;


-- EJERCICIO 9

	--  ¿Cuáles son los repartidores que nunca han 
	-- entregado una orden de pedido? – emplear LEFT JOIN 
	-- WHERE B.key IS NULL
    
CREATE VIEW repartidoresSinEntregas AS
SELECT 

    R.idRepartidor,
    P.nombre,
    P.apellidoPaterno,
    P.apellidoMaterno,
    COUNT(ED.idEntregaADomicilio) AS totalEntregas
    
FROM persona AS P

INNER JOIN empleado AS E ON E.fkPersona = P.idPersona
INNER JOIN repartidor AS R ON R.fkEmpleado = E.idEmpleado

LEFT JOIN entrega_a_domicilio AS ED ON ED.fkRepartidor = R.idRepartidor
LEFT JOIN orden AS O ON O.idOrden = ED.fkOrden

WHERE ED.idEntregaADomicilio IS NULL 
GROUP BY R.idRepartidor, P.nombre, P.apellidoPaterno, P.apellidoMaterno;


-- EJERCICIO 10

	--  ¿Cuáles son todos los repartidores y sus órdenes, incluyendo los repartidores sin órdenes y ordenes sin 
	-- un repartidor asignado? – emplear FULL OUTER JOIN

CREATE VIEW repartidoresConSusOrdenes AS 

SELECT 

    P.nombre AS nombreRepartidor,
    P.apellidoPaterno,
    P.apellidoMaterno,
    O.idOrden AS idOrden,
    O.fechaOrden,
    O.tipoOrden,
    EAD.estadoEntrega
    
FROM REPARTIDOR R

	LEFT JOIN EMPLEADO E ON R.fkEmpleado = E.idEmpleado
	LEFT JOIN PERSONA P ON E.fkPersona = P.idPersona
	LEFT JOIN ENTREGA_A_DOMICILIO EAD ON R.idRepartidor = EAD.fkRepartidor
	LEFT JOIN ORDEN O ON EAD.fkOrden = O.idOrden

UNION SELECT 

    NULL AS nombreRepartidor,
    NULL AS apellidoPaterno,
    NULL AS apellidoMaterno,
    O.idOrden AS idOrden,
    O.fechaOrden,
    O.tipoOrden,
    EAD.estadoEntrega
    
FROM ORDEN AS O

LEFT JOIN ENTREGA_A_DOMICILIO EAD ON O.idOrden = EAD.fkOrden
WHERE O.tipoOrden = 'domicilio' AND EAD.fkRepartidor IS NULL;


-- EJERCICIO 11

	-- ¿Cuántas ordenes de pizzas se han realizado su cancelación en la primera 
    -- sucursal de los últimos dos meses? – emplear COUNT
    
CREATE VIEW ordenesCanceladasPrimeraSucursal AS 

SELECT COUNT(*) AS totalCanceladas
FROM orden
WHERE fkSucursal = 1 
	AND estado = 'cancelado' 
    AND fechaOrden >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);
    

-- EJERCICIO 12

	--  ¿Cuál es el promedio de compra de los clientes de todos los pedidos incluye pizzas y complementos? –emplear AVG

CREATE VIEW promedioDeCompras AS

SELECT AVG(O.montoFinal) AS Promedio
FROM orden AS O;
    
    
-- EJERCICIO 13

	-- ¿Cuál es el gerente con el mayor número de personal a su cargo? – emplear MAX

CREATE VIEW gerenteConMasEmpleados AS

SELECT 

    G.idGerente,
    P.nombre AS nombreGerente,
    P.apellidoPaterno,
    P.apellidoMaterno,
    COUNT(E.idEmpleado) AS totalPersonalACargo
    
FROM GERENTE AS G

INNER JOIN PERSONA AS P ON G.fkPersona = P.idPersona
LEFT JOIN EMPLEADO AS E ON E.fkGerente = G.idGerente

GROUP BY G.idGerente, P.nombre, P.apellidoPaterno, P.apellidoMaterno
HAVING COUNT(E.idEmpleado) = (
        SELECT MAX(totalEmpleados)
        FROM (
        
        SELECT COUNT(E2.idEmpleado) AS totalEmpleados
            FROM GERENTE AS G2
            LEFT JOIN EMPLEADO AS E2 ON E2.fkGerente = G2.idGerente
            GROUP BY G2.idGerente
            
        ) AS subconsulta
    );


-- EJERCICIO 14

	--  ¿Cuál es la desviación estándar del gasto del seguro de las unidades en el último mes? – emplear STDDEV

CREATE VIEW desviacionEstandarRenta AS

SELECT STDDEV(M.rentaSeguro) AS desviacionEstandarRenta
FROM motocicleta AS M;



-- EJERCICIO 15

	--  ¿Qué tipos de pizza generan ingresos superiores a $3,000 en último mes? – emplear HAVING y GROUP BY

CREATE VIEW pizzaConIngresosMayores AS

SELECT 

	P.idPizza AS IdPizza,
    P.nombre AS nombrePizza,
    P.tamaño AS tamañoPizza,
    SUM(P.precio) AS ingresosTotales
    
FROM orden AS O

INNER JOIN orden_has_pizza AS OP ON O.idOrden = OP.fkOrden
INNER JOIN pizza AS P ON P.idPizza = OP.fkPizza
WHERE O.fechaOrden >= CURDATE() - INTERVAL 1 MONTH AND O.estado = 'finalizado'

GROUP BY P.idPizza, P.nombre, P.tamaño
HAVING SUM(P.precio) > 3000;


-- EJERCICIO 16

	-- ¿Cuáles son los clientes que nunca han comprado ensalada como complemento? – emplear una 
	-- subconsulta empleando NOT EXISTS.  1,5,22,13
    
    -- Los clientes que han pedido Ensalada son los siguientes:
		       
        -- ID: 1, Carlos Pérez García
        -- ID: 5, Miguel González Vega
        -- ID: 13, Héctor Torres Zavala
        -- ID: 22, Claudia Morales Fernández
	           
    -- Por lo tanto, no deberian aparecer en la salida del Query


CREATE VIEW clientesQueNoHanPedidoEnsalada AS
SELECT  

    C.idCliente,
    P.nombre,
    P.apellidoPaterno,
    P.apellidoMaterno
    
FROM cliente AS C
INNER JOIN persona AS P ON P.idPersona = C.fkPersona

WHERE NOT EXISTS (

    SELECT 1
    FROM complemento AS C2
    INNER JOIN orden_has_complemento AS OC ON OC.fkComplemento = C2.idComplemento
    INNER JOIN orden AS O ON O.idOrden = OC.fkOrden
    WHERE C2.idComplemento = 9 
    AND O.fkCliente = C.idCliente
    
);


-- EJERCICIO 17

	-- ¿Cuál son los litros consumidos de cada unidad, considerando el kilometraje inicial y final de cada 
	-- entrega, ya que cada moto consume 4 litros por cada 100 kilómetros? - realízalo como atributo calculado.

	-- Para realizar este ejercicio, primero modificamos la tabla motocicleta, añadiendo la columna kilometraje y la tabla
    -- entrega a domicilio, añadiendo la columna kilometrosRecorridos, para poder trabajar con los valores solicitados.
    
    -- TRIGGER DE ACTUALIZACION DE KILOMETRAJE

	-- NO ES NECESARIO EJECUTARLO, PUES YA SE HA CREADO ANTERIORMENTE
    
		-- DELIMITER $$

			-- CREATE TRIGGER actualizar_kilometraje
			-- AFTER INSERT ON ENTREGA_A_DOMICILIO
			-- FOR EACH ROW
			-- BEGIN
				
				-- UPDATE MOTOCICLETA
				-- SET kilometraje = kilometraje + COALESCE(NEW.kilometrosRecorridos, 0)
				-- WHERE idMotocicleta = NEW.fkMotocicleta;
			-- END $$

			-- DELIMITER ;


    -- Posteriormente, asignamos un valor inicial para el kilometraje de cada motocicleta y creamos un trigger para que cada que
    -- se agregara un nuevo registro a entrega a domicilio, se sumaran los kilometros recorridos a la columna de kilometraje de la motocicleta de forma automatica
    
	-- Ahora procederemos a calcular y mostrar los litros consumidos por cada unidad
    
    
CREATE VIEW litrosConsumidosPorMotocicleta AS
SELECT 

	M.idMotocicleta, 
	S.nombreSucursal AS Sucursal, 
	M.modelo, 
	ROUND((M.kilometraje / 100 * 4), 2) AS litrosGastados 

FROM motocicleta AS M
INNER JOIN sucursal AS S ON S.idSucursal = M.fkSucursal;


-- EJERCICIO 18

	-- En repartidor agregar un campo: con_accidentes que se pase a ‘Si’, el campo defecto debe ser ‘No’, si un 
    -- repartidor tiene más de tres incidencias “accidentes” ponerlo el valor de ‘Si’ en el campo de con_accidentes.
	-- – emplear consulta correlacionada (UPDATE/SELECT)

	-- Para realizar esta funcionalidad, decidimos crear un TRIGGER que se ejecute cada que se haga un insert en la tabla de accidentes, 
    -- determine cuandos accidentes lleva el repartidor y si el numero llega a mas de 3 accidentes, el valor de la columna conAccidentes cambie a 'si'
	
	-- TRIGGER DE ACTUALIZACION: 
    
    -- NO ES NECESARIO CREAR EL TRIGGER, YA QUE YA SE HA CREADO ANTERIORMENTE
		
			-- DELIMITER $$

			-- CREATE TRIGGER after_insert_aviso_de_siniestro
			-- AFTER INSERT ON aviso_de_siniestro
			-- FOR EACH ROW
			-- BEGIN
				
				-- UPDATE repartidor R
				-- SET R.conAccidentes = 'si'
				-- WHERE R.idRepartidor = (
					-- SELECT E.fkRepartidor
					-- FROM entrega_a_domicilio E
					-- WHERE E.idEntregaADomicilio = NEW.fkEntregaADomicilio
				-- )
				-- AND (
					-- SELECT COUNT(*)
					-- FROM aviso_de_siniestro A
					-- JOIN entrega_a_domicilio E ON A.fkEntregaADomicilio = E.idEntregaADomicilio
					-- WHERE E.fkRepartidor = R.idRepartidor
				-- ) > 3;
                
			-- END$$

	-- SELECT PARA MOSTRAR LOS REPARTIDORES CON ACCIDENTES:
    
	CREATE VIEW repartidoresConAccidentes AS
    
	   SELECT 
		
			R.idRepartidor,
			P.nombre,
			P.apellidoPaterno,
			P.apellidoMaterno,
			R.conAccidentes
		
		FROM repartidor AS R
		
		INNER JOIN empleado AS E ON E.idEmpleado = R.fkEmpleado
		INNER JOIN persona AS P ON P.idPersona = E.fkPersona
		
		WHERE (R.conAccidentes = 'si');


-- EJERCICIOS 19 - 22

	-- Para estos ejercicios de administracion de usuarios no fue necesario crear funciones,
    -- la realizacion de estos ejercicios se detalla en el archivo "EjecucionDeFunciones"

-- EJERCICIO 23

	-- En la tabla de unidad para las motocicletas se tiene además del id_unidad el campo del número de placa, generalmente 
    -- se usa la placa para buscar las unidades. Crea un índice sobre este campo para optimizar la consulta y realiza la consulta que usa el 
	-- campo del número de placa y presenta los repartidores que la han utilizado. 

	-- Creacion del INDEX
CREATE INDEX idx_placa ON motocicleta(placa);

	-- Creacion de la consulta
    
CREATE VIEW motocicletasConIndex AS

	SELECT 

		M.placa AS NumeroPlaca,
		M.modelo AS ModeloMotocicleta,
		R.idRepartidor,
		P.nombre AS NombreRepartidor,
		P.apellidoPaterno AS ApellidoPaterno,
		P.apellidoMaterno AS ApellidoMaterno,
		O.idOrden AS idOrden
		

	FROM repartidor AS R

	INNER JOIN empleado AS E ON E.idEmpleado = R.fkEmpleado
	INNER JOIN persona AS P ON P.idPersona = E.fkPersona
	INNER JOIN entrega_a_domicilio AS ED ON R.idRepartidor = ED.fkRepartidor
	INNER JOIN orden AS O ON ED.fkOrden = O.idOrden
	INNER JOIN motocicleta AS M ON ED.fkMotocicleta = M.idMotocicleta;

		-- Verificar los indices creados
		
	SHOW INDEX FROM motocicleta;


-- EJERCICIO 24

	-- Primero crea un respaldo empleando mysqldump el nombre p.e., debe ser pizzeria_respaldo.sql, Segundo 
	-- realiza el DROP de la base de datos de pizzería y por último crea la base de datos pizzería y a partir del 
	-- dump: pizzeria_respaldo.sql se restaure la base de datos.


	-- para estos ejercicios no requerimos crear funciones ni consultas en la base de datos, 
    -- por lo que la realizacion del ejercicio se encuentra en el archivo "EjecucionDeFunciones" 



