DELIMITER //

CREATE PROCEDURE RegistrarCliente(
    IN p_numero_dpi BIGINT UNSIGNED,
    IN p_nombres VARCHAR(50),
    IN p_apellidos VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_correo VARCHAR(50),
    IN p_telefono BIGINT UNSIGNED,
    IN p_nit BIGINT UNSIGNED
)
BEGIN
    IF EXISTS (SELECT * FROM cliente WHERE dpi = p_numero_dpi) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Ya existe un cliente con ese número de DPI.';
    ELSEIF NOT (p_correo REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+[.][a-zA-Z]{2,}$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El correo no es válido.';
    ELSEIF NOT (p_nombres REGEXP '^[a-zA-ZáéíóúñÑÁÉÍÓÚ ]+$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El nombre debe contener solo letras del abecedario';    
    ELSEIF NOT (p_apellidos REGEXP '^[a-zA-ZáéíóúñÑÁÉÍÓÚ ]+$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El apellido debe contener solo letras del abecedario';    
    ELSE
        INSERT INTO cliente(dpi, nombres, apellidos, fecha_nacimiento, correo, telefono, nit)
        VALUES (p_numero_dpi, p_nombres, p_apellidos, p_fecha_nacimiento, p_correo, p_telefono, p_nit);
        SELECT CONCAT('El cliente ha sido registrado exitosamente. Su número de DPI es ', p_numero_dpi, '.') AS mensaje;
    END IF;
END //

DELIMITER ;