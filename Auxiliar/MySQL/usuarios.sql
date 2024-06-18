-- Crear usuario admin y otorgar permisos sobre la base de datos 'intranet'
CREATE USER 'msantos'@'%' IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON intranet.* TO 'msantos'@'%';
FLUSH PRIVILEGES;