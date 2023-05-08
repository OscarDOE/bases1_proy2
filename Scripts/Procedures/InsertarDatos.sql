DELIMITER //

CREATE PROCEDURE insertar_datos()

BEGIN
    -- Insertar tipos de producto
    INSERT INTO tipo_producto(id, descripcion) VALUES('C', 'Combo');
    INSERT INTO tipo_producto(id, descripcion) VALUES('E', 'Extra');
    INSERT INTO tipo_producto(id, descripcion) VALUES('B', 'Bebida');
    INSERT INTO tipo_producto(id, descripcion) VALUES('P', 'Postre');
    
    -- Insertar productos
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C1', 'Cheeseburger', 41.00, 'C');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C2', 'Chicken Sandwich', 32.00, 'C');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C3', 'BBQ Ribs', 54.00, 'C');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C4', 'Pasta Alfredo', 47.00, 'C');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C5', 'Pizza Espinator', 85.00, 'C');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('C6', 'Buffalo Wings', 36.00, 'C');
    
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('E1', 'Papas fritas', 15.00, 'E');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('E2', 'Aros de cebolla', 17.00, 'E');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('E3', 'Coleslaw', 12.00, 'E');
    
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('B1', 'Coca-Cola', 12.00, 'B');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('B2', 'Fanta', 12.00, 'B');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('B3', 'Sprite', 12.00, 'B');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('B4', 'Té frío', 12.00, 'B');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('B5', 'Cerveza de barril', 18.00, 'B');
    
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('P1', 'Copa de helado', 13.00, 'P');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('P2', 'Cheesecake', 15.00, 'P');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('P3', 'Cupcake de chocolate', 8.00, 'P');
    INSERT INTO producto(id, descripcion, precio, tipo) VALUES('P4', 'Flan', 10.00, 'P');
    
   INSERT INTO estado (descripcion) VALUES ('INICIADA'), ('AGREGANDO'), ('EN CAMINO'), ('ENTREGADA'), ('SIN COBERTURA');

 END //

DELIMITER ;