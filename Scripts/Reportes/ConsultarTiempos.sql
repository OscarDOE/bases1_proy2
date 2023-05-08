DELIMITER //
CREATE PROCEDURE ConsultarTiempos(
    IN v_minutos INT
)
BEGIN
    SELECT o.id, o.direccion_cliente, o.fecha_inicio, 
           TIMESTAMPDIFF(MINUTE, o.fecha_inicio, o.fecha_fin) AS tiempo_espera, 
           r.nombre AS repartidor
    FROM orden o
    JOIN repartidor r ON o.id_repartidor = r.id
    WHERE TIMESTAMPDIFF(MINUTE, o.fecha_inicio, o.fecha_fin) >= v_minutos;

END //

DELIMITER ;