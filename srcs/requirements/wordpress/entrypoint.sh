#! /bin/bash

wp_config_file="wordpress/wp-config.php"

sed -i "s/\MYSQL_DATABASE/${MYSQL_DATABASE}/g" "$wp_config_file"
sed -i "s/\MYSQL_USER/${MYSQL_USER}/g" "$wp_config_file"
sed -i "s/\MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" "$wp_config_file"

php-fpm8.3 -F
