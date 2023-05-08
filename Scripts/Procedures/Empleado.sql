DELIMITER //

CREATE PROCEDURE CrearEmpleado(
    IN p_nombres VARCHAR(50),
    IN p_apellidos VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_correo VARCHAR(50),
    IN p_telefono BIGINT UNSIGNED,
    IN p_direccion VARCHAR(100),
    IN p_numero_dpi BIGINT UNSIGNED,
    IN p_puesto_id INT UNSIGNED,
    IN p_fecha_inicio DATE,
    IN p_id_restaurante VARCHAR(20)
)
BEGIN
    DECLARE v_puesto_salario DECIMAL(8,2);
    DECLARE v_empleado_id VARCHAR(8);
    DECLARE v_restaurante_id VARCHAR(20);
    DECLARE cantidad_empleados INT;
    DECLARE personal_maximo INT UNSIGNED;

    SET v_restaurante_id = (SELECT id FROM restaurante WHERE id = p_id_restaurante);

    SELECT COUNT(*) INTO cantidad_empleados FROM empleado WHERE restaurante = p_id_restaurante;

    SELECT personal INTO personal_maximo FROM restaurante WHERE id = p_id_restaurante;

    
    IF v_restaurante_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El id del restaurante no existe.';
    ELSEIF NOT (p_correo REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+[.][a-zA-Z]{2,}$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El correo no es válido.';
    ELSEIF NOT (p_nombres REGEXP '^[a-zA-ZáéíóúñÑÁÉÍÓÚ ]+$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El nombre debe contener solo letras del abecedario';    
    ELSEIF NOT (p_apellidos REGEXP '^[a-zA-ZáéíóúñÑÁÉÍÓÚ ]+$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El apellido debe contener solo letras del abecedario';  
    ELSEIF cantidad_empleados >= personal_maximo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El restaurante ha alcanzado su límite de personal.';
    ELSE
        SELECT salario INTO v_puesto_salario FROM puesto WHERE id = p_puesto_id;
        IF v_puesto_salario IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El id del puesto no existe.';
        ELSE
            SET v_empleado_id = LPAD((SELECT COUNT(*)+1 FROM empleado), 8, '0');
            INSERT INTO empleado(id, nombres, apellidos, fecha_nacimiento, correo, telefono, direccion, dpi, puesto,fecha_inicio, restaurante)
            VALUES (v_empleado_id, p_nombres, p_apellidos, p_fecha_nacimiento, p_correo, p_telefono, p_direccion, p_numero_dpi, p_puesto_id, p_fecha_inicio, p_id_restaurante);
            SELECT CONCAT('El empleado ha sido creado exitosamente. Su número de identificación es ', v_empleado_id, '.') AS mensaje;
        END IF;
    END IF;
END //

DELIMITER ;