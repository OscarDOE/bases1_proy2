show databases;
create database restauranteb1;
use restauranteb1;



-- Insertando datos
DROP PROCEDURE insertar_datos();
DROP PROCEDURE RegistrarRestaurante;
DROP PROCEDURE RegistrarPuesto;
DROP PROCEDURE CrearEmpleado;
DROP PROCEDURE RegistrarCliente;
DROP PROCEDURE RegistrarDIreccion;
DROP PROCEDURE CrearOrden;
DROP PROCEDURE MostrarOrdenes;
CALL MostrarOrdenes(1); -- ok
CALL MostrarOrdenes(-1); -- ok
DROP PROCEDURE AgregarItem;
DROP PROCEDURE ConfirmarOrden;
DROP PROCEDURE FinalizarOrden;
DROP PROCEDURE ListarRestaurantes;
DROP PROCEDURE ConsultarEmpleado ;

DROP TABLE tipo_producto;
Drop table producto ;
DROP TABLE estado;
DROP TABLE restaurante;
DROP TABLE puesto;
DROP TABLE empleado;
DROP TABLE cliente;
DROP TABLE direccion;
DROP TABLE orden;
DROP TABLE producto_orden ;
DROP TABLE factura ;
DROP TABLE historial ;

SELECT * FROM tipo_producto;
SELECT * FROM producto;
SELECT * FROM estado;
SELECT * FROM restaurante;
SELECT * FROM puesto;
SELECT * FROM empleado;
SELECT * FROM cliente;
SELECT * FROM direccion;
SELECT * FROM orden;
SELECT * FROM producto_orden;
SELECT * FROM factura;
SELECT * FROM historial;


CALL insertar_datos();


SELECT COUNT(*), id FROM restaurante WHERE municipio = 'Guatemala' AND zona = 7;
select * FROM orden o where estado = -1;

    SELECT SUM(p.precio * po.cantidad) 
    FROM producto_orden po
    JOIN producto p ON p.id = po.producto
    WHERE po.orden = 1;
    SELECT *
    FROM producto_orden po
    JOIN producto p ON p.id = po.producto
    WHERE po.orden = 1;

   
    SELECT estado, direccion_cliente, dpi 
    FROM orden WHERE id = 25;
