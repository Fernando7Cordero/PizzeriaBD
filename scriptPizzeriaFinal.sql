-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PERSONA` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(45) NOT NULL,
  `apellidoMaterno` VARCHAR(45) NOT NULL,
  `sexo` ENUM('hombre', 'mujer', "otro") NULL,
  `fechaNacimiento` DATE NULL,
  `telefono` VARCHAR(12) NULL,
  `email` VARCHAR(45) NULL,
  `domicilio` TEXT NULL,
  `curp` VARCHAR(20) NULL,
  `rfc` VARCHAR(20) NULL,
  `nss` VARCHAR(20) NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idPersona` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ASEGURADORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ASEGURADORA` (
  `idAseguradora` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `direccion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idAseguradora`),
  UNIQUE INDEX `idAseguradora_UNIQUE` (`idAseguradora` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`AJUSTADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`AJUSTADOR` (
  `idAjustador` INT NOT NULL AUTO_INCREMENT,
  `fkPersona` INT NOT NULL,
  `fkAseguradora` INT NOT NULL,
  PRIMARY KEY (`idAjustador`),
  UNIQUE INDEX `idAjustador_UNIQUE` (`idAjustador` ASC) VISIBLE,
  INDEX `fk_AJUSTADOR_PERSONA1_idx` (`fkPersona` ASC) VISIBLE,
  INDEX `fk_AJUSTADOR_ASEGURADORA1_idx` (`fkAseguradora` ASC) VISIBLE,
  CONSTRAINT `fk_AJUSTADOR_PERSONA1`
    FOREIGN KEY (`fkPersona`)
    REFERENCES `pizzeria`.`PERSONA` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AJUSTADOR_ASEGURADORA1`
    FOREIGN KEY (`fkAseguradora`)
    REFERENCES `pizzeria`.`ASEGURADORA` (`idAseguradora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`SUCURSAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`SUCURSAL` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `nombreSucursal` VARCHAR(45) NOT NULL,
  `direccion` TEXT NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `horaApertura` TIME NULL,
  `horaCierre` TIME NULL,
  PRIMARY KEY (`idSucursal`),
  UNIQUE INDEX `idSucursal_UNIQUE` (`idSucursal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`PROMOCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PROMOCION` (
  `idPromocion` INT NOT NULL AUTO_INCREMENT,
  `nombrePromocion` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`idPromocion`),
  UNIQUE INDEX `idPromocion_UNIQUE` (`idPromocion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`CLIENTE` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `fkPersona` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  INDEX `fk_CLIENTE_PERSONA1_idx` (`fkPersona` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENTE_PERSONA1`
    FOREIGN KEY (`fkPersona`)
    REFERENCES `pizzeria`.`PERSONA` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN` (
  `idOrden` INT NOT NULL AUTO_INCREMENT,
  `fkSucursal` INT NOT NULL,
  `fkCliente` INT NOT NULL,
  `fechaOrden` DATE NOT NULL,
  `horaOrden` TIME NOT NULL,
  `tipoOrden` ENUM('tienda', 'domicilio') NOT NULL,
  `estado` ENUM('finalizado', 'pendiente', 'cancelado') NOT NULL,
  `montoFinal` FLOAT NOT NULL,
  `fkPromocion` INT NULL,
  PRIMARY KEY (`idOrden`),
  UNIQUE INDEX `idOrden_UNIQUE` (`idOrden` ASC) VISIBLE,
  INDEX `fk_ORDEN_SUCURSAL1_idx` (`fkSucursal` ASC) VISIBLE,
  INDEX `fk_ORDEN_PROMOCION1_idx` (`fkPromocion` ASC) VISIBLE,
  INDEX `fk_ORDEN_CLIENTE1_idx` (`fkCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ORDEN_SUCURSAL1`
    FOREIGN KEY (`fkSucursal`)
    REFERENCES `pizzeria`.`SUCURSAL` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDEN_PROMOCION1`
    FOREIGN KEY (`fkPromocion`)
    REFERENCES `pizzeria`.`PROMOCION` (`idPromocion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDEN_CLIENTE1`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `pizzeria`.`CLIENTE` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`GERENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`GERENTE` (
  `idGerente` INT NOT NULL AUTO_INCREMENT,
  `fkPersona` INT NOT NULL,
  `fkSucursal` INT NOT NULL,
  `horaEntrada` TIME NOT NULL,
  `horaSalida` TIME NOT NULL,
  `estado` ENUM('activo', 'destituido', 'vacaciones', 'incapacidad') NOT NULL,
  `sueldo` FLOAT NOT NULL,
  `fechaContratacion` DATE NULL,
  PRIMARY KEY (`idGerente`),
  UNIQUE INDEX `idEmpleado_UNIQUE` (`idGerente` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_PERSONA1_idx` (`fkPersona` ASC) VISIBLE,
  INDEX `fk_GERENTE_SUCURSAL1_idx` (`fkSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_PERSONA10`
    FOREIGN KEY (`fkPersona`)
    REFERENCES `pizzeria`.`PERSONA` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GERENTE_SUCURSAL1`
    FOREIGN KEY (`fkSucursal`)
    REFERENCES `pizzeria`.`SUCURSAL` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`EMPLEADO` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `fkPersona` INT NOT NULL,
  `fkGerente` INT NOT NULL,
  `fkSucursal` INT NOT NULL,
  `horaEntrada` TIME NOT NULL,
  `horaSalida` TIME NOT NULL,
  `estado` ENUM('activo', 'destituido', 'vacaciones', 'incapacidad') NOT NULL,
  `sueldo` FLOAT NOT NULL,
  `fechaContratacion` DATE NULL,
  `puesto` ENUM('cocinero', 'cajero', 'repartidor') NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE INDEX `idEmpleado_UNIQUE` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_PERSONA1_idx` (`fkPersona` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_GERENTE1_idx` (`fkGerente` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_SUCURSAL1_idx` (`fkSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_PERSONA1`
    FOREIGN KEY (`fkPersona`)
    REFERENCES `pizzeria`.`PERSONA` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_GERENTE1`
    FOREIGN KEY (`fkGerente`)
    REFERENCES `pizzeria`.`GERENTE` (`idGerente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_SUCURSAL1`
    FOREIGN KEY (`fkSucursal`)
    REFERENCES `pizzeria`.`SUCURSAL` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`REPARTIDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`REPARTIDOR` (
  `idRepartidor` INT NOT NULL AUTO_INCREMENT,
  `fkEmpleado` INT NOT NULL,
  `numeroLicencia` VARCHAR(20) NOT NULL,
  `vigenciaLicencia` DATE NOT NULL,
  `conAccidentes` ENUM('si', 'no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`idRepartidor`),
  UNIQUE INDEX `idRepardidor_UNIQUE` (`idRepartidor` ASC) VISIBLE,
  INDEX `fk_REPARTIDOR_EMPLEADO1_idx` (`fkEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_REPARTIDOR_EMPLEADO1`
    FOREIGN KEY (`fkEmpleado`)
    REFERENCES `pizzeria`.`EMPLEADO` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`MOTOCICLETA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`MOTOCICLETA` (
  `idMotocicleta` INT NOT NULL AUTO_INCREMENT,
  `fkAseguradora` INT NOT NULL,
  `fkSucursal` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(10) NOT NULL,
  `numeroDePoliza` VARCHAR(45) NOT NULL,
  `seguroActivo` TINYINT NOT NULL,
  `fechaInicioSeguro` DATE NOT NULL,
  `vencimientoSeguro` DATE NOT NULL,
  `rentaSeguro` FLOAT NOT NULL,
  `kilometraje` FLOAT NOT NULL,
  PRIMARY KEY (`idMotocicleta`),
  INDEX `fk_motocicleta_aseguradora1_idx` (`fkAseguradora` ASC) VISIBLE,
  INDEX `fk_MOTOCICLETA_SUCURSAL1_idx` (`fkSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_motocicleta_aseguradora1`
    FOREIGN KEY (`fkAseguradora`)
    REFERENCES `pizzeria`.`ASEGURADORA` (`idAseguradora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOTOCICLETA_SUCURSAL1`
    FOREIGN KEY (`fkSucursal`)
    REFERENCES `pizzeria`.`SUCURSAL` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`ENTREGA_A_DOMICILIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ENTREGA_A_DOMICILIO` (
  `idEntregaADomicilio` INT NOT NULL AUTO_INCREMENT,
  `fkOrden` INT NOT NULL,
  `fkRepartidor` INT NULL,
  `fkMotocicleta` INT NOT NULL,
  `estadoEntrega` ENUM('entregado', "en camino", "fallido", "accidente") NOT NULL,
  `horaDeEntrega` TIME NULL,
  `kilometrosRecorridos` FLOAT NULL,
  PRIMARY KEY (`idEntregaADomicilio`),
  UNIQUE INDEX `idOrdenADomicilio_UNIQUE` (`idEntregaADomicilio` ASC) VISIBLE,
  INDEX `fk_ORDEN_A_DOMICILIO_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_ENTREGA_A_DOMICILIO_REPARTIDOR1_idx` (`fkRepartidor` ASC) VISIBLE,
  INDEX `fk_ENTREGA_A_DOMICILIO_MOTOCICLETA1_idx` (`fkMotocicleta` ASC) VISIBLE,
  CONSTRAINT `fk_ORDEN_A_DOMICILIO_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENTREGA_A_DOMICILIO_REPARTIDOR1`
    FOREIGN KEY (`fkRepartidor`)
    REFERENCES `pizzeria`.`REPARTIDOR` (`idRepartidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENTREGA_A_DOMICILIO_MOTOCICLETA1`
    FOREIGN KEY (`fkMotocicleta`)
    REFERENCES `pizzeria`.`MOTOCICLETA` (`idMotocicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`AVISO_DE_SINIESTRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`AVISO_DE_SINIESTRO` (
  `idAccidente` INT NOT NULL AUTO_INCREMENT,
  `fkEntregaADomicilio` INT NOT NULL,
  `fkAjustador` INT NULL,
  `nombreRepartidor` VARCHAR(45) NOT NULL,
  `apellidoPaternoRepartidor` VARCHAR(45) NOT NULL,
  `apellidoMaternoRepartidor` VARCHAR(45) NULL,
  `placaMotocicleta` VARCHAR(10) NOT NULL,
  `nombreAseguradora` VARCHAR(45) NOT NULL,
  `numeroDePoliza` VARCHAR(45) NOT NULL,
  `fechaAccidente` DATE NOT NULL,
  `horaAccidente` TIME NOT NULL,
  `descripcion` TEXT NULL,
  `dictamen` TEXT NULL,
  PRIMARY KEY (`idAccidente`),
  UNIQUE INDEX `idAccidente_UNIQUE` (`idAccidente` ASC) VISIBLE,
  INDEX `fk_ACCIDENTE_AJUSTADOR1_idx` (`fkAjustador` ASC) VISIBLE,
  INDEX `fk_ACCIDENTE_ENTREGA_A_DOMICILIO1_idx` (`fkEntregaADomicilio` ASC) VISIBLE,
  CONSTRAINT `fk_ACCIDENTE_AJUSTADOR1`
    FOREIGN KEY (`fkAjustador`)
    REFERENCES `pizzeria`.`AJUSTADOR` (`idAjustador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACCIDENTE_ENTREGA_A_DOMICILIO1`
    FOREIGN KEY (`fkEntregaADomicilio`)
    REFERENCES `pizzeria`.`ENTREGA_A_DOMICILIO` (`idEntregaADomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`PAGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PAGO` (
  `idPago` INT NOT NULL AUTO_INCREMENT,
  `fkOrden` INT NOT NULL,
  `montoTotal` FLOAT NOT NULL,
  `tipoPago` ENUM('efectivo', 'tarjeta', 'hibrido') NOT NULL,
  PRIMARY KEY (`idPago`),
  UNIQUE INDEX `montoTotal_UNIQUE` (`idPago` ASC) VISIBLE,
  INDEX `fk_PAGO_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  UNIQUE INDEX `fkOrden_UNIQUE` (`fkOrden` ASC) VISIBLE,
  CONSTRAINT `fk_PAGO_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`PAGO_TARJETA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PAGO_TARJETA` (
  `idPagoTarjeta` INT NOT NULL AUTO_INCREMENT,
  `fkPago` INT NOT NULL,
  `montoPagado` FLOAT NOT NULL,
  `numeroMovimiento` VARCHAR(20) NOT NULL,
  `ultimos4Digitos` VARCHAR(4) NOT NULL,
  `cantidadTarjetas` INT NOT NULL,
  PRIMARY KEY (`idPagoTarjeta`),
  UNIQUE INDEX `idPago_UNIQUE` (`idPagoTarjeta` ASC) VISIBLE,
  INDEX `fk_PAGO_TARJETA_PAGO1_idx` (`fkPago` ASC) VISIBLE,
  CONSTRAINT `fk_PAGO_TARJETA_PAGO1`
    FOREIGN KEY (`fkPago`)
    REFERENCES `pizzeria`.`PAGO` (`idPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`COCINERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`COCINERO` (
  `idCocinero` INT NOT NULL AUTO_INCREMENT,
  `fkEmpleado` INT NOT NULL,
  PRIMARY KEY (`idCocinero`),
  UNIQUE INDEX `idCocinero_UNIQUE` (`idCocinero` ASC) VISIBLE,
  INDEX `fk_COCINERO_EMPLEADO1_idx` (`fkEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_COCINERO_EMPLEADO1`
    FOREIGN KEY (`fkEmpleado`)
    REFERENCES `pizzeria`.`EMPLEADO` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`CAJERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`CAJERO` (
  `idCajero` INT NOT NULL AUTO_INCREMENT,
  `fkEmpleado` INT NOT NULL,
  PRIMARY KEY (`idCajero`),
  UNIQUE INDEX `idCajero_UNIQUE` (`idCajero` ASC) VISIBLE,
  INDEX `fk_CAJERO_EMPLEADO1_idx` (`fkEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_CAJERO_EMPLEADO1`
    FOREIGN KEY (`fkEmpleado`)
    REFERENCES `pizzeria`.`EMPLEADO` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`SUCURSAL_has_PROMOCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`SUCURSAL_has_PROMOCION` (
  `fkSucursal` INT NOT NULL,
  `fkPromocion` INT NOT NULL,
  PRIMARY KEY (`fkSucursal`, `fkPromocion`),
  INDEX `fk_SUCURSAL_has_PROMOCION_PROMOCION2_idx` (`fkPromocion` ASC) VISIBLE,
  INDEX `fk_SUCURSAL_has_PROMOCION_SUCURSAL2_idx` (`fkSucursal` ASC) VISIBLE,
  CONSTRAINT `fk_SUCURSAL_has_PROMOCION_SUCURSAL2`
    FOREIGN KEY (`fkSucursal`)
    REFERENCES `pizzeria`.`SUCURSAL` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SUCURSAL_has_PROMOCION_PROMOCION2`
    FOREIGN KEY (`fkPromocion`)
    REFERENCES `pizzeria`.`PROMOCION` (`idPromocion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ENTREGA_EN_TIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ENTREGA_EN_TIENDA` (
  `idEntregaEnTienda` INT NOT NULL AUTO_INCREMENT,
  `fkOrden` INT NOT NULL,
  `fkCocinero(entrego)` INT NOT NULL,
  PRIMARY KEY (`idEntregaEnTienda`),
  UNIQUE INDEX `idOrdenEnTienda_UNIQUE` (`idEntregaEnTienda` ASC) VISIBLE,
  INDEX `fk_ORDEN_EN_TIENDA_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_ORDEN_EN_TIENDA_COCINERO1_idx` (`fkCocinero(entrego)` ASC) VISIBLE,
  CONSTRAINT `fk_ORDEN_EN_TIENDA_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDEN_EN_TIENDA_COCINERO1`
    FOREIGN KEY (`fkCocinero(entrego)`)
    REFERENCES `pizzeria`.`COCINERO` (`idCocinero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN_has_COCINERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN_has_COCINERO` (
  `fkOrden` INT NOT NULL,
  `fkCocinero` INT NOT NULL,
  `rol` ENUM('preparo', 'calento') NOT NULL,
  PRIMARY KEY (`fkOrden`, `fkCocinero`),
  INDEX `fk_COCINERO_has_ORDEN_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_COCINERO_has_ORDEN_COCINERO1_idx` (`fkCocinero` ASC) VISIBLE,
  CONSTRAINT `fk_COCINERO_has_ORDEN_COCINERO1`
    FOREIGN KEY (`fkCocinero`)
    REFERENCES `pizzeria`.`COCINERO` (`idCocinero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COCINERO_has_ORDEN_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`PIZZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PIZZA` (
  `idPizza` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `tamaño` ENUM('personal', 'mediana', 'familiar') NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idPizza`),
  UNIQUE INDEX `idPIZZA_UNIQUE` (`idPizza` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`COMPLEMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`COMPLEMENTO` (
  `idComplemento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idComplemento`),
  UNIQUE INDEX `idComplemento_UNIQUE` (`idComplemento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`INGREDIENTE_EXTRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`INGREDIENTE_EXTRA` (
  `idIngredienteExtra` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idIngredienteExtra`),
  UNIQUE INDEX `idINGREDIENTE_EXTRA_UNIQUE` (`idIngredienteExtra` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN_has_PIZZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN_has_PIZZA` (
  `fkOrden` INT NOT NULL,
  `fkPizza` INT NOT NULL,
  PRIMARY KEY (`fkOrden`, `fkPizza`),
  INDEX `fk_PIZZA_has_ORDEN_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_PIZZA_has_ORDEN_PIZZA1_idx` (`fkPizza` ASC) VISIBLE,
  CONSTRAINT `fk_PIZZA_has_ORDEN_PIZZA1`
    FOREIGN KEY (`fkPizza`)
    REFERENCES `pizzeria`.`PIZZA` (`idPizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PIZZA_has_ORDEN_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN_has_COMPLEMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN_has_COMPLEMENTO` (
  `fkOrden` INT NOT NULL,
  `fkComplemento` INT NOT NULL,
  PRIMARY KEY (`fkOrden`, `fkComplemento`),
  INDEX `fk_COMPLEMENTO_has_ORDEN_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_COMPLEMENTO_has_ORDEN_COMPLEMENTO1_idx` (`fkComplemento` ASC) VISIBLE,
  CONSTRAINT `fk_COMPLEMENTO_has_ORDEN_COMPLEMENTO1`
    FOREIGN KEY (`fkComplemento`)
    REFERENCES `pizzeria`.`COMPLEMENTO` (`idComplemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPLEMENTO_has_ORDEN_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN_has_INGREDIENTE_EXTRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN_has_INGREDIENTE_EXTRA` (
  `fkOrden` INT NOT NULL,
  `fkIngredienteExtra` INT NOT NULL,
  PRIMARY KEY (`fkOrden`, `fkIngredienteExtra`),
  INDEX `fk_INGREDIENTE_EXTRA_has_ORDEN_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_INGREDIENTE_EXTRA_has_ORDEN_INGREDIENTE_EXTRA1_idx` (`fkIngredienteExtra` ASC) VISIBLE,
  CONSTRAINT `fk_INGREDIENTE_EXTRA_has_ORDEN_INGREDIENTE_EXTRA1`
    FOREIGN KEY (`fkIngredienteExtra`)
    REFERENCES `pizzeria`.`INGREDIENTE_EXTRA` (`idIngredienteExtra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INGREDIENTE_EXTRA_has_ORDEN_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`PAGO_EFECTIVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`PAGO_EFECTIVO` (
  `idPagoEfectivo` INT NOT NULL AUTO_INCREMENT,
  `fkPago` INT NOT NULL,
  `montoPagado` FLOAT NOT NULL,
  PRIMARY KEY (`idPagoEfectivo`),
  UNIQUE INDEX `idPagoEfectivo_UNIQUE` (`idPagoEfectivo` ASC) VISIBLE,
  INDEX `fk_PAGO_EFECTIVO_PAGO1_idx` (`fkPago` ASC) VISIBLE,
  CONSTRAINT `fk_PAGO_EFECTIVO_PAGO1`
    FOREIGN KEY (`fkPago`)
    REFERENCES `pizzeria`.`PAGO` (`idPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`ORDEN_has_CAJERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`ORDEN_has_CAJERO` (
  `fkOrden` INT NOT NULL,
  `fkCajero` INT NOT NULL,
  PRIMARY KEY (`fkOrden`, `fkCajero`),
  INDEX `fk_CAJERO_has_ORDEN_ORDEN1_idx` (`fkOrden` ASC) VISIBLE,
  INDEX `fk_CAJERO_has_ORDEN_CAJERO1_idx` (`fkCajero` ASC) VISIBLE,
  CONSTRAINT `fk_CAJERO_has_ORDEN_CAJERO1`
    FOREIGN KEY (`fkCajero`)
    REFERENCES `pizzeria`.`CAJERO` (`idCajero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAJERO_has_ORDEN_ORDEN1`
    FOREIGN KEY (`fkOrden`)
    REFERENCES `pizzeria`.`ORDEN` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
