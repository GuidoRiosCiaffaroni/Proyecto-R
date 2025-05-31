#!/bin/bash

WP_DIR="/var/www/html/wordpress"
HTACCESS_FILE="$WP_DIR/.htaccess"

echo "📁 Verificando directorio de WordPress en: $WP_DIR"
if [ ! -d "$WP_DIR" ]; then
  echo "❌ No se encontró el directorio $WP_DIR"
  exit 1
fi

echo "📝 Creando archivo .htaccess..."
sudo tee "$HTACCESS_FILE" > /dev/null <<'EOF'
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
EOF

echo "🔒 Estableciendo permisos..."
sudo chown www-data:www-data "$HTACCESS_FILE"
sudo chmod 644 "$HTACCESS_FILE"

echo "🔁 Habilitando mod_rewrite..."
sudo a2enmod rewrite

echo "🛠 Habilitando AllowOverride All en apache2.conf..."
sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

echo "🔄 Reiniciando Apache..."
sudo service apache2 restart

echo "✅ Listo. .htaccess creado, mod_rewrite habilitado y Apache reiniciado."
