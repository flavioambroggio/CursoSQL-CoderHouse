-- Creación de la base de datos
CREATE DATABASE homebanking ;

USE homebanking;

-- Creacion de las tablas

-- Tabla DOMICILIO
CREATE TABLE `homebanking`.`domicilios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `localidad` VARCHAR(75) NOT NULL,
  `provincia` VARCHAR(75) NOT NULL,
  `codigo_postal` VARCHAR(75) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `piso_departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

-- Tabla CLIENTES
CREATE TABLE `homebanking`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `id_domicilio` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_domicilio_idx` (`id_domicilio` ASC) VISIBLE,
  CONSTRAINT `id_domicilio`
    FOREIGN KEY (`id_domicilio`)
    REFERENCES `homebanking`.`domicilios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
-- Tabla CUENTAS  
CREATE TABLE `homebanking`.`cuentas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `tipo` ENUM('caja de ahorro','cuenta corriente') NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `balance` DOUBLE NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `homebanking`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla TARJETAS    
CREATE TABLE `homebanking`.`tarjetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('credito', 'debito') NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `nombre_titular` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_vencimiento` DATETIME NOT NULL,
  `cvv` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
    FOREIGN KEY (`id_cliente`)
    REFERENCES `homebanking`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla PRESTAMOS    
CREATE TABLE `homebanking`.`prestamos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `monto_maximo` INT NOT NULL,
  `numero_cuotas` INT NOT NULL,
  PRIMARY KEY (`id`));
  
-- Tabla CLIENTE_PRESTAMOS  
CREATE TABLE `homebanking`.`cliente_prestamo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `monto` INT NOT NULL,
  `cuota` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_prestamo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_prestamo_idx` (`id_prestamo` ASC) VISIBLE,
    FOREIGN KEY (`id_cliente`)
    REFERENCES `homebanking`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_prestamo`
    FOREIGN KEY (`id_prestamo`)
    REFERENCES `homebanking`.`prestamos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla TRANSACCIONES
CREATE TABLE `homebanking`.`transacciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('credito', 'debito') NOT NULL,
  `monto` DOUBLE NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_cuenta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cuenta_idx` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `id_cuenta`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `homebanking`.`cuentas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla SERVICIO    
CREATE TABLE `homebanking`.`servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `monto` INT NOT NULL,
  `id_tarjeta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`id_tarjeta` ASC) VISIBLE,
  CONSTRAINT `id_tarjeta`
    FOREIGN KEY (`id_tarjeta`)
    REFERENCES `homebanking`.`tarjetas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla CAJA_SEGURIDAD
CREATE TABLE `homebanking`.`caja_seguridad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_final` DATE NOT NULL,
  `monto` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `homebanking`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla SEGUROS
CREATE TABLE `homebanking`.`seguros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `monto` INT NOT NULL,
  PRIMARY KEY (`id`));
  
-- Tabla CLIENTE_SEGURO  
CREATE TABLE `homebanking`.`cliente_seguro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_seguro` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_seguro_idx` (`id_seguro` ASC) VISIBLE,
    FOREIGN KEY (`id_cliente`)
    REFERENCES `homebanking`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_seguro`
    FOREIGN KEY (`id_seguro`)
    REFERENCES `homebanking`.`seguros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Tabla INVERSIONES     
CREATE TABLE `homebanking`.`inversiones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `monto_max` INT NOT NULL,
  `ganancia` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));
  
-- Tabla CUENTA_INVERSION  
CREATE TABLE `homebanking`.`cuenta_inversion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `id_cuenta` INT NOT NULL,
  `id_inversion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cuenta_idx` (`id_cuenta` ASC) VISIBLE,
  INDEX `id_inversion_idx` (`id_inversion` ASC) VISIBLE,
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `homebanking`.`cuentas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_inversion`
    FOREIGN KEY (`id_inversion`)
    REFERENCES `homebanking`.`inversiones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    
    
    
    
  
  




