DELIMITER //

CREATE PROCEDURE MostrarOrdenes(
    IN p_estado INT
)
BEGIN
   IF p_estado NOT IN (1, 2, 3, 4, -1) THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El valor del parámetro Estado no es válido.';
   END IF;
    
   IF p_estado IN (-1) THEN
	SELECT o.id AS IdOrden, e.descripcion AS Estado, o.fecha_inicio AS Fecha, o.dpi AS 'DPI CLIENTE',
		d.direccion AS 'Direccion del Cliente',o.restaurante AS 'Restaurante que cubre la orden' ,
		CASE o.canal WHEN 'L' THEN 'Llamada' WHEN 'A' THEN 'Aplicación' END AS Canal
	FROM orden o
	JOIN estado e ON o.estado = e.id
	JOIN direccion d ON d.id = o.direccion_cliente
	JOIN cliente c ON c.dpi  = o.dpi 
	WHERE o.estado  = -1;
   ELSE
	   SELECT o.id AS IdOrden, e.descripcion AS Estado, o.fecha_inicio AS Fecha, c.dpi AS `DPI cliente`, 
	          d.direccion AS `Dirección del cliente`, r.id AS `Restaurante que cubre la orden`, 
	          CASE o.canal WHEN 'L' THEN 'Llamada' WHEN 'A' THEN 'Aplicación' END AS Canal
	   FROM orden o
	   JOIN estado e ON o.estado = e.id
	   JOIN cliente c ON o.dpi = c.dpi
	   JOIN direccion d ON o.direccion_cliente = d.id
	   JOIN restaurante r ON o.restaurante = r.id
	   WHERE o.estado  = p_estado;
	END IF;
END //

DELIMITER ;

