-- Crear usuario admin y otorgar permisos sobre la base de datos 'intranet'
DROP USER IF EXISTS 'msantos'@'%';
CREATE USER 'msantos'@'%' IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON intranet.* TO 'msantos'@'%';
FLUSH PRIVILEGES;
