DELIMITER //

CREATE PROCEDURE CrearOrden(
    IN p_dpi_cliente BIGINT UNSIGNED,
    IN p_id_direccion INT UNSIGNED,
    IN p_canal CHAR(1)
)
BEGIN
    DECLARE v_cliente_existe TINYINT;
   	DECLARE v_direccion_existe TINYINT;
    DECLARE v_restaurante_existe TINYINT;
    DECLARE v_id_restaurante VARCHAR(10);
   	DECLARE v_id_municipio INT UNSIGNED;
    DECLARE v_municipio VARCHAR(50);
    DECLARE v_zona INT UNSIGNED;
    DECLARE v_estado int UNSIGNED;
    
    SELECT COUNT(*) INTO v_cliente_existe FROM cliente WHERE dpi = p_dpi_cliente;
    SELECT COUNT(*) INTO v_direccion_existe FROM direccion WHERE dpi = p_dpi_cliente;
   
    -- Validar que el canal sea válido
	IF p_canal NOT IN ('L', 'A') THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El canal debe ser L (llamada) o A (aplicación)';
	END IF;
	   
	-- Validar que el cliente existe
	SELECT COUNT(*) INTO v_cliente_existe FROM cliente WHERE dpi = p_dpi_cliente;
	IF v_cliente_existe = 0 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente no existe.';
	END IF;
	
	-- Validar que la dirección pertenezca al cliente
	SELECT COUNT(*) INTO v_direccion_existe FROM direccion WHERE id = p_id_direccion AND dpi = p_dpi_cliente;
	IF v_direccion_existe = 0 THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La dirección no pertenece al cliente.';
	END IF;
	-- Obtener la información de la dirección
	SELECT municipio, zona INTO v_municipio, v_zona FROM direccion WHERE id = p_id_direccion;
	
	-- Validar que existe un restaurante en la misma zona y municipio que la dirección del cliente
	SELECT COUNT(*) INTO v_restaurante_existe FROM restaurante r WHERE r.municipio = v_municipio AND r.zona = v_zona;
	SELECT id INTO v_id_restaurante FROM restaurante WHERE municipio = v_municipio AND zona = v_zona LIMIT 1;
	
	
	
	IF v_restaurante_existe = 0 THEN
	    -- No hay cobertura en la zona del cliente
	    INSERT INTO orden(dpi, direccion_cliente, restaurante, canal, estado, fecha_inicio)
	    VALUES (p_dpi_cliente, p_id_direccion, v_id_restaurante, p_canal, -1, NOW());
	    SELECT CONCAT('La orden no puede ser atendida debido a falta de cobertura.') AS mensaje;
	ELSE
	    -- Existe cobertura en la zona del cliente
	    INSERT INTO orden(dpi, direccion_cliente, restaurante, canal, estado, fecha_inicio)
	    VALUES (p_dpi_cliente, p_id_direccion, v_id_restaurante, p_canal, 1, NOW());
	    SELECT CONCAT('La orden ha sido creada exitosamente.') AS mensaje;
	END IF;
END //

DELIMITER ;

