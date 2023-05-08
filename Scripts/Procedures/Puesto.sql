DELIMITER //

CREATE PROCEDURE RegistrarPuesto(
    IN p_nombre VARCHAR(30),
    IN p_descripcion VARCHAR(100),
    IN p_salario DECIMAL(8,2)
)
BEGIN
    DECLARE v_count INT;
    SELECT COUNT(*) INTO v_count FROM puesto WHERE nombre = p_nombre;
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El nombre del puesto ya existe.';
    ELSEIF p_salario <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El valor del parámetro "p_salario" debe ser mayor a cero.';
    ELSE
        INSERT INTO puesto(nombre, descripcion, salario)
        VALUES (p_nombre, p_descripcion, p_salario);
    END IF;
END //

DELIMITER ;