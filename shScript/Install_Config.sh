#!/bin/bash

sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.4/apache2/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.4/apache2/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.4/apache2/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.4/apache2/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.4/apache2/php.ini

sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.4/cli/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.4/cli/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.4/cli/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.4/cli/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.4/cli/php.ini

sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.4/fpm/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.4/fpm/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.4/fpm/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.4/fpm/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.4/fpm/php.ini

service apache2 restart

sudo sed -i 's/^\(\s*\)AllowOverride None/\1AllowOverride All/' /etc/apache2/apache2.conf




echo "🛠 Modificando archivo ports.conf..."
sudo sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf

# Si Listen 80 no existe, agrega Listen 8080 al final
grep -q '^Listen 8080' /etc/apache2/ports.conf || echo "Listen 8080" | sudo tee -a /etc/apache2/ports.conf

echo "🛠 Modificando archivo 000-default.conf..."
sudo sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8080>/' /etc/apache2/sites-available/000-default.conf

echo "🔄 Reiniciando Apache..."
sudo service apache2 restart 

echo "✅ Apache ahora escucha en el puerto 8080"




service apache2 restart

chown www-data:www-data * -R /var/www/html/wordpress/
chmod 775 * /var/www/
chown -R www-data /var/www/
sudo a2enmod rewrite

ls -l /var/www/html/wordpress/wp-includes/css

sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress


sudo a2enmod rewrite && \
sudo sed -i '/<Directory \/var\/www\/html>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf && \
sudo chown -R www-data:www-data /var/www/html/wordpress && \
sudo chmod -R 755 /var/www/html/wordpress && \
sudo service apache2 restart