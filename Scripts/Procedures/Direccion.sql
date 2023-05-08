DELIMITER //

CREATE PROCEDURE RegistrarDireccion(
    IN p_dpi_cliente BIGINT UNSIGNED,
    IN p_direccion VARCHAR(100),
    IN p_municipio VARCHAR(50),
    IN p_zona INT UNSIGNED
)
BEGIN
    DECLARE v_cliente_existe TINYINT;
    SELECT COUNT(*) INTO v_cliente_existe FROM cliente WHERE dpi = p_dpi_cliente;

    IF v_cliente_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente no existe.';
    ELSEIF NOT (p_municipio REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El municipio debe contener solo letras del abecedario.';
    ELSEIF p_zona < 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La zona debe ser un entero positivo.';
    ELSE
        INSERT INTO direccion(dpi, direccion, municipio, zona)
        VALUES (p_dpi_cliente, p_direccion, p_municipio, p_zona);
        SELECT CONCAT('La dirección ha sido registrada exitosamente para el cliente con DPI ', p_dpi_cliente, '.') AS mensaje;
    END IF;
END //

DELIMITER ;