CREATE INDEX idx_ventas_cliente ON Ventas(cliente_id) TABLESPACE user_index_tbs;

CREATE INDEX idx_pedido_producto ON Pedido(producto_id) TABLESPACE user_index_tbs;