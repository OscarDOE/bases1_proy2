DELIMITER //
CREATE PROCEDURE RegistrarRestaurante (
    IN p_id VARCHAR(20),
    IN p_direccion VARCHAR(40),
    IN p_municipio VARCHAR(30),
    IN p_zona INT,
    IN p_telefono BIGINT UNSIGNED,
    IN p_personal_maximo float UNSIGNED,
    IN p_tiene_parqueo BOOLEAN
)
BEGIN
	DECLARE personal_entero INT UNSIGNED;
    SET personal_entero = ROUND(p_personal_maximo);

    IF p_zona <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El valor del parámetro "p_zona" debe ser mayor a cero.';
    ELSEIF personal_entero = p_personal_maximo THEN
    	SELECT 'Los valores de entrada son: ',
               p_id,
               p_direccion,
               p_municipio,
               p_zona,
               p_telefono,
               personal_entero,
               p_personal_maximo,
               p_tiene_parqueo;
        INSERT INTO restaurante(id, direccion, municipio, zona, telefono, personal, parqueo)
        VALUES (p_id, p_direccion, p_municipio, p_zona, p_telefono, p_personal_maximo, p_tiene_parqueo);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El valor del parámetro "p_personal_maximo" debe ser un número entero.';
    END IF;
END //

DELIMITER ;