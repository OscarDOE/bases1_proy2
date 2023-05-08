DELIMITER //

CREATE PROCEDURE ConsultarFacturas(
    IN v_dia INT,
    IN v_mes INT,
    IN v_anio INT
)
BEGIN
	DECLARE v_ultimo_dia INT;
    SET v_ultimo_dia = DAY(LAST_DAY(CONCAT(v_anio,'-',v_mes,'-01')));

    IF v_dia > v_ultimo_dia THEN
        SELECT 'Error: El día ingresado no es válido para el mes especificado.';
    ELSE
	
	    SELECT f.serie, f.total, f.municipio , f.fecha , f.orden , f.nit ,
	           CASE WHEN f.pago  = 'E' THEN 'Efectivo' ELSE 'Tarjeta' END AS FormaPago
	    FROM factura f
	    WHERE DAY(f.fecha) = v_dia AND MONTH(f.fecha) = v_mes AND YEAR(f.fecha) = v_anio;
    END IF;
END //

DELIMITER ;