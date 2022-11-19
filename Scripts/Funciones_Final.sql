DELIMITER //

create function get_cuenta_by_tarjeta_id (p_id_tarjeta int) returns int
reads sql data
begin
		declare v_cuenta_id int;
        
        select cue.id
        into v_cuenta_id from servicios s
        inner join tarjetas t on t.id=s.id_tarjeta
        inner join clientes cli on cli.id=t.id_cliente
        inner join cuentas cue on cli.id=cue.id_cliente
        where s.id_tarjeta=p_id_tarjeta
        limit 1;
        
        return v_cuenta_id;
end//

create function get_loans_by_email (p_email varchar(45)) returns smallint
reads sql data
begin
		declare v_loans smallint;
        
        select count(1)
        into v_loans
		from clientes cli
		inner join cliente_prestamo cp on cp.id_cliente=cli.id
        where cli.email=p_email;
        
        return v_loans;       
end//

create function amount_per_payments (p_id_prestamo int) returns varchar(45)
reads sql data
begin
		declare v_monto varchar(45);
        
        select concat("$ ", (cp.monto/cp.cuota))
        into v_monto
		from cliente_prestamo cp
		where cp.id = p_id_prestamo;
        
        return v_monto;
end//

create function cliente_by_cuenta (p_cuenta_numero varchar(45)) returns varchar(45)
reads sql data
begin
	declare v_cliente varchar(45);
    
    select concat(c.nombre," ", c.apellido)
    into v_cliente
    from cuentas cu
    inner join clientes c on cu.id_cliente = c.id
    where cu.numero = p_cuenta_numero;
    
    return v_cliente;
end//

create function cliente_by_tarjeta (p_tarjeta_id int) returns varchar(45)
reads sql data
begin
	declare v_cliente varchar(45);
    
    select concat(c.nombre," ", c.apellido)
    into v_cliente
    from tarjetas t
    inner join clientes c on t.id_cliente = c.id
    where t.id = p_tarjeta_id;
    
    return v_cliente;
end//

DELIMITER ;
