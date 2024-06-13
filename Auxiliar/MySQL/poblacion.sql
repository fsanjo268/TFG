-- Crear base de datos
CREATE DATABASE intranet;

-- Usar la base de datos
USE intranet;

-- Usar la base de datos intranet
USE intranet;

-- Crear tabla departamentos
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20)
);


-- Crear tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    departamento_id INT,
    nombre_usuario VARCHAR(50) NOT NULL, -- Nueva columna para el nombre de usuario
    contrasena VARCHAR(32) NOT NULL, -- Nueva columna para la contraseña (hash)
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Crear tabla politicas
CREATE TABLE politicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_vigencia DATE NOT NULL,
    estado ENUM('Activa', 'Inactiva') NOT NULL,
);

-- Crear tabla eventos
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL,
    descripcion TEXT NOT NULL
);

-- Insertar datos en la tabla departamentos
INSERT INTO departamentos (nombre, correo, telefono) VALUES
('IT', 'it@securelyinsecure.com', '+34 123 456 789'),
('Ciberseguridad', 'ciberseguridad@securelyinsecure.com', '+34 987 654 321'),
('Recursos Humanos', 'rrhh@securelyinsecure.com', '+34 555 123 456');

-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (nombre, cargo, contacto, departamento_id, nombre_usuario, contrasena) VALUES
('Javier Gómez', 'Gerente de Infraestructura de IT', 'mgomez@securelyinsecure.com', 1, 'mgomez', MD5('password')),
('Carlos López', 'Administrador de Redes', 'clopez@securelyinsecure.com', 1, 'clopez', MD5('password')),
('Maria Santos', 'Administradora de Base de Datos', 'msantos@securelyinsecure.com', 1, 'msantos', MD5('password')),
('Ana Ruiz', 'Directora de Tecnología', 'aruiz@securelyinsecure.com', 1, 'aruiz', MD5('password')),
('Sebastián Martín', 'Becario RR.HH', 'smartin@securelyinsecure.com', 3, 'smartin', MD5('password')),
('Laura Manrique', 'Gerente de Recursos Humanos', 'lmanrique@securelyinsecure.com', 3, 'lmanrique', MD5('password')),
('Mario Osorio', 'Director de Seguridad de la Información', 'mosorio@securelyinsecure.com', 2, 'mosorio', MD5('password')),
('Sara Rosas', 'Analista de Vulnerabilidades', 'srosas@securelyinsecure.com', 2, 'srosas', MD5('password')),
('Francisco Cañedas', 'Auditor de Seguridad', 'fcanedas@securelyinsecure.com', 2, 'fcanedas', MD5('password')),
('Paula Samaniego', 'Especialista en Respuesta a Incidentes', 'psamaniego@securelyinsecure.com', 2, 'psamaniego', MD5('password'));


-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, correo, telefono, direccion) VALUES
('Cliente A', 'cliente.a@example.com', '555-0001', 'Dirección Cliente A'),
('Cliente B', 'cliente.b@example.com', '555-0002', 'Dirección Cliente B'),
('Cliente C', 'cliente.c@example.com', '555-0003', 'Dirección Cliente C');

-- Insertar datos en la tabla politicas
INSERT INTO politicas (codigo, nombre, descripcion, fecha_vigencia, estado, responsable) VALUES
('SEC001', 'Política de Seguridad', 'Descripción de la política de seguridad.', '2024-01-01', 'Activa'),
('PRI001', 'Política de Privacidad', 'Descripción de la política de privacidad.', '2024-01-01', 'Activa'),
('RET001', 'Política de Retención de Datos', 'Descripción de la política de retención de datos.', '2023-06-01', 'Inactiva'),
('USO001', 'Política de Uso Aceptable', 'Descripción de la política de uso aceptable.', '2024-01-01', 'Activa');

-- Insertar datos en la tabla eventos
INSERT INTO eventos (nombre, fecha, descripcion) VALUES
('Evento de Lanzamiento', '2024-07-01 10:00:00', 'Descripción del evento de lanzamiento.'),
('Conferencia Anual', '2024-09-15 09:00:00', 'Descripción de la conferencia anual.');
