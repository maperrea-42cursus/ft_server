CREATE DATABASE wordpress;
CREATE USER 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp'@'localhost';
FLUSH PRIVILEGES;
