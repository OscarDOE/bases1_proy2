DELIMITER //

CREATE PROCEDURE ConsultarHistorialOrdenes(
	IN p_DPI_cliente BIGINT
)
BEGIN
	DECLARE v_IdOrden INT;
	DECLARE v_Fecha DATETIME;
	DECLARE v_Monto DECIMAL(10,2);
	DECLARE v_IdRestaurante INT;
	DECLARE v_IdRepartidor INT;
	DECLARE v_Direccion VARCHAR(100);
	DECLARE v_Canal VARCHAR(20);
	DECLARE v_num_clientes TINYINT;
	
	-- Verificar que el cliente exista
	SELECT COUNT(*) INTO v_num_clientes FROM cliente WHERE dpi = p_DPI_cliente;
	IF v_num_clientes = 0 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente especificado no existe.';
	END IF;
	
	-- Mostrar el historial de órdenes del cliente
	SELECT o.id AS IdOrden, o.fecha_inicio AS Fecha, f.total AS Monto_Total, r.id AS Restaurante,
	CONCAT(e.nombres, ' ', e.apellidos) AS Repartidor, d.direccion AS Direccion, 
	CASE o.canal WHEN 'L' THEN 'Llamada' WHEN 'A' THEN 'Aplicación' END AS Canal
	FROM orden o
	INNER JOIN factura f ON f.orden = o.id 
	INNER JOIN empleado e ON f.repartidor = e.id
	INNER JOIN restaurante r ON e.restaurante = r.id
	INNER JOIN direccion d ON d.id = o.direccion_cliente
	WHERE o.dpi = p_DPI_cliente
	ORDER BY o.fecha_inicio DESC;


END //

DELIMITER ;