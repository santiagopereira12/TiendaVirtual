CREATE TABLESPACE user_data_tbs
DATAFILE '/path/user_data.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M;

CREATE TABLESPACE user_index_tbs
DATAFILE '/path/user_index.dbf' SIZE 50M AUTOEXTEND ON NEXT 5M;

CREATE TABLESPACE logs_tbs
DATAFILE '/path/logs.dbf' SIZE 30M AUTOEXTEND ON NEXT 5M;

CREATE TABLE Categoria (
    categoria_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255)
) TABLESPACE user_data_tbs;

CREATE TABLE Cliente (
    cliente_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    correo VARCHAR2(100) UNIQUE,
    telefono VARCHAR2(15),
    direccion VARCHAR2(255)
) TABLESPACE user_data_tbs;

CREATE TABLE Producto (
    producto_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    precio NUMBER(10, 2) NOT NULL,
    stock NUMBER DEFAULT 0,
    categoria_id NUMBER,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
) TABLESPACE user_data_tbs;

CREATE TABLE Ventas (
    venta_id NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    fecha_venta DATE DEFAULT SYSDATE,
    total_venta NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
) TABLESPACE user_data_tbs;

CREATE TABLE Pedido (
    pedido_id NUMBER PRIMARY KEY,
    venta_id NUMBER,
    producto_id NUMBER,
    cantidad NUMBER DEFAULT 1,
    precio_unitario NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_venta FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
) TABLESPACE user_data_tbs;