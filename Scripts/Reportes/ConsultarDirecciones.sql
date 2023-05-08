DELIMITER //

CREATE PROCEDURE ConsultarDirecciones(
	IN p_DPICliente BIGINT
)
BEGIN
	-- Verificar que el cliente exista
	IF NOT EXISTS(SELECT * FROM cliente WHERE dpi = p_DPICliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente especificado no existe.';
	END IF;

	-- Obtener las direcciones del cliente
	SELECT direccion, municipio, zona
	FROM direccion
	WHERE dpi = p_DPICliente;

END //

DELIMITER ;
