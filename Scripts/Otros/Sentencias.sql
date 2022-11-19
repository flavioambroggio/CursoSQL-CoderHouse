use mysql;

-- Muestro todos los permisos del usuario root
show grants for 'root'@'localhost';

-- Creo el usuario prueba y luego lo renombro a Flavio1
create user 'prueba'@'localhost' identified by '1234';
rename user 'prueba'@'localhost' to 'Flavio1'@'localhost';

-- Creo el usuario Flavio2
create user 'Flavio2'@'localhost' identified by '4321';

-- Le doy todos los permisos a todas las tablas de todos los schemas al usuario Flavio1 y luego se los revoco
grant select on *.* to 'Flavio1'@'localhost';
revoke select on *.* from 'Flavio1'@'localhost';
-- Le doy permiso de solo lectura de datos a todas las tablas del schema homebanking al usuario Flavio1
grant select on homebanking.* to 'Flavio1'@'localhost';
show grants for 'Flavio1'@'localhost';

-- Le doy permisos de lectura, inserción y actualización de datos a todas las tablas del Schema homebanking al usuario Flavio2 
grant select, insert, update on homebanking.* to 'Flavio2'@'localhost';
show grants for 'Flavio2'@'localhost';
