DELIMITER //

CREATE PROCEDURE ConsultarPedidosCliente(
	IN p_IdOrden INT
)
BEGIN
	-- Variables para almacenar los datos de los ítems de la orden
	DECLARE v_Producto VARCHAR(50);
	DECLARE v_TipoProducto VARCHAR(10);
	DECLARE v_Precio DECIMAL(10, 2);
	DECLARE v_Cantidad INT;
	DECLARE v_Observacion VARCHAR(100);
	DECLARE v_orden_existente TINYINT;
	
	-- Verificar que la orden exista
	SELECT COUNT(*) INTO v_orden_existente FROM orden WHERE id = p_IdOrden;
	IF v_orden_existente = 0 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden especificada no existe.';
	END IF;

	IF (SELECT estado FROM orden WHERE orden.id = p_IdOrden) IN (-1) THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden no tiene cobertura.';	
	END IF;
	-- Consultar los ítems de la orden
	SELECT p.descripcion, tp.descripcion, p.precio, po.cantidad, po.observacion
	FROM producto_orden po
	INNER JOIN producto p ON po.producto = p.id
	INNER JOIN tipo_producto tp ON tp.id = p.tipo 
	WHERE po.orden = p_IdOrden;
	
	-- Mostrar los resultados
	-- SELECT v_Producto AS Producto, v_TipoProducto AS `Tipo producto`, v_Precio AS Precio, v_Cantidad AS Cantidad, IFNULL(v_Observacion, '') AS Observacion;


END //

DELIMITER ;

SELECT * FROM producto_orden po ;