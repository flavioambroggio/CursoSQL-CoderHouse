-- Agregado en scrpit DB Homebanking

CREATE TABLE `homebanking`.`logs_cuentas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `cliente` VARCHAR(100) NOT NULL,
  `cuenta` VARCHAR(45) NOT NULL,
  `tipo` ENUM('caja de ahorro', 'cuenta corriente') NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `homebanking`.`logs_tarjetas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `cliente` VARCHAR(100) NOT NULL,
  `tarjeta` VARCHAR(45) NOT NULL,
  `tipo` ENUM('debito', 'credito') NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));  

DELIMITER //

-- Registro para la eliminacion de tarjetas (por ejemplo tarjetas vencidas)
create trigger logs_tarjetas_delete
before delete on tarjetas
for each row
begin
	insert into logs_tarjetas
    values(null, curdate(), cliente_by_tarjeta(old.id), old.numero, old.tipo, concat("Se eliminó la tarjeta vencida el dia ", date(old.fecha_vencimiento)), user());
end//

-- Registro para la inserción de tarjetas (por ejemplo crear una nueva tarjeta a los clientes)
create trigger logs_tarjetas_insert
after insert on tarjetas
for each row
begin
	insert into logs_tarjetas
    values(null, curdate(), cliente_by_tarjeta(new.id), new.numero, new.tipo, "Se insertó la tarjeta", user());    
end//

drop trigger logs_tarjetas_insert;

-- Registro para la eliminación de cuentas
create trigger logs_cuentas_delete
before delete on cuentas
for each row
begin
	insert into logs_cuentas
    values(null, curdate(), cliente_by_cuenta_SP(old.numero), old.numero, old.tipo, "Se elimino la cuenta", user());    
end//

-- Registro para la modificación del tipo de cuenta
create trigger logs_cuentas_update
after update on cuentas
for each row
begin
	insert into logs_cuentas
    values(null, curdate(), cliente_by_cuenta_SP(new.numero), new.numero, old.tipo, concat("Se actualizó el tipo de cuenta a ", new.tipo), user());    
end//

-- Agrega una transaccion cuendo se paga un servicio
create trigger servicios_insert
after insert on servicios
for each row
begin
	insert into transacciones
    values(null, "credito", new.monto, concat("Se realizó el pago de ", new.nombre), curdate(), get_cuenta_by_tarjeta_id(new.id_tarjeta));    
end//

DELIMITER ;