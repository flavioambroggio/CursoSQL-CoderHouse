SET autocommit = 0;

delete from cliente_prestamo where id = 1;
-- rollback;
-- commit;

/*
Sentencia para agregar el dato eliminado
*/
-- insert into cliente_prestamo values (1, 'Prestamo personal', 3000000, 12, 1, 1);

/* -------------------------------------------------------------------------------- */

START TRANSACTION;
insert into tarjetas values (null, 'credito', '1234-8524-7897-3114', 'Dennison Stokey', '2022-08-11 00:00:00',  adddate(curdate(), interval 10 year), 123, 1);
insert into tarjetas values (null, 'debito', '6548-9635-7897-7532', 'Saidee Farnorth', '2022-09-01 00:00:00',  adddate(curdate(), interval 10 year),742, 5);
insert into tarjetas values (null, 'debito', '6548-4567-7897-3114', 'Tamiko Quinell', '2022-04-22 00:00:00',  adddate(curdate(), interval 10 year), 259, 6);
insert into tarjetas values (null, 'credito', '1234-4567-9635-7536', 'Maurita Nealon', '2022-05-02 00:00:00',  adddate(curdate(), interval 10 year), 965, 7);
savepoint lote_1;
insert into tarjetas values (null, 'credito', '1234-4567-9514-9512', 'Emeline Dobbinson', '2022-01-25 00:00:00',  adddate(curdate(), interval 10 year), 159, 8);
insert into tarjetas values (null, 'credito', '1234-7415-7532-3114', 'Catarina Stiggers', '2022-02-01 00:00:00',  adddate(curdate(), interval 10 year), 753, 9);
insert into tarjetas values (null, 'debito', '6548-7895-9521-3114', 'Kial Staniland', '2022-06-10 00:00:00',  adddate(curdate(), interval 10 year), 248, 2);
insert into tarjetas values (null, 'credito', '1234-4567-1598-3114', 'Napoleon Remmers', '2022-07-23 00:00:00',  adddate(curdate(), interval 10 year), 369, 3);
savepoint lote_2;

release savepoint lote_1;

/*
Sentencia para eliminar los datos nuevos
*/
-- delete from tarjetas where fecha_vencimiento = adddate(curdate(), interval 10 year);

