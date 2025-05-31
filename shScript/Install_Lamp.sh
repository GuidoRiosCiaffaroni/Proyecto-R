## 
sudo apt update -y 
sudo apt upgrade -y

sudo apt install nano -y

##Instalar Apache
sudo apt install apache2 -y

##Instalar MySQL
#sudo apt install mysql-server -y
#sudo apt install php-mysql -y

sudo apt  install mariadb-server -y
sudo apt  install mariadb-client -y

## Instalar PHP
sudo apt install php -y 
sudo apt install libapache2-mod-php -y 
sudo apt install php-mysql -y

## Instalar paquetes adicionales
sudo apt install php-cli -y
sudo apt install php-curl -y
sudo apt install php-gd -y
sudo apt install php-mbstring -y 
sudo apt install php-xml -y
sudo apt install php-zip -y
sudo apt install php-xmlrpc -y 
sudo apt install php-soap -y
sudo apt install php-intl -y
sudo apt install php-json -y

sudo apt install software-properties-common -y
sudo apt install php-gettext -y
sudo apt install php-fpm -y
sudo apt install php-common -y
sudo apt install php-opcache -y
sudo apt install php-tokenizer -y
sudo apt install php-bcmath -y
sudo apt install php-gettext -y
sudo apt install gnupg2 -y


sudo apt install gnupg2 -y
sudo apt install ca-certificates -y
sudo apt install lsb-release -y
sudo apt install apt-transport-https -y



sudo apt install unzip -y
sudo apt install wget -y

sudo apt install tmux -y
sudo apt install nano -y

sudo a2enmod php*
sudo a2enmod rewrite

sudo apt autoremove 


service apache2 restart 
service mysql restart


sudo apt update
sudo apt upgrade -y
sudo apt install -y software-properties-common apt-transport-https lsb-release ca-certificates
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.3
sudo apt install -y php8.3-cli php8.3-common php8.3-mbstring php8.3-xml php8.3-mysql php8.3-curl php8.3-zip

service apache2 restart 
service mysql restart