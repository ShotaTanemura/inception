#! /bin/bash

set -ex;

wp_config_file="wordpress/wp-config.php"

sed -i "s/\MYSQL_DATABASE/${MYSQL_DATABASE}/g" "$wp_config_file"
sed -i "s/\MYSQL_USER/${MYSQL_USER}/g" "$wp_config_file"
sed -i "s/\MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" "$wp_config_file"

cd /var/www/html/wordpress 
wp core install --url=localhost --title=Example --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=info@example.com --allow-root

php-fpm8.3 -F
