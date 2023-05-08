DELIMITER //

CREATE PROCEDURE ConfirmarOrden(
    IN p_id_orden INT,
    IN p_forma_pago CHAR(1),
    IN p_id_repartidor INT
)
BEGIN
	DECLARE v_dpi_cliente BIGINT;
    DECLARE v_estado_actual INT;
   	DECLARE v_direccion_cliente INT;
    DECLARE v_municipio VARCHAR(100);
    DECLARE v_nit_cliente VARCHAR(20);
    DECLARE v_subtotal DECIMAL(10, 2);
    DECLARE v_total DECIMAL(10, 2);
    DECLARE v_iva DECIMAL(10, 2) DEFAULT 0.12;
    DECLARE v_fecha_actual DATETIME;
    DECLARE v_serie VARCHAR(10);
    DECLARE v_id_factura INT;
    DECLARE v_empleado_existe TINYINT;
    DECLARE v_es_repartidor TINYINT;
    DECLARE v_orden_existe TINYINT;
   
   -- Verifica que la Orden exista
    SELECT COUNT(*) INTO v_orden_existe FROM orden WHERE id = p_id_orden;
  	IF v_orden_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden no existe.';
	END IF;  	

    -- Verificar que la orden esté en estado válido
    SELECT estado, direccion_cliente, dpi INTO v_estado_actual, v_direccion_cliente, v_dpi_cliente
    FROM orden WHERE id = p_id_orden;
    IF v_estado_actual NOT IN (1, 2) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La orden especificada está en estado inválido.';
    END IF;

    -- Verificar que el Tipo de pago exista
    IF p_forma_pago NOT IN ('T','E') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La forma de pago no es válida.';
	END IF;  	

   -- Verificar que el Empleado exista
    SELECT COUNT(*) INTO v_empleado_existe FROM empleado WHERE id = p_id_repartidor;
  	IF v_empleado_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El empleado no existe.';
	END IF;  		
	-- Verificar que sea 'Repartidor' y que exista
	SELECT COUNT(*) INTO v_es_repartidor
	FROM empleado e
	JOIN puesto p ON e.puesto = p.id
	WHERE e.id = p_id_repartidor AND p.nombre = 'Repartidor';
	
	IF v_es_repartidor = 0 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no tiene el puesto de Repartidor.';
	END IF;
   -- SETEAR el municipio
   SELECT municipio INTO v_municipio FROM direccion WHERE id = v_direccion_cliente;

   -- SETEAR el nit
   SELECT nit INTO v_nit_cliente FROM cliente WHERE dpi = v_dpi_cliente;

  -- Calcular el subtotal
    SELECT SUM(p.precio * po.cantidad) INTO v_subtotal
    FROM producto_orden po
    JOIN producto p ON p.id = po.producto
    WHERE po.orden = p_id_orden;

    -- Calcular el monto total de la factura
    SET v_total = v_subtotal + (v_subtotal * v_iva);

    -- Obtener la fecha y hora actual
    SET v_fecha_actual = NOW();

    -- Generar el número de serie de la factura concatenando el año en curso con el id de la orden
    SET v_serie = CONCAT(YEAR(v_fecha_actual), p_id_orden);

   -- Actualizar el estado de la orden a "EN CAMINO" 
    UPDATE orden SET estado = 3 WHERE id = p_id_orden;
    -- Insertar el encabezado de la factura
    INSERT INTO factura (serie, total, municipio, fecha, orden, nit, pago, repartidor)
    VALUES (v_serie, v_total, v_municipio, v_fecha_actual, p_id_orden, IFNULL(v_nit_cliente, 'C/F'), p_forma_pago,p_id_repartidor);

    -- Obtener el id de la factura recién creada
    SET v_id_factura = LAST_INSERT_ID();

END //

DELIMITER ;
