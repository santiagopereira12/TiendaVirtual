CREATE VIEW productos_mas_vendidos AS
SELECT p.nombre, SUM(pe.cantidad) AS total_vendido
FROM Producto p
JOIN Pedido pe ON p.producto_id = pe.producto_id
GROUP BY p.nombre
ORDER BY total_vendido DESC;


CREATE VIEW ventas_por_cliente AS
SELECT c.nombre, SUM(v.total_venta) AS total_comprado
FROM Cliente c
JOIN Ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.nombre;