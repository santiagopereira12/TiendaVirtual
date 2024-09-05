CREATE OR REPLACE TRIGGER verificar_stock
BEFORE INSERT OR UPDATE ON Pedido
FOR EACH ROW
DECLARE
    v_stock NUMBER;
BEGIN
    SELECT stock INTO v_stock
    FROM Producto
    WHERE producto_id = :NEW.producto_id;

    IF v_stock < :NEW.cantidad THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para el producto.');
    END IF;
END;
