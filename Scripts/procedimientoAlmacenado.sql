CREATE OR REPLACE PROCEDURE registrar_venta(
    p_cliente_id IN NUMBER,
    p_productos IN SYS.ODCINUMBERLIST,
    p_cantidades IN SYS.ODCINUMBERLIST,
    p_precio_unitario IN SYS.ODCINUMBERLIST,
    p_total_venta IN NUMBER
) 
AS
    v_venta_id NUMBER;
BEGIN
    -- Insertar la venta en la tabla Ventas
    INSERT INTO Ventas (cliente_id, total_venta)
    VALUES (p_cliente_id, p_total_venta)
    RETURNING venta_id INTO v_venta_id;

    -- Insertar los productos en la tabla Pedido
    FOR i IN 1..p_productos.COUNT LOOP
        INSERT INTO Pedido (venta_id, producto_id, cantidad, precio_unitario)
        VALUES (v_venta_id, p_productos(i), p_cantidades(i), p_precio_unitario(i));
        
        -- Actualizar el stock del producto
        UPDATE Producto
        SET stock = stock - p_cantidades(i)
        WHERE producto_id = p_productos(i);
    END LOOP;
END;
