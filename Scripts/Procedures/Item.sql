DELIMITER //

CREATE PROCEDURE AgregarItem(
    IN p_id_orden INT,
    IN p_tipo_producto CHAR(1),
    IN p_producto INT,
    IN p_cantidad float UNSIGNED,
    IN p_observacion VARCHAR(255)
)
BEGIN
	DECLARE cantidad_entero INT UNSIGNED;
    DECLARE v_estado_actual INT;
    DECLARE v_producto varchar(10);
   
    -- Verificar que la orden exista y esté en estado válido
    SELECT estado INTO v_estado_actual FROM orden WHERE id = p_id_orden;
    SET cantidad_entero = ROUND(p_cantidad);
   IF NOT cantidad_entero = p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cantidad debe de ser entera.';
	END IF;   
   -- Verificar que la cantidad sea entera
    IF v_estado_actual NOT IN (1, 2) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden especificada no existe o no está en estado válido.';
    END IF;

    -- Verificar que el producto exista
    IF p_tipo_producto  IN ('C','E','B','P') THEN
	    SET v_producto = CONCAT(p_tipo_producto, p_producto);
        IF NOT EXISTS (SELECT id FROM producto WHERE id = CONCAT(p_tipo_producto,p_producto) ) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El producto especificado no existe.';
        END IF;
    END IF;

    -- Insertar el item en la tabla detalle_orden
    INSERT INTO producto_orden (orden, producto, cantidad, observacion)
    VALUES (p_id_orden, CONCAT(p_tipo_producto,p_producto), p_cantidad, p_observacion);

    -- Actualizar el estado de la orden si estaba en estado "INICIADA"
    IF v_estado_actual = 1 THEN
        UPDATE orden SET estado = 2 WHERE id = p_id_orden;
    END IF;
END //

DELIMITER ;
