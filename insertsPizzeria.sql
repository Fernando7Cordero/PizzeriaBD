-- INSERTS DE DATOS (PARCIAL 1)

USE PIZZERIA;


-- SUCURSAL

INSERT INTO SUCURSAL (nombreSucursal, direccion, telefono, horaApertura, horaCierre) VALUES 
('Sucursal Centro', 'Av. Central 123, Ciudad de México', '5551234567', '09:00:00', '22:00:00'),
('Sucursal Norte', 'Calle Norte 56, Ciudad de México', '5559876543', '09:00:00', '22:00:00'),
('Sucursal Sur', 'Boulevard Sur 39, Ciudad de México', '5557654321', '09:00:00', '22:00:00');


-- ASEGURADORA

INSERT INTO ASEGURADORA (nombre, telefono, direccion) VALUES
('AXA', '5546236578', 'Cto Interior Avenida Río Churubusco 583, 09060 Ciudad de México'),
('GNP', '5597578423', 'Paseo de la reforma 144, 06600 Cuauhtémoc, Ciudad de México'),
('Qualitas' , '5598235412', 'Av. P.º de la Reforma 126-2o Piso,, 06600 Ciudad De México');


-- PERSONA

INSERT INTO PERSONA (nombre, apellidoPaterno, apellidoMaterno, sexo, fechaNacimiento, telefono, email, domicilio, curp, rfc, nss)
VALUES 

	-- GERENTES 
		
        -- SUCURSAL CENTRO (1)
('Fernando', 'Cordero', 'Tovar', 'hombre', '2004-12-12', '5532115148', 'alexisfact@gmail.com', 'Porfirio Diaz 39, San Lucas, Iztapalapa, 09000, CDMX', 'COTF041212HMCRVRA6', 'COTF041212AR6', '5920401235'),
 
		-- SUCURSAL NORTE (2)
('Mónica', 'Ramos', 'Hernández', 'mujer', '1985-06-24', '5521234567', 'monicaramos@gmail.com', 'Av. Universidad 200, Coyoacán, CDMX', 'RAHM850624MDFNRSA2', 'RAHM850624TS2', '23851122149'),

		-- SUCURSAL SUR (3)
('Luis', 'Gutiérrez', 'Soto', 'hombre', '1978-03-15', '5559876543', 'luisgutierrez@gmail.com', 'Insurgentes Sur 300, Benito Juárez, CDMX', 'GUSL780315HDFTNR09', 'GUSL780315TN09', '09770715364'),


	-- EMPLEADOS

		-- SUCURSAL CENTRO
        
			-- COCINEROS (4 - 8)
('Ricardo', 'Martínez', 'López', 'hombre', '1990-05-10', '5512345678', 'ricardo.martinez@gmail.com', 'Calle Juárez 123, Colonia Centro, CDMX', 'MALR900510HDFNRD01', 'MALR900510RD01', '89501123456'),
('María', 'Fernández', 'Gómez', 'mujer', '1987-03-22', '5587654321', 'mariafernandez@gmail.com', 'Calle Morelos 456, Colonia Roma, CDMX', 'FAGM870322MDFNRD02', 'FAGM870322RD02', '32109876543'),
('Julio', 'Pérez', 'Sánchez', 'hombre', '1992-07-18', '5598765432', 'julioperez@gmail.com', 'Av. Reforma 789, Colonia Juárez, CDMX', 'PESJ920718HDFNRD03', 'PESJ920718RD03', '21098765432'),
('Sofía', 'González', 'Díaz', 'mujer', '1995-11-30', '5511122233', 'sofiagonzalez@gmail.com', 'Calle Hidalgo 321, Colonia Del Valle, CDMX', 'GODS951130MDFNRD04', 'GODS951130RD04', '12345678910'),
('Pablo', 'Vargas', 'Ortiz', 'hombre', '1980-09-17', '5544332211', 'pablovargas@gmail.com', 'Calle Tlalpan 150, Colonia Centro, CDMX', 'VORP800917HDFNRD05', 'VORP800917RD05', '65432109876'),

			-- CAJEROS (9 - 13)
('Ana', 'López', 'Martínez', 'mujer', '1983-12-05', '5554443322', 'analopez@gmail.com', 'Calle Monterrey 234, Colonia Roma, CDMX', 'LOMA831205MDFNRD06', 'LOMA831205RD06', '56789012345'),
('Carlos', 'Serrano', 'García', 'hombre', '1977-04-09', '5523456789', 'carlosserrano@gmail.com', 'Calle Veracruz 987, Colonia Del Valle, CDMX', 'SERG770409HDFNRD07', 'SERG770409RD07', '98765432101'),
('Daniela', 'Mendoza', 'Hernández', 'mujer', '1991-02-14', '5512349876', 'danielamendoza@gmail.com', 'Calle Insurgentes 321, Colonia Roma, CDMX', 'MEHD910214MDFNRD08', 'MEHD910214RD08', '65409812321'),
('Raúl', 'Lara', 'Sánchez', 'hombre', '1993-08-23', '5552345678', 'raullara@gmail.com', 'Calle Morelos 789, Colonia Juárez, CDMX', 'LASR930823HDFNRD09', 'LASR930823RD09', '56743210987'),
('Laura', 'Reyes', 'Torres', 'mujer', '1989-10-02', '5523459876', 'laurareyes@gmail.com', 'Calle Hidalgo 456, Colonia Centro, CDMX', 'RETL891002MDFNRD10', 'RETL891002RD10', '34509812345'),

			-- REPARTIDORES (14 - 18)
('José', 'Martínez', 'González', 'hombre', '1985-03-15', '5541234567', 'josemartinez@gmail.com', 'Avenida Juárez 789, Colonia Centro, CDMX', 'MAOJ850315MDFGNS09', 'MAOJ850315HDFGNS09', '34509812346'),
('María', 'Pérez', 'López', 'mujer', '1992-07-20', '5598765432', 'mariaperez@gmail.com', 'Boulevard Miguel Ángel 234, Colonia Roma, CDMX', 'PEPM920720MDFMRS02', 'PEPM920720RDFMRS02', '34509812347'),
('David', 'Hernández', 'Sánchez', 'hombre', '1988-11-30', '5587654321', 'davidhernandez@gmail.com', 'Calle Morelos 123, Colonia Juárez, CDMX', 'HEDD881130MDFNCX04', 'HEDD881130RDFNCX04', '34509812348'),
('Sofía', 'García', 'Mendoza', 'mujer', '1995-05-22', '5534567890', 'sofiagarcia@gmail.com', 'Calle 5 de Febrero 987, Colonia Del Valle, CDMX', 'GASM950522MDFSFR07', 'GASM950522RDFRFR07', '34509812349'),
('Fernando', 'Vázquez', 'Rojas', 'hombre', '1983-09-15', '5556789012', 'fernandovazquez@gmail.com', 'Calle de la Paz 456, Colonia Santa Fe, CDMX', 'VAFJ830915MDFVJN08', 'VAFJ830915RDFVJN08', '34509812350'),


		-- SUCURSAL NORTE
        
			-- COCINEROS (19 - 23)
('Miguel', 'Hernández', 'Gómez', 'hombre', '1996-06-15', '5545671234', 'miguelhernandez@gmail.com', 'Calle Tlalpan 123, Colonia Juárez, CDMX', 'HEGM960615HDFNRD11', 'HEGM960615RD11', '78901234567'),
('Paola', 'Domínguez', 'Pérez', 'mujer', '1988-04-25', '5556781234', 'paoladominguez@gmail.com', 'Av. Universidad 456, Coyoacán, CDMX', 'DOPF880425MDFNRD12', 'DOPF880425RD12', '23456789012'),
('José', 'Rivera', 'Ramírez', 'hombre', '1982-03-03', '5511123344', 'joserivera@gmail.com', 'Calle Reforma 789, Benito Juárez, CDMX', 'RIRJ820303HDFNRD13', 'RIRJ820303RD13', '90123456789'),
('Sara', 'Morales', 'Cruz', 'mujer', '1994-01-10', '5598761234', 'saramorales@gmail.com', 'Calle Juárez 987, Colonia Del Valle, CDMX', 'MOCS940110MDFNRD14', 'MOCS940110RD14', '89012345678'),
('Javier', 'García', 'Domínguez', 'hombre', '1986-07-12', '5532115566', 'javiergarcia@gmail.com', 'Av. Reforma 500, Colonia Roma, CDMX', 'GADO860712HDFNRD15', 'GADO860712RD15', '67890123456'),

			-- CAJEROS (24 - 28)
('Andrea', 'Castro', 'Vega', 'mujer', '1997-09-29', '5512123445', 'andreacastro@gmail.com', 'Calle Juárez 600, Colonia Del Valle, CDMX', 'CAVE970929MDFNRD16', 'CAVE970929RD16', '34567890123'),
('Eduardo', 'Ortiz', 'Ramírez', 'hombre', '1984-05-18', '5550981234', 'eduardoortiz@gmail.com', 'Calle Morelos 100, Colonia Centro, CDMX', 'ORRE840518HDFNRD17', 'ORRE840518RD17', '56789012312'),
('Claudia', 'Sosa', 'López', 'mujer', '1981-02-27', '5521340987', 'claudiasosa@gmail.com', 'Calle Hidalgo 700, Colonia Juárez, CDMX', 'SOLC810227MDFNRD18', 'SOLC810227RD18', '89056743210'),
('Álvaro', 'Gómez', 'Vargas', 'hombre', '1979-10-21', '5534321098', 'alvarogomez@gmail.com', 'Calle Tlalpan 456, Colonia Roma, CDMX', 'GOVA791021HDFNRD19', 'GOVA791021RD19', '01234567890'),
('Beatriz', 'Ramírez', 'Flores', 'mujer', '1990-11-05', '5512345678', 'beatrizramirez@gmail.com', 'Calle Monterrey 123, Benito Juárez, CDMX', 'RAFB901105MDFNRD20', 'RAFB901105RD20', '12345678901'),

			-- REPARTIDORES (29 - 33)
('Isabel', 'Jiménez', 'Soto', 'mujer', '1990-12-01', '5578901234', 'isabeljimenez@gmail.com', 'Calle Insurgentes 321, Colonia Roma, CDMX', 'JIIS900120MDFJZL05', 'JIIS900120RDFJZL05', '34509812351'),
('Ricardo', 'Flores', 'Salazar', 'hombre', '1987-02-28', '5590123456', 'ricardoflores@gmail.com', 'Avenida Reforma 654, Colonia Polanco, CDMX', 'FLSR870228MDFLRD12', 'FLSR870228RDFLRD12', '34509812352'),
('Patricia', 'Salas', 'Moreno', 'mujer', '1993-06-16', '5512345678', 'patriciasalas@gmail.com', 'Calle 16 de Septiembre 321, Colonia Coyoacán, CDMX', 'SAMR930616MDFPNS03', 'SAMR930616RDFPNS03', '34509812353'),
('Javier', 'Morales', 'Cruz', 'hombre', '1986-04-11', '5523456789', 'javiermorales@gmail.com', 'Calle Cuauhtémoc 876, Colonia Tlalpan, CDMX', 'MOCJ860411MDFMRS07', 'MOCJ860411RDFMRS07', '34509812354'),
('Verónica', 'Ríos', 'González', 'mujer', '1994-08-05', '5567890123', 'veronicarios@gmail.com', 'Calle de la Luz 123, Colonia Lomas, CDMX', 'RIGV940805MDFNSC05', 'RIGV940805RDFNSC05', '34509812355'),


		-- SUCURSAL SUR
          
			-- COCINEROS (34 - 38)
('Luis', 'Hernández', 'Pérez', 'hombre', '1985-04-17', '5587654321', 'luishernandez@gmail.com', 'Calle Veracruz 234, Colonia Del Valle, CDMX', 'HEPL850417HDFNRD21', 'HEPL850417RD21', '09876543219'),
('Isabel', 'Torres', 'Santos', 'mujer', '1993-12-23', '5523456789', 'isabeltorres@gmail.com', 'Calle Hidalgo 345, Colonia Juárez, CDMX', 'TOSI931223MDFNRD22', 'TOSI931223RD22', '90123456789'),
('Mauricio', 'Reyes', 'Cervantes', 'hombre', '1982-06-30', '5512340987', 'mauricioreyes@gmail.com', 'Calle Insurgentes 456, Colonia Centro, CDMX', 'RECM820630HDFNRD23', 'RECM820630RD23', '65409812340'),
('Carla', 'García', 'Ortega', 'mujer', '1991-01-09', '5556781234', 'carlagarcia@gmail.com', 'Calle Reforma 700, Colonia Del Valle, CDMX', 'GOCA910109MDFNRD24', 'GOCA910109RD24', '78901234590'),
('Ernesto', 'Méndez', 'Soto', 'hombre', '1987-08-16', '5521098765', 'ernestomendez@gmail.com', 'Calle Morelos 987, Colonia Roma, CDMX', 'MESO870816HDFNRD25', 'MESO870109RD24', '23476756341'),

			-- CAJEROS (39 - 43)
('Patricia', 'Salazar', 'González', 'mujer', '1989-03-11', '5543216789', 'patriciasalazar@gmail.com', 'Calle Juárez 222, Colonia Del Valle, CDMX', 'SAGP890311MDFNRD26', 'SAGP890311RD26', '54321678901'),
('Fernando', 'Martínez', 'Valdez', 'hombre', '1992-12-01', '5512346789', 'fernandomartinez@gmail.com', 'Calle Morelos 555, Colonia Roma, CDMX', 'MAVF921201HDFNRD27', 'MAVF921201RD27', '43210987654'),
('Verónica', 'Pérez', 'Cano', 'mujer', '1985-07-15', '5598765432', 'veronicaperez@gmail.com', 'Calle Hidalgo 789, Colonia Centro, CDMX', 'PECV850715MDFNRD28', 'PECV850715RD28', '67890123456'),
('Jorge', 'Cruz', 'Méndez', 'hombre', '1980-05-20', '5556784321', 'jorge.cruz@gmailcom', 'Calle Reforma 101, Colonia Juárez, CDMX', 'CRUJ800520HDFNRD29', 'CRUJ800520RD29', '12345678901'),
('Gabriela', 'Salinas', 'Ramírez', 'mujer', '1994-09-30', '5521098765', 'gabrielasalinas@gmail.com', 'Calle Insurgentes 333, Colonia Del Valle, CDMX', 'SARG940930MDFNRD30', 'SARG940930RD30', '98765432101'), 

			-- REPARTIDORES (44 - 48)
('Ángel', 'Castillo', 'Núñez', 'hombre', '1991-01-09', '5589012345', 'angelcastillo@gmail.com', 'Calle de las Flores 789, Colonia Chapultepec, CDMX', 'CANM910109MDFNLZ09', 'CANM910109RDFNLZ09', '34509812356'),
('Carolina', 'López', 'Vázquez', 'mujer', '1984-07-21', '5554321098', 'carolinalopez@gmail.com', 'Calle de la Amistad 234, Colonia Narvarte, CDMX', 'LOPC840721MDFLZR06', 'LOPC840721RDFLZR06', '34509812357'),
('Diego', 'Torres', 'Pérez', 'hombre', '1992-10-17', '5532109876', 'diegotorres@gmail.com', 'Calle de los Abetos 456, Colonia Guadalupe, CDMX', 'TOPD921017MDFRNC02', 'TOPD921017RDFRNC02', '34509812358'),
('Gabriela', 'Mendoza', 'González', 'mujer', '1989-05-14', '5543210987', 'gabrielamendoza@gmail.com', 'Avenida de los Olivos 123, Colonia San Ángel, CDMX', 'MEGJ890514MDFMNR08', 'MEGJ890514RDFMNR08', '34509812359'),
('Hugo', 'Salazar', 'Fernández', 'hombre', '1990-03-25', '5598765432', 'hugosalazar@gmail.com', 'Calle de la Independencia 321, Colonia Escandon, CDMX', 'SAFH900325MDFNRD10', 'SAFH900325RDFNRD10', '34509812360'),

	-- CLIENTES
    
		-- (49 - 66)
('Carlos', 'Pérez', 'García', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Ana', 'López', 'Sánchez', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Juan', 'Ramírez', 'Martínez', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Lucía', 'Hernández', 'Ortiz', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Miguel', 'González', 'Vega', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Sofía', 'Castro', 'Méndez', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Ricardo', 'Moreno', 'Delgado', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Gabriela', 'Ramos', 'Pineda', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Jorge', 'Serrano', 'Álvarez', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('María', 'Reyes', 'Jiménez', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Pablo', 'Flores', 'López', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Isabel', 'Ortega', 'Rangel', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Héctor', 'Torres', 'Zavala', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Natalia', 'Suárez', 'Medina', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Manuel', 'Lara', 'Navarro', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Andrea', 'Villalobos', 'Cruz', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Daniel', 'García', 'Ibarra', 'hombre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Laura', 'Hernández', 'Domínguez', 'mujer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),

		-- (67 - 78)
('David', 'Ruiz', 'Ortiz', 'hombre', NULL, '5545678901', 'davidruiz@gmail.com', 'Avenida Chapultepec 200, Colonia Condesa, CDMX', NULL, NULL, NULL),
('Paola', 'Ramírez', 'Espinoza', 'mujer', NULL, '5556789012', NULL, 'Calle Independencia 85, Colonia Del Valle, CDMX', NULL, NULL, NULL),
('Roberto', 'Cruz', 'Valdez', 'hombre', NULL, '5567890123', 'robertocruz@gmail.com', 'Calle Morelos 33, Colonia Tacubaya, CDMX', NULL, NULL, NULL),
('Claudia', 'Morales', 'Fernández', 'mujer', NULL, '5578901234', NULL, 'Calle 5 de Febrero 10, Colonia Santa María, CDMX', NULL, NULL, NULL),
('Enrique', 'López', 'Campos', 'hombre', NULL, '5589012345', 'enriquelopez@gmail.com', 'Avenida Álvaro Obregón 77, Colonia Lomas, CDMX', NULL, NULL, NULL),
('Silvia', 'Castillo', 'Salinas', 'mujer', NULL, '5590123456', NULL, 'Calle Juan Escutia 44, Colonia Narvarte, CDMX', NULL, NULL, NULL),
('Alejandro', 'Medina', 'Sosa', 'hombre', NULL, '5501234567', 'alejandromedina@gmail.com', 'Calle Bolívar 23, Colonia Roma, CDMX', NULL, NULL, NULL),
('Fernanda', 'Mora', 'Beltrán', 'mujer', NULL, '5512345678', 'fernandamora@gmail.com', 'Avenida Universidad 500, Colonia Xochimilco, CDMX', NULL, NULL, NULL),
('Luis', 'Díaz', 'Gómez', 'hombre', NULL, '5543210987', 'luisdiaz@gmail.com', 'Calle La Paz 101, Colonia Mixcoac, CDMX', NULL, NULL, NULL),
('Patricia', 'Cabrera', 'Núñez', 'mujer', NULL, '5532109876', NULL, 'Calle Paseo de la Reforma 25, Colonia Polanco, CDMX', NULL, NULL, NULL),
('Eduardo', 'Pineda', 'Vargas', 'hombre', NULL, '5521098765', 'eduardopineda@gmail.com', 'Calle Victoria 28, Colonia Roma, CDMX', NULL, NULL, NULL),
('Karla', 'Santos', 'Martínez', 'mujer', NULL, '5512345670', 'karlasantos@gmail.com', 'Calle Pino Suárez 88, Colonia Vallejo, CDMX', NULL, NULL, NULL),

		-- AJUSTADORES
        
        -- AXA (79 - 80)
('Carlos', 'García', 'López', 'hombre', NULL, '5512345678', NULL, NULL, NULL, 'GALO920101HDFNRL05', NULL),
('María', 'Hernández', 'Sánchez', 'mujer', NULL, '5523456789', NULL, NULL, NULL, 'HASM850321MDFNRB09', NULL),

        -- GNP (81 - 82)
('Luis', 'Martínez', 'Pérez', 'hombre', NULL, '5534567890', NULL, NULL, NULL, 'MAPL781025HDFNRR01', NULL),
('Ana', 'Rodríguez', 'Flores', 'mujer', NULL, '5545678901', NULL, NULL, NULL, 'ROFA900812MDFNRN06', NULL),

        -- Qualitas (83 - 84)
('Jorge', 'Gómez', 'Ruiz', 'hombre', NULL, '5556789012', NULL, NULL, NULL, 'GORJ860502HDFNRZ03', NULL),
('Laura', 'Díaz', 'Núñez', 'mujer', NULL, '5567890123', NULL, NULL, NULL, 'DINL950411MDFNRB02', NULL);


-- GERENTE

INSERT INTO GERENTE (fkPersona, fkSucursal, horaEntrada, horaSalida, estado, sueldo, fechaContratacion) VALUES
(1, 1, '12:00:00', '22:00:00', 'activo', '30000', '2017-06-24'),
(2, 2, '12:00:00', '22:00:00', 'vacaciones', '33000', '2015-01-28'),
(3, 3, '12:00:00', '22:00:00', 'activo', '28000', '2021-04-17');


-- EMPLEADO

INSERT INTO EMPLEADO (fkPersona, fkGerente, fkSucursal, horaEntrada, horaSalida, estado, sueldo, fechaContratacion, puesto) VALUES

-- SUCURSAL CENTRO

	-- COCINEROS (1 - 5)
(4,1,1, '08:00', '15:00', 'activo', 16000, '2021-01-15', 'cocinero'),
(5,1,1, '08:00', '15:00', 'activo', 16000, '2021-02-20', 'cocinero'),
(6,1,1, '15:00', '22:00', 'activo', 16000, '2022-03-10', 'cocinero'),
(7,1,1, '15:00', '22:00', 'activo', 16000, '2022-04-05', 'cocinero'),
(8,1,1, '15:00', '22:00', 'activo', 16000, '2023-05-25', 'cocinero'),
	-- CAJEROS (6- 10)
(9,1,1, '08:00', '15:00', 'activo', 14000, '2021-01-17', 'cajero'),
(10,1,1, '08:00', '15:00', 'activo', 14000, '2021-02-15', 'cajero'),
(11,1,1, '15:00', '22:00', 'activo', 14000, '2022-03-12', 'cajero'),
(12,1,1, '15:00', '22:00', 'activo', 14000, '2022-04-10', 'cajero'),
(13,1,1, '15:00', '22:00', 'activo', 14000, '2023-05-30', 'cajero'),
	-- REPARTIDORES (11 - 15)
(14,1,1, '08:00', '15:00', 'activo', 12000, '2021-01-12', 'repartidor'),
(15,1,1, '08:00', '15:00', 'activo', 12000, '2021-02-18', 'repartidor'),
(16,1,1, '15:00', '22:00', 'activo', 12000, '2022-03-15', 'repartidor'),
(17,1,1, '15:00', '22:00', 'activo', 12000, '2022-04-07', 'repartidor'),
(18,1,1, '15:00', '22:00', 'activo', 12000, '2023-05-22', 'repartidor'),

-- SUCURSAL NORTE

	-- COCINEROS (16 - 20)
(19,2,2, '08:00', '15:00', 'activo', 16000, '2022-06-01', 'cocinero'),
(20,2,2, '08:00', '15:00', 'activo', 16000, '2022-07-15', 'cocinero'),
(21,2,2, '15:00', '22:00', 'activo', 16000, '2023-08-20', 'cocinero'),
(22,2,2, '15:00', '22:00', 'activo', 16000, '2023-09-10', 'cocinero'),
(23,2,2, '15:00', '22:00', 'activo', 16000, '2024-10-05', 'cocinero'),
	-- CAJEROS (21 - 25)
(24,2,2, '08:00', '15:00', 'activo', 14000, '2022-06-17', 'cajero'),
(25,2,2, '08:00', '15:00', 'activo', 14000, '2022-07-20', 'cajero'),
(26,2,2, '15:00', '22:00', 'activo', 14000, '2023-08-12', 'cajero'),
(27,2,2, '15:00', '22:00', 'activo', 14000, '2023-09-18', 'cajero'),
(28,2,2, '15:00', '22:00', 'activo', 14000, '2024-10-22', 'cajero'),
	-- REPARTIDORES (26 - 30)
(29,2,2, '08:00', '15:00', 'activo', 12000, '2022-06-25', 'repartidor'),
(30,2,2, '08:00', '15:00', 'activo', 12000, '2022-07-30', 'repartidor'),
(31,2,2, '15:00', '22:00', 'activo', 12000, '2023-08-15', 'repartidor'),
(32,2,2, '15:00', '22:00', 'activo', 12000, '2023-09-30', 'repartidor'),
(33,2,2, '15:00', '22:00', 'activo', 12000, '2024-10-05', 'repartidor'),

-- SUCURSAL SUR

	-- COCINEROS (31 - 35)
(34,3,3, '08:00', '15:00', 'activo', 16000, '2022-11-01', 'cocinero'),
(35,3,3, '08:00', '15:00', 'activo', 16000, '2022-12-15', 'cocinero'),
(36,3,3, '15:00', '22:00', 'activo', 16000, '2023-11-20', 'cocinero'),
(37,3,3, '15:00', '22:00', 'activo', 16000, '2023-12-05', 'cocinero'),
(38,3,3, '15:00', '22:00', 'activo', 16000, '2024-11-30', 'cocinero'),
	-- CAJEROS (36 - 40)
(39,3,3, '08:00', '15:00', 'activo', 14000, '2022-11-12', 'cajero'),
(40,3,3, '08:00', '15:00', 'activo', 14000, '2022-12-01', 'cajero'),
(41,3,3, '15:00', '22:00', 'activo', 14000, '2023-11-22', 'cajero'),
(42,3,3, '15:00', '22:00', 'activo', 14000, '2023-12-10', 'cajero'),
(43,3,3, '15:00', '22:00', 'activo', 14000, '2024-11-25', 'cajero'),
	-- REPARTIDORES (41 - 45)
(44,3,3, '08:00', '15:00', 'activo', 12000, '2022-11-20', 'repartidor'),
(45,3,3, '08:00', '15:00', 'activo', 12000, '2022-12-12', 'repartidor'),
(46,3,3, '15:00', '22:00', 'activo', 12000, '2023-11-05', 'repartidor'),
(47,3,3, '15:00', '22:00', 'activo', 12000, '2023-12-01', 'repartidor'),
(48,3,3, '15:00', '22:00', 'activo', 12000, '2024-11-22', 'repartidor');



-- CLIENTE	

INSERT INTO CLIENTE (fkPersona) VALUES

	-- TIENDA (1 - 18) 
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),

	-- DOMICILIO (19 - 30)
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(76),
(77),
(78);


-- AJUSTADOR

INSERT INTO AJUSTADOR (fkPersona, fkAseguradora) VALUES

	-- AXA
(79, 1),
(80, 1),

	-- GNP
(81, 2),
(82, 2),

	-- QUALITAS
(83, 3),
(84, 3);


-- SUCURSAL CENTRO

INSERT INTO COCINERO (fkEmpleado) VALUES

(1),
(2),
(3),
(4),
(5);

INSERT INTO CAJERO (fkEmpleado) VALUES

(6),
(7),
(8),
(9),
(10);

INSERT INTO REPARTIDOR (fkEmpleado, numeroLicencia, vigenciaLicencia) VALUES

(11, '12345678901', '2027-05-14'),
(12, '23456789012', '2028-07-22'),
(13, '34567890123', '2026-11-03'),
(14, '45678901234', '2029-01-19'),
(15, '56789012345', '2026-08-09');


-- SUCURSAL NORTE

INSERT INTO COCINERO (fkEmpleado) VALUES

(16),
(17),
(18),
(19),
(20);

INSERT INTO CAJERO (fkEmpleado) VALUES

(21),
(22),
(23),
(24),
(25);

INSERT INTO REPARTIDOR (fkEmpleado, numeroLicencia, vigenciaLicencia) VALUES

(26, '67890123456', '2029-10-13'),
(27, '78901234567', '2027-02-28'),
(28, '89012345678', '2030-04-16'),
(29, '90123456789', '2028-12-05'),
(30, '01234567890', '2029-06-20');


-- SUCURSAL SUR

INSERT INTO COCINERO (fkEmpleado) VALUES

(31),
(32),
(33),
(34),
(35);

INSERT INTO CAJERO (fkEmpleado) VALUES

(36),
(37),
(38),
(39),
(40);

INSERT INTO REPARTIDOR (fkEmpleado, numeroLicencia, vigenciaLicencia) VALUES

(41, '12309845678', '2028-09-12'),
(42, '23410956789', '2026-03-27'),
(43, '34521067890', '2030-08-01'),
(44, '45632178901', '2027-12-30'),
(45, '56743289012', '2029-05-08');


-- MOTOCICLETA

INSERT INTO MOTOCICLETA (fkAseguradora, fkSucursal, modelo, placa, numeroDePoliza, seguroActivo, fechaInicioSeguro, vencimientoSeguro, rentaSeguro, kilometraje) VALUES 

    -- SUCURSAL CENTRO (3 - 7)
(1, 1, 'Yamaha XTZ', '132-COA', "MOTO-2024-001234", 1, '2024-02-08', '2025-02-08', 950, 4500.25),
(1, 1, 'Suzuki DR650', '498-YCX', "MOTO-2024-002345", 1, '2024-07-22', '2025-07-22', 1100, 3000.75),
(2, 1, 'Suzuki DR650', '753-AHY', "MOTO-2024-003456", 1, '2024-03-24', '2025-03-24', 850, 3800.50),
(3, 1, 'BMW G310GS', '841-PMW', "MOTO-2024-004567", 1, '2024-10-12', '2025-10-12', 1800, 2100.20),
(3, 1, 'BMW G310GS', '630-SFW', "MOTO-2024-005678", 1, '2024-08-06', '2025-08-06', 1650, 2500.60),

    -- SUCURSAL NORTE (8 - 12)
(1, 2, 'Honda CB500X', '821-HZF', "MOTO-2024-006789", 1, '2024-02-12', '2025-02-12', 1500, 3200.85),
(1, 2, 'Yamaha XTZ', '614-ZNB', "MOTO-2024-007890", 1, '2024-05-10', '2025-05-10', 780, 2500.40),
(2, 2, 'BMW G310GS', '482-KBP', "MOTO-2024-008901", 1, '2024-01-29', '2025-01-29', 1700, 4000.90),
(2, 2, 'Kawasaki KLR650', '894-RFK', "MOTO-2024-009012", 1, '2024-05-31', '2025-05-31', 950, 3500.30),
(3, 2, 'Suzuki DR650', '652-ZCT', "MOTO-2024-010123", 1, '2024-10-06', '2025-10-06', 1200, 2600.55),

    -- SUCURSAL SUR (13 - 17)
(1, 3, 'Suzuki DR650', '399-MOD', "MOTO-2024-011234", 1, '2024-07-02', '2025-07-02', 920, 2800.15),
(2, 3, 'Honda CB500X', '267-EPE', "MOTO-2024-012345", 1, '2024-09-29', '2025-09-29', 1450, 3300.25),
(2, 3, 'Kawasaki KLR650', '716-FFZ', "MOTO-2024-013456", 1, '2024-05-07', '2025-05-07', 1250, 3400.90),
(3, 3, 'Kawasaki KLR650', '323-TRH', "MOTO-2024-014567", 1, '2024-05-12', '2025-05-12', 1350, 3600.50),
(3, 3, 'Suzuki DR650', '794-EAU', "MOTO-2024-015678", 1, '2024-02-12', '2025-02-12', 890, 3000.80);


-- PIZZA 

INSERT INTO PIZZA (nombre, descripcion, tamaño, precio) VALUES

	-- PIZZA MARGARITA (1 - 3)
('Margarita', 'Pizza clásica con salsa de tomate, mozzarella y albahaca.','personal', 194.77), -- PERSONAL
('Margarita', 'Pizza clásica con salsa de tomate, mozzarella y albahaca.','mediana', 294.77), -- MEDIANA
('Margarita', 'Pizza clásica con salsa de tomate, mozzarella y albahaca.','familiar', 394.77), -- FAMILIAR

	-- PIZZA PEPPERONI (4 - 6)
('Pepperoni', 'Pizza cubierta de pepperoni y queso mozzarella.','personal', 148.94), -- PERSONAL
('Pepperoni', 'Pizza cubierta de pepperoni y queso mozzarella.','mediana', 248.94), -- MEDIANA
('Pepperoni', 'Pizza cubierta de pepperoni y queso mozzarella.','familiar', 348.94), -- FAMILIAR

	-- PIZZA HAWAIANA (7 - 9)
('Hawaiana', 'Pizza con piña, jamón y queso mozzarella.','personal', 105.02), -- PERSONAL
('Hawaiana', 'Pizza con piña, jamón y queso mozzarella.','mediana', 205.02), -- MEDIANA
('Hawaiana', 'Pizza con piña, jamón y queso mozzarella.','familiar', 305.02), -- FAMILIAR

	-- PIZZA CUATRO QUESOS (10 - 12)
('Cuatro Quesos', 'Pizza con una mezcla de mozzarella, gorgonzola, parmesano y queso de cabra.','personal', 141.99), -- PERSONAL
('Cuatro Quesos', 'Pizza con una mezcla de mozzarella, gorgonzola, parmesano y queso de cabra.','mediana', 241.99), -- MEDIANA
('Cuatro Quesos', 'Pizza con una mezcla de mozzarella, gorgonzola, parmesano y queso de cabra.','familiar', 341.99), -- FAMILIAR

	-- PIZZA VEGETARIANA (11 - 15)
('Vegetariana', 'Pizza con champiñones, pimientos, cebolla, aceitunas y queso.','personal', 147.99), -- PERSONAL
('Vegetariana', 'Pizza con champiñones, pimientos, cebolla, aceitunas y queso.','mediana', 247.99), -- MEDIANA
('Vegetariana', 'Pizza con champiñones, pimientos, cebolla, aceitunas y queso.','familiar', 347.99), -- FAMILIAR

	-- PIZZA BBQ POLLO (16 - 18)
('BBQ Pollo', 'Pizza con pollo a la barbacoa, cebolla y queso mozzarella.','personal', 188.99), -- PERSONAL
('BBQ Pollo', 'Pizza con pollo a la barbacoa, cebolla y queso mozzarella.','mediana', 288.99), -- MEDIANA
('BBQ Pollo', 'Pizza con pollo a la barbacoa, cebolla y queso mozzarella.','familiar', 388.99), -- FAMILIAR

	-- PIZZA MEXICANA (19 - 21)
('Mexicana', 'Pizza con chorizo, jalapeños, frijoles y queso cheddar.','personal', 129.99), -- PERSONAL
('Mexicana', 'Pizza con chorizo, jalapeños, frijoles y queso cheddar.','mediana', 229.99), -- MEDIANA
('Mexicana', 'Pizza con chorizo, jalapeños, frijoles y queso cheddar.','familiar', 329.99), -- FAMILIAR

	-- PIZZA CAPRESE (22 - 24)
('Caprese', 'Pizza con mozzarella fresca, tomate, albahaca y reducción de balsámico.','personal', 155.99), -- PERSONAL
('Caprese', 'Pizza con mozzarella fresca, tomate, albahaca y reducción de balsámico.','mediana', 255.99), -- MEDIANA
('Caprese', 'Pizza con mozzarella fresca, tomate, albahaca y reducción de balsámico.','familiar', 355.99), -- FAMILIAR

	-- PIZZA CARBONARA (25 - 27)
('Carbonara', 'Pizza con salsa carbonara, panceta y queso parmesano.','personal', 170.99), -- PERSONAL
('Carbonara', 'Pizza con salsa carbonara, panceta y queso parmesano.','mediana', 270.99), -- MEDIANA
('Carbonara', 'Pizza con salsa carbonara, panceta y queso parmesano.','familiar', 370.99), -- FAMILIAR

	-- PIZZA DIAVOLA (28 - 30)
('Diavola', 'Pizza con salami picante, jalapeños y queso mozzarella.','personal', 143.99), -- PERSONAL
('Diavola', 'Pizza con salami picante, jalapeños y queso mozzarella.','mediana', 243.99), -- MEDIANA
('Diavola', 'Pizza con salami picante, jalapeños y queso mozzarella.','familiar', 343.99); -- FAMILIAR


-- COMPLEMENTO

INSERT INTO COMPLEMENTO (nombre, descripcion, precio) VALUES

('Orilla Rellena de Queso', 'Orilla de pizza rellena con queso derretido.', 55.00),
('Cheesy Bread', 'Pan de ajo con queso derretido por encima.', 45.50),
('Canela Baitz', 'Postre de canela en forma de bites.', 30.75),
('Brownie Cookie', 'Galleta de brownie suave con chispas de chocolate.', 60.25),
('Papas Gajo', 'Porción de papas gajo crujientes.', 40.00),
('Papas a la Francesa','Papas fritas en aceite y sazonadas', 30.00),
('Salsa Gravy','Salsa hecha con carnes y verduras', 20.00),
('Pure de papa','Pure de papa sazonado', 35.00),
('Ensalada','Ensalada de verduras con mayonesa', 30.00),
('Bisquets','Panes de textura suave y esponjosa', 20.00),
('Pastel de chocolate','Pastel sabor chocolate', 35.00)
;


-- INGREDIENTE_EXTRA 

INSERT INTO INGREDIENTE_EXTRA (nombre, precio) VALUES

('Queso Cheddar', 20.00),
('Queso Azul', 20.00),
('Piña', 15.00),
('Pimientos Verdes', 12.00),
('Bacon Crujiente', 25.00),
('Pollo a la Parrilla', 22.00),
('Salsa Barbacoa', 12.00),
('Pesto', 18.00),
('Salsa de Mango', 12.00),
('Tomates Cherry', 15.00);


-- PROMOCION 

INSERT PROMOCION (nombrePromocion, descripcion, estado) VALUES

('¡El Día de la Pizza!', 'Todas las pizzas al 2x1', 1),
('Martes de Pizza', 'Todos los martes, todas las pizzas a un precio especial del 20% de descuento', 1);

-- SUCURSAL_HAS_PROMOCION

INSERT SUCURSAL_has_PROMOCION (fkSucursal, fkPromocion) VALUES

-- SUCURSAL CENTRO
(1,1),
(1,2),

-- SUCURSAL NORTE
(2,1),
(2,2),

-- SUCURSAL SUR
(3,1),
(3,2);


-- ORDEN

INSERT INTO ORDEN (fkSucursal, fkCliente, fechaOrden, horaOrden, tipoOrden, estado, montoFinal, fkPromocion) VALUES

-- SUCURSAL CENTRO (1 - 10)
(1, 1, '2024-08-07', '11:16:21', 'tienda', 'finalizado', 557.52, 1),
(1, 2, '2023-07-15', '13:32:35', 'tienda', 'finalizado', 205.02, NULL),
(1, 3, '2024-05-27', '15:07:20', 'tienda', 'finalizado', 264.784, 2),
(1, 4, '2024-09-11', '14:29:23', 'tienda', 'finalizado', 275.99, NULL),
(1, 5, '2024-11-18', '10:58:30', 'tienda', 'cancelado', 416.49, NULL),
(1, 6, '2024-11-14', '10:04:59', 'tienda', 'cancelado', 194.77, NULL),

(1, 19, '2023-12-17', '10:52:10', 'domicilio', 'finalizado', 536.79, 1),
(1, 20, '2024-10-29', '15:48:42', 'domicilio', 'cancelado', 345.24, NULL),
(1, 21, '2023-09-16', '16:08:02', 'domicilio', 'finalizado', 290.392, 2),
(1, 22, '2024-04-27', '18:16:19', 'domicilio', 'finalizado', 183.99, NULL),

-- SUCURSAL NORTE (11 - 20)
(2, 7, '2023-12-13', '10:57:26', 'tienda', 'finalizado', 199.152, 2),
(2, 8, '2024-03-04', '10:35:17', 'tienda', 'finalizado', 632.51, NULL),
(2, 9, '2024-07-12', '20:19:38', 'tienda', 'finalizado', 288.99, NULL),
(2, 10, '2023-06-20', '15:48:13', 'tienda', 'finalizado', 611.47, NULL),
(2, 11, '2023-08-09', '19:48:19', 'tienda', 'finalizado', 384.592, 2),
(2, 12, '2023-05-10', '20:35:14', 'tienda', 'cancelado', 433.99, 1),

(2, 23, '2024-02-10', '19:58:26', 'domicilio', 'cancelado', 129.99, NULL),
(2, 24, '2023-05-26', '12:40:35', 'domicilio', 'finalizado', 355.99, NULL),
(2, 25, '2023-03-12', '19:45:10', 'domicilio', 'finalizado', 343.99, 1),
(2, 26, '2024-05-17', '17:34:50', 'domicilio', 'finalizado', 343.99, NULL),

-- SUCURSAL SUR (21 - 30)
(3, 13, '2023-08-10', '21:46:29', 'tienda', 'finalizado', 242.542, 2),
(3, 14, '2024-04-10', '16:03:49', 'tienda', 'finalizado', 188.99, NULL),
(3, 15, '2023-02-14', '19:57:14', 'tienda', 'finalizado', 781.484, 2),
(3, 16, '2024-06-23', '14:55:43', 'tienda', 'finalizado', 394.77, NULL),
(3, 17, '2023-01-19', '17:59:09', 'tienda', 'finalizado', 388.99, NULL),
(3, 18, '2024-08-01', '10:04:17', 'tienda', 'cancelado', 442.76, 1),

(3, 27, '2023-05-16', '22:01:30', 'domicilio', 'cancelado', 433.24, NULL),
(3, 28, '2023-08-01', '13:37:57', 'domicilio', 'finalizado', 370.99, NULL),
(3, 29, '2023-06-13', '18:33:02', 'domicilio', 'finalizado', 357.384, 2),
(3, 30, '2023-05-28', '21:12:04', 'domicilio', 'finalizado', 394.69, NULL);


-- PIZZA_HAS_ORDEN 

INSERT INTO ORDEN_has_PIZZA (fkOrden, fkPizza) VALUES 

-- SUCURSAL CENTRO (1 - 10)
(1,3),(1,6),
(2,8),
(3,10),(7,16),
(4,23),
(5,27),
(6,1),
(7,2),(7,5),(7,8),
(8,20),
(9,15),
(10,28),

-- SUCURSAL NORTE (11 - 20)
(11,5),
(12,9),(12,11),
(13,17),
(14,19),(14,14),(14,22),
(15,12),
(16,11),(16,18),
(17,19),
(18,24),
(19,26),(19,29),
(20,30),

-- SUCURSAL SUR (21 - 30)
(21, 25),
(22,16),
(23,1),(23,9),(23,5),
(24,3),
(25,18),
(26,13),(26,7),(26,2),
(27,15),
(28,27),
(29,14),(29,19),
(30,6);

-- COMPLEMENTO_HAS_ORDEN

INSERT INTO ORDEN_has_COMPLEMENTO (fkOrden,fkComplemento) VALUES 

-- SUCURSAL CENTRO (1 - 4)
(1,1),(1,3),(1,5),(1,9),
(5,2),(5,9),
(8,4),(8,1),
(10,5),(10,9),

-- SUCURSAL NORTE (5 - 8)
(14,2),
(15,3),(15,4),
(19,1),
(12,2),(12,5),

-- SUCURSAL SUR (9 - 12)
(21,4),(21,2),
(23,1),(23,2),(23,5),
(27,4),
(30,3);

-- INGREDIENTEEXTRA_HAS_ORDEN

INSERT INTO ORDEN_has_INGREDIENTE_EXTRA (fkOrden,fkIngredienteExtra) VALUES 

-- SUCURSAL CENTRO (1 - 4)
(1,6),(1,3),
(4,2),
(7,4),(7,5),
(9,9),

-- SUCURSAL NORTE (5 - 8)
(15,1),
(14,10),(14,7),
(19,8),
(16,1),(16,5),

-- SUCURSAL SUR (9 - 12)
(29,10),(29,2),
(23,2),(23,6),
(27,5),
(30,3);

-- ORDEN_HAS_CAJERO

INSERT INTO ORDEN_has_CAJERO (fkOrden, fkCajero) VALUES 

-- SUCURSAL CENTRO (1 - 10)
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,2),
(8,3),
(9,4),
(10,5),

-- SUCURSAL NORTE (11 - 20)
(11,6),
(12,7),
(13,8),
(14,9),
(15,10),
(16,6),
(17,7),
(18,8),
(19,9),
(20,10),

-- SUCURSAL SUR (21 - 30)
(21,11),
(22,12),
(23,13),
(24,14),
(25,15),
(26,11),
(27,12),
(28,13),
(29,14),
(30,15);


-- ORDEN_HAS_COCINERO

INSERT INTO ORDEN_has_COCINERO (fkOrden, fkCocinero, rol) VALUES

-- SUCURSAL CENTRO (1 - 10)
(1,1,'preparo'),(1,2,'calento'),
(2,3,'preparo'),(2,4,'calento'),
(3,2,'preparo'),(3,1,'calento'),
(4,5,'preparo'),(4,3,'calento'),
(5,3,'preparo'),(5,4,'calento'),
(7,3,'preparo'),(7,5,'calento'),
(8,2,'preparo'),(8,5,'calento'),
(9,4,'preparo'),(9,5,'calento'),
(10,1,'preparo'),(10,5,'calento'),

-- SUCURSAL NORTE (11 - 20)
(11,6,'preparo'),(11,7,'calento'),
(12,10,'preparo'),(12,9,'calento'),
(13,6,'preparo'),(13,7,'calento'),
(14,8,'preparo'),(14,6,'calento'),
(15,7,'preparo'),(15,6,'calento'),
(18,8,'preparo'),(18,10,'calento'),
(19,7,'preparo'),(19,6,'calento'),
(20,9,'preparo'),(20,6,'calento'),

-- SUCURSAL SUR (21 - 30)
(21,11,'preparo'),(21,12,'calento'),
(22,14,'preparo'),(22,15,'calento'),
(23,12,'preparo'),(23,13,'calento'),
(24,15,'preparo'),(24,11,'calento'),
(25,13,'preparo'),(25,14,'calento'),
(28,14,'preparo'),(28,13,'calento'),
(29,11,'preparo'),(29,15,'calento'),
(30,13,'preparo'),(30,12,'calento');


-- ENTREGA_EN_TIENDA

INSERT INTO ENTREGA_EN_TIENDA (fkOrden,`fkCocinero(entrego)`) VALUES 

-- SUCURSAL CENTRO (1 - 6)
(1,3),
(2,5),
(3,4),
(4,1),
(5,1),

-- SUCURSAL NORTE (7 - 12)
(11,8),
(12,7),
(13,10),
(14,9),
(15,8),

-- SUCURSAL SUR (13 - 18)
(21,13),
(22,11),
(23,14),
(24,15),
(25,12);


-- TRIGGER DE ACTUALIZACION DE KILOMETRAJE

DELIMITER $$

CREATE TRIGGER actualizar_kilometraje
AFTER INSERT ON ENTREGA_A_DOMICILIO
FOR EACH ROW
BEGIN
  
    UPDATE MOTOCICLETA
    SET kilometraje = kilometraje + COALESCE(NEW.kilometrosRecorridos, 0)
    WHERE idMotocicleta = NEW.fkMotocicleta;
END $$

DELIMITER ;


-- TRIGGER PARA ACTUALIZACION DE ACCIDENTES 

DELIMITER $$

CREATE TRIGGER after_insert_aviso_de_siniestro
AFTER INSERT ON aviso_de_siniestro
FOR EACH ROW
BEGIN
    UPDATE repartidor R
    SET R.conAccidentes = 'si'
    WHERE R.idRepartidor = (
        SELECT E.fkRepartidor
        FROM entrega_a_domicilio E
        WHERE E.idEntregaADomicilio = NEW.fkEntregaADomicilio
    )
    AND (
        SELECT COUNT(*)
        FROM aviso_de_siniestro A
        JOIN entrega_a_domicilio E ON A.fkEntregaADomicilio = E.idEntregaADomicilio
        WHERE E.fkRepartidor = R.idRepartidor
    ) > 3;
END$$

DELIMITER ;


-- ENTREGA A DOMICILIO

INSERT INTO ENTREGA_A_DOMICILIO (fkOrden, fkRepartidor, fkMotocicleta, estadoEntrega, horaDeEntrega, kilometrosRecorridos) VALUES 

-- SUCURSAL CENTRO (1 - 4)
(7, 1, 3, 'entregado', '11:45:30', 12.50),
(8, 2, 4, 'entregado', '13:20:15', 16.20),
(9, 3, 5, 'entregado', '15:35:10', 8.75),
(10, 4, 6, 'accidente', NULL, NULL),

-- SUCURSAL NORTE (5 - 7)
(18, 7, 9, 'entregado', '14:22:00', 14.10),
(19, 8, 10, 'entregado', '16:40:45', 19.30),
(20, 9, 11, 'accidente', NULL, NULL),

-- SUCURSAL SUR (8 - 10)
(28, 12, 14, 'entregado', '15:05:40', 17.50),
(29, 13, 15, 'entregado', '18:15:30', 9.40),
(30, 14, 16, 'accidente', NULL, NULL);


-- AVISO_DE_SINIESTRO

INSERT INTO AVISO_DE_SINIESTRO (fkEntregaADomicilio, fkAjustador, nombreRepartidor, apellidoPaternoRepartidor, apellidoMaternoRepartidor, placaMotocicleta, nombreAseguradora, numeroDePoliza, fechaAccidente, horaAccidente, descripcion, dictamen) VALUES

(4,6, "Sofía", "García","Mendoza", "841-PMW", "Qualitas", "MOTO-2024-004567",'2024-04-27', '18:46:00','El repartidor fue chocado por un auto que no se detuvo en un semáforo, causando una caída.', 'El repartidor NO fue responsable del incidente'),
(7,3, "Javier", "Morales","Cruz", "894-RFK", "GNP", "MOTO-2024-009012", '2024-05-17', '17:57:00', 'Un repartidor perdió el control en una curva mojada y se cayó, dañando su motocicleta.', 'El repartidor NO fue responsable del incidente'),
(10,6, "Gabriela", "Mendoza","González", "323-TRH", "Qualitas", " MOTO-2024-014567", '2023-05-28', '21:46:00', 'El repartidor iba a exceso de velocidad y perdio el control de la motocicleta en una curva,', 'El repartidor SI fue responsable del incidente');


-- PAGO 

INSERT INTO PAGO (fkOrden,montoTotal,tipoPago) VALUES

	-- PAGOS EN EFECTIVO
    
(1,558,'efectivo'),
(2,205,'efectivo'),
(4,276,'efectivo'),
(5,417,'efectivo'),
(7,537,'efectivo'),
(11,199,'efectivo'),
(14,612,'efectivo'),
(18,356,'efectivo'),
(19,344,'efectivo'),
(21,243,'efectivo'),
(24,395,'efectivo'),
(25,389,'efectivo'),


	-- PAGOS CON TARJETA

(8,345,'tarjeta'),
(9,290,'tarjeta'),
(12,633,'tarjeta'),
(13,289,'tarjeta'),
(15,385,'tarjeta'),
(22,189,'tarjeta'),
(23,782,'tarjeta'),
(29,357,'tarjeta'),

	-- PAGOS HIBRIDOS
(3,265,'hibrido'),
(28,371,'hibrido');


-- PAGOS EN EFECTIVO

INSERT INTO PAGO_EFECTIVO (fkPago,montoPagado) VALUES 

(1,558),
(2,205),
(3,276),
(4,417),
(5,537),
(6,199),
(7,612),
(8,356),
(9,344),
(10,243),
(11,395),
(12,389),

(21,165),
(22,100);


-- PAGOS CON TARJETA

INSERT INTO PAGO_TARJETA (fkPago, montoPagado, numeroMovimiento, ultimos4Digitos, cantidadTarjetas) VALUES 

(13, 225, '6748392', '4310', 2),
(13, 100, '4532118', '7843', 2),

(14, 145, '9801234', '2586', 2),
(14, 145, '3415678', '3694', 2),

(15, 633, '6789021', '8751', 1),
(16, 289, '2135467', '1490', 1),
(17, 385, '7456812', '6012', 1),
(18, 189, '4985739', '3784', 1),
(19, 782, '3021546', '5907', 1),

(20, 107, '8236410', '8840', 2),
(20, 250, '3547891', '7263', 2),

(21, 100, '9182745', '4528', 1),
(22, 271, '1245783', '9163', 1);



