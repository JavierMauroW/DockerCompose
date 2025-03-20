-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla de Categorías de Productos
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria) ON DELETE SET NULL
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE SET NULL
);

-- Tabla de Detalle de Ventas
CREATE TABLE DetalleVentas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE
);

-- Insertar datos en Clientes
INSERT INTO Clientes (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan@gmail.com', '1234567890', 'Calle 123, Ciudad'),
('María López', 'maria@gmail.com', '0987654321', 'Avenida 456, Ciudad'),
('Carlos Rodríguez', 'carlos@gmail.com', '1122334455', 'Calle 789, Ciudad');

-- Insertar datos en Categorías
INSERT INTO Categorias (nombre) VALUES 
('Electrónica'),
('Ropa'),
('Alimentos');

-- Insertar datos en Productos
INSERT INTO Productos (nombre, precio, stock, id_categoria) VALUES
('Laptop', 1500.00, 10, 1),
('Teléfono', 800.00, 20, 1),
('Camiseta', 20.00, 50, 2),
('Jeans', 40.00, 30, 2),
('Chocolate', 5.00, 100, 3);

-- Insertar datos en Ventas
INSERT INTO Ventas (id_cliente, total) VALUES
(1, 1520.00),
(2, 40.00),
(3, 810.00);

-- Insertar datos en Detalle de Ventas
INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, subtotal) VALUES
(1, 1, 1, 1500.00),
(1, 3, 1, 20.00),
(2, 4, 1, 40.00),
(3, 2, 1, 800.00),
(3, 5, 2, 10.00);

