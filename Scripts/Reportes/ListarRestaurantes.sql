DELIMITER //

CREATE PROCEDURE ListarRestaurantes()
BEGIN
	SELECT r.id,  r.direccion , r.municipio , r.zona , r.telefono , r.personal ,
       IF(r.parqueo, 'Sí', 'No') AS tiene_parqueo
	FROM restaurante r;

END //

DELIMITER ;

