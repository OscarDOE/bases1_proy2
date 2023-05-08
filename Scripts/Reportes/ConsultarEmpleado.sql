DELIMITER //

CREATE PROCEDURE ConsultarEmpleado(
	IN p_IdEmpleado INT
)
BEGIN
	DECLARE v_IdEmpleado CHAR(8);
	DECLARE v_NombreCompleto VARCHAR(100);
	DECLARE v_FechaNacimiento DATE;
	DECLARE v_Correo VARCHAR(50);
	DECLARE v_Telefono VARCHAR(20);
	DECLARE v_Direccion VARCHAR(100);
	DECLARE v_NumeroDPI VARCHAR(20);
	DECLARE v_NombrePuesto VARCHAR(50);
	DECLARE v_FechaInicio DATE;
	DECLARE v_Salario DECIMAL(10,2);
	
	-- Verificar que el empleado exista
	SELECT e.id, CONCAT(nombres, ' ', apellidos), fecha_nacimiento, correo, telefono, direccion, dpi, puesto, fecha_inicio, salario 
	INTO v_IdEmpleado, v_NombreCompleto, v_FechaNacimiento, v_Correo, v_Telefono, v_Direccion, v_NumeroDPI, v_NombrePuesto, v_FechaInicio, v_Salario 
	FROM empleado e
	INNER JOIN puesto ON e.puesto = puesto.id 
	WHERE e.id = p_IdEmpleado;
	
	IF v_IdEmpleado IS NULL THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El empleado especificado no existe.';
	END IF;
	
	-- Ajustar el id del empleado a 8 dígitos
	SET v_IdEmpleado = LPAD(v_IdEmpleado, 8, '0');
	
	-- Mostrar el resultado
	SELECT v_IdEmpleado, v_NombreCompleto, v_FechaNacimiento, v_Correo, v_Telefono, v_Direccion, v_NumeroDPI, v_NombrePuesto, v_FechaInicio, v_Salario;

END //

DELIMITER ;
