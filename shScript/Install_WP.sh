#!/bin/bash

# Variables
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASS="wp_pass_123"
WP_DIR="/var/www/html/wordpress"
WP_URL="https://wordpress.org/latest.zip"

# Descarga WordPress
echo "⬇️ Descargando WordPress..."
wget $WP_URL -P /var/www/html
chmod 777 /var/www/html/latest.zip
unzip /var/www/html/latest.zip -d /var/www/html/
rm -rf /var/www/html/latest.*

sudo chown -R www-data:www-data $WP_DIR
chown www-data $WP_DIR




