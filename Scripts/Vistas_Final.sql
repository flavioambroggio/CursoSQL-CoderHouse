-- Vista 1
create view prestamos_solicitados as
select concat(cli.nombre, " ", cli.apellido) as "Cliente", p.tipo as "Prestamo", cp.monto as "Monto solicitado", cp.cuota as "N° de cuotas", round((cp.monto/cp.cuota), 2) as "Monto p/ cuota"
from cliente_prestamo cp
inner join clientes cli on cp.id_cliente = cli.id
inner join prestamos p on cp.id_prestamo = p.id
order by Cliente;

select * from prestamos_solicitados;

-- Vista 2
create view tarjetas_vencidas as
select concat(cli.nombre, " ", cli.apellido) as "Cliente", tarj.numero as "Numero de tarjeta", tarj.tipo as "Tipo", tarj.fecha_vencimiento as "Venció"
from clientes cli
inner join tarjetas tarj on tarj.id_cliente = cli.id
where tarj.fecha_vencimiento < current_date()
order by Venció desc;

select * from tarjetas_vencidas;

-- Vista 3
create view transacciones_año_actual as
select concat(cli.nombre, " ", cli.apellido) as "Cliente", cue.numero as "Cuenta", cue.tipo as "Tipo", count(tran.id) as "N° de transacciones p/ cuenta"
from cuentas cue
inner join clientes cli on cue.id_cliente = cli.id
inner join transacciones tran on tran.id_cuenta = cue.id
where year(tran.fecha) = year(curdate())
group by Cliente, Cuenta, Tipo
order by Cliente;

select * from transacciones_año_actual;

-- Vista 4
create view sumatoria_transacciones as
select concat(cli.nombre, " ", cli.apellido) as "Cliente", c.numero as "N° de cuenta", 
(select sum(tran.monto) from transacciones tran
inner join cuentas cue on tran.id_cuenta=cue.id
where tran.tipo="credito" and cue.id=c.id) as "Creditos totales",
(select sum(tran.monto) from transacciones tran
inner join cuentas cue on tran.id_cuenta=cue.id
where tran.tipo="debito" and cue.id=c.id) as "Debitos totales"
from cuentas c
inner join clientes cli on cli.id=c.id_cliente
group by c.id;

select * from sumatoria_transacciones;

-- Vista 5
create view registro_por_cliente as
select concat(cli.nombre, " ", cli.apellido) as "Cliente", 
(select count(cu.id) from cuentas cu inner join clientes c on cu.id_cliente=c.id where c.id=cli.id group by c.nombre) as "Cant. de cuentas",
(select count(cp.id) from cliente_prestamo cp inner join clientes c on cp.id_cliente=c.id where c.id=cli.id group by c.nombre) as "Cant. de prestamos",
(select count(ta.id) from tarjetas ta inner join clientes c on ta.id_cliente=c.id where c.id=cli.id group by c.nombre) as "Cant. de tarjetas"
from clientes cli
inner join cuentas cue on cue.id_cliente = cli.id
inner join cliente_prestamo clipre on clipre.id_cliente = cli.id 
inner join transacciones tran on tran.id_cuenta = cue.id
inner join tarjetas tarj on tarj.id_cliente = cli.id
group by cli.nombre;

select * from registro_por_cliente;