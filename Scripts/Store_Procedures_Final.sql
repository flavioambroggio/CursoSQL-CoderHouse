DELIMITER //

create procedure sp_eliminar_tarjetas_vencidas (in p_tarjeta_id int)
begin

	declare v_tarjeta_id int;
    declare v_tarjeta_numero varchar(45);
    declare v_cliente varchar(45);

	-- Validar que la tarjeta exista
    select id
    into v_tarjeta_id
    from tarjetas
    where id = p_tarjeta_id;
    
    -- Validar que la tarjeta este vencida
    if v_tarjeta_id <> '' or v_tarjeta_id > 0 or v_tarjeta_id <> null then
    
		select numero
		into v_tarjeta_numero
		from tarjetas
		where id = v_tarjeta_id and date(fecha_vencimiento) < current_date();
        
        -- Si esta vencida eliminar la tarjeta
        if v_tarjeta_numero != '' then
        
			select cliente_by_tarjeta(p_tarjeta_id)
            into v_cliente;
        
			select concat("Se elimino la tarjeta ", v_tarjeta_numero, " del cliente ",v_cliente) as ok_msg;
        
			delete from tarjetas
            where id = v_tarjeta_id;
		else
			select "La tarjeta aún no esta vencida" as error_msg;
		end if;
        
    else
		select "La tarjeta no existe" as error_msg;
	end if;
    
end//

create procedure sp_listado_prestamos_ordenados (in p_orden_columna varchar(100), in p_orden_tipo varchar(100))
begin

	-- Ordena un listado de cliente_prestamos (prestamos asignados a los clientes)
	
    set @ordenar = concat(" order by ", p_orden_columna, " ", p_orden_tipo);
    set @clausula = concat("select concat(cli.nombre, ' ', cli.apellido) as 'cliente', tipo, monto from cliente_prestamo inner join clientes cli on id_cliente=cli.id", @ordenar);
	
    prepare mi_clausula from @clausula;
    execute mi_clausula;
    deallocate prepare mi_clausula;

end//

DELIMITER ;