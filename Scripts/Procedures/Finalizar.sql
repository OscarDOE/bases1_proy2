DELIMITER //

CREATE PROCEDURE FinalizarOrden(
IN p_id_orden INT
)
BEGIN
	DECLARE v_estado_actual INT;
	DECLARE v_fecha_entrega DATETIME;
	
	-- Verificar que la orden exista y esté en estado "EN CAMINO"
	SELECT estado INTO v_estado_actual
	FROM orden WHERE id = p_id_orden;
	IF v_estado_actual != 3 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden especificada no existe o no está en estado "EN CAMINO".';
	END IF;
	
	-- Actualizar el estado de la orden a "ENTREGADA"
	UPDATE orden SET estado = 4 WHERE id = p_id_orden;
	
	-- Actualizar la fecha de entrega de la orden
	SET v_fecha_entrega = NOW();
	UPDATE orden SET fecha_entrega = v_fecha_entrega WHERE id = p_id_orden;
END //

DELIMITER ;