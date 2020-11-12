#!/bin/bash

echo Script para instalar Nextcloud

echo Creado por Aleck Richard Parker para la comunidad

sleep 2s

echo Actualiza el sistema e instala apache2 y php
apt update && apt upgrade -y
apt install apache2 libapache2-mod-php -y
apt install php php-gd php-curl php-zip php-xml php-mbstring -y

echo Instala MariaDB
apt install mariadb-server mariadb-client php-mysql -y
mariadb -e 'CREATE DATABASE nextclouddb; GRANT ALL ON nextclouddb.* TO "nextcloud_user"@"localhost" IDENTIFIED BY "nextcloudpass123";FLUSH PRIVILEGES;'
cd /var/www/html/
wget https://download.nextcloud.com/server/installer/setup-nextcloud.php
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html
systemctl restart apache2
systemctl restart mariadb

echo "Ir al navegador e ingresar http://direccion-ip/setup-nextcloud.php
Usuario: nextcloud_user
Pass: nextcloudpass123
Base de datos: nextclouddb
Servidor: localhost
Puerto: 3307
Ingresar servidor:puerto en la configuracion de nextcloud, ej: localhost:3307"
