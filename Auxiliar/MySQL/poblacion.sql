-- Usar la base de datos intranet
USE intranet;
-- DROP TABLES
DROP TABLE IF EXISTS usuarios ;
DROP TABLE IF EXISTS departamentos ;
DROP TABLE IF EXISTS clientes ;
DROP TABLE IF EXISTS politicas ;
DROP TABLE IF EXISTS eventos ;

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
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(32) NOT NULL,
    sudo ENUM('Si', 'No') NOT NULL
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
    fecha_vigencia DATE NOT NULL,
    estado ENUM('Activa', 'Inactiva') NOT NULL
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
INSERT INTO usuarios (nombre, cargo, contacto, departamento_id, nombre_usuario, contrasena, sudo) VALUES
('Javier Gomez', 'Gerente de Infraestructura de IT', 'jgomez@securelyinsecure.com', 1, 'mgomez', MD5('password1'), 'Si'),
('Carlos Lopez', 'Administrador de Redes', 'clopez@securelyinsecure.com', 1, 'clopez', MD5('Tr$8jKl9'), 'No'),
('Maria Santos', 'Administradora de Base de Datos', 'msantos@securelyinsecure.com', 1, 'msantos', MD5('Qw3#tYu1'), 'No'),
('Ana Ruiz', 'Directora de Tecnologia', 'aruiz@securelyinsecure.com', 1, 'aruiz', MD5('password'), 'No'),
('Sebastian Martin', 'Becario RR.HH', 'smartin@securelyinsecure.com', 3, 'smartin', MD5('Zn3!LmN7'), 'No'),
('Laura Manrique', 'Gerente de Recursos Humanos', 'lmanrique@securelyinsecure.com', 3, 'lmanrique', MD5('Pw8$gHk3'), 'No'),
('Mario Osorio', 'Director de Seguridad de la Informacion', 'mosorio@securelyinsecure.com', 2, 'mosorio', MD5('Nv5#Ju9K'), 'No'),
('Sara Rosas', 'Analista de Vulnerabilidades', 'srosas@securelyinsecure.com', 2, 'srosas', MD5('Wx7*Ku8J'), 'No'),
('Francisco Ramos', 'Auditor de Seguridad', 'framos@securelyinsecure.com', 2, 'framos', MD5('Tf4&Vr6Z'), 'No'),
('Paula Samaniego', 'Especialista en Respuesta a Incidentes', 'psamaniego@securelyinsecure.com', 2, 'psamaniego', MD5('Yt9%Lp5B'), 'No');



-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, correo, telefono, direccion) VALUES
('Pedro Fernandez', 'pedro.fernandez@gmail.com', '555-1234', 'Calle Mayor 10, Madrid'),
('Lucia Gonzalez', 'lucia.gonzalez@gmail.com', '555-5678', 'Avenida de la Constitucion 20, Sevilla'),
('Juan Martinez', 'juan.martinez@gmail.com', '555-9101', 'Calle Gran Via 30, Barcelona');

-- Insertar datos en la tabla politicas
INSERT INTO politicas (codigo, nombre, fecha_vigencia, estado) VALUES
('SEC001', 'Politica de Seguridad', '2024-01-01', 'Activa'),
('PRI001', 'Politica de Privacidad', '2024-01-01', 'Activa'),
('RET001', 'Politica de Retencion de Datos', '2023-06-01', 'Inactiva'),
('USO001', 'Politica de Uso Aceptable', '2024-01-01', 'Activa');

-- Insertar datos en la tabla eventos
INSERT INTO eventos (nombre, fecha, descripcion) VALUES
('Evento de Lanzamiento', '2024-07-01 10:00:00', 'Lanzamiento del nuevo prodcuto.'),
('Conferencia Anual', '2024-09-15 09:00:00', 'Feria de promocion.');