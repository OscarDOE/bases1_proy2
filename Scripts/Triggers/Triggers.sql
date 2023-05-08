DELIMITER //

CREATE TRIGGER tr_insert_Cliente AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Cliente', 'INSERT');
END //

CREATE TRIGGER tr_update_Cliente AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Cliente', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Cliente AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Cliente', 'DELETE');
END //

CREATE TRIGGER tr_insert_Tipo_Producto AFTER INSERT ON tipo_producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Tipo Producto', 'INSERT');
END //

CREATE TRIGGER tr_update_Tipo_Producto AFTER UPDATE ON tipo_producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Tipo Producto', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Tipo_Producto AFTER DELETE ON tipo_producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Tipo Producto', 'DELETE');
END //

CREATE TRIGGER tr_insert_Estado AFTER INSERT ON estado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Estado', 'INSERT');
END //

CREATE TRIGGER tr_update_Estado AFTER UPDATE ON estado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Estado', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Estado AFTER DELETE ON estado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Estado', 'DELETE');
END //

CREATE TRIGGER tr_insert_Puesto AFTER INSERT ON puesto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Puesto', 'INSERT');
END //

CREATE TRIGGER tr_update_Puesto AFTER UPDATE ON puesto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Puesto', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Puesto AFTER DELETE ON puesto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Puesto', 'DELETE');
END //

CREATE TRIGGER tr_insert_Restaurante AFTER INSERT ON restaurante
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Restaurante', 'INSERT');
END //

CREATE TRIGGER tr_update_Restaurante AFTER UPDATE ON restaurante
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Restaurante', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Restaurante AFTER DELETE ON restaurante
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Restaurante', 'DELETE');
END //

CREATE TRIGGER tr_insert_Direccion AFTER INSERT ON direccion
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Direccion', 'INSERT');
END //

CREATE TRIGGER tr_update_Direccion AFTER UPDATE ON direccion
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Direccion', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Direccion AFTER DELETE ON direccion
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Direccion', 'DELETE');
END //

CREATE TRIGGER tr_insert_Producto AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Producto', 'INSERT');
END //

CREATE TRIGGER tr_update_Producto AFTER UPDATE ON producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Producto', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Producto AFTER DELETE ON producto
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Producto', 'DELETE');
END //

CREATE TRIGGER tr_insert_Empleado AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Empleado', 'INSERT');
END //

CREATE TRIGGER tr_update_Empleado AFTER UPDATE ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Empleado', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Empleado AFTER DELETE ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Empleado', 'DELETE');
END //

CREATE TRIGGER tr_insert_Orden AFTER INSERT ON orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Orden', 'INSERT');
END //

CREATE TRIGGER tr_update_Orden AFTER UPDATE ON orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Orden', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Orden AFTER DELETE ON orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Orden', 'DELETE');
END //

CREATE TRIGGER tr_insert_ProductoOrden AFTER INSERT ON producto_orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla ProductoOrden', 'INSERT');
END //

CREATE TRIGGER tr_update_ProductoOrden AFTER UPDATE ON producto_orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla ProductoOrden', 'UPDATE');
END //

CREATE TRIGGER tr_delete_ProductoOrden AFTER DELETE ON producto_orden
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla ProductoOrden', 'DELETE');
END //

CREATE TRIGGER tr_insert_Factura AFTER INSERT ON factura
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha insertado una fila en la tabla Factura', 'INSERT');
END //

CREATE TRIGGER tr_update_Factura AFTER UPDATE ON factura
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha actualizado una fila en la tabla Factura', 'UPDATE');
END //

CREATE TRIGGER tr_delete_Factura AFTER DELETE ON factura
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha, descripcion, tipo)
    VALUES (NOW(), 'Se ha eliminado una fila en la tabla Factura', 'DELETE');
END //


 
DELIMITER ;